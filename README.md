# CHRONO BREAK

Top-down shooter 2D feito no **GameMaker HTML5** (o mesmo instalado em `~/.wine-gamemaker`).

Para abrir: no GameMaker, *Open* → `ChronoBreak.gmx/ChronoBreak.project.gmx`.

## Controles

| Tecla | Ação |
|---|---|
| W A S D | mover |
| Mouse | mirar; botão esquerdo atira |
| E | ler terminal (registros da história) |
| ESPAÇO | escudo (liberado na fase 3) |
| ENTER | avançar diálogo |
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
- **Inimigos:** todos são filhos de `obj_inimigo_pai` (vida, piscar, morte, distância até o jogador).
  - `obj_guarda`: máquina de estados `parado → atacando`; anda até ~200px e atira se não tiver parede no meio.
  - `obj_drone`: voa em círculo em volta do jogador (ignora paredes) e atira.
  - `obj_robo`: lento, muita vida, golpe físico que atravessa o escudo. `obj_robo_guardiao` é o da saída da fase 3.
  - `obj_chefe`: ataques em ciclo e as zonas de impacto (`obj_zona_impacto`).
- **Paredes:** `obj_parede` (esticada na room e desenhada em tiles). Contêineres, casas, fonte e terminal são filhos de `obj_obstaculo`, que é filho de `obj_parede`. Por isso tudo bloqueia o movimento e os tiros.
- **Scripts auxiliares:** `scr_mover` (andar sem atravessar parede), `scr_tiro_inimigo`, `scr_dano_jogador`, `scr_fala`, `scr_dialogo_comecar`.

`global.pausado` congela o jogo durante diálogos, pausa e game over: todo objeto que se mexe checa essa variável no começo do *Step*.

## Ajustes rápidos (balanceamento)

- Vida/velocidade de cada inimigo: no *Create* de cada um.
- Quantidade da horda da fase 4: `total` no *Create* do `obj_spawner`.
- Calor da arma: `calor += 9` e `calor - 0.5` no *Step* do `obj_player`.
- Vida do chefe: `vida_max` no *Create* do `obj_chefe`.

## Sprites

Tudo saiu do pacote de sprites do grupo (personagem, Cyborg_Big, Drone, contêineres, tiles e UI). Os PNGs já foram ampliados em 2x, 3x ou 4x (pixel art sem borrar):
- guardas = Cyborg_Big com tom avermelhado;
- robôs = Cyborg_Big maior e azulado;
- chefe = Drone grande e vermelho.

Gerados no código, por não terem equivalente no pacote: tiro inimigo, fonte da praça, retângulo da saída e as máscaras de colisão (`spr_mascara_p`/`spr_mascara_g`).

## Sons

- **Efeitos** (`snd_*`): vêm da biblioteca de sons que acompanha o GameMaker (pasta `Sounds` da instalação).
- **Músicas** (`mus_fase`, `mus_chefe`, `mus_final`): chiptunes simples gerados para o jogo.
- A troca de música é feita pelo script `scr_musica` (chamado no *Create* do `obj_menu`, do `obj_controle` e do `obj_final`).
- Para usar outra música (ex.: "Hunting for Your Dream" no final), basta trocar o arquivo do som `mus_final` na IDE.
