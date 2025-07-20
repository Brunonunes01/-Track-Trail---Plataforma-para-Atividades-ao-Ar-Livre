<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="fas fa-route me-2" style="color: #1abc9c;"></i>Rotas</h2>
        <a href="${pageContext.request.contextPath}/RotaNovo" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Nova Rota
        </a>
    </div>

    <c:choose>
        <c:when test="${empty rotas}">
            <div class="alert alert-info border-start border-5 border-primary">
                <div class="d-flex align-items-center">
                    <i class="fas fa-info-circle me-3 fs-4" style="color: #1abc9c;"></i>
                    <div>
                        <h5 class="alert-heading">Nenhuma rota cadastrada</h5>
                        <p class="mb-0">Clique no botão "Nova Rota" para começar</p>
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
                                <th style="background-color: #f8f9fa; color: #2c3e50;">Nome</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;">Distância (Km)</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;">Dificuldade</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;">Duração</th>
                                <th style="background-color: #f8f9fa; color: #2c3e50;" class="text-center">Ações</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="rota" items="${rotas}">
                                <tr>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-map-marker-alt me-2" style="color: #1abc9c;"></i>
                                            <strong>${rota.nome}</strong>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="badge bg-primary rounded-pill">
                                            <i class="fas fa-mountain me-1"></i>${rota.distancia}
                                        </span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${rota.dificuldade eq 'Fácil'}">
                                                <span class="badge bg-success rounded-pill">
                                                    <i class="fas fa-smile me-1"></i>${rota.dificuldade}
                                                </span>
                                            </c:when>
                                            <c:when test="${rota.dificuldade eq 'Médio'}">
                                                <span class="badge bg-warning rounded-pill">
                                                    <i class="fas fa-meh me-1"></i>${rota.dificuldade}
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-danger rounded-pill">
                                                    <i class="fas fa-frown me-1"></i>${rota.dificuldade}
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <i class="far fa-clock me-1" style="color: #95a5a6;"></i>${rota.duracao}
                                    </td>
                                    <td class="text-center">
                                        <div class="btn-group btn-group-sm" role="group">
                                            <a href="${pageContext.request.contextPath}/RotaCarregar?idRota=${rota.idRota}" 
                                               class="btn btn-outline-primary"
                                               style="border-color: #1abc9c; color: #2c3e50;">
                                                <i class="fas fa-edit" style="color: #1abc9c;"></i> Editar
                                            </a>
                                            <a href="${pageContext.request.contextPath}/RotaExcluir?idRota=${rota.idRota}" 
                                               class="btn btn-outline-secondary"
                                               onclick="return confirm('Tem certeza que deseja excluir esta rota?')">
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
    $(document).ready(function(){
        // Inicialização do DataTable
        var table = $('#datatable').DataTable({
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
            },
            "order": [[ 0, "asc" ]],
            "pageLength": 10,
            "responsive": true
        });

        // Inicializa tooltips do Bootstrap se disponível
        if (typeof bootstrap !== 'undefined' && bootstrap.Tooltip) {
            var tooltipTriggerList = [].slice.call(document.querySelectorAll('[title]'));
            var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
                return new bootstrap.Tooltip(tooltipTriggerEl);
            });
        }
    });
</script>

<style>
    .btn-outline-primary:hover {
        background-color: #1abc9c;
        color: white !important;
    }
    
    .btn-outline-secondary {
        border-color: #6c757d;
        color: #6c757d;
    }

    .btn-outline-secondary:hover {
        background-color: #6c757d !important;
        border-color: #6c757d !important;
        color: white !important;
    }
    
    .table-hover tbody tr:hover {
        background-color: rgba(26, 188, 156, 0.1);
    }
    
    .badge {
        padding: 0.35em 0.65em;
        font-weight: 500;
    }
    
    .card {
        border-radius: 10px;
        overflow: hidden;
        transition: transform 0.2s ease-in-out;
    }
    
    .card:hover {
        transform: translateY(-2px);
    }
    
    thead th {
        border-bottom: 2px solid #1abc9c !important;
        font-weight: 600;
    }
    
    .btn-group .btn {
        margin: 0 2px;
    }
    
    .alert {
        border-radius: 10px;
    }
    
    /* Estilo para badges de dificuldade */
    .badge.bg-success {
        background-color: #27ae60 !important;
    }
    
    .badge.bg-warning {
        background-color: #f39c12 !important;
    }
    
    .badge.bg-danger {
        background-color: #e74c3c !important;
    }
    
    .badge.bg-primary {
        background-color: #3498db !important;
    }
    
    /* Animações suaves */
    .btn, .badge, .card {
        transition: all 0.3s ease;
    }
    
    .btn:hover {
        transform: translateY(-1px);
    }
    
    /* Responsividade */
    @media (max-width: 768px) {
        .btn-group {
            flex-direction: column;
        }
        
        .btn-group .btn {
            margin: 2px 0;
            width: 100%;
        }
        
        .d-flex.justify-content-between {
            flex-direction: column;
            gap: 1rem;
        }
    }
    
    /* Estilo para o DataTable */
    .dataTables_wrapper .dataTables_filter input {
        border-radius: 20px;
        border: 1px solid #1abc9c;
        padding: 5px 15px;
    }
    
    .dataTables_wrapper .dataTables_filter input:focus {
        outline: none;
        box-shadow: 0 0 0 0.2rem rgba(26, 188, 156, 0.25);
    }
    
    .dataTables_wrapper .dataTables_length select {
        border-radius: 5px;
        border: 1px solid #1abc9c;
    }
    
    .dataTables_wrapper .dataTables_paginate .paginate_button {
        padding: 0.375rem 0.75rem;
        margin: 0 2px;
        border-radius: 5px;
        border: 1px solid #1abc9c;
        color: #1abc9c !important;
        background: white;
    }
    
    .dataTables_wrapper .dataTables_paginate .paginate_button:hover {
        background: #1abc9c !important;
        color: white !important;
        border-color: #1abc9c;
    }
    
    .dataTables_wrapper .dataTables_paginate .paginate_button.current {
        background: #1abc9c !important;
        color: white !important;
        border-color: #1abc9c;
    }
    
    .page-link {
        color: #1abc9c;
    }
    
    .page-item.active .page-link {
        background-color: #1abc9c;
        border-color: #1abc9c;
    }
</style>

<%@include file="/footer.jsp" %>