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
    isAdmin varchar(1) not null,
    primary key(id)
);
insert into member values ('test1', '1234', '홍길동', '1234', 'test1@test.com', '10444', '경기도', '고양시', sysdate, 'Y');
insert into member values ('test2', '1234', '이순신', '0000', 'test@test.com', '10444', '고양시', '일산', sysdate, 'Y');
insert into member values ('test3', '1234', '김유신', '0000', 'test@test.com', '10444', '고양시', '일산', sysdate, 'Y');


select * from member;

drop table member;
drop table board;

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
create table boardfile (
    idx number(6) not null,
    title varchar2(50) not null,
    content varchar2(1000) not null,
);
ALTER table Board MODIFY isAnnouncement varchar2(1);
ALTER TABLE board MODIFY sfile VARCHAR2(100);



update table board ( idx number(6));
alter table board
    add constraint board_mem_fk foreign key (id)
    references member(id);
drop sequence board_seq;

create sequence board_seq
    increment by 1  -- 1식 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환 x
    nocache;        -- 캐시 사용 안함

insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김유신', '자료실 제목1 입니다.', '내용', sysdate, 'Y');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '장보고', '자료실 제목2 입니다.', '내용', sysdate, 'Y');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '단군', '자료실 제목4 입니다.','내용', sysdate, 'Y');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '침착맨', '자료실 제목3 입니다.','내용', sysdate, 'Y');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '철면수심', '자료실 제목5 입니다.','내용', sysdate, 'Y');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '옥냥이', '자료실 제목6 입니다.','내용', sysdate, 'Y');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '승우아빠', '자료실 제목7 입니다.','내용', sysdate, 'Y');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김도', '자료실 제목8 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '풍월량', '자료실 제목9 입니다.','내용', sysdate, 'N';
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목10 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목11 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목12 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목13 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목14 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목15 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목16 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목17 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목18 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목19 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목20 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목21 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목22 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목23 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목24 입니다.','내용', sysdate, 'N');
insert into board (idx, id, title, content, postdate, isAnnouncement)
    values (board_seq.nextval, '김풍', '자료실 제목25 입니다.','내용', sysdate, 'N');


commit;

select * from board ORDER BY idx DESC;

select count(*) from board;