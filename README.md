# <https://digicre.net/welcome/>

## 💪 使用技術

- **[Hugo](https://gohugo.io/)**：サイトに必要なページを生成します。
- **[Node.js](https://nodejs.org/)**：コードの整形（[Stylelint](https://stylelint.io/) と [Prettier](https://prettier.io/) の実行）に必要です。
- **[GitHub Actons](https://github.com/features/actions)**：本番環境（GitHub Pages）への更新作業を自動化します。
- **[GitHub Pages](https://pages.github.com/)**：サイトのホスティングに使用しています。
- **[Renovate](https://www.mend.io/renovate/)**：依存関係のアップデートを自動化します。

## 🛠️ 環境構築

> [!WARNING]
> これは **Hugo，Node.js，Git がインストール済みである場合の手順**です。それぞれのインストール手順については，公式ドキュメント等を参照してください。

1. このリポジトリを clone します。
2. Clone したリポジトリのルートディレクトリで `npm i` を実行します。

## 📝 コンテンツを編集する

- **文章**：`content/` 以下の Markdown ファイル（`.md`）を編集してください。
- **画像**：`assets/img/` 以下の当該ファイルを編集してください。
- **メニュー，カレンダー，動画の URL 等**：`config/hugo.yml` の `menu` を編集してください。
  > [!WARNING]
  > URL を修正する場合は，主要なエディターに搭載されている「ファイルを横断して一括置換する機能」の利用を推奨します。

また，編集時に役立つデバッグコマンドを用意してあります（cf. `package.json`）。

- `npm run format`：コードを整形します（`format.sh` の実行）。
- `npm run preview`：サイトの動作をプレビューできます。
- `npm run dev`：**開発環境**としてサイトをビルドします（`hugo -e development` と同じ）。
- `npm run build`：サイトをビルドします。

## 🚀 サイトを公開する

GitHub Actions を利用し，`master` ブランチが push された場合，**自動的に `master` ブランチのコードを基にサイトを生成し，`gh-pages` ブランチの内容をサイトとして公開する仕組み**となっています（cf. `.github/workflows/publish.yml`）。

## 🖌️ 依存関係をアップデートする

Stylelint や Prettier といった npm パッケージから GitHub Actions で使用している各種アクションといった依存関係のアップデートを自動化するために Renovate を使っています。

このサイトは年に数回しか更新しないと想定されるので，依存関係のアップデートを自動で確認する頻度を「**年に 1 回だけ**」と設定してあります（cf. `renovate.json`）。

## 🔗 関連リンク

Hugo の使い方は，次のサイトが分かりやすいです。

- [Hugo の公式ドキュメント](https://gohugo.io/documentation/)（英語）
- [まくまく Hugo ノート](https://maku77.github.io/hugo/)（日本語）
