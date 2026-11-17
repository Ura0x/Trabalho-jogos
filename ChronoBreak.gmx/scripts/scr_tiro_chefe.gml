/// scr_tiro_chefe(direcao, velocidade)
// Tiro do chefe (chamado de dentro do obj_chefe): bola azul na fase 1,
// bola vermelha na fase 2. Dano 8. Tambem liga a animacao de tiro.
var b;
b = scr_tiro_inimigo(x, y, argument0, argument1, 8);
if (fase == 1) b.sprite_index = spr_orb_ciano;
else b.sprite_index = spr_orb_brasa;
b.image_speed = 0.17;
atirando = 20;
