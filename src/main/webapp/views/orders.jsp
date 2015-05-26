<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ru.spanferov.library.domain.Order"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<sf:form modelAttribute="orderSearchCriteria" method="GET" class="form-inline">
    <div class="form-group">
        <sf:input type="number" path="id" class="form-control" placeholder="ID"/>
    </div>
    <div class="form-group">
        <sf:select size="1" path="status" class="form-control">
            <sf:option label="ALL" value="-1"/>
            <sf:options items="${orderStatuses}"/>
        </sf:select>
    </div>
        <sf:button class="btn btn-default">Поиск</sf:button>
</sf:form>

<table class="table table-bordered table-hover">
    <tr>
        <td><b>#</b></td>
        <td><b>Читатель</b></td>
        <td><b>Книга</b></td>
        <td><b>Инвентарный номер книги</b></td>
        <td><b>Статус</b></td>
    </tr>
    <c:forEach items="${orderList}" var="order" varStatus="ordersStatus">
        <s:url value="order" var="orderURL">
            <s:param name='orderId' value="${order.id}"/>
            <s:param name='operation' value="show"/>
        </s:url>
        <tr>
            <td>
                <a href="${orderURL}">
                    <c:out value="${order.id}"/>
                </a>
            </td>
            <td>
                <b><c:out value="${order.user.email}"/></b>
            </td>
            <td>
                <b><c:out value="${order.bookInstance.book.title}"/></b>
            </td>
            <td>
                <b><c:out value="${order.bookInstance.id}"/></b>
            </td>
            <td>
                <b><c:out value="${Order.getStatusNameById(order.status)}"/></b>
            </td>
        </tr>
    </c:forEach>		
</table>