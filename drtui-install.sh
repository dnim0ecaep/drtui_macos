#!/bin/bash
# install help
#Requires "eza"
cat << 'EOF' >> ~/.bashrc
alias ls='eza -l --grid --icons --time-style=long-iso --group-directories-first'
PS1='\[\e[1;32m\]\u@\h:\[\e[1;34m\]\w \[\e[0m\]\$ '
EOF




sudo cp drdos-help.sh /usr/local/bin/drdos-help
sudo chmod +x /usr/local/bin/drdos-help

sudo cp menu-maker /usr/local/bin/
sudo chmod +x /usr/local/bin/menumaker


sudo apt install fd-find eza bat micro mc ncdu btop tealdeer


tldr --update




# Define the aliases
ALIASES=$(cat <<'EOF'
# Custom Aliases
alias copy='cp -iv'
alias move='mv -iv'
alias del='rm -iv'
alias cls='clear'
alias type='bat --paging=never'
alias edit='mc'
alias find='fd'
alias help='tldr'
alias attrib='lsattr'
alias mem='free -h'
alias chkdsk='df -h'
alias tasklist='ps aux'
alias taskkill='kill'
EOF
)

########################################
# eza / exa colors (screenshot style)  #
########################################
# - uu / gu  -> username & group (gold/yellow)
# - da       -> date/time column (blue-grey)
# - sn       -> symlink target (green)

if ! grep -q "EZA_COLORS=" ~/.bashrc 2>/dev/null; then
cat <<'EOF' >> ~/.bashrc

# Custom eza colors (matches screenshot)
export EZA_COLORS="\
uu=38;5;221:\
gu=38;5;221:\
da=38;5;110:\
sn=38;5;46"

# Backwards compatibility for tools still reading EXA_COLORS
export EXA_COLORS="$EZA_COLORS"
EOF
  echo "EZA_COLORS added to ~/.bashrc"
fi

########################################
# LS_COLORS for file-type categories   #
########################################
# Scripting        (Bright Yellow) 11
# Config files     (Dull Yellow)   3
# Text files       (Dull Yellow)   3
# Compressed       (Brown)         94
# Executables      (Green)         46
# Install files    (Dark Green)    64
# Images           (Teal)          45
# Office Docs      (Orange)        208
# Video            (Blue)          33
# Audio            (Blue)          33
# Hidden files     (Grey)          240
# Directories      (Light Blue RGB) di=38;2;67;163;255

if ! grep -q "# Custom file colors" ~/.bashrc 2>/dev/null; then
cat <<'EOF' >> ~/.bashrc

# Custom file colors (used by eza & coreutils)
export LS_COLORS="\
di=38;2;67;163;255:\
*.html=38;5;11:*.css=38;5;11:*.js=38;5;11:*.ts=38;5;11:*.py=38;5;11:*.c=38;5;11:*.sh=38;5;11:*.zsh=38;5;11:\
*.json=38;5;3:*.yaml=38;5;3:*.yml=38;5;3:*.toml=38;5;3:*.conf=38;5;3:*.env=38;5;3:\
*.txt=38;5;3:*.md=38;5;3:\
*.zip=38;5;94:*.7z=38;5;94:*.rar=38;5;94:*.tar=38;5;94:*.gz=38;5;94:*.bz2=38;5;94:\
*.xz=38;5;94:*.lz=38;5;94:*.lzma=38;5;94:*.zst=38;5;94:*.tgz=38;5;94:*.tar.gz=38;5;94:\
*.tar.bz2=38;5;94:*.tar.xz=38;5;94:*.tar.zst=38;5;94:*.jar=38;5;94:\
*.exe=38;5;46:*.com=38;5;46:*.bin=38;5;46:\
*.deb=38;5;64:*.rpm=38;5;64:*.apk=38;5;64:*.pkg=38;5;64:*.msi=38;5;64:*.dmg=38;5;64:*.appimage=38;5;64:\
*.jpg=38;5;45:*.jpeg=38;5;45:*.png=38;5;45:*.svg=38;5;45:*.webp=38;5;45:*.ico=38;5;45:\
*.ppt=38;5;208:*.odp=38;5;208:*.pptx=38;5;208:*.csv=38;5;208:*.xls=38;5;208:*.ods=38;5;208:*.xlsx=38;5;208:*.pdf=38;5;208:*.docx=38;5;208:*.odt=38;5;208:*.doc=38;5;208:\
*.mp4=38;5;33:*.mkv=38;5;33:*.mov=38;5;33:*.webm=38;5;33:\
*.mp3=38;5;33:*.wav=38;5;33:*.flac=38;5;33:*.ogg=38;5;33:\
.*=38;5;240:"
EOF
  echo "LS_COLORS added to ~/.bashrc"
fi



# Append to bash.bashrc
if ! grep -q "# Custom Aliases" /etc/bash.bashrc; then
  echo "$ALIASES" | sudo tee -a /etc/bash.bashrc > /dev/null
fi

# Append to zshrc
#ZSHRC="/etc/zsh/zshrc"
#if ! grep -q "# Custom Aliases" "$ZSHRC"; then
#  echo "$ALIASES" | sudo tee -a "$ZSHRC" > /dev/null
#fi

echo "Aliases added to /etc/bash.bashrc and /etc/zsh/zshrc."

sudo mkdir -p /usr/local/share/fonts/nerd
cd /usr/local/share/fonts/nerd
sudo wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip
sudo unzip JetBrainsMono.zip
sudo fc-cache -fv
cd ~

