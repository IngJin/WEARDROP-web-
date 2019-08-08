package center;

import java.util.List;

import org.springframework.stereotype.Component;

import common.pageVO;

@Component
public class CenterPage extends pageVO {
	List<CenterVO> list;
	
	public List<CenterVO> getList(){
		return list;
	}
	public void setList(List<CenterVO>list) {
		this.list = list;
	}

}
