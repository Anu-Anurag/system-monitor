#!/bin/bash

# System Monitoring Dashboard with dialog

HEIGHT=15
WIDTH=50
CHOICE_HEIGHT=6
TITLE="📊 System Monitor Dashboard"
MENU="Choose a system stat to view:"

OPTIONS=(
  1 "🧠 CPU Usage"
  2 "🧬 Memory Usage"
  3 "💾 Disk Usage"
  4 "🌐 Network Info"
  5 "⏳ Uptime & Load"
  6 "👋 Exit"
)

while true; do
  # Show the interactive menu
  CHOICE=$(dialog --clear \
                  --backtitle "Linux Bash System Monitor" \
                  --title "$TITLE" \
                  --menu "$MENU" \
                  $HEIGHT $WIDTH $CHOICE_HEIGHT \
                  "${OPTIONS[@]}" \
                  2>&1 >/dev/tty)

  clear

  case $CHOICE in
    1)
      echo -e "\n🧠 CPU Usage:\n"
      top -bn1 | grep "Cpu(s)"
      ;;
    2)
      echo -e "\n🧬 Memory Usage:\n"
      free -h
      ;;
    3)
      echo -e "\n💾 Disk Usage:\n"
      df -h | grep "^/dev/"
      ;;
    4)
      echo -e "\n🌐 Network Info:\n"
      ip a | grep inet | grep -v 127.0.0.1
      ;;
    5)
      echo -e "\n⏳ Uptime & Load:\n"
      uptime -p
      uptime | awk -F'load average:' '{ print "Load Average:" $2 }'
      ;;
    6)
      echo -e "\n👋 Exiting System Monitor.\n"
      break
      ;;
    *)
      echo -e "\n❌ Invalid choice. Try again.\n"
      ;;
  esac

  echo -e "\n🔁 Press [Enter] to return to the menu..."
  read
done
