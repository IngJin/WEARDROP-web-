package Android_Ser;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import common.CommonService;

@Repository
public class AndGalleryDAO implements AndService {

	@Autowired private SqlSession sql;
	@Autowired private CommonService common;
	
	@Override
	public List<AndGalleryVO> list() {
		 return sql.selectList("And.mapper.list");
	}

	@Override
	public boolean galUpdate() {
		 return sql.update("And.mapper.galupdate") > 0 ? true : false;
	}

	@Override
	public boolean andInsert(HashMap map) {
		 return sql.insert("And.mapper.andInsert", map) > 0 ? true : false;
	}

}
