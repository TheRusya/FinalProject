<%@ page pageEncoding="UTF-8"%>
<%@ include file="/jspf/page.jsp" %>
<%@ include file="/jspf/taglib.jsp"%>

<html>

<c:set var="title" value="Motanka | Login" scope="page"/>
<%@ include file="/jspf/head_page.jsp"%>

<body>
<%@include file="/jspf/header.jsp"%>

<script>
    function updateStatus(orderId, statusId){
        $.ajax({
            async: false,
            type: "POST",
            url: ${pageContext.request.contextPath} + '/view',
            data_type: 'text',
            data: 'command=update_status&order_id=' + orderId + '&status_id=' + statusId
        });
    }
</script>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2" style="background-color: #484848; min-height: 700px; padding-top: 40px; color: #ffffff">
            <h3 style="text-decoration: underline">
                <fmt:message key="cabinet.my_orders" />
            </h3>
            <h3 style="margin-top: 30px">
                <a href="${pageContext.request.contextPath}/view/logout"><fmt:message key="header.logout" /></a>
            </h3>
        </div>
        <div class="col-sm-1">

        </div>
        <div class="col-sm-9" style="padding-right: 50px;">
            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">id</th>
                    <th scope="col">Email</th>
                    <th scope="col">Address</th>
                    <th scope="col">Country</th>
                    <th scope="col">Delivery</th>
                    <th scope="col">Items</th>
                    <th scope="col">Status</th>
                </tr>
                </thead>

                <tbody>
                <c:choose>
                    <c:when test="${not empty user_bean}">
                        <c:forEach var="item_bean" items="${user_bean}">
                            <tr>
                                <th scope="row">${item_bean.id}</th>
                                <td>${item_bean.email}</td>
                                <td>
                                        ${item_bean.address}, <br>
                                        ${item_bean.city}
                                </td>
                                <td>${item_bean.country}</td>
                                <td>${item_bean.delivery_type}</td>
                                <td>
                                    <c:forEach var="item" items="${item_bean.items}">
                                        ${item.key.title} x${item.value}<br>
                                    </c:forEach>
                                </td>
                                <td>
                                        ${item_bean.status}
                                        <%--                            <select name="" data-id="" style="color: black" onchange="updateStatus(${item_bean.id}, value)">--%>
                                        <%--                                <option value="1" style="color: black" <c:choose><c:when test="${item_bean.status.equals('registered')}">selected</c:when></c:choose>>Registered</option>--%>
                                        <%--                                <option value="2" style="color: black" <c:choose><c:when test="${item_bean.status.equals('paid')}">selected</c:when></c:choose>>Payed</option>--%>
                                        <%--                                <option value="3" style="color: black" <c:choose><c:when test="${item_bean.status.equals('canceled')}">selected</c:when></c:choose>>Canceled</option>--%>
                                        <%--                            </select>--%>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:when>
                </c:choose>

                </tbody>
            </table>
            <c:choose>
                <c:when test="${empty user_bean}">
                    <div class="container-fluid">
                        <h1 class="text-center">Empty</h1>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>



<%@ include file="/jspf/footer.jsp"%>

</body>

</html>