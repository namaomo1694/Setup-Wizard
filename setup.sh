#!/usr/bin/bash
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
extension=$(zenity --list --title "インストールしたいOfficeスイートを選択してください" --text="officeの選択" --column "Officeスイート" Libreoffice WPSOffice インストールしない)
case $extension in
Libreoffice)sudo snap install libreoffice
;;
WPSOffice)cd && wget -O wps-office.deb http://kdl1.cache.wps.com/ksodl/download/linux/a21//wps-office_10.1.0.5707~a21_AMD64.deb
Sudo dpkg -i wps-office.deb
Sudo apt-get -f install && rm wps-office.deb
wget -O web-office-fonts.deb http://kdl.cc.ksosoft.com/wps-community/download/fonts/wps-office-fonts_1.0_all.deb
Sudo dpkg -i web-office-fonts.deb
;;
インストールしない)
;;
esac
zenity --question --text "VLCメディアプレイヤーをインストールしますか？" 
case $? in
0)sudo snap install vlc
;;
1)
;;
*) zenity --error
;;
esac
zenity --question --text "Gimpをインストールしますか？" 
case $? in
0)sudo add-apt-repository ppa:otto-kesselgulasch/gimp
sudo apt update
sudo apt install gimp
;;
1)
;;
*) zenity --error
;;
esac
zenity --question --text "Discordをインストールしますか？" 
case $? in
0)sudo snap install discord
;;
1)
;;
*) zenity --error
;;
esac
zenity --question --text "VSCode をインストールしますか？" 
case $? in
0)curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code
;;
1)
;;
*)zenity --error
;;
esac



zenity --info --title "成功" --text "セットアップが正常に完了しました。"



