package com.semi.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.semi.dto.CbReBoardDto;
import com.semi.dto.CityBoardDto;
import com.semi.dto.UserDto;
import com.semi.mapper.CityMapper;

@Service
public class CityService implements CityServiceInter{
	
	@Autowired
	private CityMapper cityMapper;

	@Override
	public int getTotalCountCity(String city1, String city2) {
		// TODO Auto-generated method stub
		return cityMapper.getTotalCountCity(city1, city2);
	}


	@Override
	public CityBoardDto getDetailbycbnum(int cbnum) {
		// TODO Auto-generated method stub
		return cityMapper.getDetailbycbnum(cbnum);
	}

	@Override
	public UserDto getDetailbyunum(int unum) {
		// TODO Auto-generated method stub
		return cityMapper.getDetailbyunum(unum);
	}

	@Override
	public void insertCity(CityBoardDto dto) {
		// TODO Auto-generated method stub
		cityMapper.insertCity(dto);
	}

	@Override
	public List<CityBoardDto> getCityList(String city1, String city2) {
		// TODO Auto-generated method stub
		return cityMapper.getCityList(city1, city2);
	}
	
	@Override
	public String preContent(int num) {
		// TODO Auto-generated method stub
		return cityMapper.preContent(num);
	}

	@Override
	public String nxtContent(int num) {
		// TODO Auto-generated method stub
		return cityMapper.nxtContent(num);

	}

	@Override
	public String preNum(int num) {
		// TODO Auto-generated method stub
		return cityMapper.preNum(num);
	}

	@Override
	public String nxtNum(int num) {
		// TODO Auto-generated method stub
		return cityMapper.nxtNum(num);
	}

	@Override
	public void newComment(CbReBoardDto dto) {
		// TODO Auto-generated method stub
		cityMapper.newComment(dto);
	}

	@Override
	public int getTotalComment() {
		// TODO Auto-generated method stub
		return cityMapper.getTotalComment();
	}




}
