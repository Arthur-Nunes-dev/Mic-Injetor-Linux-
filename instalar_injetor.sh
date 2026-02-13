#!/bin/bash

# =============================================================
# INSTALADOR: Mic-Injetor-Linux
# Descrição: Automatiza a criação do script e do atalho .desktop
# =============================================================

# 1. Definindo caminhos
BIN_DIR="$HOME/.local/bin"
APP_DIR="$HOME/.local/share/applications"
SCRIPT_PATH="$BIN_DIR/injetor-audio.sh"
DESKTOP_PATH="$APP_DIR/injetor-audio.desktop"

echo "🚀 Iniciando a instalação do Mic-Injetor..."

# 2. Criando diretórios se não existirem
mkdir -p "$BIN_DIR"
mkdir -p "$APP_DIR"

# 3. Criando o Script Injetor
echo "📝 Criando script em $SCRIPT_PATH"
cat << 'EOF' > "$SCRIPT_PATH"
#!/bin/bash
# Remove instâncias anteriores para evitar conflitos
pactl unload-module module-null-sink 2>/dev/null

# Cria a linha de microfone virtual (Sink)
pactl load-module module-null-sink sink_name=Linha_Mic sink_properties=device.description="Microfone_Injetado_Linha"

echo "-------------------------------------------------------"
echo "  INJETOR ATIVADO! (ME6S -> ALSA -> PIPEWIRE)"
echo "-------------------------------------------------------"
echo "  * Mantenha esta janela aberta para o Mic funcionar."
echo "  * No OBS/Discord, use: 'Monitor of Microfone_Injetado_Linha'"
echo "  * Para desligar: Feche esta janela ou aperte Ctrl+C"
echo "-------------------------------------------------------"

# Executa o loopback do ALSA com ajustes de estabilidade
alsaloop -C hw:1,0 -P default -f S16_LE -c 1 -r 48000 -t 60000 -b -S 1
EOF

# 4. Criando o atalho .desktop (App)
echo "🖥️ Criando atalho no menu de aplicativos..."
cat << EOF > "$DESKTOP_PATH"
[Desktop Entry]
Name=Injetor de Microfone ME6S
Comment=Injeta áudio do Kernel no Sistema
Exec=nice -n -15 $SCRIPT_PATH
Icon=audio-input-microphone
Terminal=true
Type=Application
Categories=AudioVideo;Audio;
EOF

# 5. Aplicando permissões
chmod +x "$SCRIPT_PATH"
chmod +x "$DESKTOP_PATH"

# 6. Finalização
update-desktop-database "$APP_DIR" 2>/dev/null

echo "✅ Instalação concluída com sucesso!"
echo "👉 Agora você já pode procurar por 'Injetor de Microfone ME6S' no seu menu."