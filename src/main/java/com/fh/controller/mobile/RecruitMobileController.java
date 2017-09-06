package com.fh.controller.mobile;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.entity.recruit.RecruitInfo;
import com.fh.entity.system.Role;
import com.fh.entity.system.User;
import com.fh.param.RecruitInfoParam;
import com.fh.param.RecruitSearchParam;
import com.fh.service.hotposition.hotposition.impl.HotpositionService;
import com.fh.service.recruit.recruit.RecruitManager;
import com.fh.service.recruitInfo.recruitinfo.RecruitInfoManager;
import com.fh.service.system.role.RoleManager;
import com.fh.util.*;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：招聘
 * 创建人：lugr
 * 创建时间：2017-03-09
 */
@Controller
@RequestMapping(value="/recruit_mobile")
public class RecruitMobileController extends BaseController {
	
	String menuUrl = "recruit/list.do"; //菜单地址(权限用)
	@Resource(name="recruitService")
	private RecruitManager recruitService;
	
	@Autowired
	private RoleManager roleManager;
	
	@Autowired
	private RecruitInfoManager recruitInfoManager;

	@Autowired
	private HotpositionService hotpositionService;

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page,RecruitSearchParam param) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"列表Recruit");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String recruitPhone = pd.getString("recruitPhone");				//关键词检索条件
		if(null != recruitPhone && !"".equals(recruitPhone)){
			pd.put("recruitPhone", recruitPhone.trim());
		}
		//为了更好在手机端搜索的时候使用
		//pd.put("mobileCondition",param.get);
		page.setPd(pd);
		page.setShowCount(10);
		List<PageData>	varList = recruitService.list(page);	//列出Recruit列表
		List<PageData> temps = new ArrayList<PageData>();
		if(varList != null && varList.size() > 0){
			for(PageData pageData : varList){
				String recruitId = (String)pageData.get("RECRUIT_ID");
				pd.put("RECRUIT_ID", recruitId);
				String position = (String)pd.get("recruitPosition");
				List<PageData> pageDatas = recruitInfoManager.findByRecruitId(pd);
				if((pageDatas != null && pageDatas.size() > 0) || (position == null || "".equals(position))){
					/*StringBuffer recruitStr = new StringBuffer();
					for(PageData pData : pageDatas){
						recruitStr.append(pData.get("RECRUIT_POSITION")+"/"+pData.get("RECRUIT_CNT")+"/"+pData.get("POSITION_REQUIRE")+"<br/>");
					}*/
					pageData.put("recInfo", pageDatas);
				}else{
					temps.add(pageData);
				}
			}
		}
		varList.removeAll(temps);
		mv.setViewName("mobile/recruit");

		//获取热门职位
		List<PageData> hotData =  hotpositionService.listAll(null);
		mv.addObject("hotData",hotData);

		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		//mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		System.out.println("flag:"+pd.getString("flag"));
		mv.addObject("flag",pd.getString("flag"));
		mv.addObject("recruit_flag",2);
		return mv;
	}
	
	/**去详情页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail(String id,String infoId)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("RECRUIT_ID",id);
		PageData recruitData = recruitService.findById(pd);
		pd.put("RECRUITINFO_ID",infoId);
		PageData infoData = recruitInfoManager.findById(pd);

		List<PageData> pageDatas = recruitInfoManager.findByRecruitId(pd);
		mv.setViewName("mobile/recruitDetail");
		mv.addObject("recruit", recruitData);
		mv.addObject("detail", infoData);
		mv.addObject("pageDatas",pageDatas);
		mv.addObject("recruit_flag",2);
		return mv;
	}	
	

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
