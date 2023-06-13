---
title: 套件管理
nav_order: 1010
has_children: false
parent: 入門
---


# 套件管理


## 入門閱讀

* [Pacman Overview](https://wiki.manjaro.org/index.php/Pacman_Overview)





## Wiki

* Arch Wiki / [List of applications](https://wiki.archlinux.org/index.php/List_of_applications)
* Manjaro Wiki / [List of Qt Applications](https://wiki.manjaro.org/index.php/List_of_Qt_Applications)


## 使用情境範例

* [查詢檔案屬於那個套件](#查詢檔案屬於那個套件)
* [查詢套件安裝那些檔案](#查詢套件安裝那些檔案)


## 查詢檔案屬於那個套件

執行下面指令，查詢「/usr/share/icons/Papirus」這個檔案，是屬於那個套件。

``` sh
pacman -Qo /usr/share/icons/Papirus
```

顯示

```
/usr/share/icons/Papirus/ is owned by papirus-icon-theme 20210901-1
```

也可以加上「-q」，也就是執行下面指令

``` sh
pacman -Qo /usr/share/icons/Papirus -q
```

顯示

```
papirus-icon-theme
```


## 查詢套件安裝那些檔案

執行下面指令，查詢「papirus-icon-theme」這個套件，安裝那些檔案在系統上。

``` sh
pacman -Ql papirus-icon-theme
```

顯示

```
papirus-icon-theme /usr/
papirus-icon-theme /usr/share/
papirus-icon-theme /usr/share/icons/
papirus-icon-theme /usr/share/icons/Papirus-Dark/
papirus-icon-theme /usr/share/icons/Papirus-Dark/128x128
papirus-icon-theme /usr/share/icons/Papirus-Dark/16x16/
papirus-icon-theme /usr/share/icons/Papirus-Dark/16x16/actions/
papirus-icon-theme /usr/share/icons/Papirus-Dark/16x16/actions/Finished.svg
papirus-icon-theme /usr/share/icons/Papirus-Dark/16x16/actions/Info-amarok.svg
papirus-icon-theme /usr/share/icons/Papirus-Dark/16x16/actions/SuggestionError.svg
...
```

顯示的格式是「套件名稱 檔案路徑」，

若不要顯示「套件名稱」，則是執行下面指令，後面多加一個「-q」

``` sh
pacman -Ql papirus-icon-theme -q
```

顯示

```
/usr/
/usr/share/
/usr/share/icons/
/usr/share/icons/Papirus-Dark/
/usr/share/icons/Papirus-Dark/128x128
/usr/share/icons/Papirus-Dark/16x16/
/usr/share/icons/Papirus-Dark/16x16/actions/
/usr/share/icons/Papirus-Dark/16x16/actions/Finished.svg
/usr/share/icons/Papirus-Dark/16x16/actions/Info-amarok.svg
/usr/share/icons/Papirus-Dark/16x16/actions/SuggestionError.svg
...
```

另外查詢的時候，也可以不加上「套件」，就會列出系統所有安裝的檔案

```
pacman -Ql
```

一樣可以加上「-q」

```
pacman -Ql -q
```

也可以搭配「分頁程式」

``` sh
pacman -Ql | less
```

``` sh
pacman -Ql -q | less
```

``` sh
pacman -Ql | bat
```

``` sh
pacman -Ql -q | bat
```

## 利用關鍵字查詢套件

執行

``` sh
pacman -Sl
```

會顯示很長的列表，所以就不列了


使用關鍵字「xfce」來過濾，執行下面指令

``` sh
pacman -Sl | grep xfce
```

顯示

```
extra libxfce4ui 4.16.1-1 [installed]
extra libxfce4util 4.16.0-1 [installed]
extra xfce4-appfinder 4.16.1-2 [installed]
extra xfce4-artwork 0.1.1a_git20110420-6 [installed]
extra xfce4-battery-plugin 1.1.4-1 [installed]
extra xfce4-clipman-plugin 1.6.2-1 [installed]
extra xfce4-cpufreq-plugin 1.2.7-1 [installed]
extra xfce4-cpugraph-plugin 1.2.6-1 [installed]
extra xfce4-datetime-plugin 0.8.1-1 [installed]
extra xfce4-dev-tools 4.16.0-1
extra xfce4-dict 0.8.4-1 [installed]
extra xfce4-diskperf-plugin 2.7.0-1 [installed]
extra xfce4-eyes-plugin 4.6.0-1 [installed]
extra xfce4-fsguard-plugin 1.1.2-1 [installed]
extra xfce4-genmon-plugin 4.1.1-1 [installed]
extra xfce4-mailwatch-plugin 1.3.0-1 [installed]
extra xfce4-mount-plugin 1.1.5-1 [installed]
extra xfce4-mpc-plugin 0.5.2-2 [installed]
extra xfce4-netload-plugin 1.4.0-1 [installed]
extra xfce4-notes-plugin 1.9.0-1 [installed]
extra xfce4-notifyd 0.6.3-1 [installed]
extra xfce4-panel 4.16.4-1 [installed]
extra xfce4-power-manager 4.16.0-3 [installed]
extra xfce4-pulseaudio-plugin 0.4.3-2 [installed]
extra xfce4-screensaver 4.16.0-1 [installed]
extra xfce4-screenshooter 1.9.10-2 [installed]
extra xfce4-sensors-plugin 1.4.3-1 [installed]
extra xfce4-session 4.16.0-2 [installed]
extra xfce4-settings 4.16.2-2 [installed]
extra xfce4-smartbookmark-plugin 0.5.2-1 [installed]
extra xfce4-systemload-plugin 1.3.1-1 [installed]
extra xfce4-taskmanager 1.5.4-1 [installed]
extra xfce4-terminal 1.0.4-1 [installed]
extra xfce4-time-out-plugin 1.1.2-1 [installed]
extra xfce4-timer-plugin 1.7.1-1 [installed]
extra xfce4-verve-plugin 2.0.1-1 [installed]
extra xfce4-wavelan-plugin 0.6.3-1 [installed]
extra xfce4-weather-plugin 0.11.0-1 [installed]
extra xfce4-xkb-plugin 0.8.2-1 [installed]
community xfce4-whiskermenu-plugin 2.7.1-1 [installed]
```

加上「-q」，執行下面指令

``` sh
pacman -Sl -q | grep xfce
```

顯示

```
libxfce4ui
libxfce4util
xfce4-appfinder
xfce4-artwork
xfce4-battery-plugin
xfce4-clipman-plugin
xfce4-cpufreq-plugin
xfce4-cpugraph-plugin
xfce4-datetime-plugin
xfce4-dev-tools
xfce4-dict
xfce4-diskperf-plugin
xfce4-eyes-plugin
xfce4-fsguard-plugin
xfce4-genmon-plugin
xfce4-mailwatch-plugin
xfce4-mount-plugin
xfce4-mpc-plugin
xfce4-netload-plugin
xfce4-notes-plugin
xfce4-notifyd
xfce4-panel
xfce4-power-manager
xfce4-pulseaudio-plugin
xfce4-screensaver
xfce4-screenshooter
xfce4-sensors-plugin
xfce4-session
xfce4-settings
xfce4-smartbookmark-plugin
xfce4-systemload-plugin
xfce4-taskmanager
xfce4-terminal
xfce4-time-out-plugin
xfce4-timer-plugin
xfce4-verve-plugin
xfce4-wavelan-plugin
xfce4-weather-plugin
xfce4-xkb-plugin
xfce4-whiskermenu-plugin
```
