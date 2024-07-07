<%-- 
    Document   : notification
    Created on : Jul 7, 2024, 11:43:26 PM
    Author     : Vu Minh Quan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="color: red">${requestScope.announce}</h1>
        You can cancel this appointment by click on 'Cancel' button.
        <form action="patient/deleteAppointment" method="POST">
            <input type="hidden" name="idDelete" value="<%= request.getParameter("id") %>">
            <button type="submit" class="btn btn-danger" id="confirmDeleteButton">Cancel</button>
        </form>
        <br>
        OR
        <br><br>
        Your can update this appointment by click on 'update' button
        <br>
        <button type="submit" class="btn btn-danger" id="confirmDeleteButton" onclick="window.location.href = 'patient/editAppointment?id=<%= request.getParameter("id") %>';">Update</button>
    </body>
</html>
