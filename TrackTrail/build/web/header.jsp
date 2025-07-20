<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <title>TrackTrail - ${param.title != null ? param.title : 'Sistema'}</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Sistema TrackTrail - Gerenciamento de Trilhas e Atividades">

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- DataTables CSS -->
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/buttons/2.4.1/css/buttons.bootstrap5.min.css"/>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.mask.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/jquery.maskMoney.min.js"></script>

    <!-- SweetAlert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #1abc9c;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
        }
        
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f8f9fa;
            color: var(--dark-color);
            padding-top: 60px;
        }
        
        .navbar {
            background-color: var(--primary-color) !important;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        
        .navbar-brand {
            font-weight: 700;
            font-size: 1.8rem;
            color: white !important;
        }
        
        .navbar-brand span {
            color: var(--accent-color);
        }
        
        .nav-link {
            font-weight: 500;
            margin: 0 8px;
            color: rgba(255, 255, 255, 0.9) !important;
        }
        
        .nav-link:hover {
            color: white !important;
        }
        
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            background: var(--accent-color);
            bottom: 0;
            left: 0;
            transition: width 0.3s ease;
        }
        
        .nav-link:hover::after {
            width: 100%;
        }
        
        /* Estilos para tabelas DataTables */
        .table-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 30px;
        }
        
        table.dataTable {
            width: 100% !important;
            margin: 0 auto;
            clear: both;
            border-collapse: separate;
            border-spacing: 0;
        }
        
        .dataTables_wrapper .dataTables_paginate .paginate_button {
            padding: 0.3em 0.8em;
            margin: 0 2px;
            border-radius: 4px;
            border: 1px solid #dee2e6;
        }
        
        .dataTables_wrapper .dataTables_paginate .paginate_button.current {
            background: var(--accent-color);
            color: white !important;
            border: 1px solid var(--accent-color);
        }
        
        /* Estilos para botões */
        .btn-custom {
            min-width: 200px;
            padding: 12px 25px;
            border-radius: 50px;
            font-weight: 500;
            margin: 10px;
            transition: all 0.3s ease;
        }
        
        .btn-primary-custom {
            background-color: var(--accent-color);
            border-color: var(--accent-color);
        }
        
        .btn-primary-custom:hover {
            background-color: #16a085;
            border-color: #16a085;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .btn-outline-custom {
            border-color: white;
            color: white;
        }
        
        .btn-outline-custom:hover {
            background-color: white;
            color: var(--primary-color);
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        /* Estilos para ações na tabela */
        .btn-action {
            padding: 5px 10px;
            margin: 0 3px;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>