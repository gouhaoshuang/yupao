create table user
(
    id           bigint auto_increment comment '主键'
        primary key,
    username     varchar(20)                        null comment '昵称',
    avatarUrl    varchar(10000)                     null comment '头像',
    userAccount  varchar(20)                        null comment '登录账号',
    gender       tinyint                            null comment '性别',
    userPassword varchar(512)                       null comment '密码',
    phone        varchar(20)                        null comment '电话',
    email        varchar(20)                        null comment '邮箱',
    userStatus   int                                null comment '状态',
    userRole     int      default 0                 null comment '用户权限',
    createTime   datetime default CURRENT_TIMESTAMP null comment '创建时间',
    updateTime   datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新 时间',
    isDelete     tinyint  default 0                 null comment '逻辑删除',
    planetCode   varchar(255)                       null comment '星球编号'
);


create
    database if not exists yupao;

use
    yupao;

-- 用户表
create table user
(
    id           bigint auto_increment comment '主键'
        primary key,
    username     varchar(20)                        null comment '昵称',
    avatarUrl    varchar(10000)                     null comment '头像',
    userAccount  varchar(20)                        null comment '登录账号',
    gender       tinyint                            null comment '性别',
    userPassword varchar(512)                       null comment '密码',
    phone        varchar(20)                        null comment '电话',
    email        varchar(20)                        null comment '邮箱',
    userStatus   int                                null comment '状态',
    userRole     int      default 0                 null comment '用户权限',
    createTime   datetime default CURRENT_TIMESTAMP null comment '创建时间',
    updateTime   datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP comment '更新 时间',
    isDelete     tinyint  default 0                 null comment '逻辑删除',
    planetCode   varchar(255)                       null comment '星球编号',
    tags         varchar(1024)                      null comment '标签 json 列表'
);

-- 队伍表
create table team
(
    id          bigint auto_increment comment 'id' primary key,
    name        varchar(256)       not null comment '队伍名称',
    description varchar(1024) null comment '描述',
    maxNum      int      default 1 not null comment '最大人数',
    expireTime  datetime null comment '过期时间',
    userId      bigint comment '用户id（队长 id）',,
    status      int      default 0 not null comment '0 - 公开，1 - 私有，2 - 加密',
    password    varchar(512) null comment '密码',
    createTime  datetime default CURRENT_TIMESTAMP null comment '创建时间',
    updateTime  datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    isDelete    tinyint  default 0 not null comment '是否删除'
) comment '队伍';

-- 用户队伍关系
create table user_team
(
    id         bigint auto_increment comment 'id'
        primary key,
    userId     bigint comment '用户id',
    teamId     bigint comment '队伍id',
    joinTime   datetime null comment '加入时间',
    createTime datetime default CURRENT_TIMESTAMP null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    isDelete   tinyint  default 0 not null comment '是否删除'
) comment '用户队伍关系';


-- 标签表（可以不创建，因为标签字段已经放到了用户表中）
create table tag
(
    id         bigint auto_increment comment 'id'
        primary key,
    tagName    varchar(256)                       null comment '标签名称',
    userId     bigint                             null comment '用户 id',
    parentId   bigint                             null comment '父标签 id',
    isParent   tinyint                            null comment '0 - 不是, 1 - 父标签',
    createTime datetime default CURRENT_TIMESTAMP null comment '创建时间',
    updateTime datetime default CURRENT_TIMESTAMP null on update CURRENT_TIMESTAMP,
    isDelete   tinyint  default 0                 not null comment '是否删除',
    constraint idx_userId
        unique (userId) comment '上传用户的id',
    constraint uniIdx_tagName
        unique (tagName)
)
    comment '标签';

create index idx_userId
    on tag (userId);