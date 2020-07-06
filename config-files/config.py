##  ____             _                         ____          _
## |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
## | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
## | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
## |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
## -----------------------------------------------------------------
## https://darkncesscode.com
## https://github.com/codedarkness
## -----------------------------------------------------------------
## A customized config.py for Qtile window manager (http://www.qtile.org)
## Modified by Derek Taylor (http://www.gitlab.com/dwt1/ )
##
## The following comments are the copyright and licensing information from the default
## qtile config. Copyright (c) 2010 Aldo Cortesi, 2010, 2014 dequis, 2012 Randall Ma,
## 2012-2014 Tycho Andersen, 2012 Craig Barnes, 2013 horsik, 2013 Tao Sauvage
##
## Permission is hereby granted, free of charge, to any person obtaining a copy of this
## software and associated documentation files (the "Software"), to deal in the Software
## without restriction, including without limitation the rights to use, copy, modify,
## merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
## permit persons to whom the Software is furnished to do so, subject to the following
## conditions:
##
## The above copyright notice and this permission notice shall be included in all copies
## or substantial portions of the Software.

#############
## Imports ##
#############

import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from typing import List  # noqa: F401

###############
## Variables ##
###############

# Set MOD Key
mod = "mod4"
# Terminal
myTerm = "bash"
# Config file location
myConfig = "~/.config/qtile/config.py"

#################
## Keybindings ##
#################

keys = [
         ### The essentials
         Key(
             [mod], "Return",
             lazy.spawn(myTerm),
             desc='Launch Terminal'
             ),
         Key(
             [mod, "shift"], "Return",
             lazy.spawn("bash"),
             desc='Dmenu Run Launcher'
             ),
         Key(
             [mod], "Tab",
             lazy.next_layout(),
             desc='Toggle through layouts'
             ),
         Key(
             [mod], "q",
             lazy.window.kill(),
             desc='Kill active window'
             ),
         Key(
             [mod, "shift"], "r",
             lazy.restart(),
             desc='Restart Qtile'
             ),
         Key(
             [mod, "shift"], "q",
             lazy.shutdown(),
             desc='Shutdown Qtile'
             ),

         ### Window controls
         Key(
             [mod], "k",
             lazy.layout.down(),
             desc='Move focus down in current stack pane'
             ),
         Key(
             [mod], "j",
             lazy.layout.up(),
             desc='Move focus up in current stack pane'
             ),
         Key(
             [mod, "shift"], "k",
             lazy.layout.shuffle_down(),
             desc='Move windows down in current stack'
             ),
         Key(
             [mod, "shift"], "j",
             lazy.layout.shuffle_up(),
             desc='Move windows up in current stack'
             ),
         Key(
             [mod], "h",
             lazy.layout.grow(),
             lazy.layout.increase_nmaster(),
             desc='Expand window (MonadTall), increase number in master pane (Tile)'
             ),
         Key(
             [mod], "l",
             lazy.layout.shrink(),
             lazy.layout.decrease_nmaster(),
             desc='Shrink window (MonadTall), decrease number in master pane (Tile)'
             ),
         Key(
             [mod], "n",
             lazy.layout.normalize(),
             desc='normalize window size ratios'
             ),
         Key(
             [mod], "f",
             lazy.layout.maximize(),
             desc='toggle window between minimum and maximum sizes'
             ),
         Key(
             [mod, "shift"], "f",
             lazy.window.toggle_floating(),
             desc='toggle floating'
             ),

         ### Stack controls
         Key(
             [mod, "shift"], "space",
             lazy.layout.rotate(),
             lazy.layout.flip(),
             desc='Switch which side main pane occupies (XmonadTall)'
             ),
         Key(
             [mod], "space",
             lazy.layout.next(),
             desc='Switch window focus to other pane(s) of stack'
             ),
         Key(
             [mod, "control"], "Return",
             lazy.layout.toggle_split(),
             desc='Toggle between split and unsplit sides of stack'
             ),

         ## My Keybindins
         Key(
             [mod], "r",
             lazy.spawn(myTerm+" -e ranger"),
             desc='Ranger file manager'
             ),
         Key(
             [mod], "v",
             lazy.spawn(myTerm+" -e vim"),
             desc='Vim text editor'
             ),
         Key(
             [mod], "o",
             lazy.spawn("./Documents/scripts/dmenu-programs.sh"),
             desc='Dmenu script programs'
             ),
         Key(
             ["mod", "shift"], "o",
             lazy.spawn("dmenu_recency"),
             desc='Dmenu system monitor script'
             ),
         Key(
             ["mod", "control"], "o",
             lazy.spawn("./Documents/scripts/tremc_url.sh"),
             desc='Open tremc to add torrents'
             ),
         Key(
             [mod], "0",
             lazy.spawn("./.config/qtile/sysact.sh"),
             desc='System account'
             ),
         Key(
             [mod], "F2",
             lazy.spawn("brave"),
             desc='brave browser'
             ),
         Key(
             [mod], "F3",
             lazy.spawn("pcmanfm"),
             desc='Gui file manger'
             ),
         Key(
             [mod], "F4",
             lazy.spawn(myTerm+" ./Documents/darkwiki/indix.wiki"),
             desc='vim wiki'
             ),
         Key(
             [mod], "F12",
             lazy.spawn("blurlock"),
             desc='Lock screen'
             ),
         Key(
             [Print],
             lazy.spawn("i3-scrot"),
             desc='Lock screen'
             ),
]

