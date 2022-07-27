package com.payalot.enjoyforott.notice.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.payalot.enjoyforott.admin.model.vo.Report;
import com.payalot.enjoyforott.common.model.vo.PageInfo;
import com.payalot.enjoyforott.notice.model.vo.Board;
import com.payalot.enjoyforott.user.model.vo.User;

@Repository
public class NoticeDao {

	//공지사항 작성
	public int insertNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertNotice",b);
	}

	//공지사항 개수
	public int selectNoticeListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectNoticeListCount");
	}

	public ArrayList<Board> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		//Rowbounds 설정
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectNoticeList",null,rowBounds);
	}

	public int increaseNoticeCount(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount",boardNo);
	}

	public Board noticeDetailView(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.selectOne("boardMapper.noticeDetailView",boardNo);
	}

	public int updateNotice(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateNotice",b);
	}

	public int deleteNotice(SqlSessionTemplate sqlSession, int[] boardNo) {
		int result=0;
		for(int i=0;i<boardNo.length;i++) {
			result=sqlSession.delete("boardMapper.deleteNotice",boardNo[i]);
		}
		return result;
	}

	public int searchNoticeTitleList(SqlSessionTemplate sqlSession,String search) {
		return sqlSession.selectOne("boardMapper.searchNoticeTitleList",search);
	}
	
	public int searchNoticeContent(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("boardMapper.searchNoticeContentList",search);
	}

	public ArrayList<Board> searchNoticeTitle(SqlSessionTemplate sqlSession, String search, PageInfo pi) {
		
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchTitle",search,rowBounds);
	}
	
	public ArrayList<Board> searchNoticeContent(SqlSessionTemplate sqlSession, String search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectSearchContent",search,rowBounds);
	}

	public int selectFaqListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectFaqListCount");
	}
	
	public ArrayList<Board> selectfaqList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectFaqList",null,rowBounds);
	}

	public int insertFaq(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertFaq",b);
	}

	public int increaseFaq(SqlSessionTemplate sqlSession, int boardNo) {
		return sqlSession.update("boardMapper.increaseCount",boardNo);
	}

	public int searchFaqTitleList(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("boardMapper.searchFaqTitleList",search);
	}

	public int searchFaqContent(SqlSessionTemplate sqlSession, String search) {
		return sqlSession.selectOne("boardMapper.searchFaqContentList",search);
	}

	public ArrayList<Board> searchFaqTitle(SqlSessionTemplate sqlSession, String search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectFaqSearchTitle",search,rowBounds);
	}

	public ArrayList<Board> searchFaqContent(SqlSessionTemplate sqlSession, String search, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("boardMapper.selectFaqSearchContent",search,rowBounds);
	}

	public User selectAdmin(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("boardMapper.selectAdmin",userId);
	}

	public int adminInfoUpdate(SqlSessionTemplate sqlSession, User u) {
		return sqlSession.update("boardMapper.adminInfoUpdate",u);
	}

	public int reportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.reportListCount");
	}

	public ArrayList<Report> reportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		return (ArrayList)sqlSession.selectList("boardMapper.reportList",null,rowBounds);
	}

	public Report selectReport(SqlSessionTemplate sqlSession, int num) {
		return sqlSession.selectOne("boardMapper.selectReport",num);
	}

	public int reportAccept(SqlSessionTemplate sqlSession, int declarationNo) {
		return sqlSession.update("boardMapper.reportAccept",declarationNo);
	}

	public int minusPoint(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("boardMapper.minusPoint",userId);
	}

	public int reportCan(SqlSessionTemplate sqlSession, int declarationNo) {
		return sqlSession.update("boardMapper.reportCan",declarationNo);
	}

	public int plusPoint(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.update("boardMapper.plusPoint",userId);
	}


}
