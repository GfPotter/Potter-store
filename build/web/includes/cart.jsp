<div class="wrap-header-cart js-panel-cart">
    <div class="s-full js-hide-cart"></div>

    <div class="header-cart flex-col-l p-l-65 p-r-25">
        <div class="header-cart-title flex-w flex-sb-m p-b-8">
            <span class="mtext-103 cl2">
                Your Cart
            </span>

            <div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
                <i class="zmdi zmdi-close"></i>
            </div>
        </div>

        <table class="header-cart-content flex-w js-pscroll">

            <tr class="header-cart-wrapitem w-full">
            <c:forEach var="i" items="${cart}">
                <td class="header-cart-item flex-w flex-t m-b-12">
                    <div class="header-cart-item-img">
                        <img src="${i.getProduct_img()}" alt="IMG">
                    </div>

                    <div class="header-cart-item-txt p-t-8">
                        <a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
                            ${i.getProduct_name()}
                        </a>

                        <span class="header-cart-item-info">
                            $${i.getPrice()}*${i.getProduct_quantity()}
                        </span>
                    </div>

                <c:set var="total" value="${total+i.getPrice()*i.getProduct_quantity()}"/>

                </td>
            </c:forEach>
            </tr>


        </table>
        <div class="w-full">
         

            <div class="header-cart-buttons flex-w w-full">
                <div href="CartController?user=${sessionScope.i.getUserName()}" class="  flex-c-m stext-101  p-lr-15 trans-04 m-r-8 m-b-10">
                    Total: $${total}
                </div> 

                <a href="CartController?user=${sessionScope.i.getUserName()}" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
                    Check Out
                </a>
            </div>
        </div>
    </div>
</div>