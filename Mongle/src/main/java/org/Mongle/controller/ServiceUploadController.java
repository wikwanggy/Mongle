package org.Mongle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.Mongle.model.ServiceFileListVO;
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
public class ServiceUploadController {
	
	
	//년 월  일 폴더 생성하는 메서드 선언
	private String getFolder() {
		
		
		//현재 날짜 추출(Thu Aug 24 19:23:12 KST 2022)
		Date date=new Date();
		System.out.println("No Format 현재날짜 :"+date);
		//Thu Aug 24 19:23:12 KST 2022-> 2022-08-24
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		//현재날짜와 날짜형식을 연결
		String str=sdf.format(date); 
		System.out.println("Format 적용 현재 날짜:"+str);
		
		return str.replace("-", "\\");
	}
	//내가 올리고자 하는 파일이 이미지 파일인지 아닌지 구분하는 메서드 선언
	//     반환타입     메소드명          타입    변수명
	private boolean checkImageType(File file) {
		//probeContentType(파일경로):파일경로에 있는 파일타입을 알아내는 메서드
	try {
		String contentType =Files.probeContentType(file.toPath());
		System.out.println("contentType="+contentType);
		//파일타입이 image 이면 true, 그 이외에는 false
		return contentType.startsWith("image");
	
	}catch(IOException e) {
		//TODO Auto-generated catch block
		e.printStackTrace();
	}
	return false;
}
	
	@RequestMapping(value="/serviceuploadAjaxAction",method=RequestMethod.POST)
	public ResponseEntity<ArrayList<ServiceFileListVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		
		//ServiceFileListVO클래스 포함
		ArrayList<ServiceFileListVO> list = new ArrayList();
		
		//폴더경로
		String uploadFolder="D:\\01-STUDY\\upload";
		//서버 업로드 경로와 getFolder메서드의 날짜문자열을 이어서 하나의 폴더 생성
		File uploadPath=new File(uploadFolder,getFolder());
		
		//폴더 생성
		if(uploadPath.exists()==false) {//uploadPath가 존재하지 않으면,
		uploadPath.mkdirs();
		}
		
		//for(변수명:배열명)
		
		for(MultipartFile multipartFile : uploadFile) {
			
		//ServiceFileListVO클래스의 새로운 주소를 반복적으로 생성하여
		//ArrayList에 저장
			ServiceFileListVO fileVO = new ServiceFileListVO();
			
		System.out.println(multipartFile.getOriginalFilename());
		System.out.println(multipartFile.getSize());

		
		//파일저장
		//실제 파일명(multiparFile.getOriginalFilename())
		//UUID 적용(UUID_multiparFile.getOriginalFilename());
		UUID uuid=UUID.randomUUID();
		System.out.println("UUID="+uuid.toString());
		
		//ServiceFileListVO의 uploadPath 변수에 저장()
		fileVO.setUploadPath(getFolder());
		//ServiceFileListVO의 fileName 변수에 저장()
		fileVO.setFileName(multipartFile.getOriginalFilename());
		//ServiceFileListVO의 uuid 변수에 저장()
		fileVO.setUuid(uuid.toString());
		
		//                     어느폴더에(D:\\01-STUDY\\upload  ,  어떤파일이름으로(UUID_mainlogo_new.png)
		File saveFile=new File(uploadPath,uuid.toString()+"_"+multipartFile.getOriginalFilename());
		//                      D:\\01-STUDY\\upload\\mainlogo_new.png에 파일을 전송(transferTo)
		try {//transferTo() 메소드에 예외가 있으면
		multipartFile.transferTo(saveFile);
		//내가 서버에 올리고자 하는 파일이 이미지이면,
		if(checkImageType(saveFile)) {
			
			//ServiceFileListVO의 image 변수에 저장()
			fileVO.setImage(true);
			
			
			//파일 생성
			FileOutputStream thumnail=new FileOutputStream(new File(uploadPath,"s_"+uuid.toString()+"_"+multipartFile.getOriginalFilename()));
			//섬네일형식의 파일 생성
			Thumbnailator.createThumbnail(multipartFile.getInputStream(),thumnail,100,100);
		
			thumnail.close();
		
		}//checkImageType메서드 끝
		
		//ServiceFileListVO에 저장된 데이터를 배열에 추가
		list.add(fileVO);			
		
		}catch(Exception e) {// 예외를 처리하라.
			System.out.println(e.getMessage());
		}
		
	}//for문 끝
	return new ResponseEntity<>(list,HttpStatus.OK);
		
}	// uploadAjax end......
	// 이미지 주소 생성
	@RequestMapping(value="/servicedisplay",method=RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName){
		System.out.println(fileName);
		
		File file = new File("D:\\01-STUDY\\upload\\"+fileName);

		ResponseEntity<byte[]> result = null;

		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),
					headers,HttpStatus.OK);

		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	//다운로드 주소 생성
	@RequestMapping(value="/servicedownload",method=RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String fileName){
		
		Resource resource=new FileSystemResource("D:\\01-STUDY\\upload\\"+fileName);
		
		// 다운로드 시 파일의 이름을 처리
		String resourceName=resource.getFilename();
		
		HttpHeaders headers = new HttpHeaders();
		
		try {
			//다운로드 파일이름이 한글일 때, 깨지지 않게 하기 위한 설정
			headers.add("Content-Disposition" ,"attachment;filename="+new String(resourceName.getBytes("utf-8"),"ISO-8859-1"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<>(resource,headers,HttpStatus.OK);
	}
}
