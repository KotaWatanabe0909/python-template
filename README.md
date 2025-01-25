# python-template
Pythonプロジェクト用のテンプレートリポジトリ

## ファイル構成

```
.
├── .github
│   └── workflows
│       └── lint-and-test.yaml
├── src
│   ├── __init__.py
│   └── sample.py
├── tests
│   ├── __init__.py
│   └── test_sample.py
├── .gitignore
├── README.md
├── pyproject.toml
├── requirements-dev.txt
└── requirements.txt
```

## lint-and-test.yaml

GitHub Actions でテスト&lintを実行するための設定ファイル。

必要に応じて下記を変更してください。

- Pythonのバージョン (デフォルトは3.11)

```yaml
...
      - name: Set up Python
        uses: actions/setup-python@v5
        with:
          python-version: 3.11
...
```

- requirements のパス (デフォルトは `requirements-dev.txt`)

```yaml
...
      - name: Install dependencies
        run: uv pip install -r requirements-dev.txt --system
...
```

> [!IMPORTANT]
> requirementsには pytest や pysen を実行するのに必要なパッケージを記述しておくこと (本テンプレートの `requirements-dev.txt` には記述済み)

- GitHub Actions のトリガー (デフォルトは mainに対する Push と Pull Request)

```yaml
...
on:
  pull_request:
  push:
    branches:
      - main
...
```

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

### lint

```bash
pysen run lint
```

> [!IMPORTANT]
> Gitで追跡されていないファイルはpysenのチェック対象外となるため、`git add` でステージングしてから実行してください。

### 自動フォーマット

```bash
pysen run format
```
