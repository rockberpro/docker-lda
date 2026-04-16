# ==============================================================================
# LDA — Logical Docker Aliases
# https://github.com/rockberpro/docker-lda
#
# Install:
#   curl -sL https://raw.githubusercontent.com/rockberpro/docker-lda/main/setup.sh | bash
#
# Manual install:
#   echo 'source ~/.docker-lda.sh' >> ~/.bashrc && source ~/.bashrc
# ==============================================================================

# --- PULL / RUN ---
alias dpl='docker pull'
alias drn='docker run'
alias drni='docker run -it'

# --- CONTAINER ---
alias dps='docker ps'
alias dpsa='docker ps -a'
alias drc='docker rm'
alias dex='docker exec'
alias dexi='docker exec -it'

# --- LOGS ---
alias dlg='docker logs'
alias dlgf='docker logs -f'

# --- IMAGE ---
alias dim='docker image'
alias dils='docker image ls'
alias dirm='docker image rm'
alias dipr='docker image prune'

# --- VOLUME ---
alias dv='docker volume'
alias dvls='docker volume ls'
alias dvrm='docker volume rm'

# --- COMPOSE ---
alias dcp='docker compose'
alias dcpu='docker compose up'
alias dcpud='docker compose up -d'
alias dcpd='docker compose down'
alias dcpb='docker compose build'
alias dcpl='docker compose logs'
alias dcplf='docker compose logs -f'
alias dcpr='docker compose restart'

# --- MANAGEMENT ---
alias dst='docker start'
alias dsp='docker stop'
alias drs='docker restart'
alias dip='docker inspect'

# --- SYSTEM ---
alias dsy='docker system'
alias dsypr='docker system prune'

# --- HELP ---
alias lda='~/.docker-lda-help.sh'
