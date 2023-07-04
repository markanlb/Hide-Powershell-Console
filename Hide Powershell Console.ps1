# Hide Powershell Console.ps1, v0.2, 2023
#
# By Marcus
#
# add this code block at the beginning of your script
#==========================================
$debug = $true # if true = console is visible

$windowcode = '[DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hWnd, int nCmdShow);'
$asyncwindow = Add-Type -MemberDefinition $windowcode -name Win32ShowWindowAsync -namespace Win32Functions -PassThru
if ($debug -eq $true) {
    $null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 5) # 5 to Show console
    Write-Host "DEBUG WINDOW" -ForegroundColor Cyan
    Write-Host "Do not close this window; report any errors that appear during testing" -ForegroundColor Cyan
} else {
    $null = $asyncwindow::ShowWindowAsync((Get-Process -PID $pid).MainWindowHandle, 0) # 0 to Hide console
}
