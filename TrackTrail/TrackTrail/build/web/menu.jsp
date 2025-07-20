<nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><span>Track</span>Trail</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'usuarios' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/UsuarioListar">
                       <i class="fas fa-users me-2"></i>Usuários
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'rotas' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/RotaListar">
                       <i class="fas fa-route me-2"></i>Rotas
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'atividades' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/AtividadeListar">
                       <i class="fas fa-hiking me-2"></i>Atividades
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${param.active == 'realizadas' ? 'active' : ''}" 
                       href="${pageContext.request.contextPath}/AtividadeRealizadaListar">
                       <i class="fas fa-check-circle me-2"></i>Atividades Realizadas
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container mt-4">