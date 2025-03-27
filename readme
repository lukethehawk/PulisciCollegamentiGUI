# 🧹 PulisciCollegamentiGUI

**PulisciCollegamentiGUI** is a simple PowerShell tool with a graphical interface (GUI) to remove orphaned shortcuts (`.lnk`) on Windows.

It scans your Desktop, Start Menu, and other common folders to find shortcuts that point to non-existent files, allowing you to easily remove them through an intuitive interface.

---

## ✅ Features

- Graphical interface built with Windows Forms  
- Automatically scans multiple system folders  
- Detects invalid shortcuts  
- Multiple selection with checkboxes  
- Real-time logging  
- Selective deletion of found shortcuts  

---

## 📦 Folders Scanned

- User Desktop (`%USERPROFILE%\Desktop`)
- Public Desktop (`%PUBLIC%\Desktop`)
- User and global Start Menu
- Quick Launch bar
- Documents, Downloads, Links, Favorites

---

## ▶️ Running the `.ps1` Script

To run the PowerShell script:

1. Download **PulisciCollegamentiGUI.ps1**  
2. Right-click it and select **Run with PowerShell**  
3. Or open PowerShell and run:

~~~powershell
.\PulisciCollegamentiGUI.ps1
~~~

---

## 🛠️ Generating a `.exe` with `ps2exe`

### 1. Install `ps2exe` (only once)

~~~powershell
Install-Module -Name ps2exe -Scope CurrentUser
~~~

If prompted, type **Y** (or **A**) to confirm.

### 2. Convert the script to `.exe`

~~~powershell
Invoke-PS2EXE -InputFile "PulisciCollegamentiGUI.ps1" -OutputFile "PulisciCollegamenti.exe"
~~~

### 3. (Optional) Add a custom icon

If you have an `.ico` file (e.g., `PuliziaCollegamenti.ico`), you can include it:

~~~powershell
Invoke-PS2EXE -InputFile "PulisciCollegamentiGUI.ps1" -OutputFile "PulisciCollegamenti.exe" -icon "PuliziaCollegamenti.ico"
~~~

---

## 💡 Notes

- The generated `.exe` is fully **portable** and **does not require** PowerShell to be installed on the target machine.
- The script ignores special system shortcuts (e.g., Control Panel, Run).

---

## 📄 License

This project is released under the **MIT License**.  
You can freely use, modify, and distribute it.

---

## 👤 Author

Developed by **[Your Name Here]** – if you find it useful, please leave a ⭐ on GitHub!
