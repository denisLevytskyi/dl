from pathlib import Path
from datetime import datetime
import telebot
import subprocess
import sys
import os

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
COMMANDS = {}
bat_files = sorted(ROOT.glob("*.bat"))
for i, file in enumerate(bat_files):
    COMMANDS[str(i)] = file

# === ЛОГИ ===
def write_log(msg):
    now = datetime.now().strftime("%d.%m.%Y %H:%M:%S,%f")[:-4]
    line = f"[{now}] COMMANDER {msg} \n"
    log_file = DATA / "_log.txt"
    with open(log_file, "a", encoding="utf-8") as f:
        f.write(line)

# === ОБРАБОТКА СООБЩЕНИЙ ===
@bot.message_handler(content_types=["text"])
def handle(message):
    text = message.text.strip().lower()
    write_log(f"GET COMMAND {text}")

    # защита по chat_id
    if message.chat.id == ALLOWED_CHAT:
        write_log("ADMIN LOGIN")
    else:
        write_log(f"USER LOGIN {message.chat.id} @{message.from_user.username or '-'}")
        bot.send_message(ALLOWED_CHAT, f"USER_LOGIN:\n\nID → {message.chat.id}\nNAME → {message.from_user.first_name}\nLAST NAME → {message.from_user.last_name or '-'}\nUSERNAME → @{message.from_user.username or '-'}\nCOMMAND → {text}")

    # команда списка
    if text == "dl":
        msg = "COMMANDS:\n\n"
        for k, v in COMMANDS.items():
            msg += f"{k} → {v.name}\n"
        bot.reply_to(message, msg)
        write_log("SEND COMMANDS")
        return

    # команда завершения
    if text == "die":
        bot.reply_to(message, "DIE")
        write_log("DIE")
        bot.stop_polling()
        os._exit(0)    
        return

    # команда логов
    if text == "log":
        with open(DATA / "_log.txt", "rb") as f:
            bot.send_document(message.chat.id, f, visible_file_name="_log.txt")
        with open(DATA / "_log_monitor.txt", "rb") as f:
            bot.send_document(message.chat.id, f, visible_file_name="_log_monitor.txt")
        write_log("SEND LOGS")
        return

    # обработка команды
    cmd = COMMANDS.get(text)
    if cmd:
        bot.reply_to(message, "COMMAND_START")
        write_log("COMMAND START")
        subprocess.Popen(f'start "" cmd /c "{str(cmd)}"', shell=True)
    else:
        bot.reply_to(message, "UNKNOWN_COMMAND")
        write_log("UNKNOWN COMMAND")

bot.infinity_polling()

# pyinstaller --onefile --noconsole COMMANDER.py