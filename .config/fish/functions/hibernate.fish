function hibernate --wraps='systemctl hibernate' --description 'alias hibernate=systemctl hibernate'
  systemctl hibernate $argv
end
