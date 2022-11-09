<!-- Header -->
<header class="header-v2">
    <!-- Header desktop -->
    <div class="container-menu-desktop ">

        <div class="wrap-menu-desktop how-shadow1">
            <nav class="limiter-menu-desktop container">

                <!-- Logo desktop -->		
                <a href="home-02.jsp" class="logo">
                    <img src="images/icons/logo-quan-white.png" alt="IMG-LOGO">
                </a>

                <!-- Menu desktop -->
                <div class="menu-desktop">
                    <ul class="main-menu">
                     

                        <li>
                            <a href="ManageProductController">Product Control</a>
                        </li>
                        
                        
                    </ul>
                </div>	

                <!-- Icon header -->
                <div class="wrap-icon-header flex-w flex-r-m">

                    <ul class="main-menu">
                        <li class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11">

                            <i class="zmdi zmdi-account"></i>

                            <ul class="sub-menu">
                                <c:if test="${sessionScope.i.getUserName() != null}">
                                    <li >

                                        <a href="" class="stext-102 cl2 hov-cl1 trans-04">
                                            ${sessionScope.i.getUserName()} </a>
                                    <li><a href="UserController?command=Logout">Log out</a></li>
                                   
                                    </li>

                                </c:if>   
                                <c:if test="${i.getUserName() == null}">
                                    <a href="login.jsp" class="stext-102 cl2 hov-cl1 trans-04">
                                        Log In
                                    </a>
                                </c:if>


                            </ul>

                        </li>
                    </ul>



                    <div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart" data-notify="2">
                        <i class="zmdi zmdi-shopping-cart"></i>
                    </div>

                    <a href="#" class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti" data-notify="0">
                        <i class="zmdi zmdi-favorite-outline"></i>
                    </a>
                </div>
            </nav>
        </div>	
    </div>
    <!-- Modal Search -->
    <div class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
        <div class="container-search-header">
            <button class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
                <img src="images/icons/icon-close2.png" alt="CLOSE">
            </button>

            <form class="wrap-search-header flex-w p-l-15" >
                <button class="flex-c-m trans-04">
                    <i class="zmdi zmdi-search"></i>
                </button>
                <input class="plh3" type="text" name="search" placeholder="Search...">
            </form>
        </div>
    </div>
</header>