USE [Futebol]
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Time_Maior_Numero_Gols]    Script Date: 27/05/2024 16:39:02 ******/
DROP PROCEDURE IF EXISTS [dbo].[SP_Futebol_Time_Maior_Numero_Gols]
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Mais_Goleado]    Script Date: 27/05/2024 16:39:02 ******/
DROP PROCEDURE IF EXISTS [dbo].[SP_Futebol_Mais_Goleado]
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Maior_Goleador]    Script Date: 27/05/2024 16:39:02 ******/
DROP PROCEDURE IF EXISTS [dbo].[SP_Futebol_Maior_Goleador]
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Jogo_Com_Mais_Gols]    Script Date: 27/05/2024 16:39:02 ******/
DROP PROCEDURE IF EXISTS [dbo].[SP_Futebol_Jogo_Com_Mais_Gols]
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Classificacao_Geral]    Script Date: 27/05/2024 16:39:02 ******/
DROP PROCEDURE IF EXISTS [dbo].[SP_Futebol_Classificacao_Geral]
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Calcular_Pontuacao]    Script Date: 27/05/2024 16:39:02 ******/
DROP PROCEDURE IF EXISTS [dbo].[SP_Futebol_Calcular_Pontuacao]
GO
/****** Object:  Table [dbo].[pontuacao]    Script Date: 27/05/2024 16:39:02 ******/
DROP TABLE IF EXISTS [dbo].[pontuacao]
GO
/****** Object:  Table [dbo].[partida]    Script Date: 27/05/2024 16:39:02 ******/
DROP TABLE IF EXISTS [dbo].[partida]
GO
/****** Object:  Table [dbo].[time_futebol]    Script Date: 27/05/2024 16:39:02 ******/
DROP TABLE IF EXISTS [dbo].[time_futebol]
GO
/****** Object:  Table [dbo].[campeonato]    Script Date: 27/05/2024 16:39:02 ******/
DROP TABLE IF EXISTS [dbo].[campeonato]
GO
/****** Object:  Table [dbo].[campeonato]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[campeonato](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ano] [varchar](30) NOT NULL,
	[nome] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[partida]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[partida](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_campeonato] [int] NOT NULL,
	[id_equipe_visitante] [int] NOT NULL,
	[id_equipe_mandante] [int] NOT NULL,
	[data_partida] [varchar](30) NOT NULL,
	[gol_visitante] [int] NOT NULL,
	[gol_mandante] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[pontuacao]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[pontuacao](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_equipe] [int] NOT NULL,
	[id_campeonato] [int] NOT NULL,
	[pontos] [int] NULL,
	[gols_feitos] [int] NOT NULL,
	[gols_sofridos] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[time_futebol]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[time_futebol](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NULL,
	[apelido] [varchar](30) NOT NULL,
	[data_criacao] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[partida]  WITH CHECK ADD FOREIGN KEY([id_campeonato])
REFERENCES [dbo].[campeonato] ([id])
GO
ALTER TABLE [dbo].[partida]  WITH CHECK ADD FOREIGN KEY([id_equipe_visitante])
REFERENCES [dbo].[time_futebol] ([id])
GO
ALTER TABLE [dbo].[partida]  WITH CHECK ADD FOREIGN KEY([id_equipe_mandante])
REFERENCES [dbo].[time_futebol] ([id])
GO
ALTER TABLE [dbo].[pontuacao]  WITH CHECK ADD FOREIGN KEY([id_campeonato])
REFERENCES [dbo].[campeonato] ([id])
GO
ALTER TABLE [dbo].[pontuacao]  WITH CHECK ADD FOREIGN KEY([id_equipe])
REFERENCES [dbo].[time_futebol] ([id])
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Calcular_Pontuacao]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Futebol_Calcular_Pontuacao]
AS
BEGIN

	SET NOCOUNT ON;
	DECLARE @id_equipe INT
	DECLARE @Gols_Sofridos AS INT, @Gols_Feitos AS INT = 0
	DECLARE @Id_Campeonato AS INT = (select top 1 id from campeonato)

	DECLARE futebol_cursor CURSOR FOR SELECT id FROM time_futebol

	-- laço de times
	OPEN futebol_cursor
	FETCH NEXT FROM futebol_cursor INTO @id_equipe;

	WHILE @@FETCH_STATUS = 0
	BEGIN

		DELETE FROM pontuacao WHERE id_equipe = @id_equipe	
		
		insert into pontuacao([id_equipe], [id_campeonato], [pontos], [gols_feitos], [gols_sofridos])
		values (@id_equipe, @Id_Campeonato, 0, 0, 0)

		-- inserir gols feitos e gols sofridos
		-- obter gols como Mandante
		select  
			@Gols_Sofridos = sum(gol_visitante), 
			@Gols_Feitos = sum(gol_mandante)
		from partida where id_equipe_mandante = @id_equipe
		group by id_equipe_mandante

		update pontuacao set gols_sofridos = gols_sofridos + @Gols_Sofridos, 
		gols_feitos = gols_feitos + @Gols_Feitos
		where id_equipe = @id_equipe

		-- obter gols como Visitante
		select  
			@Gols_Sofridos = sum(gol_mandante), 
			@Gols_Feitos = sum(gol_visitante)
		from partida where id_equipe_visitante = @id_equipe
		group by id_equipe_visitante

		update pontuacao set gols_sofridos = gols_sofridos + @Gols_Sofridos, 
		gols_feitos = gols_feitos + @Gols_Feitos
		where id_equipe = @id_equipe
		
		-- pontuação
		-- se time como mandante ganhou 
		-- update na tab Pontuacao com 3 pontos			
		update pontuacao set pontos = pontos + (select 3 * (select ISNULL(count(*), 0) as vitorias from partida 
		where id_equipe_mandante = @id_equipe and gol_mandante > gol_visitante))
		where id_equipe = @id_equipe

		-- se time como visitante ganhou 
		-- update na tab Pontuacao com 5 pontos			
		update pontuacao set pontos = pontos + (select 5 * (select ISNULL(count(*), 0) as vitorias from partida 
		where id_equipe_visitante = @id_equipe and gol_visitante > gol_mandante))
		where id_equipe = 1
		
		-- se time como mandante ou visitante empatou
		-- update na tab Pontuacao com 1 ponto
		update pontuacao set pontos = pontos + (select 1 * (select ISNULL(count(*), 0) as vitorias from partida 
		where (id_equipe_mandante = @id_equipe or id_equipe_visitante = @id_equipe) and gol_mandante = gol_visitante))
		where id_equipe = @id_equipe

	FETCH NEXT FROM futebol_cursor INTO @id_equipe
	END
	CLOSE futebol_cursor;
	DEALLOCATE futebol_cursor;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Classificacao_Geral]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_Futebol_Classificacao_Geral]
AS
BEGIN

	SET NOCOUNT ON;

	-- classificação geral
	SELECT c.nome as 'Campeonato', 
		t.apelido as 'Time', 
		p.pontos as 'Pontos', 
		p.gols_feitos as 'GolsFeitos',
		p.gols_sofridos as 'GolsSofridos'
	FROM pontuacao p
	inner join time_futebol t on t.id = p.id_equipe
	inner join campeonato c on c.id = p.id_campeonato
	order by p.pontos desc

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Jogo_Com_Mais_Gols]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Futebol_Jogo_Com_Mais_Gols]
AS
BEGIN

	SET NOCOUNT ON;

	SELECT top 1 
		c.id as idCampeonato,
		c.nome as 'Campeonato', 
		tm.apelido as 'TimeMandante', 
		tv.apelido as 'TimeVisitante', 
		p.id,
		p.id_equipe_mandante,
		p.id_equipe_visitante,
		p.gol_visitante as 'GolsVisitante',
		p.gol_mandante as 'GolsMandante',
		p.data_partida,
		(p.gol_mandante + p.gol_visitante) as 'TotalGols'
	FROM partida p
	inner join time_futebol tm on tm.id = p.id_equipe_mandante
	inner join time_futebol tv on tv.id = p.id_equipe_visitante
	inner join campeonato c on c.id = p.id_campeonato
	ORDER BY TotalGols desc

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Maior_Goleador]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Futebol_Maior_Goleador]
AS
BEGIN

	SET NOCOUNT ON;

	SELECT TOP 1
		c.id as idCampeonato,
		t.id,
		c.nome as 'Campeonato', 
		t.apelido, 
		t.nome,
		p.gols_feitos as 'GolsFeitos'
	FROM pontuacao p
	inner join time_futebol t on t.id = p.id_equipe
	inner join campeonato c on c.id = p.id_campeonato
	ORDER BY p.gols_feitos DESC

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Mais_Goleado]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Futebol_Mais_Goleado]
AS
BEGIN

	SET NOCOUNT ON;

	SELECT TOP 1
		c.id as idCampeonato,
		t.id,
		c.nome as 'Campeonato', 
		t.apelido, 
		t.nome,
		p.gols_sofridos as 'GolsSofridos'
	FROM pontuacao p
	inner join time_futebol t on t.id = p.id_equipe
	inner join campeonato c on c.id = p.id_campeonato
	order by p.gols_sofridos DESC

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Futebol_Time_Maior_Numero_Gols]    Script Date: 27/05/2024 16:39:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[SP_Futebol_Time_Maior_Numero_Gols]
AS
BEGIN

	SET NOCOUNT ON;

	-- partida que cada time fez mais gols
	SELECT p1.id_equipe, p1.id AS id_partida, p1.gols, p1.data_partida
	FROM (
		SELECT id, id_equipe_visitante AS id_equipe, gol_visitante AS gols, data_partida
		FROM partida
		UNION ALL
		SELECT id, id_equipe_mandante AS id_equipe, gol_mandante AS gols, data_partida
		FROM partida
	) AS p1
	WHERE p1.data_partida = (
    SELECT MIN(p2.data_partida)
    FROM (
        SELECT id, id_equipe_visitante AS id_equipe, gol_visitante AS gols, data_partida
        FROM partida
        UNION ALL
        SELECT id, id_equipe_mandante AS id_equipe, gol_mandante AS gols, data_partida
        FROM partida
    ) AS p2
    WHERE p1.id_equipe = p2.id_equipe AND p2.gols = (
        SELECT MAX(p3.gols)
        FROM (
            SELECT id, id_equipe_visitante AS id_equipe, gol_visitante AS gols, data_partida
            FROM partida
            UNION ALL
            SELECT id, id_equipe_mandante AS id_equipe, gol_mandante AS gols, data_partida
            FROM partida
        ) AS p3
        WHERE p3.id_equipe = p1.id_equipe
    )
	);

	-- times
	SELECT [id], [nome], [apelido], [data_criacao] FROM time_futebol

END
GO
