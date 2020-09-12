
-- certificate凭证
-- 暂不使用自增主键，主键可在服务器随机生成
-- 角色表role：
CREATE TABLE roles(
	role_id VARCHAR(64),-- 角色id
	role_remark VARCHAR(64)-- 角色描述
)
-- 用户表
CREATE TABLE users(
	account VARCHAR(64),-- 注册账号，
	super_account VARCHAR(64) DEFAULT '00',-- 父账号 
	`password` VARCHAR(64) DEFAULT '111111',-- 密码
	`name` VARCHAR(64), -- 用户名
	phone VARCHAR(64), -- 联系电话
	email VARCHAR(64),-- 电子邮件
	ip VARCHAR(64),-- 绑定ip，绑定后该账号只能在固定ip登录
	m_id VARCHAR(64),-- 店铺号，由管理员或者系统分配
	status VARCHAR(2)
)
-- merchant店铺参数配置
CREATE TABLE merchant(
	m_id VARCHAR(64),-- 被系统创建
	type_id VARCHAR(64), -- 行业
	m_discount DOUBLE,-- 所属店铺折扣
	m_coin DOUBLE,-- 所属店铺兑换比例
	note_verify VARCHAR(2), -- 是否开启短信验证
	card_num VARCHAR(2), -- 是否开启卡号消费
	receipt VARCHAR(2), -- 是否开启打印小票
	recharge VARCHAR(64), -- 充值的权限，对应子账号类型
	-- 2.1.5.1描述的基本资料设置字段
)
-- 用户角色关联表
CREATE TABLE user_roles(
	account VARCHAR(64),-- 用户账号
	role_id VARCHAR(64),-- 角色id
	PRIMARY KEY(m_account,role_id)
)

--店铺-版块 关联表
CREATE TABLE merchant_plate{
	m_id VARCHAR(64),
	plate_id VARCHAR(64),-- 最多可以开通五个板块，不空即为开通
	
}
--板块表
CREATE TABLE plate(
	type_id VARCHAR(64),-- 行业id
	plate_id varchar(64),--
	plate_remark varchar(64)
)

-- 行业表
CREATE TABLE `type`(
	type_id VARCHAR(64),-- 行业id
	plate1 VARCHAR(64),-- 最多可以开通五个板块，不空即为开通
	plate2 VARCHAR(64),
	plate3 VARCHAR(64),
	plate4 VARCHAR(64),
	plate5 VARCHAR(64),
	type_remark VARCHAR(64)-- 描述
)
-- 会员卡
CREATE TABLE club_card(
	c_id VARCHAR(64),-- 卡号
	`status` VARCHAR(2),-- 状态
	`issuer` VARCHAR(64),-- 制卡人
	`outer` VARCHAR(64),-- 发卡人
	cre_time DATA,-- 制卡时间
	out_time DATA,-- 发卡时间
	integral DOUBLE,-- 积分
	money DOUBLE,-- 余额
 )
-- 店铺-会员卡关联表
CREATE TABLE merchant_card(
	m_id VARCHAR(64),-- 店铺
	c_id VARCHAR(64),-- 卡号
	stored_value DOUBLE,-- 储值
	phone VARCHAR(64),-- 预留的手机号
	password1 VARCHAR(64),-- 登录密码
	password2 VARCHAR(64),-- 消费密码
)
-- 消费历史 history_consume
CREATE TABLE history_consume(
	m_id VARCHAR(64),-- 店铺
	c_id VARCHAR(64),-- 卡号
	`time` DATA,-- 刷卡时间
	money DOUBLE, -- 消费金额
	consume_id,-- 消费清单id
)
-- 用户-会员卡关联表
CREATE TABLE user_card(
	account VARCHAR(64),
	c_id VARCHAR(64)-- 卡号
)
-- 商品表
CREATE TABLE product(
	`type` VARCHAR(64),-- 商品类型
)
-- 凭证表
CREATE TABLE certificate(
	c_id VARCHAR(64),-- 账号
)
--入盟申请表
CREATE TABLE apply( 
	apply_id varchar(64))






