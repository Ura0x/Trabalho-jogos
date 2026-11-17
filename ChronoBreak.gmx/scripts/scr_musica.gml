/// scr_musica(musica)
// Troca a musica de fundo. Se a mesma musica ja estiver tocando, nao faz nada
// (assim ela nao reinicia quando o jogador passa de fase).
// As musicas sao do tipo "Background music": o GameMaker so deixa uma tocar
// por vez, entao comecar uma nova ja corta a anterior mesmo se o stop falhar.
if (global.musica != argument0) {
    scr_musica_parar();          // para todas antes, para nunca tocarem duas juntas
    sound_volume(argument0, 1);
    sound_loop(argument0);
    global.musica = argument0;
}
