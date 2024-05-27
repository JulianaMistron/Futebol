using Futebol;
using System.Data.SqlClient;
using System.Runtime.CompilerServices;

Banco conn = new Banco();
SqlConnection conexaoSql = new SqlConnection(conn.Caminho());
conexaoSql.Open();

void ExibirClassificacaoGeral()
{
    Pontuacao pontuacao = new Pontuacao();
    List<Pontuacao> classificacoes = pontuacao.BuscarClassificacaoGeralBD(conexaoSql);

    Console.WriteLine($"Resultado Geral - {classificacoes.FirstOrDefault().Campeonato}");
    for (int i = 0; i < classificacoes.Count; i++)
    {
        Console.WriteLine($"Campeonato: {classificacoes[i].Campeonato} || Time: {classificacoes[i].Time} || Pontos: {classificacoes[i].Pontos} || Gols Feitos: {classificacoes[i].GolsFeitos} || Gols Sofridos: {classificacoes[i].GolsSofridos}");
    }
}

void ExibirMaiorNumeroGolsTimes()
{
    TimeFutebol timeFutebol = new TimeFutebol();
    List<TimeFutebol> times = timeFutebol.BuscarMaiorNumeroGolsTimesBD(conexaoSql);

    Console.WriteLine($"Maior número de gols dos times em uma partida: ");
    for (int i = 0; i < times.Count; i++)
    {
        Console.WriteLine($"Time: {times[i].Apelido} || Gols: {times[i].MaiorNumeroGolsPartida}");
    }
}

void ExibirCampeao()
{
    Pontuacao pontuacao = new Pontuacao();
    List<Pontuacao> classificacoes = pontuacao.BuscarClassificacaoGeralBD(conexaoSql);
    Console.WriteLine($"O campeão é: {classificacoes.FirstOrDefault().Time}");
}

void ExibirTimeMaisGols()
{
    TimeFutebol maiorGoleador = new TimeFutebol();
    maiorGoleador.BuscarMaiorGoleadorBD(conexaoSql);
    Console.WriteLine($"O time que mais fez gols foi o {maiorGoleador.Apelido} com {maiorGoleador.GolsFeitos} gols.");
}

void ExibirTimeMaisGoleado()
{
    TimeFutebol maisGoleado = new TimeFutebol();
    maisGoleado.BuscarMaisGoleadoBD(conexaoSql);
    Console.WriteLine($"O time que mais sofreu gols foi o {maisGoleado.Apelido} com {maisGoleado.GolsSofridos} gols.");
}

void ExibirPartidaComMaisGols()
{
    Partida partida = new Partida();
    partida.BuscarJogoComMaisGolsBD(conexaoSql);
    Console.WriteLine($"O jogo que teve mais gols foi: {partida.ApelidoMandante} {partida.GolsMandante} X {partida.GolsVisitante} {partida.ApelidoVisitante} || Data da Partida {partida.DataPartida}.");
}

int opcao;
do
{
    Console.WriteLine(">>>>>CAMPEONATO DE FUTEBOL FEMININO<<<<<");
    Console.WriteLine("\nOpções:");
    Console.WriteLine("\n[ 1 ] - Resultado Geral");
    Console.WriteLine("[ 2 ] - Campeão final do campeonato");
    Console.WriteLine("[ 3 ] - Time que mais fez gols");
    Console.WriteLine("[ 4 ] - Time que mais tomou gols");
    Console.WriteLine("[ 5 ] - Jogo que mais teve gols");
    Console.WriteLine("[ 6 ] - Maior número de gols que cada time fez em um único jogo");
    Console.WriteLine("[ 0 ] - Sair");
    Console.WriteLine("Informe a opção desejada: \b\b");
    opcao = int.Parse(Console.ReadLine());


    switch (opcao)
    {
        case 0:
            return;
        case 1:
            ExibirClassificacaoGeral();
            Console.ReadKey();
            Console.Clear();
            break;

        case 2:
            ExibirCampeao();
            Console.ReadKey();
            Console.Clear();
            break;

        case 3:
            ExibirTimeMaisGols();
            Console.ReadKey();
            Console.Clear();
            break;

        case 4:
            ExibirTimeMaisGoleado();
            Console.ReadKey();
            Console.Clear();
            break;

        case 5:
            ExibirPartidaComMaisGols();
            Console.ReadKey();
            Console.Clear();
            break;

        case 6:
            ExibirMaiorNumeroGolsTimes();
            Console.ReadKey();
            Console.Clear();
            break;

        default:
            Environment.Exit(0);
            break;
    }
} while (opcao != 0);

Console.ReadKey();