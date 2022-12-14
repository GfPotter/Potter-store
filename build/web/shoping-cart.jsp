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

        <%@include file="includes/navbar-nothome.jsp" %>


        <%@include file="includes/mobile.jsp" %>





        <!-- Cart -->



        <!-- breadcrumb -->
        <div class="container">
            <div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
                <a href="home-01.jsp" class="stext-109 cl8 hov-cl1 trans-04">
                    Home
                    <i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
                </a>

                <span class="stext-109 cl4">
                    Shoping Cart
                </span>
            </div>
        </div>

        <form class="" id="cart" action="CartController"></form>

        <!-- Shoping Cart -->
        <div class="bg0 p-t-75 p-b-85" id="cart" >
            <input type="text" hidden="hidden" name="command" value="CheckOut" form="cart">

            <input type="text" hidden="hidden" name="user" value="${sessionScope.i.getUserName()}" form="cart">

            <div class="container">
                <div class="row">
                    <div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
                        <div class="m-l-25 m-r--38 m-lr-0-xl">
                            <div class="wrap-table-shopping-cart">
                                <table class="table-shopping-cart">
                                    <tr class="table_head">
                                        <th class="column-1">Product</th>
                                        <th class="column-2"></th>
                                        <th class="column-3">Size</th>
                                        <th class="column-3">Price</th>
                                        <th class="column-4"style=" padding-left: 20px;padding-right:20px ;text-align:center;">Quantity</th>
                                        <th class="column-3">Total</th>
                                    </tr>
                                    <c:forEach var="j" items="${cart2}">
                                        <tr class="table_row">
                                            <td class="column-1">
                                                <div class="how-itemcart1">
                                                    <img src="${j.getProduct().getImg()}" alt="IMG">
                                                </div>
                                            </td>
                                            <td class="column-2">${j.getProduct().getName()}
                                            </td>
                                            <td class="column-3">${j.getSize()}</td>

                                            <td class="column-3">$${j.getProduct().getPrice()}</td>
                                            <td class="column-4"style=" padding-left: 20px;padding-right:20px ;text-align:center;">
                                                <div class="wrap-num-product flex-w m-l-auto m-r-0">
                                                    <a href="CartController?command=Update&user=${sessionScope.i.getUserName()}&img=${j.getProduct().getImg()}&size=${j.getSize()}&op=minus">
                                                        <div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m"> 
                                                            <i class="fs-16 zmdi zmdi-minus"></i>
                                                        </div>
                                                    </a>
                                                    <input class="mtext-104 cl3 txt-center num-product" type="number" name="num-product1" value="${j.getQuantity()}">
                                                    <a href="CartController?command=Update&user=${sessionScope.i.getUserName()}&img=${j.getProduct().getImg()}&size=${j.getSize()}&op=plus">

                                                        <div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
                                                            <i class="fs-16 zmdi zmdi-plus"></i>
                                                        </div>
                                                    </a>
                                                </div>
                                            </td>
                                            <td class="column-3">$${j.getProduct().getPrice()*j.getQuantity()}</td>


                                        </tr>
                                        <c:set var="total" value="${total+j.getProduct().getPrice()*j.getQuantity()}"/>
                                    </c:forEach>

                                </table>
                            </div>

                            <div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
                                <div class="flex-w flex-m m-r-20 m-tb-5">
                                    <input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="Coupon Code">

                                    <div class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5">
                                        Apply coupon
                                    </div>
                                </div>

                                <div class="">

                                    <div class="size-209">
                                        <span class="mtext-110 cl2">
                                            $${total}
                                        </span>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
                        <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
                            <h4 class="mtext-109 cl2 p-b-30">
                                Cart Totals
                            </h4>



                            <div class="flex-w flex-t bor12 p-t-15 p-b-30">
                                <div class="size-208 w-full-ssm">
                                    <span class="stext-110 cl2">
                                        Shipping:
                                    </span>
                                </div>

                                <div class="size-209 p-r-18 p-r-0-sm w-full-ssm">
                                    <p class="stext-111 cl6 p-t-2">
                                        <c:if test="${total >=2000}">
                                            Viettel Post-FreeShip
                                        </c:if>
                                        <c:if test="${total <2000}">
                                            Viettel Post-Please wait contact from them to know the fee
                                        </c:if>
                                    </p>

                                    <div class="p-t-15 ">
                                        <span class="stext-110 cl2">
                                            Calculate Shipping
                                        </span>

                                        <div class="rs1-select2 rs2-select2 bor8 bg0 m-b-12 m-t-9">
                                            <select form="cart" class="js-select2" name="city">
                                                <option>   An Giang                       </option>
                                                <option> B?? r???a ??? V??ng t??u</option>
                                                <option>B???c Giang</option>
                                                <option>B???c K???n</option>
                                                <option>B???c Li??u</option>
                                                <option>B???c Ninh</option>
                                                <option>B???n Tre</option>
                                                <option>B??nh ?????nh</option>
                                                <option>B??nh D????ng</option>
                                                <option>	B??nh Ph?????c</option>
                                                <option>	B??nh Thu???n</option>
                                                <option>	C?? Mau</option>
                                                <option>	C???n Th??</option>
                                                <option>	Cao B???ng </option>
                                                <option>	???? N???ng</option>
                                                <option>	?????k L???k</option>
                                                <option>	?????k N??ng</option>
                                                <option>	??i???n Bi??n</option>
                                                <option>	?????ng Nai</option>
                                                <option>	?????ng Th??p</option>
                                                <option>	Gia Lai</option>
                                                <option>	H?? Giang</option>
                                                <option>	H?? Nam</option>
                                                <option>	H?? N???i </option>
                                                <option>	H?? T??nh</option>
                                                <option>	H???i D????ng</option>
                                                <option>	H???i Ph??ng</option>
                                                <option>	H???u Giang</option>
                                                <option>	H??a B??nh</option>
                                                <option>	H??ng Y??n</option>
                                                <option>	Kh??nh H??a</option>
                                                <option>	Ki??n Giang</option>
                                                <option>	Kon Tum</option>
                                                <option>	Lai Ch??u</option>
                                                <option>	L??m ?????ng</option>
                                                <option>	L???ng S??n</option>
                                                <option>	L??o Cai</option>
                                                <option>	Long An</option>
                                                <option>	Nam ?????nh</option>
                                                <option>	Ngh??? An</option>
                                                <option>	Ninh B??nh</option>
                                                <option>	Ninh Thu???n</option>
                                                <option>	Ph?? Th???</option>
                                                <option>	Ph?? Y??n</option>
                                                <option>	Qu???ng B??nh</option>
                                                <option>	Qu???ng Nam</option>
                                                <option>	Qu???ng Ng??i</option>
                                                <option>	Qu???ng Ninh</option>
                                                <option>	Qu???ng Tr???</option>
                                                <option>	S??c Tr??ng</option>
                                                <option>	S??n La</option>
                                                <option>	T??y Ninh</option>
                                                <option>	Th??i B??nh</option>
                                                <option>	Th??i Nguy??n</option>
                                                <option>	Thanh H??a</option>
                                                <option>	Th???a Thi??n Hu???</option>
                                                <option>	Ti???n Giang</option>
                                                <option>	Th??nh ph??? H??? Ch?? Minh</option>
                                                <option>	Tr?? Vinh</option>
                                                <option>	Tuy??n Quang</option>
                                                <option>	V??nh Long</option>
                                                <option>	V??nh Ph??c</option>
                                                <option>	Y??n B??i</option>
                                            </select>
                                            <div class="dropDownSelect2"></div>
                                        </div>

                                        <div class="bor8 bg0 m-b-12">
                                            <input class="stext-111 cl8 plh3 size-111 p-lr-15" form="cart" type="text" name="address" placeholder="Address" required>
                                        </div>

                                        <div class="bor8 bg0 m-b-22">
                                            <input class="stext-111 cl8 plh3 size-111 p-lr-15" form="cart" type="text" name="phone" placeholder="Phone Number" required>
                                        </div>



                                    </div>
                                </div>
                            </div>

                            <div class="flex-w flex-t p-t-27 p-b-33">
                                <div class="size-208">
                                    <span class="mtext-101 cl2">
                                        Total:
                                    </span>
                                </div>

                                <div class="size-209 p-t-1">
                                    <span class="mtext-110 cl2">
                                        $${total}
                                    </span>
                                </div>
                                 
                                    <div class="block1 wrap-pic-w">
                                <img src="images/icons/qr-momo.jpg" alt="IMG-BANNER">

                               
                            </div>
                            </div> 
                            
                            <button type="submit" form="cart" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer">
                                Scan, enter money and username to checkout 
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="includes/cart.jsp" %>



        <%@include file="includes/footer.jsp" %>
        <%@include file="includes/backtotop.jsp" %>
        <%@include file="includes/js2.jsp" %>

    </body>
</html>