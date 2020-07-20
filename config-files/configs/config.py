#  ____             _                         ____          _
# |  _ \  __ _ _ __| | ___ __   ___  ___ ___ / ___|___   __| | ___
# | | | |/ _' | '__| |/ / '_ \ / _ \/ __/ __| |   / _ \ / _' |/ _ \
# | |_| | (_| | |  |   <| | | |  __/\__ \__ \ |__| (_) | (_| |  __/
# |____/ \__,_|_|  |_|\_\_| |_|\___||___/___/\____\___/ \__,_|\___|
# -----------------------------------------------------------------
# https://darkncesscode.com
# https://github.com/codedarkness
# -----------------------------------------------------------------
# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import os
import re
import socket
import subprocess
from libqtile.config import Key, Screen, Group, Drag, Click, Rule
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from libqtile.widget import Spacer
from typing import List  # noqa: F401

# Set MOD Key
mod = "mod4"
# Terminal
myTerm = "terminal"
# Config file location
myConfig = "~/.config/qtile/config.py"

keys = [
    Key([mod], "Return", lazy.spawn(myTerm)),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod], "q", lazy.window.kill()),

    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    Key([mod, "shift"], "r", lazy.spawncmd()),

    ###################
    ### Layout Keys ###
    ###################

    Key([mod], "n", lazy.layout.normalize()),
    Key([mod], "space", lazy.next_layout()),
    Key([mod, "shift"], "space", lazy.layout.rotate()),
    #Key([mod], "space", lazy.layout.next()),

    # Change Focus
    Key([mod], "Up", lazy.layout.up()),
    Key([mod], "Down", lazy.layout.down()),
    Key([mod], "Left", lazy.layout.left()),
    Key([mod], "Right", lazy.layout.right()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),

    # Resize up, down, left, right
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),

    # Flip Layout Monadtall/Monadwide
    Key([mod, "shift"], "f", lazy.layout.flip()),

    #######################
    ### Multimedia Keys ###
    #######################

    # Increase/Decrease Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 5")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 5")),

    # Increase/Decreasy/Mute Volume
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),

    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),

    ######################
    ### My Keybindings ###
    ######################

    Key([mod], "r", lazy.spawn(myTerm+" -e ranger")),
    Key([mod], "v", lazy.spawn(myTerm+" -e vim")),
    Key([mod], "o", lazy.spawn("./Documents/scripts/dmenu-programs.sh")),
    Key([mod, "shift"], "o", lazy.spawn("dmenu_recency")),
    Key([mod, "control"], "o", lazy.spawn("./Documents/scripts/tremc_url.sh")),
    Key([mod], "F2", lazy.spawn("brave")),
    Key([mod], "F3", lazy.spawn("pcmanfm")),
    Key([mod], "F4", lazy.spawn("./Documents/darkwiki/index.wiki")),
    Key([mod], "F12", lazy.spawn("blurlock")),
    Key([], "Print", lazy.spawn("i3-scrot")),
    Key([mod], "0", lazy.spawn("./.config/qtile/sysact.sh")),
]

##############
### Groups ###
##############

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

##########################################
### Defautl Theme Settings For Layouts ###
##########################################

layout_theme = {"border_width": 1,
                "margin": 6,
                "border_focus": "556064",
                "border_normal": "2F3D44"
                }

###############
### Layouts ###
###############

layouts = [
    #layout.Bsp(**layout_theme),
    #layout.Stack(stacks=2, **layout_theme),
    #layout.Columns(**layout_theme),
    #layout.RatioTile(**layout_theme),
    #layout.Tile(shift_windows=True, **layout_theme),
    #layout.VerticalTile(**layout_theme),
    #layout.Matrix(**layout_theme),
    #layout.Zoomy(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.Max(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.TreeTab(
         font = "Noto",
         fontsize = 13,
         sections = ["FIRST", "SECOND"],
         section_fontsize = 13,
         bg_color = "141414",
         active_bg = "90C435",
         active_fg = "000000",
         inactive_bg = "384323",
         inactive_fg = "a0a0a0",
         padding_y = 2,
         section_top = 10,
         panel_width = 150
         ),
    layout.Floating(**layout_theme)
]

