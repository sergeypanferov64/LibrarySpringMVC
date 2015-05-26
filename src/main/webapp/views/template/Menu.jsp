<%@ page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>


<c:url value="/j_spring_security_logout" var="logoutUrl" />
<form action="${logoutUrl}" method="post" id="logoutForm">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form>
<script>
    function formSubmit() {
        document.getElementById("logoutForm").submit();
    }
</script>


<ul class="nav nav-pills nav-stacked">

    <security:authorize url="/orders/**">
        <li>
            <a href="orders" >Журнал</a>
        </li>
    </security:authorize>

    <security:authorize url="/users/**">
        <li>
            <a href="users" >Читатели</a>
        </li>
    </security:authorize>

    <security:authorize url="/newUser/**">
        <li>
            <a href="newUser" >Новый читатель</a>
        </li>
    </security:authorize>

    <security:authorize url="/member">
        <li>
            <a href="member" >Мои книги</a>
        </li>
    </security:authorize>

    <security:authorize url="/books">
        <li>
            <a href="books" >Книги</a>
        </li>
    </security:authorize>

    <security:authorize url="/newBook/**">
        <li>
            <a href="newBook" >Новая книга</a>
        </li>
    </security:authorize>


    <li><a href="home" >О Библиотеке</a></li>
    <li><a href="contacts" >Контакты</a></li>

    <security:authorize access="!isAuthenticated()">
        <li>
            <a href="login">Войти</a>
        </li>
    </security:authorize>
    <security:authorize access="isAuthenticated()">
        <li>
            <a href="javascript:formSubmit()">Выйти</a>
        </li>
    </security:authorize>

</ul>


<!-- 
<input type='hidden' id='activeTabHref' value='${activeTab}' />

<script type="text/javascript">
    $(function() {
        $('[href=' + $('activeTabHref').val() + ']').class('');
    });
</script>
-->
