package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GalleryDAO implements GalleryService {

	@Autowired // SQL
	private SqlSession sql;

	// 리스트 출력
	@Override
	public List<GalleryVO> list() {
		return sql.selectList("gallery.mapper.list");
	}

	// 갤러리 상세
	@Override
	public GalleryVO detail(int id) {
		return sql.selectOne("gallery.mapper.detail", id);
	}

	// 갤러리 삽입
	@Override
	public boolean insert(GalleryVO vo) {
		return sql.insert("gallery.mapper.insert", vo) > 0 ? true : false;
	}

	// 갤러리 조회수
	@Override
	public void read(int id) {
		sql.update("gallery.mapper.read", id);
	}

	// 테스트 (마지막에 삭제할거임)
	@Override
	public List<GalleryVO> test() {
		return sql.selectList("gallery.mapper.list");
	}

	// 갤러리 삭제
	@Override
	public boolean delete(int id) {
		return sql.delete("gallery.mapper.delete", id) > 0 ? true : false;
	}

	// 갤러리 수정
	@Override
	public boolean update(GalleryVO vo) {
		return sql.update("gallery.mapper.update", vo) > 0 ? true : false;// boolean Ÿ���̱� ����
	}

	// 검색 리스트 조회
	@Override
	public List<GalleryVO> list(HashMap<String, String> map) {
		return sql.selectList("gallery.mapper.list", map);
	}

	// 갤러리 댓글 저장
	@Override
	public boolean comment_insert(HashMap<String, Object> map) {
		return sql.insert("gallery.mapper.comment_insert", map) > 0 ? true : false;
	}

	// 갤러리 댓글 조회
	@Override
	public List<Gallery_CommentVO> comment_list(int pid) {
		return sql.selectList("gallery.mapper.comment_list", pid);
	}

	// 갤러리 댓글 수정
	@Override
	public boolean comment_update(Gallery_CommentVO vo) {
		return sql.update("gallery.mapper.comment_update", vo) > 0 ? true : false;
	}

	// 갤러리 댓글 삭제
	@Override
	public boolean comment_delete(int id) {
		return sql.delete("gallery.mapper.comment_delete", id) > 0 ? true : false;
	}
	
	// 페이징
	@Override
	public GalleryPage list(GalleryPage vo) {
		vo.setTotalList((Integer) sql.selectOne("gallery.mapper.total", vo));
		List<GalleryVO> list = sql.selectList("gallery.mapper.list", vo);
		vo.setList(list);
		return vo;
	}

	// 안드로이드 --------------------------------------------------------------
	// 안드로이드 갤러리 리스트
	@Override
	public List<GalleryVO> andlist() {
		return sql.selectList("gallery.mapper.andlist");
	}

	// 루트(\)를 /로 바꾸는 쿼리
	@Override
	public boolean galUpdate() {
		return sql.update("gallery.mapper.galupdate") > 0 ? true : false;
	}

	// 안드로이드 삽입
	@Override
	public boolean andInsert(GalleryVO vo) {
		return sql.insert("gallery.mapper.andInsert", vo) > 0 ? true : false;
	}
}
