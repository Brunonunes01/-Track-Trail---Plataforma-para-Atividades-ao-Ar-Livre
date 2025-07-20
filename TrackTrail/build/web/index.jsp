<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TrackTrail - Sua Plataforma de Aventuras</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&family=Montserrat:wght@600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary: #2c3e50;
            --secondary: #3498db;
            --accent: #1abc9c;
            --light: #f8f9fa;
            --dark: #212529;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            overflow-x: hidden;
        }
        
        .navbar {
            background-color: var(--primary) !important;
            transition: all 0.3s ease;
        }
        
        .navbar-brand {
            font-family: 'Montserrat', sans-serif;
            font-weight: 700;
            font-size: 1.8rem;
        }
        
        .navbar-brand span {
            color: var(--accent);
        }
        
        .hero-section {
            background: linear-gradient(135deg, var(--primary) 0%, var(--secondary) 100%);
            color: white;
            padding: 6rem 0;
        }
        
        .section-title {
            font-family: 'Montserrat', sans-serif;
            position: relative;
            margin-bottom: 3rem;
        }
        
        .section-title:after {
            content: '';
            position: absolute;
            width: 60px;
            height: 4px;
            background: var(--accent);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .card-menu {
            border-left: 4px solid var(--accent);
            transition: all 0.3s ease;
            height: 100%;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
        }
        
        .card-menu:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            color: inherit;
            text-decoration: none;
        }
        
        .icon-large {
            font-size: 2.5rem;
            color: var(--accent);
            transition: all 0.3s ease;
        }
        
        .card-menu:hover .icon-large {
            transform: scale(1.1);
        }
        
        footer {
            background-color: var(--primary);
            color: white;
            padding: 4rem 0 2rem;
        }
        
        @media (max-width: 768px) {
            .hero-section {
                padding: 4rem 0;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top py-3">
        <div class="container">
            <a class="navbar-brand" href="#"><span>Track</span>Trail</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#"><i class="fas fa-home me-1"></i> Início</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="UsuarioListar"><i class="fas fa-users me-1"></i> Usuários</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="RotaListar"><i class="fas fa-route me-1"></i> Rotas</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AtividadeListar"><i class="fas fa-hiking me-1"></i> Atividades</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="AtividadeRealizadaListar"><i class="fas fa-check-circle me-1"></i> Atividades Realizadas</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <h1 class="display-4 fw-bold mb-3">Explore Novas Aventuras</h1>
                    <p class="lead mb-4">Descubra rotas incríveis e conecte-se com outros aventureiros.</p>
                    <div class="d-flex gap-3">
                        <a href="AtividadeListar" class="btn btn-lg btn-success">
                            <i class="fas fa-play me-2"></i> Comece Agora
                        </a>
                        <a href="#" class="btn btn-lg btn-outline-light">
                            <i class="fas fa-info-circle me-2"></i> Saiba Mais
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Menu Principal Section -->
    <section class="py-5 my-5">
        <div class="container">
            <h2 class="text-center section-title">Acesso Rápido</h2>
            <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <a href="UsuarioListar" class="card card-menu h-100 p-4 shadow-sm text-decoration-none">
                        <div class="icon-large mb-3">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3>Usuários</h3>
                        <p>Gerencie usuários do sistema e suas permissões.</p>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="RotaListar" class="card card-menu h-100 p-4 shadow-sm text-decoration-none">
                        <div class="icon-large mb-3">
                            <i class="fas fa-route"></i>
                        </div>
                        <h3>Rotas</h3>
                        <p>Explore e cadastre novas rotas de aventura.</p>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="AtividadeListar" class="card card-menu h-100 p-4 shadow-sm text-decoration-none">
                        <div class="icon-large mb-3">
                            <i class="fas fa-hiking"></i>
                        </div>
                        <h3>Atividades</h3>
                        <p>Cadastre e gerencie tipos de atividades disponíveis.</p>
                    </a>
                </div>
                <div class="col-lg-3 col-md-6">
                    <a href="AtividadeRealizadaListar" class="card card-menu h-100 p-4 shadow-sm text-decoration-none">
                        <div class="icon-large mb-3">
                            <i class="fas fa-check-circle"></i>
                        </div>
                        <h3>Atividades Realizadas</h3>
                        <p>Acompanhe o histórico de atividades concluídas.</p>
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center section-title">Nossos Recursos</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card h-100 p-4 shadow-sm text-center">
                        <div class="icon-large mb-3">
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <h3>Rotas Personalizadas</h3>
                        <p>Crie e compartilhe rotas baseadas em suas preferências.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 p-4 shadow-sm text-center">
                        <div class="icon-large mb-3">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <h3>Acompanhamento</h3>
                        <p>Monitore seu progresso com estatísticas detalhadas.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card h-100 p-4 shadow-sm text-center">
                        <div class="icon-large mb-3">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3>Comunidade</h3>
                        <p>Conecte-se com outros entusiastas de aventuras.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="mt-5">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4">
                    <h2 class="navbar-brand"><span>Track</span>Trail</h2>
                    <p>Sua plataforma completa para gerenciamento de trilhas e atividades ao ar livre.</p>
                </div>
                <div class="col-lg-2 col-md-6 mb-4">
                    <h5>Links</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#" class="text-white-50">Início</a></li>
                        <li class="mb-2"><a href="UsuarioListar" class="text-white-50">Usuários</a></li>
                        <li class="mb-2"><a href="RotaListar" class="text-white-50">Rotas</a></li>
                        <li class="mb-2"><a href="AtividadeListar" class="text-white-50">Atividades</a></li>
                        <li class="mb-2"><a href="AtividadeRealizadaListar" class="text-white-50">Atividades Realizadas</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-6 mb-4">
                    <h5>Contato</h5>
                    <p><i class="fas fa-map-marker-alt me-2"></i> Fatec Jales, 116</p>
                    <p><i class="fas fa-phone me-2"></i> (17) 99679-4648</p>
                    <p><i class="fas fa-envelope me-2"></i> contato@tracktrail.com</p>
                </div>
            </div>
            <hr class="my-4 bg-light opacity-25">
            <div class="text-center">
                <p class="mb-0">&copy; 2025 TrackTrail. Todos os direitos reservados.</p>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Navbar scroll effect
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar');
            if (window.scrollY > 50) {
                navbar.classList.add('navbar-scrolled');
                navbar.style.padding = '0.75rem 0';
            } else {
                navbar.classList.remove('navbar-scrolled');
                navbar.style.padding = '1rem 0';
            }
        });
    </script>
</body>
</html>