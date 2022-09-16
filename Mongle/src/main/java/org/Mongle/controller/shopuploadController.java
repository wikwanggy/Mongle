package org.Mongle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.Mongle.model.SAttachFileVO;
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
public class shopuploadController {
	/*// 파일 업로드
	@RequestMapping(value = "/shop_board", method = RequestMethod.GET)
	public void uploadajax() {

	}*/
	
	// 년,월,일 폴더를 생성하는 메서드 선언
	private String getFolder() {
		// 현재날짜 추출(Thu Aug 24 09:23:12 KST 2022)
		Date date = new Date();
		// Thu Aug 24 09:23:12 KST 2022 > 2022-08-24 (mm=분, MM=월)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 현재날짜와 날짜형식 을 연결.
		String str = sdf.format(date); // 2022-08-24
		System.out.println("Format 적용 현재날짜 : " + str);
		// 2022-08-24 > 2022\08\24로 변경

		return str.replace("-", "\\");
	}

	// 내가 올리고자 하는 파일이 이미지 파일인지 아닌지 구분하는 메서드 선언
	// 반환타입 메소드명 타입변수명
	private boolean checkImageType(File file) {
		// probeContentType(경로) : 파일경로에 있는 파일타입을 알아내는 메서드
		try {
			String contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType=" + contentType);
			// 파일타입이 image이면 true, 그 이외에는 false
			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@RequestMapping(value = "/shop_boardajax", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<SAttachFileVO>> shop_boardajaxPost(MultipartFile[] uploadFile) {
		// SAttachFileVO클래스 포함
		ArrayList<SAttachFileVO> list = new ArrayList<>();

		// 폴더 경로
		String uploadFolder = "D:\\upload";
		// 서버 업로드 경로와 getFolder메서드의 날짜문자열을 이어서 하나의 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());

		// 폴더 생성
		if (uploadPath.exists() == false) {// uploadPath가 존재하지 않으면,
			uploadPath.mkdirs(); // 만들어라
		}

		// for(변수명:배열명)
		for (MultipartFile multiparFile : uploadFile) {
			// SAttachFileVO클래스의 새로운 주소를 반복적으로 생성하여
			// ArrayList에 저장
			SAttachFileVO attachvo = new SAttachFileVO();
			System.out.println("getOriginalFilename="+multiparFile.getOriginalFilename());
			System.out.println("getSize="+multiparFile.getSize());

			// 파일저장
			// 실제 파일명(multiparFile.getOriginalFilename())
			// UUID 적용(UUID_multiparFile.getOriginalFilename())
			UUID uuid = UUID.randomUUID();
			System.out.println("UUID= " + uuid.toString());

			// SAttachFileVO의 uploadPath 변수에 저장()
			attachvo.setP_upload(getFolder());
			// SAttachFileVO의 fileName 변수에 저장()
			attachvo.setP_name(multiparFile.getOriginalFilename());
			// SAttachFileVO의 uuid 변수에 저장()
			attachvo.setP_uid(uuid.toString());

			// 어느폴더에(D:\\upload\\현재날짜), 어떤파일이름으로(mainlogo_new.png)
			File saveFile = new File(uploadPath, uuid.toString() + "_" + multiparFile.getOriginalFilename());
			// D:\\upload\\mainlogo_new.png에 파일을 전송(transferTo)
			try {// transferTo() 메소드에 예외가 있으면
				multiparFile.transferTo(saveFile); // 서버 원본파일 전송
				// 내가 서버에 올리고자 하는 파일이 이미지 이면,
				if (checkImageType(saveFile)) {

					// AttachFileVO의 image 변수에 저장()
					attachvo.setP_image(true);

					// 파일 생성
					FileOutputStream thumnail = new FileOutputStream(
							new File(uploadPath, "s_" + uuid.toString() + "_" + multiparFile.getOriginalFilename()));
					// 섬네일형식의 파일 생성
					Thumbnailator.createThumbnail(multiparFile.getInputStream(), thumnail, 100, 100);
					thumnail.close();

				} // checkImageType 메서드 끝

				// AttachFileVO에 저장된 데이터를 배열에 추가(add메소드)
				list.add(attachvo);

			} catch (Exception e) {// 예외를 처리하라.
				System.out.println(e.getMessage());
			}

		} // for문 끝
		return new ResponseEntity<>(list, HttpStatus.OK);
	} // uploadajax 끝...
		// 이미지 주소 생성 http://localhost:8080/uploadajax/disply?finename=a.jpg

	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String filename) {
		System.out.println("fileName="+filename);

		File file = new File("D:\\upload\\" + filename); // 경로 숨기는 작업

		ResponseEntity<byte[]> result = null;

		HttpHeaders headers = new HttpHeaders();
		try {
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}   // getFile 끝
		// 다운로드 주소 생성

	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String fileName) {
		Resource resource = new FileSystemResource("D:\\upload\\" + fileName);
		// 다운로드 시 파일의 이름을 처리
		String resourceName = resource.getFilename();
		HttpHeaders headers = new HttpHeaders();
		try {
			// 다운로드 파일이름이 한글일 때, 깨지지 않게 하기 위한 설정
			headers.add("Content-Disposition",
					"attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}
}
