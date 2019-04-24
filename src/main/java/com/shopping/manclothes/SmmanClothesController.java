package com.shopping.manclothes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shopping.cmm.Pagination;
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
			@RequestParam("upload") MultipartFile file) {
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid);
		
		return "clothes/manClothes";
	}
	
	@RequestMapping(value="/manclothes/objectRegister.do")
	public String objectRegister(@ModelAttribute ProductVO productVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		return "cmmLayout/cmmSmallWindow";
	}
	
	@RequestMapping(value="/manclothes/ajaxselectBoardList.do")
	public String ajaxselectBoardList(@ModelAttribute ProductVO productVO, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam(defaultValue="1") int curPage,
			@RequestParam("searchOption") int searchOption,
			@RequestParam("search") String search) {
		
		Map<String, Object> boardInfo = new HashMap<String, Object>();
		boardInfo.put("searchOption", searchOption);
		boardInfo.put("search", search);
		
		/*리스트 전체 개수*/
		int listCnt = smProductService.getProducListCnt(boardInfo);
		
		Pagination pagination = new Pagination(listCnt, curPage);
		
		boardInfo.put("startIndex", pagination.getStartIndex());
		boardInfo.put("pageSize", pagination.getPageSize());
		
		List<ProductVO> List = smProductService.getProductList(boardInfo);
		
		model.addAttribute("list", List);
		model.addAttribute("pagination", pagination);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("search", search);
		
		return "clothes/manProduct";
	}
	
	@ResponseBody
	@RequestMapping(value="/manclothes/insertProductInfo.do")
	public ProductVO insertProductInfo(@ModelAttribute ProductVO productVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		
		ProductVO vo = smProductService.getProduct(productVO);
		
		return vo;
	}
}
