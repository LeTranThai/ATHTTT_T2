<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách hóa đơn</title>
</head>
<body>
<div class="main-content">
    <div style="height: 0px; display: flex; justify-content: flex-end;">
        <div class="message_box" style="position: fixed; z-index: 9999; padding: 20px;">
            <div class="alert alert-success" id="message_box" style="width: 25vw;">
                <button type="button" class="close" data-dismiss="alert">x</button>
                <strong id="msg_box">${requestScope.message}</strong>
            </div>
        </div>
    </div>
    <div class="main-content-inner">
        <div class="breadcrumbs" id="breadcrumbs">
            <script type="text/javascript">
                try {
                    ace.settings.check('breadcrumbs', 'fixed')
                } catch (e) {
                }
            </script>

            <div class="nav-search" id="nav-search">
                <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="ace-icon fa fa-search nav-search-icon"></i>
								</span>
                </form>
            </div><!-- /.nav-search -->
        </div>

        <div class="page-content">
            <div class="page-header clearfix">
                <h1 class="pull-left">
                    Hoá đơn
                </h1>
            </div><!-- /.page-header -->

            <div class="row">
                <div class="col-xs-12">

                    <table id="table-order"></table>

                    <script type="text/javascript">
                        var $path_base = "${requestScope.base}";//in Ace demo this will be used for editurl parameter
                    </script>
                    <!-- PAGE CONTENT ENDS -->
                </div><!-- /.col -->
            </div><!-- /.row -->
        </div><!-- /.page-content -->
    </div>
</div><!-- /.main-content -->

<%--popup đăng ký user--%>
<div class="modal fade" id="detail" tabindex="-1" role="dialog" aria-labelledby="detailLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Chi tiết hóa đơn</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="detail-id">Mã tài khoản</label>
                    <input type="text" class="form-control" id="detail-id" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-name">Tên người nhận</label>
                    <input type="text" class="form-control" id="detail-name" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-phone">số điện thoại</label>
                    <input type="text" class="form-control" id="detail-phone" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-address">Địa chỉ nhận hàng</label>
                    <input type="text" class="form-control" id="detail-address" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-product">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="detail-product" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-color">Màu sắc</label>
                    <input type="text" class="form-control" id="detail-color" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-size">Size</label>
                    <input type="text" class="form-control" id="detail-size" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-ammount">Số lượng</label>
                    <input type="text" class="form-control" id="detail-ammount" disabled>
                </div>
                <div class="form-group">
                    <label for="detail-price">Giá tiền</label>
                    <input type="text" class="form-control" id="detail-price" disabled>
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
        </div>
    </div>
</div>


<div class="modal fade" id="confirm-delete-order" tabindex="-1" role="dialog" aria-labelledby="confirm-delete-order"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Bạn chắc chắn xóa hóa đơn?</h5>
                <button type="button" style="margin-top: -25px !important;" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                Chọn Ok để xóa hóa đơn
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="button" class="btn btn-primary" onclick="deleteOrder()">OK</button>
            </div>
        </div>
    </div>
</div>

<%--popup chỉnh sửa user--%>
<div class="modal fade" id="editUser" tabindex="-1" role="dialog" aria-labelledby="editUserLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="title-model">Chỉnh sửa tài khoản</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-edit-user" method="post" action="admin-user-manage">
                    <input type="hidden" id="idAccount" name="idAccount">
                    <div class="form-group">
                        <label for="last_name_edit">Họ</label>
                        <input type="text" class="form-control" name="last-name" id="last_name_edit"
                               placeholder="Nhập họ của bạn">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="first_name_edit">Tên</label>
                        <input type="text" class="form-control" name="first-name" id="first_name_edit"
                               placeholder="Nhập tên của bạn">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="phone_edit">Số điện thoại</label>
                        <input type="text" class="form-control" name="phone" id="phone_edit"
                               placeholder="Nhập số điện thoại">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="address_edit">Địa chỉ</label>
                        <input type="text" class="form-control" name="address" id="address_edit"
                               placeholder="Nhập địa chỉ">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="email_edit">Địa chỉ email</label>
                        <input type="email" class="form-control" name="email" id="email_edit"
                               aria-describedby="emailHelp"
                               placeholder="Nhập email">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group">
                        <label for="username_edit">Tên tài khoản</label>
                        <input type="text" disabled class="form-control" name="username" id="username_edit" value=""
                               placeholder="Nhập tên tài khoản">
                        <p class="form-text text-danger text-muted form-error"></p>
                    </div>

                    <div class="form-group" id="role_edit_selected">
                        <label for="role_edit">Vai trò</label>
                        <select id="role_edit" name="role_edit" class="form-select" aria-label="Default select example">
                            <option value="VT1">Admin</option>
                            <option value="VT2">Người dùng</option>
                        </select>
                    </div>

                    <input type="hidden" name="action" value="update">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
                <button type="submit" id="update-account" form="form-edit-user" class="btn btn-primary">Cập nhật
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="edit" tabindex="-1" role="dialog" aria-labelledby="editLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="">Chỉnh sửa hóa đơn</h5>
                <button style="margin-top: -25px !important;" type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="edit-order" method="post">
                <div class="form-group">
                    <label for="edit-id">Mã tài khoản</label>
                    <input type="text" class="form-control" id="edit-id" disabled>
                </div>
                <div class="form-group">
                    <label for="edit-name">Tên người nhận</label>
                    <input type="text" class="form-control" id="edit-name" >
                </div>
                <div class="form-group">
                    <label for="edit-phone">số điện thoại</label>
                    <input type="text" class="form-control" id="edit-phone" >
                </div>
                <div class="form-group">
                    <label for="edit-address">Địa chỉ nhận hàng</label>
                    <input type="text" class="form-control" id="edit-address" >
                </div>
                <div class="form-group">
                    <label for="edit-product">Tên sản phẩm</label>
                    <input type="text" class="form-control" id="edit-product" disabled>
                </div>
                <div class="form-group">
                    <label for="edit-color">Màu sắc</label>
                    <input type="text" class="form-control" id="edit-color" disabled>
                </div>
                <div class="form-group">
                    <label for="edit-size">Size</label>
                    <input type="text" class="form-control" id="edit-size" disabled>
                </div>
                <div class="form-group">
                    <label for="edit-ammount">Số lượng</label>
                    <input type="text" class="form-control" id="edit-ammount" >
                </div>
                <div class="form-group">
                    <label for="edit-price">Giá tiền</label>
                    <input type="text" class="form-control" id="edit-price" disabled>
                </div>
                </form>
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Đóng</button>
            <button type="submit" class="btn btn-primary" form="edit-order">
                Sửa
            </button>
        </div>
    </div>
