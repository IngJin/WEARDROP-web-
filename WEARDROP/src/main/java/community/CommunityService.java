package community;

import java.util.HashMap;
import java.util.List;

public interface CommunityService {
	boolean insert(CommunityVO vo);	//����		
	List<CommunityVO> list();		//��ȸ
	CommunityVO detail(int id);		//��ȸ
	boolean update(CommunityVO vo);	//����
	boolean delete(int id);			//����
	void read(int id);				//��ȸ��
	void like(int id);				//��õ��
	CommunityPage list(CommunityPage vo);		//������
	List<CommunityVO> test();
	List<CommunityVO> and_list();		//��ȸ(�ȵ�)
	List<CommunityVO> and_list2();		//��ȸ(�ȵ�)
	boolean and_insert(HashMap map);	//����(�ȵ�)
	boolean and_delete(HashMap map);	//����(�ȵ�)
	boolean and_update(HashMap map);	//����(�ȵ�)
}
