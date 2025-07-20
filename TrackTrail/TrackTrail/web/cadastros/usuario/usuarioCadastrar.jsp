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
                        <i class="fas fa-user-plus me-2"></i>
                        Cadastro de Usuário
                    </h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty mensagem}">
                        <div class="alert alert-info text-center border-0" style="background-color: #e8f8f5; color: #1abc9c;">
                            <i class="fas fa-info-circle me-2"></i>
                            ${mensagem}
                        </div>
                    </c:if>

                    <form name="cadastrarusuario" action="UsuarioCadastrar" method="POST" onsubmit="return validarFormulario()">
                        <div class="mb-3">
                            <label class="form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-hashtag me-1" style="color: #95a5a6;"></i>
                                ID:
                            </label>
                            <input type="text" name="idusuario" value="${usuario.idUsuario}" readonly="readonly" 
                                   class="form-control bg-light" style="border-color: #1abc9c;" />
                        </div>
                        
                        <div class="mb-3">
                            <label for="nome" class="form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-user me-1" style="color: #1abc9c;"></i>
                                Nome Completo:
                            </label>
                            <input type="text" name="nome" id="nome" value="${usuario.nome}" 
                                   maxlength="50" class="form-control" 
                                   style="border-color: #1abc9c;" 
                                   placeholder="Digite seu nome completo" required />
                        </div>
                        
                        <div class="mb-3">
                            <label for="email" class="form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-envelope me-1" style="color: #3498db;"></i>
                                E-mail:
                            </label>
                            <input type="email" name="email" id="email" value="${usuario.email}" 
                                   class="form-control" 
                                   style="border-color: #1abc9c;" 
                                   placeholder="exemplo@dominio.com" required />
                        </div>
                        
                        <div class="mb-3">
                            <label for="senha" class="form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-lock me-1" style="color: #e74c3c;"></i>
                                Senha:
                            </label>
                            <input type="password" name="senha" id="senha" value="${usuario.senha}" 
                                   minlength="6" maxlength="20" class="form-control" 
                                   style="border-color: #1abc9c;" 
                                   placeholder="Mínimo 6 caracteres" required />
                        </div>
                        
                        <div class="mb-3">
                            <label for="confirmarSenha" class="form-label fw-bold" style="color: #2c3e50;">
                                <i class="fas fa-lock me-1" style="color: #e74c3c;"></i>
                                Confirmar Senha:
                            </label>
                            <input type="password" name="confirmarSenha" id="confirmarSenha" 
                                   minlength="6" maxlength="20" class="form-control" 
                                   style="border-color: #1abc9c;" 
                                   placeholder="Digite a senha novamente" required />
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
    var nome = document.getElementById('nome').value.trim();
    var email = document.getElementById('email').value.trim();
    var senha = document.getElementById('senha').value;
    var confirmarSenha = document.getElementById('confirmarSenha').value;
    
    // Verifica se todos os campos estão preenchidos
    if (nome === '' || email === '' || senha === '' || confirmarSenha === '') {
        alert('Por favor, preencha todos os campos obrigatórios!');
        return false;
    }
    
    // Verifica se as senhas coincidem
    if (senha !== confirmarSenha) {
        alert('As senhas não coincidem!');
        return false;
    }
    
    // Verifica o tamanho mínimo da senha
    if (senha.length < 6) {
        alert('A senha deve ter no mínimo 6 caracteres!');
        return false;
    }
    
    return true;
}
</script>

<style>
.form-control:focus {
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