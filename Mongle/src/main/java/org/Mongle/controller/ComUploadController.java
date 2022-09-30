package org.Mongle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.Mongle.model.CommUVo;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import net.coobird.thumbnailator.Thumbnailator;

@Controller
public class ComUploadController {
	@RequestMapping(value = "/ComuploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<CommUVo>> ComuploadAjaxPost(MultipartFile[] uploadFile) {
		ArrayList<CommUVo> list=new ArrayList<CommUVo>();
		String uploadfolder="D:\\upload";
		File uploadPath=new File(uploadfolder,getFolder());
		String uploadFolderPath=getFolder();
		System.out.println("uploadPath="+uploadPath);
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		for(MultipartFile multipartFile:uploadFile) {
			System.out.println("uploaded file name : "+multipartFile.getOriginalFilename());
			System.out.println("uploaded file size : "+multipartFile.getSize());
			
			String uploadFileName=multipartFile.getOriginalFilename();
			
			CommUVo cuv=new CommUVo();
			
			uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			System.out.println("file name="+uploadFileName);
			
			cuv.setFilename(uploadFileName);
			
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			
			
			try {
				File savefile=new File(uploadPath, uploadFileName);
				multipartFile.transferTo(savefile);
				cuv.setUuid(uuid.toString());
				cuv.setUploadPath(uploadFolderPath);
				if(checkImageType(savefile)) {
					cuv.setImage(true);
					FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
				}
				list.add(cuv);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
	
	/*
	 * 
	 * 
		for(MultipartFile multipartFile:ntuploadFile) {
			System.out.println("uploaded file name : "+multipartFile.getOriginalFilename());
			System.out.println("uploaded file size : "+multipartFile.getSize());
			CommUVo cuv=new CommUVo();
			String uploadFileName=multipartFile.getOriginalFilename();
			uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			System.out.println("file name"+uploadFileName);
			cuv.setFilename(uploadFileName);
			
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			
			try {
				File savefile=new File(uploadPath, uploadFileName);
				multipartFile.transferTo(savefile);
				cuv.setUuid(uuid.toString());
				cuv.setUploadPath(uploadFolderPath);
				if(checkImageType(savefile)) {
					cuv.setImage(true);
					FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
				}
				list.add(cuv);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}//for 끝
		return new ResponseEntity<>(list,HttpStatus.OK);
	 * 
	 * */
	@RequestMapping(value = "/community/comdisplay", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String filename){
		System.out.println(filename);
		File file = new File("D:\\upload\\"+filename);
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers=new HttpHeaders();
		
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping(value = "/community/ntdisplay", method = RequestMethod.GET)
	public ResponseEntity<byte[]> ntgetFile(String filename){
		System.out.println(filename);
		File file = new File("D:\\upload\\"+filename);
		ResponseEntity<byte[]> result = null;
		HttpHeaders headers=new HttpHeaders();
		
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result=new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),headers,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@RequestMapping(value = "/community/ntdownload", method = RequestMethod.GET)
	public ResponseEntity<Resource> ntdownloadFile(String filename){
		Resource resource=new FileSystemResource("D:\\upload\\"+filename);
		/*if(resource.exists()==false) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}*/
		//다운로드 시 파일의 이름 처리
		String resourceName=resource.getFilename();
		HttpHeaders headers=new HttpHeaders();
		
		try{
			//다운로드 파일 이름이 한글일 때, 깨지지 않게 하기 위한 설정
			headers.add("Content-Disposition","attachment;filename="+new String(resourceName.getBytes("utf-8"),"ISO-8859-1"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource,headers,HttpStatus.OK);
	}
	@RequestMapping(value = "/community/comdownload", method = RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String filename){
		Resource resource=new FileSystemResource("D:\\upload\\"+filename);
		/*if(resource.exists()==false) {
			return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
		}*/
		//다운로드 시 파일의 이름 처리
		String resourceName=resource.getFilename();
		HttpHeaders headers=new HttpHeaders();
		
		try{
			//다운로드 파일 이름이 한글일 때, 깨지지 않게 하기 위한 설정
			headers.add("Content-Disposition","attachment;filename="+new String(resourceName.getBytes("utf-8"),"ISO-8859-1"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource,headers,HttpStatus.OK);
	}
	private String getFolder() {
		Date date=new Date(); //현재 날짜
		SimpleDateFormat Sdate=new SimpleDateFormat("yyyy-MM-dd");
		String str=Sdate.format(date); //2022-08-24 현재 날짜 간단화
		//2022-08-24 -> 2022\08\24 -를 \로 변환해 리턴
		System.out.println(date+"(포맷 전), "+str+"(포맷 후)");
		return str.replace("-", "\\");
	}
	private boolean checkImageType(File file) {
		//probeContentType(파일 경로) : 파일경로에 있는 파일타입을 알아내는 메소드
		try {
			String contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType="+contentType);
			//파일타입이 image이면 true, 그 이외에는 false
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	@RequestMapping(value = "/comdeleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> comdeleteFile(String filename, String type){
		File file;
		try {
			file=new File("D:\\upload\\"+URLDecoder.decode(filename, "UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName=file.getAbsolutePath().replace("s_", "");
				file=new File(largeFileName);
				file.delete();
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	@RequestMapping(value = "/ntdeleteFile", method = RequestMethod.POST)
	public ResponseEntity<String> ntdeleteFile(String filename, String type){
		File file;
		try {
			file=new File("D:\\upload\\"+URLDecoder.decode(filename, "UTF-8"));
			file.delete();
			if(type.equals("image")) {
				String largeFileName=file.getAbsolutePath().replace("s_", "");
				file=new File(largeFileName);
				file.delete();
			}
		}catch(Exception e){
			e.printStackTrace();
			return new ResponseEntity<String>(HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>("deleted",HttpStatus.OK);
	}
	@RequestMapping(value = "/ntuploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<CommUVo>> uploadAjaxPost(MultipartFile[] ntuploadFile) {
		ArrayList<CommUVo> list=new ArrayList<CommUVo>();
		String uploadfolder="D:\\upload";
		String uploadFolderPath=getFolder();
		File uploadPath=new File(uploadfolder,getFolder());
		if(uploadPath.exists()==false) {
			uploadPath.mkdirs();
		}
		for(MultipartFile multipartFile:ntuploadFile) {
			System.out.println("uploaded file name : "+multipartFile.getOriginalFilename());
			System.out.println("uploaded file size : "+multipartFile.getSize());
			CommUVo cuv=new CommUVo();
			String uploadFileName=multipartFile.getOriginalFilename();
			uploadFileName=uploadFileName.substring(uploadFileName.lastIndexOf("\\")+1);
			System.out.println("file name"+uploadFileName);
			cuv.setFilename(uploadFileName);
			
			UUID uuid=UUID.randomUUID();
			uploadFileName=uuid.toString()+"_"+uploadFileName;
			
			try {
				File savefile=new File(uploadPath, uploadFileName);
				multipartFile.transferTo(savefile);
				cuv.setUuid(uuid.toString());
				cuv.setUploadPath(uploadFolderPath);
				if(checkImageType(savefile)) {
					cuv.setImage(true);
					FileOutputStream thumbnail=new FileOutputStream(new File(uploadPath, "s_"+uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumbnail,100,100);
				}
				list.add(cuv);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}//for 끝
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
}
