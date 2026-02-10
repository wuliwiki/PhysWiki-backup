-- PhysWiki backup database schema
-- Based on /mnt/g/github/PhysWikiScan/data/scan-template.sql conventions
-- All fields are NOT NULL; use 0 or '' defaults where needed.
-- Each record corresponds to a file: YYYYMMDDHHMM_AuthorID_ArticleId.tex

CREATE TABLE "table_version" (
	"table"      TEXT    NOT NULL UNIQUE,
	"version"    TEXT    NOT NULL,
	"importance" INTEGER NOT NULL,
	PRIMARY KEY("table")
);

INSERT INTO "table_version" VALUES ('backup_files', '20260210', 1);

CREATE TABLE "backup_files" (
	"timestamp"  TEXT    NOT NULL, -- YYYYMMDDHHMM
	"author_id"  INTEGER NOT NULL,
	"article_id" TEXT    NOT NULL,
	"size"       INTEGER NOT NULL, -- file size in bytes (64-bit)
	"hash"       TEXT    NOT NULL, -- first 16 chars of sha1
	"diff"       TEXT    NOT NULL, -- JSON diff from previous version of same article_id
	PRIMARY KEY("timestamp", "author_id", "article_id")
);

CREATE INDEX idx_backup_files_timestamp ON "backup_files"("timestamp");
CREATE INDEX idx_backup_files_author_id ON "backup_files"("author_id");
CREATE INDEX idx_backup_files_article_id ON "backup_files"("article_id");
