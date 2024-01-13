<%@ page import="java.util.List" %>
<%@ page import="org.example.demo.model.Sign" %>
<%@ page import="org.example.demo.model.Order" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>${requestScope.pageName}</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100% !important;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<!-- pages-title-start -->
<%@include file="/components/location.jsp" %>
<c:if var="accountIsExist" test="${sessionScope.account !=null}">
    <jsp:useBean id="account" scope="session"
                 type="org.example.demo.model.Account"/>
</c:if>
<!-- pages-title-end -->
<!-- my account content section start -->
<section class="collapse_area coll2">
    <div class="container">

        <div style="height: 0px; display: flex; justify-content: flex-end;">
            <div class="message_box" style="position: fixed; z-index: 9999; padding: 20px;">
                <div class="alert alert-success" id="message_box" style="width: 25vw;">
                    <button type="button" class="close" data-dismiss="alert">x</button>
                    <strong id="msg_box">${requestScope.message}</strong>
                </div>
            </div>
        </div>

        <div class="modal fade" id="modal-update-account" tabindex="-1" role="dialog"
             aria-labelledby="modal-update-account"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Xác nhận thay đổi</h5>
                        <button type="button" style="margin-top: -25px !important;" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Chọn OK để xác nhận thay đổi
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary" onclick="updateAccount()">OK</button>
                    </div>
                </div>
            </div>
        </div>


        <div class="modal fade" id="modal-change-pass" tabindex="-1" role="dialog" aria-labelledby="modal-change-pass"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Xác nhận thay đổi</h5>
                        <button type="button" style="margin-top: -25px !important;" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Chọn OK để xác nhận thay đổi
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="button" class="btn btn-primary" onclick="changePass()">OK</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="modal fade" id="update-sign" tabindex="-1" role="dialog" aria-labelledby="updateSignLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Cập nhật chữ ký</h5>
                        <button type="button" style="margin-top: -25px !important;" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="update-sign-form" enctype="multipart/form-data" action="my-account" method="post">
                            <input type="hidden" name="type" value="updateSign">
                            <div class="form-group">
                                <label class="l-contact" for="private">
                                    Private key
                                    <em>*</em>
                                </label>
                                <input type="text" name="private" id="private" value=""/>
                                <span class="form-error text-red mt-16 form_message">${requestScope.message}</span>
                                <input type="file" id="inputPrivateKey" onchange="readPrivateKeyFile()">
                            </div>
                            <div class="form-group">
                                <label class="l-contact" for="public">
                                    Khoá công khai mới
                                    <em>*</em>
                                </label>
                                <input type="text" name="public" id="public" value=""/>
                                <span class="form-error text-red mt-16 form_message"></span>
                                <input type="file" id="inputPublicKey" onchange="readPublicKeyFile()">
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary" form="update-sign-form">Cập nhật</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="check">
                    <h2>Tài khoản </h2>
                </div>
                <div class="faq-accordion">
                    <div class="panel-group pas7" id="accordion" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingOne" style="margin-bottom: 6px">
                                <h4 class="panel-title">
                                    <a class="collapsed method" role="button" data-toggle="collapse"
                                       data-parent="#accordion" href="#collapseOne" aria-expanded="false"
                                       aria-controls="collapseOne">Thay đổi thông tin tài khoản <i
                                            class="fa fa-caret-down"></i></a>
                                </h4>
                            </div>
                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel"
                                 aria-labelledby="headingOne" aria-expanded="false">
                                <div class="row">
                                    <%--start account information--%>
                                    <div class="easy2">
                                        <c:if test="${requestScope.linkDownKey !=null}">
                                        <label class="col-md-9 control-label">
                                            <h3 style="text-align: left">
                                                Chữ ký đã được cập nhật
                                                tải và
                                                giữ cẩn thận, Lưu ý chữ ký chỉ cấp 1 lần, nếu muốn cấp lại phải câp
                                                nhật
                                            </h3>
                                        </label>
                                        <div class="col-md-3">
                                            <a href="${requestScope.linkDownKey}"
                                               download="yourKey.json">
                                                <button class="btn btn-primary ce5"
                                                >Tải xuống
                                                </button>
                                            </a>
                                        </div>
                                    </div>
                                    </c:if>
                                    <div class="easy2">
                                        <h2>Thông tin tài khoản</h2>
                                        <form id="update-account-form" class="form-horizontal" method="post"
                                              action="/my-account">
                                            <input type="hidden" value="updateAccount" name="type">
                                            <fieldset>
                                                <legend>Thông tin cá nhân của bạn</legend>
                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">Họ </label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control" type="text" placeholder="Họ"
                                                               name="lastname"
                                                               value="${accountIsExist?account.lastName:""}">
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">Tên</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control" type="text" placeholder="Tên"
                                                               name="firstname"
                                                               value="${accountIsExist?account.firstName:""}">
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">E-Mail</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control" type="email" placeholder="E-Mail"
                                                               name="email"
                                                               value="${accountIsExist?account.email:""}">
                                                    </div>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">SĐT</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control" type="tel" placeholder="SĐT"
                                                               name="sdt"
                                                               value="${accountIsExist?account.phone:""}">
                                                    </div>
                                                </div>

                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">Địa chỉ</label>
                                                    <div class="col-sm-10">
                                                        <input class="form-control" type="tel" placeholder="Địa chỉ"
                                                               name="address"
                                                               value="${accountIsExist?account.address:""}">
                                                    </div>
                                                </div>

                                            </fieldset>
                                            <div class="buttons clearfix">
                                                <%--                                                <div class="pull-left">--%>
                                                <%--                                                    <a class="btn btn-default ce5" href="#">Trở lại</a>--%>
                                                <%--                                                </div>--%>
                                                <div class="pull-right">
                                                    <input class="btn btn-primary ce5" type="submit"
                                                           onclick="update(event)" value="Cập nhật thông tin">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                    <%--                                    end account infomation --%>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingTwo">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Đổi mật
                                        khẩu <i class="fa fa-caret-down"></i></a>
                                </h4>
                            </div>
                            <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingTwo" aria-expanded="false" style="height: 0px;">
                                <div class="row">
                                    <div class="easy2">
                                        <h2>Đổi mật khẩu</h2>
                                        <form class="form-horizontal" id="form-change-pass" method="post"
                                              action="/my-account">
                                            <input type="hidden" name="type" value="changePass">
                                            <fieldset>
                                                <legend>Mật khẩu của bạn</legend>
                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">Mật khẩu</label>
                                                    <div class="col-sm-10">
                                                        <input id="password-old" class="form-control" type="password"
                                                               name="password"
                                                               placeholder="Mật khẩu">
                                                    </div>
                                                    <p class="form-error" style="color: red; margin-left: 200px"></p>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">Mật khẩu mới</label>
                                                    <div class="col-sm-10">
                                                        <input id="password-new" class="form-control" type="password"
                                                               name="newpass"
                                                               placeholder="Mật khẩu mới">
                                                    </div>
                                                    <p class="form-error" style="color: red; margin-left: 200px"></p>
                                                </div>
                                                <div class="form-group required">
                                                    <label class="col-sm-2 control-label">Xác nhận mật khẩu</label>
                                                    <div class="col-sm-10">
                                                        <input id="password-confirm" class="form-control"
                                                               type="password"
                                                               name="comfirm-newpass"
                                                               placeholder="Xác nhận mật khẩu">
                                                    </div>
                                                    <p class="form-error" style="color: red; margin-left: 200px"></p>
                                                </div>
                                            </fieldset>
                                            <div class="buttons clearfix">
                                                <div class="pull-right">
                                                    <input class="btn btn-primary ce5" type="submit"
                                                           onclick="change(event)" value="Xác nhận">
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingThree">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseThree" aria-expanded="false" aria-controls="collapseTwo">Cập nhật
                                        chữ ký <i class="fa fa-caret-down"></i></a>
                                </h4>
                            </div>
                            <div id="collapseThree" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree" aria-expanded="false" style="height: 0px;">
                                <div class="row">
                                    <div class="easy2">
                                        <h2>Cập nhật chữ ký</h2>
                                        <form class="form-horizontal" method="post"
                                              action="my-account" enctype="multipart/form-data">
                                            <input type="hidden" name="type" value="download">
                                            <fieldset>
                                                <%--                                                <legend>Cập nhật chữ ký</legend>--%>
                                                <%--                                                <div class="form-group required">--%>
                                                <%--                                                    <label class="col-sm-2 control-label">Chọn chữ ký</label>--%>
                                                <%--                                                    <div class="col-sm-10">--%>
                                                <%--                                                        <input id="sign" class="form-control" type="file"--%>
                                                <%--                                                               name="sign">--%>
                                                <%--                                                    </div>--%>
                                                <%--                                                    <p class="form-error" style="color: red; margin-left: 200px"></p>--%>
                                                <%--                                                </div>--%>
                                                <div class="form-group required">
                                                </div>
                                            </fieldset>
                                            <div class="buttons clearfix">
                                                <div class="pull-right">
                                                    <button type="submit" class="btn btn-primary ce5"
                                                            onclick="updateSign(event)"
                                                    >Cập nhật chữ ký mới
                                                    </button>
                                                    <a>
                                                        <button type="submit" class="btn btn-primary ce5"
                                                        >Tải chữ ký
                                                        </button>
                                                    </a>
                                                </div>

                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="headingFor">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapseFor" aria-expanded="false" aria-controls="collapseTwo">Danh sách
                                        chữ ký <i class="fa fa-caret-down"></i></a>
                                </h4>
                            </div>
                            <div id="collapseFor" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree" aria-expanded="false" style="height: 0px;">
                                <div class="row">
                                    <div class="easy2">
                                        <div class="pull-right" style="width: 100%">
                                            <table style="width: 100%">
                                                <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Trạng thái</th>
                                                    <th>Ngày tạo</th>
                                                    <th>Ngày hết hạn</th>
                                                    <th>Action</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <% List<Sign> signsByIdA = (List<Sign>) request.getAttribute("signsByIdA");
                                                    for (int i = 0; i < signsByIdA.size(); i++) {
                                                        Sign sign = signsByIdA.get(i);
                                                %>
                                                <tr style="height: 60px">
                                                    <td><%=i + 1%>
                                                    </td>
                                                    <td><%=sign.isActive() == true ? "Using" : "Expired"%>
                                                    </td>
                                                    <td><%=sign.getCreatedDate()%>
                                                    </td>
                                                    <td><%=sign.getModifiedDate() == null ? "" : sign.getModifiedDate()%>
                                                    </td>
                                                    <td>
                                                        <%if (sign.isActive()) {%>
                                                        <a
                                                                href="cancel-key?signId=<%=sign.getId()%>"
                                                                class="btn btn-primary ce5">
                                                            Hủy
                                                        </a>
                                                        <%}%>
                                                    </td>
                                                </tr>
                                                <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading" role="tab" id="heading5">
                                <h4 class="panel-title">
                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion"
                                       href="#collapse5" aria-expanded="false" aria-controls="collapseTwo">Danh sách
                                        đơn hàng <i class="fa fa-caret-down"></i></a>
                                </h4>
                            </div>
                            <div id="collapse5" class="panel-collapse collapse" role="tabpanel"
                                 aria-labelledby="headingThree" aria-expanded="false" style="height: 0px;">
                                <div class="row">
                                    <div class="easy2">
                                        <div class="pull-right" style="width: 100%">
                                            <table style="width: 100%">
                                                <thead>
                                                <tr>
                                                    <th>STT</th>
                                                    <th>Ngày đặt</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Trạng thái</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <% List<Order> orders = (List<Order>) request.getAttribute("orders");
                                                    for (int i = 0; i < orders.size(); i++) {
                                                        Order order = orders.get(i);
                                                        String statusString = "";
                                                        if (order.getStatus().getId() == 4) {
                                                            statusString = "Chờ xác nhận";
                                                        }
                                                        if (order.getStatus().getId() == 5) {
                                                            statusString = "Đang vận chuyển";
                                                        }
                                                        if (order.getStatus().getId() == 6) {
                                                            statusString = "Đã hủy";
                                                        }
                                                %>
                                                <tr style="height: 60px">
                                                    <td><%=i + 1%>
                                                    </td>
                                                    <td><%=order.getCreatedDate()%>
                                                    </td>
                                                    <td><%=order.getOrderAddress()%>
                                                    </td>
                                                    <td><%=statusString%>
                                                    </td>
                                                </tr>
                                                <%}%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- my account content section end -->
<script src='<c:url value="/assets/js/validation.js"/>'></script>
<script>

    Validator({
        form: "#update-sign-form",
        errorSelector: ".form-error",
        formGroupSelector: ".form-group",
        rules: [
            Validator.isRequire("#private", "Chưa chọn khóa riêng tư"),
            Validator.isRequire("#public", "Chưa chọn khóa công khai"),
        ]
    });


    $(document).ready(function () {
        let message = "${requestScope.message}";
        if (message === "") {
            $("#message_box").hide();
        } else {
            $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                $("#message_box").slideUp(500);
            });
        }
    })


    function updateSign(e) {
        e.preventDefault();
        $("#update-sign").modal("show");
    }

    function update(e) {
        e.preventDefault();
        $("#modal-update-account").modal("show");
    }

    function change(e) {
        e.preventDefault();
        $("#modal-change-pass").modal("show");
    }

    function updateAccount() {
        $("#update-account-form").submit();
        $("#modal-update-account").modal("hide");
    }

    function changePass() {
        $("#form-change-pass").submit();
        $("#modal-change-pass").modal("hide");
    }

