<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Cart Contact | E-Shopper</title>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/prettyPhoto.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/price-range.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/animate.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/main.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/responsive.css" rel="stylesheet">
        <!--[if lt IE 9]>
        <script src="js/html5shiv.js"></script>
        <script src="js/respond.min.js"></script>
        <![endif]-->       
        <link rel="shortcut icon" href="images/ico/favicon.ico">
        <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
    </head><!--/head-->

    <body>
        <jsp:include page="header.jsp"/>
        <section id="cart_items">
            <div class="container">
                <!--			<div class="breadcrumbs">
                                                <ol class="breadcrumb">
                                                  <li><a href="#">Home</a></li>
                                                  <li class="active">Shopping Cart</li>
                                                </ol>
                                        </div>-->
                <div class="table-responsive cart_info">
                    <table class="table table-condensed">
                        <thead>
                            <tr class="cart_menu">
                                <td class="image">Item</td>
                                <td class="description"></td>
                                <td class="price">Price</td>
                                <td class="quantity">Quantity</td>
                                <td class="total">Total</td>
                                <td></td>
                            </tr>
                        </thead>

                        <tbody>
                            <c:set var="o" value="${sessionScope.cart}"/>
                            <c:forEach items="${o.items}" var="i">
                                <tr>
                                    <td class="cart_product">
                                        <a href=""><img src="data:image/jpg;base64,${i.product.getThumbnail()}" alt="" width="100px" height="100px"></a>
                                    </td>
                                    <td class="cart_description">
                                        <h4><a>${i.product.title}</a></h4>
                                        <p name="pid">Product Id: ${i.product.pid}</p>
                                    </td>
                                    <td class="cart_price">
                                        <fmt:setLocale value = "vi_VN"/>
                                        <p name="price"><fmt:formatNumber value="${i.product.sprice}" type="currency" /></p>
                                    </td>
                                    <td class="cart_quantity">
                                        <div class="cart_quantity_button">
                                            <!--									<a class="cart_quantity_up" href=""> + </a>-->
                                            <input class="cart_quantity_input" readonly type="text" name="quantity" value="${i.quantity}" autocomplete="off" size="2">
                                            <!--									<a class="cart_quantity_down" href=""> - </a>-->
                                        </div>
                                    </td>
                                    <td class="cart_total">
                                        <fmt:setLocale value = "vi_VN"/>
                                        <p class="cart_total_price"><fmt:formatNumber value="${i.product.sprice * i.quantity}" type="currency" /></p>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </section> <!--/#cart_items-->
        <section id="cart_items">
            <div class="container shopper-informations">
                <div class="row">
                    <div class="col-sm-3">
                        <div class="shopper-info">
                            <p>Total Cost</p>
                            <fmt:setLocale value = "vi_VN"/>
                            <p class="cart_total_price" name ="totalcost" style="color: #FE980F;font-size: 30px;"><fmt:formatNumber value="${sessionScope.cart.getTotalMoney()}" type="currency" /></p>
                        </div>
                    </div>
                    <div class="col-sm-5 clearfix">
                        <div class="bill-to">
                            <p>Bill To</p>
                            <div class="form-one">
                                <form>
                                    <input type="hidden" name="id" value="${sessionScope.account.uid}">
                                    <input type="text" name="email" placeholder="Email*" value="${sessionScope.account.email}">
                                    <input type="text" name="title" placeholder="Title" value="${sessionScope.account.title}">
                                    <input type="text" name="fullname" placeholder="Full Name *" value="${sessionScope.account.fullname}">
                                    <input type="text" name="addresss" placeholder="Address 1 *" value="${sessionScope.account.address}">
                                    <input type="text" name="phone" placeholder="Phone Number *" value="${sessionScope.account.phone}">
                                    <a class="btn btn-primary" href="<%=request.getContextPath()%>/goods/addToCart">Modify Order</a>
                                    <a class="btn btn-primary" href="<%=request.getContextPath()%>/cart-completion.jsp">Buy Now</a>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="order-message">
                            <p>Shipping Order</p>
                            <textarea name="message"  placeholder="Notes about your order, Special Notes for Delivery" rows="16"></textarea>
                            <label><input type="checkbox"> Shipping to bill address</label>
                        </div>	
                    </div>					
                </div>
            </div>
        </section>

        <jsp:include page="footer.jsp"/><!--/Footer-->



        <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/price-range.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.scrollUp.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/jquery.prettyPhoto.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/main.js"></script>
    </body>
</html>


