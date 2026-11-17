/// scr_voltar_menu()
// Volta para o menu reiniciando o jogo inteiro (game_restart).
// Assim nada da partida anterior sobra: musica tocando, escudo, arma melhorada...
sound_stop_all();
scr_musica_parar();
game_restart();
