<footer class="footer mt-5 pt-5 pb-4" style="background-color: #f8f9fa; position: relative; border-top: 1px solid rgba(44, 62, 80, 0.1);">
    <!-- Elemento decorativo de montanha melhorado -->
    <div class="footer-wave" style="position: absolute; top: -40px; left: 0; right: 0; height: 40px; overflow: hidden; z-index: 1;">
        <svg viewBox="0 0 1200 120" preserveAspectRatio="none" style="width: 100%; height: 100%;">
            <path d="M0,0V46.29c47.79,22.2,103.59,32.17,158,28,70.36-5.37,136.33-33.31,206.8-37.5C438.64,32.43,512.34,53.67,583,72.05c69.27,18,138.3,24.88,209.4,13.08,36.15-6,69.85-17.84,104.45-29.34C989.49,25,1113-14.29,1200,52.47V0Z" 
                  opacity=".25" fill="#2c3e50"></path>
            <path d="M0,0V15.81C13,36.92,27.64,56.86,47.69,72.05,99.41,111.27,165,111,224.58,91.58c31.15-10.15,60.09-26.07,89.67-39.8,40.92-19,84.73-46,130.83-49.67,36.26-2.85,70.9,9.42,98.6,31.56,31.77,25.39,62.32,62,103.63,73,40.44,10.79,81.35-6.69,119.13-24.28s75.16-39,116.92-43.05c59.73-5.85,113.28,22.88,168.9,38.84,30.2,8.66,59,6.17,87.09-7.5,22.43-10.89,48-26.93,60.65-49.24V0Z" 
                  opacity=".5" fill="#2c3e50"></path>
            <path d="M0,0V5.63C149.93,59,314.09,71.32,475.83,42.57c43-7.64,84.23-20.12,127.61-26.46,59-8.63,112.48,12.24,165.56,35.4C827.93,77.22,886,95.24,951.2,90c86.53-7,172.46-45.71,248.8-84.81V0Z" 
                  fill="#2c3e50"></path>
        </svg>
    </div>

    <div class="container">
        <div class="row">
            <!-- Coluna 1: Logo e descrição -->
            <div class="col-lg-4 mb-4 mb-lg-0">
                <div class="d-flex align-items-center mb-3">
                    <i class="fas fa-mountain text-primary me-2 fs-4"></i>
                    <span class="text-dark fw-bold fs-5" style="letter-spacing: 1px;">
                        TRACKTRAIL
                    </span>
                </div>
                <p class="text-muted small" style="line-height: 1.6;">
                    Conectando aventureiros às mais belas trilhas e paisagens naturais. Explore, descubra e preserve.
                </p>
            </div>
            
            <!-- Coluna 2: Links rápidos -->
            <div class="col-lg-2 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase fw-bold mb-3">Links</h5>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none hover-primary">Início</a></li>
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none hover-primary">Trilhas</a></li>
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none hover-primary">Guias</a></li>
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none hover-primary">Sobre</a></li>
                </ul>
            </div>
            
            <!-- Coluna 3: Contato -->
            <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                <h5 class="text-uppercase fw-bold mb-3">Contato</h5>
                <ul class="list-unstyled text-muted">
                    <li class="mb-2"><i class="fas fa-envelope me-2 text-primary"></i> contato@tracktrail.com</li>
                    <li class="mb-2"><i class="fas fa-phone me-2 text-primary"></i> (17) 99679-4648</li>
                    <li><i class="fas fa-map-marker-alt me-2 text-primary"></i> São Paulo, Brasil</li>
                </ul>
            </div>
            
            <!-- Coluna 4: Redes sociais -->
            <div class="col-lg-3 col-md-6">
                <h5 class="text-uppercase fw-bold mb-3">Redes Sociais</h5>
                <div class="d-flex mb-4">
                    <a href="#" class="text-decoration-none text-muted me-3 social-icon">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a href="#" class="text-decoration-none text-muted me-3 social-icon">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" class="text-decoration-none text-muted me-3 social-icon">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" class="text-decoration-none text-muted social-icon">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
                <div class="input-group mb-3">
                    <input type="email" class="form-control form-control-sm" placeholder="Seu e-mail" aria-label="Seu e-mail">
                    <button class="btn btn-primary btn-sm" type="button">OK</button>
                </div>
            </div>
        </div>
        
        <hr class="my-4" style="border-color: rgba(44, 62, 80, 0.1);">
        
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                <span class="text-muted small">
                    &copy; <fmt:formatDate value="<%=new java.util.Date()%>" pattern="yyyy"/> TrackTrail. Todos os direitos reservados.
                </span>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <span class="text-muted small me-3">
                    <a href="#" class="text-decoration-none text-muted hover-primary">Política de Privacidade</a>
                </span>
                <span class="text-muted small">
                    <a href="#" class="text-decoration-none text-muted hover-primary">Termos de Uso</a>
                </span>
            </div>
        </div>
    </div>
</footer>

<style>
    .footer {
        box-shadow: 0 -5px 15px rgba(0, 0, 0, 0.05);
    }
    
    .footer-wave {
        filter: drop-shadow(0 -4px 8px rgba(44, 62, 80, 0.1));
    }
    
    .hover-primary:hover {
        color: #1abc9c !important;
        transform: translateY(-2px);
        transition: all 0.3s ease;
    }
    
    .social-icon {
        width: 36px;
        height: 36px;
        border-radius: 50%;
        background-color: rgba(26, 188, 156, 0.1);
        display: flex;
        align-items: center;
        justify-content: center;
        transition: all 0.3s ease;
    }
    
    .social-icon:hover {
        background-color: rgba(26, 188, 156, 0.2);
        color: #1abc9c !important;
        transform: translateY(-3px);
    }
    
    @media (max-width: 768px) {
        .footer {
            text-align: center;
        }
        
        .footer .row > div {
            margin-bottom: 2rem;
        }
    }
</style>