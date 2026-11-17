/// scr_titulo(x, y, texto, cor, alpha)
// Desenha um titulo grande e estilizado, centralizado em (x, y):
// brilho colorido em volta, contorno preto, efeito "glitch" vermelho/azul
// que treme devagar, texto branco e uma linha embaixo.
// (a versao Lite nao tem texto colorido/girado, entao o efeito e feito
//  desenhando o mesmo texto varias vezes com cores e posicoes diferentes)
var tx, ty, texto, cor, a, i, d, lw, lh;
tx = argument0;
ty = argument1;
texto = argument2;
cor = argument3;
a = argument4;

draw_set_font(fnt_logo);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// brilho em volta
draw_set_color(cor);
draw_set_alpha(0.12 * a);
for (i = 0; i < 8; i += 1) draw_text(tx + lengthdir_x(8, i * 45), ty + lengthdir_y(8, i * 45), texto);

// contorno preto
draw_set_color(c_black);
draw_set_alpha(a);
for (i = 0; i < 8; i += 1) draw_text(tx + lengthdir_x(4, i * 45), ty + lengthdir_y(4, i * 45), texto);

// efeito glitch: copia vermelha e azul um pouco deslocadas
d = 3 + 2 * sin(current_time / 300);
draw_set_alpha(0.8 * a);
draw_set_color(c_red);
draw_text(tx - d, ty, texto);
draw_set_color(c_aqua);
draw_text(tx + d, ty, texto);

// texto principal
draw_set_alpha(a);
draw_set_color(c_white);
draw_text(tx, ty, texto);

// linha decorativa embaixo
lw = string_width(texto) / 2;
lh = string_height(texto) / 2;
draw_set_color(cor);
draw_rectangle(tx - lw, ty + lh + 4, tx + lw, ty + lh + 7, false);

draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