</script>
<script>
    function downloadKeys() {
        // Tạo XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // Đặt sự kiện khi yêu cầu được hoàn thành
        xhr.onreadystatechange = function () {
            if (xhr.readyState === XMLHttpRequest.DONE) {
                if (xhr.status === 200) {
                    // Xử lý phản hồi từ máy chủ
                    var response = JSON.parse(xhr.responseText);

                    // Hiển thị khóa trên trang
                    document.getElementById('public').value = response.publicKey;
                    document.getElementById('private').value = response.privateKey;

                    // Tạo một tệp JSON để tải về
                    var blob = new Blob([xhr.responseText], {type: 'application/json'});
                    var link = document.createElement('a');

                    // Thiết lập thông tin tệp
                    link.href = window.URL.createObjectURL(blob);
                    link.download = 'keyPair.json';

                    // Thêm liên kết vào trang và kích hoạt sự kiện click
                    document.body.appendChild(link);
                    link.click();

                    // Loại bỏ liên kết sau khi tải về
                    document.body.removeChild(link);
                } else {
                    // Xử lý lỗi nếu có
                    console.error('Failed to fetch keys.');
                }
            }
        };

        // Mở yêu cầu GET đến URL của máy chủ
        xhr.open('GET', '/keys?command=setKey', true);

        // Gửi yêu cầu
        xhr.send();
    }
