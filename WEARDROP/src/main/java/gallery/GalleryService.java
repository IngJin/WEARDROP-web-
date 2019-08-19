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

	List<GalleryVO> test();

	boolean galUpdate(); // 리플레이스

	boolean andInsert(GalleryVO vo); // 안드 삽입
	// boolean andInsert(HashMap<String, Object> map);
	
	GalleryPage list(GalleryPage vo);
}
