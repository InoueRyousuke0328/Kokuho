package tool;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//アクションで継承して使用する抽象クラス
public abstract class Action {
	//アクションでオーバーライドする抽象メソッド、
	//戻り値：String型（フォワード先のURL)
	public abstract String execute(
			HttpServletRequest request,HttpServletResponse response
			) throws Exception;
	
}
