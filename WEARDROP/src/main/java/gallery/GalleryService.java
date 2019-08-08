package gallery;

import java.util.HashMap;
import java.util.List;
import java.util.Map;





public interface GalleryService {
	List<GalleryVO> list(); //��ȸ
	List<GalleryVO> andlist(); //�ȵ���ȸ
	List<GalleryVO> list(HashMap<String, String> map);
	GalleryVO detail(int id); //��
	boolean insert(GalleryVO vo);//����
	boolean delete(int id); //������ �ߴ�, ���ߴ�.
	boolean update(GalleryVO vo); //������ �ߴ�, ���ߴ�.
	void read(int id);
	List<GalleryVO> test();
	boolean galUpdate();
	boolean andInsert(GalleryVO vo);
	//boolean andInsert(HashMap<String, Object> map);
}