</script>
<script>
    <!-- Thêm đoạn mã JavaScript sau vào trang HTML của bạn -->
    function readPublicKeyFile() {
        var inputPublicKey = document.getElementById('inputPublicKey');
        var publicInput = document.getElementById('public');

        // Kiểm tra xem người dùng đã chọn tệp hay chưa
        if (inputPublicKey.files.length > 0) {
            var file = inputPublicKey.files[0];
            var reader = new FileReader();

            // Đặt sự kiện khi đọc tệp hoàn tất
            reader.onload = function (e) {
                try {
                    var keyPair = JSON.parse(e.target.result);

                    // Hiển thị khóa trên trang
                    publicInput.value = keyPair.publicKey;
                } catch (error) {
                    console.error('Error parsing JSON:', error);
                }
            };

            // Đọc nội dung của tệp
            reader.readAsText(file);
        }
    }

    function readPrivateKeyFile() {
        var inputPrivateKey = document.getElementById('inputPrivateKey');
        var privateInput = document.getElementById('private');

        // Kiểm tra xem người dùng đã chọn tệp hay chưa
        if (inputPrivateKey.files.length > 0) {
            var file = inputPrivateKey.files[0];
            var reader = new FileReader();

            // Đặt sự kiện khi đọc tệp hoàn tất
            reader.onload = function (e) {
                try {
                    var keyPair = JSON.parse(e.target.result);

                    // Hiển thị khóa trên trang
                    privateInput.value = keyPair.privateKey;
                } catch (error) {
                    console.error('Error parsing JSON:', error);
                }
            };

            // Đọc nội dung của tệp
            reader.readAsText(file);
        }
    }


</script>
</body>
</html>