package com.shopping.manclothes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class ManProductAPI {
	
	@Autowired
	private SmProductService smProductService;
	
	@ResponseBody
	@RequestMapping(value="/manclothes/getProduct", method=RequestMethod.GET)
	public ResponseEntity<List<ProductVO>> getProduct() {
		List<ProductVO> List = smProductService.getProductListAPI();

		return new ResponseEntity<List<ProductVO>>(List, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/manclothes/getProduct/{name}", method=RequestMethod.GET)
	public ResponseEntity<ProductVO> getProduct(@PathVariable String name) {
		
		ProductVO vo = smProductService.getProductOneAPI(name);
		
		return new ResponseEntity<ProductVO>(vo, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/manclothes/getProduct", method=RequestMethod.POST, headers = {"Content-type=application/json"})
	public ResponseEntity<Map<String, Object>>  insertProduct(@RequestBody ProductVO vo) {
		
		if(vo != null) {
			smProductService.insertProduct(vo);
		}
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "SUCCESS!!");
		
		return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/manclothes/getProduct", method=RequestMethod.PUT, headers = {"Content-type=application/json"})
	public ResponseEntity<Map<String, Object>>  updateProduct(@RequestBody ProductVO vo) {
		
		if(vo != null) {
			smProductService.updateProduct(vo);
		}
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "SUCCESS!!");
		
		return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value="/manclothes/getProduct/{uuid}", method=RequestMethod.DELETE)
	public ResponseEntity<Map<String, Object>> deleteProduct(@PathVariable String uuid) {
		
		smProductService.deleteProductOne(uuid);
		
		Map<String, Object> result = new HashMap<>();
		result.put("result", "SUCCESS!!");
		
		return new ResponseEntity<Map<String, Object>>(result, HttpStatus.OK);
	}
}
