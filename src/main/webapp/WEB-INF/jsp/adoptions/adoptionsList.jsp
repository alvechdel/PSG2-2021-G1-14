<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>

<petclinic:layout pageName="adoptions">
    <h2>Mascotas para Adoptar</h2>

    <table id="adoptionsTable" class="table table-striped">
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Fecha de Nacimiento</th>
                <th>Tipo</th>
                <th>Due&ntildeo</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <c:forEach items="${pets}" var="pet">
            <tr>
                <td><c:out value="${pet.name}"/></td>
                <td><petclinic:localDate date="${pet.birthDate}" pattern="yyyy-MM-dd"/></td>
                <td><c:out value="${pet.type.name}"/></td>
                <td><c:out value="${pet.owner.firstName} ${pet.owner.lastName}"></c:out></td>
                
                <td>
                    <c:if test="${pet.owner.user ne user}">  
                    <spring:url value="adoptions/{petId}/new" var="addUrl">
                        <spring:param name="petId" value="${pet.id}"/>
                    </spring:url>
                    <a href="${fn:escapeXml(addUrl)}" class="btn btn-default">Realizar solicitud</a>
                </c:if>
                </td>
                 
            </tr>

        </c:forEach>

        </tbody>

    </table>

</petclinic:layout>