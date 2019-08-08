package sell;

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

/*	@Override
	public List<SellVO> list() {
		return dao.list();
	}*/
	
	// 페이징처리와 함께 메인화면출력
	@Override
		public SellPage list(SellPage vo) {
			return dao.list(vo);
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
}
