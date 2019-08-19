package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GalleryServiceImpl implements GalleryService {
	
	@Autowired private GalleryDAO dao;
	
	@Override
	public List<GalleryVO> list() {
		return dao.list();
	}

	@Override
	public GalleryVO detail(int id) {
		return dao.detail(id);
	}
	
	@Override
	public boolean insert(GalleryVO vo) {
		return dao.insert(vo);
	}
	
	@Override
	public void read(int id) {
		dao.read(id);
	}
	
	@Override
	public List<GalleryVO> test() {
		return dao.list();
	}
	
	@Override
	public boolean delete(int id) {
		return dao.delete(id);
	}

	@Override
	public boolean galUpdate() {
		return dao.galUpdate();
	}
	
	@Override
	public boolean andInsert(GalleryVO vo) {
		return dao.andInsert(vo);
	}
	
	@Override
	public boolean update(GalleryVO vo) {
		return dao.update(vo);
	}
	
	@Override
	public List<GalleryVO> list(HashMap<String, String> map) {
		return dao.list(map);
	}
	
	@Override
	public List<GalleryVO> andlist() {
		return dao.andlist();
	}
	
	//0816
	@Override
	public GalleryPage list(GalleryPage vo) {
		return dao.list(vo);
	}
}
