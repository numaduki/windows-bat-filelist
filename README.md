# 指定したディレクトリのファイル一覧をテキストファイルに保存するbatファイル

同様のフリーソフトは検索すれば出てきますが、なぜかUnicodeファイルパスに対応していない（Unicodeのファイル名が正しく記録されない）ものがほとんどだったので、対応したものを作りました。

## 例

batファイルの以下の部分を編集します。

``` bat
rem ここから
set target_dir_path=C:\Foobar\*
set list_file_name=filelist
cmd /u /c dir "%target_dir_path%*" /S /B /A-d > "%list_file_name%-%timestamp%.txt"
rem ここまで
```

2行目の C:\Foobar を、一覧を取得したいディレクトリ名、3行目の filelist を、好きなファイル名に変更してください。  
他の行は変更する必要はありません。

出力ファイル名の後ろには、年月日と時分秒がつきます。  
2020年11月22日午前3時4分56秒に実行した場合、filelist.bat と同じディレクトリに「filelist-20201122-030456.txt」というファイルが生成されます。

ファイル一覧にUnicode文字が含まれる場合、出力ファイルの文字コードはUTF-16になります。

## 例2

複数のディレクトリを処理したい場合、「rem ここから」から「rem ここまで」の行を繰り返し書けます。  
例えば`C:\Foobar、D:\Hogepiyo`、`Z:\Eeny\meeny\miny\moe`の3つのディレクトリを処理したいなら

``` bat
rem ここから
set target_dir_path=C:\Foobar\*
set list_file_name=c_foobar
cmd /u /c dir "%target_dir_path%*" /S /B /A-d > "%list_file_name%-%timestamp%.txt"
rem ここまで

rem ここから
set target_dir_path=D:\Hogepiyo\*
set list_file_name=d_hogepiyo
cmd /u /c dir "%target_dir_path%*" /S /B /A-d > "%list_file_name%-%timestamp%.txt"
rem ここまで

rem ここから
set target_dir_path=Z:\Eeny\meeny\miny\moe\*
set list_file_name=z_eeny_meeny_miny_moe
cmd /u /c dir "%target_dir_path%*" /S /B /A-d > "%list_file_name%-%timestamp%.txt"
rem ここまで
```

という感じ。  
ファイルは同じ場所に生成されるので、出力ファイル名は別々にしてください。

## カスタマイズの参考になりそうなページ

Cmd - DOS コマンド一覧 - Programming Field  
https://www.pg-fl.jp/program/dos/doscmd/cmd.htm

Dir - DOS コマンド一覧 - Programming Field  
https://www.pg-fl.jp/program/dos/doscmd/dir.htm
