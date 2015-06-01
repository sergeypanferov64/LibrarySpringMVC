<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>


<c:if test="${memberHomeBooks.size() != 0}">
    <table class="table table-bordered table-hover">
        <caption>Книги, которые Вы взяли на чтение</caption>
        <tr>
            <td>#</td>
            <td>Название</td>
            <td>Авторы</td>
        </tr>
        <c:forEach items="${memberHomeBooks}" var="book" varStatus="booksStatus">
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
</c:if>
<c:if test="${memberHomeBooks.size() == 0}">
    <p>У Вас нет ни одной нашей книги</p>    
</c:if>

<c:if test="${memberLockedBooks.size() != 0}">
    <table class="table table-bordered table-hover">
        <caption>Книги, которые Вы отложили чтобы взять на чтение</caption>
        <tr>
            <td>#</td>
            <td>Название</td>
            <td>Авторы</td>
        </tr>
        <c:forEach items="${memberLockedBooks}" var="book" varStatus="booksStatus">
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
</c:if>
<c:if test="${memberLockedBooks.size() == 0}">
    <p>У Вас нет ни одной отложенной книги</p>    
</c:if>