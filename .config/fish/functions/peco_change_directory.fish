function _peco_change_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv " | perl -pe 's/([ ()])/\\\\$1/g' | sed "s/[\]//g" | read tmp
  else 
    peco --layout=bottom-up | perl -pe 's/([ ()])/\\\\$1/g'| sed "s/[\]//g" |read tmp
  end

  if [ $tmp ]
    builtin cd $tmp
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function peco_change_directory
  # set all the directories to be included in the search here
  set currents */

  begin
    echo $HOME/.config
    if count $currents >/dev/null
        ls -ad */ | perl -pe "s#^#$PWD/#" | grep -v \.git
    end
    ls -ad $HOME/HeinischCloud/Projects/*/ | grep -v \.git
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
