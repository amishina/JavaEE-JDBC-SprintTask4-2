package kz.bitlab.techorda.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kz.bitlab.techorda.db.DBConnection;
import kz.bitlab.techorda.db.User;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(value = "/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Long id = DBConnection.checkUsers(email, password);

        if (id == null) {
            request.setAttribute("loginFailed", true);
            request.getRequestDispatcher("/signIn.jsp").forward(request, response);

        } else {
            User user = DBConnection.getUser(id);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/userProfile.jsp").forward(request, response);
        }
    }
}