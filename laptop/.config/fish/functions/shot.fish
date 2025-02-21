function shot --wraps='maim -s | xclip -selection clipboard -t image/png' --description 'alias shot=maim -s | xclip -selection clipboard -t image/png'
  maim -s | xclip -selection clipboard -t image/png $argv
        
end
