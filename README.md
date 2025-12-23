## Dr TUI for Macos

Dr TUI is here to make your command-line life a lot easier. The command line isn’t actually that hard—but there are too many choices, and the defaults are pretty terrible. They’re fine if you want to live in a black-and-white world.

Dr TUI adds color, icons, and menus so your terminal finally makes visual sense. Instead of staring at a dull grey prompt full of strange letters and numbers, you get a clean, color-coded view and interactive menus that guide you. With Dr TUI, you can go from command-line novice to confident power user much faster—and actually enjoy the process.

Dr Tui will make your prompt colorful, and the files and folders will also be colorful.

When a file becomes $$\color{green}{Executable}$$ it will be green. so if you do a "chmod +x file", now you know visully which files are executables.

########################################
# How to Install                       
########################################


git clone https://github.com/dnim0ecaep/drtui_macos.git
cd drtui_linux

chmod +x *.zsh

./drtui-install.sh

After you install. Exit out of Terminal and close the application.  Then open it up, go to settings, under profiles, change the font to "FiraCode Nerd Font Reg 12".


## Dr Tui Commands: Summary of Commands

  menumaker   -> Menu System to keep your Tui Apps easily accessable
  
  copy        -> Copy files with interactive prompt and verbose output.
  
  move        -> Move/rename files with interactive prompt and verbose output.
  
  del         -> Delete files with interactive prompt and verbose output.
  
  cls         -> Clears the terminal screen.
  
  type        -> Displays file contents using 'bat' with syntax highlighting.
  
  edit        -> Launches Midnight Commander, a terminal file manager.
  
  find        -> A user-friendly alternative to 'find' for locating files.
  
  help        -> Simplified and community-driven man pages.
  
  attrib      -> Lists file attributes on a Linux file system.
  
  mem         -> Shows memory usage in human-readable format.
  
  chkdsk      -> Shows disk space usage in human-readable format.
  
  tasklist    -> Lists all running processes.
  
  taskkill    -> Sends a signal (default: TERM) to a process.
  
  dir         -> Displays a detailed directory listing with color and sorting. (ls)
  
  ddir        -> Same as 'dir', but adds grid layout for compact display. (lls)

Files Kept in the \bin folder when you run menumaker, those files in there will be auto added to the menu if hit hit control-b

########################################
# LS_COLORS for file-type categories   #
########################################

 Scripting        (Bright Yellow) 11
 
 Config files     (Dull Yellow)   3
 
 Text files       (Dull Yellow)   3
 
 Compressed       (Brown)         94
 
 Executables      (Green)         46
 
 Install files    (Dark Green)    64
 
 Images           (Teal)          45
 
 Office Docs      (Orange)        208
 
 Video            (Blue)          33
 
 Audio            (Blue)          33
 
 Hidden files     (Grey)          240
 
 Directories      (Light Blue RGB) di=38;2;67;163;255


