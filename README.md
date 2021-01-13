# DDLG
### dmenu Dialog
This here is a script to create a dynamic dialog using dmenu.

The usage is pretty simple

`ddlg "Any Prompt Text comes here:" optionlabel1 command1 optionlabel2 command2 optionlabel3 command3............optionlabel* command* `

Didn't get it? No worries I'll explain better

The first argument is supposed to be the text you want prompted to you.

E.g
`ddlg "Do you wish to continue?:"`

After which you can specify an alternate series of labels and commands to be executed.

- **Label** : A label is what will show up in dmenu as an option(s)
- **Command** : The command that will be executed if its corresponding label was selected in dmenu.


`ddlg "Do you wish to continue?:" Yes "dosomethinghere" No "dosomethinghere"`

If this still feels complicated, just ignore the first argument and the command.

`Yes "executesomethinghereifYes" No "executesomethinghereifNo"`

Getting it? Its just an alternating series of options and 'what-you-want-to-do-if-you-selected-this-option'


**Note:** Seperations between arguments to be done with spaces. If some command you are executing has spaces or options(-p -r whatever) even if the Prompt Text itself has spaces, surround them inside a quote or the script pretty much wont work. The whole idea is to group things properly or the underlying for loop will not detect things properly.

The menu can be as big as you want it to be, no limitations.

Thats it.
**Possible Updates:**
 - A feature to connect to dmenu options directly(-nf -sb -sf,etc)

