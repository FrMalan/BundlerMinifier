@echo off

cd "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\"
call VsDevCmd.bat

cd "%~dp0"

call Clean.cmd

nuget restore
dotnet restore src\BundlerMinifier\
"msbuild.exe" .\src\BundlerMinifierConsole\BundlerMinifierConsole.csproj /p:configuration=Release
"msbuild.exe" .\src\BundlerMinifierVsix\BundlerMinifierVsix.csproj /p:configuration=Release /p:DeployExtension=true /p:ZipPackageCompressionLevel=normal /v:m
