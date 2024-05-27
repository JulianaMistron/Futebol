using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Futebol
{
    public class Pontuacao
    {
        public string Campeonato { get; set; }
        public string Time { get; set; }
        public int Pontos { get; set; }
        public int GolsFeitos { get; set; }
        public int GolsSofridos { get; set; }

        public List<Pontuacao> BuscarClassificacaoGeralBD(SqlConnection conexaoSql)
        {
            List<Pontuacao> classificacoes = new List<Pontuacao>();
            SqlCommand cmd = new SqlCommand("SP_Futebol_Classificacao_Geral", conexaoSql);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    Pontuacao classificacaoGeral = new Pontuacao
                    {
                        Campeonato = reader.GetString(reader.GetOrdinal("Campeonato")),
                        Time = reader.GetString(reader.GetOrdinal("Time")),
                        Pontos = reader.GetInt32(reader.GetOrdinal("Pontos")),
                        GolsFeitos = reader.GetInt32(reader.GetOrdinal("GolsFeitos")),
                        GolsSofridos = reader.GetInt32(reader.GetOrdinal("GolsSofridos"))
                    };

                    classificacoes.Add(classificacaoGeral);
                }
            }

            return classificacoes;
        }

    }
}
