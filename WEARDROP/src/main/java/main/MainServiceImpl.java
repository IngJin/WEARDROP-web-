package main;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class MainServiceImpl implements MainService {

	@Autowired private MainDAO dao;
	
	@Override
	public boolean id_check(String userid) {
		return dao.id_check(userid);
	}

	@Override
	public boolean insert(MainVO vo) {
		return dao.insert(vo);
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
		return dao.login(map);
	}

	@Override
	public List<TestVO> list() {
		return dao.list();
	}

	@Override
	public boolean email_check(String email) {
		return dao.email_check(email);
	}

	@Override
	public MainVO email_login(HashMap map) {
		return dao.email_login(map);
	}

}
