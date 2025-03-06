<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow border-0 rounded-3">
                    <div class="card-header bg-primary text-white text-center py-3">
                        <h4 class="mb-0">Login</h4>
                    </div>
                    <div class="card-body p-4">
                        <form method="post" action="./LoginServlet">
                            <table border="1" align="center" width="16%" class="table table-bordered">
                                <tr>
                                    <th class="bg-light">Email</th>
                                    <td><input type="text" name="email" class="form-control"></td>
                                </tr>
                                <tr>
                                    <th class="bg-light">Pass</th>
                                    <td><input type="password" name="pass" class="form-control"></td>
                                </tr>
                                <tr>
                                    <th><input type="submit" name="submit" value="Login" class="btn btn-primary w-100"></th>
                                    <td><input type="reset" name="reset" value="Clear" class="btn btn-secondary w-100"></td>
                                </tr>
                            </table>
                        </form>
                    </div>
                    <div class="card-footer bg-light text-center py-3">
                        <p class="mb-0">New User,
                        <a href="Register.html" class="text-primary fw-bold text-decoration-none">SignUp</a></p>
                        <%
                        Object o=request.getAttribute("loginError");
                        %>
                        <p align="center" class="mt-3 py-2 fst-italic bg-warning text-danger" style="<%= (o==null) ? "display:none;" : "" %>">
                        <%=(o==null)?"":o.toString()%>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>