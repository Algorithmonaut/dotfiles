function c --wraps='clear' --description "Custom terminal clear"
  # clear 
  # Clear does not clear the scrollback buffer in kitty
  printf '\033[2J\033[3J\033[1;1H'

  set date_part (date +"%A, %B %d")
  set time_part (date +"%H:%M")

  set bold "\033[1m"
  set normal "\033[0m"
  set inverted "\033[7m"

  echo -e "$bold $date_part $inverted $time_part $normal"
end
