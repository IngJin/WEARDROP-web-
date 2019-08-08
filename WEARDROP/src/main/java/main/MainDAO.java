package main;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class MainDAO implements MainService {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean id_check(String userid) {
		return (Integer)sql.selectOne("main.mapper.id_check", userid) > 0 ? false : true;
	}

	@Override
	public boolean insert(MainVO vo) {
		return sql.insert("main.mapper.insert", vo) > 0 ? true : false;
	}

	@Override
	public boolean update(MainVO vo) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(String userid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public MainVO login(HashMap map) {
		return sql.selectOne("main.mapper.login", map);
	}

	@Override
	public List<TestVO> list() {
		return sql.selectList("android.mapper.list");
	}

	@Override
	public boolean email_check(String email) {
		return (Integer)sql.selectOne("main.mapper.email_check", email) > 0 ? false : true;
	}

	@Override
	public MainVO email_login(HashMap map) {
		return sql.selectOne("main.mapper.email_login", map);
	}

}
