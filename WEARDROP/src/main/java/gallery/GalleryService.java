package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


public interface GalleryService {
	List<GalleryVO> list(); // 출력

	List<GalleryVO> andlist(); // 안드 출력

	List<GalleryVO> list(HashMap<String, String> map); //검색

	GalleryVO detail(int id); // 상세

	boolean insert(GalleryVO vo);// 삽입

	boolean delete(int id); // 삭제

	boolean update(GalleryVO vo); // 수정

	void read(int id); //조회수
	
	//답글
	boolean comment_insert(HashMap<String, Object> map); // 댓글 저장
	List<Gallery_CommentVO> comment_list(int pid); // 댓글 조회 
	boolean comment_update(Gallery_CommentVO vo); // 댓글 수정
	boolean comment_delete(int id); // 댓글 삭제
	
	//페이징
	GalleryPage list(GalleryPage vo);

	List<GalleryVO> test(); // 잉여
	
	// 안드로이드 ---------------------------------------------
	boolean galUpdate(); // (\ → /) 리플레이스

	boolean andInsert(GalleryVO vo); // 안드 삽입
	// boolean andInsert(HashMap<String, Object> map);
	
	
}
