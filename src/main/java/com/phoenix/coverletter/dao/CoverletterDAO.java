package com.phoenix.coverletter.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.phoenix.mybatis.SqlMapConfig;

public class CoverletterDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public CoverletterDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public CoverletterDTO[] loadDB(CoverletterDTO coverletter) {
		
//		coverletter = sqlsession.selectOne("User.loadCoverLetter",coverletter);
		 List<Map<String, Object>> result = sqlsession.selectList("User.loadCoverLetter",coverletter);
		//[{CTITLE=test, CCONTENTS=test, USERID=test1, CNUM=tb_1}, {CTITLE=test2, CCONTENTS=test2, USERID=test1, CNUM=tb_2}]

		 CoverletterDTO[] coverletterArray = new CoverletterDTO[result.size()];
		 
		for(int i=0;i<result.size();i++) {
			coverletterArray[i] = new CoverletterDTO();
			coverletterArray[i].setCcontents((String) result.get(i).get("CCONTENTS"));
			coverletterArray[i].setCtitle((String) result.get(i).get("CTITLE"));
			coverletterArray[i].setCnum((String) result.get(i).get("CNUM"));
			coverletterArray[i].setUserid((String) result.get(i).get("USERID"));
		}
		
		return coverletterArray;
	}
	
	public int getCLlen(CoverletterDTO coverletter) {
		int len = 0;
		len = sqlsession.selectOne("User.checkCoverLetterLen",coverletter);
		
		return len;
	}
	
	public int saveCL(CoverletterDTO coverletter) {
		try {
			if(coverletter.getCnum().startsWith("new_")) {	//새데이터 삽입
				sqlsession.insert("User.savecl", coverletter);
				int newCnum = sqlsession.selectOne("getNewCLID", coverletter.getUserid());
				System.out.println("결과 : "+newCnum);
				return newCnum;
			}else {	//기존 데이터 수정
				sqlsession.update("User.updateCoverLetter", coverletter);
				return 0;//성공
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
			return -1;//실패
		}
	}
	
	public boolean delCL(CoverletterDTO dto) {
		try {
			sqlsession.delete("User.delCoverLetter",dto);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}
	
	
}
