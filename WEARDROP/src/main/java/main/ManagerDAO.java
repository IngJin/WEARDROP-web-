package main;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAO implements ManagerService {
	@Autowired private SqlSession sql;

	@Override
	public List<MainVO> list() {
		return sql.selectList("manager.mapper.list");
	}

	@Override
	public void delete(String userid) {
		sql.delete("manager.mapper.delete", userid);
	}

}
