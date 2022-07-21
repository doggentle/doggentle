package com.gentle.www.service;

import java.io.*;
import java.util.ArrayList;

import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.gentle.www.dao.*;
import com.gentle.www.util.ImageUtil;
import com.gentle.www.vo.*;

@Service 
@Aspect

public class GoodsService {

	@Autowired
	ManagerDao mgDao;

	public ImageVO uploadProc(MultipartFile file) {
		ImageVO iVO = uploadProc(file, "/upload");

		return iVO;
	}

	public ImageVO uploadProc(MultipartFile file, String dir) {
		ImageVO iVO = new ImageVO();

		String path = this.getClass().getResource("").getPath();
		path = path.substring(0, path.indexOf("/WEB-INF")) + "/resources" + dir;

		iVO.setDir("/www" + dir + "/");

		System.out.println(path);

		long len = file.getSize();
		iVO.setVolume(len);

		String upName = file.getOriginalFilename();
		if(upName == null) {
			return iVO;
		}

		iVO.setUpname(upName);

		String saveName = ImageUtil.rename(path, upName);

		iVO.setSavename(saveName);

		try {
			File f = new File(path, saveName);
			if(!f.exists()) {
				f.mkdirs();
			}
			file.transferTo(f);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return iVO;
	}

	@Transactional
	public void addGoods(ManagerVO mgVO) {
		if(mgVO.getFile() != null) {
			ImageVO iVO = uploadProc(mgVO.getFile());			
			int cnt = mgDao.addGoodsImg(iVO);
			if(cnt == 1) { // 이미지 등록에 성공하면?
				mgDao.addGoods(mgVO);
			}
		}


	}
} 