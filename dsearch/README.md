# DSEARCH
## Search quicker with dmenu
A script to lookup stuff from your favorite websites

### Usage

    dsearch

Thats it lol. Bye.

Just kidding. The script itself takes no parameters as of now. So its ideal to map it to a keyboard shortcut to call it.

The key here is customizing the script to your liking and needs.
You can use the script without modifying it at all, just that these are my defaults and not tailored specifically for you.

Usage totally depends on how you customized it.

Note that I have specifically tailored it for using it with my qutebrowser setup, so it loads up with all of my qutebrowser quickmarks by default.
But you can use it without it as well. Just that you won't have the quickmarks listed as I do. If you can get your browser's bookmarks conveniently then be sure to check out [Custom Quickmark](https://github.com/whotftookmyname/bashscripts/blob/main/dsearch/README.md#configuration)

Be sure to change browser(__$BRW__) in the configuration if you use/prefer a different browser.[Changing Browser]()

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
- __Wildcard__

By default just typing without any command will search the written text on DuckDuckGo. However there exists a `ddg` command if you ever wish to change your default search engine to something else.

### Configuration

#### Basic

If you just need to make basic changes then the _BASE VARIABLES_ section is all that you need.

- **Browser**
    - Change your default browser to be executed by modifying the `BRW` variable. By default it is set to qutebrowser.
- **Colors & Fonts**
    - Foreground is set by `dcolor` and Background color is set by `dbcolor`.
    - Font can be set normally. By default Source Code Pro,size 8 is specified.

#### Advanced

These changes are more suited for a person well familiar with bash syntax.


