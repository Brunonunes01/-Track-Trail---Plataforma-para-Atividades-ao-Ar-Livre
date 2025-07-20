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
                        <i class="fas fa-route me-2"></i>
                        Cadastro de Rota
                    </h4>
                </div>
                <div class="card-body">
                    <c:if test="${not empty mensagem}">
                        <div class="alert alert-info text-center border-0" style="background-color: #e8f8f5; color: #1abc9c;">
                            <i class="fas fa-info-circle me-2"></i>
                            ${mensagem}
                        </div>
                    </c:if>

                    <form name="cadastrarrota" action="RotaCadastrar" method="POST" onsubmit="return validarFormulario()">
                        <table align="center" border="0" class="w-100"> 
                            <tbody>
                                <tr>
                                    <td class="py-2">
                                        <label class="form-label fw-bold" style="color: #2c3e50;">
                                            <i class="fas fa-hashtag me-1" style="color: #95a5a6;"></i>
                                            ID:
                                        </label>
                                    </td>
                                    <td class="py-2">
                                        <input type="text" name="idrota" value="${rota.idRota}" readonly="readonly" 
                                               class="form-control bg-light" style="border-color: #1abc9c;" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="py-2">
                                        <label class="form-label fw-bold" style="color: #2c3e50;">
                                            <i class="fas fa-map-marker-alt me-1" style="color: #1abc9c;"></i>
                                            Nome Rota:
                                        </label>
                                    </td>
                                    <td class="py-2">
                                        <input type="text" name="nome" id="nome" value="${rota.nome}" 
                                               size="50" maxlength="50" class="form-control" 
                                               style="border-color: #1abc9c;" 
                                               placeholder="Digite o nome da rota" required />
                                    </td>
                                </tr>  
                                <tr>
                                    <td class="py-2">
                                        <label class="form-label fw-bold" style="color: #2c3e50;">
                                            <i class="fas fa-location-dot me-1" style="color: #e74c3c;"></i>
                                            Localização:
                                        </label>
                                    </td>
                                    <td class="py-2">
                                        <input type="text" name="localizacao" id="localizacao" value="${rota.localizacao}" 
                                               size="50" maxlength="50" class="form-control" 
                                               style="border-color: #1abc9c;" 
                                               placeholder="Digite a localização" required />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="py-2">
                                        <label class="form-label fw-bold" style="color: #2c3e50;">
                                            <i class="fas fa-road me-1" style="color: #3498db;"></i>
                                            Distância:
                                        </label>
                                    </td>
                                    <td class="py-2">
                                        <input type="text" name="distancia" id="distancia" value="${rota.distancia}" 
                                               size="50" maxlength="50" class="form-control" 
                                               style="border-color: #1abc9c;" 
                                               placeholder="Ex: 5.2 km" required />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="py-2">
                                        <label class="form-label fw-bold" style="color: #2c3e50;">
                                            <i class="fas fa-mountain me-1" style="color: #f39c12;"></i>
                                            Dificuldade:
                                        </label>
                                    </td>
                                    <td class="py-2">
                                        <input type="text" name="dificuldade" id="dificuldade" value="${rota.dificuldade}" 
                                               size="50" maxlength="50" class="form-control" 
                                               style="border-color: #1abc9c;" 
                                               placeholder="Ex: Fácil, Médio, Difícil" required />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="py-2">
                                        <label class="form-label fw-bold" style="color: #2c3e50;">
                                            <i class="fas fa-clock me-1" style="color: #9b59b6;"></i>
                                            Duração:
                                        </label>
                                    </td>
                                    <td class="py-2">
                                        <input type="text" name="duracao" id="duracao" value="${rota.duracao}" 
                                               size="50" maxlength="50" class="form-control" 
                                               style="border-color: #1abc9c;" 
                                               placeholder="Ex: 2h 30min" required />
                                    </td>
                                </tr>

                                <tr>
                                    <td colspan="2" align="center" class="pt-4">
                                        <div class="d-flex gap-3 justify-content-center">
                                            <input type="submit" name="cadastrar" id="cadastrar" value="Cadastrar" 
                                                   class="btn btn-success px-4 py-2" 
                                                   style="background-color: #1abc9c; border-color: #1abc9c;" />
                                            <input type="reset" name="limpar" id="limpar" value="Limpar" 
                                                   class="btn btn-outline-secondary px-4 py-2" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" class="pt-3">
                                        <h5>
                                            <a href="index.jsp" class="text-decoration-none" style="color: #1abc9c;">
                                                <i class="fas fa-home me-1"></i>
                                                Voltar à Página Inicial
                                            </a>
                                        </h5>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
function validarFormulario() {
    var nome = document.getElementById('nome').value.trim();
    var localizacao = document.getElementById('localizacao').value.trim();
    var distancia = document.getElementById('distancia').value.trim();
    var dificuldade = document.getElementById('dificuldade').value.trim();
    var duracao = document.getElementById('duracao').value.trim();
    
    if (nome === '' || localizacao === '' || distancia === '' || dificuldade === '' || duracao === '') {
        alert('Por favor, preencha todos os campos obrigatórios!');
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
        overflow: hidden;
    }
    
    .card-header {
        border-bottom: none;
        padding: 1.5rem;
    }
    
    .card-body {
        padding: 2rem;
    }
    
    .form-label {
        margin-bottom: 0.5rem;
        font-size: 0.95rem;
    }
    
    .form-control {
        border-radius: 8px;
        padding: 0.75rem;
        font-size: 0.95rem;
    }
    
    .form-control[readonly] {
        background-color: #f8f9fa;
        opacity: 0.8;
    }
    
    table td {
        vertical-align: middle;
        padding: 0.5rem 1rem;
    }
    
    table td:first-child {
        width: 30%;
        text-align: right;
        padding-right: 1rem;
    }
    
    table td:last-child {
        width: 70%;
    }
    
    .alert {
        border-radius: 10px;
        margin-bottom: 1.5rem;
    }
    
    @media (max-width: 768px) {
        .card-body {
            padding: 1rem;
        }
        
        table td:first-child {
            width: 35%;
            font-size: 0.9rem;
        }
        
        table td:last-child {
            width: 65%;
        }
        
        .form-control {
            font-size: 0.9rem;
        }
        
        .d-flex.gap-3 {
            flex-direction: column;
            gap: 0.5rem !important;
        }
        
        .btn {
            width: 100%;
        }
    }
    
    .card {
        transition: transform 0.2s ease-in-out;
    }
    
    .card:hover {
        transform: translateY(-2px);
    }
</style>

<%@ include file="/footer.jsp" %>