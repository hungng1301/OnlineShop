<%-- 
    Document   : CusDetail
    Created on : Feb 12, 2022, 12:52:03 PM
    Author     : HL2020
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details</title>
        <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
        <meta name="description" content="Developed By M Abdur Rokib Promy">
        <meta name="keywords" content="Admin, Bootstrap 3, Template, Theme, Responsive">
        <!-- bootstrap 3.0.2 -->
        <link href="${pageContext.request.contextPath}/admin/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <!-- font Awesome -->
        <link href="${pageContext.request.contextPath}/admin/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <!-- Ionicons -->
        <link href="${pageContext.request.contextPath}/admin/css/ionicons.min.css" rel="stylesheet" type="text/css" />
        <!-- google font -->
        <link href='http://fonts.googleapis.com/css?family=Lato' rel='stylesheet' type='text/css'>
        <!-- Theme style -->
        <link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet" type="text/css" />
        <!-- Import css for image -->
        <link href="${pageContext.request.contextPath}/admin/css/UserDetail.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/admin/css/FeedbackDetail.css" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <jsp:include page="HeaderAdmin.jsp"></jsp:include>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <jsp:include page="SideBarManager.jsp"></jsp:include>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="panel">
                                <header class="panel-heading">
                                    <b>Product Details</b>

                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-7">
                                        <div class="panel-body table-responsive">
                                            <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/product/update?pid=<c:out value="${currentpro.pid}"/>" method="POST" name="/product/update"  enctype="multipart/form-data">
                                                <c:if test="${not empty successEditMessage}">
                                                    <h4 class="help-block" style="color: green" id="successEditMessage">${successEditMessage}</h4>
                                                    <c:remove var="successEditMessage"/>
                                                    <br>
                                                </c:if>
                                                <c:if test="${not empty errorEditMessage}">
                                                    <h4 class="help-block" style="color: red" id="errorEditMessage">${errorEditMessage}</h4>
                                                    <c:remove var="errorEditMessage"/>
                                                    <br>
                                                </c:if>
                                                <div class="form-group">
                                                    <label for="avatar" class="col-lg-2 col-sm-2 control-label">Thumbnail</label>
                                                    <div class="col-lg-10">
                                                        <div class="profile-pic">
                                                            <label class="-label" for="file">
                                                                <c:if test="${ not empty currentpro.thumbnail}">
                                                                    <img src="data:image/jpg;base64,${currentpro.thumbnail}" id="output1" width="200" />
                                                                </c:if>
                                                                <c:if test="${empty currentpro.thumbnail}">
                                                                    <img src="${pageContext.request.contextPath}/admin/img/user-bg.png" id="output1" width="200" alt="default image"/>
                                                                </c:if>
                                                            </label>
                                                            <input id="file" type="file" onchange="loadFile(event)" name="image"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="title" class="col-lg-2 col-sm-2 control-label">Title</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" id="title" value="${currentpro.getTitle()}" name="title" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="title" class="col-lg-2 col-sm-2 control-label">List Price</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" id="title" value="${currentpro.getLprice()}" name="lprice" required>
                                                    </div>
                                                </div>
                                                    <div class="form-group">
                                                    <label for="title" class="col-lg-2 col-sm-2 control-label">Sale Price</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" id="title" value="${currentpro.getSprice()}" name="sprice" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="title" class="col-lg-2 col-sm-2 control-label">Featured</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" id="title" value="${currentpro.getFeatured()}" name="feature" required>
                                                    </div>
                                                </div>
                                                    
                                                <div class="form-group">
                                                    <label for="breif" class="col-lg-2 col-sm-2 control-label">Breif Information</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" id="breif" name="breif" value="${currentpro.getBreif()}"required>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label for="quan" class="col-lg-2 col-sm-2 control-label">Quantity</label>
                                                    <div class="col-lg-10">
                                                        <input type="text" class="form-control" id="quan" name="quan" required value="${currentpro.getQuantity()}" required >
                                                    </div>
                                                </div>
                                                    
                                                <div class="form-group">
                                                    <label for="role" class="col-lg-2 col-sm-2 control-label">Category</label>
                                                    <div class="col-lg-10">
                                                        <select class="form-control m-b-10" name="category">
                                                            <c:if test="${empty categoryValue}">
                                                                <option value="13" selected>Shoes</option>
                                                                <option value="14">Clothes</option>
                                                                <option value="15">Bags</option>
                                                            </c:if>
                                                            <c:if test="${not empty categoryValue}">
                                                                <option value="13" <%=request.getAttribute("categoryValue").equals("13") ? "selected" : ""%>>Shoes</option>
                                                                <option value="14" <%=request.getAttribute("categoryValue").equals("14") ? "selected" : ""%>>Clothes</option>
                                                                <option value="15" <%=request.getAttribute("categoryValue").equals("15") ? "selected" : ""%>>Bags</option>
                                                            </c:if>
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="saler" class="col-lg-2 col-sm-2 control-label">Saler</label>
                                                    <div class="col-lg-10">
                                                        <select class="form-control m-b-10" name="saler">
                                                            <c:if test="${empty salerValue}">
                                                                <option value="4" selected>Kylian Mbappe</option>
                                                                <option value="5">Kendall Jenner</option>
                                                                <option value="12">Jurgen Klopp</option>
                                                            </c:if>
                                                            <c:if test="${not empty salerValue}">
                                                                  <option value="4" <%=request.getAttribute("salerValue").equals("4") ? "selected" : ""%>>Kylian Mbappe</option>
                                                                  <option value="5" <%=request.getAttribute("salerValue").equals("5") ? "selected" : ""%>>Kendall Jenner</option>
                                                                  <option value="12" <%=request.getAttribute("salerValue").equals("12") ? "selected" : ""%>>Jurgen Klopp</option>
                                                            </c:if>
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="saler" class="col-lg-2 col-sm-2 control-label">Product Status</label>
                                                    <div class="col-lg-10">
                                                        <select class="form-control m-b-10" name="status">
                                                            <c:if test="${empty salerValue}">
                                                                <option value="16" selected>Empty</option>
                                                                <option value="17">Stocking</option>
                                                            </c:if>
                                                            <c:if test="${not empty salerValue}">
                                                                <option value="16" <%=request.getAttribute("statusValue").equals("16") ? "selected" : ""%>>Empty</option>
                                                                <option value="17" <%=request.getAttribute("statusValue").equals("17") ? "selected" : ""%>>Stocking</option>
                                                            </c:if>
                                                        </select>

                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-offset-2 col-lg-10">
                                                        <button type="submit" class="btn btn-success">Update Product Information</button>
                                                        <button type="button" class="btn btn-primary" onclick="window.location = '<%=request.getContextPath()%>/product/list'">Back to Product List</button>
                                                    </div>
                                                </div>
                                                <input type="hidden" value="${currentpro.pid}" name="pid"> 
                                            </form>
                                        </div><!-- /.box-body -->
                                    </div>
                                    <div class="col-lg-4"></div>
                                </div>
                            </div><!-- /.box -->
                        </div>
                    </div>
                </section><!-- /.content -->
                <div class="footer-main">
                    Copyright &copy Online Shop , 2022
                </div>
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->


        <!-- jQuery 2.0.2 -->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/admin/js/jquery.min.js" type="text/javascript"></script>

        <!-- Bootstrap -->
        <script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js" type="text/javascript"></script>
        <!-- Director App -->
        <script src="${pageContext.request.contextPath}/admin/js/Director/app.js" type="text/javascript"></script>
        <!-- User Detail -->
        <script src="${pageContext.request.contextPath}/admin/js/UserDetail.js" type="text/javascript"></script>
    </body>
</html>
s