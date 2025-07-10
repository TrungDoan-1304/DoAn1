<%-- 
    Document   : logout
    Created on : 28 thg 6, 2025, 23:02:05
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>

