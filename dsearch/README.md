# DSEARCH
## Search quicker with dmenu
A script to perform searches to your favorite websites from anywhere.

### Usage

    dsearch

Thats it lol. Bye.

Just kidding. The script itself takes no parameters as of now. So its ideal to map it to a keyboard shortcut to call it.

The key here is customizing the script to your liking and needs.
You can use the script without modifying it at all, just that these are my defaults and not tailored specifically for you.

Usage totally depends on how you customized it.

>Note that I have specifically tailored it for using it with my qutebrowser setup, so it loads up with all of my qutebrowser quickmarks by default.
>But you can use it without it as well. Just that you won't have the quickmarks listed as I do. If you can get your browser's bookmarks conveniently then be sure to check out [Quickmarks](https://github.com/whotftookmyname/bashscripts/blob/main/dsearch/README.md#advanced)

Be sure to change browser(`$BRW`) in the configuration if you use/prefer a different browser.([Changing Browser](https://github.com/whotftookmyname/bashscripts/blob/main/dsearch/README.md#advanced))

Upon being called shows up with a list of quickmarks(Only if you use qutebrowser and have quickmarks):

![dsearch Called](/dsearch/scrots/ds1.png)

However these are the **defaults**:
#### Commands
To be typed inside dmenu
- **ArchWiki**
    - `aw search-text` : Searches Archwiki for the specified query. E.g to lookup xmobar on archwiki type `aw xmobar` and Enter.
- **Youtube**
    - `yt hm` : Opens up your YouTube homepage.
    - `yt wl` : Opens up your YouTube watch later page.
    - `yt hi` : Opens up your YouTube History page.
    - `yt search-text` : Searches youtube for 'search-text'. Replace 'search-text' with whatever you want to search. Say you want to want a video on how to install Arch Linux, type `yt How to install Arch Linux`, press enter and you're done.
- **StackOverflow**
    - `sto search-text` : Searches Stack Overflow for your specified query.
- **StackExchange**
    - `ste search-text` : Searches Stack Exchange for your specified query.
- **SuperUser**
    - `su search-text` : Searches SuperUser for your specified query.
- __Wildcard Search__

By default just typing without any command will search the written text on DuckDuckGo. However there exists a `ddg` command if you ever wish to change your default search engine to something else.

### Configuration

#### Basic

If you just need to make basic changes then the _BASE VARIABLES_ section is all that you need.

- **Browser**
    - Change your default browser to be executed by modifying the `BRW` variable. By default it is set to qutebrowser.
- **Colors & Fonts**
    - Foreground is set by `dcolor` and Background color is set by `dbcolor`.
    - Font can be set normally with or without xft. By default Source Code Pro,size 8 using xft is specified.

#### Advanced

These changes are more suited for a person well familiar with bash syntax.
The script itself has some basic instructions/explanations for making any changes so you don't have to visit this GitHub page always.

##### Adding a Website
1. **Creating the Function**
  1. Fetch the 'search url' of the website you want. This can easily be figured out by performing a search on that website and filtering out the text you searched for.
    - E.g Lets figure out the 'search url' of Amazon.com.
    - On amazon.com lets search for 'Hello World'.
    - Once the search is loaded observe the new url of the page. Look for Hello and World in the url. Generally these will be seperated by a '+' but do note if its using any other characters for spaces.
    - For now the whole link looks like <https://www.amazon.com/s?k=Hello+World> . Filter out 'Hello World' from the link. In this example the 'search url' would be <https://www.amazon.com/s?k=> .
    - Beyond this anything you type (with spaces translated to '+') will be a proper search url and perform a direct search on that website.
    - So if I type in my url bar <https://www.amazon.com/s?k=Corsair+Keyboard> then it would lead me to a page where the search is performed automatically for 'Corsair Keyboard' on amazon.

  2. Write a function referring to the sample function written in the script itself(under 'Basic Layout is:'). Temporarily lets call it `myFunction`
    - The `SEARCH` variable is mostly going to be the same. There will be changes if your website uses other characters instead of '+' for spaces. Just make the changes in `tr ' ' '+'`.
    - Execute the whole thing with `$BRW yoururl/s?=$SEARCH`. If you have any custom pages you want to load under the main website just add a case statement accordingly (refer the YouTube function in the script on how to do this).
2. **Adding the corresponding case**
  - Simply add a new case entry in the format in the __MAIN CODE__ section
```           
mycombo) myFunction $(echo $QM | cut -cX- | tr '#' ' ');;
```
where

    - `mycombo` is whatever you want to type in dmenu to target your website.
    - `myFunction` is the website's function you created.
    - `echo $QM` : the whole thing you typed in dmenu
    - `cut -cX-` : cutting out the command from the beginning so that doesn't get included into the search. `X` = 2 + length of `mycombo` .
    - `tr '#' ''`: trim out any characters that interfere with searching. If your search includes a '#' then anything after the '#' will not be included into the search.
     
##### Quickmarks

Qutebrowser provides a plaintext file containing all its quickmarks in its config folder. This is what I used to load up dmenu.

If you use a different browser and have a way to load up your bookmarks in the dmenu fashion(each entry is a newline) then feel free to modify the line:

    QM=$(cat ~/.config/qutebrowser/quickmarks | awk '{print $2}' | dmenu -l 8 -nb $dbcolor -sf $dbcolor -sb $dcolor -nf $dcolor -fn "$FONT")

Just change the part before `| dmenu ....` and you're set.

Change the script however you want to your liking.

That's it.

Enjoy d-seacrching!     
