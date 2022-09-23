package org.Mongle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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
	public ResponseEntity<ArrayList<CommUVo>> comuploadAjaxAc(MultipartFile[] uploadFile) {
		ArrayList<CommUVo> list=new ArrayList<>();
		// 폴더 경로
		String uploadFolder="D:\\upload";
		File uploadPath=new File(uploadFolder,getFolder());

		if(uploadPath.exists()==false) { //uploadFolder가 존재하지 않으면 
			uploadPath.mkdirs(); //폴더를 생성함
		}
		
		for(MultipartFile multiparFile:uploadFile) {
			CommUVo cuv=new CommUVo();
			System.out.println(multiparFile.getOriginalFilename());
			System.out.println(multiparFile.getSize());
			
			//파일 저장					
			//실제 파일명(multiparFile.getOriginalFilename())
			//UUID 생성(UUID_multiparFile.getOriginalFilename())
			UUID uuid=UUID.randomUUID();
			System.out.println("UUID="+uuid.toString());
			
			cuv.setUploadPath(getFolder());
			//AttachFileVo의 filename 변수에 저장
			cuv.setFilename(multiparFile.getOriginalFilename());
			//AttachFileVo의 uuid 변수에 저장
			cuv.setUuid(uuid.toString());
			
			//어느 폴더에(uploadFolder), 어떤 파일 이름으로 저장할 것인지(UUID)
				//어느 폴더에+현재날짜
				//	UUID(형변환 필요),String,	String
			File saveFile=new File(uploadPath,uuid.toString()+"_"+multiparFile.getOriginalFilename());
			try { // D:\\upload\mugunghwa.png에 파일을 전송(transferTO)
				multiparFile.transferTo(saveFile);
				if(checkImageType(saveFile)==true) {
					cuv.setImage(true);
					//파일 생성 FileOutputStream의 
					FileOutputStream tnail=new FileOutputStream(new File(uploadPath,"s_"+uuid.toString()+"_"+multiparFile.getOriginalFilename()));
					//썸네일 형식의 파일 생성
					Thumbnailator.createThumbnail(multiparFile.getInputStream(),tnail,100,100);
					
					tnail.close();
				}
				list.add(cuv);
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		return new ResponseEntity<>(list,HttpStatus.OK);
	}
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
	@RequestMapping(value = "/community/comdownload", method = RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String filename){
		Resource resource=new FileSystemResource("D:\\upload\\"+filename);
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
	@RequestMapping(value = "/ntuploadAjaxAction", method = RequestMethod.POST)
	public /*ResponseEntity<ArrayList<NoticeUVo>>*/void ntuploadAjaxAc(MultipartFile[] uploadFile) {
		//ArrayList<NoticeUVo> list=new ArrayList<>();
		
		String uploadFolder="D:\\upload";
		
		File uploadPath=new File(uploadFolder,getFolder());
		 
		if(uploadPath.exists()==false) { //uploadFolder가 존재하지 않으면 
			uploadPath.mkdirs(); //폴더를 생성함
		}
		
		for(MultipartFile multiparFile:uploadFile) {
			//NoticeUVo nuv=new NoticeUVo();
			
			System.out.println(multiparFile.getOriginalFilename());
			System.out.println(multiparFile.getSize());
			/*
			UUID uuid=UUID.randomUUID();
			System.out.println("UUID="+uuid.toString());
			
			nuv.setUploadPath(getFolder());
			nuv.setFilename(multiparFile.getOriginalFilename());
			nuv.setUuid(uuid.toString());
			*/
			File saveFile=new File(uploadPath,/*uuid.toString()+"_"+*/multiparFile.getOriginalFilename());
			
			try {
				multiparFile.transferTo(saveFile);
				/*if(checkImageType(saveFile)==true) {
					nuv.setImage(true);
					FileOutputStream tnail=new FileOutputStream(new File(uploadPath,"s_"+uuid.toString()+"_"+multiparFile.getOriginalFilename()));
					Thumbnailator.createThumbnail(multiparFile.getInputStream(),tnail,100,100);
					tnail.close();
				}
				list.add(nuv);*/
			}catch(Exception e){
				System.out.println(e.getMessage());
			}
		}
		//return new ResponseEntity<>(list,HttpStatus.OK);
	}
}
