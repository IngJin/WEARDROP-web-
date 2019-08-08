package sell;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("sellDAO")
public class SellDAO implements SellService{
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(SellVO vo) {
		return sql.insert("sell.mapper.insert",vo)>0? true : false;
		
	}

	@Override
	public SellVO detail(int id) {
		return sql.selectOne("sell.mapper.detail", id);
	}

	@Override
	public boolean update(SellVO vo) {
		return sql.update("sell.mapper.update",vo)>0 ? true: false;
	}

	@Override
	public boolean delete(int id) {
		return sql.delete("sell.mapper.delete", id)>0 ? true: false;
	}
	
	@Override
	public void read(int id) {
		sql.update("sell.mapper.read", id);
	}
	
	@Override
	public SellPage list(SellPage vo) {
		vo.setTotalList((Integer)sql.selectOne("sell.mapper.total", vo));
		List<SellVO> list = sql.selectList("sell.mapper.list", vo);
		vo.setList(list);
		System.out.println(list);
		return vo;
		// list 媛믪씠 �븞�삱�뼱�삱�떆 sql 臾몄젣?
		// list 媛믪씠 �뱾�뼱�솓�뒗�뜲 異쒕젰�씠 �븞�맆�떆? 
	}
}
