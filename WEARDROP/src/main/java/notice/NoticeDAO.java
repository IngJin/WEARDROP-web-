package notice;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("dao")
public class NoticeDAO implements NoticeService {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(NoticeVO vo) {
		
		return sql.insert("notice.mapper.insert", vo)>0? true : false;
	}

	@Override
	public List<NoticeVO> list() {
		return sql.selectList("notice.mapper.list");
	}

	@Override
	public NoticeVO detail(int id) {
		return sql.selectOne("notice.mapper.detail",id);
		
	}

	@Override
	public boolean update(NoticeVO vo) {
		
		return sql.update("notice.mapper.update", vo)>0? true:false;//boolean 타입이기때문
	}

	@Override
	public boolean delete(int id) {
		
		return sql.delete("notice.mapper.delete", id)>0 ? true : false;
	}

	@Override
	public void read(int id) {
		sql.update("notice.mapper.read",id);
	}

	@Override
	public List<NoticeVO> list(HashMap<String, String> map) {
		return sql.selectList("notice.mapper.list", map);
		
	}

	@Override
	public NoticePage list(NoticePage vo) {
		//총목록수 조회 - 페이지정보의 total 필드에 담는다.
		vo.setTotalList((Integer)sql.selectOne("notice.mapper.total", vo));
		
		//총목록수에 따라 총페이지, 총블럭, 현재페이지에서의 글 시작/끝글, 시작/끝페이지번호
		//결정된 시작글 ~ 끝글에 해당하는 10건의 정보를 조회
		List<NoticeVO> list = sql.selectList("notice.mapper.list", vo);
		vo.setList(list);
		return vo;
	}
	
}
