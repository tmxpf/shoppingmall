package com.shopping.home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shopping.login.SmUserVO;
import com.shopping.manclothes.ProductBoardVO;
import com.shopping.manclothes.SmProductService;

@Controller
public class SmMainController {

	@Autowired
	SmProductService smProductService;
	
	@RequestMapping(value="/clothes/manClothes.do")
	public String manClothes(@ModelAttribute SmUserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		List<ProductBoardVO> list = smProductService.getManBoardList();
		model.addAttribute("list", list);
		
		return "clothes/manClothes";
	}
	
	@RequestMapping(value="/cmm/cmmPlayer.do")
	public String cmmPlayer(@ModelAttribute SmUserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		return "cmmLayout/cmmPlayer";
	}
}
