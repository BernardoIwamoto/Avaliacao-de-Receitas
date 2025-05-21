CREATE TABLE categorias (
    id INT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE receitas (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    categoria_id INT,
    modo_preparo TEXT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id)
);

CREATE TABLE ingredientes (
    id INT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    unidade VARCHAR(20)
);

CREATE TABLE receita_ingrediente (
    receita_id INT,
    ingrediente_id INT,
    quantidade DECIMAL(10,2),
    PRIMARY KEY (receita_id, ingrediente_id),
    FOREIGN KEY (receita_id) REFERENCES receitas(id),
    FOREIGN KEY (ingrediente_id) REFERENCES ingredientes(id)
);
