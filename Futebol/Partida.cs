using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Futebol
{
    public class Partida
    {
        public int Id { get; set; }
        public int IdEquipeMaiorNumeroGols { get; set; }
        public int IdMandante { get; set; }
        public int IdVisitante { get; set; }
        public string ApelidoMandante { get; set; }
        public string ApelidoVisitante { get; set; }
        public int GolsMandante { get; set; }
        public int GolsVisitante { get; set; }
        public int TotalGols { get; set; }
        public string DataPartida { get; set; }

        public void BuscarJogoComMaisGolsBD(SqlConnection conexaoSql)
        {
            SqlCommand cmd = new SqlCommand("SP_Futebol_Jogo_Com_Mais_Gols", conexaoSql);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;

            using (SqlDataReader reader = cmd.ExecuteReader())
            {
                while (reader.Read())
                {
                    this.Id = reader.GetInt32(reader.GetOrdinal("Id"));
                    this.ApelidoMandante = reader.GetString(reader.GetOrdinal("TimeMandante"));
                    this.ApelidoVisitante = reader.GetString(reader.GetOrdinal("TimeVisitante"));
                    this.GolsMandante = reader.GetInt32(reader.GetOrdinal("GolsMandante"));
                    this.GolsVisitante = reader.GetInt32(reader.GetOrdinal("GolsVisitante"));
                    this.DataPartida = reader.GetString(reader.GetOrdinal("data_partida"));
                    this.TotalGols = reader.GetInt32(reader.GetOrdinal("TotalGols"));
                }
            }
        }
    }
}
