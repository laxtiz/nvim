@ECHO off

set HERE=%~dp0


del /s /q %HERE%\plugin\packer_compiled.lua
rmdir /s /q %LOCALAPPDATA%\nvim-data
rmdir /s /q %TEMP%\nvim
