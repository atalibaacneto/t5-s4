--1
CREATE OR REPLACE PROCEDURE brh.insere_projeto (
       p_id in NUMBER,
       p_nome in VARCHAR,
       p_responsavel in VARCHAR,
       p_inicio in DATE,
       p_fim in DATE)      
IS
BEGIN
    INSERT INTO projeto (id, nome, responsavel, inicio, fim) 
    VALUES (p_id, p_nome, p_responsavel, p_inicio, p_fim);
END;
--2
CREATE OR REPLACE FUNCTION brh.calcula_idade
    (p_DATA IN DATE)
RETURN
    INTEGER
IS
    v_IDADE INTEGER;
BEGIN
    SELECT (MONTHS_BETWEEN(SYSDATE, p_DATA)/12) AS IDADE INTO v_IDADE FROM dual;
    
    RETURN v_IDADE;
END;
--3
CREATE OR REPLACE FUNCTION brh.finaliza_projeto
(p_ID IN brh.projeto.id%TYPE)
RETURN
    DATE
IS
    v_FIM DATE;
BEGIN
    UPDATE BRH.PROJETO SET FIM = SYSDATE  WHERE ID = p_ID;
    RETURN v_FIM;
END;
--4
CREATE OR REPLACE PROCEDURE brh.insere_projeto (
       p_id in NUMBER,
       p_nome in VARCHAR,
       p_responsavel in VARCHAR,
       p_inicio in DATE,
       p_fim in DATE)      
IS
BEGIN
    IF LENGTH(p_nome) < 2 OR p_nome IS NULL THEN
        dbms_output.put_line('Nome de projeto inválido!');
    ELSE
        INSERT INTO projeto (id, nome, responsavel, inicio, fim) 
        VALUES
        (p_id, p_nome, p_responsavel, p_inicio, p_fim);
    END IF;
END;