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

import Bean.Admin;
//xmlで指定している
//@WebFilter (urlPatterns={"/admin/admin-index.jsp"})
public class AdminSessionOutFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		//デバック用filterが呼び出された時の処理
		//System.out.println(1);

		//invalidateがうまくいかなかった理由→filterのかかる範囲or同一filterを二度呼ぶ
		Admin ado=(Admin)session.getAttribute("admin");//半端ならKO

	    session.invalidate();
	    session = req.getSession();
	    session.setAttribute("admin",ado);
		
//invalidateがうまくいかないならこっち(こっちもinvalidateと同じようにfilterがtopを呼ぶ際にかかるようにしているとうまくいかないのは共通)		
//		for(Enumeration<String> list=session.getAttributeNames(); list.hasMoreElements();) {
//			String a=list.nextElement();
//      		if(a.equals("admin")) {
//				
//			}else {
//				session.removeAttribute(a);
//			}
//		}
		chain.doFilter(request, response);
		

	}
	public void init(FilterConfig filterConfig) {}
	public void destroy() {}


}
