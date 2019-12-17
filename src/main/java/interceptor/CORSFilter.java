package interceptor;

import javax.servlet.*;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// 拦截器 跨域CROSFilter 访问控制
public class CORSFilter implements Filter {
    public void init(FilterConfig filterConfig) throws ServletException {

    }
    // 调用servlet doFilter 控制
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain) throws IOException, ServletException {

        HttpServletResponse response= (HttpServletResponse) servletResponse;

        response.addHeader("Access-Control-Allow-Origin", "*");

        response.addHeader("Access-Control-Allow-Methods", "GET,POST,PATCH,PUT,OPTIONS");

        chain.doFilter(servletRequest,response);

    }

    public void destroy() {

    }
}
