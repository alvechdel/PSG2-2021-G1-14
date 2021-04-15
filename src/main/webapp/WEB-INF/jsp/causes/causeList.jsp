<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>


<petclinic:layout pageName="causes">
    <h2>Causes</h2>
    <spring:url value="/causes/new" var="causeUrl">
                    </spring:url>
                    <a class="btn btn-default" href="${fn:escapeXml(causeUrl)}">New cause</a>
    <spring:url value="" var="">
                    </spring:url>
                    <a class="btn btn-default" href="${fn:escapeXml(causeUrl)}">Donate</a>
    <table id="causeTable" class="table table-striped">
        <thead>
        <tr>
            <th style="width: 150px;">Name</th>
            <th style="width: 150px;">Description</th>
            <th style="width: 150px;">Organization name</th>
            <th style="width: 120px">Budget archieved</th>
            <th style="width: 120px">Budget Target</th>
            <th style="width: 120px">Active</th>
            <th style="width: 120px">Actions</th>    
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${causes}" var="cause">
            <tr>
                <td>
                    <c:out value="${cause.name}"/>
                </td>
                <td>
                    <c:out value="${cause.description}"/>
                </td>
                <td>
                    <c:out value="${cause.organization}"/>
                </td>
                <td>
    				
                </td>
                <td>
                    <c:out value="${cause.budget}"/>
                </td>
                <td>
                    <c:out value="${cause.activeStatus}"/>
                </td>
				<td>
				
                    <a class="btn btn-default"  href="${fn:escapeXml(causeUrl)}">Details</a>

                </td>
             

            </tr>
        </c:forEach>
        </tbody>
    </table>
</petclinic:layout>