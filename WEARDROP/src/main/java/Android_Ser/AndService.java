package Android_Ser;

import java.util.HashMap;
import java.util.List;

public interface AndService {

	List<AndGalleryVO> list(); //리스트 출력
	boolean galUpdate(); //이미지 경로 리플레이스
	boolean andInsert(HashMap map); //안드 삽입

}
