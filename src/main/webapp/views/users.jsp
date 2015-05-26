<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<table class="table table-bordered table-hover">
    <tr>
        <td><b>Email</b></td>
        <td><b>ФИО</b></td>
        <td><b>Дата рождения</b></td>
    </tr>
    <c:forEach items="${userList}" var="user" varStatus="usersStatus">
        <s:url value="user" var="userURL">
            <s:param name='userId' value="${user.id}"/>
            <s:param name='operation' value="show"/>
        </s:url>
        <tr>
            <td>
                <b><c:out value="${user.email}"/></b>
            </td>
            <td>
                <a href="${userURL}">
                    <c:out value="${user.lastName} ${user.firstName} ${user.middleName}"/>
                </a>
            </td>
            <td>
                <b><fmt:formatDate value="${user.birthdate}" pattern="yyyy-MM-dd" /></b>
            </td>
        </tr>
    </c:forEach>		
</table>