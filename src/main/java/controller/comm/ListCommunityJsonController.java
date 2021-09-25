package controller.comm;

import java.io.PrintWriter;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.ObjectMapper;

import controller.Controller;
import controller.DispatcherServlet;
import model.Community;
import model.service.UserManager;

public class ListCommunityJsonController implements Controller {
	private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);

	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
        
    	UserManager manager = UserManager.getInstance();
		List<Community> commList = manager.findCommunityList();
		
    	ObjectMapper mapper = new ObjectMapper();
    	String jsonString = mapper.writeValueAsString(commList);
       	logger.debug("communityList in JSON : {}", jsonString);

    	response.setContentType("application/json;charset=utf-8");
    	PrintWriter out = response.getWriter();
    	out.println(jsonString);       	
    	
       	return null;
    }
}
