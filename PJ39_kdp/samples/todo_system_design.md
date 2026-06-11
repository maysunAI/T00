# 設計書：Todoタスク管理システム v1.0

> **用途**：Claude Code + AI00フレームワークで「設計書からシステムを復元する」デモ用サンプル
> **対象DB**：PostgreSQL / MySQL（どちらでも可）
> **テーブル数**：5テーブル

---

## 1. システム概要

| 項目 | 内容 |
|------|------|
| システム名 | Todoタスク管理システム |
| バージョン | 1.0 |
| 対象ユーザー | 個人・小チーム（1〜10名） |
| 主要機能 | タスク管理・カテゴリ分類・タグ付け・ユーザー認証 |

---

## 2. ER図（テキスト形式）

```
users ─────────< todos >────────── categories
                  │
                  └────────< todo_tags >─── tags
```

---

## 3. テーブル定義

### 3.1 users（ユーザー）

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|------|------|
| id | BIGINT | PK, AUTO_INCREMENT | ユーザーID |
| email | VARCHAR(255) | UNIQUE, NOT NULL | メールアドレス（ログインID） |
| password_hash | VARCHAR(255) | NOT NULL | bcryptハッシュ済みパスワード |
| display_name | VARCHAR(100) | NOT NULL | 表示名 |
| created_at | TIMESTAMP | DEFAULT NOW() | 登録日時 |
| updated_at | TIMESTAMP | DEFAULT NOW() | 更新日時 |

**インデックス**：
- `idx_users_email` ON `email`

**備考**：
- パスワードは必ずbcrypt（コスト=12）でハッシュ化すること
- メールアドレスは小文字に正規化して保存

---

### 3.2 categories（カテゴリ）

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|------|------|
| id | BIGINT | PK, AUTO_INCREMENT | カテゴリID |
| user_id | BIGINT | FK → users.id, NOT NULL | 所有ユーザー |
| name | VARCHAR(50) | NOT NULL | カテゴリ名 |
| color | CHAR(7) | DEFAULT '#3B82F6' | 表示色（HEX） |
| sort_order | INT | DEFAULT 0 | 表示順 |
| created_at | TIMESTAMP | DEFAULT NOW() | 作成日時 |

**インデックス**：
- `idx_categories_user_id` ON `user_id`

**制約**：
- `UNIQUE(user_id, name)`（同一ユーザー内でカテゴリ名重複禁止）

**デフォルトカテゴリ**（ユーザー登録時に自動作成）：
- 仕事（color: #EF4444）
- 個人（color: #3B82F6）
- 買い物（color: #10B981）

---

### 3.3 todos（タスク）

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|------|------|
| id | BIGINT | PK, AUTO_INCREMENT | タスクID |
| user_id | BIGINT | FK → users.id, NOT NULL | 所有ユーザー |
| category_id | BIGINT | FK → categories.id, NULL | カテゴリ（未分類可） |
| title | VARCHAR(200) | NOT NULL | タスクタイトル |
| description | TEXT | NULL | 詳細説明 |
| status | ENUM('pending','in_progress','done','archived') | DEFAULT 'pending' | ステータス |
| priority | TINYINT | DEFAULT 2 | 優先度（1=高/2=中/3=低） |
| due_date | DATE | NULL | 期限日 |
| completed_at | TIMESTAMP | NULL | 完了日時 |
| created_at | TIMESTAMP | DEFAULT NOW() | 作成日時 |
| updated_at | TIMESTAMP | DEFAULT NOW() | 更新日時 |

**インデックス**：
- `idx_todos_user_id` ON `user_id`
- `idx_todos_user_status` ON `(user_id, status)`
- `idx_todos_due_date` ON `due_date`（期限切れ検索用）

**ビジネスルール**：
- `status = 'done'` に変更した時点で `completed_at = NOW()` を自動設定
- `status = 'archived'` のタスクは通常の一覧に表示しない

---

### 3.4 tags（タグ）

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|------|------|
| id | BIGINT | PK, AUTO_INCREMENT | タグID |
| user_id | BIGINT | FK → users.id, NOT NULL | 所有ユーザー |
| name | VARCHAR(30) | NOT NULL | タグ名 |
| created_at | TIMESTAMP | DEFAULT NOW() | 作成日時 |

