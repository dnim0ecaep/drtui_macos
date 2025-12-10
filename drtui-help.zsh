#!/bin/zsh

# ================================
#        Dr Tui Commands Manual
# ================================

# Centered Title
TITLE="Dr Tui Commands Manual"
TERM_WIDTH=$(tput cols)
PADDING=$(( (TERM_WIDTH - ${#TITLE}) / 2 ))
printf "%${PADDING}s%s\n\n" "" "$TITLE"

# Define ANSI color codes
BLUE='\033[0;34m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color (reset)

clear

echo -e "Dr Tui help: Summary of Custom Commands\n"

echo -e " ${BLUE}menu-maker${NC}   -> ${GREEN}Menu for these commands and more${NC}"
echo -e " ${BLUE}copy${NC}         -> ${GREEN}Copy files with interactive prompt and verbose output.${NC}"
echo -e " ${BLUE}move${NC}         -> ${GREEN}Move/rename files with interactive prompt and verbose output.${NC}"
echo -e " ${BLUE}del${NC}          -> ${GREEN}Delete files with interactive prompt and verbose output.${NC}"
echo -e " ${BLUE}cls${NC}          -> ${GREEN}Clears the terminal screen.${NC}"
echo -e " ${BLUE}type${NC}         -> ${GREEN}Displays file contents using 'bat' with syntax highlighting.${NC}"
echo -e " ${BLUE}edit${NC}         -> ${GREEN}Launches Midnight Commander, a terminal file manager.${NC}"
echo -e " ${BLUE}find${NC}         -> ${GREEN}A user-friendly alternative to 'find' for locating files.${NC}"
echo -e " ${BLUE}help${NC}         -> ${GREEN}Simplified and community-driven man pages.${NC}"
echo -e " ${BLUE}py-env${NC}       -> ${GREEN}Sets up the python environment${NC}"
echo -e " ${BLUE}attrib${NC}       -> ${GREEN}Lists file attributes on a Linux file system.${NC}"
echo -e " ${BLUE}mem${NC}          -> ${GREEN}Shows memory usage in human-readable format.${NC}"
echo -e " ${BLUE}chkdsk${NC}       -> ${GREEN}Shows disk space usage in human-readable format.${NC}"
echo -e " ${BLUE}tasklist${NC}     -> ${GREEN}Lists all running processes.${NC}"
echo -e " ${BLUE}taskkill${NC}     -> ${GREEN}Sends a signal (default: TERM) to a process.${NC}"
echo -e " ${BLUE}dir${NC}          -> ${GREEN}Displays a detailed directory listing with color and sorting.${NC}"
echo -e " ${BLUE}ddir${NC}         -> ${GREEN}Same as 'dir', but adds grid layout for compact display.${NC}"
# --- New Commands ---
echo -e " ${BLUE}lazygit${NC}      -> ${GREEN}Launches the interactive, terminal-based Git UI.${NC}"
echo -e " ${BLUE}lazydocker${NC}   -> ${GREEN}Launches the interactive, terminal-based Docker UI.${NC}"
