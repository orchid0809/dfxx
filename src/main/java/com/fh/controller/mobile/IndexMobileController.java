package com.fh.controller.mobile;

import com.fh.controller.base.BaseController;
import com.fh.entity.Page;
import com.fh.param.RecruitSearchParam;
import com.fh.service.recruit.recruit.RecruitManager;
import com.fh.service.recruitInfo.recruitinfo.RecruitInfoManager;
import com.fh.service.system.role.RoleManager;
import com.fh.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/** 
 * 说明：招聘
 * 创建人：lugr
 * 创建时间：2017-03-09
 */
@Controller
@RequestMapping(value="/mobile")
public class IndexMobileController extends BaseController {
	

	/**列表
	 * @param page
	 * @throws Exception
	 */
	@RequestMapping(value="/index")
	public ModelAndView list(Page page,RecruitSearchParam param) throws Exception{

		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		mv.setViewName("mobile/index");
		return mv;
	}
	

	@InitBinder
	public void initBinder(WebDataBinder binder){
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
