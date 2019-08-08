package common;

import java.util.ArrayList;
import java.util.HashMap;

public interface DataService {
	String xml_list( StringBuilder url );
	ArrayList<HashMap<String, Object>> json_list( StringBuilder url );
}
