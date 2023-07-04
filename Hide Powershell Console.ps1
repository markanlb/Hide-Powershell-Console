# Hide Powershell Console.ps1, v0.1, 2023
#
# By Marcus
#
# add this code block at the beginning of your script
#==========================================
$debug = $true # if true = console is visible

Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase
Add-Type -Name Window -Namespace Console -MemberDefinition '
    [DllImport("Kernel32.dll")]
    public static extern IntPtr GetConsoleWindow();
    
    [DllImport("user32.dll")]
    public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
function Hide-Console
{
    $console = [Console.Window]::GetConsoleWindow()
    [Console.Window]::ShowWindow($console, 0) | Out-Null
}
if ($debug -eq $false){
	Hide-Console }
