# AGENTS.md

常に日本語でコミュニケーションを行ってください。すべての文章、コメント、エラーメッセージ、ユーザーとのやり取りは日本語で行ってください。

## プロジェクト概要

芝浦工業大学のサークル「デジクリ」の新入生向けサイト（<https://digicre.net/welcome/>）。Hugo による静的サイトジェネレーターを使用し、GitHub Pages でホスティングされている。

## 開発コマンド

### セットアップ

```bash
npm i
```

### 開発

```bash
# サイトをプレビュー（開発サーバー起動）
npm run preview

# 開発環境用ビルド（hugo -e development と同じ）
npm run dev

# 本番用ビルド（minify 有効）
npm run build

# コード整形（Prettier + HTML 末尾空行削除）
npm run format
```

## コード整形について

`format.sh` は以下を実行する：

- Prettier によるコード整形（CSS, HTML, Markdown, SCSS, SVG, YAML）
- HTML ファイル末尾の空行削除（`public/` ディレクトリを除く）

## プロジェクト構造

### Hugo テンプレートアーキテクチャ

- **baseof.html**: すべてのページの基本テンプレート
  - ヘッダー（ハンバーガーメニュー付き）
  - メインコンテンツエリア
  - フッター
  - 目次とリンクは `config/hugo.yml` の `menu` セクションから生成
- **home.html**: トップページのレイアウト
  - PV（プロモーションビデオ）セクション
  - `content/` 以下のセクションを重み順に表示
  - セクションごとのパーシャルテンプレートを `layouts/partials/home/` から読み込み
- **セクション別パーシャル**: `layouts/partials/home/` に配置
  - `about-us.html`, `event.html`, `faq.html`, `join-us.html`, `pv.html`, `teams.html`

### コンテンツ管理

- **テキスト**: `content/` 以下の Markdown ファイル
  - 各セクション（about-us, event, faq, join-us, teams）はディレクトリ単位で管理
  - FAQ は個別の Markdown ファイルで管理
- **画像**: `assets/img/` 以下に配置
- **スタイル**: `assets/scss/` 以下に SCSS ファイルを配置（Hugo Pipes で処理）
- **JavaScript**: `assets/js/` 以下に配置
  - `index.js`: 共通スクリプト（Google Fonts の遅延読み込み等）
  - `home.js`: ホームページ専用スクリプト（ScrollReveal 等）

### Hugo 設定

`config/_default/hugo.yml` で以下を管理：

- **menu.links**: 外部リンク（Twitter, YouTube, LINE, ウェブサイト等）
- **menu.pv**: YouTube 動画 ID（プロモーションビデオ）
- **menu.event**: Google Calendar ID（新歓イベント日程）
- **menu.teams**: 班の一覧とリンク
- **menu.join-us**: 入部受付フォームの URL

URL を変更する際は、プロジェクト全体で一括置換を推奨。

## デプロイメント

- **トリガー**: `master` ブランチへの push または手動実行（workflow_dispatch）
- **プロセス**:
  1. Hugo セットアップ（extended version）
  2. Node.js セットアップ
  3. npm 依存関係インストール
  4. コード整形実行
  5. 本番ビルド実行
  6. `public/` ディレクトリを `gh-pages` ブランチへデプロイ
- **ワークフロー**: [.github/workflows/publish.yml](.github/workflows/publish.yml)

## 依存関係の更新

Renovate により年 1 回（毎年 1 月 1 日）自動更新される：

- npm パッケージ（Prettier, プラグイン等）
- GitHub Actions のバージョン（SHA ピン留め付き）

設定: [renovate.json](renovate.json)

## コードレビュー方針

以下のプレフィックスを使用：

- `[must]` - 必須修正項目（セキュリティ、バグ、重大な設計問題）
- `[recommend]` - 推奨修正項目（パフォーマンス、可読性の大幅改善）
- `[nits]` - 軽微な指摘（コードスタイル、タイポ等）

重点チェック項目：

- セキュリティ（XSS, インジェクション攻撃等）
- パフォーマンス
- 可読性と保守性
- 言語固有のベストプラクティス（非推奨 API の使用チェック）