</div>
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>

<script>
    $(document).ready(function () {
        let message = "${requestScope.message}";
        if (message === "") {
            $("#message_box").hide();
        } else {
            $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                $("#message_box").slideUp(500);
            });

        }
        load();
    })

    function load() {
        $.post('admin-order-manage', {action: "getAllOrder"},
            function (data, status) {
                const users = data.map((order, index) => ([
                    order.id,
                    order.recipient,
                    order.orderPhone,
                    order.orderAddress,
                    order.createdDate,
                    order.status,
                    order.price + " VNĐ",
                    order.id,
                    order.id,
                    order.id,
                ]));
                $('#table-order').DataTable({
                    data: users,
                    columns: [
                        {title: "Mã hoá đơn"},
                        {title: "Tên người nhận"},
                        {title: "số điện thoại"},
                        {title: "Địa chỉ"},
                        {title: "Ngày tạo"},
                        {title: "Trạng thái"},
                        {title: "Giá tiền"},
                        {
                            title: '',
                            render: (id) => ("<button class='btn-detail' onclick='detail(this)' data-toggle='modal' data-target='#detail' value=" + id + "><i class='fa fa-eye' aria-hidden='true'></i></button>")
                        },
                        {
                            title: '',
                            render: (id) => ("<button class='btn-edit' onclick='update(this)' value=" + id + "><i class='fa fa-pencil' aria-hidden='true'></i></button>")
                        },
                        {
                            title: '',
                            render: (id) => ("<button class='btn-delete' onclick='confirmRemove(this)' data-toggle='modal' data-target='#confirm-delete-user' value=" + id + "><i class='fa fa-times' aria-hidden='true'></i></button>")
                        }
                    ],
                    'pageLength': 5
                })
            });
    }

    function detail(element) {
        const accountId = $(element).attr("value");
        $.post("admin-order-manage", {action: "getOrder", id: accountId},
            function (data, status) {
                $("#detail-id").val(data.id)
                $("#detail-name").val(data.recipient)
                $("#detail-phone").val(data.orderPhone)
                $("#detail-address").val(data.orderAddress)
                $("#detail-product").val(data.orderItems[0].product.name)
                $("#detail-color").val(data.orderItems[0].color.name)
                $("#detail-size").val(data.orderItems[0].size.name)
                $("#detail-ammount").val(data.orderItems[0].amount)
                $("#detail-price").val(data.orderItems[0].price)
            })
    }

    let editElement = null;

    function update(element) {
        const accountId = $(element).attr("value");
        $.post("admin-user-manage", {action: "getUser", id: accountId},
            function (data, status) {
                $("#edit-id").val(data.id)
                $("#edit-name").val(data.recipient)
                $("#edit-phone").val(data.orderPhone)
                $("#edit-address").val(data.orderAddress)
                $("#edit-product").val(data.orderItems[0].product.name)
                $("#edit-color").val(data.orderItems[0].color.name)
                $("#edit-size").val(data.orderItems[0].size.name)
                $("#edit-ammount").val(data.orderItems[0].amount)
                $("#edit-price").val(data.orderItems[0].price)
            })
        editElement = element;
        $("#edit").modal("show");
    }

    let deleteId = 0;
    let deleteElement = null;

    function confirmRemove(element) {
        const accountId = $(element).attr("value");
        deleteElement = element;
        deleteId = accountId;
    }

    function remove() {
        const accountId = deleteId;
        $.post("admin-user-manage", {action: "deleteUser", id: accountId},
            function (data, status) {
                $("#confirm-delete-user").modal("hide");
                let message = "";
                if (data) {
                    message = "Xóa thành công";
                    $('#table-order').DataTable().row($(deleteElement).parents('tr')).remove().draw();
                } else {
                    message = "Xóa thất bại";
                }
                $("#msg_box").text(message);
                $("#message_box").fadeTo(2000, 500).slideUp(500, function () {
                    $("#message_box").slideUp(500);
                })
            })
    }
</script>
<script src='<c:url value="/assets/js/validation.js"/>'></script>
</body>
</html>
