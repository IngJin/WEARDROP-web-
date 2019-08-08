package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;





public interface GalleryService {
	List<GalleryVO> list(); //조회
	List<GalleryVO> andlist(); //안드조회
	List<GalleryVO> list(HashMap<String, String> map);
	GalleryVO detail(int id); //상세
	boolean insert(GalleryVO vo);//삽입
	boolean delete(int id); //삭제를 했다, 안했다.
	boolean update(GalleryVO vo); //변경을 했다, 안했다.
	void read(int id);
	List<GalleryVO> test();
	boolean galUpdate();
	boolean andInsert(GalleryVO vo);
	//boolean andInsert(HashMap<String, Object> map);
}
