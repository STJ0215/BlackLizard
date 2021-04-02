# 데이터 베이스 생성
DROP DATABASE IF EXISTS blacklizard;
CREATE DATABASE blacklizard;
USE blacklizard;



# 회원 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    loginId CHAR(20) NOT NULL,
    loginPw CHAR(100) NOT NULL,
    `name` CHAR(100) NOT NULL,
    email CHAR(100) NOT NULL
);

# 회원 데이터 추가
INSERT INTO `member` SET
regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = 'admin',
email = 'stj960215@gmail.com';

INSERT INTO `member` SET
regDate = NOW(),
updateDate = NOW(),
loginId = 'user_test',
loginPw = 'user_test',
`name` = 'user_test',
email = 'stj960215@gmail.com';

# 현재 패스워드를 암호화
UPDATE `member` SET
loginPw = SHA2(loginPw, 256);



# 게시판 테이블 생성
CREATE TABLE board (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `name` CHAR(20) UNIQUE NOT NULL,
    `code` CHAR(20) UNIQUE NOT NULL
);

# 게시판 데이터 추가
INSERT INTO board SET
regDate = NOW(),
updateDate = NOW(),
`name` = '공지사항',
`code` = 'notice';

INSERT INTO board SET
regDate = NOW(),
updateDate = NOW(),
`name` = '자유게시판',
`code` = 'free';



# 게시물 테이블 생성
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    boardId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
);

# 게시물 데이터 생성
INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 1,
title = 'notice_title-1',
`body` = 'notice_body-1';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
boardId = 1,
memberId = 1,
title = 'notice_title-2',
`body` = 'notice_body-2';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 1,
title = 'article_title-1',
`body` = 'article_body-1';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
boardId = 2,
memberId = 2,
title = 'article_title-2',
`body` = 'article_body-2';

## 게시물 데이터 무작위 추가
#INSERT INTO article SET
#regDate = NOW(),
#updateDate = NOW(),
#boardId = 2,
#memberId = 2,
#title = CONCAT('제목_', RAND()),
#`body` = CONCAT('내용_', RAND());



#댓글 테이블 생성
CREATE TABLE reply (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    relTypeCode CHAR(50) NOT NULL, # 관련 데이터 타입
    relId INT(10) UNSIGNED NOT NULL, # 관련 ID
    memberId INT(10) UNSIGNED NOT NULL,
    `body` TEXT NOT NULL
);

# 댓글 데이터 추가
INSERT INTO reply SET
regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'article',
relId = 1,
memberId = 1,
`body` = 'reply1';

INSERT INTO reply SET
regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'article',
relId = 1,
memberId = 2,
`body` = 'reply2';

INSERT INTO reply SET
regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'article',
relId = 3,
memberId = 1,
`body` = 'reply3';

INSERT INTO reply SET
regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'article',
relId = 3,
memberId = 2,
`body` = 'reply4';



# 부가정보 테이블 생성
CREATE TABLE attr (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    `relTypeCode` CHAR(20) NOT NULL,
    `relId` INT(10) UNSIGNED NOT NULL,
    `typeCode` CHAR(30) NOT NULL,
    `type2Code` CHAR(30) NOT NULL,
    `value` TEXT NOT NULL
);

# attr 유니크 인덱스 걸기
## 변수찾는 속도 최적화
ALTER TABLE `attr` ADD UNIQUE INDEX (`relTypeCode`, `relId`, `typeCode`, `type2Code`); 

## 특정 조건을 만족하는 회원 또는 게시물(기타 데이터)를 빠르게 찾기 위해서
ALTER TABLE `attr` ADD INDEX (`relTypeCode`, `typeCode`, `type2Code`);

# attr에 만료날짜 추가
ALTER TABLE `attr` ADD COLUMN `expireDate` DATETIME NULL AFTER `value`;

# 1번 회원의 이메일을 인증처리
INSERT INTO attr
SET regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'member',
relId = 1,
typeCode = 'extra',
type2Code = 'authedEmail',
`value` = 'stj960215@gmail.com';

# 2번 회원의 이메일을 인증처리
INSERT INTO attr
SET regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'member',
relId = 2,
typeCode = 'extra',
type2Code = 'authedEmail',
`value` = 'stj960215@gmail.com';



# 회원 테이블 조회
SELECT * FROM `member`;

# 게시판 테이블 조회
SELECT * FROM board;

# 게시물 테이블 조회(내림차순)
SELECT * FROM article ORDER BY id DESC;

# 댓글 테이블 조회
SELECT * FROM reply;

# 부가정보 테이블 조회
SELECT * FROM attr;

## 현재 패스워드를 조회(암호화)
#SELECT SHA2(loginPw, 256)
#FROM `member`;