# ==============================================================================
# LDA — Logical Docker Aliases
# https://github.com/rockberpro/docker-lda
#
# Install:
#   iwr -useb https://raw.githubusercontent.com/rockberpro/docker-lda/main/setup.ps1 | iex
#
# Manual install:
#   Add `. "$HOME\.docker-lda.ps1"` to your $PROFILE
# ==============================================================================

# --- PULL / RUN ---
function dpl  { docker pull @args }
function drn  { docker run @args }
function drni { docker run -it @args }

# --- CONTAINER ---
function dps  { docker ps @args }
function dpsa { docker ps -a @args }
function drc  { docker rm @args }
function dex  { docker exec @args }
function dexi { docker exec -it @args }

# --- LOGS ---
function dlg  { docker logs @args }
function dlgf { docker logs -f @args }

# --- IMAGE ---
function dim  { docker image @args }
function dils { docker image ls @args }
function dirm { docker image rm @args }
function dipr { docker image prune @args }

# --- VOLUME ---
function dv   { docker volume @args }
function dvls { docker volume ls @args }
function dvrm { docker volume rm @args }

# --- COMPOSE ---
function dcp   { docker compose @args }
function dcpu  { docker compose up @args }
function dcpud { docker compose up -d @args }
function dcpd  { docker compose down @args }
function dcpb  { docker compose build @args }
function dcpl  { docker compose logs @args }
function dcplf { docker compose logs -f @args }
function dcpr  { docker compose restart @args }
function dcps  { docker compose stop @args }

# --- MANAGEMENT ---
function dst { docker start @args }
function dsp { docker stop @args }
function drs { docker restart @args }
function dip { docker inspect @args }

# --- SYSTEM ---
function dsy   { docker system @args }
function dsypr { docker system prune @args }

# --- HELP ---
function lda { & "$HOME\.docker-lda-help.ps1" }
