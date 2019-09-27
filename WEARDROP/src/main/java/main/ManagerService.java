package main;

import java.util.List;

public interface ManagerService {
	List<MainVO> list();	// 조회 : read
	void delete(String userid);		// 삭제 : delete
}
