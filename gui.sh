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
extension=$(zenity --list --title "インストールしたいブラウザを選択してください" --text="ブラウザの選択" --column "ブラウザ" Firefox Chromium Chrome Vivaldi インストールしない)
case $extension in
Firefox) 
sudo apt install firefox
;;
Chromium) sudo snap install chromium
;;
Chrome) sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable
;;
Vivaldi)
wget https://downloads.vivaldi.com/stable/vivaldi-stable_2.2.1388.34-1_amd64.deb
sudo dpkg -i vivaldi-stable_*.deb 
;;
インストールしない)
;;
esac
zenity --question --text "複数ブラウザをインストールしますか？" 
case $? in
0) 
extension=$(zenity --list --title "インストールしたいブラウザを選択してください" --text="ブラウザの選択" --column "ブラウザ" Firefox Chromium Chrome Vivaldi インストールしない)
case $extension in
Firefox) 
sudo apt install firefox
;;
Chromium) sudo snap install chromium
;;
Chrome) sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable
;;
Vivaldi)
wget https://downloads.vivaldi.com/stable/vivaldi-stable_2.2.1388.34-1_amd64.deb
sudo dpkg -i vivaldi-stable_*.deb 
;;
esac
;;
1) 
;;
*) zenity --error
;;
esac
zenity --info --title "成功" --text "セットアップが正常に完了しました。"


