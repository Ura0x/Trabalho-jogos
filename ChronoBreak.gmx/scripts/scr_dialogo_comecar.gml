/// scr_dialogo_comecar(acao)
// Mostra as falas da fila. O jogo fica pausado ate o dialogo acabar.
// Quando acabar, o obj_controle executa a "acao":
//   "jogar"        -> comeca a fase
//   "continuar"    -> so volta ao jogo
//   "abrir_saida"  -> libera a saida da fase
//   "proxima_fase" -> vai para a proxima room
//   "chefe_fase2"  -> o chefe volta a poder levar dano (modo 2)
//   "portal"       -> sequencia final do Chrono Gate
var a;
a = argument0;
with (obj_controle) {
    dialogo_ativo = true;
    fala_atual = 0;
    letras = 0;
    acao_final = a;
}
global.pausado = true;
