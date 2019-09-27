package sell;

import java.util.HashMap;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellServiceImpl implements SellService {
	@Autowired SellDAO dao;
//	@Resource(name="dao") private SellService dao;
	
	@Override
	public boolean insert(SellVO vo) {
		return dao.insert(vo);
	}

	// 페이징처리와 함께 메인화면출력
	@Override
	public SellPage list(SellPage vo) {
			return dao.list(vo);
	}
	
	// 메인
	@Override
	public List<SellVO> list() {
		return dao.list();
	}
	// 메인2(검색)
	@Override
	public List<SellVO> list(HashMap<String, String> map) {
		return dao.list(map);
	}
	
	// 상세화면
	@Override
	public SellVO detail(int id) {
		return dao.detail(id);
	}

	@Override
	public boolean update(SellVO vo) {
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
