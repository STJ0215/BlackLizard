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
    `name` CHAR(100) NOT NULL
);

# 회원 데이터 생성
INSERT INTO `member` SET
regDate = NOW(),
updateDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = 'admin';

INSERT INTO `member` SET
regDate = NOW(),
updateDate = NOW(),
loginId = 'user_test',
loginPw = 'user_test',
`name` = 'user_test';



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
    title CHAR(200) NOT NULL,
    `body` TEXT NOT NULL
);

# 게시물 데이터 생성
INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
title = '제목4',
`body` = '내용4';

# 게시물 테이블에 memberId 칼럼 추가
ALTER TABLE article ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER updateDate;
# 기존 게시물의 작성자가 1번 회원이라고 정한다
UPDATE article SET memberId = 1 WHERE memberId = 0;

# 2번 회원이 작성한 게시물 데이터 추가
INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
memberId = 2,
title = '제목5',
`body` = '내용5';

# 게시물 데이터 무작위 추가
INSERT INTO article SET
regDate = NOW(),
updateDate = NOW(),
memberId = 2,
title = CONCAT('제목_', RAND()),
`body` = CONCAT('내용_', RAND());



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
memberId = 1,
`body` = 'reply2';

INSERT INTO reply SET
regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'article',
relId = 1,
memberId = 2,
`body` = 'reply3';

INSERT INTO reply SET
regDate = NOW(),
updateDate = NOW(),
relTypeCode = 'article',
relId = 2,
memberId = 2,
`body` = 'reply4';



# 회원 테이블 조회
SELECT * FROM `member`;

# 게시판 테이블 조회
SELECT * FROM board;

# 게시물 테이블 조회(내림차순)
SELECT * FROM article ORDER BY id DESC;

# 댓글 테이블 조회
SELECT * FROM reply;