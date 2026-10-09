USE EstacionamentoDB;
GO

-- GERAR MASSA DE TESTE (5K REGISTROS)
SET NOCOUNT ON;
DECLARE @i INT = 1;
WHILE @i <= 5000
BEGIN
	INSERT INTO RegistrosEstacionamento 
	(veiculo_id, vaga_id, data_hora_entrada, data_hora_saida, valor_total)
	VALUES (3, 1, DATEADD(MINUTE, -@i, GETDATE()), DATEADD(MINUTE, -@i, GETDATE()), 25.00);
	SET @i = @i + 1;
END;
GO

-- HABILITAR MÉTRICAS E/S E TEMPO
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- CONSULTA EM CAMPOS SEM ÍNDICE
SELECT id, veiculo_id, valor_total FROM RegistrosEstacionamento
WHERE data_hora_entrada >= '2026-09-01' AND data_hora_entrada <= '2026-10-31'

-- CRIANDO INDICE EM NAO-CLUSTERIZADO
DROP INDEX IX_Registros_DataEntrada ON RegistrosEstacionamento;
GO

CREATE NONCLUSTERED INDEX IX_Registros_DataEntrada
ON RegistrosEstacionamento (data_hora_entrada)
INCLUDE (valor_total, veiculo_id);
GO

