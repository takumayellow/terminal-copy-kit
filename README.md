# VS Code Terminal Copy Helpers

日本語での使い方と英語での概要をまとめています。VS Code のターミナルから直前のコマンド出力を即座にコピーできるようにする最小構成のワークスペースです。

## 構成ファイル

- `.vscode/keybindings.json` — ターミナル上で `Alt+C` などのショートカットを割り当て。
- `.vscode/settings.json` — ショートカットがシェルに届かないようにするための端末設定。 Altキーでメニューバーにフォーカスしないよう `window.customMenuBarAltFocus` も false にしています。
- `.vscode/extensions.json` — 必須拡張機能（ArturoDent.repeat-commands）のインストール推奨。
- `scripts/setup.ps1` — Windows/PowerShell で拡張機能を自動インストールする補助スクリプト。

## 事前準備

1. VS Code がインストールされていることを確認。
2. 拡張機能 `ArturoDent.repeat-commands` をインストール。
   - VS Code の拡張機能ビューから手動で検索してもよいです。
   - またはターミナルで `pwsh scripts/setup.ps1` を実行。

## 使い方

1. このフォルダを VS Code で開く（例: `code .`）。
2. VS Code 内で新しいターミナルを開く（ショートカット: Ctrl+Shift+`）。
3. 任意のコマンドを実行したあと、以下のショートカットでコピー:
   - `Alt+C`: 直前のコマンド出力のみをコピー。
   - `Alt+V`: 直前のコマンドとその出力をまとめてコピー。
   - `Ctrl+Alt+C`: 1 コマンド分さかのぼって選択しコピー（出力が長い場合に便利）。
   - `Ctrl+Alt+Y`: コピーしたい区間の行数を聞かれるので、数値を入力してコピー。

## 仕組みの概略

- `Alt+C` / `Alt+V` は VS Code 標準コマンドをそのまま利用しています。
- `Ctrl+Alt+C` と `Ctrl+Alt+Y` は `repeat-commands` 拡張機能で一連の選択・コピー操作を自動化しています。
- `.vscode/settings.json` でこれらのコマンドがシェルに送られないようにブロックしています。 Altキーでメニューバーにフォーカスしないよう `window.customMenuBarAltFocus` も false にしています。

## GitHub への公開手順（手動）

この環境では認証情報にアクセスできないため、GitHub への実際の作成・プッシュはユーザー自身で行ってください。以下は例です。

```bash
# 初回のみ
cd /mnt/c/Users/takum/Downloads/terminal_copy
git init
git add .
git commit -m "Add VS Code terminal copy helpers"

# GitHub 上で空のリポジトリ (例: terminal-copy-kit) を作成後
# HTTPS
# git remote add origin https://github.com/<your-account>/terminal-copy-kit.git
# SSH
# git remote add origin git@github.com:<your-account>/terminal-copy-kit.git

git push -u origin main
```

---

## English Summary

A tiny VS Code workspace that wires shortcuts (`Alt+C`, `Alt+V`, `Ctrl+Alt+C`, `Ctrl+Alt+Y`) to copy the previous terminal command output. Install the `ArturoDent.repeat-commands` extension, open the folder in VS Code, run commands, and trigger the shortcuts to grab the output. Use `scripts/setup.ps1` if you want to automate the extension installation. Starting with VS Code 1.94+, `window.customMenuBarAltFocus` also has to be disabled so Windows no longer steals `Alt` keystrokes from these shortcuts, and the workspace settings do that automatically.


