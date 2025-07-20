<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="fas fa-users me-2" style="color: #1abc9c;"></i>Usuários</h2>
        <a href="${pageContext.request.contextPath}/UsuarioNovo" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Novo Usuário
        </a>
    </div>

    <div class="mb-3 form-check">
        <input type="checkbox" class="form-check-input" id="mostrarSenhas" onchange="toggleSenhas()">
        <label class="form-check-label" for="mostrarSenhas">Mostrar senhas</label>
    </div>

    <c:choose>
        <c:when test="${empty usuarios}">
            <div class="alert alert-info border-start border-5 border-primary">
                <div class="d-flex align-items-center">
                    <i class="fas fa-info-circle me-3 fs-4" style="color: #1abc9c;"></i>
                    <div>
                        <h5 class="alert-heading">Nenhum usuário cadastrado</h5>
                        <p class="mb-0">Clique no botão "Novo Usuário" para começar</p>
                    </div>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <div class="card border-0 shadow-sm">
                <div class="card-body p-0">
                    <table id="datatable" class="table table-hover mb-0">
                        <thead class="table-light">
                            <tr>
                                <th style="background-color: #f8f9fa; color: #2c3e50;">ID</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;">Nome</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;">Email</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;">Senha</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;" class="text-center">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="usuario" items="${usuarios}">
                                <tr>
                                    <td>${usuario.idUsuario}</td>
                                    <td>${usuario.nome}</td>
                                    <td>${usuario.email}</td>
                                    <td>
                                        <span class="senha-oculta">
                                            <i class="fas fa-lock me-1"></i>????????
                                        </span>
                                        <span class="senha-real" style="display: none;">
                                            <i class="fas fa-eye me-1"></i>${usuario.senha}
                                        </span>
                                    </td>
                                    <td class="text-center">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="${pageContext.request.contextPath}/UsuarioCarregar?idUsuario=${usuario.idUsuario}" 
                                               class="btn btn-outline-primary"
                                               style="border-color: #1abc9c; color: #2c3e50;">
                                                <i class="fas fa-edit" style="color: #1abc9c;"></i> Editar
                                            </a>
                                            <a href="${pageContext.request.contextPath}/UsuarioExcluir?idUsuario=${usuario.idUsuario}" 
                                               class="btn btn-outline-danger"
                                               onclick="return confirm('Tem certeza que deseja excluir este usuário?')">
                                                <i class="fas fa-trash-alt"></i> Excluir
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-outline-secondary">
            <i class="fas fa-home me-1"></i> Voltar à Página Inicial
        </a>
    </div>
</div>

<script>
    // Função simples para alternar senhas
    function toggleSenhas() {
        var checkbox = document.getElementById('mostrarSenhas');
        var senhasOcultas = document.querySelectorAll('.senha-oculta');
        var senhasReais = document.querySelectorAll('.senha-real');
        
        if (checkbox.checked) {
            // Mostrar senhas reais
            senhasOcultas.forEach(function(elemento) {
                elemento.style.display = 'none';
            });
            senhasReais.forEach(function(elemento) {
                elemento.style.display = 'inline';
            });
        } else {
            // Ocultar senhas
            senhasReais.forEach(function(elemento) {
                elemento.style.display = 'none';
            });
            senhasOcultas.forEach(function(elemento) {
                elemento.style.display = 'inline';
            });
        }
    }

    // Inicialização do DataTable (se jQuery estiver disponível)
    $(document).ready(function(){
        if (typeof $.fn.dataTable !== 'undefined') {
            $('#datatable').DataTable({
                "language": {
                    "sProcessing": "Processando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "Nenhum registro encontrado",
                    "sInfo": "Mostrando _START_ a _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando 0 a 0 de 0 registros",
                    "sInfoFiltered": "(filtrado de _MAX_ registros totais)",
                    "sSearch": "<i class='fas fa-search'></i> Buscar:",
                    "oPaginate": {
                        "sFirst": "<i class='fas fa-angle-double-left'></i>",
                        "sPrevious": "<i class='fas fa-angle-left'></i>",
                        "sNext": "<i class='fas fa-angle-right'></i>",
                        "sLast": "<i class='fas fa-angle-double-right'></i>"
                    }
                }
            });
        }
    });
</script>

<style>
    .btn-outline-primary:hover {
        background-color: #1abc9c;
        color: white !important;
    }
    .table-hover tbody tr:hover {
        background-color: rgba(26, 188, 156, 0.1);
    }
    .card {
        border-radius: 10px;
        overflow: hidden;
    }
    thead th {
        border-bottom: 2px solid #1abc9c !important;
    }
    .senha-oculta {
        padding: 4px 8px;
        border-radius: 4px;
        background-color: #f8f9fa;
        border: 1px solid #dee2e6;
        display: inline-block;
        min-width: 100px;
        text-align: center;
    }
    .senha-real {
        font-family: 'Courier New', monospace;
        font-weight: bold;
        color: #dc3545;
        padding: 4px 8px;
        background-color: #fff3cd;
        border: 1px solid #ffeaa7;
        border-radius: 4px;
        display: inline-block;
        min-width: 100px;
    }
    .form-check-input:checked {
        background-color: #1abc9c;
        border-color: #1abc9c;
    }
</style>

<%@include file="/footer.jsp" %>