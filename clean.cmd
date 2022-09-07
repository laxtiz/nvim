@ECHO off

set HERE=%~0dp

del /s /q %HERE%\plugin\packer_compiled.lua
del /s /q %LOCALAPPDATA%\nvim-data
del /s /q %TEMP%\nvim
