@echo off

cd "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\"
call VsDevCmd.bat

cd "%~dp0"

call Clean-Nuget.cmd

dotnet restore src\BundlerMinifierVsix\
dotnet pack -c Release .\src\BundlerMinifier\BundlerMinifier.csproj
