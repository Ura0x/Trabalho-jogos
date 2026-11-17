/// scr_textos_fase(momento)
// TODAS as falas da historia ficam aqui, separadas por fase e por momento:
//   "inicio" = quando a fase comeca
//   "limpo"  = quando todos os inimigos foram derrotados
//   "saida"  = quando o jogador entra na saida
//   (e alguns momentos especiais da fase 3 e do chefe)
// Obs: nao use o caractere jogo-da-velha nos textos, no GameMaker ele vira quebra de linha.
var m;
m = argument0;

switch (room) {

// ------------------------------------------------------------------
case rm_fase1:
    if (m == "inicio") {
        scr_fala("", "Distrito 12, 2089. John Titor, tecnico de manutencao da NEXUS, esta terminando seu turno quando uma falha eletrica atinge uma instalacao de energia.");
        scr_fala("", "La dentro ele encontra uma porta destrancada e um computador que nao aparece nos mapas. Os arquivos falam de um tal Projeto Chrono Gate: uma maquina do tempo no centro da cidade.");
        scr_fala("", "O sistema detecta o acesso nao autorizado. Os guardas recebem ordens para dete-lo. Na confusao, John desarma um deles e fica com a arma.");
        scr_fala("John", "Eu nem sei usar isso direito!");
        scr_fala("IA", "Calma, Titor. Eu te ensino. Use W, A, S e D para se mover.");
        scr_fala("IA", "Mire com o mouse e segure o botao esquerdo para atirar.");
        scr_fala("IA", "Cuidado: essa arma esquenta. Se a barra de CALOR encher, ela trava ate esfriar. Controle o ritmo dos tiros.");
        scr_fala("IA", "Se quiser reler os arquivos, chegue perto do computador e aperte E. Objetivo: derrotar todos os guardas e escapar.");
    }
    if (m == "limpo") {
        scr_fala("IA", "Achei uma mensagem no dispositivo de um dos guardas:");
        scr_fala("Dispositivo NEXUS", "'O individuo teve contato com informacoes do mais alto nivel de confidencialidade. Contencao letal devera ser efetivada.'");
        scr_fala("John", "Contencao letal... Eles querem me matar. Minha vida normal ja era.");
        scr_fala("John", "Nao vou passar o resto da vida fugindo. Vou ate o centro da cidade acabar com essa historia.");
        scr_fala("IA", "O centro e so para o alto escalao. Primeiro vamos sair daqui. Siga para a SAIDA.");
    }
    if (m == "saida") {
        scr_fala("", "John escapa da instalacao, mas todas as saidas do distrito sao bloqueadas.");
        scr_fala("", "A NEXUS o identifica publicamente como um terrorista que roubou informacoes confidenciais.");
    }
    break;

// ------------------------------------------------------------------
case rm_fase2:
    if (m == "inicio") {
        scr_fala("", "Ruas do Distrito 12. John atravessa ruas que conhece desde crianca, agora tomadas por guardas e drones.");
        scr_fala("", "Nas telas, a NEXUS mostra a foto dele e diz que ele roubou tecnologia capaz de colocar milhares de vidas em risco.");
        scr_fala("", "As casas estao todas fechadas. Ninguem quer ser associado a um criminoso.");
        scr_fala("IA", "Drones a frente: sao rapidos, mas frageis. Destrua os drones e derrote os guardas para sair do distrito.");
    }
    if (m == "limpo") {
        scr_fala("IA", "Area limpa. Detectei um abrigo depois da SAIDA. Vamos.");
    }
    if (m == "saida") {
        scr_fala("", "John encontra um pequeno abrigo de dois ex-funcionarios da NEXUS. Eles mostram uma noticia antiga:");
        scr_fala("Relatorio de Expansao 2053-2056", "'Guerras, escassez de energia e colapsos economicos deixaram diversos paises a beira do caos. Apresentamos uma rede de energia automatizada que ajuda a restabelecer servicos essenciais.'");
        scr_fala("Relatorio de Expansao 2053-2056", "'A populacao demonstra crescente dependencia dos servicos energeticos da companhia. Recomenda-se ampliar a integracao dos sistemas publicos antes que os governos recuperem sua capacidade operacional.'");
        scr_fala("John", "Entao os governos nao falharam sozinhos... A NEXUS aproveitou a crise para deixar todo mundo dependente dela.");
        scr_fala("Ex-funcionaria", "Se quer chegar ao centro, va pelo antigo setor industrial. La voce chama menos atencao, e ele liga direto ao centro da cidade.");
    }
    break;

// ------------------------------------------------------------------
case rm_fase3:
    if (m == "inicio") {
        scr_fala("", "Setor Industrial. Oficialmente desativado ha anos... mas muito mais conservado e moderno que o Distrito 12.");
        scr_fala("IA", "Achei um terminal. Consegui abrir um arquivo de texto:");
        scr_fala("Arquivo", "'Apos uma serie de atentados e revoltas, a NEXUS recebe autorizacao para administrar a seguranca publica. Esperamos que com suas novas tecnologias de robos possam ajudar a combater a violencia no mundo.'");
        scr_fala("Arquivo", "'Para provar a sua eficacia, o dono da instituicao tornou mecanicas algumas partes suas.'");
        scr_fala("", "Dois robos bloqueiam o caminho para o centro e outros cercam John. O setor nao estava abandonado: robos descartados tomaram conta do lugar.");
        scr_fala("IA", "Robos sao lentos, mas aguentam muito e batem forte de perto. Nao deixe eles encostarem em voce.");
        scr_fala("IA", "Os dois da saida estao protegidos. Derrote os outros primeiro.");
    }
    if (m == "item") {
        scr_fala("IA", "Titor, esse robo perdeu o braco! Tem um dispositivo com um botao nele. Pegue!");
    }
    if (m == "escudo") {
        scr_fala("IA", "E um gerador de escudo! Aperte ESPACO para ligar um escudo temporario a prova de balas.");
        scr_fala("IA", "Mas atencao: golpes fisicos, como os dos robos, atravessam o escudo.");
    }
    if (m == "guardioes") {
        scr_fala("IA", "Os robos da saida comecaram a se mover! Agora eles podem ser derrotados.");
    }
    if (m == "limpo") {
        scr_fala("IA", "Caminho livre. O centro da cidade fica depois dessa SAIDA.");
    }
    if (m == "saida") {
        scr_fala("", "John segue para o centro da cidade, um pouco mais confiante agora que tambem tem um escudo.");
    }
    break;

// ------------------------------------------------------------------
case rm_fase4:
    if (m == "inicio") {
        scr_fala("", "Centro da Cidade. Tudo e luxuoso, completamente diferente de onde John viveu a vida inteira.");
        scr_fala("Onnerb", "Pelo visto voce sobreviveu ao setor industrial, Titor.");
        scr_fala("Onnerb", "Nao esperava que sobrevivesse aos robos daquela regiao, mas vaso ruim nao quebra, nao e mesmo? Admiro sua coragem de vir acabar com o meu imperio sozinho, mas voce nao passara daqui.");
        scr_fala("John", "Acabar com o seu regime? Eu so quero pegar a maquina do tempo e ir embora. Acabar com o regime e so consequencia da viagem.");
        scr_fala("Onnerb", "Entao e so um idiota mesmo. Eu SALVEI todos voces, eu sou um HEROI! Olhe esta cidade. Voce acha que a violencia e as guerras do passado trariam tanta prosperidade?");
        scr_fala("Onnerb", "Desde 2071 eu resolvo todos os problemas do governo. Coloquei ate partes roboticas em mim para viver muito mais tempo.");
        scr_fala("John", "Olha, nao e querendo queimar o seu filme, mas uma empresa tomar conta dos recursos basicos, da seguranca e do governo e meio estranho, nao? Parece ate que alguem planejou os problemas do passado...");
        scr_fala("Onnerb", "Tsc. Eu nao nego que planejei tudo isso. Mas e por uma otima causa. A liberdade do passado e a causa de todos os problemas daquela epoca.");
        scr_fala("John", "Quem?");
        scr_fala("Onnerb", "Ha?");
        scr_fala("John", "Perguntou.");
        scr_fala("Onnerb", "Seu palhaco! Ja perdi muito tempo com suas idiotices. MORRA!");
    }
    if (m == "onnerb_saiu") {
        scr_fala("", "Onnerb entra no predio e uma horda de robos, guardas e drones avanca sobre John.");
        scr_fala("IA", "Titor, usei pecas dos robos para melhorar sua arma: ela esquenta bem mais devagar e causa o dobro de dano. Derrote todos para entrar no predio!");
    }
    if (m == "limpo") {
        scr_fala("IA", "Nao sobrou ninguem. A porta do predio da NEXUS esta aberta!");
    }
    if (m == "saida") {
        scr_fala("", "John entra no predio da NEXUS, onde vai acontecer a batalha final.");
    }
    break;

// ------------------------------------------------------------------
case rm_fase5:
    if (m == "inicio") {
        scr_fala("", "Dentro do predio. Os alarmes estao disparando e as luzes de emergencia estao acesas.");
        scr_fala("IA", "Titor, detectei uma concentracao anormal de energia nos niveis inferiores. A maquina esta proxima.");
        scr_fala("John", "Otimo. A gente pega a maquina, eu volto no tempo e esse pesadelo acaba.");
        scr_fala("IA", "Ha um problema.");
        scr_fala("John", "Claro que tem.");
        scr_fala("IA", "O sistema Chrono Gate exige autorizacao biometrica do diretor executivo da NEXUS.");
        scr_fala("John", "Entao eu tenho que encontrar o abencoado. Que otimo.");
        scr_fala("IA", "Ele esta no mesmo andar da maquina do tempo. Derrote os segurancas e siga ate o ELEVADOR.");
    }
    if (m == "limpo") {
        scr_fala("IA", "O elevador abriu. Vamos!");
    }
    if (m == "saida") {
        scr_fala("", "O elevador leva John ate o Chrono Gate.");
    }
    break;

// ------------------------------------------------------------------
case rm_boss:
    if (m == "inicio") {
        scr_fala("", "O Chrono Gate e um portao gigante no fundo da sala. Onnerb espera ao lado dele.");
        scr_fala("Onnerb", "Olhe para voce. Um tecnico de manutencao. Sem treinamento, sem autoridade, sem qualquer compreensao do que esta tentando destruir.");
        scr_fala("John", "E mesmo assim voce mandou metade da cidade atras de mim.");
        scr_fala("Onnerb", "Voce poderia ter continuado sua vida. Poderia ter ignorado o que viu.");
        scr_fala("John", "Eu tentei! Foram voces que decidiram que eu precisava morrer!");
        scr_fala("Onnerb", "Porque voce representa uma ameaca a estabilidade deste mundo.");
        scr_fala("John", "Nao. Eu represento uma ameaca a voce.");
        scr_fala("Onnerb", "Entao venha provar isso.");
        scr_fala("", "Uma armadura gigante cobre Onnerb e vira uma especie de nave-robo.");
        scr_fala("Onnerb", "Eu passei 36 anos construindo este mundo. Voce nao vai destrui-lo.");
        scr_fala("IA", "Titor, ele nao vai sair do lugar, mas a armadura tem canhoes em todas as direcoes. Mantenha-se em movimento!");
    }
    if (m == "chefe_metade") {
        scr_fala("", "A armadura racha e solta faiscas.");
        scr_fala("Onnerb", "Impossivel... um tecnico de manutencao?! Eu nao vou perder para um ninguem!");
        scr_fala("John", "Voce insiste em dizer isso como se fosse um insulto.");
        scr_fala("Onnerb", "SISTEMAS DE SEGURANCA, ATIVAR PROTOCOLO DE ELIMINACAO!");
        scr_fala("IA", "Titor, o piso esta marcando zonas de impacto! Fique longe das areas vermelhas!");
    }
    if (m == "limpo") {
        scr_fala("", "A armadura explode em pedacos e Onnerb cai de joelhos.");
        scr_fala("Onnerb", "Eu... eu so queria... que desse certo...");
        scr_fala("John", "Deu certo. Pra voce. So nao pra todo o resto.");
        scr_fala("", "Onnerb fica em silencio. O Chrono Gate se reativa sozinho, reconhecendo a biometria do diretor executivo, que ainda esta na sala.");
        scr_fala("IA", "Titor, o portal esta pronto. Mas nao sei o que existe do outro lado.");
        scr_fala("John", "Eu tambem nao. Mas pior do que aqui nao deve ser.");
    }
    if (m == "saida") {
        scr_fala("John", "Ei, Onnerb.");
        scr_fala("Onnerb", "...");
        scr_fala("John", "Obrigado pelo emprego.");
    }
    break;
}
