package notice;

import java.util.List;

import org.springframework.stereotype.Component;

import common.pageVO;

@Component

public class NoticePage extends pageVO {
	List<NoticeVO> list;
	
	public List<NoticeVO> getList(){
		return list;
	}
	
	public void setList(List<NoticeVO> list) {
		this.list = list;
	}
}
