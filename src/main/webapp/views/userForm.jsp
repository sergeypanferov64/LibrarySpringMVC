<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<sf:form action="${pageContext.request.contextPath}/newUser" method="POST" modelAttribute="user" cssClass="well form-vertical">

    <sf:hidden path="id"/>

    <div class="form-group">
        <label for="inputEmail">Email</label>
        <sf:input type="text" path="email" size="15" class="form-control" id="inputEmail" placeholder="email"/><br/>
        <sf:errors path="email" cssClass="error" />
    </div>

    <div class="form-group">
        <label for="inputPassword">Пароль</label>
        <sf:input type="password" path="password" size="15" class="form-control" id="inputPassword" placeholder="не меньше 6ти символов"/><br/>
        <sf:errors path="password" cssClass="error" />
    </div>

    <div class="form-group">
        <label for="inputLastName">Фамилия</label>
        <sf:input type="text" path="lastName" size="15" class="form-control" id="inputLastName"/><br/>
        <sf:errors path="lastName" cssClass="error" />
    </div>

    <div class="form-group">
        <label for="inputFirstName">Имя</label>
        <sf:input type="text" path="firstName" size="15" class="form-control" id="inputFirstName"/><br/>
        <sf:errors path="firstName" cssClass="error" />
    </div>

    <div class="form-group">
        <label for="inputMiddleName">Отчество</label>
        <sf:input type="text" path="middleName" size="15" class="form-control" id="inputMiddleName"/><br/>
    </div>
            <sf:errors path="middleName" cssClass="error" />


    <div class="form-group">
        <label for="inputBirthdate">Дата рождения</label>
        <sf:input type="date" path="birthdate" size="15" class="form-control" id="inputBirthdate"/>
        <sf:errors path="birthdate" cssClass="error" />
    </div>

    <div class="form-group">
        <sf:select items="${roles}" path="role" size="1" class="form-control"/>
    </div>

    <sf:button class="btn btn-default">OK</sf:button>

</sf:form>