package community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired private CommunityService dao;
	
	@Override
	public boolean insert(CommunityVO vo) {
		return dao.insert(vo);
	}

	@Override
	public List<CommunityVO> list() {				
		return dao.list();
	}

	@Override
	public CommunityVO detail(int id) {
		return dao.detail(id);
	}

	@Override
	public boolean update(CommunityVO vo) {
		return dao.update(vo);
	}

	@Override
	public boolean delete(int id) {
		return dao.delete(id);
	}

	@Override
	public void read(int id) {
		dao.read(id);
	}

	@Override
	public void like(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CommunityVO> test() {
		return dao.list();
	}

	@Override
	public List<CommunityVO> and_list() {
		return dao.and_list();
	}

	@Override
	public List<CommunityVO> and_list2() {
		return dao.and_list2();
	}

	@Override
	public boolean and_insert(CommunityVO vo) {
		return dao.and_insert(vo);
	}

	@Override
	public CommunityPage list(CommunityPage vo) {
		return dao.list(vo);
	}

	@Override
	public boolean and_delete(HashMap map) {
		return dao.and_delete(map);
	}

	@Override
	public boolean and_update(HashMap map) {
		return dao.and_update(map);
	}

	@Override
	public List<CommunityVO> list(HashMap<String, String> map) {
		return dao.list(map);
	}

	@Override
	public boolean comment_insert(HashMap<String, Object> map) {
		return dao.comment_insert(map);
	}

	@Override
	public List<CommentVO> comment_list(int pid) {
		return dao.comment_list(pid);
	}

	@Override
	public boolean comment_update(CommentVO vo) {
		return dao.comment_update(vo);
	}

	@Override
	public boolean comment_delete(int id) {
		return dao.comment_delete(id);
	}
}
