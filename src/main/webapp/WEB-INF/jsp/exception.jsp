<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="error">

    <spring:url value="/resources/images/sad-dog.png" var="petsImage"/>
    <img src="${petsImage}"/>

    <h2>Algo paso...</h2>

    <p>${exception.message}</p>

</petclinic:layout>
