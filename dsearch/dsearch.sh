#! /bin/bash
#    .____________                           .__     
#  __| _/   _____/ ____ _____ _______   ____ |  |__  
# / __ |\_____  \_/ __ \\__  \\_  __ \_/ ___\|  |  \ 
#/ /_/ |/        \  ___/ / __ \|  | \/\  \___|   Y  \
#\____ /_______  /\___  >____  /__|    \___  >___|  /
#     \/       \/     \/     \/            \/     \/ 
#                        ~/dsearch.sh
#                        Tool to make quick web searches from the desktop

#=====================================================
#                 BASE VARIABLES
#=====================================================
# The browser
    BRW=qutebrowser
# Color for the prompt menu
    #Foreground
      dcolor=#FFFF00            #Yellow
    #Background
      dbcolor=#282A36           #DraculaGreyishIndigo
    #Font
      FONT="xft:Source Code Pro:style=Medium:size=8"
#====================================================
#                   COMMANDS                            -add,remove or modify commands
#====================================================
# Launches the links in the specified browser upon being called.
# Basic layout is:
#    function shortname(){                                          #the same name is used in the final case statement as well
#       1.SEARCH_VARIABLE that grabs all words(the '$@') and trims all spaces and converts them into url friendly '+'
#       2.ANY_SPECIAL_VARIABLES you want to specify for custom use, as done in case of YouTube.
#       3.EXECUTE: BROWSER LINKASPARAMETER || Write a simple case statement for any custom url manipulation.-As done in case of YouTube[except it is a sophisticated logical case statement :) ]
#   }

#Youtube
    function yt(){                                                  
        SEARCH=$(echo $@ | tr ' ' '+') 
        WL="https://www.youtube.com/playlist?list=WL"
        HIST="https://www.youtube.com/feed/history"
        YTHOME="https://www.youtube.com/"
        [ "$@" == "wl" ] && $BRW $WL && exit || [ "$@" == "hm" ] && $BRW $YTHOME && exit || [ "$@" == "hi" ] && $BRW $HIST && exit || $BRW https://www.youtube.com/results?search_query=$SEARCH
    }
#DuckDuckGo
    function ddg(){                                                 
        SEARCH=$(echo $@ | tr ' ' '+') 
        $BRW https://duckduckgo.com/?q=$SEARCH
    }
#Stack Exchange
    function ste(){                                                
        SEARCH=$(echo $@ | tr ' ' '+') 
        $BRW http://stackexchange.com/search?q=$SEARCH
    }
#Stack Overflow
    function sto(){                                               
        SEARCH=$(echo $@ | tr ' ' '+') 
        $BRW http://stackoverflow.com/search?q=$SEARCH
    }
#SuperUser
    function su(){                                               
        SEARCH=$(echo $@ | tr ' ' '+') 
        $BRW http://superuser.com/search?q=$SEARCH
    }
#Arch Wiki
    function aw(){                                              
        SEARCH=$(echo $@ | tr ' ' '+') 
        $BRW https://wiki.archlinux.org/index.php?search=$SEARCH
    }

#===================================================================================================================
#                       MAIN CODE                               -do not mess unless you understand what you're doing
#===================================================================================================================
# If on qutebrowser make sure to have all quickmark names as single word names. Else its not going to work. I know I know its just a hack.
#Pipes my qutebrowser quickmarks to dmenu and also stores the dmenu output
[ -e ~/.config/qutebrowser/quickmarks ] && QM=$(cat ~/.config/qutebrowser/quickmarks | awk '{print $2}' | dmenu -l 8 -nb $dbcolor -sf $dbcolor -sb $dcolor -nf $dcolor -fn "$FONT") 
#Empty pipe if no quickmarks file found i.e. no qutebrowser
[ ! -e ~/.config/qutebrowser/quickmarks ] && QM=$(echo "" | dmenu -l 8 -nb $dbcolor -sf $dbcolor -sb $dcolor -nf $dcolor -fn "$FONT" -p "?:") 

# Check if output is not null. Most likely the case if your quickmarks are empty and you pressed enter with no args
[ -z "$QM" ] && exit ;
# Grab the command from the beginning(if any)
QMHEAD=$(echo $QM | head -c 3 | tr -d ' ')
# For loop check if its a 'command' or a 'quickmark' that is to be launched
for i in $( cat ~/.config/qutebrowser/quickmarks | awk '{print $2}')
do [ "$QM" == "$i" ] &&  break ;
done  && qutebrowser $QM || case $QMHEAD in       yt) yt $(echo $QM | cut -c4- | tr '#' ' ' );;         # If a quickmark then launch it with qutebrowser if not run this case statement. CHANGE QUTEBROWSER HERE IF NEEDED. Left unchanged since quickmarks are a qutebrowser thing.
                                                 ddg) ddg $(echo $QM | cut -c5- | tr '#' ' ' );;
                                                 ste) ste $(echo $QM | cut -c5-) | tr '#' ' ' ;;
                                                 sto) sto $(echo $QM | cut -c5-) | tr '#' ' ' ;;
                                                  su) su $(echo $QM | cut -c4- | tr '#' ' ' );;
                                                  aw) aw $(echo $QM | cut -c4-| tr '#' ' ' );;
                                                   *) ddg $(echo $QM | tr '#' ' ' );;
                       # your_short_command_in_dmenu) shortname $(LINK_FROM_QM | CUT OUT THE COMMAND PART | TRIM any unnecessary characters)
                                            esac
