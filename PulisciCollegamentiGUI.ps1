Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Finestra principale
$form = New-Object System.Windows.Forms.Form
$form.Text = "Pulizia Collegamenti Orfani"
$form.Size = New-Object System.Drawing.Size(700, 500)
$form.StartPosition = "CenterScreen"

# Lista collegamenti trovati
$listBox = New-Object System.Windows.Forms.CheckedListBox
$listBox.Size = New-Object System.Drawing.Size(650, 250)
$listBox.Location = New-Object System.Drawing.Point(20, 20)

# Bottone Scansiona
$btnScan = New-Object System.Windows.Forms.Button
$btnScan.Text = "Scansiona"
$btnScan.Size = New-Object System.Drawing.Size(100, 30)
$btnScan.Location = New-Object System.Drawing.Point(20, 290)

# Bottone Elimina
$btnDelete = New-Object System.Windows.Forms.Button
$btnDelete.Text = "Elimina selezionati"
$btnDelete.Size = New-Object System.Drawing.Size(150, 30)
$btnDelete.Location = New-Object System.Drawing.Point(140, 290)

# Area log
$txtLog = New-Object System.Windows.Forms.TextBox
$txtLog.Multiline = $true
$txtLog.ReadOnly = $true
$txtLog.ScrollBars = "Vertical"
$txtLog.Size = New-Object System.Drawing.Size(650, 100)
$txtLog.Location = New-Object System.Drawing.Point(20, 340)

# Aggiungi controlli alla finestra
$form.Controls.AddRange(@($listBox, $btnScan, $btnDelete, $txtLog))

# Funzione log
function Add-Log($text) {
    $txtLog.AppendText("[$(Get-Date -Format 'HH:mm:ss')] $text`r`n")
}

# Percorsi da scandire
$percorsi = @(
    "$env:USERPROFILE\Desktop",
    "$env:PUBLIC\Desktop",
    "$env:APPDATA\Microsoft\Windows\Start Menu",
    "$env:ProgramData\Microsoft\Windows\Start Menu",
    "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch",
    "$env:USERPROFILE\Links",
    "$env:USERPROFILE\Downloads",
    "$env:USERPROFILE\Documents"
)

# Azione bottone Scansiona
$btnScan.Add_Click({
    $listBox.Items.Clear()
    Add-Log "Inizio scansione..."

    foreach ($percorso in $percorsi) {
        if (Test-Path $percorso) {
            $collegamenti = Get-ChildItem -Path $percorso -Recurse -Filter *.lnk -ErrorAction SilentlyContinue

            foreach ($collegamento in $collegamenti) {
                $shell = New-Object -ComObject WScript.Shell
                $scorciatoia = $shell.CreateShortcut($collegamento.FullName)
                $target = $scorciatoia.TargetPath

                if (![string]::IsNullOrWhiteSpace($target) -and -not $target.StartsWith("::") -and -not (Test-Path $target)) {
                    $listBox.Items.Add($collegamento.FullName)
                }
            }
        }
    }

    Add-Log "Scansione completata. Trovati $($listBox.Items.Count) collegamenti orfani."
})

# Azione bottone Elimina
$btnDelete.Add_Click({
    $selezionati = $listBox.CheckedItems

    if ($selezionati.Count -eq 0) {
        Add-Log "Nessun collegamento selezionato per l'eliminazione."
        return
    }

    foreach ($item in $selezionati) {
        try {
            Remove-Item -Path $item -Force
            Add-Log "✅ Eliminato: $item"
        } catch {
            Add-Log ("❌ Errore eliminando {0}: {1}" -f $item, $_)
        }
    }

    # Rimuovi quelli eliminati dalla lista
    for ($i = $listBox.Items.Count - 1; $i -ge 0; $i--) {
        if ($listBox.GetItemChecked($i)) {
            $listBox.Items.RemoveAt($i)
        }
    }
})

# Avvia la GUI
[void]$form.ShowDialog()
