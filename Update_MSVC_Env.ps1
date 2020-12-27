#在这里输入VS的安装路径
$VS_Install_Path="C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools"

Import-Module $VS_Install_Path"\Common7\Tools\Microsoft.VisualStudio.DevShell.dll"
Enter-VsDevShell -VsInstallPath $VS_Install_Path

$RawString = [System.Environment]::GetEnvironmentVariables() | ConvertTo-Json
#只能用.net的方法来写了,否则在5.1下无论使用追加方法还是out-file方法输出的都是utf-16或者是带bom的utf-8
$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
[System.IO.File]::WriteAllLines(".\MSVC-env.json", $RawString, $Utf8NoBomEncoding)




# [System.IO.File]::WriteAllBytes(".\MSVC-env.json", [System.Text.Encoding]::Convert([System.Text.Encoding]::GetEncoding($SouceEncoding), [System.Text.Encoding]::GetEncoding($TargetEncoding), ));
#这个方法只有在powershell 7下才能不输出bom
# $a = Get-Content ./MSVC-env.json -Tail -4
# $a = Get-Content ./MSVC-env.json
# $a >> ./MSVC-env.json
# Get-ChildItem ./MSVC-env.json |  foreach-object { 
#     # [void][System.IO.File]::WriteAllBytes($_.FullName, [System.Text.Encoding]::Convert([System.Text.Encoding]::GetEncoding($SouceEncoding), [System.Text.Encoding]::GetEncoding($TargetEncoding), [System.IO.File]::ReadAllBytes($_.FullName)));
#     $RawString = Get-Content $_ -Tail -4 -Encoding UTF16
#     $Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False
#     [System.IO.File]::WriteAllLines($_.FullName, $RawString, $Utf8NoBomEncoding)

# }