<%-- 
    Document   : shoping-cart
    Created on : Jul 6, 2022, 6:08:44 AM
    Author     : Acers
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Shoping Cart</title>
        <%@include file="includes/header.jsp" %>
    </head>
    <body class="animsition">

        <%@include file="includes/navbar_admin.jsp" %>
        <div class="bg0 p-t-75 p-b-85">
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Img</th>
                        <th scope="col">Img2</th>
                        <th scope="col">Img3</th>
                        <th scope="col">Name</th>
                        <th scope="col">Des</th>
                        <th scope="col">Detail</th>
                        <th scope="col">More Information</th>
                        <th scope="col">Price</th>
                        <th scope="col">Gender</th>
                        <th scope="col"></th>

                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="i" items="${requestScope.product}">
                        <tr>
                            <th scope="row">${i.getId()}</th>
                            <td> <a href="ManageProductController?command=Delete&id=${i.getId()}"><div class="how-itemcart1">
                                        <img src="${i.getImg()}" alt="IMG">
                                    </div></a></td>
                            <td> <a href="ManageProductController?command=Delete&id=${i.getId()}"><div class="how-itemcart1">
                                        <img src="${i.getImg2()}" alt="IMG">
                                    </div></a></td>
                            <td> <a href="ManageProductController?command=Delete&id=${i.getId()}"><div class="how-itemcart1">
                                        <img src="${i.getImg3()}" alt="IMG">
                                    </div></a></td>
                            <td>${i.getName()}</td>
                            <td>${i.getDes()}</td>
                            <td>${i.getDetail()}</td>
                            <td>${i.getMoreinf()}</td>
                            <td>${i.getPrice()}</td>
                            <td>${i.getGender()}</td>
                            <td><a href="updateproduct.jsp?id=${i.getId()}">Update</a></td>
                        </tr>

                    </c:forEach>
                </tbody>
            </table>
            <div class="p-4 text-center w-100">
            
                <a href="addproduct.jsp"><button type="button" class="btn btn-outline-success" data-mdb-ripple-color="dark">Add</button></a>
              
            </div>
                   </div>
        <%@include file="includes/footer.jsp" %>
        <%@include file="includes/backtotop.jsp" %>
        <%@include file="includes/js2.jsp" %>

    </body>
</html>