############
## COLORS ##
############

#startColors
colors = [["#222D31", "#222D31"], # color 0 background
          ["#1F618D", "#1F618D"], # color 1 screen tab
          ["#839192", "#839192"], # color 2 font group names
          ["#AF601A", "#AF6015"], # color 3 widget cpu
          ["#5DADE2", "#5DADE2"], # color 4 widget tem
          ["#D7BDE2", "#D7BDE2"], # color 5 widget men
          ["#73C6B6", "#73C6B6"], # color 6 widget hdd
          ["#E59866", "#E59866"], # color 7 widget vol
          ["#E1ACFF", "#E1ACFF"], # color 8 widget bat
          ["#81A1C1", "#81A1C1"]] # color 9 widget date
#endColors

############
## PROMPT ##
############

prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

#############################
## DEFAULT WIDGET SETTINGS ##
#############################

widget_defaults = dict(
    font="Noto",
    fontsize = 13,
    padding = 3,
    background=colors[0]
)

extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(linewidth =0, padding = 2, foreground = colors[0]),

                widget.GroupBox(font = "Noto",
                    fontsize = 13,
                    margin_y = 3,
                    margin_x = 0,
                    padding_y = 5,
                    padding_x = 5,
                    borderwidth = 0,
                    active = colors[2],
                    inactive = colors[2],
                    rounded = False,
                    highlight_color = colors[1],
                    highlight_method = "text",
                    this_current_screen_border = colors[1],
                    this_screen_border = colors [0],
                    other_current_screen_border = colors[0],
                    other_screen_border = colors[0],
                    foreground = colors[2],
                    background = colors[0]
                ),

                widget.Prompt(prompt=prompt, font="sans", padding=10, foreground = colors[7]),

                widget.TextBox(text = ":", foreground = colors[2]),

                widget.WindowName(font = "sans", foreground = colors[9], padding = 3),

                widget.TextBox(text = " CPU", foreground = colors[3]),
                widget.CPU(foreground = colors[3], format = '{load_percent}%'),

                widget.TextBox(text = ":", foreground = colors[2]),
                widget.TextBox(text = " TEM", foreground = colors[4]),
                widget.ThermalSensor(foreground = colors[4], threshold = 90),

                widget.TextBox(text = ":", foreground = colors[2]),
                widget.TextBox(text = " MEM", foreground = colors[5]),
                widget.Memory(foreground = colors[5], format = '{MemUsed}M'),

                widget.TextBox(text = ":", foreground = colors[2]),
                widget.TextBox(text = " SSD", foreground = colors[6]),
                widget.DF(foreground = colors[6], warn_color = colors[6], partition = '/', measure = 'G', warn_space = 50, update_interval = 60, visible_on_warn = False, format = '{uf}{m}'),

                #widget.TextBox(text = ":", foreground = colors[2]),
                #widget.TextBox(text = " BAT", foreground = colors[7]),
                #widget.Battery(foreground = colors[7], format = '{percent:2.0%}'),

                widget.TextBox(text = ":", foreground = colors[2]),
                widget.TextBox(text = " VOL", foreground = colors[8]),
                widget.Volume(foreground = colors[8]),

                widget.TextBox(text = ":", foreground = colors[2]),

                widget.Clock(foreground = colors[9], format = '%a %-d %b %I:%M'),

                widget.Sep(linewidth =0, padding = 3, foreground = colors[0]),
            ],
            24,
        ),
    ),
]

###########################
## Drag floating layouts ##
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
floating_layout = layout.Floating(**layout_theme, float_rules=[
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
    {'wname': 'alsamixer'},
    {'wname': 'Nitrogen'},
    {'wname': 'Lxappearance'},
    {'wname': 'Pacman-manager'},
])
auto_fullscreen = True
focus_on_window_activation = "smart"

############################
## Autostart Applications ##
############################
@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.Popen([home + '/.config/qtile/autostart.sh'])

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