**制約**：
- `UNIQUE(user_id, name)`（同一ユーザー内でタグ名重複禁止）

**インデックス**：
- `idx_tags_user_id` ON `user_id`

---

### 3.5 todo_tags（タスク×タグ 中間テーブル）

| カラム名 | 型 | 制約 | 説明 |
|---------|-----|------|------|
| todo_id | BIGINT | FK → todos.id, NOT NULL | タスクID |
| tag_id | BIGINT | FK → tags.id, NOT NULL | タグID |
| created_at | TIMESTAMP | DEFAULT NOW() | 付与日時 |

**主キー**：`PRIMARY KEY (todo_id, tag_id)`

**インデックス**：
- `idx_todo_tags_tag_id` ON `tag_id`（タグからタスクを検索する際に使用）

---

## 4. API仕様（主要エンドポイント）

### 認証

| メソッド | パス | 説明 |
|---------|------|------|
| POST | /api/auth/register | ユーザー登録 |
| POST | /api/auth/login | ログイン（JWT発行） |
| POST | /api/auth/logout | ログアウト |

### タスク

| メソッド | パス | 説明 |
|---------|------|------|
| GET | /api/todos | タスク一覧取得（フィルタ可） |
| POST | /api/todos | タスク作成 |
| GET | /api/todos/:id | タスク詳細取得 |
| PUT | /api/todos/:id | タスク更新 |
| DELETE | /api/todos/:id | タスク削除（ソフトデリート→archived） |
| PATCH | /api/todos/:id/complete | タスク完了 |

### カテゴリ・タグ

| メソッド | パス | 説明 |
|---------|------|------|
| GET | /api/categories | カテゴリ一覧 |
| POST | /api/categories | カテゴリ作成 |
| GET | /api/tags | タグ一覧 |
| POST | /api/tags | タグ作成 |

---

## 5. 画面仕様

### 5.1 ダッシュボード画面

| 要素 | 説明 |
|------|------|
| 今日の期限 | `due_date = TODAY AND status != 'done'` の一覧 |
| 優先度高 | `priority = 1 AND status = 'pending'` の一覧 |
| 統計 | 今週の完了数・未完了数 |

### 5.2 タスク一覧画面

| フィルタ | 説明 |
|---------|------|
| カテゴリ | `category_id = ?` |
| ステータス | `status = ?` |
| タグ | `JOIN todo_tags WHERE tag_id = ?` |
| 検索 | `title LIKE '%?%'` |

---

## 6. DDL（テーブル作成SQL）

```sql
-- users
CREATE TABLE users (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    display_name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_users_email (email)
);

-- categories
CREATE TABLE categories (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    name VARCHAR(50) NOT NULL,
    color CHAR(7) DEFAULT '#3B82F6',
    sort_order INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY uq_category_name (user_id, name),
    INDEX idx_categories_user_id (user_id)
);

-- todos
CREATE TABLE todos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    category_id BIGINT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NULL,
    status ENUM('pending','in_progress','done','archived') DEFAULT 'pending',
    priority TINYINT DEFAULT 2,
    due_date DATE NULL,
    completed_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL,
    INDEX idx_todos_user_id (user_id),
    INDEX idx_todos_user_status (user_id, status),
    INDEX idx_todos_due_date (due_date)
);

-- tags
CREATE TABLE tags (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    user_id BIGINT NOT NULL,
    name VARCHAR(30) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY uq_tag_name (user_id, name),
    INDEX idx_tags_user_id (user_id)
);

-- todo_tags
CREATE TABLE todo_tags (
    todo_id BIGINT NOT NULL,
    tag_id BIGINT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (todo_id, tag_id),
    FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
    FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE,
    INDEX idx_todo_tags_tag_id (tag_id)
);
```

---

## 7. ClaudeCode活用メモ

この設計書をClaudeに読ませることで、以下を自動生成できます：

```
req XX行後

上記の設計書を読んで、以下を生成してください：
1. Node.js + Expressのルーターコード
2. TypeScriptの型定義（User, Todo, Category, Tag）
3. データベース接続コード（mysql2/promise使用）
```

**期待される出力**：完全に動作するAPIコード（約300〜500行）

---

*このサンプル設計書はAI00フレームワーク（https://github.com/maysunAI/T00）のデモ用に作成されました。*
