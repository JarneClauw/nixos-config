# dotfiles
In this repo i will store configs, scripts ... to store my workflow

## How to add configs
```
mv <config01> <config02> <config03> ~/.dotfiles/<application_name>/
cd ~/.dotfiles/
stow (-t ~/.config/<application>/ , if configs weren't from home) <application_name>
```

## How to restore configs
```
git clone git@github.com:JarneClauw/dotfiles.git ~/.dotfiles/
cd ~/.dotfiles/
./<program_name>/restore.sh
```

## Checklist before wiping a drive
1. New programs/images/scripts i want to add?
2. Make sure the added programs are up to date
3. Push to the remote!
