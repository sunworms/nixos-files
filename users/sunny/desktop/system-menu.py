#!/usr/bin/env python3

import curses
import subprocess
import datetime
import psutil
import json
import os
import time
import threading


workspace = "?"
window_title = ""
window_id = None


def network():
    try:
        interfaces = psutil.net_if_addrs()
        for interface, addrs in interfaces.items():
            if interface.startswith(('wl', 'wlan')):
                stats = psutil.net_if_stats().get(interface)
                if stats and stats.isup:
                    return f"Connected ({interface})"
    except Exception:
        pass
    return "disconnected"


def bar(percent, width=20):
    filled = int(percent / 100 * width)
    return "█" * filled + "░" * (width - filled)


def initial_state():
    global workspace, window_title, window_id

    try:
        ws = json.loads(subprocess.check_output(
            ["niri", "msg", "-j", "workspaces"], text=True
        ))

        for w in ws:
            if w.get("is_focused"):
                workspace = w["idx"]

        wins = json.loads(subprocess.check_output(
            ["niri", "msg", "-j", "windows"], text=True
        ))

        for w in wins:
            if w.get("is_focused"):
                window_title = w["title"]
                window_id = w["id"]

    except:
        pass


def event_listener():
    global workspace, window_title, window_id

    proc = subprocess.Popen(
        ["niri", "msg", "--json", "event-stream"],
        stdout=subprocess.PIPE,
        text=True
    )

    for line in proc.stdout:
        try:
            event = json.loads(line)

            if event["type"] == "workspace-activated":
                workspace = event["workspace"]["idx"]

            elif event["type"] == "window-focused":
                window_title = event["window"]["title"]
                window_id = event["window"]["id"]

        except:
            pass


def choose_workspace():
    out = subprocess.check_output(
        ["niri", "msg", "-j", "workspaces"],
        text=True
    )

    ws = json.loads(out)
    choices = [str(w["idx"]) for w in ws]

    choice = subprocess.run(
        ["fuzzel", "--dmenu"],
        input="\n".join(choices),
        text=True,
        capture_output=True
    ).stdout.strip()

    if choice:
        subprocess.run(
            ["niri", "msg", "action", "focus-workspace", choice]
        )


def choose_window():
    out = subprocess.check_output(
        ["niri", "msg", "-j", "windows"],
        text=True
    )

    wins = json.loads(out)
    mapping = {w["title"]: w["id"] for w in wins}

    choice = subprocess.run(
        ["fuzzel", "--dmenu"],
        input="\n".join(mapping.keys()),
        text=True,
        capture_output=True
    ).stdout.strip()

    if choice:
        subprocess.run(
            ["niri", "msg", "action", "focus-window", "--id", str(mapping[choice])]
        )


def get_media_data():
    try:
        status = subprocess.check_output(
            ["playerctl", "status"], 
            stderr=subprocess.DEVNULL, 
            text=True
        ).strip()
        
        title = subprocess.check_output(
            ["playerctl", "metadata", "title"], 
            stderr=subprocess.DEVNULL, 
            text=True
        ).strip()
        
        icon = "󰏤" if status == "Playing" else "󰐊"
        return f"{icon} {title[:20]}"
    except subprocess.CalledProcessError:
        return "No Media"


def main(stdscr):

    curses.curs_set(0)
    stdscr.nodelay(True)

    curses.start_color()
    curses.use_default_colors()

    selected = 0
    items = 4

    cpu = 0
    mem_txt = ""
    last_cpu_poll = 0

    net = ""
    last_net_poll = 0

    now_txt = ""
    last_time_poll = 0

    media_txt = ""
    last_media_poll = 0

    while True:

        now = time.time()

        if now - last_media_poll > 2:
            media_txt = get_media_data()
            last_media_poll = now

        if now - last_time_poll > 1:
            now_txt = datetime.datetime.now().strftime("%A, %Y-%m-%d, %H:%M:%S")
            last_time_poll = now

        if now - last_cpu_poll > 2:
            cpu = psutil.cpu_percent()
            mem = psutil.virtual_memory()
            mem_txt = f"{mem.used//(1024**3)}G/{mem.total//(1024**3)}G"
            last_cpu_poll = now

        if now - last_net_poll > 2:
            net = network()
            last_net_poll = now

        stdscr.clear()

        h, w = stdscr.getmaxyx()

        panel_width = 46
        start_x = (w - panel_width) // 2
        start_y = (h - 12) // 2

        stdscr.addstr(start_y, start_x, now_txt)

        bat = psutil.sensors_battery()
        if bat:
            stdscr.addstr(start_y + 1, start_x, f"Battery: {bat.percent:.0f}%")

        stdscr.addstr(start_y + 2, start_x, "-" * panel_width)

        cpu_bar = bar(cpu)
        mem_percent = psutil.virtual_memory().percent
        mem_bar = bar(mem_percent)

        stdscr.addstr(start_y + 4, start_x, f"CPU    [{cpu_bar}] {cpu:.0f}%")
        stdscr.addstr(start_y + 5, start_x, f"Memory [{mem_bar}] {mem_percent:.0f}%")

        stdscr.addstr(start_y + 6, start_x, "-" * panel_width)

        entries = [
            ("Workspace", workspace),
            ("Media", media_txt),
            ("Network", net),
            ("System Monitor", "btop")
        ]

        for i, (k, v) in enumerate(entries):

            line = f"{k}: {v}"

            if i == 1 and i == selected:
                line += "  (←/→ skip)"

            if i == selected:
                stdscr.attron(curses.A_REVERSE)
                stdscr.addstr(start_y + 8 + i, start_x, line)
                stdscr.attroff(curses.A_REVERSE)
            else:
                stdscr.addstr(start_y + 8 + i, start_x, line)

        stdscr.addstr(start_y + 13, start_x, "↑ ↓ move   Enter select   q quit")

        stdscr.refresh()

        key = stdscr.getch()

        if key == curses.KEY_UP:
            selected = (selected - 1) % items

        elif key == curses.KEY_DOWN:
            selected = (selected + 1) % items

        elif key == ord("q"):
            break

        elif key == curses.KEY_RIGHT:
            if selected == 1:
                subprocess.run(["playerctl", "next"], stderr=subprocess.DEVNULL)

        elif key == curses.KEY_LEFT:
            if selected == 1:
                subprocess.run(["playerctl", "previous"], stderr=subprocess.DEVNULL)
        
        elif key == 10:  # Enter
            curses.def_shell_mode()
            stdscr.clear()
            curses.endwin()

            try:
                if selected == 0:
                    choose_workspace()
                elif selected == 1:
                    subprocess.run(["playerctl", "play-pause"], stderr=subprocess.DEVNULL)
                elif selected == 2:
                    subprocess.run(["nmtui"])
                elif selected == 3:
                    subprocess.run(["btop"])
            finally:
                stdscr.refresh()
                break

        time.sleep(0.1)

initial_state()

threading.Thread(target=event_listener, daemon=True).start()

curses.wrapper(main)
