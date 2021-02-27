# atcoder-cpp-template

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

競プロ ( 主に Atcoder ) を C++ で取り組むためのテンプレート及び環境.  
利用環境としては, 設定済みの拡張機能(補完, スニペット)の利用や統合ターミナルを用いてコードテスト/提出コマンドを素早く実行できる, VSCodeの利用推奨.

## テンプレだけコピペで利用したい

template.cppをコピペして利用.

## 環境

- Python : 3.x

## 事前準備

C++コンパイル/フォーマット用ライブラリのインストール, ojツールのインストールが必要.

Ubuntu

``` bash
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y make gdb build-essential clang-format gfortran libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev

# install cui tool for atcoder
pip install online-judge-tools

# restart shell
exec $SHELL -l

# login
oj login https://atcoder.jp/
```

Mac

``` bash
brew update && brew upgrade
brew install gcc

# use gcc installed by brew
sudo ln -sf $(ls -d /usr/local/bin/* | grep "/g++-" | sort -r | head -n1) /usr/local/bin/g++
sudo ln -sf $(ls -d /usr/local/bin/* | grep "/gcc-" | sort -r | head -n1) /usr/local/bin/gcc

# for include <bits/stdc++.h>  
sudo mkdir -p /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/bits
cd /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1/bits
sudo wget https://gist.githubusercontent.com/reza-ryte-club/97c39f35dab0c45a5d924dd9e50c445f/raw/47ecad34033f986b0972cdbf4636e22f838a1313/stdc++.h stdc++.h

# install cui tool for atcoder
pip install online-judge-tools

# restart shell
exec $SHELL -l

# login
oj login https://atcoder.jp/
```

### online-judge-tools

[@kmyk] (https://github.com/kmyk)作成ツール.
ojコマンドを利用して典型作業を自動化する.
以降ojツールと呼ぶ.

日本語詳細ドキュメントは以下.
<https://github.com/online-judge-tools/oj/blob/master/docs/getting-started.ja.md>

後続のシェルスクリプトはこちらをベースに処理している.

### VScode Extension
推奨で出てくるものをインストールしてください.  
(`.vscode/extensions.json`に記載しているものが、推奨として掲示されるはず)

## 利用方法

本レポジトリをクローンし、src内で作業フォルダを切ってコーディング.  
VScodeでプロジェクトを開くと、テンプレ生成や補完等々便利な機能が利用可能.

### スニペットによるテンプレ生成

`cpp_template` とVScode上で入力することで、スニペットによるテンプレ作成が可能.  
実際の入力時には、最初の2, 3文字を入力をすると候補が表示されるのでその中から選択可能.  
(表示されない場合には、Crtl + Space. Macの場合, Spotlightとショートカットが競合しないよう要調整.)

### 自動整形

VScodeでコーディングしていると, cppの保存時に自動整形が走る.  
自動整形が上手く走らない場合は、画面のリロードやVScode拡張のclang-formatの無効化を試す.

### ビルド確認

VScode上で `Ctrl + Shift + B` でビルドエラーが起きていないか確認可能.  
MacとUbuntu用のビルド設定が候補として表示されるので、適切なものを選択してビルド実行.  
ビルドオプションを固定させたいときは、`tasks.json`内で固定したいtasks配列要素に以下を追加.

``` json
"group": {
    "kind": "build",
    "isDefault": true
},
```

### サンプルケースのテスト

問題のurlが`https://atcoder.jp/contests/abc{xxx}/tasks/abc{xxx}_{a}`のようなパターンである場合、  
シェルスクリプトでサンプルケースによるテストが簡易に実行可能.  
( `{xxx}`、`{a}`はブラウザで解いている問題のurlを目検参照.)  
プロジェクトルートでシェルスクリプト実行によりテスト可能.  
以下は、  
ソースが`src/abc/139/1.cpp`,  
問題のurlが [<https://atcoder.jp/contests/abc139/tasks/abc139_b>]  
の場合にテストを実行するときのコマンド.  
※ urlのパターンが上記に当てはまらない場合、素のojコマンドで代用.

``` bash
./tools/atcoder-test.sh src/abc/139/1.cpp abc139 b
```

### コードの提出

問題のurlが`https://atcoder.jp/contests/abc{xxx}/tasks/abc{xxx}_{a}`のようなパターンである場合、  
シェルスクリプトでコード提出が簡易に実行可能.  
( `{xxx}`、`{a}`はブラウザで解いている問題のurlを目検参照.)  
プロジェクトルートでシェルスクリプト実行によりテスト可能.  
以下は、  
ソースが`src/abc/139/1.cpp`,  
問題のurlが [<https://atcoder.jp/contests/abc139/tasks/abc139_b>]  
の場合にテストを実行するときのコマンド.  
※ urlのパターンが上記に当てはまらない場合、素のojコマンドで代用.

``` bash
./tools/atcoder-submit.sh src/abc/139/1.cpp abc139 b

# wslで実行する場合、ojの仕様でwebブラウザで提出画面を開く挙動が実現されない.
# 以下のようにコマンドオプション(win)をつけて実行することで、webブラウザで提出画面を開くようにできる.
./tools/atcoder-submit.sh src/abc/139/1.cpp abc139 b win

```

## Docker

wait for update

## 参考

- <https://github.com/online-judge-tools/oj>
- <https://github.com/kurokoji/.cpp-Template>
