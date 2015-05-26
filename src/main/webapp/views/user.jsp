<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div>
    <h4><c:out value="${user.lastName} ${user.firstName} ${user.middleName}"/></h4>
</div>
<div>
    <p>Дата рождения: <fmt:formatDate value="${user.birthdate}" pattern="yyyy-MM-dd" /></p>
    <p>Почта: <c:out value="${user.email}"/></p>
    <p>Роль: <c:out value="${user.role}"/></p>
</div>
<div>
    <form method="GET" action="${pageContext.request.contextPath}/user" class="form-inline">
        <input type="hidden" name="userId" value="${user.id}" />
        <div class="btn-group" role="group">
            <button name="operation" type="submit" value="edit" class="btn btn-default">Change</button>
            <button name="operation" type="submit" value="delete" class="btn btn-default">Delete</button>
        </div>
    </form>
</div>