USE [Futebol]
GO
SET IDENTITY_INSERT [dbo].[campeonato] ON 
GO
INSERT [dbo].[campeonato] ([id], [ano], [nome]) VALUES (1, N'2024', N'Brasileirão Feminino')
GO
SET IDENTITY_INSERT [dbo].[campeonato] OFF
GO
SET IDENTITY_INSERT [dbo].[time_futebol] ON 
GO
INSERT [dbo].[time_futebol] ([id], [nome], [apelido], [data_criacao]) VALUES (1, N'Sport Club Corinthians Paulista', N'Corinthians', N'23/05/2024')
GO
INSERT [dbo].[time_futebol] ([id], [nome], [apelido], [data_criacao]) VALUES (2, N'Sociedade Esportiva Palmeiras', N'Palmeiras', N'23/05/2024')
GO
INSERT [dbo].[time_futebol] ([id], [nome], [apelido], [data_criacao]) VALUES (3, N'São Paulo Futebol Clube', N'São Paulo', N'24/04/2024')
GO
INSERT [dbo].[time_futebol] ([id], [nome], [apelido], [data_criacao]) VALUES (4, N'Santos Futebol Clube', N'Santos', N'30/04/2024')
GO
INSERT [dbo].[time_futebol] ([id], [nome], [apelido], [data_criacao]) VALUES (6, N'Associação Ferroviária de Esportes', N'Ferroviária', N'10/05/2024')
GO
SET IDENTITY_INSERT [dbo].[time_futebol] OFF
GO
SET IDENTITY_INSERT [dbo].[partida] ON 
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (1, 1, 2, 1, N'24/5/2024', 1, 3)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (2, 1, 3, 1, N'25/5/2024', 2, 4)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (4, 1, 4, 1, N'26/5/2024', 2, 2)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (5, 1, 6, 1, N'27/5/2024', 2, 4)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (6, 1, 1, 2, N'23/5/2024', 3, 5)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (7, 1, 3, 2, N'28/5/2024', 1, 4)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (8, 1, 4, 2, N'29/5/2024', 2, 4)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (9, 1, 6, 2, N'29/5/2024', 0, 3)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (10, 1, 1, 3, N'30/5/2024', 3, 0)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (11, 1, 2, 3, N'31/5/2024', 2, 1)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (12, 1, 4, 3, N'1/6/2024', 2, 2)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (13, 1, 6, 3, N'2/6/2024', 3, 1)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (14, 1, 1, 4, N'3/6/2024', 3, 2)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (15, 1, 2, 4, N'4/6/2024', 1, 2)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (16, 1, 3, 4, N'5/6/2024', 0, 4)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (17, 1, 6, 4, N'6/6/2024', 1, 0)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (18, 1, 1, 6, N'7/6/2024', 3, 3)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (19, 1, 2, 6, N'8/6/2024', 3, 1)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (20, 1, 3, 6, N'9/6/2024', 3, 2)
GO
INSERT [dbo].[partida] ([id], [id_campeonato], [id_equipe_visitante], [id_equipe_mandante], [data_partida], [gol_visitante], [gol_mandante]) VALUES (21, 1, 4, 6, N'10/6/2024', 1, 3)
GO
SET IDENTITY_INSERT [dbo].[partida] OFF
GO