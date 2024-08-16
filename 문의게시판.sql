drop table inquiryBoard;
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
--부모키
alter table inquiryBoard
    add constraint board_inquiry_fk foreign key (id)
    references member(id);
    
--문의테이블 스퀀스
create sequence inquiryBoard_seq
    increment by 1  -- 1식 증가
    start with 1    -- 시작값 1
    minvalue 1      -- 최소값 1
    nomaxvalue      -- 최대값은 무한대
    nocycle         -- 순환 x
    nocache;        -- 캐시 사용 안함
    
insert into inquiryBoard (idx, id, parentIdx, title, content, ofile, sfile, isAnnouncement, boardPass)
values ( inquiryBoard_seq.nextval, 'project', 31, '답글입니다', '내용입니다',null , null, 'N', '1234');

insert into inquiryBoard (idx, id, parentIdx, title, content, ofile, sfile, isAnnouncement, boardPass)
values ( inquiryBoard_seq.nextval, 'project', 92, '답글입니다', '내용입니다',null , null, 'N', '1234');
    
commit;