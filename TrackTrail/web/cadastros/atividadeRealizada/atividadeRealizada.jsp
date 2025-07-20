<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="mb-0"><i class="fas fa-check-circle me-2" style="color: #1abc9c;"></i>Atividades Realizadas</h2>
        <a href="${pageContext.request.contextPath}/AtividadeRealizadaNovo" class="btn btn-success">
            <i class="fas fa-plus me-1"></i> Nova Atividade Realizada
        </a>
    </div>
    
    <c:if test="${not empty mensagem}">
        <div class="alert alert-info alert-dismissible fade show" role="alert">
            <i class="fas fa-info-circle me-2"></i>${mensagem}
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
    </c:if>
    
    <div class="card border-0 shadow-sm">
        <div class="card-body p-0">
            <table id="datatable" class="table table-hover mb-0">
                <thead class="table-light">
                    <tr>
                        <th>ID</th>
                        <th>Usuário</th>
                        <th>Atividade</th>
                        <th>Rota</th>
                        <th>Data de Realização</th>
                        <th>Distância Percorrida (km)</th>
                        <th>Situação</th>
                        <th>Ações</th>
                        <th>Editar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty atividadesRealizadas}">
                            <c:forEach var="atividadeRealizada" items="${atividadesRealizadas}">
                                <tr>
                                    <td>${atividadeRealizada.idAtividadeRealizada}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${atividadeRealizada.usuario != null}">
                                                <i class="fas fa-user me-1" style="color: #1abc9c;"></i>
                                                ${atividadeRealizada.usuario.nome}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">N/A</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${atividadeRealizada.atividade != null}">
                                                <i class="fas fa-dumbbell me-1" style="color: #1abc9c;"></i>
                                                ${atividadeRealizada.atividade.nomeAtividade}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">N/A</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${atividadeRealizada.rota != null}">
                                                <i class="fas fa-route me-1" style="color: #1abc9c;"></i>
                                                ${atividadeRealizada.rota.nome}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">N/A</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${atividadeRealizada.dataRealizacao != null}">
                                                <c:set var="dia" value="${atividadeRealizada.dataRealizacao.dayOfMonth}" />
                                                <c:set var="mes" value="${atividadeRealizada.dataRealizacao.monthValue}" />
                                                <c:set var="ano" value="${atividadeRealizada.dataRealizacao.year}" />
                                                <fmt:formatNumber value="${dia}" pattern="00"/>/<fmt:formatNumber value="${mes}" pattern="00"/>/${ano}
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-muted">-</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${atividadeRealizada.distanciaPercorrida != null}">
                                                <span class="badge bg-primary">
                                                    <fmt:formatNumber value="${atividadeRealizada.distanciaPercorrida}" 
                                                                      type="number" maxFractionDigits="2" minFractionDigits="2"/>
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">0,00</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${atividadeRealizada.situacao == 'A'}">
                                                <span class="badge bg-success">Ativo</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge bg-secondary">Inativo</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/AtividadeRealizadaExcluir?idAtividadeRealizada=${atividadeRealizada.idAtividadeRealizada}"
                                           onclick="return confirm('Tem certeza que deseja ${atividadeRealizada.situacao == "A" ? "inativar" : "ativar"} esta atividade realizada?');">
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas ${atividadeRealizada.situacao == 'A' ? 'fa-ban' : 'fa-check'} me-1"></i>
                                                <c:out value='${atividadeRealizada.situacao == "A" ? "Inativar" : "Ativar"}'/>
                                            </button>
                                        </a>
                                    </td>
                                    <td class="text-center">
                                        <a href="${pageContext.request.contextPath}/AtividadeRealizadaCarregar?idAtividadeRealizada=${atividadeRealizada.idAtividadeRealizada}">
                                            <button class="btn btn-sm btn-outline-primary" style="border-color: #1abc9c; color: #2c3e50;">
                                                <i class="fas fa-edit me-1" style="color: #1abc9c;"></i>Alterar
                                            </button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="9" class="text-center text-muted">
                                    <i class="fas fa-info-circle"></i>
                                    Nenhuma atividade realizada encontrada.
                                </td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
    
    <div class="text-center mt-4">
        <a href="${pageContext.request.contextPath}/index.jsp" class="btn btn-outline-secondary">
            <i class="fas fa-home me-1"></i>Voltar à Página Inicial
        </a>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('#datatable').DataTable({
            "responsive": true,
            "pageLength": 10,
            "lengthMenu": [[10, 25, 50, -1], [10, 25, 50, "Todos"]],
            "order": [[0, "desc"]],
            "columnDefs": [
                { "targets": [7, 8], "orderable": false, "searchable": false }
            ],
            "language": {
                "sProcessing": "Processando...",
                "sLengthMenu": "Mostrar _MENU_ registros por página",
                "sZeroRecords": "Nenhum registro encontrado.",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                "sInfoFiltered": "(filtrado de _MAX_ registros no total)",
                "sSearch": "Buscar:",
                "oPaginate": {
                    "sFirst": "Primeiro", "sPrevious": "Anterior",
                    "sNext": "Próximo", "sLast": "Último"
                }
            }
        });
        
        setTimeout(function() { $('.alert').fadeOut('slow'); }, 5000);
    });
</script>

<style>
    .btn-outline-primary:hover { background-color: #1abc9c !important; color: white !important; }
    .table-hover tbody tr:hover { background-color: rgba(26, 188, 156, 0.1); }
    .card { border-radius: 10px; }
    thead th { border-bottom: 2px solid #1abc9c !important; }
</style>

<%@ include file="/footer.jsp" %>