package tool;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import Bean.User;

public class UserSessionOutFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		//デバック用filterが呼び出された時の処理
		//System.out.println(1);
		//こっちでのinvalidateがうまくいかなかった理由→アノテーションとxmlで二重指定していた
		User us=(User)session.getAttribute("user");
		Integer count = (Integer) session.getAttribute("count");
	    session.invalidate();
	    session = req.getSession();
	    session.setAttribute("user",us);
	   // System.out.println(session.getAttribute("user"));//デバック用
	    session.setAttribute("count", count);
	   // System.out.println(session.getAttribute("count"));//デバック用
		
//invalidateがうまくいかないならこっち(こっちもinvalidateと同じようにfilterがtopを呼ぶ際にかかるようにしているとうまくいかないのは共通+二重指定もダメ)		
//		for(Enumeration<String> list=session.getAttributeNames(); list.hasMoreElements();) {
//			String a=list.nextElement();
 	//		if(a.equals("user")) {
				
//			}else {
//				session.removeAttribute(a);
//			}
//		}
		chain.doFilter(request, response);
		
		

	}
	public void init(FilterConfig filterConfig) {}
	public void destroy() {}


}