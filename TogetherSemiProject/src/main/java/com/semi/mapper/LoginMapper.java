package com.semi.mapper;


import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;

import com.semi.dto.MoimDto;
import com.semi.dto.UserDto;
import com.semi.dto.UserPhotoDto;
import com.semi.dto.JJimDto;

@Mapper
public interface LoginMapper {
	
	public void insertUser(UserDto dto);
	public int isEqualPassEmail(Map<String, String> map); // map : email, pass
	public UserDto selectOneOfEmail(String email);
	public int overlappedEmail(UserDto dto);
	public int chEmail(String inemail);	// 인증 이메일 중복

	/*마이페이지*/
	
	public void insertMyPhoto(UserPhotoDto pdto);
	
	public void updateMyPhoto(UserPhotoDto pdto);
	
	public UserPhotoDto getMyProfile(int unum);
	
	public UserDto getMypage(int unum);
	
	public int getTotalCount();
	public List<UserDto> getAllUsers();
	public List<UserPhotoDto> getPhotosByUnum(int unum);
	public UserDto getUserByUnum(int unum);
	public List<UserPhotoDto> getMyProfilePhotos(int unum);

	public List<MoimDto> getMyMoimList(int unum);
	public List<Map<String, Object>> getMyJJImList(int unum);

	public List<JJimDto> getJJimDto(int unum);
	public List<Map<String, Object>> getGaipMoimList(int unum);	

	public void updateMainphoto(int photo_idx);
	
	public void updateOtherphoto(int unum);
	public String getSelectPhoto(int photo_idx);
	public void deletePhoto(int photo_idx);
	public int mypagePassCheck(Map<String, Object> map);
	public void updateMypage(UserDto dto);

	
}
