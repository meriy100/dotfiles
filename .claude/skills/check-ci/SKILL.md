---
name: check-ci
description: GitHub Actions の実行結果を確認し、エラーがあれば修正計画を作成する。CI が失敗した、ワークフローのエラーを調べたい、PR のチェックを確認したいときに使用する。
---

# GitHub Actions エラー分析と修正計画

## 手順

1. 現在のブランチに関連する PR のチェック状況を確認してください

```bash
gh pr checks
```

2. 失敗しているジョブがある場合、以下のコマンドでエラー詳細を取得してください

```bash
# 失敗したワークフローの run ID を取得
gh pr checks --json name,state,link | jq '.[] | select(.state == "FAILURE")'

# ログを取得 (run ID は上記で確認)
gh run view <RUN_ID> --log-failed
```

3. ログが取得できない場合は API 経由で取得してください

```bash
# ジョブ ID を特定
gh api repos/{owner}/{repo}/actions/runs/<RUN_ID>/jobs --jq '.jobs[] | select(.conclusion == "failure") | {id: .id, name: .name, steps: [.steps[] | select(.conclusion == "failure")]}'

# ジョブログを取得
gh api repos/{owner}/{repo}/actions/jobs/<JOB_ID>/logs
```

4. エラー内容を分析し、以下の形式で修正計画を提示してください

## 出力形式

### エラー概要

- 失敗ジョブ: (ジョブ名)
- 失敗ステップ: (ステップ名)
- エラーコード: (あれば)
- エラーメッセージ: (要約)

### 原因分析

(エラーの原因を説明)

### 修正案

1. (具体的な修正手順)
2. ...

### 修正コード

(必要なコード変更を提示)
