<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="petclinic" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!--  >%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%-->
<%@ attribute name="name" required="true" rtexprvalue="true"
	description="Name of the active menu: home, owners, vets, error or causes"%>

<nav class="navbar navbar-default" role="navigation" style = "background-color: #eaccad">
	<div class="container">
		<div class="navbar-header">
			<a class="navbar-brand"
				href="<spring:url value="/" htmlEscape="true" />"><span></span></a>
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#main-navbar">
				<span class="sr-only"><os-p>Toggle navigation</os-p></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
		</div>
		<div class="navbar-collapse collapse" id="main-navbar">
			<ul class="nav navbar-nav">

				<petclinic:menuItem active="${name eq 'home'}" url="/"
					title="home page">
					<span class="glyphicon glyphicon-home" aria-hidden="true" style= "color: black"></span>
					<span style= "color: black">Inicio</span>
				</petclinic:menuItem>
				
				<petclinic:menuItem active="${name eq 'owners'}" url="/owners/find"
					title="find owners">
					<span class="glyphicon glyphicon-search" aria-hidden="true" style= "color: black"></span>
					<span style= "color: black" >Buscar propietarios</span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'vets'}" url="/vets"
					title="veterinarians">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true" style= "color: black"></span>
					<span style= "color: black">Veterinarios</span>
				</petclinic:menuItem>


				<petclinic:menuItem active="${name eq 'adoptions'}" url="/adoptions"
					title="adoptions">
					<span class="glyphicon glyphicon-th-list" aria-hidden="true" style= "color: black"></span>
					<span style= "color: black">Adopciones</span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'causes'}" url="/causes"
					title="Causas">
					<span class="glyphicon glyphicon-tree-conifer" aria-hidden="true" style= "color: black"></span>
					<span style= "color: black">Causas</span>
				</petclinic:menuItem>

				<petclinic:menuItem active="${name eq 'health'}" url="/manage/health"
					title="Salud">
					<span class="	glyphicon glyphicon-heart" aria-hidden="true" style= "color: black"></span>
					<span style= "color: black">Salud</span>
				</petclinic:menuItem>
			</ul>
			


			<ul class="nav navbar-nav navbar-right">
				<sec:authorize access="!isAuthenticated()">
					<li><a href="<c:url value="/login" />" style= "color: black">Iniciar sesi&Oacuten</a></li>
					<li><a href="<c:url value="/users/new" />" style= "color: black">Registrarse</a></li>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> <span class="glyphicon glyphicon-user" style= "color: black"></span>
							<strong><sec:authentication property="name" /></strong> <span
							class="glyphicon glyphicon-chevron-down" style= "color: black"></span>
					</a>
						<ul class="dropdown-menu">
							<li>
								<div class="navbar-login">
									<div class="row">
										<div class="col-lg-4">
											<p class="text-center">
												<span class="glyphicon glyphicon-user icon-size" style="font-size: 50px; color:black"></span>
											</p>
										</div>
										<div class="col-lg-8">
											<p class="text-left">
												<strong ><sec:authentication property="name" /></strong>
											</p>
											<p class="text-left">
												<a href="<c:url value="/logout" />"
													class="btn btn-primary btn-block btn-sm" style= "color: black">Cerrar sesi&oacuten</a>
											</p>
										</div>
									</div>
								</div>
							</li>
							<li class="divider"></li>
<!-- 							
                            <li> 
								<div class="navbar-login navbar-login-session">
									<div class="row">
										<div class="col-lg-12">
											<p>
												<a href="#" class="btn btn-primary btn-block">Mi perfil</a>
												<a href="#" class="btn btn-danger btn-block">Cambiar
													Contrase&ntildea</a>
											</p>
										</div>
									</div>
								</div>
							</li>
-->
						</ul></li>
				</sec:authorize>
			</ul>
		</div>



	</div>
</nav>
