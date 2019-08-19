package gallery;

import java.util.List;

import org.springframework.stereotype.Component;

import common.Gallery_PageVO;

@Component

public class GalleryPage extends Gallery_PageVO {
	List<GalleryVO> list;
	
	public List<GalleryVO> getList(){
		return list;
	}
	
	public void setList(List<GalleryVO> list) {
		this.list = list;
	}
}
