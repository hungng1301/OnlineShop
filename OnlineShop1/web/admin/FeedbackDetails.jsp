<%-- 
    Document   : FeedbackDetails
    Created on : Feb 23, 2022, 2:21:11 PM
    Author     : HL2020
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Detail</title>
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
                                    <b>Customer Details</b>

                                </header>
                                <!-- <div class="box-header"> -->
                                <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                <!-- </div> -->
                                <div class="row">
                                    <div class="col-lg-1"></div>
                                    <div class="col-lg-7">
                                        <div class="panel-body table-responsive">
                                        <form class="form-horizontal" role="form" action="<%=request.getContextPath()%>/feedback/edit?feedbackId=<c:out value="${Feedback.getFeedbackId()}"/>" method="POST" name="/feedback/edit"  enctype="multipart/form-data">    
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
                                               
                                                <input type="hidden" value="${Feedback.getFeedbackId()}" name="feedbackId"> 
                                                <div class="form-group">
                                                    <label for="fullname" class="col-lg-2 col-sm-5 control-label">Fullname</label>
                                                    <div class="col-lg-3">
                                                        <input type="text" class="form-control" id="fullname" placeholder="Fullname" readonly value="${CurrentCustomer.getFullname()}" name="name" required>
                                                    </div>
                                                    
                                                </div>
                                                     <div class="form-group">
                                                    <label for="inputEmail1" class="col-lg-2 col-sm-2 control-label">Email</label>
                                                    <div class="col-lg-3">
                                                        <input type="email" class="form-control" id="inputEmail1" placeholder="Email" readonly value="${CurrentCustomer.getEmail()}" name="email"> 
                                                        <!--<p class="help-block">Example block-level help text here.</p>-->
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="phone" class="col-lg-2 col-sm-2 control-label">Phone</label>
                                                    <div class="col-lg-3">
                                                        <input type="text" class="form-control" id="phone" placeholder="Phone" readonly  value="${CurrentCustomer.getPhone()}" name="phone" pattern="[0-9]{10}" title="Phone must be 10 digits and contains numbers only" required>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="fullname" class="col-lg-2 col-sm-5 control-label">Product</label>
                                                    <div class="col-lg-3">
                                                        <input type="text" class="form-control" id="fullname" placeholder="" readonly value="${Products.getTitle()}" name="name" required>
                                                    </div>
                                                    
                                                </div>
                                                <div class="form-group">
                                                    <label for="fullname" class="col-lg-2 col-sm-5 control-label">Rate Star</label>
                                                    <div class="col-lg-3">
                                                        <input type="text" class="form-control" id="fullname" placeholder="" readonly value="${Feedback.getRatedStart()}" name="name" required>
                                                    </div>
                                                    
                                                </div>    
                                                <div class="form-group">
                                                    
                                                    <div class="col-lg-6">
                                                        <input type="hidden" class="form-control" id="fullname" placeholder="" readonly value="${Feedback.getTitle()}" name="name" required>
                                                    </div>
                                            
                                                </div>
                                                  <div class="form-group">
                                                    <label for="fullname" class="col-lg-2 col-sm-5 control-label">Feedback </label>
                                                    <div class="col-lg-10">
                                                         <textarea id="note" placeholder="Sale Notes" name="name" style="width: 450px;" readonly rows="3" cols="30" required >${Feedback.getFeedbackContent()}</textarea>
                                                       
                                                    </div>
                                            
                                                </div>  
                                                    
                                                 <div class="form-group">
                                                    <label for="avatar" class="col-lg-2 col-sm-2 control-label">Image</label>
                                                    <div class="col-lg-offset-4 col-lg-15">
                                                        <div class="profile-pic">
                                                            <label class="-label" for="file">
                                                                <c:if test="${ not empty Feedback.getImage()}">
                                                                    <img src="data:image/jpg;base64,${Feedback.getImage()}" id="output1" width="500" />
                                                                </c:if>
                                                                <c:if test="${empty Feedback.getImage()}">
                                                                    <img src="${pageContext.request.contextPath}/admin/img/no-avatar.png" id="output1" width="200" alt="default image"/>
                                                                </c:if>
                                                            </label>
                                                           
                                                        </div>
                                                    </div>
                                                </div>  
                                                <div class="form-group">
                                                    <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">Status</label>
                                                    <div class="col-lg-10">
                                                        <div class="radio-inline">
                                                            <label>
                                                                <input type="radio" name="status" id="optionsRadios3" value="1" <%=request.getAttribute("currentUserStatus").equals("1") ? "checked" : ""%>>
                                                                Published
                                                            </label>
                                                        </div>
                                                        <div class="radio-inline">
                                                            <label>
                                                                <input type="radio" name="status" id="optionsRadios4" value="0" <%=request.getAttribute("currentUserStatus").equals("0") ? "checked" : ""%>>
                                                                Hidden
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>    
                                               <div class="form-group">
                                                    <label for="fullname" class="col-lg-2 col-sm-5 control-label">Note</label>
                                                    <div class="col-lg-10">
                                                       
                                                         <textarea id="note" placeholder="Note" name="note" style="width: 450px;"  rows="3" cols="30" >${Feedback.getNote()}</textarea>
                                                    </div>
                                                    
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-lg-offset-2 col-lg-10">
                                                        <button type="submit" class="btn btn-success">Save</button>
                                                        <button type="button" class="btn btn-primary" onclick="window.location = '<%=request.getContextPath()%>/feedback/list'">Back Feedback List</button>
                                                    </div>
                                                </div>
                                                  
                                               
                                                                                            </form>   
                                    
                                        </div>
                                           
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