using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Futebol
{
    internal class Banco
    {
        readonly string Conexao = "Data Source=127.0.0.1;Initial Catalog=Futebol;User id=sa;Password=SqlServer2019!;";

        public Banco()
        {
        }
        public string Caminho()
        { 
            return Conexao; 
        }
    }
}