<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<<<<<<< HEAD
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
=======
<%@ page contentType="text/html; charset=UTF-8" %>
>>>>>>> 8a82ab942abe82606f667bf5e0abdbd0b6088360

<petclinic:layout pageName="owners">

    <h2>Informaci&oacuten del propietario</h2>


    <table class="table table-striped"> 
        <tr>
            <th>Nombre</th>
            <td><b><c:out value="${owner.firstName} ${owner.lastName}"/></b></td>
        </tr>
        <tr>
            <th>Direcci&oacuten</th>
            <td><c:out value="${owner.address}"/></td>
        </tr>
        <tr>
            <th>Ciudad</th>
            <td><c:out value="${owner.city}"/></td>
        </tr>
        <tr>
            <th>Tel&eacutefono</th>
            <td><c:out value="${owner.telephone}"/></td>
        </tr>
    </table>

    <spring:url value="{ownerId}/edit" var="editUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
    </spring:url>

    <c:if test="${owner.id == logged.id}">
        <a href="${fn:escapeXml(editUrl)}" class="btn btn-default">Editar propietario</a>
        <spring:url value="{ownerId}/delete" var="deleteUrl">
            <spring:param name="ownerId" value="${owner.id}"/>
        </spring:url>

        <spring:url value="{ownerId}/pets/new" var="addUrl">
            <spring:param name="ownerId" value="${owner.id}"/>
        </spring:url>
        <a href="${fn:escapeXml(addUrl)}" class="btn btn-default">A&ntildeadir mascota</a>


        <spring:url value="{ownerId}/requests" var="requestsUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
        </spring:url>
        <a href="${fn:escapeXml(requestsUrl)}" class="btn btn-default">Ver solicitudes</a>
    </c:if>
    
    <sec:authorize access="hasAuthority('admin')">
        <a href="${fn:escapeXml(editUrl)}" class="btn btn-default">Editar propietario</a>
        <spring:url value="{ownerId}/delete" var="deleteUrl">
            <spring:param name="ownerId" value="${owner.id}"/>
        </spring:url>

        <a href="${fn:escapeXml(deleteUrl)}" class="btn btn-default">Eliminar propietario</a>
        
        <spring:url value="{ownerId}/requests" var="requestsUrl">
        <spring:param name="ownerId" value="${owner.id}"/>
        </spring:url>
        <a href="${fn:escapeXml(requestsUrl)}" class="btn btn-default">Ver solicitudes</a>

    </sec:authorize>
  

    <br/>
    <br/>
    <br/>
    <h2>Mascotas y Visitas</h2>

    <table class="table table-striped">
        <c:forEach var="pet" items="${owner.pets}">

            <tr>
                <td valign="top">
                    <dl class="dl-horizontal">
                        <dt>Nombre</dt>
                        <dd><c:out value="${pet.name}"/></dd>
                        <dt>Fecha de nacimiento</dt>
                        <dd><petclinic:localDate date="${pet.birthDate}" pattern="yyyy-MM-dd"/></dd>
                        <dt>Tipo</dt>
                        <dd><c:out value="${pet.type.name}"/></dd>
                        <c:if test="${owner.id == logged.id}">
                            <td>
                                <dl>                              
                                    <dt>
                                        <spring:url value="/owners/{ownerId}/pets/{petId}/edit" var="petUrl">
                                            <spring:param name="ownerId" value="${owner.id}"/>
                                            <spring:param name="petId" value="${pet.id}"/>
                                        </spring:url>   
                                        <a href="${fn:escapeXml(petUrl)}" class="btn btn-default">Editar mascota</a>
                                    </dt>
                                    <dt>&nbsp;</dt>
                                    <dt>  
                                        <spring:url value="/owners/{ownerId}/pets/{petId}/delete" var="deletePetUrl">
                                            <spring:param name="ownerId" value="${owner.id}"/>
                                            <spring:param name="petId" value="${pet.id}"/>
                                        </spring:url>
                                        <a href="${fn:escapeXml(deletePetUrl)}" class="btn btn-default">Eliminar mascota</a>
                                    </dt> 
                                </dl>    
                            </td>  
                        </c:if>                    
                    </dl>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                        <tr>
                            <th>Fecha de visita</th>
                            <th>Descripci&oacuten</th>
                        </tr>
                        </thead>
                        <c:forEach var="visit" items="${pet.visits}">
                            <tr>
                                <td><petclinic:localDate date="${visit.date}" pattern="yyyy-MM-dd"/></td>
                                <td><c:out value="${visit.description}"/></td>
                                <c:if test="${owner.id == logged.id}">
                                <td>
                                    <spring:url value="/owners/{ownerId}/pets/{petId}/visits/{visitId}/delete" var="deleteVisitUrl">
                                        <spring:param name="ownerId" value="${owner.id}"/>
                                        <spring:param name="petId" value="${pet.id}"/>
                                        <spring:param name="visitId" value="${visit.id}"/>
                                    </spring:url>
                                    <a href="${fn:escapeXml(deleteVisitUrl)}" class="btn btn-default">Eliminar visita</a>                                   
                                </td>
                                </c:if>   
                            </tr>
                        </c:forEach>
                        <c:if test="${owner.id == logged.id}">
                            <tr>
                                <td>
                                    <spring:url value="/owners/{ownerId}/pets/{petId}/visits/new" var="visitUrl">
                                        <spring:param name="ownerId" value="${owner.id}"/>
                                        <spring:param name="petId" value="${pet.id}"/>
                                    </spring:url>
                                    <a href="${fn:escapeXml(visitUrl)}" class="btn btn-default">A&ntildeadir visita</a>    
                                </td>
                            </tr>    
                        </c:if>   
                    </table>
                </td>
                <td valign="top">
                    <table class="table-condensed">
                        <thead>
                            <tr>
                                <th>Reservas</th>
                            </tr>
                        </thead>
                        <c:forEach var="book" items="${pet.books}">
                            <tr>
                                <td>Fecha de inicio: <petclinic:localDate date="${book.startDate}" pattern="yyyy-MM-dd"/></td>
                                <td>Fecha fin: <petclinic:localDate date="${book.endDate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                        </c:forEach>
                        <c:if test="${owner.id == logged.id}">
                            <tr>
                                <td>
                                    <spring:url value="/owners/{ownerId}/pets/{petId}/books/new" var="bookUrl">
                                        <spring:param name="ownerId" value="${owner.id}"/>
                                        <spring:param name="petId" value="${pet.id}"/>
                                    </spring:url>
                                    <a href="${fn:escapeXml(bookUrl)}">A&ntildeadir reserva</a>
                                </td>
                            </tr>
                        </c:if> 
                    </table>
                </td>
                <c:if test="${not pet.adoption && pet.owner.id eq logged.id}">
                    <td valign="top">
                        <spring:url value="/owners/${owner.id}/pets/{petId}/adopt" var="adoptUrl">
                            <spring:param name="ownerId" value="${owner.id}"/>
                            <spring:param name="petId" value="${pet.id}"/>
                        </spring:url>
                        <form action="${fn:escapeXml(adoptUrl)}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="petId" value='<c:out value="${pet.id}"/>'>
                            <button class="btn btn-default" type="submit">Poner en Adopci&oacuten</button>
                        </form>
                    </td>
                </c:if>
                <c:if test="${pet.adoption && pet.owner.id eq logged.id}">
                    <td valign="top">
                        <spring:url value="/owners/${owner.id}/pets/{petId}/noAdopt" var="noAdoptUrl">
                            <spring:param name="ownerId" value="${owner.id}"/>
                            <spring:param name="petId" value="${pet.id}"/>
                        </spring:url>
                        <form action="${fn:escapeXml(noAdoptUrl)}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <input type="hidden" name="petId" value='<c:out value="${pet.id}"/>'>
                            <button class="btn btn-default" type="submit">Parar adopcion</button>
                        </form>
                </c:if>
        </c:forEach>
    </table>

</petclinic:layout>
