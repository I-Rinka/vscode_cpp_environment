# vscode_cpp_environment
A .vscode directory for users to compile and debug their cpp code in vscode.

# 使用

你可以尝试使用
```
ln ./vscode_cpp_environment/.vscode/*  项目路径/.vscode/ 
```
将本项目提供的开发环境和现有环境进行连接，方便进行同步更改调试。

## MSVC配置

由于MSVC的特殊性，使用MSVC编译调试的话，需要一些特殊的环境变量，因此无法很方便的直接打开目录后debug。

有以下两种方法配置MSVC的环境变量:

注意，以下涉及到的`*.ps1`脚本需要在开头的`$VS_Install_Path`处赋值你自己的VS安装路径。

比如我使用最小安装的MSVC的路径在`"C:\Program Files (x86)\Microsoft Visual Studio\2019\BuildTools"`

而其他使用Visual Studio Community的路径一般在`"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community"`

请根据自己的安装路径更改设置。

### 方法一

* 更新`Using_MSVC_Env.ps1`中的VS安装路径`$VS_Install_Path`
* 在终端运行脚本`Using_MSVC_Env.ps1`这个脚本会新打开一个有着MSVC所需环境变量的vscode窗口
* 在新打开的vscode窗口中重新打开你要使用MSVC编译的工作区
  * 注：如果此时你的MSVC工作区是已经打开的，则你还需要手动关闭MSVC工作区，再重新在新的vscode窗口中打开使用MSVC的工作区
* 使用`MSVC Default Env`运行编译，调试

### 方法二
* 更新`Update_MSVC_Env.ps1`中的VS安装路径`$VS_Install_Path`
* 在终端运行`Update_MSVC_Env.ps1`
* 工作区根目录会生成文件`MSVC-env.json`
* 将`MSVC-env.json`中的内容拷贝到`.vscode\tasks.json`中的有`"label": "cl.exe build active file"`标记处的`//将MSVC需要的环境拷到这里 "options": { "env": {  } }`中，需要复制的地方已用注释标注
* 使用使用`MSVC Debug`运行编译，调试

