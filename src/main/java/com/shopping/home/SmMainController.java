package com.shopping.home;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.login.SmUserVO;

@Controller
public class SmMainController {

	@RequestMapping(value="/clothes/manClothes.do")
	public String manClothes(@ModelAttribute SmUserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		return "clothes/manClothes";
	}
	
	@RequestMapping(value="/cmm/cmmPlayer.do")
	public String cmmPlayer(@ModelAttribute SmUserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		return "cmmLayout/cmmPlayer";
	}
}
