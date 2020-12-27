#在这里输入VS的安装路径
$VS_Install_Path="C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools"

Import-Module $VS_Install_Path"\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell -VsInstallPath $VS_Install_Path

code
# code