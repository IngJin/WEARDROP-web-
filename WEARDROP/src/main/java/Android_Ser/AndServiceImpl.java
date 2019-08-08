package Android_Ser;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("service")
public class AndServiceImpl implements AndService {

	@Autowired private AndGalleryDAO dao;
	
	@Override
	public List<AndGalleryVO> list() {
		 return dao.list();
	}

	@Override
	public boolean galUpdate() {
		 return dao.galUpdate();
	}
	@Override
	public boolean andInsert(HashMap map) {
		 return dao.andInsert(map);
	}

}
