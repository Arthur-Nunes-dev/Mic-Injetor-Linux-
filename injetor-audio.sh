#!/bin/bash
# Remove qualquer instância anterior para não dar erro
pactl unload-module module-null-sink 2>/dev/null

# Cria a linha própria (Sink Virtual)
pactl load-module module-null-sink sink_name=Linha_Mic sink_properties=device.description="Microfone_Injetado_Linha"

# --- AJUSTES DE ESTABILIDADE ---
# -t 60000: Aumenta a latência para 60ms (evita picotar)
# -b: Ativa o modo de buffer estável (ideal para evitar cortes)
# -S 1: Força a sincronização entre a entrada e a saída
alsaloop -C hw:1,0 -P default -f S16_LE -c 1 -r 48000 -t 60000 -b -S 1
