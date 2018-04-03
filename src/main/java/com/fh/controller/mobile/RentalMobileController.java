package com.fh.controller.mobile;

import com.fh.common.HTMLSpirit;
import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.service.rental.rental.RentalManager;
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
 * 说明：租凭
 * 创建人：lugr
 * 创建时间：2017-03-11
 */
@Controller
@RequestMapping(value="/rental_mobile")
public class RentalMobileController extends BaseController {
	
	String menuUrl = "rental/list.do"; //菜单地址(权限用)
	@Resource(name="rentalService")
	private RentalManager rentalService;
	

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/list")
	public ModelAndView list(Page page) throws Exception{
		//logBefore(logger, Jurisdiction.getUsername()+"列表Rental");
		//if(!Jurisdiction.buttonJurisdiction(menuUrl, "cha")){return null;} //校验权限(无权查看时页面会有提示,如果不注释掉这句代码就无法进入列表页面,所以根据情况是否加入本句代码)
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		String keywords = pd.getString("keywords");				//关键词检索条件
		if(null != keywords && !"".equals(keywords)){
			pd.put("keywords", keywords.trim());
		}
		page.setPd(pd);
		page.setShowCount(13);
		List<PageData>	varList = rentalService.list(page);	//列出Rental列表
		for(PageData data : varList){
			data.put("INFO_CONTENT", HTMLSpirit.delHTMLTag((String)data.get("INFO_CONTENT")));

		}
		mv.setViewName("mobile/rental");
		mv.addObject("varList", varList);
		mv.addObject("pd", pd);
		mv.addObject("page", page);
		//mv.addObject("QX",Jurisdiction.getHC());	//按钮权限
		mv.addObject("rental_flag",2);
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
		pd = rentalService.findById(pd);	//根据ID读取
		String phone = pd.getString("CONTACT_PHONE");
		mv.addObject("phone",phone);
		String reg = "[\u4e00-\u9fa5]";
		phone  = phone.replaceAll(reg,"");
		phone = phone.replaceAll("[\\pP\\p{Punct}]", "-");
		String phones [] = phone.split("-");
		if(phones != null && phones.length > 0){
			phone = phones[0];
		}
		pd.put("CONTACT_PHONE",phone);
		mv.setViewName("mobile/rentalDetail");
		mv.addObject("pd", pd);
		mv.addObject("talents_flag",2);
		return mv;
	}


	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
