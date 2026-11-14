/// scr_musica_manter()
// Chamado todo Step. Se a musica de fundo parou sozinha
// (o navegador as vezes corta quando tem muito som ao mesmo tempo), toca de novo.
// So confere a cada 3 segundos: logo depois de mandar tocar, o navegador ainda
// esta carregando o audio e diz que nao esta tocando (isso fazia a musica dobrar).
if (global.musica == -1) exit;
global.musica_espera += 1;
if (global.musica_espera < 180) exit;
global.musica_espera = 0;
if (!sound_isplaying(global.musica)) {
    sound_stop(global.musica);   // garante que nao fica uma copia tocando
    sound_loop(global.musica);
}
