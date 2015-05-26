<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ru.spanferov.library.domain.Order"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
    <p>ID: <c:out value="${order.id}"/></p>
    <p>Заказчик: <c:out value="${order.user.lastName} ${order.user.firstName} ${order.user.middleName}"/></p>
    <p>Книга: <c:out value="${order.bookInstance.book.title}"/></p>
    <p>Инвентарный номер: <c:out value="${order.bookInstance.id}"/></p>
    <p>Статус: <c:out value="${Order.getStatusNameById(order.status)}"/></p>
</div>

<c:if test="${order.status < 2}">
    <form method="GET" action="${pageContext.request.contextPath}/order" class="form-inline">
        <input type="hidden" name="orderId" value="${order.id}" />
        <button name="operation" type="submit" value="nextStatus" class="btn btn-default">Next Status</button>
    </form>
</c:if>

<div>
    <table class="table table-bordered table-hover">
        <caption>История</caption>
        <tr>
            <td>#</td>
            <td>ID записи</td>
            <td>Дата</td>
            <td>Статус</td>
        </tr>
        <c:forEach items="${order.orderEntries}" var="orderEntry" varStatus="itStatus">
            <tr>
                <td>
                    <c:out value="${itStatus.count}"/>
                </td>
                <td>
                    <c:out value="${orderEntry.id}"/>
                </td>
                <td>
                    <fmt:formatDate value="${orderEntry.date}" pattern="yyyy-MM-dd HH:mm" />
                </td>
                <td>
                    <c:out value="${Order.getStatusNameById(orderEntry.newStatus)}"/>
                </td>
            </tr>
        </c:forEach>		
    </table>
</div>
