# DDLG
## Generate Quick Dialogs with dmenu
This here is a script to create a dynamic dialog using dmenu.

### Usage

The usage is pretty simple

	ddlg "Any Prompt Text comes here:" optionlabel1 command1 optionlabel2 command2 optionlabel3 command3............optionlabel* command*

Didn't get it? No worries I'll explain better

## Explanation

The first argument is supposed to be the text you want prompted to you.

E.g

	ddlg "Hi there fellow Gentleman"

Secondly you specify an alternate series of labels and commands to be executed.

**Sidenote/**
If not specified any labels or commands and only run with prompt text(it wont do anything if no prompt text is specified) , it will still bring up dmenu with the prompt text and no options(You can use this to test if the script itself is working or not)

But what are labels and commands?

#### Definition

- **Label** : A label is what will show up in dmenu as a selectable option(s).
- **Command** : The command that will be executed if its corresponding label was selected in dmenu.

A good example would be a basic Yes/No Prompt.

	ddlg "Do you wish to continue?:" Yes "dosomethinghere" No "dosomethinghere"

If this still feels complicated, just ignore the fuss in the beginning.

This is the core idea:

	Yes "executesomethinghereifYes" No "executesomethinghereifNo" Maybe "whatthehellismaybe?"

Getting it? Its just an alternating series of options and 'what-you-want-to-do-if-you-selected-this-option'.


**Note!:** Seperations between arguments to be done with spaces. If some command you are executing has spaces or options(-p -r whatever, say `pacman -Sy`) and if the Prompt Text itself has spaces, surround them inside quotes or the script pretty much wont work. The whole idea is to group things correctly or the underlying `for` loop will not detect things properly and you'll end up with  broken looking options or the script wont do anything because the initial count checking condition failed.

The menu can be as big as you want it to be, no limitations.

### Application

I personally wrote it to make a Power Menu(Logout,Reboot, Shutdown that sort of thing -I'm not a power user lol) for my i3wm since it doesn't have a proper one -I believe for the freedom to customize that as well.

In my use case the command looks like:

	ddlg "Which Exit Method?:" Logout "i3-msg exit" Reboot restart Shutdown poweroff

Where the output looks somewhat like:

![power menu implementation](/screenshots/mypwrmenu.png)

Its made with the idea of being expandable even if I have only ever used it for such a basic thing.

You can customize it all you like to your own needs. That is the essence of Linux.

Thats it from my side.

**Possible Updates:**
 - A feature to connect to dmenu options directly(-nf -sb -sf,etc) so you can specify different colors for dynamic usage(and for Eye Candy ofcourse)

