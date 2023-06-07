package com.mysite.shop.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mysite.shop.beans.GoodsBean;
import com.mysite.shop.beans.LoginUserBean;
import com.mysite.shop.beans.PageBean;
import com.mysite.shop.beans.ReviewBean;
import com.mysite.shop.beans.ShopBean;
import com.mysite.shop.mapper.ShopMapper;

@Service
@PropertySource("/static/properties/option.properties")
public class ShopService {
	
	@Autowired
	private ShopMapper shopMapper;	
	
	@Value("${path.upload}")
	private String path_upload;
	
	@Value("${page.listcnt}")
	private int page_listcnt;
	
	@Value("${page.paginationcnt}")
	private int page_paginationcnt;
	
	
	//세션에 저장된 로그인 객체를 가져오기
	@Resource(name = "loginUserBean")
	private LoginUserBean loginUserBean;

	//상점등록
	public void addShopInfo(ShopBean shopBean) {
		
		MultipartFile upload_file = shopBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			shopBean.setShop_picture(file_name);
		}
		shopBean.setUser_idx(loginUserBean.getUser_idx());;
		shopMapper.addShopInfo(shopBean);
	}
	
	public ShopBean getMyShop(int user_idx) {
		return shopMapper.selectShopInfo(user_idx);
	}
	
	public ShopBean selectShopInfo(int user_idx) {
		return shopMapper.selectShopInfo(user_idx);
	}
	
	//서버로 업로드 된 파일을 업로드 폴더에 저장하고 파일의 이름을 리턴하는 메소드
	private String saveUploadFile(MultipartFile upload_file) {
		
		//현재시간을 이용해서 파일의 이름이 중복되지 않게 설정
		String file_name = System.currentTimeMillis() + "_" + upload_file.getOriginalFilename();
		
		try {
			upload_file.transferTo(new File(path_upload+"/"+file_name));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return file_name;
	}
	
	
	public void modifymyShop(ShopBean shopBean) {
		
		MultipartFile upload_file = shopBean.getUpload_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			shopBean.setShop_picture(file_name);
		}
		shopBean.setUser_idx(loginUserBean.getUser_idx());
		shopMapper.modifyMyShop(shopBean);
	}
	
	//전체 상품불러오기
	public List<GoodsBean> goodsListService(int page) {
		//시작인덱스 = (페이지번호-1)*10
		int start = (page-1)*page_listcnt;
		//마이바티스의 RowBounds 클래스를 사용해 가져올 글시작번호, 가져올갯수로 설정
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		//매퍼에서 처리하도록 rowBounds 객체를 매개변수로 추가
		return shopMapper.getContentList(rowBounds);
	}
	
	//내 상점 상품불러오기
	public List<GoodsBean> myShopListService(int user_idx, int page) {
		//시작인덱스 = (페이지번호-1)*10
		int start = (page-1)*page_listcnt;
		//마이바티스의 RowBounds 클래스를 사용해 가져올 글시작번호, 가져올갯수로 설정
		RowBounds rowBounds = new RowBounds(start, page_listcnt);
		//매퍼에서 처리하도록 rowBounds 객체를 매개변수로 추가
		return shopMapper.getmyShopList(user_idx, rowBounds);
	}
	
	//페이징
	public PageBean getContentCnt(int currentPage) {
		
		int content_cnt = shopMapper.getContentCnt();
		
		PageBean pageBean = new PageBean(content_cnt, currentPage, page_listcnt, page_paginationcnt);
		
		return pageBean;
	}
	
	//상품등록
	public void addGoodsInfo(GoodsBean goodsBean) {
		
		MultipartFile upload_file = goodsBean.getGoods_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			goodsBean.setGoods_picture(file_name);
		}
		goodsBean.setUser_idx(loginUserBean.getUser_idx());
		shopMapper.addGoodsInfo(goodsBean);
	}
	
	public GoodsBean getOneGoods(int goods_idx) {
		return shopMapper.getOneGoods(goods_idx);
	}
	
	public void modifyGoods(GoodsBean goodsBean) {
		
		MultipartFile upload_file = goodsBean.getGoods_file();
		
		if(upload_file.getSize() > 0) {
			String file_name = saveUploadFile(upload_file);
			goodsBean.setGoods_picture(file_name);
		}
		goodsBean.setUser_idx(loginUserBean.getUser_idx());
		shopMapper.modifyGoods(goodsBean);
	}
	
	public void deleteGoods(int goods_idx) {
		shopMapper.deleteGoods(goods_idx);
	}
	
	//리뷰등록
	public void addReview(ReviewBean reviewBean) {
		shopMapper.addReview(reviewBean);
	}
	
	//리뷰 상품불러오기
	public List<ReviewBean> reviewListService(int goods_idx) {

		return shopMapper.getReviewList(goods_idx);
	}
	
	public void deleteReview(int review_idx) {
		shopMapper.deleteReview(review_idx);
	}
}
