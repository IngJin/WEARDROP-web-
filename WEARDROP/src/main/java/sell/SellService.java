package sell;

import java.util.HashMap;
import java.util.List;

import javax.xml.stream.events.Comment;


public interface SellService {
	boolean insert(SellVO vo);// 삽입
	SellVO detail(int id); // 상세보기
	boolean update(SellVO vo); // 수정
	boolean delete(int id); // 삭제
	void read(int id); // 조회수
	List<SellVO> list(); // 메인화면
	List<SellVO> list(HashMap<String, String> map);
	SellPage list(SellPage vo); // 메인화면(페이지)
	
	boolean comment_insert(HashMap<String, Object> map);
	List<CommentVO> comment_list(int pid);
	boolean comment_update(CommentVO vo);
	boolean comment_delete(int id);
}
