rm -r ../.config/fish
mkdir ../.config/fish

cp ~/.config/fish/*.fish ../.config/fish/

mkdir ../.config/fish/conf.d
cp ~/.config/fish/conf.d/* ../.config/fish/conf.d/
rm -r ../.config/fish/conf.d/_*
rm ../.config/fish/conf.d/nvm.fish

mkdir ../.config/fish/functions
cp ~/.config/fish/functions/peco*.fish ../.config/fish/functions/
cp ~/.config/fish/functions/*key_bind*.fish ../.config/fish/functions/

