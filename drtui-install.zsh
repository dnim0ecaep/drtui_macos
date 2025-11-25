#!/usr/bin/env zsh

# Ensure ~/.zshrc exists
touch ~/.zshrc

# Ensure Homebrew is installed
if ! command -v brew &>/dev/null; then
  echo "Homebrew not found. Install it from https://brew.sh"
  exit 1
fi

# Install custom scripts
sudo cp menumaker-help.sh /usr/local/bin/menumaker-help
sudo chmod +x /usr/local/bin/menumaker-help

sudo cp menu-maker /usr/local/bin/menumaker
sudo chmod +x /usr/local/bin/menumaker

# Install dependencies
brew update
brew install --cask font-fira-code-nerd-font
brew install \
  python@3.11 \
  fd \
  eza \
  bat \
  micro \
  tldr \
  midnight-commander \
  ncdu \
  btop \
  lazygit \
  jesseduffield/lazydocker/lazydocker

# Add aliases if not already present
if ! grep -q "# Custom Aliases" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc

# Custom Aliases
alias copy='cp -iv'
alias move='mv -iv'
alias del='rm -iv'
alias cls='clear'
alias type='bat --paging=never'
alias edit='mc'
alias find='fd'
alias help='tldr'
alias attrib='ls -lO'
alias mem='vm_stat && top -l 1 | grep PhysMem'
alias chkdsk='df -h'
alias tasklist='ps aux'
alias taskkill='kill'

# eza-based directory listings
alias dir='eza --long --header --group-directories-first --sort=name --color=always --time-style=long-iso'
alias ddir='eza --long --header --group-directories-first --sort=name --color=always --time-style=long-iso --grid'
alias ls='eza --color=always --icons --long --group-directories-first'
EOF
  echo "Aliases added to ~/.zshrc"
else
  echo "Aliases already exist in ~/.zshrc"
fi

# Set prompt with green user@host, blue-ish path, white $
if ! grep -q "PROMPT=" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc
setopt prompt_subst
PROMPT='%F{green}%n@%m%f:%F{81}%~%f %F{white}$%f '
EOF
  echo "Prompt customized in ~/.zshrc"
fi

########################################
# eza / exa colors (screenshot style)  #
########################################
# - uu / gu  -> username & group (gold/yellow)
# - da       -> date/time column (blue-grey)
# - sn       -> symlink target (green)

if ! grep -q "EZA_COLORS=" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc

# Custom eza colors (matches screenshot)
export EZA_COLORS="\
uu=38;5;221:\
gu=38;5;221:\
da=38;5;110:\
sn=38;5;46"

# Backwards compatibility for tools still reading EXA_COLORS
export EXA_COLORS="$EZA_COLORS"
EOF
  echo "EZA_COLORS added to ~/.zshrc"
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

if ! grep -q "# Custom file colors" ~/.zshrc 2>/dev/null; then
cat <<'EOF' >> ~/.zshrc

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
  echo "LS_COLORS added to ~/.zshrc"
fi

# Apply changes
echo "Sourcing ~/.zshrc"
source ~/.zshrc

echo "✅ All done! Terminal is configured."
