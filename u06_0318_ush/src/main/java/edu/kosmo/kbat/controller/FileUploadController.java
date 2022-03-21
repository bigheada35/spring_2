package edu.kosmo.kbat.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import edu.kosmo.kbat.service.ProductService;
import edu.kosmo.kbat.service.StorageFileNotFoundException;
import edu.kosmo.kbat.service.StorageService;
import edu.kosmo.kbat.vo.ProductVO;

@Controller
public class FileUploadController {

	private final StorageService storageService;

	@Autowired
	private	ProductService productService;
	
	
	@Autowired
	public FileUploadController(StorageService storageService) {
		this.storageService = storageService;
	}

	@GetMapping("/upload/list")
	public String listUploadedFiles(Model model) throws IOException {
		

		
		model.addAttribute("files", storageService.loadAll().map(
				path -> MvcUriComponentsBuilder.fromMethodName(FileUploadController.class,
						"serveFile", path.getFileName().toString()).build().toUri().toString())
				.collect(Collectors.toList()));

		return "thymeleaf/upload/uploadForm";

	}

	@GetMapping("/upload/list2")
	public String listUploadedFiles2(Model model) throws IOException {

		

		
		List <ProductVO> productVO = productService.getList();

		
		Stream<Path> fileTree = storageService.loadAll();
		
		Iterator itr = fileTree.iterator();
		
		while(itr.hasNext()) {
			
			String fname = itr.next().toString();
			System.out.println(fname);
			
			String uri = MvcUriComponentsBuilder.fromMethodName(
					FileUploadController.class,
					"serveFile", 
					fname)
			.build()
			.toUri()
			.toString();
			System.out.println(uri);
			
		}
		
/*	
		storageService.loadAll().map(
									path -> MvcUriComponentsBuilder.fromMethodName(
											FileUploadController.class,
											"serveFile", 
											path.getFileName().toString())
									.build()
									.toUri()
									.toString()
									)
				.collect(Collectors.toList());
*/			
		
		
/*		
		model.addAttribute("files", storageService.loadAll().map(
				path -> MvcUriComponentsBuilder.fromMethodName(FileUploadController.class,
						"serveFile", path.getFileName().toString()).build().toUri().toString())
				.collect(Collectors.toList()));
*/		
		model.addAttribute("products", productVO);
		
		
		
		return "upload/uploadForm";
	}
	
	@GetMapping("/files/{filename:.+}")
	@ResponseBody
	public ResponseEntity<Resource> serveFile(@PathVariable String filename) {
		
		Resource file = storageService.loadAsResource(filename);
		
		return ResponseEntity.ok().header(HttpHeaders.CONTENT_DISPOSITION,
				"attachment; filename=\"" + file.getFilename() + "\"").body(file);
	}

	@PostMapping("/upload/fileUpload")
	public String handleFileUpload(@RequestParam("fileVideo") MultipartFile file1,
									@RequestParam("fileImage") MultipartFile file2,
									RedirectAttributes redirectAttributes,
									@ModelAttribute ProductVO productVO) {
		

		
		storageService.store(file1);
		storageService.store(file2);
		
		

		//ssj 0305 convert file to uri
		String uri1 = MvcUriComponentsBuilder.fromMethodName(
				FileUploadController.class,
				"serveFile", 
				file1.getOriginalFilename())
		.build()
		.toUri()
		.toString();
		
		String uri2 = MvcUriComponentsBuilder.fromMethodName(
				FileUploadController.class,
				"serveFile", 
				file2.getOriginalFilename())
		.build()
		.toUri()
		.toString();		
		
		productVO.setProduct_name(file1.getOriginalFilename());
		productVO.setProduct_enable("1");
		productVO.setProduct_stock(1);
		productVO.setVideo_name(uri1);
		productVO.setImage_name(uri2);
		
		
		productService.write(productVO);
		
		
		redirectAttributes.addFlashAttribute("message",
				"You successfully uploaded " + file1.getOriginalFilename() + "!");

		return "redirect:/upload/list2";
	}

	@GetMapping("/upload/delete")
	public String delete(@ModelAttribute ProductVO productVO) throws IOException {
		
		productService.delete(productVO.getProduct_id());
		
		return "redirect:/upload/list2";
	}
	
	@ExceptionHandler(StorageFileNotFoundException.class)
	public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException exc) {
		return ResponseEntity.notFound().build();
	}

}
