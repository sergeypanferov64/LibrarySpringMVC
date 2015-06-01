<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<sf:form method="GET" modelAttribute="bookSearchCriteria" class="form-inline">
    <fieldset>
        <div class="form-group">
            <sf:input type="text" path="title" size="10" class="form-control" placeholder="Title"/>
        </div>
        <div class="form-group">
            <sf:input type="text" path="author" size="10" class="form-control" placeholder="Author"/>
        </div>
        <sf:button class="btn btn-default">Найти</sf:button>
        </fieldset>
</sf:form>

<table class="table table-bordered table-hover">
    <tr>
        <td><b>#</b></td>
        <td><b>Название</b></td>
        <td><b>Авторы</b></td>
    </tr>
    <c:forEach items="${bookList}" var="book" varStatus="booksStatus">
        <s:url value="book" var="bookURL">
            <s:param name='bookId' value="${book.id}"/>
            <s:param name='operation' value="show"/>
        </s:url>
        <tr>
            <td>
                <b><c:out value="${booksStatus.count}"/></b>
            </td>
            <td>
                <a href="${bookURL}">
                    <c:out value="${book.title}"/>
                </a>
            </td>
            <td>
                <c:forEach items="${book.authors}" var="author">
                    <c:out value="${author.name}"/>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>		
</table>