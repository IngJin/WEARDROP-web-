package sell;

import java.util.List;


public interface SellService {
	boolean insert(SellVO vo);// 삽입
//	List<SellVO> list(); // 메인화면
	SellVO detail(int id); // 상세보기
	boolean update(SellVO vo); // 수정
	boolean delete(int id); // 삭제
	SellPage list(SellPage vo); // 메인화면(페이지)
	void read(int id); // 조회수
}
