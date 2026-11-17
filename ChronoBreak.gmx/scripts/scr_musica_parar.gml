/// scr_musica_parar()
// Para todas as musicas de fundo.
// Alem do sound_stop, zera o volume de cada uma: em alguns casos o GameMaker
// continuava tocando a musica mesmo depois do stop (ela volta ao volume 1
// quando o scr_musica manda tocar de novo).
sound_stop(mus_fase);
sound_stop(mus_chefe);
sound_stop(mus_final);
sound_stop(mus_game_over);
sound_volume(mus_fase, 0);
sound_volume(mus_chefe, 0);
sound_volume(mus_final, 0);
sound_volume(mus_game_over, 0);
global.musica = -1;
