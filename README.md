# 🧹 PulisciCollegamentiGUI

**PulisciCollegamentiGUI** è un semplice tool PowerShell con interfaccia grafica per la rimozione di collegamenti orfani (.lnk) in Windows.

Questo programma scansiona il Desktop, il menu Start e altre cartelle comuni alla ricerca di collegamenti che puntano a file non più esistenti, permettendo di eliminarli facilmente con una GUI intuitiva.

---

## ✅ Funzionalità

- Interfaccia grafica in Windows Forms  
- Scansione automatica di più cartelle di sistema  
- Rilevamento di collegamenti non validi  
- Selezione multipla con checkbox  
- Log dettagliato in tempo reale  
- Eliminazione selettiva dei collegamenti trovati  

---

## 📦 Cartelle scansionate

- Desktop utente (`%USERPROFILE%\Desktop`)
- Desktop pubblico (`%PUBLIC%\Desktop`)
- Menu Start utente e globale
- Barra di avvio veloce
- Documenti, Download, Collegamenti, Preferiti

---

## ▶️ Esecuzione dello script `.ps1`

Per eseguire lo script PowerShell:

1. Scarica **PulisciCollegamentiGUI.ps1**  
2. Clicca con il tasto destro > **Esegui con PowerShell**  
3. Oppure, apri PowerShell e lancia:

~~~powershell
.\PulisciCollegamentiGUI.ps1
~~~

---

## 🛠️ Generare un file `.exe` con `ps2exe`

### 1. Installa `ps2exe` (solo la prima volta)

~~~powershell
Install-Module -Name ps2exe -Scope CurrentUser
~~~

Se richiesto, conferma con **S** per procedere.

### 2. Converte lo script in `.exe`

~~~powershell
Invoke-PS2EXE -InputFile "PulisciCollegamentiGUI.ps1" -OutputFile "PulisciCollegamenti.exe"
~~~

### 3. (Opzionale) Aggiungi un’icona personalizzata

Se hai un file `.ico` (es. `PuliziaCollegamenti.ico`), puoi includerlo così:

~~~powershell
Invoke-PS2EXE -InputFile "PulisciCollegamentiGUI.ps1" -OutputFile "PulisciCollegamenti.exe" -icon "PuliziaCollegamenti.ico"
~~~

---

## 💡 Note

- Il file `.exe` generato è completamente **portabile** e **non necessita di PowerShell installato** sul PC target.
- Lo script ignora collegamenti speciali di sistema (come Pannello di controllo o Esegui).

---

## 📄 Licenza

Questo progetto è distribuito con licenza **MIT**.  
Puoi usarlo, modificarlo e condividerlo liberamente.

---

