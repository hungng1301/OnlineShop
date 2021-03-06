<%-- 
    Document   : FeedbackList
    Created on : Feb 20, 2022, 8:34:49 PM
    Author     : HL2020
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedbacks List</title>
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
                                        <b>Feedback List</b>

                                    </header>
                                    <!-- <div class="box-header"> -->
                                    <!-- <h3 class="box-title">Responsive Hover Table</h3> -->

                                    <!-- </div> -->
                                    <div class="panel-body table-responsive">
                                        <div class="row">
                                          <div class="col-sm-11">
                                                <form class="form-inline" role="form" action="<%=request.getContextPath()%>/feedback/search">
                                                <div class="form-group" style="margin-right:12px;">
                                                    <label class="sr-only" for="exampleInputEmail2">Email address</label>
                                                    <input type="text" name="table_search" class="form-control" id="exampleInputEmail2" placeholder="Enter Fullname" value="${requestScope.valueSearch}" onblur="this.value = removeSpaces(this.value);">
                                                </div>
                                                <div class="form-group" style="margin-right:12px;">
                                                <select class="select" aria-label="Default select example" name="role" style="height: 30px">
                                                        <c:if test="${empty valueRole}">
                                                            <option selected value="">All Rate Star</option>
                                                            <option value="1">1 Star</option>
                                                            <option value="2">2 Star</option>
                                                            <option value="3">3 Star</option>
                                                            <option value="4">4 Star</option>
                                                            <option value="5">5 Star</option>
                                                        </c:if>
                                                        <c:if test="${not empty valueRole}">
                                                            <option value="">Rate Star</option>
                                                            <option value="1" <%=request.getAttribute("valueRole").equals("1") ? "selected" : ""%>>1 Star</option>
                                                            <option value="2" <%=request.getAttribute("valueRole").equals("2") ? "selected" : ""%>>2 Star</option>
                                                            <option value="3" <%=request.getAttribute("valueRole").equals("3") ? "selected" : ""%>>3 Star</option>
                                                            <option value="4" <%=request.getAttribute("valueRole").equals("4") ? "selected" : ""%>>4 Star</option>
                                                            <option value="5" <%=request.getAttribute("valueRole").equals("5") ? "selected" : ""%>>5 Star</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                               
                                                <div class="form-group" style="margin-right:8px;">
                                                    <select class="select" aria-label="Default select example" name="status" style="height: 30px">
                                                        <c:if test="${empty valueStatus}">
                                                            <option value="" >All Statuses</option>
                                                            <c:forEach items="${FeedStatuses}" var="os">
                                                                <option value="<c:out value="${os}" />"> ${os}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                        <c:if test="${not empty valueStatus}"> 
                                                            <option value="" >All Statuses</option>
                                                            <c:forEach items="${FeedStatuses}" var="os">
                                                                <option value="<c:out value="${os}" />" <c:if test="${os eq valueStatus}">selected</c:if>> ${os}</option>
                                                            </c:forEach>
                                                        </c:if>
                                                    </select>
                                                </div>
                                                 <div class="form-group" style="margin-right:12px;">
                                                <select class="select" aria-label="Default select example" name="proid" style="height: 30px">
                                                        <c:if test="${empty valueProduct}">
                                                            <option selected value="">All Product</option>
                                                            <option value="1">Nike AF1</option>
                                                            <option value="2">Nike SB Dunk Travis</option>
                                                            <option value="3">Nike SB Low Ben Jerrys</option>
                                                            <option value="4">Nike SB Low Chicago</option>
                                                            <option value="5">Nike Heritage</option>
                                                            <option value="6">Nike Sportwear Futura 360</option>
                                                            <option value="7">Nike Backpack L21</option>
                                                            <option value="8">Nike Paris Saint Germain</option>
                                                            <option value="9">Nike AS M NSW TEE JDI ILLUSTRATION</option>
                                                        </c:if>
                                                        <c:if test="${not empty valueProduct}">
                                                            <option value="">Product</option>
                                                            <option value="1" <%=request.getAttribute("valueProduct").equals("1") ? "selected" : ""%>>Nike AF1</option>
                                                            <option value="2" <%=request.getAttribute("valueProduct").equals("2") ? "selected" : ""%>>Nike SB Dunk Travis</option>
                                                            <option value="3" <%=request.getAttribute("valueProduct").equals("3") ? "selected" : ""%>>Nike SB Low Ben Jerrys</option>
                                                            <option value="4" <%=request.getAttribute("valueProduct").equals("4") ? "selected" : ""%>>Nike SB Low Chicago</option>
                                                            <option value="5" <%=request.getAttribute("valueProduct").equals("5") ? "selected" : ""%>>Nike Heritage</option>
                                                             <option value="6" <%=request.getAttribute("valueProduct").equals("6") ? "selected" : ""%>>Nike Sportwear Futura 360</option>
                                                              <option value="7" <%=request.getAttribute("valueProduct").equals("7") ? "selected" : ""%>>Nike Backpack L21</option>
                                                               <option value="8" <%=request.getAttribute("valueProduct").equals("8") ? "selected" : ""%>>Nike Paris Saint Germain</option>
                                                                <option value="9" <%=request.getAttribute("valueProduct").equals("9") ? "selected" : ""%>>Nike AS M NSW TEE JDI ILLUSTRATION</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                                <button type="submit" class="btn btn-success">Search</button>
                                            </form>
                                        </div> 

                                    </div>
                                    <br>
                                    <table class="table table-striped" id="SettingListTable">
                                        <tr>
                                            <th onclick="sortTable(0)">ID</th>
                                            <th onclick="sortTable(1)">Fullname</th>
                                            <th onclick="sortTable(2)">Email</th>
                                            <th onclick="sortTable(3)">Mobile</th>
                                            <th onclick="sortTable(4)">Product</th>
                                            <th onclick="sortTable(5)">Rated Star</th>
                                            <th onclick="sortTable(6)">Status</th>
                                            <th>Actions</th>
                                        </tr>
                                        <c:forEach items="${Feedback}" var="feed">
                                            <tr>
                                                <td>${feed.getFeedbackId()}</td>
                                               <c:forEach items="${Customers}" var="cus">
                                                 <c:choose>
                                                        <c:when test="${cus.getUid() == feed.getCustomerId()}">
                                                            <td>${cus.getFullname()}</td>
                                                            <td>${cus.getEmail()}</td>
                                                            <td>${cus.getPhone()}</td>
                                                        </c:when>
                                                    </c:choose> 
                                                
                                                </c:forEach>
                                                 <c:forEach items="${Product}" var="cus">
                                                 <c:choose>
                                                        <c:when test="${cus.getPid() == feed.getProductID()}">
                                                            <td>${cus.getTitle()}</td>
                                                            
                                                        </c:when>
                                                    </c:choose> 
                                                 
                                                </c:forEach>
                                                 <td>${feed.getRatedStart()}    <img src="${pageContext.request.contextPath}/admin/img/star-icon.png" alt=""/></td>      
                                                  <c:forEach items="${StatusList}" var="sta">
                                                    <c:if test="${sta.getSettingId() eq feed.getFeedbackStatus()}">
                                                        <td>${sta.getSettingValue()}</td>
                                                    </c:if>
                                                </c:forEach>
                                                  <td><button type="button" class="btn-xs btn-primary" onclick="window.location = '<%=request.getContextPath()%>/feedback/getFeedback?feedbackId=${feed.getFeedbackId()}'">Edit</button></td>
                                            </tr>
                                        </c:forEach>
                                            
                                    </table>

                                    <br>
                                    <c:if test="${requestScope.Feedback.isEmpty()}">
                                        <p style="text-align: center">No matching User found </p>
                                    </c:if>                
                                    <br>
                                    <div class="table-foot">
                                        <ul class="pagination pagination-sm no-margin pull-right">
                                            <c:if test="${currentPage != 1}">
                                                <li><a
                                                        href="<%=request.getContextPath()%>/feedback/list?currentPage=${currentPage-1}">Previous</a>
                                                </li>
                                            </c:if>

                                            <c:forEach begin="1" end="${numOfPage}" var="i">
                                                <c:choose>
                                                    <c:when test="${currentPage eq i}">
                                                        <li class="active"><a>
                                                                ${i} <span class="sr-only">(current)</span></a>
                                                        </li>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <li><a
                                                                href="<%=request.getContextPath()%>/feedback/list?currentPage=${i}">${i}</a>
                                                        </li>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>

                                            <c:if test="${currentPage lt numOfPage}">
                                                <li><a
                                                        href="<%=request.getContextPath()%>/feedback/list?currentPage=${currentPage+1}">Next</a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </div>
                                </div><!-- /.box-body -->
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
        <!-- Director App -->
        <script src="${pageContext.request.contextPath}/admin/js/SettingList.js" type="text/javascript"></script>
    </body>
</html>
