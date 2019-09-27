package community;

import java.util.HashMap;
import java.util.List;

import community.CommentVO;

public interface CommunityService {
	boolean insert(CommunityVO vo);	//저장		
	List<CommunityVO> list();		//조회
	List<CommunityVO> list(HashMap<String, String> map);
	CommunityVO detail(int id);		//조회
	boolean update(CommunityVO vo);	//변경
	boolean delete(int id);			//삭제
	void read(int id);				//조회수
	void like(int id);				//추천수
	CommunityPage list(CommunityPage vo);		//페이지
	boolean comment_insert(HashMap<String, Object> map);	//댓글
	List<CommentVO> comment_list(int pid);		//댓글조회
	boolean comment_update(CommentVO vo);		//댓글변경
	boolean comment_delete(int id);				//댓글삭제
	List<CommunityVO> test();
	List<CommunityVO> and_list();		//조회(안드)
	List<CommunityVO> and_list2();		//조회(안드)
	boolean and_insert(CommunityVO vo);	//삽입(안드)
	boolean and_delete(HashMap map);	//삭제(안드)
	boolean and_update(HashMap map);	//수정(안드)



}
