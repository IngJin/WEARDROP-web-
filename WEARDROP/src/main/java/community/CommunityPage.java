package community;

import java.util.List;

import org.springframework.stereotype.Component;

import common.pageVO;

@Component
public class CommunityPage extends pageVO{
	private int code;
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}
	
	List<CommunityVO> list;

	public List<CommunityVO> getList() {
		return list;
	}

	public void setList(List<CommunityVO> list) {
		this.list = list;
	}
}