package tool;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
//xmlで書いているとアノテーションでも指定すると二重になることも
//@WebFilter (urlPatterns={"/admin/*"})
public class  AdminLoginFilter implements Filter{
	
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException ,ServletException{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		//uriの取得
		String uri=req.getRequestURI();
		//フィルターを通さないuriを列挙し、それ以外ならフィルターが適用するようにする
		if(uri.endsWith("/admin/AdminLogin.action")||uri.endsWith("/admin/AdminLogout.action")||uri.endsWith("/admin/admin-header.jsp")||uri.endsWith("/admin/adminLogin.jsp")||
				uri.endsWith("/admin/admin-logout-in.jsp")||uri.endsWith("/admin/admin-logout-out.jsp")) {
			System.out.println("とおってません");
			chain.doFilter(request, response);
			//デバック用(filterがかかった後の処理
			
			return;
		}
		//sessionの開始
		HttpSession session=req.getSession();
		//sessionのadmmin属性をチェック
		if (session.getAttribute("admin")!=null) {
			System.out.println("通ってます");
			chain.doFilter (request,response);
			//デバック用
			
			return ;
		}
			//nullの場合ログインエラーページに 
			RequestDispatcher dispatcher=request.getRequestDispatcher("../error/adminLogin-error.jsp");
			dispatcher.forward(request,response);
		}
	  
	
	public void init(FilterConfig filterConfig) {}
	public void destroy() {}

}
