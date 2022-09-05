from subprocess import check_output

from libqtile import bar, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.layout.columns import Columns
from libqtile.layout.floating import Floating
from libqtile.layout.xmonad import MonadTall, MonadThreeCol
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.widget import base


class Commands:
    rofi = "rofi -modi drun -show drun -display-drun 'Run'"
    win = "sudo virt-viewer win10"
    unlock = "sudo unlock-vm --unlock ~/.cache/gain_pw"
    xrandr_laptop = "xrandr --output DP-6 --auto"
    workrandr = "workrandr"
    lock = "betterlockscreen -l"
    pavucontrol = "pavucontrol"
    keyboard = "keyboard"
    mic_mute_toggle = "mic_mute_toggle"


class Music:
    client = "alacritty -e ncmpcpp"
    toggle_play_pause = "mpc toggle"


class Colors:
    background = "#1a1b26"
    red = "#f7768e"
    constants = "#ff9e64"
    yellow = "#e0af68"
    class_names = "#9ece6a"
    green = "#73daca"
    strings = "#b4f9f8"
    elements = "#2ac3de"
    cyan = "#7dcfff"
    blue = "#7aa2f7"
    magenta = "#bb9af7"
    white = "#c0caf5"
    foreground = "#a9b1d6"
    text = "#9aa5ce"
    parameters_inside_functions = "#cfc9c2"
    comments = "#565f89"
    black = "#414868"
    background_storm = "#24283b"
    background_night = "#1a1b26"


mod = "mod4"
terminal = guess_terminal()
groups = [Group(i) for i in "123456789"]
# groups = [Group(i) for i in ["DEV", "BROWSER", "CHAT", "MAIL", "SSH"]]
keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key([mod], "d", lazy.spawn(Commands.rofi), desc="Launch Rofi"),
    Key([mod, "shift"], "m", lazy.spawn(Commands.mic_mute_toggle), desc="Toggle mute mic"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "F10", lazy.spawn(Commands.win), desc="Open Win10 VM"),
    Key([mod], "F9", lazy.spawn(Commands.unlock), desc="Unlock Win10 VM"),
    Key([mod], "F8", lazy.spawn(Commands.workrandr), desc="Run workrandr"),
    Key([mod], "F7", lazy.spawn(Commands.xrandr_laptop), desc="Xrandr display laptop"),
    Key([mod, "shift", "control"], "l", lazy.spawn(Commands.lock)),
    Key([mod], "m", lazy.spawn(Music.client), desc="Spawn music client"),
    Key([mod], "p", lazy.spawn(Commands.pavucontrol), desc="Spawn pavucontrol"),
    Key(
        [mod, "shift"],
        "p",
        lazy.spawn(Music.toggle_play_pause),
        desc="Toggle play pause",
    ),
    Key([mod], "q", lazy.window.kill()),
    Key([mod], "f", lazy.window.toggle_fullscreen()),
    Key([mod, "shift"], "f", lazy.window.toggle_floating()),
    Key([mod], "Print", lazy.spawn("current_area_shot")),
    Key([], "Print", lazy.spawn("selected_area_shot")),
    Key([mod], "period", lazy.next_screen()),
    Key([mod], "F1", lazy.spawn(Commands.keyboard)),
]

for index, group in enumerate(groups, start=1):
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                str(index),
                lazy.group[group.name].toscreen(),
                desc=f"Switch to group {group.name}",
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                str(index),
                lazy.window.togroup(group.name, switch_group=True),
                desc=f"Switch to & move focused window to group {group.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

layout_conf = dict(
    border_width=3,
    border_normal=Colors.background,
    border_focus=Colors.red,
    margin=8,
)

layouts = [
    MonadTall(**layout_conf),
    MonadThreeCol(**layout_conf),
]

widget_defaults = dict(
    font="Roboto Mono Nerd Font",
    fontsize=14,
    padding=5,
    foreground=Colors.foreground,
)
extension_defaults = widget_defaults.copy()


class TimerText(base.InLoopPollText):
    def set_update_interval(self, sec: int) -> None:
        s = [
            (
                "update_interval",
                sec,
                "Update interval in seconds, if none, the " "widget updates whenever the event loop is idle.",
            ),
        ]
        self.add_defaults(s)


class BatteryWidget(TimerText):
    def __init__(self):
        super().__init__()
        self.set_update_interval(sec=5)

    def poll(self):
        return check_output(["battery"]).decode("utf-8")


class VolumeWidget(TimerText):
    def __init__(self):
        super().__init__()
        self.set_update_interval(sec=5)

    def poll(self):
        return check_output(["volume"]).decode("utf-8")


class PublicIpWidget(base.InLoopPollText):
    def __init__(self, **config):
        super().__init__(**config)

    def poll(self):
        return check_output(["public_ip"]).decode("utf-8")


sep = widget.Sep(foreground=Colors.comments, linewidth=2, size_percent=80)


def default_bar() -> bar.Bar:
    return bar.Bar(
        [
            widget.GroupBox(
                active=Colors.foreground,
                hide_unused=False,
                inactive=Colors.comments,
                highlight_method="line",
                highlight_color=Colors.background,
                this_current_screen_border=Colors.red,
                padding=5,
                margin=5,
            ),
            sep,
            widget.WindowName(),
            sep,
            widget.Net(format="<b>祝{up} {down}</b>", prefix="M"),
            sep,
            widget.Clock(format="<b> %Y-%m-%d %H:%M</b>"),
            sep,
            BatteryWidget(),
            sep,
            widget.KeyboardLayout(),
            sep,
            VolumeWidget(),
            sep,
            PublicIpWidget(),
        ],
        28,
        background=Colors.background_night,
        border_width=0,
        padding=5,
        margin=[0, 0, 5, 0],
        border_color=Colors.foreground,
    )


screens = [
    Screen(
        top=default_bar(),
        wallpaper="~/.config/qtile/background.png",
        wallpaper_mode="stretch",
    ),
    Screen(
        top=default_bar(),
        wallpaper="~/.config/qtile/background.png",
        wallpaper_mode="stretch",
    ),
]

# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = False
bring_front_click = False
cursor_warp = True
floating_layout = Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
