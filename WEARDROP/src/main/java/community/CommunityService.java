package community;

import java.util.HashMap;
import java.util.List;

public interface CommunityService {
	boolean insert(CommunityVO vo);	//저장		
	List<CommunityVO> list();		//조회
	CommunityVO detail(int id);		//조회
	boolean update(CommunityVO vo);	//변경
	boolean delete(int id);			//삭제
	void read(int id);				//조회수
	void like(int id);				//추천수
	CommunityPage list(CommunityPage vo);		//페이지
	List<CommunityVO> test();
	List<CommunityVO> and_list();		//조회(안드)
	List<CommunityVO> and_list2();		//조회(안드)
	boolean and_insert(HashMap map);	//삽입(안드)
	boolean and_delete(HashMap map);	//삭제(안드)
	boolean and_update(HashMap map);	//수정(안드)
}
