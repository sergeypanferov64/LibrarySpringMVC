<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<sf:form method="POST" modelAttribute="book" theme="bootstrap" cssClass="well form-vertical">

    <sf:hidden path="id"/>
    <div class="form-group">
        <label for="inputTitle">Название</label>
        <sf:input  type="text" path="title" size="15" class="form-control" id="inputTitle" placeholder="Название"/>
        <sf:errors path="title" cssClass="error" />
    </div>
    <div class="form-group">
        <sf:select items="${authorsList}" itemLabel="name" itemValue="id" path="authors" size="5"/>
        <sf:errors path="authors" cssClass="error" />
    </div>
    <div class="form-group">
        <label for="inputDescription">От издательства</label>
        <sf:input type="text" path="description" size="15" class="form-control" id="inputDescription" placeholder="..."/>
    </div>
    <div class="form-group">
        <label for="inputImprintDate">Год издания</label>
        <sf:input type="number" path="imprintDate" size="15" class="form-control" id="inputImprintDate" placeholder="год"/>
        <sf:errors path="imprintDate" cssClass="error" />
    </div>
    <div class="form-group">
        <label for="inputNumOfPages">Количество страниц</label>
        <sf:input type="number" path="numOfPages" size="15" class="form-control" id="inputNumOfPages" placeholder="количество страниц"/>
        <sf:errors path="numOfPages" cssClass="error" />
    </div>
    <sf:button class="btn btn-default">Создать</sf:button>

</sf:form>


<sf:form action="${pageContext.request.contextPath}/newAuthor" method="POST" modelAttribute="author" theme="bootstrap" cssClass="well form-vertical">
    <sf:hidden path="id"/>
    <div class="form-group">
        <label for="inputName">Авторское имя</label>
        <sf:input  type="text" path="name" size="15" class="form-control" id="inputName" placeholder="имя"/>
        <sf:errors path="name" cssClass="error" />
    </div>
    <sf:button name="newAuthor" class="btn btn-default">Добавить автора</sf:button>
</sf:form>