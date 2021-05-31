<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="requests">
    <h2>Solicitudes de Adopcion</h2>

    <table id="requestsTable" class="table table-striped">
        <thead>
            <tr>
                <th>Mascota</th>
                <th>Interesado</th>
                <th>Fecha</th>
                <th>Comentario</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${requests}" var="request">
                <tr>
                    <td><c:out value="${request.pet.name}"></c:out></td>
                    <td><c:out value="${request.owner.firstName} ${request.owner.lastName}"></c:out></td>
                    <td><petclinic:localDate date="${request.date}" pattern="yyyy-MM-dd"/></td>
                    <td><c:out value="${request.comment}"></c:out></td>
                    <td>
                        <form action="/request/accept" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="requestId" value='<c:out value="${request.id}"/>'>
                            <button class="btn btn-default" type="submit">Aceptar Solicitud</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

</petclinic:layout>