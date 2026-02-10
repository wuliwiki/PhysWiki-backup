

I want a format that's "only" the difference, so I can save space. and also apply the patch to
  the older version to get a newer version

if I want you to write a c++ function `inline void str_diff(vector<tuple<size_t, size_t, Str>>
  &diff, Str_I str1, Str_I str2, bool debug = false)`, what algorithm do you suggest to do it?
  ```
  // calculate the difference between two strings
  // diff: vector<(start, size, string)>
  // str1.replace(start, size, string) from back to front will result in str2
  ```

in `\mnt\g\github\PhysWikiScan\SLISC\str\str_diff_patch2.h`, write such a function, and write
  tests in `str_diff_patch2_test.cpp` to test it

in `str_diff_patch2.h`, also write 2 functions that serialize/deserialize `vector<tuple<size_t,
  size_t, Str>>`

here is a real test: use all `/mnt/g/github/PhysWiki-backup/*.tex` to test, do a diff for each
  pair neighboring files, then reconstruct the last file from the first, and verify the
  reconstructed last file is correct

improve str_diff_patch2.h, assume utf-8 encoding, and do not split any code-point or put any
  illegal utf-8 bytes in any `String`

treat every String as code-points and don't do anything special for line-breaks

output the diff file as `json` format, use "nlohmann json" library (installed
  with apt). each diff should be `[9823, 2, 48, "xxxxxxx"]`, use 0 spaces as indentation. handle
  string escapes correctly

output `*.json`, each `[9823, 2, 48, "xxxxxxx"]` should be in one line, but no indentation

ok, select another 100 groups of `*_xxx.tex`, (grouped by `xxx`)

create CMakeLists.txt files and amend the commit

besides the json serializer, also design an SQLite data base `PhysWiki-backup.sql`, create the
  `*.db` accordingly, inside `/mnt/g/github/PhysWiki-backup/` folder, then read every `*.tex` in
  it and put into the database. Each record in the db should correspond to one file
  `YYYYMMDDHHMM_AuthorID_ArticleId.tex`

reference `/mnt/g/github/PhysWikiScan/data/scan-template.sql`

use SQLiteCpp to operate the db, just like /mnt/g/github/PhysWikiScan/lib/sqlite_db.h

you should store "diff" in "backup_files" instead of "content", store the content of the
  json file you designed earlier. "diff" should be the diff between "timestamp" of current record
  and last record of the same "article_id". also, a 64 bit

also, the first 16 characters of sha1 hash of that version of `*.tex` is needed for each record,
  use "hash" field name

for the first record of that "article_id", assume the last version is an empty string

immediately after you read each tex file in PhysWiki-backup, use CRLF_to_LF() function first to
  convert it

PhysWiki-backup is also a repository, now write a program that migrade all tex files in it into
  the db and delete the origin files after confirming they can be recovered correctly. make sure
  to verify the hashes. you can recover files by `git checkout .` and `git clean`. You should test
  the migration until every tex file is migrated successfully.

now, recover every tex files, and use `git diff` to check if they are different from original
  ones

I mean recover from db. I deleted all tex file, and please try again

when you recover each file, don't base on any other recovered file, but only use db. since later
  it is required to recover any single tex file from the db only

no! I check the db file, your "diff" is not based on the previous version of the same
  "article_id"! rebuild the db again, ask me to check !

add a foreign key for each record to point to the last version record, that "diff" is based on! named "prev_ver"

can you use "id" NUMBER as a primary key? and "prev_ver" pointing to "id"?

put `nlohmann json` headers in `deps/nlohmann_json` and change CMakeLists.txt to use this
  folder, so that other computers can compile without installing again. copy from `/mnt/github/
  BaltamCodegen/third_party/nlohmann_json/`

in .sql file, also index "prev_ver" field

put "prev_ver" before "diff"; also, "id" 86322 and 86323 are not right, there is only a small
  diff, but you replaced the whole file

don't use utf32, can't you just use utf8? and don't cut a single codepoint

you know how to check utf8 number of bytes don't you? there is already a util called `u8_iter` in /mnt/g/github/PhysWikiScan/SLISC/str/unicode.h

 remember to validate tex are valid utf8, otherwise, throw an error


