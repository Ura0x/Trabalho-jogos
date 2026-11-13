/// scr_fala(nome, texto)
// Coloca uma fala na fila do dialogo (o dialogo comeca com scr_dialogo_comecar).
var n, t;
n = argument0;
t = argument1;
with (obj_controle) {
    fala_nome[fala_total] = n;
    fala_texto[fala_total] = t;
    fala_total += 1;
}
