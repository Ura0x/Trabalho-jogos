/// scr_musica(musica)
// Troca a musica de fundo. Se a mesma musica ja estiver tocando, nao faz nada
// (assim ela nao reinicia quando o jogador passa de fase ou morre).
if (global.musica != argument0) {
    if (global.musica != -1) sound_stop(global.musica);
    sound_loop(argument0);
    global.musica = argument0;
}
