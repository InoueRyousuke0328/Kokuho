package tool;

import java.io.IOException;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;


// bookアプリケーションの全ファイルにフィルタを適用
@WebFilter(urlPatterns = {"/*"})
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		//try {
		request.setCharacterEncoding("UTF-8");
		
		// 出力(レスポンス)を全てhtml形式(UTF-8)でレスポンスします。
		// →cssが読み込まれず、適用されなくなる。
		//response.setContentType("text/html; charset=UTF-8");
		
		// 総合製作実習では上のコードを消して、下のコードを書く
		 response.setCharacterEncoding("UTF-8");
		
//		System.out.println("フィルタの前処理");
		
		chain.doFilter(request, response);
		
//		System.out.println("フィルタの後処理");
		//}catch(Exception e) {
			//e.printStackTrace();
		//}
	}
	
	@Override
	public void init(FilterConfig filterConfig) { }
	@Override
	public void destroy() { }
}
