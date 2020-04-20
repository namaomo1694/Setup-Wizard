#!/bin/bash
y=1
while [[ $y = 1 ]]; do
password=$(zenity --entry --text "ユーザーのパスワードを入力してください。")

y=$(zenity --question --width="250" --text "パスワードは「$password」ですか？")
if [[ $? = 1 ]]; then
  y=1
else
  y=0
fi
done
echo $password | sudo -S apt update

zenity --question --text "セットアップを開始しますか？" 
case $? in
0)
;;
1)exit
;;
*) zenity --error
;;
esac

zenity --question --text "Chromiumをインストールしますか？" 
case $? in
0) 
sudo snap install chromium
;;
1) 
;;
*) zenity --error
;;
esac
zenity --question --text "Firefoxをインストールしますか？" 
case $? in
0) 
sudo apt install firefox
;;
1) 
;;
*) zenity --error
;;
esac
zenity --question --text "Chromeをインストールしますか？" 
case $? in
0) 
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable
;;
1) 
;;
*) zenity --error
;;
esac
