<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<div>
    <h4><c:out value="${book.title}"/></h4>
</div>
<div>
    <p>Авторы: <c:forEach var="author"  items="${book.authors}" varStatus="authorsStatus"> <c:out value="${author.name}"/>  <c:if test="${!authorsStatus.last}">,</c:if>  </c:forEach></p>
    <p>Год издания: <c:out value="${book.imprintDate}"/></p>
    <p>Страниц: <c:out value="${book.numOfPages}"/></p>
    <p>От издательства:</p>
    <p><c:out value="${book.description}"/></p>
</div>

<security:authorize access="hasRole('ROLE_MANAGER')">
    <div>
        <form method="GET" action="${pageContext.request.contextPath}/book" class="form-inline">
            <input type="hidden" name="bookId" value="${book.id}" />
            <div class="btn-group" role="group">
                <button name="operation" type="submit" value="edit" class="btn btn-default">Изменить</button>
                <button name="operation" type="submit" value="delete" class="btn btn-default">Удалить</button>
                <button name="operation" type="submit" value="newInstance" class="btn btn-default">Добавить новый экземпляр</button>
            </div>
        </form>
    </div>
</security:authorize>

<security:authorize access="hasRole('ROLE_MEMBER')">
    <h4>avaliableCode =  <c:out value="${avaliableCode}"/></h4>
    <c:if test = "${avaliableCode == 0}">
        <div>
            <form method="GET" action="${pageContext.request.contextPath}/book" class="form-inline">
                <input type="hidden" name="bookId" value="${book.id}" />
                <button name="operation" type="submit" value="lock" class="btn btn-default">Lock</button>
            </form>
        </div>
    </c:if>
</security:authorize>

<div>
    <h4>Всего <c:out value="${NumberOfAllBookInstances}"/> штук</h4>
    <h4>На складе <c:out value="${NumberOfFreeBookInstances}"/> штук</h4>
    <h4>На руках <c:out value="${NumberOfLockedBookInstances}"/> штук</h4>
</div>