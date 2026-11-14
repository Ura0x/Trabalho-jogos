/// scr_musica(musica)
// Troca a musica de fundo. Se a mesma musica ja estiver tocando, nao faz nada
// (assim ela nao reinicia quando o jogador passa de fase ou morre).
if (global.musica != argument0) {
    // para todas as musicas antes, para nunca tocarem duas juntas
    sound_stop(mus_fase);
    sound_stop(mus_chefe);
    sound_stop(mus_final);
    sound_loop(argument0);
    global.musica = argument0;
    global.musica_espera = 0;
}
