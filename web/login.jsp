<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Đăng nhập - Shop Quần Áo Nam</title>
        <style>
            body {
                margin: 0;
                padding: 0;
                min-height: 100vh;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                background: url("media/anh1.jpg") no-repeat center center fixed;
                background-size: cover;
                position: relative;
            }

            .overlay {
                width: 100%;
                min-height: 100vh;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .login-box {
                background-color: #ffffff;
                padding: 40px;
                width: 350px;
                border-radius: 15px;
                box-shadow: 0 10px 25px rgba(0,0,0,0.4);
                animation: fadeIn 1s ease-in-out;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .login-box h2 {
                text-align: center;
                color: #222;
                margin-bottom: 20px;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            .login-box input[type="text"],
            .login-box input[type="password"] {
                width: 100%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ddd;
                border-radius: 8px;
                transition: 0.3s;
            }

            .login-box input[type="text"]:focus,
            .login-box input[type="password"]:focus {
                border-color: #4CAF50;
                outline: none;
            }

            .login-box input[type="submit"] {
                width: 100%;
                padding: 12px;
                background: linear-gradient(to right, #4CAF50, #2E7D32);
                color: white;
                border: none;
                border-radius: 8px;
                font-weight: bold;
                text-transform: uppercase;
                cursor: pointer;
                transition: 0.3s;
            }

            .login-box input[type="submit"]:hover {
                background: linear-gradient(to right, #2E7D32, #4CAF50);
            }

            .error {
                color: red;
                text-align: center;
                margin-top: 10px;
            }

            .login-box .note {
                text-align: center;
                margin-top: 15px;
                font-size: 13px;
                color: #777;
            }

            .login-box a {
                color: #666;
                font-size: 13px;
                text-decoration: none;
            }

            .login-box a:hover {
                color: #2E7D32;
            }

            footer {
                position: relative;
                z-index: 1;
            }
        </style>
    </head>
    <body>

        <%@ include file="navbar.jsp" %>

        <div class="overlay">
            <div class="login-box">
                <h2>Đăng nhập</h2>
                <%-- Hiển thị thông báo --%>
                <% 
                    String thongbao = (String) request.getAttribute("thongbao");
                    if (thongbao != null) {
                %>
                <div class="message"><%= thongbao %></div>
                <% } %>
                <form action="LoginServlet" method="post">
                    <input type="text" name="username" placeholder="Tên đăng nhập" required />
                    <input type="password" name="password" placeholder="Mật khẩu" required />
                    <input type="submit" value="Đăng nhập" />
                </form>

                <div style="margin-top: 10px; text-align: center;">
                    <a href="forgot.jsp">Quên mật khẩu?</a>
                    |
                    <a href="register.jsp">Đăng ký tài khoản</a>
                </div>

                <% if (request.getAttribute("error") != null) { %>
                <div class="error"><%= request.getAttribute("error") %></div>
                <% } %>

                <div class="note">Chào mừng bạn đến với Shop thời trang nam cao cấp!</div>
            </div>
        </div>

        <%@ include file="footer.jsp" %>

    </body>
</html>
