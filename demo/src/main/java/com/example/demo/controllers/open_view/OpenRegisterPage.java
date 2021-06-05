package com.example.demo.controllers.open_view;

import com.example.demo.Command;
import com.example.demo.Path;
import com.example.demo.RedirectType;
import com.example.demo.ServletResponse;
import org.apache.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OpenRegisterPage extends Command {
    private final Logger logger = Logger.getLogger(OpenRegisterPage.class.getName());

    @Override
    public ServletResponse execute(HttpServletRequest request, HttpServletResponse response) {
        if(request.getSession().getAttribute("user") == null){
            logger.info("Open register page");
            return new ServletResponse(Path.REGISTER_PAGE.getValue());
        }else{
            logger.info("User have been authorize.");
            logger.info("Redirect to main page");
            return new ServletResponse(Path.getStaticPath(request) + "/", RedirectType.REDIRECT);
        }
    }
}
