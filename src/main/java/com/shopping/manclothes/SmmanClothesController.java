package com.shopping.manclothes;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
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

	private static final String SAVE_PATH = "D:/eGovFrameDev-3/eGovFrameDev-3.8.0-64bit/mall_img";
	
	@Autowired
	private SmProductService smProductService;
	
	@RequestMapping(value="/manclothes/writeGallery.do")
	public String writeGallery(@ModelAttribute SmUserVO userVO, Model model, HttpServletRequest request, HttpServletResponse response) {
		return "clothes/boardWrite";
	}

	@RequestMapping(value="/manclothes/insertGallery.do")
	public String insertGallery(@ModelAttribute ProductBoardVO productBoardVO, Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam("upload") MultipartFile file) {
		
		try {
			//검색어, 보여줄 게시물의 개수
			
			String originFilename = file.getOriginalFilename();
			
			String extName = originFilename.substring(originFilename.lastIndexOf("."), originFilename.length());
			Long size = file.getSize();
			
			String saveFileName = genSaveFileName(extName);
			
			System.out.println("originFilename : " + originFilename);
			System.out.println("extensionName : " + extName);
			System.out.println("size : " + size);
			System.out.println("saveFileName : " + saveFileName);
			
			writeFile(file, saveFileName, productBoardVO);
			
	//		UUID uuid = UUID.randomUUID();
	//		System.out.println(uuid);
			
			smProductService.setManBoard(productBoardVO);
			
			List<ProductBoardVO> list = smProductService.getManBoardList();
			model.addAttribute("list", list);
			
			/*List<ProductBoardVO> list = smProductService.getManProductList(productBoardVO);*/
			
		}
		catch(IOException e) {
			// 원래라면 RuntimeException 을 상속받은 예외가 처리되어야 하지만
			// 편의상 RuntimeException을 던진다.
			// throw new FileUploadException();	
			throw new RuntimeException(e);
		}
		
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
	
	public String genSaveFileName(String extName) {
		String fileName = "";
		
		Calendar calendar = Calendar.getInstance();
		fileName += calendar.get(calendar.YEAR);
		fileName += calendar.get(Calendar.MONTH);
		fileName += calendar.get(Calendar.DATE);
		fileName += calendar.get(Calendar.HOUR);
		fileName += calendar.get(Calendar.MINUTE);
		fileName += calendar.get(Calendar.SECOND);
		fileName += calendar.get(Calendar.MILLISECOND);
		fileName += extName;
		
		return fileName;
	}
	
	public boolean writeFile(MultipartFile file, String saveFileName, ProductBoardVO productBoardVO) throws IOException {
		boolean result = false;

		byte[] data = file.getBytes();
		String imgPath = SAVE_PATH + "/" + saveFileName;
		
		FileOutputStream fos = new FileOutputStream(imgPath);
		fos.write(data);
		fos.close();
		
		productBoardVO.setImg_path(imgPath);
		
		return result;
	}
}
