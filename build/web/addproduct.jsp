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

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css" rel="stylesheet" />
    </head>
    <body class="animsition">

        <%@include file="includes/navbar_admin.jsp" %>
        <div class="bg0 p-t-75 p-b-85">
            <h4 class="text-center mtext-105 cl2 js-name-detail p-b-14">
                Add Product                           </h4>

            <section class="w-100 p-4 d-flex justify-content-center pb-4">
                <form  action="ManageProductController">
                    <input type="text" hidden name="command" value="Add"/>


                    <div class="row mb-4">
                        <div class="col">
                            <div class="form-outline">
                                <input type="text" id="form6Example1" class="form-control" name="Img1" />
                                <label class="form-label" for="form6Example1">Image</label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-outline">
                                <input type="text" id="form6Example2" class="form-control" name="Img2"/>
                                <label class="form-label" for="form6Example2">Image 2</label>
                            </div>
                        </div>
                        <div class="col">
                            <div class="form-outline">
                                <input type="text" id="form6Example2" class="form-control" name="Img3" />
                                <label class="form-label" for="form6Example2">Image 3</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-outline mb-4">
                        <input type="text" id="form6Example3" class="form-control" name="Name"/>
                        <label class="form-label" for="form6Example3">Name</label>
                    </div>
                    <div class="form-outline mb-4">
                        <textarea class="form-control" id="form6Example7" rows="2" name="Describe"></textarea>
                        <label class="form-label" for="form6Example7">Describle</label>
                    </div>
                    <div class="form-outline mb-4">
                        <textarea class="form-control" id="form6Example7" rows="4" name="Detail"></textarea>
                        <label class="form-label" for="form6Example7">Detail</label>
                    </div>
                    <div class="form-outline mb-4">
                        <textarea class="form-control" id="form6Example7" rows="6" name="MoreInf"></textarea>
                        <label class="form-label" for="form6Example7">Additional information</label>
                    </div>
                    <!-- Text input -->

                    <!-- Number input -->
                    <div class="form-outline mb-4">
                        <input type="number" id="form6Example6" class="form-control" name="Price"/>
                        <label class="form-label" for="form6Example6">Price</label>
                    </div>
                    <section class="w-100 p-4 text-center pb-4">
                        <div class="form-check form-check-inline text-center">
                            <input class="form-check-input" type="radio" name="Gender" id="inlineRadio1" value="Men" checked />
                            <label class="form-check-label" for="inlineRadio1">Male</label>
                        </div>

                        <div class="form-check form-check-inline text-center">
                            <input class="form-check-input" type="radio" name="Gender" id="inlineRadio2" value="Women" />
                            <label class="form-check-label" for="inlineRadio2">Female</label>
                        </div>
                    </section>
                    <!-- Checkbox -->


                    <!-- Submit button -->
                    <button type="submit" class="btn btn-primary btn-block mb-4">Add</button>
                </form>
            </section>

        </div>
        <%@include file="includes/footer.jsp" %>
        <%@include file="includes/backtotop.jsp" %>
        <%@include file="includes/js2.jsp" %>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>
    </body>
</html>