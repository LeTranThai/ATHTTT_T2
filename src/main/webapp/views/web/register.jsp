<!-- pages-title-start -->
<%@ page pageEncoding="UTF-8" %>
<html>
<head>
    <title>${requestScope.pageName}</title>
</head>
<body>
<%@include file="/components/location.jsp" %>
<!-- pages-title-end -->
<!-- login content section start -->
<div class="login-area">
    <div class="container">
        <div class="row login-my-form">
            <div class="col-md-8 col-xs-12">
                <div class="tb-login-form res">
                    <h5 class="tb-title text-center">Tạo tài khoản mới</h5>
                    <p>Chào mừng bạn tạo tài khoản</p>
                    <form id="register_form" action="register" method="POST">
                        <p class="checkout-coupon top log a-an form-group">
                            <label class="l-contact" for="last-name">
                                Họ
                                <em>*</em>
                            </label>
                            <input type="text" name="last-name" id="last-name" value="${requestScope.lastName}"/>
                            <span class="form-error text-red mt-16 form_message" id="last-name-error"></span>
                        </p>
                        <p class="checkout-coupon top log a-an form-group">
                            <label class="l-contact" for="first-name">
                                Tên
                                <em>*</em>
                            </label>
                            <input type="text" name="first-name" id="first-name" value="${requestScope.firstName}"/>
                            <span class="form-error text-red mt-16 form_message" id="first-name-error"></span>
                        </p>
                        <p class="checkout-coupon top log a-an form-group">
                            <label class="l-contact" for="phone">
                                Số điện thoại
                                <em>*</em>
                            </label>
                            <input type="text" name="phone" id="phone" value="${requestScope.phone}"/>
                            <span class="form-error text-red mt-16 form_message"></span>
                        </p>
                        <p class="checkout-coupon top log a-an form-group">
                            <label class="l-contact" for="email">
                                Email
                                <em>*</em>
                            </label>
                            <input type="email" name="email" id="email" value="${requestScope.email}"/>
                            <span class="form-error text-red mt-16 form_message"></span>
                        </p>
                        <p class="checkout-coupon top log a-an form-group">
                            <label class="l-contact" for="username">
                                Tài khoản
                                <em>*</em>
                            </label>
                            <input type="text" name="username" id="username" value="${requestScope.userName}"/>
                            <span class="form-error text-red mt-16 form_message">${requestScope.errorUser}</span>
                        </p>
                        <p class="checkout-coupon top-down log a-an form-group">
                            <label class="l-contact" for="password">
                                Mật khẩu
                                <em>*</em>
                            </label>
                            <input type="password" name="password" id="password"/>
                            <span class="form-error text-red mt-16 form_message"></span>
                        </p>
                        <p class="checkout-coupon top-down log a-an form-group">
                            <label class="l-contact" for="password-repeat">
                                Lặp lại mật khẩu
                                <em>*</em>
                            </label>
                            <input type="password" name="password-repeat " id="password-repeat"/>
                            <span class="form-error text-red mt-16 form_message"></span>
                        </p>
                        <%-- cho người dùng nhập key --%>
                        <p class="checkout-coupon top log a-an form-group">
                            <label class="l-contact" for="public">
                                Public key
                                <em>*</em>
                            </label>
                            <input type="text" name="public" id="public" value=""/>
                            <span class="form-error text-red mt-16 form_message"></span>
                            <input type="file" id="inputPublicKey" onchange="readPublicKeyFile()">
                        </p>
                        <p class="checkout-coupon top log a-an form-group">
                            <label class="l-contact" for="private">
                                Private key
                                <em>*</em>
                            </label>
                            <input type="text" name="private" id="private" value=""/>
                            <span class="form-error text-red mt-16 form_message">${requestScope.message}</span>
                            <input type="file" id="inputPrivateKey" onchange="readPrivateKeyFile()">
                        </p>
                        <p class="checkout-coupon top log a-an form-group">

                            <button type="button" class="btn btn-primary ce5" onclick="downloadKeys()"
                            >Tạo key
                            </button>

                        </p>
                        <p class="login-submit5 ress">
                            <input value="Đăng ký" class="button-primary" type="submit"/>
                        </p>
                    </form>
                    <div class="tb-info-login ">
                        <h5 class="tb-title4">Đăng ký hôm nay để nhận ưu đãi:</h5>
                        <ul>
                            <li>Thanh toán thuận tiện hơn.</li>
                            <li>Theo dõi đơn đặt hàng của bạn một cách dễ dàng.</li>
                            <li>Giữ một bản ghi về tất cả các giao dịch mua của bạn.</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- login content section end -->
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