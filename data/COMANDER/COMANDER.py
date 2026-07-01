from pathlib import Path
from datetime import datetime
import telebot
import subprocess
import sys

# === ПУТИ ===
SCRIPT_DIR = Path(sys.executable).parent if getattr(sys, 'frozen', False) else Path(__file__).resolve().parent
ROOT = SCRIPT_DIR.parent.parent
DATA = ROOT / "data"

# === НАСТРОЙКИ ===
TOKEN = (DATA / "var_tg_token.txt").read_text(encoding="utf-8").strip()
ALLOWED_CHAT = int((DATA / "var_tg_chat.txt").read_text(encoding="utf-8").strip())

# === БОТ ===
bot = telebot.TeleBot(TOKEN)

# === СКАНИРОВАНИЕ BAT ФАЙЛОВ ===
bat_files = sorted(ROOT.glob("*.bat"))

COMMANDS = {}

for i, file in enumerate(bat_files):
    COMMANDS[str(i)] = file

# === ЛОГИ ===
def write_log(msg):
    now = datetime.now().strftime("%d.%m.%Y %H:%M:%S,%f")[:-4]
    line = f"[{now}] COMANDER {msg} \n"
    log_file = DATA / "_log.txt"

    with open(log_file, "a", encoding="utf-8") as f:
        f.write(line)

# === ОБРАБОТКА СООБЩЕНИЙ ===
@bot.message_handler(content_types=["text"])
def handle(message):
    text = message.text.strip().lower()
    write_log(f"GET COMMAND {text}")

    # защита по chat_id
    if message.chat.id != ALLOWED_CHAT:
        bot.reply_to(message, "USER_ERROR")
        write_log("USER ERROR")
        return

    # команда списка
    if text == "dl":
        if not COMMANDS:
            bot.reply_to(message, "NO_COMMANDS")
            return

        msg = "COMMANDS:\n\n"
        for k, v in COMMANDS.items():
            msg += f"{k} → {v.name}\n"

        bot.reply_to(message, msg)
        return

    # обработка команды
    cmd = COMMANDS.get(text)
    if cmd:
        subprocess.Popen(f'start "" cmd /c "{str(cmd)}"', shell=True)
        bot.reply_to(message, "OK")
    else:
        bot.reply_to(message, "UNKNOWN_COMMAND")
        write_log("UNKNOWN COMMAND")

bot.infinity_polling()