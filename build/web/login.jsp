<%-- 
    Document   : index
    Created on : Jun 24, 2022, 4:25:59 PM
    Author     : QUAN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.1.1/css/all.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" >
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet" />
        <!-- MDB -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.css" rel="stylesheet" />


        <title>Shopping-Logins</title>
    </head>
    <body>
        <section class="vh-100" style="background-color: #eee;">

            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-12 col-xl-11">
                        <div class="card text-black" style="border-radius: 25px;">
                            <div class="card-body p-md-5">
                                <div class="row justify-content-center">
                                    <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                                        <p class="text-center h1 fw-bold mb-4 mx-1 mx-md-4 mt-4">Sign in</p>
                                        <section class="w-100 p-4 d-flex justify-content-center pb-4">

                                            <form action="UserController" mehod="POST" style="width: 22rem;">
                                                <!-- Email input --><input type="text" hidden="hidden" name="command" value="Login">
                                                <div class="form-outline mb-4">
                                                    <p id="error">${requestScope.Message}</p>                             
                                                    <div class="form-notch">
                                                        <div class="form-notch-leading" style="width: 9px;"></div>
                                                        <div class="form-notch-middle" style="width: 88.8px;"></div>
                                                        <div class="form-notch-trailing"></div>
                                                    </div>
                                                </div>
                                                <div class="form-outline mb-4">
                                                    <input type="text" id="form2Example1" class="form-control" required name="UserName">
                                                    <label class="form-label" for="form2Example1" style="margin-left: 0px;">User Name</label>
                                                    <div class="form-notch">
                                                        <div class="form-notch-leading" style="width: 9px;"></div>
                                                        <div class="form-notch-middle" style="width: 88.8px;"></div>
                                                        <div class="form-notch-trailing"></div>
                                                    </div>
                                                </div>

                                                <!-- Password input -->
                                                <div class="form-outline mb-4">
                                                    <input type="password" id="form2Example2" class="form-control" required name="Password">
                                                    <label class="form-label" for="form2Example2" style="margin-left: 0px;">Password</label>
                                                    <div class="form-notch">
                                                        <div class="form-notch-leading" style="width: 9px;"></div>
                                                        <div class="form-notch-middle" style="width: 64.8px;"></div>
                                                        <div class="form-notch-trailing"></div>
                                                    </div>
                                                </div>

                                                <!-- 2 column grid layout for inline styling -->
                                                <div class="row mb-4">
                                                    <div class="col d-flex justify-content-center">
                                                        <!-- Checkbox -->
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="checkbox" value="" id="form2Example31" checked="">
                                                            <label class="form-check-label" for="form2Example31"> Remember me </label>
                                                        </div>
                                                    </div>

                                                    <div class="col">
                                                        <!-- Simple link -->
                                                        <a href="#!">Forgot password?</a>
                                                    </div>
                                                </div>

                                                <!-- Submit button -->
                                                <button type="submit" class="btn btn-primary btn-block mb-4">Sign in</button>

                                                <!-- Register buttons -->
                                                <div class="text-center">
                                                    <p>Not a member? <a href="register.jsp">Register</a></p>
                                                    <p>or sign up with:</p>
                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-facebook-f"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-google"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-twitter"></i>
                                                    </button>

                                                    <button type="button" class="btn btn-link btn-floating mx-1">
                                                        <i class="fab fa-github"></i>
                                                    </button>
                                                </div>
                                            </form>
                                        </section>

                                    </div>
                                    <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">

                                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp" class="img-fluid" alt="Sample image">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" ></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" ></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/4.2.0/mdb.min.js"></script>

    </body>
</html>
