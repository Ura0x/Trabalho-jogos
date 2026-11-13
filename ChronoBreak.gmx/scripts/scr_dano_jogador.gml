/// scr_dano_jogador(dano, fisico)
// Tira vida do jogador.
// fisico = true  -> golpe fisico (robo, zona de impacto): atravessa o escudo
// fisico = false -> tiro: o escudo bloqueia
var dano, fisico;
dano = argument0;
fisico = argument1;
with (obj_player) {
    if (invencivel <= 0) {
        if (escudo_ativo > 0 && fisico == false) {
            // o escudo segurou o tiro: so faz barulho
            sound_play(snd_acerto);
        } else {
            vida -= dano;
            sound_play(snd_dano);
            invencivel = 40; // alguns frames sem levar dano de novo
            if (vida <= 0) {
                instance_create(x, y, obj_explosao);
                instance_destroy();
            }
        }
    }
}
