package com.fh.controller.mobile;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.talents.talents.TalentsManager;
import com.fh.util.AppUtil;
import com.fh.util.Jurisdiction;
import com.fh.util.ObjectExcelView;
import com.fh.util.PageData;
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
 * 说明：人才
 * 创建人：lugr
 * 创建时间：2017-03-12
 */

/**
 *
 */
@Controller
@RequestMapping(value="/talents_mobile")
public class TalentsMobileController extends BaseController {
	
	String menuUrl = "talents/list.do"; //菜单地址(权限用)
	@Resource(name="talentsService")
	private TalentsManager talentsService;
	

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"列表Talents");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		page.setShowCount(5);
		List<PageData>	varList = talentsService.list(page);	//列出Talents列表
		mv.setViewName("mobile/talents");
		mv.addObject("varList", varList);
		mv.addObject("page", page);
		mv.addObject("pd", pd);
		return mv;
	}

	 /**去修改页面
	 * @param
	 * @throws Exception
	 */
	@RequestMapping(value="/detail")
	public ModelAndView detail()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd = talentsService.findById(pd);	//根据ID读取
		mv.setViewName("mobile/talentsDetial");
		mv.addObject("msg", "edit");
		mv.addObject("pd", pd);
		return mv;
	}	
	

	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
