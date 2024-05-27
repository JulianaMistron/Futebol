using System.Data.SqlClient;

namespace Futebol
{
    public class TimeFutebol
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Apelido { get; set; }
        public int GolsFeitos { get; set; }
        public int GolsSofridos { get; set; }
        public int MaiorNumeroGolsPartida { get; set; }

        public void BuscarMaiorGoleadorBD(SqlConnection conexaoSql)
        {
            SqlCommand cmd = new SqlCommand("SP_Futebol_Maior_Goleador", conexaoSql);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    this.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                    this.Apelido = reader.GetString(reader.GetOrdinal("Apelido"));
                    this.Nome = reader.GetString(reader.GetOrdinal("Nome"));
                    this.GolsFeitos = reader.GetInt32(reader.GetOrdinal("GolsFeitos"));
                }
            }
        }

        public void BuscarMaisGoleadoBD(SqlConnection conexaoSql)
        {
            SqlCommand cmd = new SqlCommand("SP_Futebol_Mais_Goleado", conexaoSql);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    this.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                    this.Apelido = reader.GetString(reader.GetOrdinal("Apelido"));
                    this.Nome = reader.GetString(reader.GetOrdinal("Nome"));
                    this.GolsSofridos = reader.GetInt32(reader.GetOrdinal("GolsSofridos"));
                }
            }
        }

        public List<TimeFutebol> BuscarMaiorNumeroGolsTimesBD(SqlConnection conexaoSql)
        {
            List<TimeFutebol> times = new List<TimeFutebol>();
            List<Partida> partidas = new List<Partida>();
            SqlCommand cmd = new SqlCommand("SP_Futebol_Time_Maior_Numero_Gols", conexaoSql);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    Partida partida = new Partida
                    {
                        IdEquipeMaiorNumeroGols = reader.GetInt32(reader.GetOrdinal("id_equipe")),
                        Id = reader.GetInt32(reader.GetOrdinal("id_partida")),
                        DataPartida = reader.GetString(reader.GetOrdinal("data_partida")),
                        TotalGols = reader.GetInt32(reader.GetOrdinal("gols"))
                    };
                    partidas.Add(partida);
                }

                if (reader.NextResult())
                {
                    while (reader.Read())
                    {
                        TimeFutebol time = new TimeFutebol
                        {
                            Id = reader.GetInt32(reader.GetOrdinal("id")),
                            Nome = reader.GetString(reader.GetOrdinal("nome")),
                            Apelido = reader.GetString(reader.GetOrdinal("apelido")),

                        };
                        times.Add(time);
                    }
                }
                foreach (TimeFutebol equipe in times)
                {
                    equipe.MaiorNumeroGolsPartida = partidas.First(p => p.IdEquipeMaiorNumeroGols.Equals(equipe.Id)).TotalGols;
                }

                return times;
            }
        }
    }
}

