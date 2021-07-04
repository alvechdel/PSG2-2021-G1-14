<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ page contentType="text/html; charset=UTF-8" %>  


<petclinic:layout pageName="causes">
    <h2>Causas</h2>
    <spring:url value="/causes" var="activeCauseUrl">
    </spring:url>
	<a class="btn btn-default" href="${fn:escapeXml(activeCauseUrl)}">Activas</a>

    <spring:url value="/causes/inactive" var="inactiveCauseUrl">
    </spring:url>
    <a class="btn btn-default" href="${fn:escapeXml(inactiveCauseUrl)}">Inactivas</a>
    
    <table id="causeTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Nombre</th>
            <th style="width: 120px">Financiaci&oacute;n recaudada (&euro;)</th>
            <th style="width: 120px">Objetivo (&euro;)</th>
            <th style="width: 120px">Acciones</th>    
        </tr>
        </thead>
        <tbody>
        
        <c:forEach items="${causes}" var="cause">
                <tr>
                    <td>
                    	
                       <c:out value="${cause.name}"/>
                       
                    </td>
                    <td>
                        <c:out value="${cause.totalAmount}"/>

                    </td>
                    <td>
                        <c:out value="${cause.budget}"/>
                    </td>
                    
                    <td>
                        <spring:url value="/causes/{causeId}" var="detailsCause">
                            <spring:param name="causeId" value="${cause.id}"/>
                        </spring:url>
                        
                        <a class="btn btn-default"  href="${fn:escapeXml(detailsCause)}">Detalles</a>
                        <p>&nbsp;</p>
                        <c:if test="${cause.activeStatus eq true}">
                   		
                        
                             <a class="btn btn-default"  href="${fn:escapeXml(donationUrl)}">Donar para esta causa</a>
                                <spring:url value="/causes/{causeId}/newDonation" var="donationUrl">
                                    <spring:param name="causeId" value="${cause.id}"/>
                                </spring:url>
                                
                               
                               
                               <sec:authorize access="hasAuthority('admin')">
	                               <spring:url value="/causes/{causeId}/delete" var="causeUrl">
	                                    <spring:param name="causeId" value="${cause.id}"/>
	                                </spring:url>
                                
                                
	                                <a class="btn btn-default"  href="${fn:escapeXml(causeUrl)}">Eliminar causa</a>
	                                
	                                <spring:url value="/causes/{causeId}/edit" var="causeUrl">
	                                    <spring:param name="causeId" value="${cause.id}"/>
	                                </spring:url>
                               
                                	<a class="btn btn-default"  href="${fn:escapeXml(causeUrl)}">Editar causa</a>
                          		</sec:authorize>
                        </c:if>
                       
                    </td>
                </tr>
        </c:forEach>
   
        </tbody>
         
    </table>
    
    <spring:url value="/causes/new" var="newCause">
    	</spring:url>
	<a class="btn btn-default" href="${fn:escapeXml(newCause)}">Nueva Causa</a>
</petclinic:layout>