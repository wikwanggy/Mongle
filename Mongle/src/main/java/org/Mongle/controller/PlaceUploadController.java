package org.Mongle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.UUID;

import org.Mongle.model.PlaceAttachFileVO;
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
public class PlaceUploadController {
	@RequestMapping(value = "/placeuploadForm", method = RequestMethod.GET)
	public void uploadForm() {
	}

	@RequestMapping(value = "/placeuploadFormAction", method = RequestMethod.POST)
	public void uploadFormPost(MultipartFile[] uploadFile) {

		// 폴더 경로
		String uploadFolder = "D:\\upload";

		// for(변수명:배열명)

		for (MultipartFile multipartFile : uploadFile) {
			System.out.println(multipartFile.getOriginalFilename());
			System.out.println(multipartFile.getSize());

			// 파일 저장 어느 폴더에 어떤파일이름으로 저장할지?
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());

			// D:\\upload 에 파일을 전송

			try {
				multipartFile.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}

		}
	}

	@RequestMapping(value = "/placeuploadAjax", method = RequestMethod.GET)
	public void uploadAjax() {

	}
	/*
	 * 동일한 이름으로 파일이 업로드 되었을 때 기존 파일이 사라지는 문제(덮어쓰기) -> 1. 업로드 시 파일명의 중복되지않는 임의의 15자
	 * 문자열을 실제파일명과 결합 UUID (실제파일명 : a.jpg => qwedsf45678qwfsc_a.jpg) 2. 날짜폴더를 생성해서
	 * 날짜별로 파일을 업로드
	 */

	// 년/월/일 폴더 생성하는 메서드 선언
	private String getFolder() {

		// 현재 날짜 추출(Thu Aug 24 09:23:12 KST 2022)
		Date date = new Date();
		// Thu Aug 24 09:23:12 KST 2022 -> 2022-08-24
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		// 현재날짜와 날짜형식을 연결
		String str = sdf.format(date); // 2022-08-24
		// 2022-08-24 - >2022\08\24
		return str.replace("-", "\\");
	}

	// 올리고자 하는 파일이 이미지파일인지 구분하는 메서드 선언
	private boolean checkImageType(File file) {
		// probeContentType(파일경로) : 파일경로에 있는 파일타입을 알아내는 메서드
		String contentType;
		try {
			contentType = Files.probeContentType(file.toPath());
			System.out.println("contentType=" + contentType);
			// 파일 타입이 image이면 true, 그 외 false
			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	@RequestMapping(value = "/placeuploadAjaxAction", method = RequestMethod.POST)
	public ResponseEntity<ArrayList<PlaceAttachFileVO>> uploadAjaxPost(MultipartFile[] uploadFile) {

		// AttachFileVO클래스포함
		ArrayList<PlaceAttachFileVO> list = new ArrayList<>();

		// 폴더 경로
		String uploadFolder = "D:\\upload";
		// 서버 업로드 경로와 getFolder메서드의 날짜문자열을 이어서 하나의 폴더 생성
		File uploadPath = new File(uploadFolder, getFolder());
		// 폴더 생성
		if (uploadPath.exists() == false) {// uploadPath가 존재하지 않으면
			uploadPath.mkdirs();
		}
		// for(변수명:배열명)
		for (MultipartFile multipartFile : uploadFile) {

			// AttachFileVO의 클래스의 새로운 주소를 반복적으로 생성하여
			// ArrayList에 저장
			PlaceAttachFileVO attachvo = new PlaceAttachFileVO();

			System.out.println(multipartFile.getOriginalFilename());
			System.out.println(multipartFile.getSize());

			// 실제 파일명(multiparFile.getOriginalFilename())
			// UUID 적용(UUID_multiparFile.getOriginalFilename())
			UUID uuid = UUID.randomUUID();
			System.out.println("UUID : " + uuid.toString());

			// AttachFileVO의 uploadPath 변수에 저장()
			attachvo.setUploadPath(getFolder());
			// AttachFileVO의 fileName 변수에 저장()
			attachvo.setFileName(multipartFile.getOriginalFilename());
			// AttachFileVO의 uuid 변수에 저장()
			attachvo.setUuid(uuid.toString());

			// 파일 저장 어느 폴더에 어떤파일이름으로 저장할지?
			File saveFile = new File(uploadPath, uuid.toString() + "_" + multipartFile.getOriginalFilename());

			// D:\\upload 에 파일을 전송
			try {
				multipartFile.transferTo(saveFile); // 서버로 원본파일 전송
				// 서버에 올리고자 하는 파일이 이미지 이면
				if (checkImageType(saveFile)) {

					// AttachFileVO의 image 변수에 저장()
					attachvo.setImage(true);

					// FileOutputStream 클래스 : 자바클래스중에 파일을 만들어주는 클래스
					FileOutputStream thumnail = new FileOutputStream(
							new File(uploadPath, "s_" + uuid.toString() + "_" + multipartFile.getOriginalFilename()));

					// 섬네일 형식의 파일생성
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumnail, 100, 100);
					thumnail.close();
				} // checkImageType 끝

				// AttachFileVO에 저장된 데이터를 배열에 추가(add)
				list.add(attachvo);

			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		} // for문 끝
		return new ResponseEntity<>(list, HttpStatus.OK);
	} // uploadAjax 끝

	// 이미지주소생성 http://localhost:8080/uploadAjax/display?fileName=a.jpg
	@RequestMapping(value = "/placedisplay", method = RequestMethod.GET)
	public ResponseEntity<byte[]> getFile(String fileName) {
		System.out.println(fileName);

		File file = new File("D:\\upload\\" + fileName); // 경로를 숨기는 작업

		ResponseEntity<byte[]> result = null;

		HttpHeaders headers = new HttpHeaders();

		try {
			headers.add("Content-type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}// getFile 끝

	// 다운로드 주소 생성
	@RequestMapping(value = "/placedownload", method = RequestMethod.GET)
	public ResponseEntity<Resource> downloadFile(String fileName) {

		Resource resource = new FileSystemResource("D:\\upload\\" + fileName);

		// 다운로드 시 파일의 이름을 처리
		String resourceName = resource.getFilename();

		HttpHeaders headers = new HttpHeaders();

		try {
			// 다운로드 파일 이름이 한글일 때, 깨지지 않게 하기위한 설정
			headers.add("Content-Disposition",
					"attachment;filename=" + new String(resourceName.getBytes("utf-8"), "ISO-8859-1"));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return new ResponseEntity<>(resource, headers, HttpStatus.OK);
	}
}
