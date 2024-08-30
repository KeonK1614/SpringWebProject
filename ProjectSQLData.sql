alter session set "_ORACLE_SCRIPT"=true;

create user PROJECT identified by 1234;

--테이블 스페이스 권한 주기
grant connect, resource, unlimited tablespace to PROJECT;
--테이블 스페이스 리스트 확인
select tablespace_name, status, contents from dba_tablespaces;
--테이블스페이스에 용량 확인
select tablespace_name, sum(bytes), max(bytes) from dba_free_space group by tablespace_name;
--개인 계정이 어느 테이블스페이스에 들어있는지 확인
select username, default_tablespace from dba_users where username in upper('PROJECT');

--PROJECT계정에 users 테이블 스페이스에 데이터를 입력할 수 있도록 5m의 용량 할당
alter user PROJECT quota 5m on users;

-------------------------------------------------------------멤버게시판
CREATE TABLE member (
    id varchar2(50) not null,
    pass varchar2(100) not null,
    name varchar2(50) not null,
    phoneNum varchar2(20) not null,
    email varchar2(50) not null,
    postcode varchar(10) not null,
    address varchar2(200) not null,
    detailaddress varchar2(200) not null,
    regidate Date DEFAULT SYSDATE not null,
    authority varchar2(20) default 'ROLE_USER',
    enabled number(1) default 1,
    primary key(id)
);

desc member; 

UPDATE member SET authority='ROLE_ADMIN' WHERE ID='아이디 입력';

SELECT * FROM member;
--멤버게시판 테이블 삭제
drop table member;

commit;

-------------------------------------------------------------멤버게시판

-------------------------------------------------------------정보게시판

--정보게시판 테이블
create table board (
    idx number(6) not null,
    id varchar2(50) not null,
    title varchar2(50) not null,
    content varchar2(1000) not null,
    postdate Date default sysdate not null,
    viewCount number(6) default 0 not null,
    likeCount number(6) default 0 not null,
    ofile varchar2(200), 
	sfile varchar2(100),
    isAnnouncement varchar2(1) default 'N' not null,
    primary key(idx)
);

desc board;

--정보게시판 외래키 설정
alter table board
    add constraint board_mem_fk foreign key (id)
    references member(id);
select * from board;
--정보게시판 시퀀스
create sequence board_seq
    increment by 1  -- 1식 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환 x
    nocache;        -- 캐시 사용 안함
    
--정보게시판 테이블 삭제
drop table board;
drop table boardInfoComment;
--정보게시판 시퀀스 삭제
DROP SEQUENCE board_seq;
DROP SEQUENCE boardInfoComment_seq;

--정보게시판 댓글 테이블
create table boardInfoComment (
    cIdx number(6) primary key, -- 댓글 인덱스 번호
    writer VARCHAR2(50), -- 댓글 작성자 아이디
    commentText VARCHAR2(500), --댓글 내용
    refGroup number(6), -- 원글 번호
    commentGroup number(6), -- 댓글 그룹 번호
    deleted number default 0, -- 지워진 댓글 여부 1:yes 0 no
    regidate date default SYSDATE
);

--정보게시판 외래키 설정
alter table boardInfoComment
    add constraint boardInfoComm_ref_fk foreign key (refGroup)
    references board(idx)
    ON DELETE CASCADE;
ALTER TABLE boardInfoComment
DROP CONSTRAINT boardInfoComm_ref_fk;


create sequence boardInfoComment_seq
    increment by 1  -- 1식 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환 x
    nocache;        -- 캐시 사용 안함
    
commit;

select * from boardInfoComment;
-------------------------------------------------------------정보게시판

-------------------------------------------------------------공지사항게시판

--공지사항 게시판 테이블
create table noticeBoard (
    idx number(6) not null,
    id varchar2(50) not null,
    title varchar2(50) not null,
    content varchar2(1000) not null,
    postdate Date default sysdate not null,
    viewCount number(6) default 0 not null,
    likeCount number(6) default 0 not null,
    ofile varchar2(200), 
	sfile varchar2(200),
    primary key(idx)
);

desc noticeBoard;

--공지사항게시판 외래키 설정
alter table noticeBoard
    add constraint board_noti_fk foreign key (id)
    references member(id);
    
--공지사항게시판 시퀀스
create sequence noticeBoard_seq
    increment by 1  -- 1식 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환 x
    nocache;

--공지사항게시판 테이블 삭제
drop table noticeBoard;
--공지사항게시판 시퀀스 삭제
DROP SEQUENCE noticeBoard_seq;

commit;

-------------------------------------------------------------공지사항게시판

-------------------------------------------------------------문의사항게시판

--문의사항게시판 테이블
create table inquiryBoard (
    idx number(6) not null,
    parentIdx number(6) DEFAULT 0, --부모 글 번호
    id varchar2(50) not null,
    title varchar2(50) not null,
    content varchar2(1000) not null,
    postdate Date default sysdate not null,
    viewCount number(6) default 0 not null,
    likeCount number(6) default 0 not null,
    ofile varchar2(200), 
	sfile varchar2(300),
    isAnnouncement varchar2(1) not null,
    boardPass  varchar2(20) not null,
    primary key(idx)
);

--문의사항게시판 외래키
alter table inquiryBoard
    add constraint board_inquiry_fk foreign key (id)
    references member(id);
    
--문의사항게시판 시퀀스
create sequence inquiryBoard_seq
    increment by 1  -- 1식 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환 x
    nocache;        -- 캐시 사용 안함

--문의사항게시판 테이블 삭제
drop table inquiryBoard;
--문의사항게시판 시퀀스 삭제
DROP SEQUENCE inquiryBoard_seq;

desc inquiryBoard;

commit;

-------------------------------------------------------------문의사항게시판









    

    

    























