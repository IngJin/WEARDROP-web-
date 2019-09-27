package hugi;

import java.util.HashMap;
import java.util.List;

import community.CommentVO;

public interface HugiService {
	boolean insert(HugiVO vo);		//저장
	List<HugiVO> list();			//조회
	List<HugiVO> list(HashMap<String, String> map);
	HugiVO detail(int id);			//상세조회
	boolean update(HugiVO vo);		//변경
	boolean delete(int id);			//삭제
	void read(int id);				//조회수
	boolean comment_insert(HashMap<String, Object> map);	//댓글저장
	List<CommentVO> comment_list(int pid);		//댓글조회
	boolean comment_update(CommentVO vo);		//댓글변경
	boolean comment_delete(int id);				//댓글삭제
}
