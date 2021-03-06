<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isELIgnored="false"%>

<form id="selectForm">
    <input name="powerId" value="${powerId}" type="hidden"/>
    <input name="systemId" value="${systemId}" type="hidden"/>
    <input name="name" value="" type="hidden"/>
    <input name="code" value="" type="hidden"/>
    <div class="white-box">
        <h3 class="box-title m-b-0">已选择角色</h3>
        <div class="row">
        </div>
        <div class="panel">
            <div class="table-responsive">
                <table class="table table-hover manage-u-table" style="white-space: nowrap">
                    <thead>
                    <tr>
                        <th>角色ID</th>
                        <th>角色名称</th>
                        <th>角色编码</th>
                        <th width="100">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${checkedRoles}" var="role">
                        <tr>
                            <td>${role.id}</td>
                            <td title="${role.name}">
                                <c:set var="str" value="${role.name}"></c:set>
                                <c:choose>
                                    <c:when test="${fn:length(str) > 15}">
                                        <c:out value="${fn:substring(str, 0, 15)}......" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${str}" />
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td title="${role.code}">
                                <c:set var="str" value="${role.code}"></c:set>
                                <c:choose>
                                    <c:when test="${fn:length(str) > 10}">
                                        <c:out value="${fn:substring(str, 0, 10)}......" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:out value="${str}" />
                                    </c:otherwise>
                                </c:choose>
                            </td>
                            <td>
                                <div>
                                    <div style="display: inline-block; width:50%">
                                        <input type="button" class="btn btn-block btn-info btn-xs" value="移除" onclick="remove(${role.id});"/>
                                    </div>
                                    &nbsp;
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td colspan="4">
                            <div class="text-right">
                                <input type="hidden" id="totalPage1" name="totalPage" value="${pagination.totalPage}" />
                                <input type="hidden" id="page1" name="page" value="${pagination.page}" />
                                <ul class="pagination pagination-split">
                                    <c:if test="${pagination.totalPage>1}">
                                        <!-- 总页数大于1页显示上一页和下一页 -->
                                        <c:choose>
                                            <c:when test="${pagination.page>1}">
                                                <li><a href="javascript:skipToPrePage1();"><i class="fa fa-angle-left"></i></a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)"><i class="fa fa-angle-left"></i></a></li>
                                            </c:otherwise>
                                        </c:choose>

                                        <c:forEach items="${pagination.pagesGroup}" var="page" varStatus="status">
                                            <c:if test="${page == pagination.page}">
                                                <li class="active"><a href="javascript:void(0);">${pagination.page}</a></li>
                                            </c:if>
                                            <c:if test="${page != pagination.page}">
                                                <li><a href="javascript:skipPage1('${page}');">${page}</a></li>
                                            </c:if>
                                        </c:forEach>

                                        <c:choose>
                                            <c:when test="${pagination.page<pagination.totalPage}">
                                                <li><a href="javascript:skipToNextPage1();"><i class="fa fa-angle-right"></i></a></li>
                                            </c:when>
                                            <c:otherwise>
                                                <li class="disabled"><a href="javascript:void(0)"><i class="fa fa-angle-right"></i></a></li>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </ul>
                            </div>
                        </td>
                    </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</form>
<script src="${pageContext.request.contextPath}/common/js/tool.js"></script>
<script type="text/javascript">
    function skipToPrePage1() {
        var page = document.getElementById("page1").value;
        var page = Number(page) - 1;
        skipPage1(page);
    }
    function skipToNextPage1() {
        var page = document.getElementById("page1").value;
        var page = Number(page) + 1;
        skipPage1(page);
    }
    function skipPage1(page) {
        var page = Number(page);
        var totalPage = document.getElementById("totalPage1").value;
        if (page > 2147483647) {
            page = 2147483647;
        } else if (page < 0) {
            page = 1;
        }else if(page>totalPage){
            page=totalPage;
        }
        document.getElementById("page1").value = page;

        var url = "${pageContext.request.contextPath}/power/selectrole";
        var data = $("#selectForm").serialize();
        $.ajax({
            type: "POST",
            async: false,
            url: url,
            dataType: "html",
            data: data,
            beforeSend:function () {
                var contentPath = "${pageContext.request.contextPath}";
                show_loading(contentPath, 1, 1.5, 200);
            },
            success: function (result) {
                // 要刷新的div
                $("#select").html(result);
                hide_loading(200);
            }
        })
    }

    // 删除
    function remove(roleId) {
        swal({
            title: "确定移除吗?",
            showCancelButton: true,
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            closeOnConfirm: false,
            closeOnCancel: true
        }, function(isConfirm){
            if (isConfirm) {
                $.ajax({
                    url : "${pageContext.request.contextPath}/power/delrolepower",
                    type : "POST",
                    dataType : "json",
                    data : {"roleId":roleId,"powerId":${powerId},"systemId":${systemId}},
                    success : function(result) {
                        if (result.success) {
                            swal({title : result.msg,
                                confirmButtonText: "确定"}, function(){
                                loadPowerRoles();
                            });
                        }else {
                            swal({title : result.msg,
                                confirmButtonText: "确定"});
                        }
                    },
                    error : function() {
                        alert("删除失败");
                    }
                });
            }
        });
    }

</script>