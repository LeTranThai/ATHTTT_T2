<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>${requestScope.pageName}</title>
    <style>
        .button-container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: row; /* Make sure the buttons are displayed next to each other */

        }
        .button-container a{
            margin:0 200px;
        }
    </style>
</head>
<body>
<!-- pages-title-start -->
<%@include file="/components/location.jsp" %>
<!-- pages-title-end -->
<!-- about content section start -->
<section class="main_shop_area">

    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-md-12 client-say">
                    <div class="about-sec-head">
                        <h2>
                            ${message}
                            <strong><a href="${href}">${hrefName}</a></strong>
                        </h2>
                    </div>


<%--                    add two return shopping and download order pdf with two button with space between flexbox horizontal--%>
                    <div class="button-container">
                        <input type="hidden" name="action" id="action" value=""/>
                        <a href="shop?type=all&brand=all&color=all&numOfProducts=9&page=1&sort=default" class="btn btn-primary shop-return">Tiếp tục mua hàng</a>
                        <a href="/sign?id=${orderId}"  class="btn btn-primary download-order">Tải hoá đơn</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- about content section end -->
</body>
<script>

</script>
</html>