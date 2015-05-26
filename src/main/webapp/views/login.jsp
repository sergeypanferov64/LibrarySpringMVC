<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="login-box">

    <c:if test="${not empty error}">
        <div class="error">${error}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="msg">${msg}</div>
    </c:if>

    <c:url value='/j_spring_security_check' var="loginUrl"/>
    
    <form name='loginForm' action="${loginUrl}" method='POST' class='form-horizontal'>
        <div class="form-group">
            <label for="inputEmail" class="control-label">Email</label>
            <div>
                <input type="text" name='username' class="form-control" id="inputEmail">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="control-label">Пароль</label>
            <div>
                <input type="password" name='password' class="form-control" id="inputPassword">
            </div>
        </div>
        <div class="form-group">
            <div>
                <button type="submit" class="btn btn-default">Войти</button>
            </div>
        </div>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    
</div>