##############################
## Groups (work space name) ##
##############################

group_names = [("DEV", {'layout': 'monadtall'}),
               ("WWW", {'layout': 'monadtall'}),
               ("SYS", {'layout': 'monadtall'}),
               ("GFX", {'layout': 'monadtall'}),
               ("DOC", {'layout': 'monadtall'}),
               ("CHT", {'layout': 'monadtall'}),
               ("EDT", {'layout': 'monadtall'}),
               ("TXT", {'layout': 'monadtall'}),
               ("CLI", {'layout': 'monadtall'})]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))        # Switch to another group
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name))) # Send current window to another group

###########################
## Defatul Theme Layouts ##
###########################

layout_theme = {"border_width": 1,
                "margin": 6,
                "border_focus": "e1acff",
                "border_normal": "1D2330"
                }

#############
## Layouts ##
#############

layouts = [
    #layout.MonadWide(**layout_theme),
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.Tile(shift_windows=True, **layout_theme),
    layout.Stack(num_stacks=2),
    layout.Floating(**layout_theme)
]

############
## Colors ##
############

colors = [["#222D31", "#222D31"], # panel background
          ["#434758", "#434758"], # background for current screen tab
          ["#ffffff", "#ffffff"], # font color for group names
          ["#ff5555", "#ff5555"], # border line color for current tab
          ["#8d62a9", "#8d62a9"], # border line color for other tab and odd widgets
          ["#668bd7", "#668bd7"], # color for the even widgets
          ["#839192", "#839192"]] # window name

############
## Prompt ##
############

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

####################
## Widget Settins ##
####################

widget_defaults = dict(
    font="monospace",
    fontsize = 11,
    padding = 2,
    background=colors[2]
)
extension_defaults = widget_defaults.copy()

#################
## Bar Widgets ##
#################

