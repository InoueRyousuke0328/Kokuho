# Kokuho
2026年ポリテクセンター千葉にて、チーム国宝の6人で制作したプロジェクト「CinemaDAO」

## 概要

映画作品の情報を検索・閲覧できるWebアプリケーションです。

ユーザー側では映画情報の閲覧やレビュー投稿、管理者側では映画情報・ユーザー・レビューの管理などを行えます。

## 開発環境

- Java
- JSP / Servlet
- MySQL
- Apache Tomcat
- Eclipse

## 使用技術

- Java
- JSP
- Servlet
- MySQL
- HTML / CSS
- JavaScript

## システム構成

MVCモデルを採用し、FrontControllerを経由して各Actionへ処理を振り分けています。

```text
ブラウザ
   ↓
JSP
   ↓
FrontController
   ↓
Action
   ↓
DAO
   ↓
MySQL
