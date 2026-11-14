/// scr_musica_manter()
// Chamado todo Step. Se a musica de fundo parou sozinha
// (o navegador as vezes corta quando tem muito som ao mesmo tempo), toca de novo.
if (global.musica != -1) {
    if (!sound_isplaying(global.musica)) sound_loop(global.musica);
}
