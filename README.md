
```markdown
# Mic-Injetor-Linux 🎤

Este repositório contém um utilitário de "autoinstalação" para resolver problemas de áudio em microfones USB no Linux (focado no modelo ME6S). Ele automatiza a criação de uma ponte de áudio de baixo nível entre o **ALSA (Kernel)** e o **Pipewire/PulseAudio**.

## 🛠️ O que o instalador faz?
1.  **Script Injetor**: Cria um script em `~/.local/bin` que gerencia a conexão do áudio.
2.  **Linha Virtual**: Cria uma entrada de microfone dedicada chamada "Microfone_Injetado_Linha".
3.  **App Launcher**: Cria um atalho no seu menu de aplicativos para que você não precise usar o terminal manualmente.
4.  **Otimização**: Configura prioridade de processo (`nice`) e buffers estáveis para evitar cortes.

---

## 🚀 Como instalar

1. **Baixe o instalador**:
   Baixe o arquivo `instalar_injetor.sh` deste repositório.

2. **Dê permissão de execução**:
   Abra o terminal na pasta onde você baixou o arquivo e rode:
   ```bash
   chmod +x instalar_injetor.sh

```

3. **Execute o instalador**:
```bash
./instalar_injetor.sh

```



---

## 🎧 Como usar no dia a dia

1. Abra o menu do seu sistema (tecla Super/Windows) e procure por **"Injetor de Microfone ME6S"**.
2. Ao clicar, uma janela de terminal se abrirá. **Mantenha-a aberta** enquanto estiver gravando ou em call.
3. No **OBS**, **Discord** ou **Zoom**, vá nas configurações de áudio e selecione como entrada:
> **Monitor of Microfone_Injetado_Linha**


4. Para desligar o microfone, basta fechar a janela ou apertar `Ctrl+C`.

---

## ⚠️ Observações Importantes

* **Identificação do Hardware**: Este script está configurado para o hardware no endereço `hw:1,0`. Se o seu microfone estiver em outra porta, você pode verificar com o comando `arecord -l`.
* **Chiado**: Se houver ruído, use o comando `alsamixer`, selecione o microfone (F6) e ajuste o volume de captura para cerca de 75%.
* **Dependências**: O instalador assume que você tem o `alsa-utils` e `pulseaudio-utils` instalados (padrão no Pop!_OS e Ubuntu).

---

**Contribuições são bem-vindas! Se este script salvou sua stream, sinta-se à vontade para dar uma ⭐ no repositório.**
