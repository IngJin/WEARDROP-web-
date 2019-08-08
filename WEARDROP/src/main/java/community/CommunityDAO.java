package community;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommunityDAO implements CommunityService {
	@Autowired
	private SqlSession sql;

	@Override
	public boolean insert(CommunityVO vo) {
		return sql.insert("community.mapper.insert", vo) > 0 ? true : false;
	}

	@Override
	public List<CommunityVO> list() {
		return sql.selectList("community.mapper.list");
	}

	@Override
	public CommunityVO detail(int id) {
		return sql.selectOne("community.mapper.detail", id);
	}

	@Override
	public boolean update(CommunityVO vo) {
		return sql.update("community.mapper.update", vo) > 0 ? true : false;

	}

	@Override
	public boolean delete(int id) {
		return sql.delete("community.mapper.delete", id) > 0 ? true : false;
	}

	@Override
	public void read(int id) {
		sql.update("community.mapper.read", id);
	}

	@Override
	public void like(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CommunityVO> test() {
		return sql.selectList("community.mapper.list");
	}

	@Override // �ȵ���̵�
	public List<CommunityVO> and_list() {
		return sql.selectList("andcomm.mapper.list");
	}

	@Override // �ȵ���̵�
	public List<CommunityVO> and_list2() {
		return sql.selectList("andcomm.mapper.list2");
	}

	@Override
	public boolean and_insert(HashMap map) {
		System.out.println("DAO ����");
		return sql.insert("andcomm.mapper.insert", map) > 0 ? true : false;
	}

	@Override
	public CommunityPage list(CommunityPage vo) {
		// �� ��� �� ��ȸ - ������������ totalList �ʵ忡 ���
		vo.setTotalList((Integer) sql.selectOne("community.mapper.total", vo));
		// �� ��ϼ��� ���� �� ������, �� ��, ���������������� ����/�� ��, ����/�� ��������ȣ ����
		List<CommunityVO> list = sql.selectList("community.mapper.list", vo);
		vo.setList(list);
		return vo;
	}

	@Override
	public boolean and_delete(HashMap map) {
		return sql.delete("andcomm.mapper.delete", map) > 0 ? true : false;
	}

	@Override
	public boolean and_update(HashMap map) {
		return sql.update("andcomm.mapper.update", map) > 0 ? true : false;
	}

}
