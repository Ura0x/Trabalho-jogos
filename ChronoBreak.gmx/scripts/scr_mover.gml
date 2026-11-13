/// scr_mover(direcao, velocidade)
// Move a instancia na direcao dada sem atravessar paredes.
// X e Y sao testados separados: assim o personagem "desliza" encostado na parede.
var dx, dy;
dx = lengthdir_x(argument1, argument0);
dy = lengthdir_y(argument1, argument0);
if (!place_meeting(x + dx, y, obj_parede)) x += dx;
if (!place_meeting(x, y + dy, obj_parede)) y += dy;
