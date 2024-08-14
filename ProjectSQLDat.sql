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
    pass varchar2(50) not null,
    postcode varchar(10) not null,
    address varchar2(200) not null,
    phoneNum varchar2(20) not null,
    name varchar2(50) not null,
    regidate Date DEFAULT SYSDATE not null,
    email varchar2(50) not null,
    isAdmin varchar(1) not null,
    primary key(id)
);

create table board (
    idx varchar2(10) not null,
    id varchar2(50) not null,
    title varchar2(50) not null,
    content varchar2(1000) not null,
    postdate Date default sysdate not null,
    viewCount number(6) default 0 not null,
    likeCount number(6) default 0 not null,
    ofile varchar2(200), 
	sfile varchar2(30),
    isAnnouncement varchar2(1) not null,
    primary key(idx)
);