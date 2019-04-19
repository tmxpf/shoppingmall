package com.shopping.manclothes;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.login.SmUserVO;

@Controller
public class SmmanClothesController {

	@Autowired
	private SmProductService smProductService;
	
	@RequestMapping(value="/manclothes/writeGallery.do")
	public String writeGallery(@ModelAttribute SmUserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		return "clothes/boardWrite";
	}

	@RequestMapping(value="/manclothes/insertGallery.do")
	public String insertGallery(@ModelAttribute ProductBoardVO productBoardVO, Model model, HttpServletRequest request, HttpServletResponse response, 
			HttpSession session,
			@RequestParam("upload") MultipartFile file) {
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		
		return "clothes/manClothes";
	}
	
	@RequestMapping(value="/manclothes/objectRegister.do")
	public String objectRegister(@ModelAttribute ProductVO productVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		ArrayList<ProductVO> voList = smProductService.getProductList();
		
		return "cmmLayout/cmmSmallWindow";
	}
}
