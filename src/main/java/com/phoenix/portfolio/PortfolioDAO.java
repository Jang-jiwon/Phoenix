package com.phoenix.portfolio;

import java.sql.Clob;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.phoenix.coverletter.dao.CoverletterDTO;
import com.phoenix.mybatis.SqlMapConfig;
import com.phoenix.resumes.ResumesDTO;

public class PortfolioDAO {
	SqlSessionFactory factory = SqlMapConfig.getFactory();
	SqlSession sqlsession;
	
	public PortfolioDAO() {
		sqlsession = factory.openSession(true);
	}
	
	public void makeDB(String userid) {
		sqlsession.insert("User.makeEmptyPofol", userid);
		
	}
	
	public boolean saveDB(PortfolioDTO portfolio) {
		boolean result = false ;
		int cnt = 0;
		cnt = sqlsession.selectOne("User.checkPortfolio", portfolio);
		if(cnt == 0) {
			if(sqlsession.insert("User.savePortfolio", portfolio) == 1) {
				result = true;
			}
		}else {
			if(sqlsession.update("User.updatePortfolio", portfolio) == 1) {
				result = true;
			}
		}
		
		
		
		return result;
	}
	
	
//	public void loadadd(String userid) {
//		
//		sqlsession.selectOne("User.makeemptyPofol", userid);
//		
//	}
	
	public PortfolioDTO loadDB2(String userid,String pnum) {
		PortfolioDTO Portfolios = new PortfolioDTO();
		Portfolios.setPnum(pnum);
		Portfolios.setUserid(userid);
		Portfolios = sqlsession.selectOne("User.loadPortfol", Portfolios);
		
		return Portfolios;
	}
	
	public PortfolioDTO[] loadDB(String userid) {
		 List<Map<String, Object>> result = sqlsession.selectList("User.loadPortfolios",userid);
		 //{PNUM=100, USERID=admin, PPATH=/path/to/file, PURL=http://example.com, PTITLE=Portfolio Title, PCONTENTS=oracle.sql.CLOB@d2450a}
		 PortfolioDTO[] portfolios = new PortfolioDTO[result.size()];
		 
//		 System.out.println("=====================coverletter==================");
			for(int i=0;i<portfolios.length;i++) {
				portfolios[i] = new PortfolioDTO();
				portfolios[i].setPnum((String) result.get(i).get("pnum"));
				portfolios[i].setUserid(userid);
				portfolios[i].setPpath((String) result.get(i).get("ppath"));
				portfolios[i].setPurl((String) result.get(i).get("purl"));
				portfolios[i].setPtitle((String) result.get(i).get("ptitle"));
				portfolios[i].setPcontents((String) result.get(i).get("pcontents"));
			}
		
		return portfolios;
	}
	
}
