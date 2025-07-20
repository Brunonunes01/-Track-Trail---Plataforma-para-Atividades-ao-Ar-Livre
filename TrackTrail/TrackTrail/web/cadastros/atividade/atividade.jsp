<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="fas fa-running me-2" style="color: #1abc9c;"></i>Atividades</h2>
        <a href="${pageContext.request.contextPath}/AtividadeNovo" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Nova Atividade
        </a>
    </div>

    <c:choose>
        <c:when test="${empty atividades}">
            <div class="alert alert-info border-start border-5 border-primary">
                <div class="d-flex align-items-center">
                    <i class="fas fa-info-circle me-3 fs-4" style="color: #1abc9c;"></i>
                    <div>
                        <h5 class="alert-heading">Nenhuma atividade cadastrada</h5>
                        <p class="mb-0">Clique no botão "Nova Atividade" para começar</p>
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
                                <th align="left" style="background-color: #f8f9fa; color: #2c3e50;">ID</th>
                                <th align="left" style="background-color: #f8f9fa; color: #2c3e50;">Nome Atividade</th>
                                <th align="right" style="background-color: #f8f9fa; color: #2c3e50;"></th>
                                <th align="right" style="background-color: #f8f9fa; color: #2c3e50;"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="atividade" items="${atividades}">
                                <tr>
                                    <td align="left">${atividade.idAtividade}</td>
                                    <td align="left">
                                        <div class="d-flex align-items-center">
                                            <i class="fas fa-dumbbell me-2" style="color: #1abc9c;"></i>
                                            <strong>${atividade.nomeAtividade}</strong>
                                        </div>
                                    </td>
                                    <td align="center">
                                        <a href="${pageContext.request.contextPath}/AtividadeExcluir?idAtividade=${atividade.idAtividade}"
                                           class="btn btn-outline-secondary btn-sm"
                                           onclick="return confirm('Tem certeza que deseja excluir esta atividade?')">
                                            <i class="fas fa-trash-alt me-1"></i>Excluir
                                        </a>
                                    </td>                             
                                    <td align="center">
                                        <a href="${pageContext.request.contextPath}/AtividadeCarregar?idAtividade=${atividade.idAtividade}"
                                           class="btn btn-outline-primary btn-sm"
                                           style="border-color: #1abc9c; color: #2c3e50;">
                                            <i class="fas fa-edit me-1" style="color: #1abc9c;"></i>Alterar
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </c:otherwise>
    </c:choose>
</div>

<div align="center" class="mt-4">
    <a href="index.jsp" class="btn btn-outline-secondary">
        <i class="fas fa-home me-1"></i>Voltar à Página Inicial
    </a>
</div>
    
<script>
    $(document).ready(function(){
        console.log('entrei ready');
        //Carregamos a datatable
        //$("#datatable").DataTable({});
        $('#datatable').DataTable({
            "oLanguage": {
                "sProcessing": "Processando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "Nenhum registro encontrado.",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "<i class='fas fa-search'></i> Buscar:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "<i class='fas fa-angle-double-left'></i> Primeiro",
                    "sPrevious": "<i class='fas fa-angle-left'></i> Anterior",
                    "sNext": "Seguinte <i class='fas fa-angle-right'></i>",
                    "sLast": "Último <i class='fas fa-angle-double-right'></i>"
                }
            }
        });
    });
</script>

<style>
    .container {
        max-width: 1200px;
    }
    
    .btn-outline-primary:hover {
        background-color: #1abc9c !important;
        border-color: #1abc9c !important;
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
    
    .btn {
        transition: all 0.3s ease;
    }
    
    .btn:hover {
        transform: translateY(-1px);
    }
    
    .alert {
        border-radius: 10px;
    }
    
    /* Estilo para o DataTable */
    .dataTables_wrapper .dataTables_filter input {
        border-radius: 20px;
        border: 1px solid #1abc9c;
        padding: 5px 15px;
        margin-left: 10px;
    }
    
    .dataTables_wrapper .dataTables_filter input:focus {
        outline: none;
        box-shadow: 0 0 0 0.2rem rgba(26, 188, 156, 0.25);
    }
    
    .dataTables_wrapper .dataTables_length select {
        border-radius: 5px;
        border: 1px solid #1abc9c;
        padding: 2px 8px;
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
    
    .dataTables_wrapper .dataTables_info {
        color: #6c757d;
        font-size: 0.875rem;
    }
    
    .dataTables_wrapper .dataTables_filter label {
        font-weight: 500;
        color: #2c3e50;
    }
    
    .dataTables_wrapper .dataTables_length label {
        font-weight: 500;
        color: #2c3e50;
    }
    
    /* Responsividade */
    @media (max-width: 768px) {
        .d-flex.justify-content-between {
            flex-direction: column;
            gap: 1rem;
            text-align: center;
        }
        
        .btn-sm {
            font-size: 0.75rem;
            padding: 0.25rem 0.5rem;
        }
        
        .table td {
            padding: 0.5rem 0.25rem;
            font-size: 0.875rem;
        }
    }
</style>

<%@include file="/footer.jsp" %>