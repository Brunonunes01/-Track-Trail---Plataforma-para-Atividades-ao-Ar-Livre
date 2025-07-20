CREATE TABLE Usuario (
    idusuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) not null,
    email VARCHAR(100) not null,
    senha VARCHAR(100) not null
);
INSERT INTO Usuario (nome, email, senha)
VALUES 
('João Silva', 'joao.silva@email.com', 'senha123');

CREATE TABLE Atividade(
   idatividade SERIAL PRIMARY KEY,
   nomeatividade VARCHAR(255) not null
);
INSERT INTO Atividade (nomeatividade) 
VALUES ('Corrida de Trilha');

CREATE TABLE rota (
    idrota SERIAL PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    localizacao VARCHAR(50) NOT NULL,
    distancia FLOAT NOT NULL,
    dificuldade VARCHAR(20) NOT NULL,
    duracao FLOAT NOT NULL
);
INSERT INTO rota (nome, localizacao, distancia, dificuldade, duracao)
VALUES ('Trilha da Pedra Grande', 'Atibaia - SP', 9.5, 'Médio', 3.0);
INSERT INTO rota (nome, localizacao, distancia, dificuldade, duracao)
VALUES ('Caminho das Águas', 'Parque Nacional da Serra da Canastra - MG', 15.0, 'Difícil', 6.5);

CREATE TABLE AtividadeRealizada (
    idatividadeRealizada serial PRIMARY KEY,
    idusuario INT NOT NULL,
    idatividade INT NOT NULL,
    idrota INT NOT NULL,
    datarealizacao DATE,
    distanciapercorrida FLOAT,
    situacao varchar(1) not null,

    constraint fk_usuario foreign key (idusuario) references Usuario (idusuario),
    constraint fk_atividade foreign key (idatividade) references Atividade (idatividade),
    constraint fk_rota foreign key (idrota) references Rota (idrota)
);
INSERT INTO AtividadeRealizada 
(idusuario, idatividade, idrota, datarealizacao, distanciapercorrida, situacao) 
VALUES 
(1, 1, 1, '2025-06-03', 12.5, 'A');
