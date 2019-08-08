package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GalleryDAO implements GalleryService {

	@Autowired
	private SqlSession sql;

	@Override
	public List<GalleryVO> list() {
		return sql.selectList("gallery.mapper.list");
	}

	@Override
	public GalleryVO detail(int id) {
		return sql.selectOne("gallery.mapper.detail", id);
	}

	@Override
	public boolean insert(GalleryVO vo) {
		return sql.insert("gallery.mapper.insert", vo) > 0 ? true : false;
	}

	@Override
	public void read(int id) {
		sql.update("gallery.mapper.read", id);
	}

	@Override
	public List<GalleryVO> test() {
		return sql.selectList("gallery.mapper.list");
	}

	@Override
	public boolean galUpdate() {
		return sql.update("gallery.mapper.galupdate") > 0 ? true : false;
	}

	@Override
	public boolean andInsert(GalleryVO vo) {
		return sql.insert("gallery.mapper.andInsert", vo) > 0 ? true : false;
	}

	@Override
	public boolean delete(int id) {
		return sql.delete("gallery.mapper.delete", id) > 0 ? true : false;
	}

	@Override
	public boolean update(GalleryVO vo) {
		return sql.update("gallery.mapper.update", vo) > 0 ? true : false;// boolean 타입이기 때문
	}

	@Override
	public List<GalleryVO> list(HashMap<String, String> map) {
		return sql.selectList("gallery.mapper.list", map);
	}
	
	@Override
	public List<GalleryVO> andlist() {
		return sql.selectList("gallery.mapper.andlist");
	}
}
