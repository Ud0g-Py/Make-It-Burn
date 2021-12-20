#!/usr/bin/env bash

USER="kali" # CAMBIAME POR EL NOMBRE DE TU USUARIO SI ES OTRO DIFERENTE A 'KALI'
BLINK="\033[5m"
RED="31"
GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ITALICRED="\e[3;${RED}m"
ENDCOLOR="\e[0m"
STOPBLINK="\033[0m"

/bin/echo -e
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] UPDATEANDO SYSTEM${STOPBLINK}${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/apt update && /bin/apt upgrade -y
/bin/echo -e

/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] INSTALANDO REPO PACKAGES${STOPBLINK}${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/apt install cupp rlwrap nishang tree gobuster apt-transport-https golang filezilla xclip adb virtualenv gcc-multilib g++-multilib -y
/bin/gem install evil-winrm
/bin/echo -e

/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] CONFIGURANDO KEYBOARD Y LOCALES${STOPBLINK}${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/usr/sbin/dpkg-reconfigure locales
/usr/sbin/dpkg-reconfigure keyboard-configuration
/bin/echo -e

/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] CONFIGURANDO ZSHRC${STOPBLINK}${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/cat <<EOT >> /home/${USER}/.zshrc
#custom alias
alias pbcopy='/bin/xclip -selection clipboard'
alias pbpaste='/bin/xclip -selection clipboard -o'
EOT
/bin/echo -e

/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] CONFIGURANDO VIM${STOPBLINK}${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/cat<<EOT > /home/${USER}/.vimrc
syntax on
set number
set noswapfile
set hlsearch
set ignorecase
set incsearch
set clipboard=unnamedplus
EOT
/bin/echo -e

/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] GENERANDO NUEVAS CLAVES SSH PARA EL SISTEMA${STOPBLINK}${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e
/bin/echo -e "MD5 from older keys:"
/bin/echo -e
/bin/md5sum /etc/ssh/ssh_host_*
/bin/echo -e
/bin/rm /etc/ssh/ssh_host_*
/usr/sbin/dpkg-reconfigure openssh-server
/bin/echo -e
/bin/echo -e "MD5 from NEW keys:"
/bin/echo -e
/bin/md5sum /etc/ssh/ssh_host_*
/bin/echo -e

/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] HACIENDO EL HARDENING${STOPBLINK}${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e
unset HISTFILE; unset SAVEFILE
/bin/rm /home/${USER}/.bash_history
/bin/ln -s /dev/null /home/${USER}/.bash_history
export HISTFILE=/dev/null
export SAVEFILE=/dev/null
/bin/rm /home/${USER}/.zsh_history
/bin/ln -s /dev/null /home/${USER}/.zsh_history
/bin/echo -e

/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e "${BLINK}${BOLDGREEN}[+] TODO READY.${STOPBLINK}${ENDCOLOR}"
/bin/echo -e
/bin/echo -e "📕 Red-Team Gitbook => ${ITALICRED}https://tryharder.jorgetesta.tech${ENDCOLOR}"
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
/bin/echo -e
/bin/echo -e "${BLINK}${BOLDGREEN} ---> REINICIA EL SISTEMA Y RECUERDA CAMBIAR TU CONTRASEÑA <---${STOPBLINK}${ENDCOLOR}"
/bin/echo -e
/bin/echo -e "${BOLDGREEN}#################################################${ENDCOLOR}"
