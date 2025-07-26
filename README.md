# python-template

Pythonプロジェクト用のテンプレートリポジトリ

## ファイル構成

```
.
├── .github
│   └── workflows
│       ├── claude-review.yml
│       ├── ruff.yml
│       └── type-check.yml
├── src
│   ├── __init__.py
│   └── sample.py
├── tests
│   ├── __init__.py
│   └── test_sample.py
├── .gitignore
├── .pre-commit-config.yaml
├── README.md
├── pyproject.toml
└── uv.lock
```

## .pre-commit-config.yaml

以下のコマンドを実行することで、pre-commitの設定をインストールできます。

```bash
pre-commit install
```

## ruff.yml

GitHub Actions で ruff によるコード静的解析を実行するための設定ファイル。

必要に応じて下記を変更してください。

- Pythonのバージョン (デフォルトは3.12)
- ruffのバージョン (デフォルトは0.11.13)
- GitHub Actions のトリガー (デフォルトでは Push がトリガー)

```yaml
...
on:
  push:
...
```

## type-check.yml

GitHub Actions で ty による型チェックを実行するための設定ファイル。

必要に応じて下記を変更してください。

- Pythonのバージョン (デフォルトは3.12)
- tyのバージョン (デフォルトは0.0.1a8)
- GitHub Actions のトリガー (デフォルトでは Push がトリガー)

```yaml
...
on:
  push:
...
```

## claude-review.yml

GitHub Actions で Claude AI によるコードレビューを実行するための設定ファイル。
Pull Request 内で @claude とメンションするとレビューが実行されます。

> \[!IMPORTANT\]
>
> - AnthropicのAPIキーが必要です。GitHub Secretsに `ANTHROPIC_API_KEY` を設定してください。
> - [GitHub App](https://github.com/organizations/athenatech-jp/settings/installations/68033881)ページで、リポジトリアクセスを許可してください。

## ローカル環境でのテスト&lint実行方法

### テスト

- `tests` ディレクトリ内のすべてのテストを実行

```bash
pytest tests
```

- `test_sample.py` のみを実行

```bash
pytest tests/test_sample.py
```

### ruffによる静的解析

```bash
ruff check
```

### 自動フォーマット

```bash
ruff format
```

### tyによる型チェック

```bash
ty check
```
