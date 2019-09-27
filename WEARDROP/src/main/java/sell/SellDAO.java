package sell;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellDAO implements SellService {
	@Autowired private SqlSession sql;
	
	@Override
	public SellPage list(SellPage vo) {
		vo.setTotalList((Integer) sql.selectOne("sell.mapper.total", vo));
		List<SellVO> list = sql.selectList("sell.mapper.list", vo);
		vo.setList(list);
//		System.out.println(list);
		return vo;
// list 媛믪씠 �븞�삱�뼱�삱�떆 sql 臾몄젣?
// list 媛믪씠 �뱾�뼱�솓�뒗�뜲 異쒕젰�씠 �븞�맆�떆? 
	}
	
	@Override
	public List<SellVO> list() {
		return sql.selectList("sell.mapper.list");
	}
	
	@Override
	public List<SellVO> list(HashMap<String, String> map) {
		return sql.selectList("sell.mapper.list", map);
	}
	
	@Override
	public boolean insert(SellVO vo) {
		return sql.insert("sell.mapper.insert", vo) > 0 ? true : false;

	}

	@Override
	public SellVO detail(int id) {
		return sql.selectOne("sell.mapper.detail", id);
	}

	@Override
	public boolean update(SellVO vo) {
		return sql.update("sell.mapper.update", vo) > 0 ? true : false;
	}

	@Override
	public boolean delete(int id) {
		return sql.delete("sell.mapper.delete", id) > 0 ? true : false;
	}

	@Override
	public void read(int id) {
		sql.update("sell.mapper.read", id);
	}


	@Override
	public boolean comment_insert(HashMap<String, Object> map) {
		return sql.insert("sell.mapper.comment_insert", map)>0? true : false;
	}

	@Override
	public List<CommentVO> comment_list(int pid) {
		return sql.selectList("sell.mapper.comment_list", pid);
	}

	@Override
	public boolean comment_update(CommentVO vo) {
		return sql.update("sell.mapper.comment_update", vo)>0 ? true : false;
	}

	@Override
	public boolean comment_delete(int id) {
		return sql.delete("sell.mapper.comment_delete",id)>0 ? true : false;
	}

}