def init_widgets_list():
    widgets_list = [
               widget.Sep(
                        linewidth = 0,
                        padding = 6,
                        foreground = colors[2],
                        background = colors[0]
                        ),
               widget.Image(
                        filename = "~/.config/qtile/icons/python.png",
                        mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn('dmenu_run')}
                      ),
               widget.GroupBox(font="monospace",
                        fontsize = 11,
                        margin_y = 3,
                        margin_x = 0,
                        padding_y = 5,
                        padding_x = 3,
                        borderwidth = 3,
                        active = colors[2],
                        inactive = colors[2],
                        rounded = False,
                        highlight_color = colors[1],
                        highlight_method = "line",
                        this_current_screen_border = colors[3],
                        this_screen_border = colors [4],
                        other_current_screen_border = colors[0],
                        other_screen_border = colors[0],
                        foreground = colors[2],
                        background = colors[0]
                        ),
               widget.Prompt(
                        prompt=prompt,
                        font="monospace",
                        padding=10,
                        foreground = colors[3],
                        background = colors[1]
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 40,
                        foreground = colors[2],
                        background = colors[0]
                        ),
               widget.WindowName(
                        foreground = colors[6],
                        background = colors[0],
                        padding = 0
                        ),
               widget.TextBox(
                        text='',
                        background = colors[0],
                        foreground = colors[4],
                        padding=0,
                        fontsize=37
                        ),
              widget.TextBox(
                       text=" ₿",
                       padding = 0,
                       foreground=colors[2],
                       background=colors[4],
                       fontsize=12
                       ),
              widget.BitcoinTicker(
                       foreground=colors[2],
                       background=colors[4],
                       padding = 5
                       ),
              widget.TextBox(
                       text='',
                       background = colors[4],
                       foreground = colors[5],
                       padding=0,
                       fontsize=37
                       ),
              widget.TextBox(
                       text=" 🌡",
                       padding = 2,
                       foreground=colors[2],
                       background=colors[5],
                       fontsize=11
                       ),
              widget.ThermalSensor(
                       foreground=colors[2],
                       background=colors[5],
                       threshold = 90,
                       padding = 5
                       ),
              widget.TextBox(
                       text='',
                       background = colors[5],
                       foreground = colors[4],
                       padding=0,
                       fontsize=37
                       ),
               widget.TextBox(
                        text=" ⟳",
                        padding = 2,
                        foreground=colors[2],
                        background=colors[4],
                        fontsize=14
                        ),
               widget.Pacman(
                        update_interval = 1800,
                        foreground = colors[2],
                        mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
                        background = colors[4]
                        ),
               widget.TextBox(
                        text="Updates",
                        padding = 5,
                        mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e sudo pacman -Syu')},
                        foreground=colors[2],
                        background=colors[4]
                        ),
               widget.TextBox(
                        text='',
                        background = colors[4],
                        foreground = colors[5],
                        padding=0,
                        fontsize=37
                        ),
               widget.TextBox(
                        text=" 🖬",
                        foreground=colors[2],
                        background=colors[5],
                        padding = 0,
                        fontsize=14
                        ),
               widget.Memory(
                        foreground = colors[2],
                        background = colors[5],
                        mouse_callbacks = {'Button1': lambda qtile: qtile.cmd_spawn(myTerm + ' -e htop')},
                        padding = 5
                        ),
               widget.TextBox(
                        text='',
                        background = colors[5],
                        foreground = colors[4],
                        padding=0,
                        fontsize=37
                        ),
               widget.Net(
                        interface = "enp6s0",
                        format = '{down} ↓↑ {up}',
                        foreground = colors[2],
                        background = colors[4],
                        padding = 5
                        ),
               widget.TextBox(
                        text='',
                        background = colors[4],
                        foreground = colors[5],
                        padding=0,
                        fontsize=37
                        ),
               widget.TextBox(
                       text=" Vol:",
                        foreground=colors[2],
                        background=colors[5],
                        padding = 0
                        ),
               widget.Volume(
                        foreground = colors[2],
                        background = colors[5],
                        padding = 5
                        ),
               widget.TextBox(
                        text='',
                        background = colors[5],
                        foreground = colors[4],
                        padding=0,
                        fontsize=37
                        ),
               widget.CurrentLayoutIcon(
                        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                        foreground = colors[0],
                        background = colors[4],
                        padding = 0,
                        scale=0.7
                        ),
               widget.CurrentLayout(
                        foreground = colors[2],
                        background = colors[4],
                        padding = 5
                        ),
               widget.TextBox(
                        text='',
                        background = colors[4],
                        foreground = colors[5],
                        padding=0,
                        fontsize=37
                        ),
               widget.Clock(
                        foreground = colors[2],
                        background = colors[5],
                        format="%A, %B %d  [ %H:%M ]"
                        ),
               widget.Sep(
                        linewidth = 0,
                        padding = 10,
                        foreground = colors[0],
                        background = colors[5]
                        ),
               widget.Systray(
                        background=colors[0],
                        padding = 5
                        ),
              ]
    return widgets_list

##### SCREENS ##### (TRIPLE MONITOR SETUP)

# def init_widgets_screen1():
#    widgets_screen1 = init_widgets_list()
#    return widgets_screen1                       # Slicing removes unwanted widgets on Monitors 1,3

# def init_widgets_screen2():
#    widgets_screen2 = init_widgets_list()
#    return widgets_screen2                       # Monitor 2 will display all widgets in widgets_list

def init_screens():
    return [Screen(top=bar.Bar(widgets=init_widgets_screen(), opacity=0.95, size=20))]

if __name__ in ["config", "__main__"]:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen = init_widgets_screen()

###########################
## Move Floating Windows ##
###########################

mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False

######################
## Floating Windows ##
######################

floating_layout = layout.Floating(float_rules=[
    {'wmclass': 'confirm'},
    {'wmclass': 'dialog'},
    {'wmclass': 'download'},
    {'wmclass': 'error'},
    {'wmclass': 'file_progress'},
    {'wmclass': 'notification'},
    {'wmclass': 'splash'},
    {'wmclass': 'toolbar'},
    {'wmclass': 'confirmreset'},  # gitk
    {'wmclass': 'makebranch'},  # gitk
    {'wmclass': 'maketag'},  # gitk
    {'wname': 'branchdialog'},  # gitk
    {'wname': 'pinentry'},  # GPG key password entry
    {'wmclass': 'ssh-askpass'},  # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

############################
## Autostart Applications ##
############################

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
