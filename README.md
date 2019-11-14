# Dotfiles
Bert's [dotfiles](https://dotfiles.github.io/).

They are based on Lars Kappert's [tutorial](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789) and [dotfiles](https://github.com/webpro/dotfiles), as well as the dotfiles of [Ruben Verborgh](https://github.com/RubenVerborgh/dotfiles) and [Mathias Bynens](https://github.com/mathiasbynens/dotfiles).

### Quick install
For a quick install:
```
curl -s https://raw.githubusercontent.com/bertvanpoecke/dotfiles/master/bootstrap | bash
```

### Local settings
When you like to use settings which are local to one workstation, you can optionally add
* a **.local** file in the **system/** folder for Bash shell related settings.
* a **local.fish** file in the **fish/** folder for Fish shell related settings.
Add all your local aliases, functions and variables in these files.
This file will not be pushed to the git repository, because this file is in the .gitignore file.
```
#!/usr/bin/env bash        //Add this line only for Bash

### LOCAL VARIABLES
# Optionally add some variables which you want to keep local to this workingstation.
# ...
### LOCAL ALIASES
# Optionally add some aliases which you want to keep local to this workingstation.
# ...
### LOCAL FUNCTIONS
# Optionally add some functions which you want to keep local to this workingstation.
# ...
```