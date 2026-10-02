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

//@WebFilter (urlPatterns={"/user/*","/review/*"})

public class UserLoginFilter implements Filter{


	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)throws IOException ,ServletException{
		HttpServletRequest req=(HttpServletRequest)request;
		HttpServletResponse res=(HttpServletResponse)response;
		//uriの取得
		String uri=req.getRequestURI();
		//フィルターを通さないuriを列挙し、それ以外ならフィルターが適用するようにする
		if(uri.endsWith("/user/index.jsp")||uri.endsWith("/user/user-delete-complete.jsp")||uri.endsWith("/user/user-header.jsp")||uri.endsWith("/user/user-insert.jsp")||
				uri.endsWith("/user/user-insert-check.jsp")||uri.endsWith("/user/user-insert-complete.jsp")||uri.endsWith("/user/userLogin.jsp")
				||uri.endsWith("/user/userLogout-out.jsp")||uri.endsWith("/user/Media.action")||uri.endsWith("/review/ReviewGet.action")||uri.endsWith("/user/UserLogin.action")
				||uri.endsWith("/user/UserInsert.action")||uri.endsWith("/user/UserInsertConfirm.action")||uri.endsWith("/user/Media2.action")||uri.endsWith("/user/Index.action")) {
			System.out.println("user session filter");
			chain.doFilter(request, response);


		}else {

			HttpSession session=req.getSession();

			if (session.getAttribute("user")!=null) {
				System.out.println("user session in");
				chain.doFilter (request,response);
				

			}else {
				System.out.println("user session out");
				//nullの場合ログインエラー－ページに
				RequestDispatcher dispatcher=request.getRequestDispatcher("../error/user-logout-error.jsp");
				dispatcher.forward(request,response);
			}
		}

	}



	public void init(FilterConfig filterConfig) {}
	public void destroy() {}

}


