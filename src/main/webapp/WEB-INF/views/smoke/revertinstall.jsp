<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>电子烟设备撤回安装</title>
</head>
<body class="fix-sidebar">
<div class="preloader">
    <svg class="circular" viewBox="25 25 50 50">
        <circle class="path" cx="50" cy="50" r="20" fill="none" stroke-width="2" stroke-miterlimit="10"/>
    </svg>
</div>
<div id="wrapper">
    <nav class="navbar navbar-default navbar-static-top m-b-0">
        <%@include file="/WEB-INF/views/include/header.jsp" %>
    </nav>
    <div class="navbar-default sidebar" role="navigation">
        <jsp:include page="/WEB-INF/views/include/left.jsp">
            <jsp:param value="/smoke/getconmnginslist" name="visitUrl"/>
        </jsp:include>
    </div>
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row bg-title">
                <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                    <h4 class="page-title">安装撤回</h4>
                </div>
                <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                    <ol class="breadcrumb">
                        <li><a href="#">售烟机管理</a></li>
                        <li class="active">安装撤回</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="white-box p-l-20 p-r-20">
                        <p class="text-muted m-b-30 font-13"></p>
                        <div class="row">
                            <div class="col-md-2"></div>
                            <div class="col-md-8">
                                <form id="form" onsubmit="save();return false;" class="form-horizontal form-material"
                                      data-toggle="validator" novalidate="true">
                                    <input type="hidden" name="id" value="${sellSmokeInstall.id}"/>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;渠道商</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="${sellSmokeAgent.name}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;渠道商联系人</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="${sellSmokeAgent.contacts}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;渠道商联系方式</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="${sellSmokeAgent.mobile}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;预约安装时间</label>
                                        <div class="col-md-12">
                                            <input type="text" required="required" class="form-control" value="<fmt:formatDate value="${sellSmokeInstall.appointTime}" pattern="yyyy-MM-dd"/>" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;申请人</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="${sellSmokeInstall.applyUserName}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;申请人联系方式</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="${sellSmokeInstall.applyUserMobile}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;申请时间</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="<fmt:formatDate value="${sellSmokeInstall.applyTime}" pattern="yyyy-MM-dd"/>" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12">&nbsp;申请备注</label>
                                        <div class="col-md-12">
                                            <textarea id="applyRemark" name="applyRemark" maxlength="100" class="form-control" rows="5" disabled>${sellSmokeInstall.applyRemark}</textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;处理人</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="${sellSmokeInstall.auditUserName}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;处理人联系方式</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="${sellSmokeInstall.auditUserMobile}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;处理时间</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="<fmt:formatDate value="${sellSmokeInstall.auditTime}" pattern="yyyy-MM-dd"/>" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12">&nbsp;处理备注</label>
                                        <div class="col-md-12">
                                            <textarea id="auditRemark" name="auditRemark" maxlength="100" class="form-control" rows="5" disabled>${sellSmokeInstall.auditRemark}</textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;安装人</label>
                                        <div class="col-md-12">
                                            <input type="text" name="installUserName" required="required" class="form-control" value="${sellSmokeInstall.installUserName}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;安装人联系方式</label>
                                        <div class="col-md-12">
                                            <input type="text" name="installUserMobile" required="required" class="form-control" value="${sellSmokeInstall.installUserMobile}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;安装时间</label>
                                        <div class="col-md-12">
                                            <input type="text" name="agentId" required="required" class="form-control" value="<fmt:formatDate value="${sellSmokeInstall.installTime}" pattern="yyyy-MM-dd"/>" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12">&nbsp;安装备注</label>
                                        <div class="col-md-12">
                                            <textarea id="installRemark" name="installRemark" maxlength="100" class="form-control" rows="5" disabled>${sellSmokeInstall.installRemark}</textarea>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;设备类型</label>
                                        <div class="col-md-12">
                                            <input type="text" name="store" required="required" maxlength="50"
                                                   class="form-control" value="${dic.name}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;设备数量</label>
                                        <div class="col-md-12">
                                            <input type="text" name="store" required="required" maxlength="50"
                                                   class="form-control" value="${sellSmokeInstall.tNumber}" disabled/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-md-12"><label style="color: #f05b4f">*</label>&nbsp;安装状态</label>
                                        <div class="col-md-12">
                                            <c:if test="${sellSmokeInstall.status == 0}">
                                                <input type="text" required="required" maxlength="50" class="form-control" value="待处理" disabled/>
                                            </c:if>
                                            <c:if test="${sellSmokeInstall.status == 1}">
                                                <input type="text" required="required" maxlength="50" class="form-control" value="处理中" disabled/>
                                            </c:if>
                                            <c:if test="${sellSmokeInstall.status == 2}">
                                                <input type="text" required="required" maxlength="50" class="form-control" value="已安装" disabled/>
                                            </c:if>
                                            <c:if test="${sellSmokeInstall.status == 3}">
                                                <input type="text" required="required" maxlength="50" class="form-control" value="取消安装" disabled/>
                                            </c:if>
                                        </div>
                                    </div>

                                    <c:forEach items="${sellSmokeTerminals}" var="data" varStatus="index">
                                        <div class="form-group">
                                            <label class="col-md-6"><label style="color: #f05b4f">*</label>&nbsp;安装设备型号${index.index}</label>
                                            <label class="col-md-6"><label style="color: #f05b4f">*</label>&nbsp;安装设备名称${index.index}</label>
                                            <div class="col-md-6">
                                                <input type="text" name="terminalCode${i}" required="required" maxlength="50"
                                                       class="form-control" value="${data.terminalCode}" disabled/>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="text" name="terminalName${index.index}" required="required" maxlength="50"
                                                       class="form-control" value="${data.terminalName}" disabled/>
                                            </div>
                                        </div>
                                    </c:forEach>


                                    <div class="form-group">
                                        <label class="col-md-12">&nbsp;&nbsp;撤回原因</label>
                                        <div class="col-md-12">
                                            <c:if test="${sellSmokeInstall.remark != null && sellSmokeInstall.remark != ''}">
                                                <textarea id="remark" name="remark" maxlength="100" class="form-control" rows="5">${sellSmokeInstall.remark}</textarea>
                                            </c:if>
                                            <c:if test="${sellSmokeInstall.remark == null || sellSmokeInstall.remark == ''}">
                                                <textarea id="remark" name="remark" maxlength="100" class="form-control" rows="5" placeholder="请输入撤回原因"></textarea>
                                            </c:if>
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="col-lg-4"></div>
                                        <div class="col-lg-2 col-sm-4 col-xs-12">
                                            <button class="btn btn-block btn-info text-uppercase" type="submit"
                                                    value="撤回">
                                                <span style="vertical-align: inherit;">撤回</span>
                                            </button>
                                        </div>

                                        <div class="col-lg-2 col-sm-4 col-xs-12">
                                            <button class="btn btn-block btn-primary text-uppercase"
                                                    onclick="history.back()">
                                                <span style="vertical-align: inherit;">返回</span>
                                            </button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
                <%--<div class="col-md-1"></div>--%>
            </div>
            <div class="right-sidebar">
                <%@include file="/WEB-INF/views/include/right.jsp" %>
            </div>
        </div>
        <footer class="footer text-center">
            <%@include file="/WEB-INF/views/include/footer.jsp" %>
        </footer>
    </div>
</div>

<script type="text/javascript">
    function save() {
        var id = $("input[name='id']").val();
        var remark = $("#remark").val();

        swal({
            title: "是否撤回",
            showCancelButton: true,
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: true
        }, function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    url: "${pageContext.request.contextPath}/smoke/revertterminal",
                    type: "POST",
                    dataType: "json",
                    data: {id:id,remark:remark},
                    success: function (result) {
                        if (result.success) {
                            swal({
                                title: "撤回成功",
                                confirmButtonText: "确定"
                            }, function () {
                                location.href = "${pageContext.request.contextPath}/smoke/getconmnginslist";
                            });
                        } else {
                            swal({
                                title: "撤回失败",
                                cancelButtonText: "确定"
                            });
                        }
                    },
                    error: function () {
                        alert("保存失败");
                    }
                });
            }
        });
    }
</script>

</body>
</html>