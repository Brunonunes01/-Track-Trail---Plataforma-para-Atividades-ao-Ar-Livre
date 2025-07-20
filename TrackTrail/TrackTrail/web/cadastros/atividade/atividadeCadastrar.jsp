<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container mt-4">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card border-0 shadow-sm">
                <div class="card-header text-center" style="background-color: #1abc9c; color: white;">
                    <h4 class="mb-0">
                        <i class="fas fa-running me-2"></i>
                        Cadastro de Atividade
                    </h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty mensagem}">
                        <div class="alert alert-info text-center border-0" style="background-color: #e8f8f5; color: #1abc9c;">
                            <i class="fas fa-info-circle me-2"></i>
                            ${mensagem}
                        </div>
                    </c:if>

                    <form name="cadastraratividade" action="AtividadeCadastrar" method="POST" onsubmit="return validarFormulario()">
                        <div class="mb-3">
                            <label class="form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-hashtag me-1" style="color: #95a5a6;"></i>
                                ID:
                            </label>
                            <input type="text" name="idatividade" value="${atividade.idAtividade}" readonly="readonly" 
                                   class="form-control bg-light" style="border-color: #1abc9c;" />
                        </div>
                        
                        <div class="mb-3">
                            <label for="nomeatividade" class="form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-dumbbell me-1" style="color: #1abc9c;"></i>
                                Nome Atividade:
                            </label>
                            <input type="text" name="nomeatividade" id="nomeatividade" value="${atividade.nomeAtividade}" 
                                   maxlength="50" class="form-control" 
                                   style="border-color: #1abc9c;" 
                                   placeholder="Digite o nome da atividade" required />
                            <div id="erro-nome" class="text-danger mt-1" style="display: none;">
                                <i class="fas fa-exclamation-triangle me-1"></i>
                                Por favor, preencha o nome da atividade.
                            </div>
                        </div>
                        
                        <div class="text-center pt-3">
                            <button type="submit" name="cadastrar" id="cadastrar" 
                                    class="btn btn-success px-4 py-2 me-3" 
                                    style="background-color: #1abc9c; border-color: #1abc9c;">
                                <i class="fas fa-save me-1"></i>
                                Cadastrar
                            </button>
                            <button type="reset" name="limpar" id="limpar" 
                                    class="btn btn-outline-secondary px-4 py-2">
                                <i class="fas fa-eraser me-1"></i>
                                Limpar
                            </button>
                        </div>
                        
                        <div class="text-center pt-3">
                            <a href="index.jsp" class="text-decoration-none" style="color: #1abc9c;">
                                <i class="fas fa-home me-1"></i>
                                Voltar à Página Inicial
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function validarFormulario() {
        var nomeAtividade = document.getElementById('nomeatividade').value.trim();
        var erroNome = document.getElementById('erro-nome');
        var campoNome = document.getElementById('nomeatividade');
        
        // Remove classes de erro anteriores
        campoNome.classList.remove('is-invalid');
        erroNome.style.display = 'none';
        
        // Verifica se o campo está vazio
        if (nomeAtividade === '' || nomeAtividade === null) {
            // Mostra erro
            campoNome.classList.add('is-invalid');
            erroNome.style.display = 'block';
            
            // Foca no campo
            campoNome.focus();
            
            // Impede o envio
            return false;
        }
        
        // Se chegou até aqui, está tudo ok
        return true;
    }
    
    // Remove erro quando o usuário começar a digitar
    document.getElementById('nomeatividade').addEventListener('input', function() {
        var erroNome = document.getElementById('erro-nome');
        var campoNome = document.getElementById('nomeatividade');
        
        if (this.value.trim() !== '') {
            campoNome.classList.remove('is-invalid');
            erroNome.style.display = 'none';
        }
    });
</script>

<style>
    .form-control:focus {
        border-color: #1abc9c;
        box-shadow: 0 0 0 0.2rem rgba(26, 188, 156, 0.25);
    }
    
    .form-control.is-invalid {
        border-color: #dc3545;
        box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
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
    
    .form-control[readonly] {
        background-color: #f8f9fa;
        opacity: 0.8;
    }
    
    .alert {
        border-radius: 10px;
        margin-bottom: 1.5rem;
    }
</style>

<%@ include file="/footer.jsp" %>