比如我的配置:
``` json
        {
            "type": "shell",
            "label": "cl.exe build active file",
            "command": "cl.exe",
            "args": [
                "/Zi",
                "/EHsc",
                "/Fe:",
                "${fileDirname}\\${fileBasenameNoExtension}.exe",
                "${file}"
            ],
            "problemMatcher": [
                "$msCompile"
            ],
            "group": {
                "kind": "build",
                "isDefault": true
            },
            //将MSVC需要的环境拷到这里
            "options": {
                "env": {
                    "OneDriveConsumer": "C:\\Users\\Rinka\\OneDrive",
                    "ProgramFiles(x86)": "C:\\Program Files (x86)",
                    "Path": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\bin\\HostX86\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\VC\\VCPackages;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TestWindow;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TeamFoundation\\Team Explorer;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\MSBuild\\Current\\bin\\Roslyn;C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.18362.0\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\\\MSBuild\\Current\\Bin;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\Tools\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\bin\\HostX86\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\VC\\VCPackages;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TestWindow;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TeamFoundation\\Team Explorer;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\MSBuild\\Current\\bin\\Roslyn;C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.18362.0\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\\\MSBuild\\Current\\Bin;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\Tools\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\bin\\HostX86\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\VC\\VCPackages;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TestWindow;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TeamFoundation\\Team Explorer;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\MSBuild\\Current\\bin\\Roslyn;C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.18362.0\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\\\MSBuild\\Current\\Bin;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\Tools\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\bin\\HostX86\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\VC\\VCPackages;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TestWindow;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\CommonExtensions\\Microsoft\\TeamFoundation\\Team Explorer;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\MSBuild\\Current\\bin\\Roslyn;C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.18362.0\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\bin\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\\\MSBuild\\Current\\Bin;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\Tools\\;C:\\WINDOWS\\system32;C:\\WINDOWS;C:\\WINDOWS\\System32\\Wbem;C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\;C:\\WINDOWS\\System32\\OpenSSH\\;C:\\Program Files\\Git\\cmd;C:\\Program Files\\dotnet\\;C:\\ProgramData\\chocolatey\\bin;C:\\ProgramData\\chocolatey\\lib\\gsudo\\bin\\;C:\\Program Files\\Microsoft SQL Server\\Client SDK\\ODBC\\170\\Tools\\Binn\\;C:\\Program Files\\nodejs\\;C:\\Users\\Rinka\\scoop\\shims;C:\\Users\\Rinka\\AppData\\Local\\Microsoft\\WindowsApps;C:\\Program Files\\Bandizip\\;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Fiddler;C:\\Users\\Rinka\\AppData\\Roaming\\npm;C:\\Users\\Rinka\\.dotnet\\tools;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Microsoft VS Code\\bin;C:\\WINDOWS\\system32;C:\\WINDOWS;C:\\WINDOWS\\System32\\Wbem;C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\;C:\\WINDOWS\\System32\\OpenSSH\\;C:\\Program Files\\Git\\cmd;C:\\Program Files\\dotnet\\;C:\\ProgramData\\chocolatey\\bin;C:\\ProgramData\\chocolatey\\lib\\gsudo\\bin\\;C:\\Program Files\\Microsoft SQL Server\\Client SDK\\ODBC\\170\\Tools\\Binn\\;C:\\Program Files\\nodejs\\;C:\\Users\\Rinka\\scoop\\shims;C:\\Users\\Rinka\\AppData\\Local\\Microsoft\\WindowsApps;C:\\Program Files\\Bandizip\\;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Fiddler;C:\\Users\\Rinka\\AppData\\Roaming\\npm;C:\\Users\\Rinka\\.dotnet\\tools;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Microsoft VS Code\\bin",
                    "ProgramW6432": "C:\\Program Files",
                    "NETFXSDKDir": "C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\",
                    "ChocolateyInstall": "C:\\ProgramData\\chocolatey",
                    "PROCESSOR_IDENTIFIER": "Intel64 Family 6 Model 126 Stepping 5, GenuineIntel",
                    "VCToolsRedistDir": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Redist\\MSVC\\14.28.29325\\",
                    "TMP": "C:\\Users\\Rinka\\AppData\\Local\\Temp",
                    "PROCESSOR_ARCHITECTURE": "AMD64",
                    "DriverData": "C:\\Windows\\System32\\Drivers\\DriverData",
                    "PATHEXT": ".COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.CPL",
                    "VSINSTALLDIR": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\",
                    "WindowsSdkVerBinPath": "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\10.0.18362.0\\",
                    "PROCESSOR_REVISION": "7e05",
                    "UniversalCRTSdkDir": "C:\\Program Files (x86)\\Windows Kits\\10\\",
                    "__DOTNET_PREFERRED_BITNESS": "32",
                    "VSCODE_GIT_IPC_HANDLE": "\\\\.\\pipe\\vscode-git-e7fe63f6f9-sock",
                    "Framework40Version": "v4.0",
                    "VSCODE_GIT_ASKPASS_MAIN": "c:\\Users\\Rinka\\AppData\\Local\\Programs\\Microsoft VS Code\\resources\\app\\extensions\\git\\dist\\askpass-main.js",
                    "CommonProgramFiles": "C:\\Program Files\\Common Files",
                    "WindowsSDK_ExecutablePath_x86": "C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\",
                    "ChocolateyLastPathUpdate": "132524061654595195",
                    "FPS_BROWSER_APP_PROFILE_STRING": "Internet Explorer",
                    "FPS_BROWSER_USER_PROFILE_STRING": "Default",
                    "LOGONSERVER": "\\\\SURFACE-NANA",
                    "TEMP": "C:\\Users\\Rinka\\AppData\\Local\\Temp",
                    "WindowsSdkDir": "C:\\Program Files (x86)\\Windows Kits\\10\\",
                    "USERNAME": "Rinka",
                    "SystemRoot": "C:\\WINDOWS",
                    "DevEnvDir": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\",
                    "CHROME_CRASHPAD_PIPE_NAME": "\\\\.\\pipe\\crashpad_9616_SRQNTDJMDFSQVDLS",
                    "VCIDEInstallDir": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\IDE\\VC\\",
                    "WindowsSDK_ExecutablePath_x64": "C:\\Program Files (x86)\\Microsoft SDKs\\Windows\\v10.0A\\bin\\NETFX 4.8 Tools\\x64\\",
                    "VSCODE_GIT_ASKPASS_NODE": "C:\\Users\\Rinka\\AppData\\Local\\Programs\\Microsoft VS Code\\Code.exe",
                    "VSCMD_ARG_HOST_ARCH": "x86",
                    "OneDrive": "C:\\Users\\Rinka\\OneDrive",
                    "VCToolsVersion": "14.28.29333",
                    "INCLUDE": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\include;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\winrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\cppwinrt;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\include;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\winrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\cppwinrt;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\include;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\winrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\cppwinrt;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\include;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\include\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\ucrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\shared;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\um;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\winrt;C:\\Program Files (x86)\\Windows Kits\\10\\include\\10.0.18362.0\\cppwinrt",
                    "FrameworkDir32": "C:\\Windows\\Microsoft.NET\\Framework\\",
                    "WindowsLibPath": "C:\\Program Files (x86)\\Windows Kits\\10\\UnionMetadata\\10.0.18362.0;C:\\Program Files (x86)\\Windows Kits\\10\\References\\10.0.18362.0",
                    "FrameworkVersion": "v4.0.30319",
                    "VSCMD_ARG_app_plat": "Desktop",
                    "ProgramData": "C:\\ProgramData",
                    "LANG": "zh_CN.UTF-8",
                    "GIT_ASKPASS": "c:\\Users\\Rinka\\AppData\\Local\\Programs\\Microsoft VS Code\\resources\\app\\extensions\\git\\dist\\askpass.sh",
                    "HOMEPATH": "\\Users\\Rinka",
                    "COMPUTERNAME": "SURFACE-NANA",
                    "WindowsSdkBinPath": "C:\\Program Files (x86)\\Windows Kits\\10\\bin\\",
                    "FrameworkVersion32": "v4.0.30319",
                    "ALLUSERSPROFILE": "C:\\ProgramData",
                    "CommonProgramW6432": "C:\\Program Files\\Common Files",
                    "VCToolsInstallDir": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\",
                    "VCINSTALLDIR": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\",
                    "VS160COMNTOOLS": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\Tools\\",
                    "ExtensionSdkDir": "C:\\Program Files (x86)\\Microsoft SDKs\\Windows Kits\\10\\ExtensionSDKs",
                    "__VSCMD_PREINIT_VS160COMNTOOLS": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\Common7\\Tools\\",
                    "LIBPATH": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86\\store\\references;C:\\Program Files (x86)\\Windows Kits\\10\\UnionMetadata\\10.0.18362.0;C:\\Program Files (x86)\\Windows Kits\\10\\References\\10.0.18362.0;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86\\store\\references;C:\\Program Files (x86)\\Windows Kits\\10\\UnionMetadata\\10.0.18362.0;C:\\Program Files (x86)\\Windows Kits\\10\\References\\10.0.18362.0;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86\\store\\references;C:\\Program Files (x86)\\Windows Kits\\10\\UnionMetadata\\10.0.18362.0;C:\\Program Files (x86)\\Windows Kits\\10\\References\\10.0.18362.0;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86\\store\\references;C:\\Program Files (x86)\\Windows Kits\\10\\UnionMetadata\\10.0.18362.0;C:\\Program Files (x86)\\Windows Kits\\10\\References\\10.0.18362.0;C:\\Windows\\Microsoft.NET\\Framework\\v4.0.30319",
                    "SESSIONNAME": "Console",
                    "UCRTVersion": "10.0.18362.0",
                    "TERM_PROGRAM": "vscode",
                    "CommonProgramFiles(x86)": "C:\\Program Files (x86)\\Common Files",
                    "HOMEDRIVE": "C:",
                    "windir": "C:\\WINDOWS",
                    "SystemDrive": "C:",
                    "NUMBER_OF_PROCESSORS": "8",
                    "OS": "Windows_NT",
                    "__DOTNET_ADD_32BIT": "1",
                    "CommandPromptType": "Native",
                    "ComSpec": "C:\\WINDOWS\\system32\\cmd.exe",
                    "ORIGINAL_XDG_CURRENT_DESKTOP": "undefined",
                    "ProgramFiles": "C:\\Program Files",
                    "HOME": "C:\\Users\\Rinka",
                    "PSModulePath": "C:\\Users\\Rinka\\Documents\\WindowsPowerShell\\Modules;C:\\Program Files\\WindowsPowerShell\\Modules;C:\\WINDOWS\\system32\\WindowsPowerShell\\v1.0\\Modules",
                    "WindowsSDKLibVersion": "10.0.18362.0\\",
                    "LIB": "C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\lib\\um\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\ucrt\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\um\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\lib\\um\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\ucrt\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\um\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\lib\\um\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\ucrt\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\um\\x86;C:\\Program Files (x86)\\Microsoft Visual Studio\\2019\\BuildTools\\VC\\Tools\\MSVC\\14.28.29333\\lib\\x86;C:\\Program Files (x86)\\Windows Kits\\NETFXSDK\\4.8\\lib\\um\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\ucrt\\x86;C:\\Program Files (x86)\\Windows Kits\\10\\lib\\10.0.18362.0\\um\\x86",
                    "PROMPT": "$P$G",
                    "COLORTERM": "truecolor",
                    "ChocolateyToolsLocation": "C:\\tools",
                    "APPDATA": "C:\\Users\\Rinka\\AppData\\Roaming",
                    "USERDOMAIN": "SURFACE-NANA",
                    "PROCESSOR_LEVEL": "6",
                    "USERPROFILE": "C:\\Users\\Rinka",
                    "LOCALAPPDATA": "C:\\Users\\Rinka\\AppData\\Local",
                    "VisualStudioVersion": "16.0",
                    "WindowsSDKVersion": "10.0.18362.0\\",
                    "VSCMD_VER": "16.8.3",
                    "TERM_PROGRAM_VERSION": "1.52.1",
                    "__VSCMD_PREINIT_PATH": "C:\\WINDOWS\\system32;C:\\WINDOWS;C:\\WINDOWS\\System32\\Wbem;C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\;C:\\WINDOWS\\System32\\OpenSSH\\;C:\\Program Files\\Git\\cmd;C:\\Program Files\\dotnet\\;C:\\ProgramData\\chocolatey\\bin;C:\\ProgramData\\chocolatey\\lib\\gsudo\\bin\\;C:\\Program Files\\Microsoft SQL Server\\Client SDK\\ODBC\\170\\Tools\\Binn\\;C:\\Program Files\\nodejs\\;C:\\Users\\Rinka\\scoop\\shims;C:\\Users\\Rinka\\AppData\\Local\\Microsoft\\WindowsApps;C:\\Program Files\\Bandizip\\;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Fiddler;C:\\Users\\Rinka\\AppData\\Roaming\\npm;C:\\Users\\Rinka\\.dotnet\\tools;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Microsoft VS Code\\bin;C:\\WINDOWS\\system32;C:\\WINDOWS;C:\\WINDOWS\\System32\\Wbem;C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\;C:\\WINDOWS\\System32\\OpenSSH\\;C:\\Program Files\\Git\\cmd;C:\\Program Files\\dotnet\\;C:\\ProgramData\\chocolatey\\bin;C:\\ProgramData\\chocolatey\\lib\\gsudo\\bin\\;C:\\Program Files\\Microsoft SQL Server\\Client SDK\\ODBC\\170\\Tools\\Binn\\;C:\\Program Files\\nodejs\\;C:\\Users\\Rinka\\scoop\\shims;C:\\Users\\Rinka\\AppData\\Local\\Microsoft\\WindowsApps;C:\\Program Files\\Bandizip\\;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Fiddler;C:\\Users\\Rinka\\AppData\\Roaming\\npm;C:\\Users\\Rinka\\.dotnet\\tools;C:\\Users\\Rinka\\AppData\\Local\\Programs\\Microsoft VS Code\\bin",
                    "USERDOMAIN_ROAMINGPROFILE": "SURFACE-NANA",
                    "FrameworkDir": "C:\\Windows\\Microsoft.NET\\Framework\\",
                    "PUBLIC": "C:\\Users\\Public",
                    "VSCMD_ARG_TGT_ARCH": "x86",
                    "__VSCMD_PREINIT_VCToolsVersion": "14.28.29333"
                }
            }
        },
```

总之，需要复制粘贴的东西有一大坨。(🤣自动化脚本写失败了罢了！powershell永远的敌人！

# 待解决问题

* 编译大工程的makefile
* 对clang/msvc编译器系列的支持