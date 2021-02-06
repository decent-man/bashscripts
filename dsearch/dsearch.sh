#! /bin/bash
#    .____________                           .__     
#  __| _/   _____/ ____ _____ _______   ____ |  |__  
# / __ |\_____  \_/ __ \\__  \\_  __ \_/ ___\|  |  \ 
#/ /_/ |/        \  ___/ / __ \|  | \/\  \___|   Y  \
#\____ /_______  /\___  >____  /__|    \___  >___|  /
#     \/       \/     \/     \/            \/     \/ 
#                       ~/.bshScr/dsearch
#                        Tool to make quick web searches from the desktop


#First define functions for YouTube, DuckDuckGo, ArchWiki, Stack Overflow, Stack Exchange, Superuser.
BRW=qutebrowser
# Color for the prompt menu
#dcolor=#5100FF           #Strong Purple
#dcolor=#8C00FF           #Light Purple
#dcolor=#AB960C           #Mango Yellow
dcolor=#FFFF00           #Yellow
dbcolor=#282A36           #Solarized~DraculaishGreyishIndigo
FONT="xft:Source Code Pro:style=Medium:size=8"

#"DEFAULT": "https://duckduckgo.com/?q={}", "aw": "https://wiki.archlinux.org/index.php?search={}", "yt": " ", "sto": "http://stackoverflow.com/search?q={}", "ste": "http://stackexchange.com/search?q={}", "su": "http://superuser.com/search?q={}"}')
#https://www.youtube.com/results?search_query=
function yt(){                                                  # YouTube Search
        SEARCH=$(echo $@ | tr ' ' '+') 
        WL="https://www.youtube.com/playlist?list=WL"
        HIST="https://www.youtube.com/feed/history"
        YTHOME="https://www.youtube.com/"
 [ "$@" == "wl" ] && $BRW $WL && exit || [ "$@" == "hm" ] && $BRW $YTHOME && exit || [ "$@" == "hi" ] && $BRW $HIST && exit || $BRW https://www.youtube.com/results?search_query=$SEARCH
#case "$@" in 
#        wl) $BRW $WL && break;;
#        hm) $BRW $YTHOME;;
#        hi) $BRW $HIST;;
#        *) $BRW https://www.youtube.com/results?search_query=$SEARCH ;;
#esac
}

function ddg(){                                                 #DuckDuckGo Search
        SEARCH=$(echo $@ | tr ' ' '+') 
$BRW https://duckduckgo.com/?q=$SEARCH
}

function ste(){                                                 #Stack Exchange Search
        SEARCH=$(echo $@ | tr ' ' '+') 
$BRW http://stackexchange.com/search?q=$SEARCH
}

function sto(){                                                 #Stack Overflow Search
        SEARCH=$(echo $@ | tr ' ' '+') 
$BRW http://stackoverflow.com/search?q=$SEARCH
}

function su(){                                                 #Superuser Search
        SEARCH=$(echo $@ | tr ' ' '+') 
$BRW http://superuser.com/search?q=$SEARCH
}

function aw(){                                                  #ArchWiki Search
        SEARCH=$(echo $@ | tr ' ' '+') 
$BRW https://wiki.archlinux.org/index.php?search=$SEARCH
}

#(cat ~/.config/qutebrowser/quickmarks | awk '{print $2}' |dmenu -l 8 | xargs -r qutebrowser) || (echo Hello | dmenu -p "Where to search?:")
QM=$(cat ~/.config/qutebrowser/quickmarks | awk '{print $2}' |dmenu -l 8 -nb $dbcolor -sf $dbcolor -sb $dcolor -nf $dcolor -fn "$FONT")
[ -z "$QM" ] && exit ;
#for loop compare && qutebrowser $QM || case 1:yt do $yt $@ ; case 2:ddg do $ddg $@ ; case 3:ste do .....etc.
QMHEAD=$(echo $QM | head -c 3 | tr -d ' ')
#for((i=0;i<$(cat ~/.config/qutebrowser/quickmarks | wc -l);i=i+1));
for i in $( cat ~/.config/qutebrowser/quickmarks | awk '{print $2}')
#do [ "$QM" == "${sed -n '{!i}p' ~/.config/qutebrowser/quickmarks | awk '{print $2}')" ] && break ;
do [ "$QM" == "$i" ] &&  break ;
done  && qutebrowser $QM || case $QMHEAD in                              yt) yt $(echo $QM | cut -c4- | tr '#' ' ' );;
                                                                        ddg) ddg $(echo $QM | cut -c5- | tr '#' ' ' );;
                                                                        ste) ste $(echo $QM | cut -c5-) | tr '#' ' ' ;;
                                                                        sto) sto $(echo $QM | cut -c5-) | tr '#' ' ' ;;
                                                                        su) su $(echo $QM | cut -c4- | tr '#' ' ' );;
                                                                        aw) aw $(echo $QM | cut -c4-| tr '#' ' ' );;
                                                                         *) ddg $(echo $QM | tr '#' ' ' );;
                                                                    esac
