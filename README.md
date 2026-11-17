# CHRONO BREAK

Top-down shooter 2D feito no **GameMaker HTML5** (o mesmo instalado em `~/.wine-gamemaker`).

Para abrir: no GameMaker, *Open* → `ChronoBreak.gmx/ChronoBreak.project.gmx`.

## Controles

| Tecla | Ação |
|---|---|
| W A S D ou setas | mover |
| Mouse | mirar; botão esquerdo atira |
| E | ler terminal (registros da história) |
| ESPAÇO | escudo (liberado na fase 3) |
| ENTER ou clique | avançar diálogo |
| TAB (ou botão PULAR) | pular o diálogo inteiro |
| P | pausa (M volta ao menu) |
| R | tentar de novo depois de morrer |
| 1 a 6 (no menu) | ir direto para uma fase (bom para testar e apresentar) |

## Fases (seguindo o PDF "História e Esboço das Fases")

| Room | Fase | O que tem |
|---|---|---|
| `rm_fase1` | Instalação de Energia | tutorial da IA, arma superaquece, 7 guardas |
| `rm_fase2` | Ruas do Distrito 12 | guardas + drones, relatório 2053-2056 no final |
| `rm_fase3` | Setor Industrial | robôs (dano físico), 2 guardiões na saída, item do escudo |
| `rm_fase4` | Centro da Cidade | diálogo com Onnerb, arma melhorada, horda de 41 inimigos (11 iniciais + 30 que vão surgindo) |
| `rm_fase5` | Dentro do Prédio | poucos inimigos até o elevador |
| `rm_boss` | Chrono Gate | chefe: círculo / espiral / leque; em 50% entram as zonas vermelhas |
| `rm_final` | — | "2053. O mundo ainda não sabe o que está por vir." |

## Onde está cada coisa

- **Todas as falas da história:** script `scr_textos_fase` (separado por fase e por momento).
- **Textos dos terminais:** evento *Create* do `obj_terminal`.
- **`obj_controle`** (um por fase): diálogo, estado da fase (`inicio → jogando → saida_aberta → saindo`), HUD, pausa, game over e o final.
- **`obj_player`:** movimento, mira, tiro, calor da arma e escudo.
- **`obj_onnerb_cena`** (fase 4): Onnerb sai da porta da NEXUS, conversa com o John e volta para dentro; só depois a horda começa. `obj_onnerb`: Onnerb derrotado no final. Sprites de `andando_baixo.gif`, `andando_cima.gif`, `parado_falando` e `morto.png` (`spr_onnerb_frente`, `spr_onnerb_costas`, `spr_onnerb_parado`, `spr_onnerb`).
- **Inimigos:** todos são filhos de `obj_inimigo_pai` (vida, piscar, morte, distância até o jogador).
  - `obj_guarda`: máquina de estados `parado → atacando`; anda até ~200px e atira se não tiver parede no meio.
  - `obj_drone`: voa em círculo em volta do jogador (ignora paredes) e atira.
  - `obj_robo`: lento, muita vida, golpe físico que atravessa o escudo. `obj_robo_guardiao` é o da saída da fase 3.
  - `obj_chefe`: ataques em ciclo e as zonas de impacto (`obj_zona_impacto`). Visual do pacote *boss robo 8 bit*: azul na fase 1, vermelho na fase 2 (sprites `spr_chefe_parado/atira/carrega 1 e 2`, `spr_chefe_dano`), balas `spr_orb_ciano`/`spr_orb_brasa` (script `scr_tiro_chefe`) e explosão final `obj_chefe_morte`.
- **Mapas e paredes:** cada fase usa um fundo desenhado (`bg_fase1` … `bg_fase5`, `bg_boss`). As colisões são retângulos invisíveis de `obj_parede` (esticados com scaleX/scaleY) colocados em cima das paredes, máquinas, prédios, carros etc. do desenho. O `obj_terminal` é filho de `obj_parede` e também é invisível: só mostra um "!" piscando e "[E] Ler".
- **Scripts auxiliares:** `scr_mover` (andar sem atravessar parede), `scr_tiro_inimigo`, `scr_dano_jogador`, `scr_fala`, `scr_dialogo_comecar`, `scr_titulo` (título grande estilizado do menu e do game over, fonte `fnt_logo`).

`global.pausado` congela o jogo durante diálogos, pausa e game over: todo objeto que se mexe checa essa variável no começo do *Step*.

## Ajustes rápidos (balanceamento)

- Vida/velocidade de cada inimigo: no *Create* de cada um.
- Quantidade da horda da fase 4: `total` no *Create* do `obj_spawner`.
- Calor da arma: `calor += 9` (arma normal), `calor += 4` (arma melhorada, fase 4 em diante) e `calor - 0.5` no *Step* do `obj_player`.
- Vida do chefe: `vida_max` no *Create* do `obj_chefe`.

## Arte

- **Personagens e inimigos:** pacote de sprites do grupo (Character/Main, Cyborg_Big, Drone), ampliados em 2x a 4x. Guardas = Cyborg_Big avermelhado; robôs = Cyborg_Big maior e azulado; chefe = robô do pacote *boss robo 8 bit* (ampliado 4x).
- **Mapas das fases, menu, game over e botões START/SAIR:** pasta `Fases` do pacote *assets chrono gate*. Menu (`spr_menu`, 60 quadros) e game over (`spr_game_over`, 36 quadros) são os GIFs animados, convertidos em sprites. Os mapas (432x224) foram ampliados 3x sem borrar e encaixados na tela de 1280x720 (faixa preta em cima e embaixo).
- Gerados no código: tiro inimigo, retângulo verde da saída e as máscaras de colisão (`spr_mascara_p`/`spr_mascara_g`).

## Sons

- **Do pacote *assets chrono gate*:** `mus_fase` (Musica_Ambiente, menu e fases 1-5), `mus_chefe` (Musica_Boss), `mus_game_over` (Audio_Game_Over, toca quando o John morre), `mus_final` (ending), `snd_explosao` (boom), `snd_escudo` (Ganhou Escudo), `snd_escudo_fim` (Perdeu Escudo), `snd_superaquecida` (tiro falhando), `snd_tiro_inimigo` e os passos (`snd_passo_metal1-3` nas fases internas, `snd_passo_concreto1-3` nas fases 2 e 4).
- **Da biblioteca do GameMaker:** tiro do jogador, acerto, dano, diálogo, alerta, terminal, saída, portal e item.
- `mus_final` começa quando a tela treme no final (depois do último diálogo com o chefe) e para ao voltar da tela final para o menu.
- A troca de música é feita pelo script `scr_musica` (chamado no *Create* do `obj_menu`, do `obj_controle` e do `obj_final`).
- `scr_voltar_menu` volta ao menu com `game_restart()` (tela final e tecla M), para não sobrar nada da partida anterior.
- `scr_musica_parar` para todas as músicas (stop + volume 0, porque às vezes o stop sozinho não bastava).
- Não use `sound_isplaying` para música: nesta versão (rodando no Wine) ela sempre devolve 0, e religar a música por causa disso criava cópias tocando ao mesmo tempo.
