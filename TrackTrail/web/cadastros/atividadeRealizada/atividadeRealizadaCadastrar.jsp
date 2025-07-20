<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-8 offset-md-2">
            <div class="card border-0 shadow-sm">
                <div class="card-header text-center" style="background-color: #1abc9c; color: white;">
                    <h4 class="mb-0">
                        <i class="fas fa-check-circle me-2"></i>
                        Cadastro de Atividade Realizada
                    </h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty mensagem}">
                        <div class="alert alert-info alert-dismissible fade show border-0" role="alert" style="background-color: #e8f8f5; color: #1abc9c;">
                            <i class="fas fa-info-circle me-2"></i>
                            ${mensagem}
                            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    </c:if>
                    
                    <form name="cadastraratividaderealizada" action="AtividadeRealizadaCadastrar" method="POST" class="needs-validation" novalidate>
                        <div class="row mb-3">
                            <label for="idatividaderealizada" class="col-sm-3 col-form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-hashtag me-1" style="color: #95a5a6;"></i>
                                ID:
                            </label>
                            <div class="col-sm-9">
                                <input type="text" name="idatividaderealizada" id="idatividaderealizada" 
                                       value="${atividadeRealizada.idAtividadeRealizada}" 
                                       readonly="readonly" class="form-control bg-light" style="border-color: #1abc9c;" />
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label for="idusuario" class="col-sm-3 col-form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-user me-1" style="color: #3498db;"></i>
                                Usuário:
                            </label>
                            <div class="col-sm-9">
                                <select name="idusuario" id="idusuario" class="form-select" style="border-color: #1abc9c;" required>
                                    <option value="">Selecione o Usuário</option>
                                    <c:forEach var="usuario" items="${usuarios}">
                                        <option value="${usuario.idUsuario}"
                                            ${atividadeRealizada.usuario.idUsuario == usuario.idUsuario ? "selected" : ""}>
                                            ${usuario.nome}
                                        </option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor, selecione um usuário.
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label for="idatividade" class="col-sm-3 col-form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-dumbbell me-1" style="color: #1abc9c;"></i>
                                Atividade:
                            </label>
                            <div class="col-sm-9">
                                <select name="idatividade" id="idatividade" class="form-select" style="border-color: #1abc9c;" required>
                                    <option value="">Selecione a Atividade</option>
                                    <c:forEach var="atividade" items="${atividades}">
                                        <option value="${atividade.idAtividade}"
                                            ${atividadeRealizada.atividade.idAtividade == atividade.idAtividade ? "selected" : ""}>
                                            ${atividade.nomeAtividade}
                                        </option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor, selecione uma atividade.
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label for="idrota" class="col-sm-3 col-form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-route me-1" style="color: #e74c3c;"></i>
                                Rota:
                            </label>
                            <div class="col-sm-9">
                                <select name="idrota" id="idrota" class="form-select" style="border-color: #1abc9c;" required>
                                    <option value="">Selecione a Rota</option>
                                    <c:forEach var="rota" items="${rotas}">
                                        <option value="${rota.idRota}"
                                            ${atividadeRealizada.rota.idRota == rota.idRota ? "selected" : ""}>
                                            ${rota.nome}
                                        </option>
                                    </c:forEach>
                                </select>
                                <div class="invalid-feedback">
                                    Por favor, selecione uma rota.
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label for="datarealizacao" class="col-sm-3 col-form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-calendar me-1" style="color: #9b59b6;"></i>
                                Data de Realização:
                            </label>
                            <div class="col-sm-9">
                                <input type="date" name="datarealizacao" id="datarealizacao" 
                                       value="${atividadeRealizada.dataRealizacao}" 
                                       class="form-control" style="border-color: #1abc9c;" required />
                                <div class="invalid-feedback">
                                    Por favor, informe a data de realização.
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <label for="distanciapercorrida" class="col-sm-3 col-form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-road me-1" style="color: #f39c12;"></i>
                                Distância Percorrida (km):
                            </label>
                            <div class="col-sm-9">
                                <input type="number" name="distanciapercorrida" id="distanciapercorrida" 
                                       value="${atividadeRealizada.distanciaPercorrida}" 
                                       class="form-control" style="border-color: #1abc9c;" step="0.01" min="0" required />
                                <div class="invalid-feedback">
                                    Por favor, informe a distância percorrida.
                                </div>
                            </div>
                        </div>
                        
                        <input type="hidden" name="situacao" id="situacao" value="${atividadeRealizada.situacao == null ? 'A' : atividadeRealizada.situacao}" />
                        
                        <div class="row mt-4">
                            <div class="col-sm-12 text-center">
                                <button type="submit" class="btn btn-success me-2" style="background-color: #1abc9c; border-color: #1abc9c;">
                                    <i class="fas fa-save me-1"></i> Salvar
                                </button>
                                <button type="reset" class="btn btn-outline-secondary me-2">
                                    <i class="fas fa-eraser me-1"></i> Limpar
                                </button>
                                <a href="${pageContext.request.contextPath}/AtividadeRealizadaListar" class="btn btn-outline-secondary">
                                    <i class="fas fa-arrow-left me-1"></i> Voltar
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();
</script>

<style>
    .form-control:focus, .form-select:focus {
        border-color: #1abc9c;
        box-shadow: 0 0 0 0.2rem rgba(26, 188, 156, 0.25);
    }
    
    .btn-success:hover {
        background-color: #16a085 !important;
        border-color: #16a085 !important;
        transform: translateY(-1px);
    }
    
    .btn-outline-secondary:hover {
        background-color: #6c757d;
        border-color: #6c757d;
        transform: translateY(-1px);
    }
    
    .btn {
        transition: all 0.3s ease;
    }
    
    .card {
        border-radius: 15px;
    }
    
    .card-header {
        border-bottom: none;
    }
    
    .form-control[readonly] {
        background-color: #f8f9fa;
        opacity: 0.8;
    }
</style>

<%@include file="/footer.jsp" %>