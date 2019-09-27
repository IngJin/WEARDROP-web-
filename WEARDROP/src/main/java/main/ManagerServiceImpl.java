package main;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired private ManagerDAO dao;

	@Override
	public List<MainVO> list() {
		return dao.list();
	}

	@Override
	public void delete(String userid) {		
		dao.delete(userid);
	}

}
