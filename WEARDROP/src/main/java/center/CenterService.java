package center;

import java.util.HashMap;
import java.util.List;


public interface CenterService {
	boolean insert(CenterVO vo);
	boolean update(CenterVO vo);
	boolean delete(int id);
	CenterVO detail(int id);
	CenterPage list(CenterPage vo);
	
	List<CenterVO> list(HashMap<String, String> map);
	
	List<CenterVO> content(int pid);
	
	List<exVO> listex(HashMap<String, String> map);
	
	boolean insertex (HashMap map); //¾Èµå »ğÀÔ
	boolean deleteex(String id);

}
