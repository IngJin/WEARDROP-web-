package sell;
import java.util.List;

import org.springframework.stereotype.Component;

import common.pageVO;

@Component
public class SellPage extends pageVO {
	List<SellVO> list;
	
	public List<SellVO> getList() {
		return list;
	}
	
	public void setList(List<SellVO> list) {
	this.list = list;
	}
	
}
