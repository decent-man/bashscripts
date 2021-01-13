# DDLG
## dmenu Dialog
This here is a script to create a dynamic dialog using dmenu.

### Usage

The usage is pretty simple

	```ddlg "Any Prompt Text comes here:" optionlabel1 command1 optionlabel2 command2 optionlabel3 command3............optionlabel* command*```

Didn't get it? No worries I'll explain better

## Explanation

The first argument is supposed to be the text you want prompted to you.

E.g

	`ddlg "Do you wish to continue?:"`

After which you can specify an alternate series of labels and commands to be executed. Btw even not specifying anything and only the prompt text will still bring up dmenu with the prompt text and no options(You can use this to test if the script itself is working or not)

#####Definition

- **Label** : A label is what will show up in dmenu as an option(s)
- **Command** : The command that will be executed if its corresponding label was selected in dmenu.

A good example would be a basic Yes/No Prompt.

	`ddlg "Do you wish to continue?:" Yes "dosomethinghere" No "dosomethinghere"`

If this still feels complicated, just ignore the fuss in the beginning.

This is the core idea:

	`Yes "executesomethinghereifYes" No "executesomethinghereifNo" Maybe "whatthehellismaybe?"`

Getting it? Its just an alternating series of options and 'what-you-want-to-do-if-you-selected-this-option'.


**Note!:** Seperations between arguments to be done with spaces. If some command you are executing has spaces or options(-p -r whatever, say `pacman -Sy`) and if the Prompt Text itself has spaces, surround them inside a quote or the script pretty much wont work. The whole idea is to group things correctly or the underlying for loop will not detect things properly and you'll end up with a broken looking option or the script wont do anything because the starting count checking condition failed.

The menu can be as big as you want it to be, no limitations.

Thats it.

**Possible Updates:**
 - A feature to connect to dmenu options directly(-nf -sb -sf,etc)

