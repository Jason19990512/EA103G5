package com.lecture.model;

import java.sql.Timestamp;
import java.util.List;

import com.speaker.model.SpkrVO;

public class LecService {
	
	private LecDAO_Interface dao;
	
	public LecService() {
		dao = new LecDAO();
	}
	
	public LecVO addLec(String lecname, Integer lecprice, String spkrno, String roomno, 
			Timestamp lecstart, Timestamp lecend, Timestamp signstart, Timestamp signend, 
			String initseat, String currseat, byte[] lecinfo, byte[] lecpic) {
		
		LecVO lecVO = new LecVO();
		lecVO.setLecname(lecname);
		lecVO.setLecprice(lecprice);
		lecVO.setSpkrno(spkrno);
		lecVO.setRoomno(roomno);
		lecVO.setLecstart(lecstart);
		lecVO.setLecend(lecend);
		lecVO.setSignstart(signstart);
		lecVO.setSignend(signend);
		lecVO.setInitseat(initseat);
		lecVO.setCurrseat(currseat);
		lecVO.setLecinfo(lecinfo);
		lecVO.setLecpic(lecpic);
		dao.insert(lecVO);
		
		return lecVO;
	}
	
public LecVO updateLec(String lecno, String lecname, Integer lecprice, String spkrno, String roomno, Timestamp lecstart, Timestamp lecend, Timestamp signstart, Timestamp signend, String initseat, String currseat, Integer lecstatus, byte[] lecinfo) {
		
		LecVO lecVO = new LecVO();
		lecVO.setLecno(lecno);
		lecVO.setLecname(lecname);
		lecVO.setLecprice(lecprice);
		lecVO.setSpkrno(spkrno);
		lecVO.setRoomno(roomno);
		lecVO.setLecstart(lecstart);
		lecVO.setLecend(lecend);
		lecVO.setSignstart(signstart);
		lecVO.setSignend(signend);
		lecVO.setInitseat(initseat);
		lecVO.setCurrseat(currseat);
		lecVO.setLecstatus(lecstatus);
		lecVO.setLecinfo(lecinfo);
		dao.update(lecVO);
		
		return lecVO;
	}
	
	public LecVO getOne(String lecno){
		return dao.findByPK(lecno);
	}
	
	public List<LecVO> getList(){
		return dao.getAll();
	}
}
