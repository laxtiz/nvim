@ECHO off

nvim -c "au User PackerCompileDone :qall" -c "lua require('plugins').sync()"
