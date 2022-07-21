package com.gentle.www.util;

import java.io.File;

// 이미지 업로드에 필요한 기능 처리 22.07.20

public class ImageUtil {
	public static String rename(String path, String upName) {
		/* 리네임 정책 설정 ]
			같은 이름의 파일이 존재하면
			"_숫자" 를 붙여서 이름을 바꾸는 방식
		*/

		int count = 0;

		String newName = upName;


		File file = new File(path, newName);

		while(file.exists()) { // 같은 이름의 이미지가 존재하는 경우
			count++;

			int len = upName.lastIndexOf(".");
			String preName = upName.substring(0, len);
			String ext = upName.substring(len);

			newName = preName + "_" + count + ext;

			file = new File(path, newName);
		}
		return newName;
	}
}