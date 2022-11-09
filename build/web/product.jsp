<%-- 
    Document   : product
    Created on : Jul 6, 2022, 6:08:11 AM
    Author     : Acers
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Product</title>
        <%@include file="includes/header.jsp" %>
    </head>
    <body class="animsition">

        <%@include file="includes/navbar-nothome.jsp" %>


        <%@include file="includes/mobile.jsp" %>




        <!-- Cart -->
        <%@include file="includes/cart.jsp" %>



        <!-- Product -->
        <%@include file="includes/product_include.jsp" %>


        <%@include file="includes/footer.jsp" %>


        <%@include file="includes/backtotop.jsp" %>

        <!-- Modal1 -->
        <%@include file="includes/modal.jsp" %>

        <%@include file="includes/js.jsp" %>

    </body>
</html>