@echo off

rem このファイルの文字コードはUTF-8にすること
rem Shift_JISだと各ディレクトリパスにマルチバイト文字が入っていると正常に動作しない

rem このbatファイルの文字コードを数値で指定 UTF-8は65001
chcp 65001

rem リストファイル名に使う年月日文字列を作成
set yyyy=%date:~0,4%
set mm=%date:~5,2%
set dd=%date:~8,2%
set time2=%time: =0%
set hh=%time2:~0,2%
set mn=%time2:~3,2%
set ss=%time2:~6,2%
set timestamp=%yyyy%%mm%%dd%-%hh%%mn%%ss%

rem ここから
set target_dir_path=C:\Foobar\*
set list_file_name=filelist
cmd /u /c dir "%target_dir_path%*" /S /B /A-d > "%list_file_name%-%timestamp%.txt"
rem ここまで

