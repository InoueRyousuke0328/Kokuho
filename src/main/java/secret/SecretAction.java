package secret;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import tool.Action;

public class SecretAction extends Action {

    @Override
    public String execute(
            HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        

       
        //今日の日付
        LocalDate today = LocalDate.now();

        //再入所日
        LocalDate limitDate = LocalDate.of(2028, 1, 10);

        //残り日数を計算
        long days =
                ChronoUnit.DAYS.between(today, limitDate);

        //期限当日または期限を過ぎている場合
        if (days <= 0) {
            return "../secret/secret-complete.jsp";
        }

        //残り日数がある場合
        request.setAttribute("days", days);

        return "../secret/secret-work.jsp";
    }
}