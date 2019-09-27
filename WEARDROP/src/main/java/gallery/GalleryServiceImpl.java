package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GalleryServiceImpl implements GalleryService {

	@Autowired // DAO
	private GalleryDAO dao;

	// 목록 출력
	@Override
	public List<GalleryVO> list() {
		return dao.list();
	}

	// 갤러리 상세
	@Override
	public GalleryVO detail(int id) {
		return dao.detail(id);
	}

	// 갤러리 삽입
	@Override
	public boolean insert(GalleryVO vo) {
		return dao.insert(vo);
	}

	// 조회수
	@Override
	public void read(int id) {
		dao.read(id);
	}

	// 삭제
	@Override
	public boolean delete(int id) {
		return dao.delete(id);
	}
	
	// 수정
	@Override
	public boolean update(GalleryVO vo) {
		return dao.update(vo);
	}
	
	// 검색
	@Override
	public List<GalleryVO> list(HashMap<String, String> map) {
		return dao.list(map);
	}
	
	// 페이징
	@Override
	public GalleryPage list(GalleryPage vo) {
		return dao.list(vo);
	}

	// 댓글 저장
	@Override
	public boolean comment_insert(HashMap<String, Object> map) {
		return dao.comment_insert(map);
	}
	
	// 댓글 조회
	@Override
	public List<Gallery_CommentVO> comment_list(int pid) {
		return dao.comment_list(pid);
	}

	// 댓글 수정
	@Override
	public boolean comment_update(Gallery_CommentVO vo) {
		return dao.comment_update(vo);
	}

	// 댓글 삭제
	@Override
	public boolean comment_delete(int id) {
		return dao.comment_delete(id);
	}

	// 잉여
	@Override
	public List<GalleryVO> test() {
		return dao.list();
	}

	// 안드로이드 --------------------------------------------------
	// 안드 목록
	@Override
	public List<GalleryVO> andlist() {
		return dao.andlist();
	}
	
	// (\ → /) 리플레이스
	@Override
	public boolean galUpdate() {
		return dao.galUpdate();
	}

	// 안드 삽입
	@Override
	public boolean andInsert(GalleryVO vo) {
		return dao.andInsert(vo);
	}

}
