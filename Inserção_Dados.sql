INSERT INTO categorias VALUES
(1, 'Doce'),
(2, 'Salgado'),
(3, 'Vegana');

INSERT INTO receitas VALUES
(1, 'Bolo de Cenoura', 1, 'Misture os ingredientes, asse por 40 min...'),
(2, 'Salada Mediterrânea', 3, 'Misture os vegetais frescos com azeite...'),
(3, 'Omelete', 2, 'Bata os ovos e frite...');

INSERT INTO ingredientes VALUES
(1, 'Cenoura', 'g'),
(2, 'Ovo', 'un'),
(3, 'Farinha de Trigo', 'g'),
(4, 'Tomate', 'un'),
(5, 'Alface', 'folha'),
(6, 'Azeite', 'ml');

INSERT INTO receita_ingrediente VALUES
(1, 1, 300),   -- Bolo de cenoura: 300g cenoura
(1, 3, 200),   -- Farinha
(1, 2, 3),     -- Ovos

(2, 4, 2),     -- Tomate
(2, 5, 5),     -- Alface
(2, 6, 20),    -- Azeite

(3, 2, 2);     -- Omelete: ovos
