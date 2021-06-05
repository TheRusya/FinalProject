package com.example.demo.controllers.open_view;

import com.example.demo.Command;
import com.example.demo.Path;
import com.example.demo.ServletResponse;
import com.example.demo.db.dao.ItemDAO;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OpenEditItemCommand extends Command {
    @Override
    public ServletResponse execute(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("item", new ItemDAO().findItemById(Long.parseLong(request.getParameter("id"))));
        return new ServletResponse(Path.EDIT_ITEM_PAGE.getValue());
    }
}
