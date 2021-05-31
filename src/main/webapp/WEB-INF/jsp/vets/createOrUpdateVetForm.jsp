<%@ page session="false" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags" %>

<petclinic:layout pageName="vet">
    <h2>
        <c:if test="${vet['new']}">Nuevo</c:if> Veterinario
    </h2>
    <form:form modelAttribute="vet" class="form-horizontal" id="add-vet-form">
        <div class="form-group has-feedback">
            <petclinic:inputField label="Nombre" name="firstName"/>
            <petclinic:inputField label="Apellidos" name="lastName"/>
            <div class="control-group">
                <label class="col-sm-2 control-label" style="padding-right:25px;" for="specialties">Especialidades</label>
                <div class="col-sm-10">
                    <select class="form-control"  name="specialties" size="${specialties.size()}" multiple>
                        <c:forEach items="${specialties}" var="specialty">
                            <option value="${specialty.id}"><c:out value="${specialty}"></c:out></option>
                        </c:forEach>
                    </select>
                </div>  
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <c:choose>
                    <c:when test="${vet['new']}">
                        <button class="btn btn-default" type="submit">A&ntildeadir veterinario</button>
                    </c:when>
                    <c:otherwise>
                        <button class="btn btn-default" type="submit">Editar veterinario</button>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </form:form>
</petclinic:layout>
