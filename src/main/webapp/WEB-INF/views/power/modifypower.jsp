<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>角色修改</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
</head>

<body class="fix-sidebar">
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
    </svg>
</div>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top m-b-0">
        <%@include file="/WEB-INF/views/include/header.jsp"%>
    </nav>
    <div class="navbar-default sidebar" role="navigation">
        <jsp:include page="/WEB-INF/views/include/left.jsp">
            <jsp:param value="/power/getpowerlist" name="visitUrl"/>
        </jsp:include>
    </div>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">角色修改</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="#">角色管理</a></li>
                        <li class="active">角色修改</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="white-box p-l-20 p-r-20">
                        <p class="text-muted m-b-30 font-13"></p>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <form id="form" onsubmit="update();return false;" class="form-material form-horizontal" data-toggle="validator">
                                    <%--<input type="hidden" name="id" value="${power.id}"/>--%>
                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;所属系统</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" value="${system.name}" disabled/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;权限ID</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" value="${power.id}" disabled/>
                                            <input type="hidden" name="id" value="${power.id}" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;权限名称</label>
                                        <div class="col-md-12">
                                            <input type="text" name="name" maxlength="50" class="form-control" required="required" data-error="请输入权限名称" value="${power.name}"/>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;权限编码</label>
                                        <div class="col-md-12">
                                            <input type="text" class="form-control" value="${power.code}" disabled/>
                                            <input type="hidden" name="code" value="${power.code}" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12">权限描述</label>
                                        <div class="col-md-12">
                                            <textarea name="description" maxlength="200" class="form-control" rows="5" >${power.description}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-md-12" ><label style="color: #f05b4f">*</label>&nbsp;权限类型</label>
                                        <div class="col-sm-12">
                                            <input type="hidden" name="type" value="${power.type}" />
                                                <%--权限类型：1、系统登录权限 2、菜单权限 3、操作权限 4、系统管理员权限--%>
                                            <p class="form-control-static">
                                                <c:if test="${power.type == 1}">系统登录权限</c:if>
                                                <c:if test="${power.type == 2}">菜单权限</c:if>
                                                <c:if test="${power.type == 3}">操作权限</c:if>
                                                <c:if test="${power.type == 4}">系统管理员权限</c:if>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-4"></div>
                                        <div class="col-lg-2 col-sm-4 col-xs-12">
                                            <button class="btn btn-block btn-info text-uppercase waves-effect waves-light" type="submit">
                                                <span style="vertical-align: inherit;">保存</span>
                                            </button>
                                        </div>
                                        <div class="col-lg-2 col-sm-4 col-xs-12">
                                            <button class="btn btn-block btn-primary text-uppercase" onclick="cancel()" type="button">
                                                <span style="vertical-align: inherit;">返回</span>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-sidebar">
                <%@include file="/WEB-INF/views/include/right.jsp"%>
            </div>
        </div>
        <footer class="footer text-center">
            <%@include file="/WEB-INF/views/include/footer.jsp"%>
        </footer>
    </div>
</div>
<script type="text/javascript">
    function update() {
        // 校验表单
        var name = $("input[name='name']").val();
        // 校验
        if (checkStr(name)) {
            // if(name.length > 50 || name.length <=0){
            //     swal({
            //         title: "权限名称最多50个字符",
            //         confirmButtonText: "确定",
            //     });
            // }
            $("input[name='name']").focus();
            return false;
        }

        var code = $("input[name='code']").val();

        if (checkStr(code)){
            $("input[name='code']").focus();
            return false;
        }
        swal({
            title: "是否保存",
            showCancelButton: true,
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: true
        }, function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    url : "${pageContext.request.contextPath}/power/updatepowerbyid",
                    type : "POST",
                    dataType : "json",
                    data : $("#form").serialize(),
                    success : function(result) {
                        if (result.success) {
                            swal({title : "保存成功",
                                confirmButtonText: "确定"}, function(){
                                location.href = "${pageContext.request.contextPath}/power/getpowerlist?systemId=${power.systemId}";
                            });
                        }
                    },
                    error : function() {
                        alert("保存失败");
                    }
                });
            }
        });
    }

    function cancel() {
        swal({
            title: "确定返回吗?",
            text: "确定后将返回列表页!",
            showCancelButton: true,
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: true
        }, function(isConfirm){
            if (isConfirm) {
                location.href = "${pageContext.request.contextPath}/power/getpowerlist";
            }
        });
    }
</script>

</body>
</html>