/// scr_tiro_inimigo(x, y, direcao, velocidade, dano)
// Cria um tiro inimigo e devolve o id dele.
var b;
b = instance_create(argument0, argument1, obj_tiro_inimigo);
b.direction = argument2;
b.velocidade = argument3;
b.dano = argument4;
sound_play(snd_tiro_inimigo);
return b;
