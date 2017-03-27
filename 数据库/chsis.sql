/*
Navicat MySQL Data Transfer

Source Server         : chsis
Source Server Version : 50546
Source Host           : 120.27.113.85:3306
Source Database       : chsis

Target Server Type    : MYSQL
Target Server Version : 50546
File Encoding         : 65001

Date: 2016-06-14 14:34:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_checkrecord
-- ----------------------------
DROP TABLE IF EXISTS `t_checkrecord`;
CREATE TABLE `t_checkrecord` (
  `uuid` varchar(255) NOT NULL,
  `newsUuid` varchar(255) NOT NULL,
  `checker_uuid` varchar(255) NOT NULL,
  `result` int(5) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkrecord
-- ----------------------------
INSERT INTO `t_checkrecord` VALUES ('0000becf3b8e48e8bdd6d0b370d8f1aa', 'f8e16278275b4de1a619bd70292e8121', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-05-17 18:53:52');
INSERT INTO `t_checkrecord` VALUES ('010bb1cdf0b548489afb518c2f4145b7', '6ada6ae6d1054e1ca9ed279cb7eabaab', 'c0960f97d3a342ddabe850263edb4b2a', '1', '格式问题', '2016-06-12 14:44:54');
INSERT INTO `t_checkrecord` VALUES ('03992016924d4102a8af7d6d08cbab37', 'c213b5c19d59473bb6af39027812cb34', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-05-17 18:53:22');
INSERT INTO `t_checkrecord` VALUES ('0460ccde43784e88a9c42dfb359f894d', '02d4bb0f19b740d0baa72b0cf4f0c96e', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-09 10:03:59');
INSERT INTO `t_checkrecord` VALUES ('0cb0717fc8dc422191ac90935c9f5886', 'bcf9ce2774244a54ab67578cf044b559', 'c0960f97d3a342ddabe850263edb4b2a', '1', '排版问题', '2016-06-13 09:52:51');
INSERT INTO `t_checkrecord` VALUES ('0d48e28c11b8461c8ec6440f5c07c0b7', '0f6849dbeeaa4d3e9dc2e31696d06786', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:36:41');
INSERT INTO `t_checkrecord` VALUES ('19ec713ea1c54f418e27623ecd045bd2', '5e87cb3a03974254b9bcfcf53ecb8ffa', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 14:44:41');
INSERT INTO `t_checkrecord` VALUES ('1a279830501345b588111d7a254af3d7', 'd868feb2f3124e90b78393cd48121cb1', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-05-17 18:53:30');
INSERT INTO `t_checkrecord` VALUES ('2192769f37e143ca8cc788f799b2da45', 'fe0a5e9f2d8841c19dbf273eed68ed74', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:03:41');
INSERT INTO `t_checkrecord` VALUES ('2d1d96e7ebe84ccc8992eb2148909f82', 'd1bfa34341904b02a1a419f7a58c9afc', 'c0960f97d3a342ddabe850263edb4b2a', '1', '新闻内容字体太大。', '2016-05-17 18:54:00');
INSERT INTO `t_checkrecord` VALUES ('2ec66f112f6f4a929ec954cd31833f66', 'a570f6b89d1a4f2e9432e13483631820', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 14:45:41');
INSERT INTO `t_checkrecord` VALUES ('345582c4dcb64bbca3c0bc49b6b83cae', '16c3b02a58c44dacab7dab2c3eea7b25', 'c0960f97d3a342ddabe850263edb4b2a', '1', '新闻内容字体太大，页面展示不美观。', '2016-05-17 18:51:00');
INSERT INTO `t_checkrecord` VALUES ('35edcbdea2804189be00dbf4c5355db0', 'd1bfa34341904b02a1a419f7a58c9afc', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:29:56');
INSERT INTO `t_checkrecord` VALUES ('3a0c788310d343a6929c17835b1fd768', 'a7a6b04d67c4490e8c93c3b8e0db3a45', 'c0960f97d3a342ddabe850263edb4b2a', '1', '缩进', '2016-06-12 14:45:55');
INSERT INTO `t_checkrecord` VALUES ('3e6a34d0c6574d698c5642d6da0afbfc', 'aef9376deaa84556b7b9175fe0743cc3', 'c0960f97d3a342ddabe850263edb4b2a', '1', '第六条格式', '2016-06-12 15:19:56');
INSERT INTO `t_checkrecord` VALUES ('3f1165d30f1a4e48b89dcf9d5bd16f3e', '71e15501bc5b48c880b01a713e6b7544', 'c0960f97d3a342ddabe850263edb4b2a', '1', '段落缩进', '2016-06-12 14:45:10');
INSERT INTO `t_checkrecord` VALUES ('4206530e3fb44072a2ee5ff03ae52004', '6ada6ae6d1054e1ca9ed279cb7eabaab', 'c0960f97d3a342ddabe850263edb4b2a', '1', '行距太小', '2016-05-17 18:52:17');
INSERT INTO `t_checkrecord` VALUES ('5bbdaf8d324d4d1596c9529878bba01e', '9356fb75b917438c9bddaf2a917c3f50', 'c0960f97d3a342ddabe850263edb4b2a', '1', '排版不合适', '2016-06-13 15:21:39');
INSERT INTO `t_checkrecord` VALUES ('5c703872ff484f78b517107a8f4230f4', '71e15501bc5b48c880b01a713e6b7544', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 14:54:51');
INSERT INTO `t_checkrecord` VALUES ('60ade27523d749d991fc1be610897c1d', 'f77bdfb11b81447385b6abbac409c284', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:22:27');
INSERT INTO `t_checkrecord` VALUES ('7a49cd8932b9440b9ee5d82c89509bf7', '21ab3adaca364ffb8a0ce63ca2223c91', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:13:45');
INSERT INTO `t_checkrecord` VALUES ('7c9e90faefd2429cba6160a3cbc923fc', '36c4e9704a944752a2abd95b044510f2', 'c0960f97d3a342ddabe850263edb4b2a', '1', '格式缩进', '2016-06-12 14:44:34');
INSERT INTO `t_checkrecord` VALUES ('7eeeaa534e614c85a2a11d18438c95c6', '9cda4ee2ddea4e4dbc54f0f990bd9260', 'c0960f97d3a342ddabe850263edb4b2a', '1', '内容少', '2016-06-02 16:22:57');
INSERT INTO `t_checkrecord` VALUES ('7fcdd6027da043ea8faa73eb04c0afc9', '2343dcdb50394e6d817fa4c09d972993', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-05-17 18:51:40');
INSERT INTO `t_checkrecord` VALUES ('887aed5706d84bb6a3221950db1739c5', '16c3b02a58c44dacab7dab2c3eea7b25', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 14:44:17');
INSERT INTO `t_checkrecord` VALUES ('8b969a017db142c28e9d41e85d11b662', '38ccd24bfb9d4cbdb2d86ebd306593cc', 'c0960f97d3a342ddabe850263edb4b2a', '1', '第六点和第七点', '2016-06-12 15:14:13');
INSERT INTO `t_checkrecord` VALUES ('8c1db2a3dbee41ca859bed46f3f7f771', '36c4e9704a944752a2abd95b044510f2', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:03:26');
INSERT INTO `t_checkrecord` VALUES ('90b759c7151e4284a32dcf1ef8ad28f8', 'a7a6b04d67c4490e8c93c3b8e0db3a45', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 14:55:09');
INSERT INTO `t_checkrecord` VALUES ('911d809af675455bb26bb667edbd25b4', '9085fb9f043a44d9b34652bce8c62116', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:03:35');
INSERT INTO `t_checkrecord` VALUES ('913f523bde734227972aaeea22bcce13', 'd9b7cd4dfa6c471e857ad7f46f19ff6c', 'c0960f97d3a342ddabe850263edb4b2a', '1', '内容太少', '2016-06-12 14:46:24');
INSERT INTO `t_checkrecord` VALUES ('94bedf2aaac544398d74073ebb6333d6', 'a7a6b04d67c4490e8c93c3b8e0db3a45', 'c0960f97d3a342ddabe850263edb4b2a', '1', '1、新闻内容字体太大；\r\n2、排版有问题', '2016-05-17 18:53:10');
INSERT INTO `t_checkrecord` VALUES ('95bd0dfad240402583add9bc302e95e5', '9993bf3d43734d19aaf6d12d573149ce', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 14:55:02');
INSERT INTO `t_checkrecord` VALUES ('a08fce9b87024cd585f7e53b1b17b10f', '6e44da8825954dd3b381e25def41c670', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-05-17 18:52:30');
INSERT INTO `t_checkrecord` VALUES ('a1447c3ddcfc451fbb20c51afb3f4df8', 'aef9376deaa84556b7b9175fe0743cc3', 'c0960f97d3a342ddabe850263edb4b2a', '1', '格式', '2016-06-12 15:22:21');
INSERT INTO `t_checkrecord` VALUES ('a8d1587df67a4dd589d5bae15e231b2a', '0831ef31356844708c87b5a23812340c', 'c0960f97d3a342ddabe850263edb4b2a', '1', '新闻内容字体太大。', '2016-05-17 18:51:29');
INSERT INTO `t_checkrecord` VALUES ('ab3cdea807f84c6989d62805950a9414', 'aef9376deaa84556b7b9175fe0743cc3', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:29:47');
INSERT INTO `t_checkrecord` VALUES ('b82693f1c9a4462d893969869d3fce65', '776c1446725b43a08838c31ee5276f65', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-05-17 18:52:38');
INSERT INTO `t_checkrecord` VALUES ('b959ed48bdac4b789e98180dde2a3513', '0831ef31356844708c87b5a23812340c', 'c0960f97d3a342ddabe850263edb4b2a', '1', '格式', '2016-06-12 15:29:37');
INSERT INTO `t_checkrecord` VALUES ('d1d0d2b343e04f529a9789579b6e6c0c', '839cfbd70ad448d0a89fe9b2b2712b8b', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-05-17 18:53:16');
INSERT INTO `t_checkrecord` VALUES ('d8c55455f90b485db0bfc857e53b9920', '845e460876634a2a9ed803a466170130', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 14:45:18');
INSERT INTO `t_checkrecord` VALUES ('dae1ed1894594da69bbd9c57bd1e05ce', 'f77bdfb11b81447385b6abbac409c284', 'c0960f97d3a342ddabe850263edb4b2a', '1', '新闻内容字体太大。', '2016-05-17 18:53:38');
INSERT INTO `t_checkrecord` VALUES ('db2cf0dbb58a4256ab814c7ff5f34a19', 'cec20fd202b945c0881c81f806925e43', 'c0960f97d3a342ddabe850263edb4b2a', '1', '内容太少', '2016-06-12 14:46:06');
INSERT INTO `t_checkrecord` VALUES ('ea9f201fca644531b39b0cd61da64f12', '9993bf3d43734d19aaf6d12d573149ce', 'c0960f97d3a342ddabe850263edb4b2a', '1', '段落缩进', '2016-06-12 14:45:32');
INSERT INTO `t_checkrecord` VALUES ('ec3ec5a79b4c4160ad0fa6f7820d3ca9', '38ccd24bfb9d4cbdb2d86ebd306593cc', 'c0960f97d3a342ddabe850263edb4b2a', '0', null, '2016-06-12 15:17:08');
INSERT INTO `t_checkrecord` VALUES ('f7d5ce396fe849b0b07fdd68503695c5', '36c4e9704a944752a2abd95b044510f2', 'c0960f97d3a342ddabe850263edb4b2a', '1', '字体太大', '2016-06-12 14:54:37');
INSERT INTO `t_checkrecord` VALUES ('fe40a2c507404982a94df5dbfbbc7098', '5e87cb3a03974254b9bcfcf53ecb8ffa', 'c0960f97d3a342ddabe850263edb4b2a', '1', '文字排版有问题。', '2016-05-17 18:51:58');

-- ----------------------------
-- Table structure for t_checkreport
-- ----------------------------
DROP TABLE IF EXISTS `t_checkreport`;
CREATE TABLE `t_checkreport` (
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` longtext,
  `time` varchar(255) NOT NULL,
  `patient_uuid` varchar(255) NOT NULL,
  `hospital_uuid` varchar(255) NOT NULL,
  `state` int(5) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `medicalRecord_uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_checkreport
-- ----------------------------
INSERT INTO `t_checkreport` VALUES ('019c76c95b57454ab55bb919ff6a55a1', '关节炎片子', '关节炎', '2016-06-03 13:25:35', '7d15e9976cb2429995cda5f39fb8a5f5', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/4db3f94f9c3f4d808c7282f1eafa2f38.png', '01e601a856064b9096a48ac6d4fe2dcd');
INSERT INTO `t_checkreport` VALUES ('054243ac8ff84d2883eabe8d016ba58d', '胃镜检查', '胃病', '2016-06-04 20:53:55', 'b3edd5d0f5c5499fb586bb3679bf22d1', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/5e612d6aac724d30bf867d360d417ce9.png', '39f0fd58f0714f87ab4bbabecbb007b1');
INSERT INTO `t_checkreport` VALUES ('0ad74e92eae94455afb2a95ea41ddf13', '骨质疏松', '骨质疏松', '2016-06-03 14:45:06', '9c42c3ed93964560b76cc78712ae013c', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/a194402572954cb79a2153078321c255.png', '32977d23c16a41e08962d4e235bc7487');
INSERT INTO `t_checkreport` VALUES ('14c496fb160b4b8eb901becec39274d3', '眼睛检查', '缝针', '2016-06-03 13:58:05', 'e181d5588ec44538b748782418c4f606', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/1370a207224144c8b562cb4a76be4899.jpg', 'a9106a8c69894816885e1a3532b38f10');
INSERT INTO `t_checkreport` VALUES ('4408bb73c2794934bf167fdf4d551ece', '体检', '研究生入学体检', '2016-05-17 16:34:50', '7d15e9976cb2429995cda5f39fb8a5f5', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/32fb9bf3f0a14cb1884a40729eac7d9e.png', null);
INSERT INTO `t_checkreport` VALUES ('7a4a172b86f44ce8bae4f67ff6b801ab', '鼻炎报告单', '急性鼻炎', '2016-06-03 15:13:28', 'b3edd5d0f5c5499fb586bb3679bf22d1', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/0517f29ccce54ab19fc2dc6cfad74f0d.png', '5a049e2676c546c79d81e73824d80cbf');
INSERT INTO `t_checkreport` VALUES ('89dc430519ac48fc822a1c2ed9343e80', '体检', '2016-05-17 16:58:27', '2016-05-17 15:48:55', 'e181d5588ec44538b748782418c4f606', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/17c382b2facb46be8f22f98fc75f506a.jpg', null);
INSERT INTO `t_checkreport` VALUES ('8bfaef6aa9cb41aeb0abcf5eefa4a787', '智齿报告单', '长智齿', '2016-06-03 14:19:12', '9c42c3ed93964560b76cc78712ae013c', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/c8aeb8251b544b31a29a1f57fafbf038.jpg', 'f7a4fe3936e54057b8b31c274ff35db5');
INSERT INTO `t_checkreport` VALUES ('8f536ec115a54cdc8fba702bca6fbd74', '体检', null, '2016-06-02 16:19:33', '7d15e9976cb2429995cda5f39fb8a5f5', 'a625702fd847431a99f9c34d4526dfcd', '0', null, null);
INSERT INTO `t_checkreport` VALUES ('a396a3cf3dfc425c893700e43286d058', '体检', '工作入职体检', '2016-05-17 16:31:11', 'e181d5588ec44538b748782418c4f606', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/fa59e48204224c40986fa5abdb09e69e.png', null);
INSERT INTO `t_checkreport` VALUES ('abc5513ff8e846baa57797c93d047250', '胃镜报告单', '胃镜检查', '2016-06-03 14:49:53', '9c42c3ed93964560b76cc78712ae013c', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/075474e5fb264becb298620857c58392.png', '745e408619d34f14b0d124a3bb2523f4');
INSERT INTO `t_checkreport` VALUES ('b36a62cb58bf44699e176fc04ca5add5', '关节炎报告单', '骨关节炎', '2016-06-03 14:41:24', '7d15e9976cb2429995cda5f39fb8a5f5', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/d41d11681a934bbb8a337ff0015ac58d.png', 'b16b0e11d937438e9238d8ec31cd4541');
INSERT INTO `t_checkreport` VALUES ('c6a06ea1443046a7a195edb6cc1dddc5', '体检', '公司入职体检', '2016-06-03 14:58:26', '94eb6d6e066d44a8a1d5726915005d14', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/9c4e9d6baba24699b538b1dffc5f8f55.png', null);
INSERT INTO `t_checkreport` VALUES ('cd9deee2b5ae4a0cba44e46071d0c1a5', '体检', '普通体检', '2016-06-03 14:20:51', '9c42c3ed93964560b76cc78712ae013c', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/e2431c75b7ea44a0af999243011f34ad.png', null);
INSERT INTO `t_checkreport` VALUES ('d04b9dc3b5cb41aba992f1837d7b91c7', '体检', '入职体检', '2016-06-04 10:44:00', '9c42c3ed93964560b76cc78712ae013c', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/106394f674f84e988fc4175b9748f6ed.png', null);
INSERT INTO `t_checkreport` VALUES ('da0b23cb30344de38d059fe986be0f73', '体检', '常规体检', '2016-06-09 10:34:47', '94eb6d6e066d44a8a1d5726915005d14', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/09e3fbc832134207bcdd64d66cc81c80.png', null);
INSERT INTO `t_checkreport` VALUES ('edd3843c521f4170b9fc5192090cd8c7', '眼睛检查', '缝针', '2016-06-03 13:47:29', 'e181d5588ec44538b748782418c4f606', 'a625702fd847431a99f9c34d4526dfcd', '0', 'http://cdn.upshi.cn/chsis/report/eb0d426301b444168ae840d2268e03e2.png', 'a9106a8c69894816885e1a3532b38f10');
INSERT INTO `t_checkreport` VALUES ('eee1fedd9ff04aa48b5b3570be36738e', '体检', '新生儿体检', '2016-06-03 15:23:05', '480a63e56a5948e59e2b242ece855e06', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/57afa1e1d26143fea9b5343b15b6d13f.png', null);
INSERT INTO `t_checkreport` VALUES ('f7f05ba3a7b4430789200ff61d1a2209', '体检', '研究生入学体检', '2016-06-03 14:51:16', 'b3edd5d0f5c5499fb586bb3679bf22d1', 'a625702fd847431a99f9c34d4526dfcd', '1', 'http://cdn.upshi.cn/chsis/report/fc20d7d0a68e41a2a53a7f82f7dfdcde.png', null);

-- ----------------------------
-- Table structure for t_community
-- ----------------------------
DROP TABLE IF EXISTS `t_community`;
CREATE TABLE `t_community` (
  `uuid` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `description` longtext,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_community
-- ----------------------------
INSERT INTO `t_community` VALUES ('1', 'community_01', '阳光社区', '兰州市七里河区', '阳光社区');

-- ----------------------------
-- Table structure for t_department
-- ----------------------------
DROP TABLE IF EXISTS `t_department`;
CREATE TABLE `t_department` (
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `description` longtext,
  `hospital_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_department
-- ----------------------------
INSERT INTO `t_department` VALUES ('88ecd47582d2404ca54868bd5f8b661a', '外科', 'dep_001', '外科', 'a625702fd847431a99f9c34d4526dfcd');
INSERT INTO `t_department` VALUES ('9300f89be4db4ae784ecf83690557d38', '老年病科', 'dep_004', '老年病科,专为老年人服务。', 'a625702fd847431a99f9c34d4526dfcd');
INSERT INTO `t_department` VALUES ('d0214cc49e46416c8442ffd7ce6b1ecc', '五官科', 'dep_003', '五官科', 'a625702fd847431a99f9c34d4526dfcd');
INSERT INTO `t_department` VALUES ('dd31ceaf836c480fbb2256614dbce906', '内科', 'dep_002', '内科', 'a625702fd847431a99f9c34d4526dfcd');

-- ----------------------------
-- Table structure for t_disease
-- ----------------------------
DROP TABLE IF EXISTS `t_disease`;
CREATE TABLE `t_disease` (
  `uuid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `diseaseTypeUuid` varchar(50) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk_disease_diseaseType` (`diseaseTypeUuid`),
  CONSTRAINT `fk_disease_diseaseType` FOREIGN KEY (`diseaseTypeUuid`) REFERENCES `t_diseasetype` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_disease
-- ----------------------------
INSERT INTO `t_disease` VALUES ('0035f992c784411fa84f590483fe414c', '鹅口疮', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('0052048e96974a18838208f9fd324dd1', '脓性指头炎', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('009f8a5032084ff991bd7575d6268335', '腰椎间盘突出症', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('0266f0d7c75a475392cc3c030da37ca8', '小儿哮喘', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('027c252a025c4bd9b1a9785ce799fe71', '尿失禁', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('02b7610c5cba4f27bbd7e42fd7bc1fbf', '胶质瘤', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('02c20e1d50ee41189ab990c24392bd78', '口腔念珠菌病', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('045d75246a3941108d38c9abdec142c2', '乳腺纤维瘤', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('04981ef9d7e644769cd7d6ead2fbefd6', '尿毒症', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('04e4771ac18c4df2aa9271de1aa5f42d', '休克', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('04eb7c43b2804ab99aabd1e91b607589', '睾丸肿瘤', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('052d7fcce49d4808bda7720476804e6c', '新生儿胆红素脑病', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('05783d1c23c64f63b5238e77427aa07d', '百日咳', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('072a7c38553c457fb29466659432bfe7', '儿童口吃', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('098f02ca398e4307a14b2f15bd3c04e9', '垂体瘤', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('0abf6a7e4d4c4342a982c6220c1af394', '骶管囊肿', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('0cca61d38145458c8374d0dabf64ec12', '龋齿', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('0d3317b2c6614b9e84d5fc87114f8848', '蛛网膜下腔出血', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('0d7014ce988b471aba37ce6209c80692', '分裂情感性精神病', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('0d8da21d64d04a3192aa6466a05b1d0f', '颈椎半脱位', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('0de668d8668848808064e6f5c1cdafb5', '贫血', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('0ff9136a5e9f4012ba38b14c3abb8508', '呼吸衰竭', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('10c4663a0b0b466eabd63551632fa4fa', '淋巴癌', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('11f3d8d4513544a1beb26ca42e82cfa1', '农药中毒', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('1200175d4db840ccbe074fd8a52793d2', '腭裂', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('15b10eefd4294c3db47095feaf04690d', '非哺乳期乳晕部瘘管', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('15f9a13c82614c88a390f882f8cc1e31', '中风', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('17e7b7be771d4de6a1af5bef904d0887', '内痔', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('18d180031eff45da8dfa9ad7dfd53ec5', '脑积水', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('199018984cb64b8e89565a312c7818f6', '前列腺癌', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('1a1233121a504ccbb9a2e1ad87eb3f90', '肠道息肉病', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('1b0cdfba513549caa3e7c7d19ac43e22', '尿路感染', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('1cde42e17fdf464381b690eefc7b1f28', '前庭神经炎', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('1f801fa57447417ca2bb2fc3e0009a3e', '头皮及颅骨烧伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('1ff14ec5f2f94ed593906048fbe4f337', '铜绿假单胞菌感染', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('206891381b914d86860444f5527fd9fe', '小儿视网膜色素变性-肥胖-多指综合征', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('21e9ada7d5fb4408bcec8b523684c092', '甲状舌管囊肿及瘘管', '4206e1af55d3476da42c0afb7991be62');
INSERT INTO `t_disease` VALUES ('228dd53a17104139abc8aa87e49d2cfa', '脑栓塞', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('22c3322702614003b5dcd5057c6c0768', '红斑狼疮', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('2320b904b0554e2292294b72b1e9c0ec', '肺炎', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('236cb398c249446b9aa2d20b86cb419d', '产褥感染', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('23a3fff7a6aa49ba99706827c9c97326', '脑出血', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('23fdd8e204a44bcfbf4ce29b46caf437', '膝关节损伤', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('24b2a8fab7524a5698505dbcbdb2eb23', '眼部带状疱疹', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('252df053034a4c4982a9a6ef955c8bc4', '多囊卵巢综合征', '9f5df2d97fe440688fa58df94200d9ca');
INSERT INTO `t_disease` VALUES ('268890aa691e4338b7874772fffbef01', '结石性胆囊炎', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('26c49031d8c94cd5aa219b83b5515ab8', '包皮龟头炎', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('27da461014574a279d86f9fd53348d56', '类风湿性关节炎', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('2841313bc03d484a8f60cfbecac115a5', '创伤性气胸', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('2891aa7fa6274843b7d9f23cf9c88e07', '腹泻', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('2b53f854cd5349bfabf825b21ae8cd70', '脑血栓', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('2cb283d3347d42c4bff93b045002b000', '哮喘', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('2cfa3813064447209d0215612aa8bee5', '弱视', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('2d95f1dbe61b41968628c8654cd037f0', '鼻咽癌', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('2e9f0f350ea243f38e6b84f2d23bc728', 'Nezelot综合征', '7043db3aa4ec448baaa30698a2541006');
INSERT INTO `t_disease` VALUES ('2f5082c9b85d426a87f4ee5dff13ade0', '尿道结石', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('2ffe34ac72374ee59aa5debfe9569c4c', '咽白喉', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('31bd3418743449988fbaf206349b9257', '胃平滑肌肉瘤', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('3296e99a4df34e1b888e26d03a48532f', '乙肝', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('32a714afcc194126b5cb294740a8a8dc', '尿道炎', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('336f5b0a6bdc433296f43889a73c4c34', '外阴烧伤、烫伤和化学损伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('33a14fa94b024631af2c2618f5a4a600', '新生儿溶血', '0b6e4241738f496ca7da55c8bd208ef7');
INSERT INTO `t_disease` VALUES ('34d538aff912479cad7cfc55a8ef8102', '胰腺癌', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('3580f69376cc45b798229a97a458e166', '急性烧伤', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('3672f5cc2daf4f8bb1556bad37d3124a', '疤痕', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('36d89109e9094681a241d185d5cd5342', '急性破伤风', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('36f7c6ad711846808662d72ae5dba94e', '心脏神经官能症', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('3773ca95902f44a8a455de40d8ea6fe9', '焦虑症', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('3830800f9df9454eb1512128949eff55', '失眠', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('3b9d8255d5a844709c25f79e73839f5e', '骨关节炎', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('3c6fe43959d442b9b21d9abeb0084729', '反流性食管炎', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('3ce4c26f1d8849c0a476bc2f56f68ef1', '红眼病', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('3ddda638451046b388abb73356f25839', '创伤性休克', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('3f73841058fd436a83392bb0ef33860d', '动脉硬化', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('41471f285dba42068040ce631c5b92bd', '脑膜瘤', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('419120cb2e2543c0bf8e35c230a50a49', '胃损伤', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('41e4685effe64522a2202f3f8f99b8ec', '地图舌', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('421fe4a638214803a69b66ec8bf5eb8f', '肺结核', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('42d9136ff11a4472b06b46721df4dca4', '痛风性关节炎', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('43226f8434444961b88d36f5a27ac97b', '肠系膜上静脉血栓形成', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('43452b5dae0f442589fd4c9bd95bc595', '急性鼻炎', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('4362d11f7b29435081247a73e824b9b7', '肾结石', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('43aa6ccea52947fc8f71df0951f55813', '乳管内乳头状瘤', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('43ab2535111c448d8c8922956ca9cf24', '肾病综合征', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('449f6b5cae864340b9e67acc794318f5', '睾丸扭转', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('4517fef899b24dc7be6c72c80449b370', '痣', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('45cf076ee21c49a1ad47f552367ee404', '扁平足', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('47d63069c85f420d9b5757428699f13d', '磨牙', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('483438cb80b34aa0ae07dc791a963cd7', '下肢深静脉血栓形成', 'e56157aae4864f01b6fe6e7557f96083');
INSERT INTO `t_disease` VALUES ('4876b64014244938b512231dff680ebc', '麦粒肿', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('4b41abe7bc2d4529b364f811d2ff6c7a', '创伤性窒息', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('4c3950ee50d3446c87ece395f8634a7f', '病毒性咽炎', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('4d7d533398b34fe79de701dafbeb86a1', '臂丛神经损伤', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('4eb4b4e5e309473ea3df775eba5f28fa', '胃息肉', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('4f8584d2fa064161b1245e8b96b7740d', '颈椎骨折', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('52322c143cd04d6ca69876494f5250fb', '便秘', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('52a2a53bd48b422b80e3216656fd7880', '腰椎间盘突出', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('53851f8b98244e879ed4cf92288f21d9', '低渗性脱水', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('53b173403350458fa6604954d31edb68', '老年痴呆', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('5460a1eccc124e87ae3d057ad1333979', '乳头炎和乳晕炎', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('54a7ba9166244b82a1fcfd405ece0c2a', '小颌畸形综合征', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('5596833a3ef8487d816f4ff9d75a33c1', '慢性支气管炎', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('561623aa1c91423baa15a363c8ae5819', '先天性肿瘤', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('5651dd268509456f8abb39afa40363b3', '爆震性耳聋', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('56d1c14f58d146ef93df4991459193d6', '妄想症', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('57571550db8d42e89fb2e5097ba73cf3', '法乐四联症', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('576a1703440a4c6da05dcdd43da1bdcd', '阿尔茨海默病', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('57b4657d2ce647adb5d0e94edb7dac9b', '老年人中风', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('582a28136cb447f6a7bfb3782ba2a940', '腰腿痛', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('58f20957fc67495b8491cd1e74d661c3', '颈椎病', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('595e8a48de35447092450dcdd3fcf94f', '冻僵', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('5b473dd107d543fa976d47ec69fe8a00', '挤压综合征', 'c8c9cc2431324da09f38057139e47b5b');
INSERT INTO `t_disease` VALUES ('5d4ea89c418a408480481f9d3142ceaf', '急性胆囊炎', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('5db1553d63ae44c3a801c4b7f6631ff2', '沙眼', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('5de996debfa94783b0229fbe89c45b32', '智齿冠周炎', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('602ef10ca3b74752a157b9640dbc376f', '糖尿病', '9f5df2d97fe440688fa58df94200d9ca');
INSERT INTO `t_disease` VALUES ('61068d9386c84669ac04868a57e604fc', '休克型肺炎', 'e56157aae4864f01b6fe6e7557f96083');
INSERT INTO `t_disease` VALUES ('62a7a81c50f04454a5a4f490b46cabc3', '躁狂症', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('631e2ad97f0947d9a017b7b0e0474af2', '胆结石', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('63596cc0bda94344bb2c11fdd59015d2', '原发性肝癌', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('63c062a65f0d4ceca029739b7b374944', '鼻囊肿', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('63d331ed444b4432b74635c943b9a9b1', '强迫症', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('641f689b3f974b9a81b2220f202bdd81', '开放性手外伤', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('64f8baf582aa45dba706621a7ec612c9', '大骨节病', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('65306f113f514f7495ce77acbcd008a3', '脑膜炎', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('664b55487e4c479b91d08c3073d71477', '风湿性关节炎', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('66773aa148404b728c091346a7ba5db2', '主动脉瘤', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('66b100fc8e0449c99dd5d2363696cfe3', '面瘫', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('677ffa1d141a43db8540fed22622cab6', '附睾炎', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('685a805f1af948e58a11a2ecfd7c0abb', '隐睾', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('6878deb2f5034963838ac565c775277b', '脑外伤', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('6a347461aa594cb78feb0c4374c7f9b0', '癫痫', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('6ad142eb0195439a9d5ff117355ae094', '心脏病', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('6bfaa833f05a44799074cacbc543869c', '痛风', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('6d4ad93bd1354f288b65ca753b7b8767', '头痛', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('6dc9d721a88d4c58a5ea55fb3a782b06', '坐骨神经痛', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('7040965636f04483af48bd54bbf9b4c3', '直肠脱垂', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('70b9467cb0874833ae6a0d09f302253d', '耳聋', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('7300998cba234df691f81fa40bd676b8', '淹溺', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('73524c060b214e38aeec15e640ff9c8e', '小儿感冒', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('74ac1fbb683e45b7b969a059d44bb27a', '前列腺炎', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('75ae603795e74d90af2731eb1fdb937e', '远视眼', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('7607fd7d9b854b0fbbd4bae577833b74', '男性乳房肥大症', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('766ef986977e4eeb8e5c313288e6acd7', '单纯性下肢静脉曲张', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('775e748a678f4f13ba1bacf8b9d96feb', '心肌梗死', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('77f17d0cffde49a1958598c637478738', '直肠癌', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('7808a3d7bf814167bff747a450570534', '结肠癌', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('78442518d1ba46d3b5c8c97eee1d3a9e', '汽油、煤油中毒', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('785f3691dd45401c9c36093d89ebf3e7', '失血性休克', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('7b485d3f99cb4f04b6daf425366918bc', '电烧伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('7baddae2aa5f478c92220af043f3cc15', '性功能障碍', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('7c3a89ccd1fd4d6c800989775669ade7', '舌病', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('7c872391e6e0456cb906d243eb64fdd2', '鼻窦炎', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('7eda410921424c8e90332578923acff0', '牙痛', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('7f9d30730500498cb3a3e3940069223f', '霍奇金淋巴瘤', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('804e3c38d4454b0b941411a1418737f7', '断肢再植', '7043db3aa4ec448baaa30698a2541006');
INSERT INTO `t_disease` VALUES ('82264a19a2b84d69a10cc97bd5868246', '炎性乳腺癌', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('839563e4a4264efabc3e30f9891229b0', '手掌深部间隙感染', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('83b0c92965a24cd196ab5b1246c6eede', '腹痛', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('84238e5d1c584adab458a052a92c5354', '尺神经损伤', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('854625693a6341529f41ed873db18924', '高血脂', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('86818b76e7a14777a6f15c130bf9b762', '先天性脑积水', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('87345d7ae3314e1ea59b83d716dc1cda', '眼烧伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('8763b31a1f6b4c6eacca22bdfcdd2990', '腰肌劳损', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('89549b6e687c4119ba97f3281be2c4d9', '乳腺癌', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('8ba7411e2b254a36bb0996b7daceb1ad', '老年性阴道炎', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('8c25c3a2105e4c3ea78cc5e1357e6ef9', '感冒', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('8c6722363f104f10bc66c9a1d0130d95', '雷诺病', 'e56157aae4864f01b6fe6e7557f96083');
INSERT INTO `t_disease` VALUES ('8c9ca03e9805498d9febbec8b4256ffe', '结膜干燥症', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('8cfbabd75c834468aff0fe19ff436752', '玻璃体混浊', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('8f4579c2977b4e388799cf42dadc79b4', '头皮血肿', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('9018882fe6b3447b912758997981e3c1', '产褥期乳腺炎', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('9062cf2deae44a4da8e922b40603246e', '脑震荡', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('9238692deb194cc4b0a779096343390c', '突发性耳聋', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('93318605af3444e1a2d6c29f23b3dd8a', '支原体尿路感染', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('93baa81c16334331ac77e74f8dcf16d8', '皮脂腺囊肿', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('948a0e9fb5464511a74069c182a39299', '手部肌腱损伤', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('966b9e40ffd64b828395ba77d172fa09', '乳房纤维瘤', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('975d5b9276134802bf82d7f790bf8bee', '遗精', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('97f3fef7fee94238870cbe519240ac6b', '血管瘤', 'e56157aae4864f01b6fe6e7557f96083');
INSERT INTO `t_disease` VALUES ('98429860b57e498bb5329b9633c3832e', '病毒性心肌炎', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('98f23b9eb7874becbeb60055156deeb0', '烧伤休克', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('99156d7af4b040c798920bf77d9a0cb9', '包皮阴茎头炎', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('99d7ceee4bd44c97990b0ad60f4236d8', '肺癌', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('9a4ee5165585423297072b23cb9b5aba', '急性食物中毒', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('9a6a8b440d1747f6b66fa15b9d2065fa', '慢性咽炎', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('9b86e135d50e467e8ec0191071168ec3', '二尖瓣关闭不全', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('9c1e748c8c164991b306236642c7d4e1', '鼻疖', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('9cd5bc11ad46450fbb4e4f83dc06f422', '脾囊肿', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('9e7a55a1b06e4b378a18772459ce5fb9', '克山病', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('9ecb5258881e4702899e6891d9f9a2d0', '小儿癫痫', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('9ed5d1aa494d425b8b2387131b60299b', '乳头内陷', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('a0294c94b6fa4d119b2e4529088d9f0f', '过敏性紫癜', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('a0be182cce854317a6583b1a8bcfa4c6', '肺大泡', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('a0d4fd8d8d464e83a55a0bfb195ecf80', '自闭症', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('a1eee9aec85f4eb985ba6f010e5af173', '贲门癌', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('a21e9b62a96f489eaeecd89d5a030ef0', '唇裂', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('a2b4c26de6774c56b54bad2652872875', '脊髓小脑变性症', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('a350825638434df892a2f1863bea9a7a', '多发性骨髓瘤', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('a38ddefa5e2e4007b17537426617b26f', '高血压', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('a4953e07231449f09bf9a583e24f3e95', '致密性髂骨炎', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('a580dfe2bcd24e0da187838858389899', '破伤风', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('a5e0f003e1e14f769574bcb1ba207175', '老年人高血压', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('a6e3ab21fe224ae48cb15e22143ee4a6', '地中海贫血', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('a8fd89be0e474456ae0510250c826936', '肝损伤', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('a9f918ae26464b12b9e74ee57c7704f9', '脑瘤', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('aad81826debc4c63b287f381c69c2abd', '颈动脉瘤', '4206e1af55d3476da42c0afb7991be62');
INSERT INTO `t_disease` VALUES ('ac10ba8e48494e1085c72f4e48dca659', '肝囊肿', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('ac324cda34ab40c0b060e700cccdc8e8', '钠过多', '4d535d6894194a10ba692b18c3403202');
INSERT INTO `t_disease` VALUES ('ad45110e8a2d4326b891aeb8ebbd549f', '牙龈癌', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('add5c251a8bc4ae8b8fb6df4ad1f24fa', '胆囊癌', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('ae39c6d3e2c74c6096606ef81df4c5f7', '动脉瘤', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('b18abe085d024eb7a387d9eca2bb9ef1', '骨折', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('b1f42a82b381439d922acd77f1f31902', '肝血管瘤', '4a8dff0a5cb948febb9bb7ae5b6d4807');
INSERT INTO `t_disease` VALUES ('b30709431bec48949bbfbd2adccb9188', '支气管哮喘', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('b40c3f5cdf8241c5b0c74104c6d3e280', '毒蛇咬伤', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('b438b3f416ed460cb4c69c275926fec7', '肠扭转综合征', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('b5925afa044e43cdb538b811fb218db4', '淋巴瘤', '9f5df2d97fe440688fa58df94200d9ca');
INSERT INTO `t_disease` VALUES ('b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1cfe6a6319354e94acca8eec666253d0');
INSERT INTO `t_disease` VALUES ('b98a5290ed654c19ae587af4f7057f83', '静脉曲张', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('ba7acdcfdcea4d5ea00fa0b7069535f1', '急性化脓性乳腺炎', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('bbe48de7ec2642dba049f486006c9fe1', '造影剂肾病', '7043db3aa4ec448baaa30698a2541006');
INSERT INTO `t_disease` VALUES ('bdb8232e514343d195c6892be3a316b8', '脑血管畸形', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('be3336b902224b5dafaf12d81aca74c3', '小儿惊厥', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('bec242dcb37c49fb9e21907e2a6e655b', '头外伤', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('bec35ae74586437db204debb8931f73b', '非冻结性冷伤', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('c002b2ce3d5a4bbeaee68c778cfa9b29', '抑郁症', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('c0c88bdd5265407485f033c499de4c26', '化学烧伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('c0fb614a13094c5cadb4c4a4bc48f559', '胃病', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('c133ff4257e54a62a9927ce9191fc03d', '肛瘘', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('c1777ffad96b44cf901c42cb8a0d7ed5', '胃泌素瘤', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('c1e02873e8b04d50b4dffac688fdfbc2', '帕金森病', '0d3bffa05e46482e94ae73e6655f4e4f');
INSERT INTO `t_disease` VALUES ('c6d3e4cbd58a47999a2c52f471cf3c39', '小儿烧伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('c8b6b7c6d51f4edd8d3b22d8497ffa7a', '小儿厌食症', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('ca092df142a744a2af1a2a6ba7a29daf', '精索静脉曲张', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('ca3b06c573014ff681ef3595780db8a3', '甲亢', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('cb190d99eaa84913a2531836cd21da5e', '烧伤后急性肾功能衰竭', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('cc53f91dbfdd481f9e757d5a232727f4', '感染性休克', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('cc598e522b4b464f99a1fc9028b79d8e', '坏疽性脓皮症', 'e56157aae4864f01b6fe6e7557f96083');
INSERT INTO `t_disease` VALUES ('cd6f8adae6dd4271ab93ba8fc0ae3e2c', '性早熟', '9f5df2d97fe440688fa58df94200d9ca');
INSERT INTO `t_disease` VALUES ('cd811df335e14df4ad9404b67ec70df9', '断指再植', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('ce303d51463b4c9b8c895637b11ee09b', '前列腺增生', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('cea3a65789ba4edbb00709a7f8515aab', '脑梗塞', '7043db3aa4ec448baaa30698a2541006');
INSERT INTO `t_disease` VALUES ('cf77a3b2fbea4174a65952d8585b4542', '口腔溃疡', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('cfb674e7206642c2aada2c8e79eaa049', '心律失常', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('d0a013cdf4b4430b82b6e4c6e52f088a', '禽流感', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('d1e84dfaba3f42aab203e35a525f80be', '脂肪肝', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('d3d642a3043d4d29bf1b53d8c4c8fdb5', '口腔扁平苔藓', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('d46239f47a8f4a9a9b4c7e47fd1a1315', '更年期综合征', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('d48ede6a3bed4952842fbce40b2183b5', '乳腺结核', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('d5b10c002f704170a6f47f9b8e4f0ab5', '冠心病', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('d5d577a1e1404aad8c854e3acf7ae734', '乳腺增生', '9f5df2d97fe440688fa58df94200d9ca');
INSERT INTO `t_disease` VALUES ('d795b06ae8b84d7891733428e29651e2', '烧伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('d79b31c1b9334854b5471bd4c157d72d', '肠气囊肿', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('d7a5c524190046dfa1b4220ff13cfb2e', '会阴裂伤', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('d8fc7bcdd3164bbbbe687faaac435629', '股骨头坏死', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('d9cda6f6a97e4dc7938ea3602958d0ce', '乳头皲裂', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('da7623fa089d474c967444c972490633', '人工关节置换术', '3e6faccf92f043799e45dd05d4b08a0f');
INSERT INTO `t_disease` VALUES ('dad3f780585d414f893a669de235af14', '皮肤过敏', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('daf9cadccfc543f7bd370523e18c13ef', '乳房纤维腺瘤', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('db63f7271e9d49419cc111a0a9e4fb7e', '热烧伤', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('db7ce34d24564122aa27e503b391d95b', '口臭', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('db9249933cbc4002a0a781cac75527a0', '颈动脉狭窄', 'e56157aae4864f01b6fe6e7557f96083');
INSERT INTO `t_disease` VALUES ('dc68c740a0594876b1d309c01184646a', '小儿多动症', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('dd6fcc139a034026b8be1f175143e3e3', '食物中毒', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('dfcf8e9c5cad445d8aa755bc13d2dbb8', '甲状腺腺瘤', '4206e1af55d3476da42c0afb7991be62');
INSERT INTO `t_disease` VALUES ('e04f627d4e5344ec84980a76c3b026c4', '急性心肌梗死', '4bc6118467b04ca79218213cc7ff411a');
INSERT INTO `t_disease` VALUES ('e077c82b6ba1467c878709f071bdeb1e', '痔疮', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('e093e4160711481a880cdafcd8c6aa19', '淋巴水肿', '9f5df2d97fe440688fa58df94200d9ca');
INSERT INTO `t_disease` VALUES ('e0f10461d556473bb4f4f972de27d47e', '肛窦炎', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('e3a8ec64c2584791bf292c0a25b29285', '电击伤', '688172d78d3b46b49e3ce2ddb27cda20');
INSERT INTO `t_disease` VALUES ('e3fc461a41fc4c8f8f537fd5a7449fab', '应激性溃疡', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('e43c49ba52dc4cf7ae874f69ed7129c5', '牙周病', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('e49389fdb2c5431dab745a6fb0c2251f', '神经衰弱', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('e510e920dcfa4e72a87bda31b5c9dd82', '大肠癌', '7d653d6f430f44a88b2e5fe03630d0a6');
INSERT INTO `t_disease` VALUES ('e604863ddc6d454780fad7f4d839ec93', '青光眼', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('e7e6868b732b4afb8505e169bc443d13', '流行性腮腺炎', '673204b46eea4dee864f060262bf0e40');
INSERT INTO `t_disease` VALUES ('ea71821e83ad41af87c917251f6d71e2', '烧伤感染', '91e523d9fe9e4370a2c72f5ab2522da7');
INSERT INTO `t_disease` VALUES ('ead7d9e5654545f5964aa2cece8f300b', '多乳房', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('eca83fed3e674a2cb4f0b0fd6a0ad55b', '慢性胃炎', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('ee3a28e2d48048aba04b0a95a95366c8', '真两性畸形', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('ee82cc75a7b34646907a1e874cc0e7ae', '老年人尿失禁', '41ab5b8f41ad4a67b62d0a3f9ec761c0');
INSERT INTO `t_disease` VALUES ('efe537639e4341e1887d4bb22fa94e4c', '白内障', '1447e10989c24977b900d9cb256a163c');
INSERT INTO `t_disease` VALUES ('f2380d8ed9744320a3ce5b70b33bb452', '急性海绵窦栓塞性静脉炎', 'e56157aae4864f01b6fe6e7557f96083');
INSERT INTO `t_disease` VALUES ('f4ee4aee50594536985d3ed532dbb2b6', '骨质疏松', '9f5df2d97fe440688fa58df94200d9ca');
INSERT INTO `t_disease` VALUES ('f55e77d0db0843cdaa3e7064bf8d434a', '中暑', '529b867548a74b3ab16fbc6a9d8c5536');
INSERT INTO `t_disease` VALUES ('f8b05e3dcce14d4c9ca24ab24ac9d3c3', '白血病', '5841bfd583ea466bba6b76d923c7ab14');
INSERT INTO `t_disease` VALUES ('f9cd4136cab74e5db75d731200c861b0', '流行性感冒', 'c08a936176aa4a8d85756117249aedb8');
INSERT INTO `t_disease` VALUES ('fb110016d3744ee3bd47c658872fa284', '食管黏膜损伤', 'd4b3144f54544089a47df61ea97a122e');
INSERT INTO `t_disease` VALUES ('fbb4280e357a48899c4082ced79f45d8', '乳腺纤维腺瘤', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('fc0eab3c6ade4e93a8b1cc464736e3c3', '高血压脑出血', '54ed112b233f434689157550e544e24c');
INSERT INTO `t_disease` VALUES ('fc584f52398543d2984dc0725721d5a9', '胃癌', '5f340527f1744d6e8b3d598834d853f8');
INSERT INTO `t_disease` VALUES ('fcaaadd6b8a54466a6eeeb8a2a495b48', '强直性脊柱炎', '0e0c5c6191fb413795f5d922756c788e');
INSERT INTO `t_disease` VALUES ('fcfd5e7c26054f0ca62c0d49231922a9', '乳腺囊性增生症', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('fd4270bd5b4c493aa2bbb0f9c9764955', '乳房结核', '1edf0dc123994074be96b3312c805e49');
INSERT INTO `t_disease` VALUES ('fe0c252b76a94eb7b73429329d1efa5c', '阴茎异常勃起', 'e3cc484423d84df9ba7da794c69466f2');
INSERT INTO `t_disease` VALUES ('feac4552670d4b7fb283f9a7b77f17ff', '人格障碍', 'e2e2ea17bbdf472b9e588102f0fbfa31');
INSERT INTO `t_disease` VALUES ('feea3a77c7f848cea987c83f21537a47', '心绞痛', '85c5845d479746a5b25e591fe51738a7');
INSERT INTO `t_disease` VALUES ('ff65736985144120b1a91681bea14e93', '骨质增生', '3e6faccf92f043799e45dd05d4b08a0f');

-- ----------------------------
-- Table structure for t_diseasehistory
-- ----------------------------
DROP TABLE IF EXISTS `t_diseasehistory`;
CREATE TABLE `t_diseasehistory` (
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` int(5) NOT NULL,
  `startTime` varchar(255) NOT NULL,
  `endTime` varchar(255) NOT NULL,
  `description` longtext,
  `patient_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_diseasehistory
-- ----------------------------
INSERT INTO `t_diseasehistory` VALUES ('2cd1eb21886f4b479f580285dd5c9a50', '酒精过敏', '3', '2003-05-01', '--', '酒精过敏', '7d15e9976cb2429995cda5f39fb8a5f5');
INSERT INTO `t_diseasehistory` VALUES ('4b49c1ac191a4814b486805662ee61be', '糖尿病', '1', '2014-01-08', '--', '糖尿病', 'f3f6f4127daa49e6ba5136caf2f4f63b');
INSERT INTO `t_diseasehistory` VALUES ('67cba372591a4c498e531bd574b531f7', '胃绞痛', '1', '2015-10-06', '2015-12-09', '胃绞痛', '9c42c3ed93964560b76cc78712ae013c');
INSERT INTO `t_diseasehistory` VALUES ('89882900326f467d984b1d9b905ac72a', '近视', '2', '2014-05-01', '2016-05-03', '激光手术后恢复，目前无不良反应。', 'e181d5588ec44538b748782418c4f606');
INSERT INTO `t_diseasehistory` VALUES ('b6a4b71e08d64e0b8cb32e8a22f719bf', '花粉过敏', '3', '2004-05-13', '--', '花粉过敏', '480a63e56a5948e59e2b242ece855e06');
INSERT INTO `t_diseasehistory` VALUES ('d565905883624571b9ca1e3554a825b6', '色盲', '0', '1994-02-02', '--', '红绿色盲', 'b3edd5d0f5c5499fb586bb3679bf22d1');

-- ----------------------------
-- Table structure for t_diseasetype
-- ----------------------------
DROP TABLE IF EXISTS `t_diseasetype`;
CREATE TABLE `t_diseasetype` (
  `uuid` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `level` int(5) NOT NULL,
  `parentTypeUuid` varchar(50) NOT NULL DEFAULT '',
  `last` int(5) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`uuid`),
  KEY `fk_dt_parentType` (`parentTypeUuid`),
  CONSTRAINT `fk_dt_parentType` FOREIGN KEY (`parentTypeUuid`) REFERENCES `t_diseasetype` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_diseasetype
-- ----------------------------
INSERT INTO `t_diseasetype` VALUES ('0b6e4241738f496ca7da55c8bd208ef7', '新生儿科', '2', '4091875628174f00804eb6dc4369964b', '1');
INSERT INTO `t_diseasetype` VALUES ('0d3bffa05e46482e94ae73e6655f4e4f', '神经内科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('0e0c5c6191fb413795f5d922756c788e', '风湿免疫科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('1', '疾病', '0', '1', '-1');
INSERT INTO `t_diseasetype` VALUES ('1447e10989c24977b900d9cb256a163c', '眼科', '2', '5a6379adedf5470a8d3e2ce4f036c72d', '1');
INSERT INTO `t_diseasetype` VALUES ('1cfe6a6319354e94acca8eec666253d0', '耳鼻咽喉科', '2', '5a6379adedf5470a8d3e2ce4f036c72d', '1');
INSERT INTO `t_diseasetype` VALUES ('1edf0dc123994074be96b3312c805e49', '乳腺外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('3e6faccf92f043799e45dd05d4b08a0f', '骨外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('4091875628174f00804eb6dc4369964b', '儿科', '1', '1', '0');
INSERT INTO `t_diseasetype` VALUES ('41ab5b8f41ad4a67b62d0a3f9ec761c0', '老年病科', '1', '1', '1');
INSERT INTO `t_diseasetype` VALUES ('4206e1af55d3476da42c0afb7991be62', '头颈外科', '2', '5a6379adedf5470a8d3e2ce4f036c72d', '1');
INSERT INTO `t_diseasetype` VALUES ('4a8dff0a5cb948febb9bb7ae5b6d4807', '肝胆外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('4bc6118467b04ca79218213cc7ff411a', '心胸外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('4d535d6894194a10ba692b18c3403202', '脑外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('529b867548a74b3ab16fbc6a9d8c5536', '急诊科', '1', '1', '1');
INSERT INTO `t_diseasetype` VALUES ('54ed112b233f434689157550e544e24c', '小儿科', '2', '4091875628174f00804eb6dc4369964b', '1');
INSERT INTO `t_diseasetype` VALUES ('5841bfd583ea466bba6b76d923c7ab14', '血液病科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('5a6379adedf5470a8d3e2ce4f036c72d', '五官科', '1', '1', '0');
INSERT INTO `t_diseasetype` VALUES ('5f340527f1744d6e8b3d598834d853f8', '消化内科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('673204b46eea4dee864f060262bf0e40', '口腔科', '2', '5a6379adedf5470a8d3e2ce4f036c72d', '1');
INSERT INTO `t_diseasetype` VALUES ('688172d78d3b46b49e3ce2ddb27cda20', '外伤科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('7043db3aa4ec448baaa30698a2541006', '器官移植', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('7d653d6f430f44a88b2e5fe03630d0a6', '肛肠外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('85c5845d479746a5b25e591fe51738a7', '心血管内科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('91e523d9fe9e4370a2c72f5ab2522da7', '整形烧伤科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('9f5df2d97fe440688fa58df94200d9ca', '内分泌科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('c08a936176aa4a8d85756117249aedb8', '呼吸内科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('c8c9cc2431324da09f38057139e47b5b', '肾内科', '2', 'fae6ec2141334910a3c3e6bfdf25e44c', '1');
INSERT INTO `t_diseasetype` VALUES ('d4b3144f54544089a47df61ea97a122e', '胃肠外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('d86c047bfb9849b284c04d294e6c53fc', '外科', '1', '1', '0');
INSERT INTO `t_diseasetype` VALUES ('e2e2ea17bbdf472b9e588102f0fbfa31', '精神心理科', '1', '1', '1');
INSERT INTO `t_diseasetype` VALUES ('e3cc484423d84df9ba7da794c69466f2', '泌尿外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('e56157aae4864f01b6fe6e7557f96083', '心血管外科', '2', 'd86c047bfb9849b284c04d294e6c53fc', '1');
INSERT INTO `t_diseasetype` VALUES ('fae6ec2141334910a3c3e6bfdf25e44c', '内科', '1', '1', '0');

-- ----------------------------
-- Table structure for t_doctor
-- ----------------------------
DROP TABLE IF EXISTS `t_doctor`;
CREATE TABLE `t_doctor` (
  `uuid` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `photo` varchar(255) NOT NULL,
  `sex` int(5) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `diploma` int(5) DEFAULT NULL,
  `description` longtext,
  `title` int(5) NOT NULL,
  `department_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_doctor
-- ----------------------------
INSERT INTO `t_doctor` VALUES ('0543717c208a4a85886365ae3e2df130', 'doctor1', '$2a$10$7CaKtrF9TlvUuINst/cn0uXPDjsuy.QRHfDeSOGav3/XJd8VyFoYe', 'doc_001', '王医生', 'http://cdn.upshi.cn/chsis/doctor/account/2d4d86942b6c45f590dbe44b128e258d.jpg', '0', '15309338221', '2', '内科医生', '4', 'dd31ceaf836c480fbb2256614dbce906');
INSERT INTO `t_doctor` VALUES ('097d0de052554d4f9cbc35f8f7f341c9', 'doctor2', '$2a$10$UIPFFf92agX7nwAASYCMR.Lvct8GYmbN/LjFxmy.jylVam7ZMSc5a', 'doc_002', '李医生', 'http://cdn.upshi.cn/chsis/doctor/account/0dc13435299848dfafb149624fd31751.jpg', '0', '15309338225', '3', '口腔科医生', '4', 'd0214cc49e46416c8442ffd7ce6b1ecc');
INSERT INTO `t_doctor` VALUES ('bc6c40e5a764473abb2608937125cf60', 'doctor3', '$2a$10$ExaLF.0CRQ6Lqqc65Cuw6uwZQgbF1koJLtN8dOo2waaxzPMz/JCH.', 'doc_003', '张医生', 'http://cdn.upshi.cn/chsis/doctor/account/3bdd98b7596b4d0fabbd9a5e36b0ab6f.jpg', '0', '18239430844', '3', '老年病科医生', '3', '9300f89be4db4ae784ecf83690557d38');

-- ----------------------------
-- Table structure for t_family
-- ----------------------------
DROP TABLE IF EXISTS `t_family`;
CREATE TABLE `t_family` (
  `uuid` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `householder_uuid` varchar(255) NOT NULL,
  `community_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_family
-- ----------------------------
INSERT INTO `t_family` VALUES ('1584e23d717b440c90347af6bb0f6bd4', '392448', '18537531029', '兰州市七里河区阳光小区163号', '7d15e9976cb2429995cda5f39fb8a5f5', '1');
INSERT INTO `t_family` VALUES ('7638fa79d3d74b0198045efd81c148a1', '519453', '18394200920', '兰州市七里河区阳光小区173号', 'e181d5588ec44538b748782418c4f606', '1');
INSERT INTO `t_family` VALUES ('a446f220c0894505b0a799185854fd2a', '351354', '18239430884', '七里河区进取路123号', '94eb6d6e066d44a8a1d5726915005d14', '1');

-- ----------------------------
-- Table structure for t_hospital
-- ----------------------------
DROP TABLE IF EXISTS `t_hospital`;
CREATE TABLE `t_hospital` (
  `uuid` varchar(255) NOT NULL,
  `number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hospital
-- ----------------------------
INSERT INTO `t_hospital` VALUES ('a625702fd847431a99f9c34d4526dfcd', 'h_001', '阳光社区医院', '兰州市七里河区', '二级甲等社区医院');

-- ----------------------------
-- Table structure for t_hospital_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_hospital_manager`;
CREATE TABLE `t_hospital_manager` (
  `uuid` varchar(255) NOT NULL,
  `managerUuid` varchar(255) NOT NULL,
  `hospitalUuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `fk_hm_hospitaluuid` (`hospitalUuid`),
  KEY `fk_hm_manageruuid` (`managerUuid`),
  CONSTRAINT `fk_hm_hospitaluuid` FOREIGN KEY (`hospitalUuid`) REFERENCES `t_hospital` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_hm_manageruuid` FOREIGN KEY (`managerUuid`) REFERENCES `t_manager` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_hospital_manager
-- ----------------------------
INSERT INTO `t_hospital_manager` VALUES ('eeb39b0d82f54a559631cd4edefa1fc7', 'a58bb63c59984f099f9459191e7269ef', 'a625702fd847431a99f9c34d4526dfcd');

-- ----------------------------
-- Table structure for t_immunerecord
-- ----------------------------
DROP TABLE IF EXISTS `t_immunerecord`;
CREATE TABLE `t_immunerecord` (
  `uuid` varchar(255) NOT NULL,
  `patient_uuid` varchar(255) NOT NULL,
  `immuneTime` varchar(255) NOT NULL,
  `hospital_uuid` varchar(255) NOT NULL,
  `vaccine` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_immunerecord
-- ----------------------------
INSERT INTO `t_immunerecord` VALUES ('28f44e14e0c946eea93344dc09d28f32', '480a63e56a5948e59e2b242ece855e06', '2016-06-03 15:26:24', 'a625702fd847431a99f9c34d4526dfcd', '脊髓灰质炎活疫苗');
INSERT INTO `t_immunerecord` VALUES ('2e09e0f248b34c0f8f5af480c71a857d', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-05-17 17:03:22', 'a625702fd847431a99f9c34d4526dfcd', '狂犬疫苗');
INSERT INTO `t_immunerecord` VALUES ('30fefbaa510b4dbb9b3e0faa1df8b8ca', 'e181d5588ec44538b748782418c4f606', '2016-05-17 16:35:50', 'a625702fd847431a99f9c34d4526dfcd', '狂犬疫苗');
INSERT INTO `t_immunerecord` VALUES ('3affd48b972e4658bcb9944946800b09', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-06-02 17:12:16', 'a625702fd847431a99f9c34d4526dfcd', '破伤风免疫球');
INSERT INTO `t_immunerecord` VALUES ('5e05ae946dc34fbd8a143ba9b40a0aa2', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-02 17:09:56', 'a625702fd847431a99f9c34d4526dfcd', '流行性乙型脑炎疫苗');
INSERT INTO `t_immunerecord` VALUES ('681951f347094db3852ed2fb5d4c5da7', '480a63e56a5948e59e2b242ece855e06', '2016-06-03 15:27:30', 'a625702fd847431a99f9c34d4526dfcd', '水痘疫苗');
INSERT INTO `t_immunerecord` VALUES ('73195fa2e69d43ccacd7cc0e3e28726f', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-03 15:00:21', 'a625702fd847431a99f9c34d4526dfcd', '乙脑灭活疫苗 ');
INSERT INTO `t_immunerecord` VALUES ('7cdc0f07383f49e0bb586f860716a8ee', '9c42c3ed93964560b76cc78712ae013c', '2016-05-17 15:49:59', 'a625702fd847431a99f9c34d4526dfcd', '狂犬疫苗');
INSERT INTO `t_immunerecord` VALUES ('90b85e6d42ab4ddeabed13ffbf7ae495', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-02 17:11:34', 'a625702fd847431a99f9c34d4526dfcd', '破伤风免疫球');
INSERT INTO `t_immunerecord` VALUES ('d4a6511f917846cb8def858e2876801d', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-05-17 16:35:15', 'a625702fd847431a99f9c34d4526dfcd', '狂犬疫苗');
INSERT INTO `t_immunerecord` VALUES ('dde2cf17c32043648ad4c93ffe33133f', '480a63e56a5948e59e2b242ece855e06', '2016-06-03 15:26:59', 'a625702fd847431a99f9c34d4526dfcd', '麻疹疫苗');

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `uuid` varchar(255) NOT NULL,
  `user_uuid` varchar(255) NOT NULL,
  `userType` int(5) NOT NULL,
  `time` varchar(255) NOT NULL,
  `operation` varchar(255) NOT NULL,
  `detail` longtext NOT NULL,
  `state` int(5) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_log
-- ----------------------------
INSERT INTO `t_log` VALUES ('1', '1', '0', '20160212', '1', '我往往会无法v比较烦一百一十一', '1');
INSERT INTO `t_log` VALUES ('bdd0a15666084e5597d7b46e997e8fda', '2', '1', '2016', '1', '111', '1');
INSERT INTO `t_log` VALUES ('d9e020b3f11e43bba7ecb69084f9edfe', '2', '1', '2016', '1', '111', '1');
INSERT INTO `t_log` VALUES ('e8a2ec237dcd477fb220faa89c8e9363', '2', '1', '2016', '1', '111', '1');

-- ----------------------------
-- Table structure for t_manager
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `uuid` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `type` int(5) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1029ccbc28bbd48bc92664e1c0992ad', 'admin', '$2a$10$N42n3sxJFb3kocwqzwPESe2d7ZbniUAQF2aEigadmSiSv57sUMzei', '王文静', '18394338773', '2');
INSERT INTO `t_manager` VALUES ('a58bb63c59984f099f9459191e7269ef', 'hm_001', '$2a$10$qokaYAfGZnUEdQ/ZW52tJ.t0eyI.hyLuZAIs.KlGOaUbM26NeNHXe', '阳光社区医院管理员', '18509122919', '0');
INSERT INTO `t_manager` VALUES ('c0960f97d3a342ddabe850263edb4b2a', 'checker_01', '$2a$10$MOb/Qx4QoTk/dMx.qDiqTuWOudy82HhbQgM6mfw/fYbTABbNKc7kq', '阳光社区新闻审核员', '18693209871', '1');

-- ----------------------------
-- Table structure for t_medicalrecord
-- ----------------------------
DROP TABLE IF EXISTS `t_medicalrecord`;
CREATE TABLE `t_medicalrecord` (
  `uuid` varchar(255) NOT NULL,
  `patient_uuid` varchar(255) NOT NULL,
  `time` varchar(255) NOT NULL,
  `doctor_uuid` varchar(255) NOT NULL,
  `disease` varchar(255) DEFAULT NULL,
  `result` longtext,
  `state` int(5) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_medicalrecord
-- ----------------------------
INSERT INTO `t_medicalrecord` VALUES ('00a784b3dda24aed9bd0aa57aae4bd77', '94eb6d6e066d44a8a1d5726915005d14', '2016-02-04 10:42:18', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '糖尿病', '0');
INSERT INTO `t_medicalrecord` VALUES ('00ed261fad44441ca7676e0efbeea7db', '94eb6d6e066d44a8a1d5726915005d14', '2016-05-04 10:34:08', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('01e601a856064b9096a48ac6d4fe2dcd', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-05-17 16:33:34', '097d0de052554d4f9cbc35f8f7f341c9', '27da461014574a279d86f9fd53348d56', '关节炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('0584fa3aa62a4bd0b3e61861ef3a83b6', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-06-04 10:49:21', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('081b059187364faf9ddb0504602940e8', '9c42c3ed93964560b76cc78712ae013c', '2015-09-04 10:58:41', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('08f3e609f14b406a91af6cb6de875ae2', '480a63e56a5948e59e2b242ece855e06', '2015-06-04 11:08:17', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('12c97f0a8d624e3290e00cc9234e0948', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-04-04 10:22:56', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('14cd86fc1c0a4851a021c5017943154a', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-05-17 15:59:49', '0543717c208a4a85886365ae3e2df130', '8c25c3a2105e4c3ea78cc5e1357e6ef9', '注意休息，按时吃药。hsajhsjash', '1');
INSERT INTO `t_medicalrecord` VALUES ('182d785b90d14aa0965db429e622deda', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-01-14 10:21:51', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('19658363240f4e61b8e9b55980c07f93', '94eb6d6e066d44a8a1d5726915005d14', '2016-02-04 10:20:29', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('19769e42baf34e449c6d0a2c47dcc256', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-12-04 10:59:04', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('1b20a80df67a4ace9033059cc0ffe7a4', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-07-04 11:58:21', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('1b5145a6cfb64d4782a85ff6df114336', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-06-04 13:13:41', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('1ccefe1d935745209e2dd8bce6df8963', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-06-04 10:41:34', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '糖尿病', '0');
INSERT INTO `t_medicalrecord` VALUES ('1f47854cabe64058976fd19231bebfa8', '480a63e56a5948e59e2b242ece855e06', '2015-11-04 11:08:48', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('2196a01d42454240879501f8025d0cef', '7d15e9976cb2429995cda5f39fb8a5f5', '2015-01-04 11:24:53', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('22ccba906083405e851345e4cb138f86', '94eb6d6e066d44a8a1d5726915005d14', '2015-06-04 11:12:37', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('23e3d7e3d0bd4009ad08c2d9fdec2969', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-02-04 11:27:14', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('24f21cff95404760acc215e13402a2d0', '94eb6d6e066d44a8a1d5726915005d14', '2016-03-04 10:35:18', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('2729a1725b134d3988f145872bf2ffd0', 'e181d5588ec44538b748782418c4f606', '2015-07-04 11:13:25', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('27f64dc88bde4fc5a852ea5fdc3d08e5', 'e181d5588ec44538b748782418c4f606', '2015-03-04 11:35:25', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('287caec55edb4372b7b46cb59cdf861b', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-09-04 12:05:16', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('2d0237be3e554a1e8032fde219670667', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-04 12:02:37', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('32977d23c16a41e08962d4e235bc7487', '9c42c3ed93964560b76cc78712ae013c', '2016-05-17 16:06:11', '0543717c208a4a85886365ae3e2df130', 'f4ee4aee50594536985d3ed532dbb2b6', '尽量减少骨质疏松症患者摔倒几率，以减少髋骨骨折以及Colles骨折。', '1');
INSERT INTO `t_medicalrecord` VALUES ('358eaf8758084e25a1450d5181e4f323', '7d15e9976cb2429995cda5f39fb8a5f5', '2015-02-04 11:11:41', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('36cf16c8cb9c4334b15b36852977721d', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-04 12:03:26', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('370f4b1944a047ff9a0fc7736a3772db', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-04-04 11:36:10', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('38f42a8385e7482f9334fc73581c432f', '9c42c3ed93964560b76cc78712ae013c', '2016-02-04 10:44:33', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('39f0fd58f0714f87ab4bbabecbb007b1', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-06-04 20:53:11', '0543717c208a4a85886365ae3e2df130', 'c0fb614a13094c5cadb4c4a4bc48f559', '胃病', '0');
INSERT INTO `t_medicalrecord` VALUES ('3bf1472afb8449cb9d10a32992dc79a2', '7d15e9976cb2429995cda5f39fb8a5f5', '2015-05-04 11:26:06', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('3e6742a491ed4f8db2c9c9963825a5b7', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-06-04 11:37:40', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('3e6d6980c0ed4aeca733903c3a01dc66', '7d15e9976cb2429995cda5f39fb8a5f5', '2015-07-04 10:57:16', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('404711a84ebf48df9a4d5797054209e8', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-09-04 10:41:09', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('40f90112f96d4703b775794ae5fa90a6', '94eb6d6e066d44a8a1d5726915005d14', '2015-01-04 12:10:17', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('4253f8e41ed84964911bd8afc572284b', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-03-04 10:15:36', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('440f7dd92a614bebbcd7bdb448a699bb', '480a63e56a5948e59e2b242ece855e06', '2016-04-04 11:43:31', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('4935a52ec4cc41e7a8f3b6f981b4340a', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-02 17:07:55', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '感冒，吃药，注意休息。', '1');
INSERT INTO `t_medicalrecord` VALUES ('4b36cbd927db43e2a7559c7d5997cb1d', 'e181d5588ec44538b748782418c4f606', '2016-04-04 10:21:01', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('4fd541d9028e4f2ca3fcd578fa536fd0', 'e181d5588ec44538b748782418c4f606', '2015-06-04 11:12:05', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('502d020c58b54f52bc701879e49d325c', '9c42c3ed93964560b76cc78712ae013c', '2015-06-04 10:47:53', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('50f9082661124450bcdc87dabe928f0a', '480a63e56a5948e59e2b242ece855e06', '2015-07-04 11:23:19', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('53b9350fa4c945e283734187ff6bb16f', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-03-04 10:43:31', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('55163ca3a1d54a51b605c9acf3e614a8', '94eb6d6e066d44a8a1d5726915005d14', '2016-04-04 12:00:37', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('5533be2303fa4bb49da143caa3951360', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2016-06-04 12:03:03', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('567e14e4823b4a96bb93001229d52f40', '9c42c3ed93964560b76cc78712ae013c', '2015-08-04 11:36:38', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('5800202982b74327a51e7f53e2a36eb6', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-04-04 12:07:32', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('597b4c051c484c788554549c4501d19a', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-05-04 10:39:58', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('5a049e2676c546c79d81e73824d80cbf', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-02-03 15:02:42', '097d0de052554d4f9cbc35f8f7f341c9', '43452b5dae0f442589fd4c9bd95bc595', '鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('5adad8e6dd054d2ba623cdc2f439314f', '9c42c3ed93964560b76cc78712ae013c', '2015-09-04 11:38:32', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('60c0a93971df4862880478cc99117c6e', '94eb6d6e066d44a8a1d5726915005d14', '2015-02-04 12:08:41', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('62421d246588411e831f519bbdf3a07c', '94eb6d6e066d44a8a1d5726915005d14', '2015-07-04 12:05:50', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('64e815135d8d4bfb89cde7c86cbd1181', 'e181d5588ec44538b748782418c4f606', '2016-04-04 11:44:39', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('7099da97e97a455499d702943b9850a0', 'e181d5588ec44538b748782418c4f606', '2015-08-04 10:58:02', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('70b0e1562d994c59b6bff50efb10f064', '7d15e9976cb2429995cda5f39fb8a5f5', '2015-10-04 11:23:48', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('745e408619d34f14b0d124a3bb2523f4', '9c42c3ed93964560b76cc78712ae013c', '2016-05-17 15:58:17', '0543717c208a4a85886365ae3e2df130', 'c0fb614a13094c5cadb4c4a4bc48f559', '胃绞痛', '1');
INSERT INTO `t_medicalrecord` VALUES ('81a424d2beaa4a62bcdd78a2a7ab244c', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-11-04 11:38:06', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('857f619601c64a528e659571f7e26708', '94eb6d6e066d44a8a1d5726915005d14', '2015-06-04 11:06:43', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('87aeba2b52644ffd88f48d02d7fd061d', '94eb6d6e066d44a8a1d5726915005d14', '2015-12-04 11:26:45', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('890ad1474310405bb01c04d1d68d8547', '94eb6d6e066d44a8a1d5726915005d14', '2015-07-14 11:05:40', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('8a95938122ee42658154177d376f6d65', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-11-04 10:59:26', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('8acd27121e0941119fc4a90bee40e44a', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2016-06-13 07:21:22', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '吃药', '0');
INSERT INTO `t_medicalrecord` VALUES ('8af0960ffb20473997e1892421d33715', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-05-04 11:14:14', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('8afaa216c8874f9fb24be3d8841a833f', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-03-04 12:07:54', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('8bfbad76bf48430098a113173b1eb680', '94eb6d6e066d44a8a1d5726915005d14', '2015-10-04 12:04:53', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('8c7bd416229d4d2d8f586e9083efbffa', '7d15e9976cb2429995cda5f39fb8a5f5', '2015-10-04 11:00:59', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('8e95d47e942444c8a5349d1baeb0dfd5', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-13 10:05:33', '0543717c208a4a85886365ae3e2df130', '06f755fc856a463fa34aa1389a45baa7', null, '0');
INSERT INTO `t_medicalrecord` VALUES ('9388f792602a4802a785a14bfc15a1f7', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-06-13 15:19:29', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', null, '0');
INSERT INTO `t_medicalrecord` VALUES ('93f1e931872f4f87b79a49bf963714ec', 'e181d5588ec44538b748782418c4f606', '2015-04-04 11:49:50', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('94efca08cda54e10bd4e4fe4dc58ea54', '480a63e56a5948e59e2b242ece855e06', '2015-05-04 10:14:09', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('95260dfe4d424b98a2bd6dd2e3ad37cc', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-05-27 20:58:50', '0543717c208a4a85886365ae3e2df130', '3830800f9df9454eb1512128949eff55', '没有大碍。', '1');
INSERT INTO `t_medicalrecord` VALUES ('98e6835dbf864e72b886088e3e565a0a', '480a63e56a5948e59e2b242ece855e06', '2016-06-04 12:13:18', '0543717c208a4a85886365ae3e2df130', 'a38ddefa5e2e4007b17537426617b26f', '高血压', '1');
INSERT INTO `t_medicalrecord` VALUES ('9b41eaeed17e42748ce2c172d2a2258d', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2016-06-13 08:53:47', '0543717c208a4a85886365ae3e2df130', '06f755fc856a463fa34aa1389a45baa7', null, '1');
INSERT INTO `t_medicalrecord` VALUES ('9c8116f723e441e69eee8a14317bdcaa', 'e181d5588ec44538b748782418c4f606', '2016-06-13 09:50:15', '0543717c208a4a85886365ae3e2df130', '2d95f1dbe61b41968628c8654cd037f0', '呜呜呜呜', '0');
INSERT INTO `t_medicalrecord` VALUES ('9c8177442a064bd5a848c9ccd46d4225', 'e181d5588ec44538b748782418c4f606', '2015-09-03 15:16:56', '097d0de052554d4f9cbc35f8f7f341c9', null, null, '0');
INSERT INTO `t_medicalrecord` VALUES ('9d3b9b3ef55440c4b78c8cb4a1f976cf', '94eb6d6e066d44a8a1d5726915005d14', '2016-05-08 10:32:49', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('9db9df56fdb8427c87aa32030864473f', '480a63e56a5948e59e2b242ece855e06', '2016-05-04 10:16:13', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('9e0274e2bcf64bb79ddadf17eada0806', '94eb6d6e066d44a8a1d5726915005d14', '2016-04-14 10:23:21', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('9fabc700791f4dee92bb3a533a82b967', '94eb6d6e066d44a8a1d5726915005d14', '2015-06-04 10:48:58', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('a29291fc5cf2434e845c8c2e4085016f', '94eb6d6e066d44a8a1d5726915005d14', '2015-01-04 11:48:58', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('a2a4b198b0a34682b239bb7aee15e966', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2015-04-04 10:47:31', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('a460215279b84115b449d3aabfbe7fad', '94eb6d6e066d44a8a1d5726915005d14', '2016-04-04 10:32:09', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('a71c07e5497b489b9406be5c922f98e6', '94eb6d6e066d44a8a1d5726915005d14', '2015-03-04 11:29:48', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('a9106a8c69894816885e1a3532b38f10', 'e181d5588ec44538b748782418c4f606', '2016-05-17 16:31:56', '097d0de052554d4f9cbc35f8f7f341c9', '36d89109e9094681a241d185d5cd5342', '镜片碎，划破上下眼睑，需要缝针。一周后来拆线。', '1');
INSERT INTO `t_medicalrecord` VALUES ('aacf2ce0ec934f388d58480d2454192f', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-04-04 11:45:05', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('ad60045ba65d4db48f7e6cdc0baad918', '94eb6d6e066d44a8a1d5726915005d14', '2015-03-04 11:39:37', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('adc06a62cbe549619beb109184c48b0a', '94eb6d6e066d44a8a1d5726915005d14', '2015-02-04 12:09:58', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('afa7f4d4c0924cca9964901d67d5dd9b', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-12-04 12:03:48', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('b16b0e11d937438e9238d8ec31cd4541', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-05-17 15:38:31', '0543717c208a4a85886365ae3e2df130', '3b9d8255d5a844709c25f79e73839f5e', '骨关节炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('b2f75f7a4ec04015a586019ff68dfc3e', 'e181d5588ec44538b748782418c4f606', '2016-03-04 11:53:41', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('b38bb172353341c4bd6cea08703faacb', 'e181d5588ec44538b748782418c4f606', '2016-05-27 19:12:00', '0543717c208a4a85886365ae3e2df130', '6d4ad93bd1354f288b65ca753b7b8767', '注意休息，放松，不要迫于压力。', '1');
INSERT INTO `t_medicalrecord` VALUES ('b6ec16d823fa409ea2a87f46f3233aff', '480a63e56a5948e59e2b242ece855e06', '2015-04-04 11:20:32', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('b962b4a704044f798227a73b4e2e346d', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-06-04 10:39:30', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('baa679789b954865bcfe4ad4c20530a9', '480a63e56a5948e59e2b242ece855e06', '2016-03-04 10:49:44', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('bc86fc16c041412da7473bb46bee9e2b', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-06-04 12:07:01', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('c3e29e725ce64815907491cf8b3e6471', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-03-04 11:18:51', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('c4db0ac009d64098a32375c78c2191f5', '94eb6d6e066d44a8a1d5726915005d14', '2015-11-04 12:04:08', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('c62ffcb485f14c2480c2508969ef5143', '9c42c3ed93964560b76cc78712ae013c', '2016-01-04 11:37:15', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('cad4c4942bff4df8b04f7d821e776678', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-06-04 12:06:42', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('cd2f8730ca9848a8b91734098dbba9cb', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-05-04 10:47:03', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('d0366df2c8c94c90b1e81b71e9f09d15', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-03-04 10:54:14', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('d0d37d94a1224a3da78c7162df7e30f2', 'e181d5588ec44538b748782418c4f606', '2015-02-04 11:01:23', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('d344bec6f77d49358684cc9529676892', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2015-01-04 10:56:24', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('d36269f22332485da82ba45cab183824', '9c42c3ed93964560b76cc78712ae013c', '2016-03-04 10:22:28', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('d50da12fd2894904939f5e91d6f7882d', '94eb6d6e066d44a8a1d5726915005d14', '2016-02-04 11:39:12', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('d56514ab7bd642dc8b24f6c335789d09', '94eb6d6e066d44a8a1d5726915005d14', '2016-06-02 17:14:18', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('d5b3c4d0d7834ca4a064a75e77dd5bd0', '94eb6d6e066d44a8a1d5726915005d14', '2015-06-04 11:14:40', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('d6093f1469704b66a90695af3dd2f16f', '480a63e56a5948e59e2b242ece855e06', '2016-06-03 15:23:33', '097d0de052554d4f9cbc35f8f7f341c9', 'e7e6868b732b4afb8505e169bc443d13', '卧床休息直至腮腺肿胀完全消退。注意口腔清洁，避免酸性食物，保证液体摄入量，氦氖激光局部照射治疗流行性腮腺炎对止痛、消肿有一定效果。', '1');
INSERT INTO `t_medicalrecord` VALUES ('d83795a0eb27425baad9cd0ff292afc3', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-03-04 10:43:04', '097d0de052554d4f9cbc35f8f7f341c9', 'b6135b7cd162451386fb84052aa4fd98', '过敏性鼻炎', '1');
INSERT INTO `t_medicalrecord` VALUES ('d87a3354a407441bae671e0660bd7dfb', 'e181d5588ec44538b748782418c4f606', '2016-06-13 07:53:03', '0543717c208a4a85886365ae3e2df130', null, null, '0');
INSERT INTO `t_medicalrecord` VALUES ('d8cac9187e0d4c37a75870dcf9c5f195', 'e181d5588ec44538b748782418c4f606', '2015-04-04 11:49:19', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('da83997f9f974e208a33a85c4fd4f218', '94eb6d6e066d44a8a1d5726915005d14', '2016-03-04 11:25:45', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('e09668daab124651beadf11c89d94167', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-05-17 15:50:28', '0543717c208a4a85886365ae3e2df130', '8c25c3a2105e4c3ea78cc5e1357e6ef9', '水痘，挂水，多休息，少吃肉。', '1');
INSERT INTO `t_medicalrecord` VALUES ('e49a346f8ba74c0d82692139c1f53cf9', '94eb6d6e066d44a8a1d5726915005d14', '2015-04-04 11:35:46', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('e554d22394ff45e09dd5e948e6932ba8', '94eb6d6e066d44a8a1d5726915005d14', '2015-03-04 11:45:27', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('ecc3e6d5321542059728fab1b53ecfe2', '7d15e9976cb2429995cda5f39fb8a5f5', '2016-05-04 11:24:16', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('f192da62c1fc4da0afa35d5346ea4e4c', '7d15e9976cb2429995cda5f39fb8a5f5', '2015-04-04 11:57:58', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('f2c445b504a949b68670c2a28c7cb0d0', '480a63e56a5948e59e2b242ece855e06', '2016-03-04 12:23:11', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('f769a3799ba24095a0857c76e30ceaa6', 'f3f6f4127daa49e6ba5136caf2f4f63b', '2016-03-04 10:42:00', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '糖尿病', '0');
INSERT INTO `t_medicalrecord` VALUES ('f7a4fe3936e54057b8b31c274ff35db5', '9c42c3ed93964560b76cc78712ae013c', '2016-03-03 14:13:25', '097d0de052554d4f9cbc35f8f7f341c9', '7eda410921424c8e90332578923acff0', '长智齿，吃消炎药，一周后来我院复查。', '0');
INSERT INTO `t_medicalrecord` VALUES ('f81ebec9abb8441299a18bf7b45c3351', '94eb6d6e066d44a8a1d5726915005d14', '2015-06-04 12:06:19', 'bc6c40e5a764473abb2608937125cf60', '06f755fc856a463fa34aa1389a45baa7', '老年人糖尿病', '1');
INSERT INTO `t_medicalrecord` VALUES ('f897686be97a4f9e8456ac7ce0d65f4d', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-06-03 09:29:46', '0543717c208a4a85886365ae3e2df130', '2891aa7fa6274843b7d9f23cf9c88e07', '打生理盐水，吃温性食物。', '1');
INSERT INTO `t_medicalrecord` VALUES ('fb2200d4fb6f4366b491b05f0a583860', 'b3edd5d0f5c5499fb586bb3679bf22d1', '2016-05-17 16:58:05', '097d0de052554d4f9cbc35f8f7f341c9', 'c0f0f4cd7b8b42c292f7c5afea61c042', '脚气，多穿棉质袜子，按时涂药，按时吃药，两周痊愈。', '1');
INSERT INTO `t_medicalrecord` VALUES ('fbeddee591a64d1e8625eff213d29fe6', '480a63e56a5948e59e2b242ece855e06', '2016-06-04 20:51:48', '0543717c208a4a85886365ae3e2df130', 'f9cd4136cab74e5db75d731200c861b0', '流行性感冒', '1');
INSERT INTO `t_medicalrecord` VALUES ('fcf75a3c817b47cc94bda09f778a5fbe', 'e181d5588ec44538b748782418c4f606', '2016-05-17 16:32:54', '097d0de052554d4f9cbc35f8f7f341c9', '8c25c3a2105e4c3ea78cc5e1357e6ef9', '多喝水，按时吃药。', '1');

-- ----------------------------
-- Table structure for t_news
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `uuid` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `authorUuid` varchar(255) NOT NULL,
  `authorType` int(5) NOT NULL,
  `authorName` varchar(255) NOT NULL,
  `type` int(5) NOT NULL,
  `content` longtext NOT NULL,
  `submitTime` varchar(255) NOT NULL,
  `checkTime` varchar(255) DEFAULT NULL,
  `publishTime` varchar(255) DEFAULT NULL,
  `state` int(5) NOT NULL,
  `checker_uuid` varchar(255) DEFAULT NULL,
  `click` int(10) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('02d4bb0f19b740d0baa72b0cf4f0c96e', '本月发病率统计', '1029ccbc28bbd48bc92664e1c0992ad', '2', '王文静', '3', '<p><br></p><p><img src=\"http://cdn.upshi.cn/chsis/news/images/0c9da045311c4976ae24faf8a4f5b1c9.png\" style=\"width: 1044px;\"><br></p>', '2016-06-09 10:03:32', '2016-06-09 10:03:59', '2016-06-09 10:03:59', '2', 'c0960f97d3a342ddabe850263edb4b2a', '7');
INSERT INTO `t_news` VALUES ('0831ef31356844708c87b5a23812340c', '在家门口享受免费体检', 'a58bb63c59984f099f9459191e7269ef', '1', '阳光社区医院管理员', '2', '<p style=\"text-indent: 25pt; line-height: 1.8;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">日前，在阳光社区火花村，当地医务人员上门为65岁以上老人免费体检，将“健康福利”送到家门口。</font></span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">\n\n</font></span></p><p style=\"line-height: 1.8;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">　 &nbsp;</span><span style=\"text-indent: 33.3333px; font-size: 18px;\">阳光社区</span><span style=\"font-size: 18px;\">将“‘健康福利’送到家”纳入常态化管理，每年春夏时节组织医护人员携带检查设备进村入户，</span></font></p><p style=\"line-height: 1.8; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp;免费为65岁以上老人进行健康体检，有\n针对性地提出进一步检查方案和疾病治疗的建议意见，</span></font></p><p style=\"line-height: 1.8; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp;引导老人注重健康保养，疾病早防早治，让老人安享健康幸福晚年。</span></font></p>', '2016-05-17 18:40:57', '2016-06-12 15:29:37', null, '1', 'c0960f97d3a342ddabe850263edb4b2a', '11');
INSERT INTO `t_news` VALUES ('0f6849dbeeaa4d3e9dc2e31696d06786', '免费体检,服务老年人', 'a58bb63c59984f099f9459191e7269ef', '1', '阳光社区医院管理员', '2', '<p style=\"line-height: 1.8;\">&nbsp;<span style=\"font-size: 18px;\"><font face=\"宋体\"> 为全面提升农村医疗卫生服务保障能力，让农村群众享受更多的便利和实惠，日前,阳光社区王庆坨医院在辖区内组织开展了65岁以上老人的免费健康体检活动。</font></span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">&nbsp; 此次阳光社区医院专门成立了公共卫生中心，开辟出100余平方米的空间，配备了常规体检、血常规、心电图等多项体检项目，为全镇22个村街， \n8000位老人提供免费体检服务。卞文旭老人说：到时候人家一通知，都通知的到。老两口一检查省好几百，有什么潜在病也能查出来，自己能瞧去。这挺好。曹学俊老人说：“原来体检得上医院，老人出家门口走到这太方便了。而且这还一气呵成好多项目。”</font></span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">&nbsp; 据了解，阳光社区将以此为契机，继续大力实施基本公共卫生服务项目，扎实开展农民健康体检工作，提高农村医疗卫生服务综合能力。阳光社区医院副院长朱宝杰说：“现在呢咱从建了这个体检室之后，保证了化验结果的准确。”</font></span></p>', '2016-06-12 15:36:03', '2016-06-12 15:36:41', '2016-06-12 15:36:41', '2', 'c0960f97d3a342ddabe850263edb4b2a', '2');
INSERT INTO `t_news` VALUES ('16c3b02a58c44dacab7dab2c3eea7b25', '糖尿病与口腔健康', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '1', '<p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　据了解，牙周病是糖尿病的第六大并发症。牙周病不会引起糖尿病，但两者同时存在时却会相互影响。据调查显示，我国成人牙周病的患病率高达80%—90%。其中，糖尿病患者比非糖尿病患者患牙周病的风险高近9倍，且糖尿病患者患有牙周病后的血糖则更难控制。</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">&nbsp; &gt;&gt;&gt;&gt; </span><strong><span style=\"font-size: 14px;\">血</span></strong><strong><span style=\"font-size: 14px;\">糖不稳增加牙周病患病风险</span></strong></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　牙周病和糖尿病的其它并发症一样，与血糖控制密切相关。糖尿病患者对存在于牙颈部的结石的机械刺激以及牙菌斑内细菌释放的毒素缺乏抵抗力，牙周\n组织易受伤害。而糖尿病人如果血糖不稳定，则更容易患上牙周病，而且会比血糖稳定的糖尿病人失去更多的牙齿，对于糖尿病人来说，控制血糖对牙周病的控制有\n利。</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　&gt;&gt;&gt;&gt; </span><strong><span style=\"font-size: 14px;\">刷牙老出血 或因糖尿病</span></strong></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　口腔是消化道的门户，也是防治病从口入的关键。但现实生活中，糖尿病专科医生和患者对于牙周病的认识却还不够。实际上，如果糖尿病患者刷牙时牙\n龈容易出血，或牙齿早早松动，不仅提示可能患上牙周病，往往还提示糖尿病患者的血糖没有得到很好的控制。对于普通人来说，如果牙周病久治不愈，则怀疑可能\n有糖尿病，可以检查一下血糖。</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　&gt;&gt;&gt;&gt; </span><strong><span style=\"font-size: 14px;\">“糖友”要控制血糖 定期检查口腔</span></strong></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\"> \n</span><span style=\"font-size: 14px;\"> \n</span><span style=\"font-size: 14px;\"> \n</span><span style=\"font-size: 14px;\"> \n</span><span style=\"font-size: 14px;\"> \n</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　对于近期内血糖升高难以控制者，在排除其他病因情况下，应务必检查牙周状况。在牙齿松动等牙周治疗的同时，也应注意有无糖尿病的存在，以利于牙周病的治疗。</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">&nbsp; 　糖尿病患者在关注自己血糖的同时，要注意：</span></p><span style=\"font-size: 14px;\"> \n</span><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　 ①坚持每天刷牙，保持良好的口腔卫生；</span></p><span style=\"font-size: 14px;\"> \n</span><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　 ②严格控制血糖，有利于牙周疾病的控制；</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">&nbsp; &nbsp;③定期进行口腔检查。</span></p><span style=\"font-size: 14px;\"> \n</span><p style=\"line-height: 1.8;\"><span style=\"font-size: 14px;\">　　当发现牙周病的任一危险信号时，一定要去正规医院找专业医生进行诊治。这些信号包括：刷牙时牙龈出血，经常有难闻的口臭，牙龈肿痛，牙龈萎缩，牙缝变大，牙齿松动等，这不仅提示患者可能患有糖尿病，还能作为糖尿病患者血糖控制不良的风向标。</span></p>', '2016-05-17 18:34:45', '2016-06-12 14:44:17', '2016-06-12 14:44:17', '2', 'c0960f97d3a342ddabe850263edb4b2a', '8');
INSERT INTO `t_news` VALUES ('21ab3adaca364ffb8a0ce63ca2223c91', '高校毕业生社区就业”招募通知', '1029ccbc28bbd48bc92664e1c0992ad', '2', '王文静', '3', '<h1 style=\"margin-left: 25px;\"><p style=\"margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">一、招募范围</span></strong></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">招募范围为省内普通高校2013—2015届未就业的毕业生、省外普通高校2013—2015届未就业的山东生源毕业生。要求本科及以上学历，并符\n合报考岗位专业要求。今年我市“三支一扶”招募36人、“社区就业”计划中“社区服务”招募4人。已签订就业协议的大学生、往年被招募的“三支一扶”、\n“社区就业”计划大学生、被国家其他基层服务项目录取过的大学生不得再次报考。</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">二、网上报名</span></strong></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">2015年6月24日9:00—6月28日17:00分别在“山东高校毕业生就业信息网”和“山东省教育厅高校毕业生就业网”进行报名。</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">三、资格审查</span></strong></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">对报考人员的资格审查工作，贯穿整个招募工作的全过程。进入面试的报考人员，在面试人员名单确定之后，需向市“三支一扶”办公室提交本人相关证明材\n料，包括：1、山东省2015年高校毕业生“三支一扶”(含“社区就业”)计划报名表(附件1);2、身份证原件及复印件;3、就业报到证原件及复印件。\n4、毕业证和学位证原件及复印件。省外普通高校毕业生在进行资格审查时，除需提供以上材料外，还应提供家庭户口簿，应届毕业生未获得报到证的，可先提供复\n印件加盖毕业学校印章的普通高等学校录取新生名册。资格审查时间、地点另行通知。</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">凡有关材料主要信息不实，影响资格审查结果的，招募机关有权取消该报考人员参加面试的资格。</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">取得面试资格的人员，在规定时间内未提交有关材料的，视为弃权。经审查不具备报考条件的人员，取消其面试资格。因弃权或取消资格出现的岗位上的人员空缺，按笔试成绩依次递补。</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">四、招募方式</span></strong></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">1、笔试</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">笔试由省“三支一扶”办公室统一组织，全省统一命题，统一考试时间。考试时间为2015年7月4日(周六)下午2：00-5:00。考试地点和相关\n要求等见《笔试准考证》。笔试科目为《综合知识和能力测验》。为保证招募人员基本素质，笔试将根据岗位招募人数和实际情况设定最低合格分数线。</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">2、面试</span></p><span style=\"font-size: 18px;\">\n</span><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">面试人员从达到笔试合格分数线的报考人员中，按照1:2的比例由高分到低分依次确定。面试具体事宜另行通知。</span></p></h1>', '2016-06-12 15:12:20', '2016-06-12 15:13:45', '2016-06-12 15:13:45', '2', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_news` VALUES ('2343dcdb50394e6d817fa4c09d972993', '这些“减肥食品”不减肥', '0543717c208a4a85886365ae3e2df130', '0', '王医生', '0', '<p style=\"line-height: 1.8;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 健康饮食是减肥的必修课，而健康食品的挑选更是大有学问在呢！有很多看似健康的食品，或者一些在我们常识范围内被认为是健康的食品，其实含有大量的热量和脂肪。只要稍不留神就会让它们有机可乘，进入你的减肥食谱了！下面给减肥的姐妹们提个醒，要对自己的减肥菜单把好关哦！</p><p style=\"line-height: 1.8;\"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 汤</strong> \n<br></p><p>　　事实上很多种汤都是营养丰富、健康美味的，同时又可以让人吃得饱，是减肥推荐食品之一。然而值得注意是，西式的浓汤往往用奶油或牛奶作为原料，一小碗就含大量热量了。因此，喜欢吃西餐的美眉可要注意啦！ 中式的炖汤也请自己判断，汤上漂了一层油的记得撇清再喝。 </p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 无糖xx </strong> \n<br></p><p>　　不要以为“无糖”就意味着“安全”了，其实这只会引诱你吃得更多罢了!很多标榜“无糖”的食品，会让你一开始就放松警戒，如果毫无节制地吃下去，想不胖都不行了。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>咖啡</strong> \n</p><p>　　对于每天早上都要用一大杯咖啡来唤醒自己的你来说，下面这个必定是好消息了：咖啡本身是零卡路里的。不过并不是每个人都只是喝不加糖不加奶的苦咖啡吧?咖啡的热量含量取决于它所添加的调味品及咖啡的份量，为了减肥，你要看着办哦。</p><p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 沙拉调味品</strong> \n<br></p><p>　　一些研究发现，每天吃大量沙拉的女性，她们每天的总脂肪摄入量的60%来自沙拉调味品。随便地把一些干酪、多士或者熏肉粒扔到你的沙拉上面，立即就会让把你的健康午餐给破坏!</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>干果和麦片</strong> \n</p><p>　　干果不包含水份，这意味着它们的热量密度非常高。比如葡萄干、苹果干和杏仁这些食品看起来都很健康，但是事实上它们暗含的高热量是不可忽视的。\n吃一点是可以的，但如果你以为可以坐下来慢慢享受这些“低卡”食品，你就错了。麦片也是一样的道理，所以份量还是很重要的，任何时候都不要放纵自己。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>果汁和汽水</strong> \n</p><p>　　你可能会以为，只是一瓶饮料罢了，没什么大不了的。但是你得想想，早上一杯果汁，下午一瓶汽水，加上一边喝饮料一边吃的小零食，额外的400卡\n路里就是这样轻易地“入侵”你的身体了。把饮料等同于“水”的概念是要不得的，热量就是每次一点点积累起来，你不能不考虑长期后果啊。</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>低脂/低卡食品</strong> \n</p><p>　　所谓的“低脂”、“低卡”仅仅是障眼法罢了，多低也不会是“零卡路里”的。比如一块低脂蛋糕，其实只是比普通蛋糕的脂肪含量低那么一点点罢了，\n却可以轻易把你骗到，让你放心地吃下一整块。要记住，蛋糕毕竟是蛋糕，下次再看到“低脂”、“低卡”的标签可要打醒十二分精神啦，其他食品也一样!</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b>坚果 </b>\n</p><p>　　事实上，坚果通常是健康的，它们富含蛋白质和维生素。不过，它们的健康是有前提的，仅仅是当你吃一小份的时候。比如花生，很少人会吃一把就停下\n来吧?很多人一吃起来就没完没了，一定要吃完一包或者见到罐底才肯罢休。而坚果的脂肪和热量含量都是很高的，如果你一边看着这篇文章又刚好一边抱着一罐果\n仁，就要小心啦!</p><p><br></p><p><br></p><p><br></p><p><br></p><p><br></p><p style=\"line-height: 1.8;\"><br></p>', '2016-05-17 18:20:39', '2016-05-17 18:51:40', '2016-05-17 18:51:40', '2', 'c0960f97d3a342ddabe850263edb4b2a', '5');
INSERT INTO `t_news` VALUES ('36c4e9704a944752a2abd95b044510f2', '拔牙注意事项', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '0', '<h3 style=\"line-height: 2; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">（1）请在确保你吃饱了饭的情况下来拔牙，女性朋友要避开月经期．</span><br><span style=\"font-size: 18px;\">（2）如果你身体有什么其他的疾病，或者对什么药物过敏，请及时跟医生说明．</span><br><span style=\"font-size: 18px;\">（3）许多时候拔牙会需要用到锤子，请做好心理准备．</span></font></h3>', '2016-06-12 14:37:43', '2016-06-12 15:03:26', '2016-06-12 15:03:26', '2', 'c0960f97d3a342ddabe850263edb4b2a', '9');
INSERT INTO `t_news` VALUES ('38ccd24bfb9d4cbdb2d86ebd306593cc', '社区专职工作人员体检', '1029ccbc28bbd48bc92664e1c0992ad', '2', '王文静', '3', '<p style=\"text-indent:2em\">按照市民政局2016年社区专职工作人员招聘工作有关要求，经过笔试和面试，眼光社区招聘计划，共计49名考生进入体检和考察环节，具体工作安排如下：</p><p style=\"text-indent:2em\"><b>一、体检和考察时间：</b></p><p style=\"text-indent:2em\">体检时间为6月14日上午9:00至10:00进行，未按规定时间、地点参加体检的人员，视为自动放弃。</p><p style=\"text-indent:2em\">考察时间为6月20日至22日，不配合招考单位在规定时间进行考察的人员，视为自动放弃。</p><p style=\"text-indent:2em\">对体检和考察自动放弃以及不合格人员，招聘单位将根据招聘名额，按照考试总成绩从高到低的顺序依次递补。</p><p style=\"text-indent:2em\"><b>二、体检地点：</b></p><p style=\"text-indent:2em\">阳光社区医院三楼</p><p style=\"text-indent:2em\">地址：广开新街28号</p><p style=\"text-indent:2em\">联系电话：27457228</p><p style=\"text-indent:2em\"><b>三、体检标准</b></p><p style=\"text-indent:2em\">根据市民政局统一要求，体检项目和标准参照《公务员录用体检通用标准(试行)》执行。</p><p style=\"text-indent:2em\"><b>四、体检需携带证件及物品：</b></p><p style=\"text-indent:2em\">1、身份证;</p><p style=\"text-indent:2em\">2、面试准考证;</p><p style=\"text-indent:2em\">3、本人1寸近期免冠彩色证件照1张;</p><p style=\"text-indent:2em\">4、体检费用280元，由考生自理，现场缴纳至南开区中医院。</p><p style=\"text-indent:2em\">以上证件及物品缺一不可，如因此影响体检顺利进行的，取消资格。</p><p style=\"text-indent:2em\"><b>五、体检注意事项：</b></p><p style=\"text-indent:2em\">1、体检当天9:00开始，参加体检人员务必准时到达指定地点，禁止家属陪同;</p><p style=\"text-indent:2em\">2、体检前三天饮食宜清淡，禁烟禁酒，体检前一晚12时后需禁食禁水;</p><p style=\"text-indent:2em\">3、请考生自备签字笔，现场填写表格使用;</p><p>\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n</p><p style=\"text-indent:2em\">4、考生在体检期间应服从工作人员安排，严禁他人替检、严禁弄虚作假，一经发现取消录取资格。</p>', '2016-06-12 15:09:50', '2016-06-12 15:17:08', '2016-06-12 15:17:08', '2', 'c0960f97d3a342ddabe850263edb4b2a', '4');
INSERT INTO `t_news` VALUES ('5e87cb3a03974254b9bcfcf53ecb8ffa', '召开安全生产工作会议', '1029ccbc28bbd48bc92664e1c0992ad', '2', '王文静', '3', '<p style=\"margin-left: 25px;\">&nbsp; &nbsp;5月16日下午，阳光社区张书记根据社区实际情况，召开了社区网格长安全生产工作会议。</p><p style=\"margin-left: 25px;\">&nbsp; &nbsp;会上，张书记首先向大家传达了新春街道办事处安全生产工作会议的精神，并对辖区安全生产及消防安全事故隐患排查进行了具体安排。</p><p>&nbsp; &nbsp;张书记要求各网格长重点排查辖区内库房及辖区内销售的产品是否为易燃易爆危险品，排查各饭店煤气使用情况，居民区变电箱附近是否存在易燃易爆危险品。</p><p>\n\n</p><p>&nbsp; &nbsp;最后张书记再次强调，对存在隐患的单位，各网格长要及时督促整改，杜绝一切隐患的发生，为居民营造一个平安和谐的生活环境。</p>', '2016-05-17 18:24:11', '2016-06-12 14:44:41', '2016-06-12 14:44:41', '2', 'c0960f97d3a342ddabe850263edb4b2a', '6');
INSERT INTO `t_news` VALUES ('6e44da8825954dd3b381e25def41c670', '为阳光社区儿童免费体检', 'a58bb63c59984f099f9459191e7269ef', '1', '阳光社区医院管理员', '2', '<p style=\"text-indent: 2em; line-height: 1.8;\"><span style=\"font-size: 18px;\">为了</span><span style=\"font-size: 18px;\"><font face=\"宋体\">全面了解幼儿的身体发育状况，及时发现疾病和身体的异常情况，及时的有针对性的进行防范与治疗，按照国家基本公共卫生服务规范要求，近日，区市中社区卫生服务中心对辖区内五所托幼机构内近4000名4-6岁学龄前儿童开展了免费健康体检活动。</font></span></p><p style=\"text-indent: 2em; line-height: 1.8;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">儿\n童健康体检包括体格检查、视力检查、营养评价、儿童贫血筛查等项目。体检的同时还向幼儿宣传卫生知识，比如手足口病、肠道疾病等儿童常见病防治知识的宣传\n教育，教育儿童从小养成良好的卫生习惯，对孩子的疾病做到早发现早治疗。体检结束后，医务人员还按照卫生部制定的标准，对儿童健康状况进行了综合评价，提\n出相应的健康建议，并及时反馈给学校老师和家长。</font></span></p>', '2016-05-17 18:39:48', '2016-05-17 18:52:30', '2016-05-17 18:52:30', '2', 'c0960f97d3a342ddabe850263edb4b2a', '2');
INSERT INTO `t_news` VALUES ('71e15501bc5b48c880b01a713e6b7544', '须重视孩子的六龄齿', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '0', '<p style=\"line-height: 1.4; margin-left: 25px;\">&nbsp; &nbsp;&nbsp;<span style=\"font-size: 18px;\"><font face=\"宋体\">出生三个月到两岁半左右，生长的牙齿我们称为乳牙，家长都知道这副牙长大后要脱落，被恒牙所替换。</font></span></p><p style=\"line-height: 1.4; margin-left: 25px;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">&nbsp; &nbsp;儿童自六岁左右，恒牙开始萌出，乳牙依次替换，到12周岁左右，乳牙替换完毕。这一阶段，儿童的口腔内既有乳牙又有恒牙，通常称为替牙期。</font></span></p><p style=\"line-height: 1.6; margin-left: 25px;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">&nbsp; &nbsp;六龄齿是六岁左右萌出的恒牙。医学上称为第一恒磨牙。在胚胎四个月，第一恒磨牙胚即已发生，新生儿时第一恒磨牙胚已经钙化，当孩子到六岁左右，在上\n下乳牙列的后部萌出，外形较之乳磨牙大，且牙面窝、沟、点隙多。上下颌的第一磨牙的位置关系，对建立正常的咬合起重要的作用，亦是临床检查牙合关系，修复\n设计，颌骨骨折和错牙合分类等诊断或治疗效果的参照标准之一。六龄齿容易被家长忽视，因为它没有替换的乳牙，直接萌出，加之有的孩子喜食甜的、粘性大的食\n物，没有良好的卫生习惯，如刷牙方法不当、没有耐心等，很容易造成龋坏，而家长往往认为“大牙”要换的，没有治疗必要，小洞变大洞，引起牙髓炎，甚至根尖\n周炎，造成孩子不必要的痛苦，错失了治疗的机会，可怕的是造成终生缺牙。</font></span></p><p style=\"line-height: 1.4;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">\n</font></span></p><p style=\"line-height: 1.4; margin-left: 25px;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">&nbsp; &nbsp;在六岁到十三岁之间，家长要定期带孩子到医院检查，必要时可做窝沟封闭术，窝沟封闭术是目前预防龋齿最有效的方法。另外，还要培养孩\n子良好的卫生习惯及饮食习惯，总之，对六龄齿要做到早期预防，发现龋齿早期治疗。最后，定期进行口腔检查，孩子在一周岁时要进行第一次检查，以后每半年或\n一年检查一次。通过定期口腔检查可以早发现龋齿病，及早治疗。</font></span></p>', '2016-06-12 14:42:57', '2016-06-12 14:54:51', '2016-06-12 14:54:52', '2', 'c0960f97d3a342ddabe850263edb4b2a', '4');
INSERT INTO `t_news` VALUES ('776c1446725b43a08838c31ee5276f65', '口腔反应出的健康信号都有什么？', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '0', '<p>&nbsp; &nbsp;尽管口腔异味和牙齿发黄并不是病，但这些症状却是身体健康出现问题的信号。俄罗斯“医学论坛”新闻网便盘点口腔所反应出的健康信号。</p><p>&nbsp; &nbsp;<strong>1、口腔异味或为肝病预警</strong></p> \n<p>　　如果你定期用牙线清洁牙齿，用漱口水漱口，但口中仍有异味，那么这可能是机体某部位有严重病症的表现，如胃功能紊乱、消化不良以及肝病。</p> \n<p>　　<strong>2、牙黄可能是经常用药标志</strong></p> \n<p>　　经常用药会导致牙黄，如我们经常用来对抗粉刺的四环素类抗生素，治疗牙床病的口腔清洗剂以及高血压药都会导致牙黄。改变牙黄现状最好的办法是专业漂白，但不要自己尝试用牙刷漂白，因为这样只能去除牙齿表面的污斑，对于改善牙齿颜色没有任何影响。</p> \n<p>　　<strong>3、口腔干燥或为糖尿病征兆</strong></p> \n<p>　　有时口腔干燥只是脱水、饮酒和吸烟无度的症状，但有时则可能是糖尿病的并发症状。</p> \n<p>　　<strong>4、应注意牙龈出血问题</strong></p> \n<p>　　一半的人刷牙后经常会有牙龈出血现象，而这也是导致齿龈炎的原因。如果不及时治疗，就会导致保护牙齿的组织感染，引起牙周炎。严重的话会引起牙床腐蚀，甚至渗透到颌骨中并导致牙齿脱落。</p> \n<p>　　<strong>5、溃疡和经常的小伤或为癌症预警</strong></p> \n<p>　　外伤如果在一至两周内都没有痊愈，应该及时就医。当我们免疫系统的免疫功能下降时易引起口腔溃疡。如果一直有这个困扰，应去医生处检查，因为口腔溃疡有导致口腔癌的危险。</p>', '2016-05-17 18:31:26', '2016-05-17 18:52:38', '2016-05-17 18:52:38', '2', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_news` VALUES ('839cfbd70ad448d0a89fe9b2b2712b8b', '食品药监局进社区宣传食品安全', '1029ccbc28bbd48bc92664e1c0992ad', '2', '王文静', '3', '<p style=\"line-height: 2;\"><font face=\"幼圆\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; 4月15日上午，未央区老龄科技教育协会、未央区食品药监局在红旗社区联合举办了《关注食品安全 保障健康生活》讲座。未央区食品药监局在讲座现场积极开展食品药品安全知识咨询宣传活动，发放宣传资料，营造了浓厚的宣传氛围。</span></font></p><p style=\"line-height: 2;\"><font face=\"幼圆\"><span style=\"font-size: 18px;\">&nbsp; &nbsp; 此次讲座聘请了西北大学生态毒理研究所、陕西省老科协农业分会史志诚教授为大家讲解了食品安全的概念、《食品安全法》立法的由来及历程、转基因食品知识、有\n毒食物及食物中毒的预防等知识，讲解通俗易懂、生动有趣，获得了社区居民的好评。讲座结束后，未央区食品药监局工作人员发放了食品安全及食品安全城市创建\n宣传资料，积极回答群众关心的食品安全问题，推广“未央食药”微信公众号，丰富了广大人民的食品药品安全知识，增加了人民群众创建食品安全城市知晓率，为\n辖区人民群众筑牢“舌尖上的安全”打下坚实基础。</span></font></p>', '2016-05-17 18:26:00', '2016-05-17 18:53:16', '2016-05-17 18:53:16', '2', 'c0960f97d3a342ddabe850263edb4b2a', '4');
INSERT INTO `t_news` VALUES ('845e460876634a2a9ed803a466170130', '牙科医生提醒', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '0', '<p><span style=\"font-size: 18px;\">洗牙的病人：</span></p><p><span style=\"font-size: 18px;\">&nbsp; &nbsp;您好！</span></p><h4 style=\"line-height: 1.8;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">（1）洗牙不会洗到你的牙齿松掉，如果松了，就表示你有很严重的牙周炎，这是在你洗牙之前已经发生的事情了．<br></span></font><font face=\"宋体\"><span style=\"font-size: 18px;\">（2）如果你有鼻炎的话，最好在来洗牙之前得到控制，用一下滴鼻水之类的东西，因为洗牙时会有许多的水在嘴里，最好是用鼻子来呼吸．如果还是用嘴巴呼吸的话很容易呛到．<br></span></font><font face=\"宋体\"><span style=\"font-size: 18px;\">（3）预防总是胜于治疗的，别等到你的牙龈出血很厉害，或者是牙龈萎缩，牙齿松动的时候才来洗牙，那时候可能已经为时已晚．<br></span></font><font face=\"宋体\"><span style=\"font-size: 18px;\">（4）洗牙可以洗掉你牙齿上面的牙石和色素，如果你的牙齿底色本来就是黄黄的，想它变白的话，就只好去做漂白了。<br></span></font><span style=\"font-size: 18px;\"><font face=\"宋体\">（5）想怀孕的朋友，在怀孕之前最好先洗洗牙，检查你的牙龈健康情况，因为在牙龈发炎的基础下，激素的升高会使原来的炎症更加明显，表现出来的可能是牙龈增生得非常可怕．</font></span></h4>', '2016-06-12 14:35:26', '2016-06-12 14:45:18', '2016-06-12 14:45:19', '2', 'c0960f97d3a342ddabe850263edb4b2a', '2');
INSERT INTO `t_news` VALUES ('9085fb9f043a44d9b34652bce8c62116', '牙医提醒慎选进口儿童牙刷', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '1', '<p style=\"line-height: 2; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; 不同国家的儿童牙刷都有自己的国家标准，这是由不同国家的孩子生长发育情况不同所决定的，因此，购买儿童牙刷，并不一定是进口的好于国产的。</span></font></p><p style=\"line-height: 2; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp;“和成人一\n样，孩子使用牙刷也要讲究口感舒适、清洁干净，要有效抑制牙菌生成，且不同年龄段的孩子使用的牙刷也有区别。”陈医生建议，家长在给孩子挑选儿童牙刷时，\n切不可“崇洋媚外”，一定要从牙刷的材质、执行标准等方面仔细选择。</span></font></p><p style=\"line-height: 2; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; 同时，尽量挑选牙刷头较小的牙刷使用，因为孩子的口腔较小，使用较大牙刷头的牙刷，容\n易造成口腔出血，引起肿痛，而且也很难有效清洁口腔和保护牙齿健康。</span></font><span style=\"font-size: 18px;\">﻿</span><br></p>', '2016-06-12 15:00:10', '2016-06-12 15:03:35', '2016-06-12 15:03:35', '2', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_news` VALUES ('9356fb75b917438c9bddaf2a917c3f50', '家用榨油机健康使用', '0543717c208a4a85886365ae3e2df130', '0', '王医生', '1', '<p style=\"color: rgb(122, 118, 118); line-height: 2;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">&nbsp; &nbsp;健康，熟悉而又陌生的字眼，人人都想要健康，却总敌不过生活的摧残。随处可见琳琅满目的美食真是让人无法抗拒，却接连曝光各种有关食品的安全问题，让我们的饮食健康受到威胁。</font></span></p><p style=\"color: rgb(122, 118, 118); line-height: 2;\"><span style=\"font-family: 宋体; font-size: 18px;\">&nbsp; &nbsp;地沟油就在我们身边。</span><span style=\"font-family: 宋体; font-size: 18px;\">2011年</span><span style=\"font-family: 宋体; font-size: 18px;\">，</span><span style=\"font-family: 宋体; font-size: 18px;\">公安部首次破获</span><span style=\"font-family: 宋体; font-size: 18px;\">利用地沟油制售食用油案件</span><span style=\"font-family: 宋体; font-size: 18px;\">，</span><span style=\"font-family: 宋体; font-size: 18px;\">共摧毁涉及14个省的“地沟油”犯罪网络，捣毁 “黑工厂”“黑窝点”6个，抓获32名主要犯罪人</span><span style=\"font-family: 宋体; font-size: 18px;\">，</span><span style=\"font-family: 宋体; font-size: 18px;\">这是一条集掏捞、粗炼、倒卖、深加工、批发、零售等六个环节的地沟油黑色产业链。地沟油的生产都规模化产业化了？这是何等的可怕！</span></p><p style=\"color: rgb(122, 118, 118); line-height: 2;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp;&nbsp;</span><span style=\"font-weight: 700; font-size: 18px;\">是健康饮食必需品原因之一：</span><span style=\"font-weight: 700; font-size: 18px;\">家用榨油机</span><span style=\"font-weight: 700;\"><span style=\"font-size: 16px;\"></span></span><span style=\"font-size: 16px;\"><br></span></font></p><p style=\"color: rgb(122, 118, 118); line-height: 2;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">　　</span><span style=\"font-size: 18px;\">专家</span><span style=\"font-size: 18px;\">预测，目前我国每年返回餐桌的地沟油有200万-300万吨</span><span style=\"font-size: 18px;\">，</span><span style=\"font-size: 18px;\">而中国人1年的动、植物油消费总量大约是2250万吨——也就是说，按照比例，你吃10顿饭</span><span style=\"font-size: 18px;\">就</span><span style=\"font-size: 18px;\">有1顿碰上地沟油。</span></font></p><p style=\"color: rgb(122, 118, 118); line-height: 2;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp;&nbsp;</span><span style=\"font-weight: 700; font-size: 18px;\">原因之二：</span></font></p><p style=\"color: rgb(122, 118, 118); line-height: 2;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">　　</span><span style=\"font-size: 18px;\">品牌油，是大多数家庭的首选。但是在一个个类似于蒙牛、伊利这些国内大品牌丑 闻的曝出之后，您还觉得只要是品牌就可以信赖吗？长期以来，品牌油就存在着很多问题和争议，人们长期食用调和油，却没有人知道调和油究竟是调和了哪些油， 直到现在调和油都只有企业标准，没有国家标准。食用油是人体脂肪的主要获取来源，其品质的还坏很大程度上影响着我们的身体健康，千万不要为了增色菜肴而吃 油，要从营养健康层面考虑油的质量。</span></font></p><p style=\"color: rgb(122, 118, 118); line-height: 2;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp;&nbsp;</span><span style=\"font-weight: 700; font-size: 18px;\">未来家庭的健康生活少不了家用榨油机</span><span style=\"font-size: 16px;\"><br></span></font></p><p style=\"color: rgb(122, 118, 118); line-height: 2;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">　　</span><span style=\"font-size: 18px;\">自榨油神器——</span><span style=\"font-size: 18px;\">爱帮分子榨油机</span><span style=\"font-size: 16px;\"><span style=\"font-size: 18px;\">采用纯物理古法压榨方式，不含有任何的化学添加成分，为初榨油；油温＜</span><span style=\"font-size: 18px;\">45</span><span style=\"font-size: 18px;\">°，避免了高温对油分子活性的破坏，最大限度的保留了原油料中所含的营养素；不仅获国家新型专利及</span><span style=\"font-size: 18px;\">3C</span><span style=\"font-size: 18px;\">认证，更是中国家用榨油机协会重点推荐产品。</span></span></font></p>', '2016-06-13 10:32:47', '2016-06-13 15:21:39', null, '1', 'c0960f97d3a342ddabe850263edb4b2a', '4');
INSERT INTO `t_news` VALUES ('9993bf3d43734d19aaf6d12d573149ce', '5个坏习惯很伤牙', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '1', '<p style=\"line-height: 1.8; margin-left: 25px;\"><span style=\"font-size: 18px;\">微笑时露出洁白的牙齿会让人看起来更健康性感。英国曼彻斯特一位名为塔拉奇·艾德利的牙科专家提醒，生活中一些习惯会在不知不觉中破坏牙齿。</span></p><p style=\"line-height: 1.8; margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">咀嚼饮料中的冰块</span></strong></p><p style=\"line-height: 1.8; margin-left: 25px;\"><span style=\"font-size: 18px;\">冰块的脆性和低温会造成牙齿破裂，它们会导致</span><a href=\"http://www.eyar.com/html/boke/2013/0703/1904.html\" target=\"_blank\" class=\"keylink\"><span style=\"font-size: 18px;\">牙釉质</span></a><span style=\"font-size: 18px;\">的表面出现微小的裂纹;随着时间的推移，就会引发更大的牙科问题。如果你实在想喝冰镇饮料，可以用碎冰块，它对牙齿的危害性小些。</span></p><p style=\"line-height: 1.8; margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">常喝柠檬汁、茶和咖啡</span></strong></p><p style=\"line-height: 1.8; margin-left: 25px;\"><span style=\"font-size: 18px;\">这些饮料不仅会给牙齿染色，还会腐蚀牙齿。茶和咖啡中的咖啡因含量较高，这就会让口腔发干，更容易患</span><a href=\"http://www.eyar.com/html/communication/2013/0820/455.html\" target=\"_blank\" class=\"keylink\"><span style=\"font-size: 18px;\">蛀牙</span></a><span style=\"font-size: 18px;\">。在给牙齿染色方面，茶的效果更强，这是因为茶中的单宁酸是比咖啡因更强效的染色剂。然而，喝咖啡所造成的牙齿被染色只是浅层的生物膜，并没有穿透</span><a href=\"http://www.eyar.com/html/boke/2013/0703/1904.html\" target=\"_blank\" class=\"keylink\"><span style=\"font-size: 18px;\">牙釉质</span></a><span style=\"font-size: 18px;\">本身。有些人会用喝柠檬汁来代替咖啡和茶，殊不知，这会导致牙齿受到更严重的腐蚀。</span></p><p style=\"line-height: 1.8; margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">游泳时老张嘴</span></strong></p><p style=\"line-height: 1.8; margin-left: 25px;\"><span style=\"font-size: 18px;\">如果你经常在游泳池里游泳，就会发现牙齿受到了损害。被放入游泳池的化学物质(特别是氯)与</span><a href=\"http://www.eyar.com/html/boke/2013/0703/1904.html\" target=\"_blank\" class=\"keylink\"><span style=\"font-size: 18px;\">牙釉质</span></a><span style=\"font-size: 18px;\">被腐蚀有关。《美国牙科杂志》报道在含氯量非常高的游泳池里游泳仅仅34周，就会造成牙齿被腐蚀和超级敏感。为防止牙齿受损，游泳时应闭上嘴，或是在海里游泳。</span></p><p style=\"line-height: 1.8; margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">用硬毛牙刷</span></strong></p><p style=\"line-height: 1.8; margin-left: 25px;\"><span style=\"font-size: 18px;\">有些人认为牙刷的质地越硬越好，事实并非如此，特别是对于</span><a href=\"http://www.eyar.com/html/boke/2013/0805/2612.html\" target=\"_blank\" class=\"keylink\"><span style=\"font-size: 18px;\">老年人</span></a><span style=\"font-size: 18px;\">，硬毛牙刷会起到适得其反的作用。随着年龄的增长，牙龈会萎缩，牙根部暴露，增加了牙齿的敏感性。硬毛牙刷会刺激牙龈，导致牙齿敏感。</span></p><p style=\"line-height: 1.8; margin-left: 25px;\"><strong><span style=\"font-size: 18px;\">把牙齿当工具来用</span></strong></p><p style=\"line-height: 1.8; margin-left: 25px;\"><span style=\"font-size: 18px;\">\n\n\n\n\n\n\n\n\n\n</span></p><p style=\"line-height: 1.8; margin-left: 25px;\"><span style=\"font-size: 18px;\">有很多人用牙齿来完成稀奇古怪的工作，如撕下衣服上的价签，打开一包薯片，拉开指甲油的瓶盖等。这些坚硬的物品会给牙齿造成损伤，或是牙齿的边缘破裂。</span></p>', '2016-06-12 14:38:57', '2016-06-12 14:55:02', '2016-06-12 14:55:02', '2', 'c0960f97d3a342ddabe850263edb4b2a', '4');
INSERT INTO `t_news` VALUES ('9cda4ee2ddea4e4dbc54f0f990bd9260', '“减肥食品”不减肥', '0543717c208a4a85886365ae3e2df130', '0', '王医生', '0', '<p><b>“减肥食品”不减肥</b><br></p>', '2016-06-02 16:21:36', '2016-06-02 16:22:57', null, '1', 'c0960f97d3a342ddabe850263edb4b2a', '3');
INSERT INTO `t_news` VALUES ('a570f6b89d1a4f2e9432e13483631820', '牙根生病者慎做烤瓷牙', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '0', '<p style=\"line-height: 1.8;\"><span style=\"background:white;padding:10px\">&nbsp; 从相关咨询活动现场获悉，如今美牙不再是女性的专利，在上海市第九人民医院、仁爱医院等口腔门诊，前去做烤瓷牙的男性占了三四成。但是口腔医生提醒，美牙也有门槛，并非人人都能跨入此门槛。<br></span></p><p>　\n　据不完全统计，美牙的人数正逐月增加，每月增长的幅度在5％左右。而连日来，要求做烤瓷牙的男士特别多，其中以20岁至40岁的中青年男士居多。他们大\n多为四环素牙或牙齿不齐、破损者，希望通过美牙改变形象，能更好地融入社会生活。与女性明显不同的是，男士做烤瓷牙更重视原材料和质量，以求一劳永逸。</p><p><span style=\"background:white;padding:10px\"><br></span></p><p>　　在越来越多的人决定做烤瓷牙的时候，口腔专家提醒人们：并非所有人都适合做烤瓷牙。第九人民医院口腔修复科的医生特别指出，有口腔疾病的人，特别是牙根在“生病”的人应该慎选。此外，18岁以下的未成年人、怀孕或者哺乳期的女性也不适合做烤瓷牙。</p><p><span style=\"background:white;padding:10px\"><br></span></p><p>　\n　口腔医生同时提醒，做了烤瓷牙并不等于一劳永逸，小心保护十分重要。由于原材料原因，大多数烤瓷牙受力程度有限，一旦超过这个力度，很容易损坏牙齿，甚\n至影响它的寿命，因此，初戴时应先吃软的食物，最好不要用烤瓷牙啃硬骨头、吃螃蟹等食物。烤瓷牙与基牙的接合处容易聚集菌斑，形成牙石，应注意清洁，牙缝\n间可用牙线清洁，并定期到医院检查、洁牙。</p><p><span style=\"background:white;padding:10px\"><br></span></p><p>　　哪些牙适合做烤瓷牙：</p><p><span style=\"background:white;padding:10px\"><br></span></p><p>　　牙齿缺失，并且邻牙健康，没有炎症，经医生检查可考虑做烤瓷牙修复；</p><p><span style=\"background:white;padding:10px\"><br></span></p><p>　　牙齿颜色或形态不佳，如四环素牙等；</p><p><span style=\"background:white;padding:10px\"><br></span></p><p>　　牙列形态异常又不宜做矫正治疗的；</p><p><span style=\"background:white;padding:10px\"><br></span></p><p>　　因外伤而折断的牙齿或残留的牙根，如牙根有足够的长度，牙周情况又较好时，经过完善的根管治疗，可进行烤瓷牙修复；</p><p><span style=\"padding: 10px; background-image: initial; background-attachment: initial; background-size: initial; background-origin: initial; background-clip: initial; background-position: initial; background-repeat: initial;\"><br></span></p><p>&nbsp; 龋齿或牙齿缺损较大，牙齿变色呈灰色或黄褐色，可通过烤瓷牙恢复美观并增加强度。</p>', '2016-06-12 14:41:06', '2016-06-12 14:45:41', '2016-06-12 14:45:41', '2', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_news` VALUES ('a7a6b04d67c4490e8c93c3b8e0db3a45', '日常基本口腔健康小常识', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '0', '<h2 style=\"text-align: left; margin-left: 25px;\"><b><span style=\"font-size: 14px;\">&nbsp;</span><font color=\"#083139\" face=\"宋体\"><span style=\"font-size: 14px;\">口腔健康小常识一：如何选购牙刷</span></font></b></h2><h2 style=\"text-align: left; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 14px;\">\n	　选购牙刷的时候，最好选购直三排、横六束、刷头小、刷毛柔软且刷毛末端磨圆的保健牙刷，因为这种牙刷在口内可以运作自如，尤其是牙齿的死角较容易刷。</span></font></h2><h2 style=\"text-align: left; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 14px;\">\n	　</span><font color=\"#083139\"><b style=\"box-sizing: border-box; font-weight: 700; font-size: 18px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: 20px; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; background-color: rgb(255, 255, 255);\"><span style=\"font-size: 14px;\">口腔健康小常识二：掌握刷牙的正确方法</span></b></font></font></h2><h2 style=\"text-align: left; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 14px;\">\n	　首先注意刷牙的力度不宜太大，然后再刷干净牙齿的几个面。</span></font></h2><h2 style=\"text-align: left; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 14px;\">\n	　一、刷外面：将牙刷刷头放在牙齿与牙龈边缘呈45度角，轻柔地来回刷，然后将牙刷顺着牙缝刷，上牙从上往下刷，下牙从下</span></font><span style=\"font-size: 14px; font-family: 宋体; color: inherit; line-height: 1.1;\">往上刷。</span></h2><h2 style=\"text-align: left; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 14px;\">\n	　二、刷里面：用上述同样方法刷每颗牙齿的里面。</span></font></h2><h2 style=\"text-align: left; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 14px;\">\n	　三、刷咬合面：将牙刷平放，来回刷咀嚼食物的牙齿面(咬合面)，最好也刷刷舌面。</span></font></h2><p><font face=\"Arial Black\"><span style=\"font-size: 14px;\">\n</span><span style=\"font-size: 14px;\">\n</span><span style=\"font-size: 14px;\">\n</span><span style=\"font-size: 14px;\">\n</span><span style=\"font-size: 14px;\">\n</span><span style=\"font-size: 14px;\">\n</span></font></p>', '2016-05-17 18:30:45', '2016-06-12 14:55:09', '2016-06-12 14:55:09', '2', 'c0960f97d3a342ddabe850263edb4b2a', '6');
INSERT INTO `t_news` VALUES ('aef9376deaa84556b7b9175fe0743cc3', '招募社区工作人员公告', '1029ccbc28bbd48bc92664e1c0992ad', '2', '王文静', '3', '<div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　<b>一、招聘岗位及专业</b></span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　1、招聘人数。镇机关及社区工作人员共10名。考虑到从事城乡管理、综合治理及夜间环境保护、安全生产巡查监督等工作，招录男性7名，女性3名。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　2、专业需求：中文、文秘类，法律类，经济类，公共管理类，工商管理类，财务财会类，统计类，审计类，城建规划类，建筑工程类，安全生产类，环境保护类，农业类等13大类。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　<b>二、报考条件</b></span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　1、年龄在35周岁以下（1981年6月1日以后出生）；</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　2、学历及任职条件：具有本科及以上学历。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　3、户籍条件：拥有无锡市户籍。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　<b>三、报名时间和地点</b></span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　1、报名时间：2016年6月6日- 6月15日，上午9：00-11：00，下午1：30-16：30（节假日除外）。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　2、报名地点：锡北镇政府407室。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　3、联系电话：0510-83792295 &nbsp; 联系人：李欣荣</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　4、报名注意事项：报名者需本人到现场报名。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　（1）应届高校毕业生须持本人身份证、户籍证明、毕业证书、就业推荐表；</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　（2）社会在职人员须持本人身份证、户籍证明、毕业证书、现工作单位同意报考的证明资料；</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　（3）本人近期1寸正面免冠彩照4张。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　<b>四、招聘程序</b></span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　招聘按资格审查、笔试、面试、体检、考察、公示、聘用等程序进行。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　笔试内容：综合知识与能力素质；面试采取结构化面试方式。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　笔试、面试、体检时间另行通知。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\"><b>　五、聘用人员待遇及管理</b></span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　聘用人员实行劳务派遣管理，关系挂靠在锡北人力资源管理服务公司，工资待遇按锡北镇劳务派遣人员薪酬管理办法发放，并按规定缴纳养老、失业、医疗、工伤、生育等社会保险及住房公积金。</span></div><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　<b>六、其他</b></span></div><p style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span></p><div style=\"line-height: 1.6;\"><span style=\"font-size: 18px;\">　　报名者一旦被录取，须按规定时间及时报到，如与原单位发生人事(劳动)争议等事项，均由本人负责协商解决。</span></div>', '2016-06-12 15:19:14', '2016-06-12 15:29:47', '2016-06-12 15:29:47', '2', 'c0960f97d3a342ddabe850263edb4b2a', '7');
INSERT INTO `t_news` VALUES ('bcf9ce2774244a54ab67578cf044b559', '医院护理人员招聘公告', 'a58bb63c59984f099f9459191e7269ef', '1', '阳光社区医院管理员', '2', '<p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\"><b>一、时间：2016年6月16日(周四)。</b></span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\"><b>二、地点：新综合病房楼四楼大会议室。</b></span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\"><b>三、招聘考核方式为笔试、面试。</b></span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\"><b>四、参加招聘人员须知：</b></span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; 1、要求参加招聘人员必须在招聘考核当天上午6:40之前到新综合病房楼四楼大会议室(过时不候)。</span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; 2、参加招聘人员需携带以下材料：</span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;(1)泰山医学院附属医院护理招聘登记表(医院网站下载认真填写相关信息打印并粘贴照片);</span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;(2)《应聘人员承诺书》;</span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;(3)个人求职简历一份;</span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;(4)毕业证书、学位证书原件及复印件(本科应届毕业生必须提供学校出具的为四年或五年一贯制证明，专升本不符合条 &nbsp; &nbsp; &nbsp;件;硕士研究生需要提供本科毕业证书，专升本不符合条件);</span></font></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;(5)身份证原件和复印件;</span></font></p><p style=\"margin-left: 25px;\"><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span><span style=\"font-size: 18px;\">\n</span></p><p style=\"margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;(6)笔试所需相关物品。</span></font></p>', '2016-06-12 15:32:12', '2016-06-13 09:52:51', null, '1', 'c0960f97d3a342ddabe850263edb4b2a', '4');
INSERT INTO `t_news` VALUES ('c213b5c19d59473bb6af39027812cb34', '为保持口腔健康还是少吃零食为妙', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '1', '<p style=\"line-height: 2; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">英国牙医和“英国营养学协会”专家建议说，为保持口腔健康，一些大行其道的“健康”零食还是少吃为妙。比如，人们认为绿色果蔬汁比可乐等碳酸饮料更健康，\n但果蔬汁通常会加入大量水果以增加甜味、改善口感，而果酸会腐蚀牙釉质，毁牙程度和碳酸饮料一样。牙科大夫萨米尔·帕特尔博士说，相比喝果汁，直接吃水果\n对牙齿更有益。再比如，甜菜根富含纤维素、维生素和钙，但也极易导致牙渍产生，让牙齿变黄；西柚被不少明星追捧为“最健康柑橘类水果”，但它含有大量柠檬\n酸，酸度堪比胃酸，对牙齿的腐蚀力不容小觑。那么，有什么是既健康又护牙的“好”零食呢？专家们推荐富含蛋白质和钙的杏仁、酸度低的羊奶酪、有助于清洁口\n腔和美白牙齿的芹菜，以及可消炎杀菌的绿茶。</span></font><br></p>', '2016-05-17 18:32:24', '2016-05-17 18:53:22', '2016-05-17 18:53:22', '2', 'c0960f97d3a342ddabe850263edb4b2a', '3');
INSERT INTO `t_news` VALUES ('cec20fd202b945c0881c81f806925e43', '坚持锻炼', '0543717c208a4a85886365ae3e2df130', '0', '王医生', '0', '<p>锻炼有助于身体健康，建议在饭后和家人一起散步。<br></p>', '2016-05-27 19:21:29', '2016-06-12 14:46:06', null, '1', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_news` VALUES ('d1bfa34341904b02a1a419f7a58c9afc', '口腔健康社区义诊活动', 'a58bb63c59984f099f9459191e7269ef', '1', '阳光社区医院管理员', '2', '<p style=\"line-height: 1.8;\">&nbsp;<span style=\"font-size: 18px;\">&nbsp; &nbsp; <font face=\"宋体\">2016年06月11号，阳关社区口腔科的医生，为社区居民义务进行口腔保健知识讲座，并开展口腔咨询及免费检查活动。</font></span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\"><font face=\"宋体\">\n\n</font></span></p><p style=\"line-height: 1.8;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">　　 本次活动，医生们将首先为居民讲解如何正确刷牙，如何保护牙齿和口腔的健康，以及如何选择适合自己的牙刷和牙膏，随后，为社区居民免费提供口腔检查，</span><span style=\"font-size: 18px; line-height: 1.8;\">并针对检查的情况，向居民一一介绍如何解决，同时也将对居民提出的问题进行耐心的解答。</span></font></p>', '2016-05-17 18:38:36', '2016-06-12 15:29:56', '2016-06-12 15:29:56', '2', 'c0960f97d3a342ddabe850263edb4b2a', '4');
INSERT INTO `t_news` VALUES ('d868feb2f3124e90b78393cd48121cb1', '2015年亚太医疗行业收购创纪录达49亿美元', '0543717c208a4a85886365ae3e2df130', '0', '王医生', '0', '<p style=\"margin-left: 25px;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 报告显示，包括私有化交易在内的亚太地区上市后私募投资（PIPE）交易数量也开始激增，为该地区带来了近10亿美元的额外资本，几乎为2014年5.75亿美元的两倍。尽管交易价值有所上涨，但收购交易的数量却从2014年的45项下跌至2015年的23项交易。\n<br></p><p style=\"margin-left: 25px;\">　　贝恩表示，交易类型向PIPE转变是引发交易数量下降的主要原因。但投资者的偏好并未发生改变，地区中部署的大量资本以及平均交易规模的显著增\n长便是这一结论的两大有力证据。今年全球范围内规模最大的医疗行业收购交易便是于美国上市的中国无锡药明康德公司的私有化交易，整体私有化规模达到33亿\n美元。</p><p style=\"margin-left: 25px;\">\n<br></p><p style=\"margin-left: 25px;\">　　“直至最近，亚太地区的医疗行业私募市场仍然处于新生状态，其特点是交易均集中在有限的子行业内且规模较小，”贝恩公司全球合伙人、全球医疗与\n私募业务领导及本报告联合作者维克莱姆·卡帕（Vikram \nKapur）先生说：“去年，我们看到投资者们纷纷开始寻找机会，扩大和深化他们在该地区的业务，并视医疗行业为度过经济动荡和获取巨大经济回报的最佳领\n域。”</p><p><br></p>', '2016-05-17 18:12:37', '2016-05-17 18:53:30', '2016-05-17 18:53:30', '2', 'c0960f97d3a342ddabe850263edb4b2a', '2');
INSERT INTO `t_news` VALUES ('d9b7cd4dfa6c471e857ad7f46f19ff6c', '“减肥食品”不减肥', '0543717c208a4a85886365ae3e2df130', '0', '王医生', '1', '<p>“减肥食品”不减肥“减肥食品”不减肥“减肥食品”不减肥“减肥食品”不减肥<br></p>', '2016-06-02 15:15:55', '2016-06-12 14:46:24', null, '1', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_news` VALUES ('f77bdfb11b81447385b6abbac409c284', '食品安全进社区宣传活动', '1029ccbc28bbd48bc92664e1c0992ad', '2', '王文静', '3', '<p style=\"line-height: 1.8;\">&nbsp;<span style=\"font-size: 18px;\">　 5月11日，市食药监局联合阳光社区市场监督管理局，在阳光社区，开展了第二场食品安全进社区宣传活动，大力营造食品安全宣传氛围。</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\">　　 这里是阳光社区广场，活动现场吸引了很多居民。市食药监局等部门工作人员通过悬挂宣传标语、发放宣传资料、展示假劣食品标本、设立投诉举报台\n等形式，向广大居民普及各类食品安全知识。</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\">&nbsp; </span><b><span style=\"font-size: 18px;\">&nbsp;市民张乃如：【介绍这个样品真的假的咱们从中长了点知识，什么贴签、防伪那些东西这个我倒认识了，希望多办点，\n让更多的老百姓能了解。】</span></b></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\">\n\n</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\">　　 此次社区宣传共出动执法人员40多人次，发放各类食品药品宣传资料4500多份，接受咨询300多人次。</span></p><p style=\"line-height: 1.8;\"><span style=\"font-size: 18px;\">&nbsp; &nbsp;</span><b><span style=\"font-size: 18px;\">市民陈淑芬：【这个活动很好，宣传国家食品安全城市，对老百姓来说应从自身注意食品和药品安全。】</span></b></p>', '2016-05-17 18:27:57', '2016-06-12 15:22:27', '2016-06-12 15:22:27', '2', 'c0960f97d3a342ddabe850263edb4b2a', '3');
INSERT INTO `t_news` VALUES ('f8e16278275b4de1a619bd70292e8121', '男性白领养胃饮食怎么吃', '0543717c208a4a85886365ae3e2df130', '0', '王医生', '1', '<p style=\"margin-left: 25px; line-height: 2;\"><strong>白领男性养胃的食物</strong></p><p style=\"margin-left: 25px; line-height: 2;\">卷心菜：有健脾养胃、缓急止痛、解毒消肿、清热利水的作用，可用于内热引起的胸闷、口渴、咽痛、小便不通、耳目不聪、睡眠不佳、关节不利和腹腔隐痛\n等症。其含有的维生素C等成分具有止痛及促进溃疡愈合的作用。卷心菜与薏仁、陈皮、蜂蜜同煨可用于治疗胃脘胀痛、上腹胀满及胃、十二指肠溃疡，与赤小豆、\n冬瓜、冰糖煨熟可消肿利水。大便溏泄及脾胃虚弱者不宜多吃。</p><p style=\"margin-left: 25px; line-height: 2;\">菠菜：味甘性凉，能润燥养肝，益肠胃，通便秘。《食疗本草》中称其“利五脏，通肠胃，解酒毒。”菠菜可促进胃和胰腺分泌，增食欲，助消化；丰富的纤\n维素还能帮助肠道蠕动，有利排便。不过，菠菜草酸含量高，妨碍钙质吸收，应避免与豆腐、紫菜等高食物同吃，或在烹煮前轻汆，除去草酸。</p><p style=\"margin-left: 25px; line-height: 2;\">红薯：性平，味甘，补脾益气。《纲目拾遗》中记载其“补中，暖胃，肥五脏。”天寒食用，正气养胃，化食去积，兼可清肠减肥。</p><p style=\"margin-left: 25px; line-height: 2;\">桂圆：李时珍曾说过：“食品以荔枝为美，滋益则龙眼为良”。和荔枝性属湿热不同，桂圆能入药，有壮阳益气、温胃补脾等多种功效。</p><p style=\"margin-left: 25px; line-height: 2;\">山药：随着天气渐冷，有些脾胃虚寒的人常常出现食少腹胀、大便稀溏、肢体倦怠等症状。经常熬山药粥喝，能有效缓解胃部不适。</p><p style=\"margin-left: 25px; line-height: 2;\">南瓜：《本草纲目》中记载：“南瓜性温，味甘，入脾、胃经”，能补中益气、消炎杀菌、止痛。其所含的丰富果胶，可“吸附”细菌和有毒物质，包括重金属、铅等，起到排毒作用。同时，果胶可保护胃部免受刺激，减少溃疡。可用南瓜煮粥或汤，滋养肠胃。</p><p style=\"margin-left: 25px; line-height: 2;\">胡萝卜：性味甘平，中医学认为它“下气补中，利脾膈，润肠胃，安五脏，有健食之效”。丰富的胡萝卜素可转化成维生素A，能明目养神，增强抵抗力，防治呼吸道疾病。胡萝卜素属脂溶性，和肉一起炖最合适，味道也更好。</p><p style=\"margin-left: 25px; line-height: 2;\"><strong>白领男性养胃的禁忌</strong></p><p style=\"margin-left: 25px; line-height: 2;\">过度疲劳：无论是体力劳动或是脑力劳动，如果疲劳过度，都会引起胃肠供血不足，分泌功能失调，胃酸过多而粘液减少，使粘膜受到损害。懂得适当的给自己减压、放松，是保证职场男人健康的标准。</p><p style=\"margin-left: 25px; line-height: 2;\">忌饥饱不均：工作是不是时常废寝忘食，如果是这样，你就该多注意提醒自己按时吃饭了。饥饿时，胃内的胃酸、蛋白酶无食物中和，浓度较高，易造成粘膜的自我消化。暴饮暴食又易损害胃的自我保护机制；胃壁过多扩张，食物停留时间过长等都会促成胃损伤。</p><p style=\"margin-left: 25px; line-height: 2;\">忌酗酒无度：职场应酬总是不可避免，但是男人们可不要豪饮。因为酒精本身可直接损害胃粘膜，还能引起肝硬化和慢性胰腺炎，反过来加重胃的损伤。</p><p style=\"margin-left: 25px; line-height: 2;\">最后，还要告诉大家的是豆浆也可以帮你养胃哦。</p><p style=\"margin-left: 25px; line-height: 2;\"><strong>白领男性喝豆浆养胃</strong></p><p style=\"margin-left: 25px; line-height: 2;\">豆浆粥的做法很简单，只需要准备五十克黄豆和五十粳米和适量的白糖。</p><p style=\"margin-left: 25px; line-height: 2;\">把黄豆清洗以后放在豆浆机中，制成豆浆，然后取出再把粳米洗净以后放在豆浆中一起煮制。</p><p style=\"margin-left: 25px; line-height: 2;\">等粳米变得软糯以后再把准备好的白糖放入到粥中调匀，盖上锅盖煮制三到五分钟就能关火，取出食用了。</p><p style=\"margin-left: 25px; line-height: 2;\">男性养胃的食物有很多，应要选择适合自己的。</p><p><br></p><p><br></p><p><br></p>', '2016-05-17 18:17:48', '2016-05-17 18:53:52', '2016-05-17 18:53:52', '2', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_news` VALUES ('fe0a5e9f2d8841c19dbf273eed68ed74', '种牙须找好牙医', '097d0de052554d4f9cbc35f8f7f341c9', '0', '李医生', '1', '<p style=\"line-height: 1.8; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; 据了解，目前种植牙技术在国内发展并不十分成熟，种植牙医生更是稀缺资源，特别是在广西地区，开展种牙项目的口腔机构很多，但是真正能把种植牙做好的医生\n少之又少。“做好一个种牙手术，是非常复杂的，CT是必备的重要设备，只有CT才能在术前精确判断牙槽骨内神经血管位置和骨的宽窄及高度，是否需要植骨，\n哪一颗需要做狭窄骨劈开术、哪一颗需要做下齿槽神经避让术、是否需要做上额窦开窗植骨、以及不同牙位所需种植体长短粗细的型号选择等等，都需要根据CT的三维立体重建技术进行精密的数据分析，才能为不同缺牙患者定制更适合的种牙方案。”</span></font></p><p style=\"line-height: 1.8; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; 即刻微种牙创始人、岭南牙科院长潘蛟南如是说：“因为CT设备的费用比\n较高昂，很多口腔机构无力配置。目前很多据称能开展种牙的口腔机构，普遍都是采用全景机拍出的平面图像作为依据来种牙，这种平面图像无法直观判断患者牙槽\n骨内神经及血管的位置，影响手术质量。我们通过分析在别处做过种牙患者的CT看到，很多植体都种的很浅很细，就是因为他们经验不足，怕伤到下齿槽神经，不敢种的那么深那么粗，将会大大缩短种植牙的使用寿命，让本来能用30年甚至一辈子的种植牙，就因为种植的深度不够，有可能用了10年8年就会出现脱落症状。</span></font></p><p style=\"line-height: 1.8; margin-left: 25px;\"><font face=\"宋体\"><span style=\"font-size: 18px;\">&nbsp; 有个缺牙患者还经历过同一个牙位连续种牙3次都脱落的案例，就因为医生种牙经验不足，找不到病因，最好求助到岭南牙科才把牙齿种好了。</span></font><br></p>', '2016-06-12 15:02:42', '2016-06-12 15:03:41', '2016-06-12 15:03:41', '2', 'c0960f97d3a342ddabe850263edb4b2a', '1');

-- ----------------------------
-- Table structure for t_resident
-- ----------------------------
DROP TABLE IF EXISTS `t_resident`;
CREATE TABLE `t_resident` (
  `uuid` varchar(255) NOT NULL,
  `userName` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` int(5) DEFAULT NULL,
  `idNo` varchar(255) NOT NULL,
  `nation` varchar(255) DEFAULT NULL,
  `birth` varchar(255) DEFAULT NULL,
  `age` int(5) DEFAULT NULL,
  `period` int(5) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `marriage` int(5) DEFAULT NULL,
  `height` varchar(255) DEFAULT NULL,
  `weight` varchar(255) DEFAULT NULL,
  `eyesight` varchar(255) DEFAULT NULL,
  `bloodType` int(5) DEFAULT NULL,
  `family_uuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resident
-- ----------------------------
INSERT INTO `t_resident` VALUES ('480a63e56a5948e59e2b242ece855e06', 'wahahaha', '$2a$10$pk7fLHJwbtH8ya95Q1yY8eHSWCupLSyeGBDtgPSzdtpq715yOcE5m', '王小宝', '0', '320881200302192032', '0', '20030219', '13', '2', '18392117662', '0', '150', '45', '2.1,2.1', '3', 'a446f220c0894505b0a799185854fd2a');
INSERT INTO `t_resident` VALUES ('7d15e9976cb2429995cda5f39fb8a5f5', 'ranran', '$2a$10$Hcdj88hvizJDwMDMUtAFWOUADryMr59SZ7W6hdwgMhXVLx1pz5mcG', '王文静', '1', '32044319940604112x', '0', '19940604', '22', '3', '18394338773', '0', '176', '62', '2.1,2.1', '0', '1584e23d717b440c90347af6bb0f6bd4');
INSERT INTO `t_resident` VALUES ('94eb6d6e066d44a8a1d5726915005d14', 'yanzi', '$2a$10$RY1HTS4sw02CltuUwpA4UuEps0uObDSYUk5L8BXL8V8LkBHw1zSOK', '王翠萍', '1', '320322195610221168', '0', '18561022', '60', '5', '18394339221', '0', '165', '55', '2.1,2.1', '1', 'a446f220c0894505b0a799185854fd2a');
INSERT INTO `t_resident` VALUES ('9c42c3ed93964560b76cc78712ae013c', 'xiaowanzi', '$2a$10$76fUNq7OwivUPDOBLyL6duB70pPoEsoBVQl7NhkHNEW0TgoJsK6X2', '何承潞', '1', '349882199406041042', '0', '19940604', '22', '3', '18693209871', '0', '168', '50', '2.2,2.1', '1', '1584e23d717b440c90347af6bb0f6bd4');
INSERT INTO `t_resident` VALUES ('b3edd5d0f5c5499fb586bb3679bf22d1', 'gazi', '$2a$10$UIPFFf92agX7nwAASYCMR.Lvct8GYmbN/LjFxmy.jylVam7ZMSc5a', '孙华策', '0', '239221199410223371', '0', '19941022', '23', '3', '18467080990', '0', '178', '65', '1.1,1.2', '3', '7638fa79d3d74b0198045efd81c148a1');
INSERT INTO `t_resident` VALUES ('e181d5588ec44538b748782418c4f606', 'upshi', '$2a$10$UIPFFf92agX7nwAASYCMR.Lvct8GYmbN/LjFxmy.jylVam7ZMSc5a', '王豫宁', '0', '32044219930604241x', '0', '19930604', '22', '3', '18467080990', '0', '183', '84', '2.2,2.2', '2', '7638fa79d3d74b0198045efd81c148a1');
INSERT INTO `t_resident` VALUES ('f3f6f4127daa49e6ba5136caf2f4f63b', 'lidashu', '$2a$10$16hxUlvRJsdW0bw7Wldxaul9/WYg2BycN/5v23fHFfn1WoawW6I5q', '李达', '1', '320322194610221168', '0', '19461022', '70', '6', '18239430844', '1', '167', '50', '2.1,2.1', '1', '7638fa79d3d74b0198045efd81c148a1');

-- ----------------------------
-- Table structure for t_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_resource`;
CREATE TABLE `t_resource` (
  `uuid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `description` varchar(1000) DEFAULT '',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_resource
-- ----------------------------
INSERT INTO `t_resource` VALUES ('0154d116ede6436587612d593fe4cbff', '管理员更新-医院管理员', '/manager/editHospitalManager', '管理员更新-医院管理员');
INSERT INTO `t_resource` VALUES ('02d4cd3bd5cd4b1ebdd312de2447ced0', '管理员管理', '/manager/manage', '管理员管理');
INSERT INTO `t_resource` VALUES ('05e78782d11b4e44b5ab9ea5a813c029', '新闻审核-未通过', '/news/notPass', '新闻审核-未通过');
INSERT INTO `t_resource` VALUES ('0604e260e1964c099bcdc0c87dad42c5', '登录首页', '/userIndex', '登录首页');
INSERT INTO `t_resource` VALUES ('083e10f097ef4cc88db52988fb135933', '居民管理', '/resident/manage', '居民管理');
INSERT INTO `t_resource` VALUES ('092318e7b69a4292a3c2ff9d868fee03', '角色分配资源操作', '/role/allocateResource', '角色分配资源操作');
INSERT INTO `t_resource` VALUES ('095aedd6e4ab4e3b99f0cf6f8902c037', '资源添加操作', '/resource/addResource', '资源添加操作');
INSERT INTO `t_resource` VALUES ('0984ce00a6ca4c79ad5cd69e05772c4b', '科室管理', '/department/manage', '科室管理');
INSERT INTO `t_resource` VALUES ('0a4991bf50ec4330bb552300be758258', '医院删除', '/hospital/delete/*', '医院删除');
INSERT INTO `t_resource` VALUES ('0ace598e0bd24b528e2fe7136e6f68d7', '资源删除', '/resource/delete/*', '资源删除');
INSERT INTO `t_resource` VALUES ('0bafaf6024924aa18c5bcbe728c75b02', '体检记录新建', '/healthRecord/create/*', '体检记录新建');
INSERT INTO `t_resource` VALUES ('0f00e77ace3f4470b1a8b92513632b67', '医院添加', '/hospital/addHospital', '医院添加');
INSERT INTO `t_resource` VALUES ('13d9d180d3ba45e680ef573d49e62761', '家庭管理', '/family/manage', '家庭管理');
INSERT INTO `t_resource` VALUES ('18302a123c6e4075a64d368920fd69fc', '体检记录更新', '/healthRecord/edit', '体检记录更新');
INSERT INTO `t_resource` VALUES ('18bf95c66e3b4fa1bd18f99d7dbaaf9b', '居民信息完善-注册成功后', '/resident/complete', '居民信息完善-注册成功后');
INSERT INTO `t_resource` VALUES ('1a6ca490c9664406a5d3a131b597ad9e', '免疫记录更新', '/immuneRecord/edit', '免疫记录更新');
INSERT INTO `t_resource` VALUES ('1a8473d9a1624a40aeb9f97dd84a4426', '统计-单疾病统计操作', '/statistics/singleDisease', '统计-单疾病统计操作');
INSERT INTO `t_resource` VALUES ('1aa754b37258487cb0dbeaf8e1340379', '居民模糊查询-根据身份证号', '/resident/getByDimIdNo', '居民模糊查询-根据身份证号');
INSERT INTO `t_resource` VALUES ('1c1f6600aa4c42648d50c475bc630cd2', '就诊记录-编辑就诊状态', '/medicalRecord/editState/*', '就诊记录-编辑就诊状态');
INSERT INTO `t_resource` VALUES ('1d3a4457d5a94b188e9916ba1474296c', '新闻管理', '/news/manage', '新闻管理');
INSERT INTO `t_resource` VALUES ('24cb1f69f5ad4ee2911943050eea8526', '居民就诊记录查询', '/resident/searchMedicalRecord', '居民就诊记录查询');
INSERT INTO `t_resource` VALUES ('26861743a0d641c696437a1d929a0c29', '医生基本信息查看', '/doctor/baseInfo', '医生基本信息查看');
INSERT INTO `t_resource` VALUES ('2b5cfbe32aff47eaaa93074950c6b75b', '居民删除', '/resident/delete/*', '居民删除');
INSERT INTO `t_resource` VALUES ('2d783fa1f7404e479d73686b80f8a706', '居民查询', '/resident/search', '居民查询');
INSERT INTO `t_resource` VALUES ('2ef14fdc9a6f44ba9675d4822108d1d3', '医院详情', '/hospital/detail/*', '医院详情');
INSERT INTO `t_resource` VALUES ('3141bd0792f04d88b4ccc1a6619c6d25', '新闻审核-通过', '/news/pass', '新闻审核-通过');
INSERT INTO `t_resource` VALUES ('33593600ece148d8b897a443d3192279', '医院管理', '/hospital/list', '医院管理');
INSERT INTO `t_resource` VALUES ('363d651c5c354f58ab5daec3b9f8fddc', '资源名唯一性检查操作', '/resource/checkNameUnique/*', '资源名唯一性检查操作');
INSERT INTO `t_resource` VALUES ('37af9c88f43a4015b0570f8d9429b918', '管理员删除', '/manager/delete/*', '管理员删除');
INSERT INTO `t_resource` VALUES ('41ba9c87b86649d2b759dd5f66207240', '免疫记录查询-已完成', '/immuneRecord/finishedImmuneRecord/*', '免疫记录查询-已完成');
INSERT INTO `t_resource` VALUES ('43c33a95bdde426e82590c7698defba6', '体检记录详情', '/healthRecord/healthRecordDetail/*', '体检记录详情');
INSERT INTO `t_resource` VALUES ('4552efe831b747b9af64b5d255861022', '居民-免疫记录管理', '/resident/immuneRecord', '居民-免疫记录管理');
INSERT INTO `t_resource` VALUES ('47f035dcdca04c0fb20c10c58441d050', '资源URL唯一性检查操作', '/resource/checkURLUnique', '资源URL唯一性检查操作');
INSERT INTO `t_resource` VALUES ('484f2fba719f45a1b58a7a876e9f7b2e', '医生详情', '/doctor/get/*', '医生详情');
INSERT INTO `t_resource` VALUES ('48dba22ef052498ba1525b2e7e4bc987', '科室查询-根据医院', '/department/getDepartment/*', '科室查询-根据医院');
INSERT INTO `t_resource` VALUES ('490cfe600e5c4b55a3581dad619eca48', '资源添加页面', '/resource/toAddResource', '资源添加页面');
INSERT INTO `t_resource` VALUES ('4989828159714b6c83e6943f7c3b5c94', '居民信息更新', '/resident/edit', '居民信息更新');
INSERT INTO `t_resource` VALUES ('4a01246436634e47b903514e95365040', '资源更新操作', '/resource/update', '资源更新操作');
INSERT INTO `t_resource` VALUES ('4dc2be053d7f49f1a8ef5b8d4301d9bf', '居民免疫记录查询', '/resident/searchImmuneRecord', '居民免疫记录查询');
INSERT INTO `t_resource` VALUES ('4e16aa550a39474a86be01e9a1e26c03', '就诊记录查询', '/medicalRecord/search', '就诊记录查询');
INSERT INTO `t_resource` VALUES ('4e8d3c00adf34b969d910a1cbb76438d', '医生编号唯一性检查', '/doctor/checkNumberUnique/*', '医生编号唯一性检查');
INSERT INTO `t_resource` VALUES ('5205bd061ea242f99186f3b272fe312d', '就诊记录管理-未完成', '/medicalRecord/unfinished', '就诊记录管理未完成');
INSERT INTO `t_resource` VALUES ('54fc88ee4ed542d182c943d2137978c8', '管理员详情', '/manager/detail/*', '管理员详情');
INSERT INTO `t_resource` VALUES ('5888fb0706114603b6a18e052c39c8c3', '角色分配资源页面', '/role/toAllocateResource/*', '角色分配资源页面');
INSERT INTO `t_resource` VALUES ('58b78211eb6b40cc85ee7eab5f84335a', '科室详情', '/department/detail/*', '科室详情');
INSERT INTO `t_resource` VALUES ('5aef36ca7e8143f7938c41a35ce004c6', '角色查询', '/role/search', '角色查询');
INSERT INTO `t_resource` VALUES ('5b71d03556c946e09acd9c7416d9b9d9', '科室搜索', '/department/search', '科室搜索');
INSERT INTO `t_resource` VALUES ('5d601a4b16d944c6abe31b25eeeca828', '疾病史删除-居民', '/diseaseHistory/delete/*', '疾病史删除-居民');
INSERT INTO `t_resource` VALUES ('61482f1e49f0491eab45e6af01d09fd9', '科室删除', '/department/delete/*', '科室删除');
INSERT INTO `t_resource` VALUES ('61c1ccf250c1467781670ba9bd00eb73', '管理员用户名唯一性检查', '/manager/checkUserNameUnique/*', '管理员用户名唯一性检查');
INSERT INTO `t_resource` VALUES ('6494e120066045bd98ba615d23b7e5a8', '新闻添加', '/news/add', '新闻添加');
INSERT INTO `t_resource` VALUES ('64a28c8d5f14439289d7f12a6e6b8a9e', '统计-多疾病统计页面', '/statistics/toMultipleDisease', '统计-多疾病统计页面');
INSERT INTO `t_resource` VALUES ('64dd9241f6f14444bb25bbdd63d9091e', '居民-家庭关系移除', '/resident/remove/*', '居民-家庭关系移除');
INSERT INTO `t_resource` VALUES ('68b8bea0047f44c08a5eacd0d5744e09', '医生用户名唯一性检查', '/doctor/checkUserNameUnique/*', '医生用户名唯一性检查');
INSERT INTO `t_resource` VALUES ('6eafda2b9d9e4f4e9ab0549b8986d3bb', '就诊记录详情-已完成', '/medicalRecord/finishedMedicalRecordDetail/*', '就诊记录详情-已完成');
INSERT INTO `t_resource` VALUES ('70eda230170a4d108c640af0d0f38e63', '疾病类型名称唯一性检查', '/diseaseType/checkDiseaseTypeNameUnique/*', '疾病类型名称唯一性检查');
INSERT INTO `t_resource` VALUES ('790d5474983c47e08cd7fabb35dbd20c', '科室添加', '/department/addDepartment', '科室添加');
INSERT INTO `t_resource` VALUES ('7acf3608a5314298a7bba67daaace96c', '新闻更新操作', '/news/edit', '新闻更新操作');
INSERT INTO `t_resource` VALUES ('8242e413f50c4d2593e65c0f1bcea783', '新闻删除', '/news/delete/*', '新闻删除');
INSERT INTO `t_resource` VALUES ('887609d9f191424b995a830ca6058d0f', '角色添加操作', '/role/addRole', '角色添加操作');
INSERT INTO `t_resource` VALUES ('8981f42a67694366b495fcbfbd2705c0', '居民身份证号唯一性检查', '/resident/checkIdNoUnique/*', '居民身份证号唯一性检查');
INSERT INTO `t_resource` VALUES ('8ad739c51b524df585d0b6552e593859', '免疫记录查询-根据居民', '/immuneRecord/getImmuneRecord/*', '免疫记录查询-根据居民');
INSERT INTO `t_resource` VALUES ('8ae28597053c47b48ace1c192be07ac2', '统计-疾病百分比统计页面', '/statistics/toDiseasePercent', '统计-疾病百分比统计页面');
INSERT INTO `t_resource` VALUES ('8af9bbb7fe4943b288c67b26de7fab30', '管理员分配角色操作', '/manager/allocateRole', '管理员分配角色操作');
INSERT INTO `t_resource` VALUES ('8b8af33315224f47b04dfda0a81d5c1e', '就诊记录管理-已完成', '/medicalRecord/finished', '就诊记录管理-已完成');
INSERT INTO `t_resource` VALUES ('8b94bb2f3f79436b9d2426e213a79133', '疾病列表', '/disease/list/*', '疾病列表');
INSERT INTO `t_resource` VALUES ('8eea1b5b07ed4ff4a473c47fdbb14980', '疾病查询-根据疾病类型', '/disease/getByDiseaseType/*', '疾病查询-根据疾病类型');
INSERT INTO `t_resource` VALUES ('8f165c93ae9d485ba7fe22398311fcb4', '就诊记录更新', '/medicalRecord/edit', '就诊记录更新');
INSERT INTO `t_resource` VALUES ('9020fe55a21f487480bce4840b42f433', '居民基本信息查询', '/resident/baseInfo', '居民基本信息查询');
INSERT INTO `t_resource` VALUES ('982ad41796e04da6b9d866cd81cbab90', '角色中文名唯一性检查', '/role/checkRoleCNameUnique/*', '角色中文名唯一性检查');
INSERT INTO `t_resource` VALUES ('982eafbfc1814059a5764bc028b38c1d', '疾病类型查询-根据父节点', '/diseaseType/getByParent/*', '疾病类型查询-根据父节点');
INSERT INTO `t_resource` VALUES ('98c19dcc1db740418a2bf02bbd0ce0e1', '新闻查询', '/news/search', '新闻查询');
INSERT INTO `t_resource` VALUES ('9c24b919426a4b54b6b94e3f5e7b5863', '就诊记录新建操作-根据居民id', '/medicalRecord/create/*', '就诊记录新建操作-根据居民id');
INSERT INTO `t_resource` VALUES ('a13642e5764c4575b9742c3267002576', '医生查询', '/doctor/search', '医生查询');
INSERT INTO `t_resource` VALUES ('a1e00ec329a74bfeb6bbc719d718f911', '角色添加页面', '/role/toAddRole', '角色添加页面');
INSERT INTO `t_resource` VALUES ('a37621bebfa148309ae269b0e6c18db1', '居民及其疾病史查询', '/resident/getResidentAndDiseaseHistory/*', '居民及其疾病史查询');
INSERT INTO `t_resource` VALUES ('a48efdd63ea94770903a5fd33300483f', '家庭查询', '/family/search', '家庭查询');
INSERT INTO `t_resource` VALUES ('a4b660ea18fd43ac8d509b390abc117f', '管理员添加-医院管理员', '/manager/addHospitalManager', '管理员添加-医院管理员');
INSERT INTO `t_resource` VALUES ('a4e1e6643411452ebaf5d0730108800e', '医生添加', '/doctor/addDoctor', '医生添加');
INSERT INTO `t_resource` VALUES ('a61bf6e4fc524c39a692d2a04e81cb35', '统计-多疾病统计操作', '/statistics/multipleDisease', '统计-多疾病统计操作');
INSERT INTO `t_resource` VALUES ('a6d865146ea84ebe9a34b8737502f013', '新闻发布页面', '/news/toPublish', '新闻发布页面');
INSERT INTO `t_resource` VALUES ('a88629b29e904acb92f01c4430c04028', '管理员分配角色页面', '/manager/toAllocateRole/*', '管理员分配角色页面');
INSERT INTO `t_resource` VALUES ('a9278833f99f44eda6eb5dc12f954a0f', '角色更新页面', '/role/toUpdate/*', '角色更新页面');
INSERT INTO `t_resource` VALUES ('a9550a9a69de4eee9e12e08b83de43e6', '居民用户名唯一性检查', '/resident/checkUserNameUnique/*', '居民用户名唯一性检查');
INSERT INTO `t_resource` VALUES ('ace751057a8145ce9504b6dc21628398', '免疫记录详情', '/immuneRecord/immuneRecordDetail/*', '免疫记录详情');
INSERT INTO `t_resource` VALUES ('ada7dc08b7b440d4a83249062c065a20', '资源管理', '/resource/manager', '资源管理');
INSERT INTO `t_resource` VALUES ('aeb205f1262d4c3bb8654db532ee5db5', '疾病类型列表', '/diseaseType/list/*', '疾病类型列表');
INSERT INTO `t_resource` VALUES ('aec14cab2bba410785fcf7ee9af198bc', '疾病史添加', '/diseaseHistory/addDiseaseHistory', '疾病史添加');
INSERT INTO `t_resource` VALUES ('b01acd3af35545d38c5098c649a518a0', '居民体检记录查询', '/resident/searchHealthRecord', '居民体检记录查询');
INSERT INTO `t_resource` VALUES ('b15ed26f7a31445693d3d26c67be3583', '统计-单疾病统计页面', '/statistics/toSingleDisease', '统计-单疾病统计页面');
INSERT INTO `t_resource` VALUES ('b1612b0c44c84604b7bf2fe699ffa8e4', '家庭基本信息', '/family/familyInfo', '家庭基本信息');
INSERT INTO `t_resource` VALUES ('b333bba196224fdcb8df97f259fb1f14', '家庭详情', '/family/detail/*', '家庭详情');
INSERT INTO `t_resource` VALUES ('b5af00b6c8604b1cb0036df26bdc52ff', '疾病类型管理', '/diseaseType/manage', '疾病类型管理');
INSERT INTO `t_resource` VALUES ('b7a6f4539d82457aae13b0667bd523eb', '资源更新页面', '/resource/toUpdate/*', '资源更新页面');
INSERT INTO `t_resource` VALUES ('ba6069d6c63b4268b95ed96bf922f05e', '资源详情', '/resource/detail/*', '资源详情');
INSERT INTO `t_resource` VALUES ('bbf62dd34fcd4379afd6989336a6d230', '统计-疾病百分比统计操作', '/statistics/diseasePercent', '统计-疾病百分比统计操作');
INSERT INTO `t_resource` VALUES ('bf5f545551724ce9b75e33b8cdd6348b', '角色详情', '/role/detail/*', '角色详情');
INSERT INTO `t_resource` VALUES ('c0fb8b5ef0134ddaa29fd49e262cadae', '居民就诊记录管理', '/resident/medicalRecord', '居民就诊记录管理');
INSERT INTO `t_resource` VALUES ('c461fbe667074d8ab1e517a48de71546', '居民就诊记录详情', '/resident/medicalRecordDetail/*', '居民就诊记录详情');
INSERT INTO `t_resource` VALUES ('c695fe9824454d2c9b3c2bf5b80a7d9f', '疾病名称唯一性检查', '/disease/checkDiseaseUnique/*', '疾病名称唯一性检查');
INSERT INTO `t_resource` VALUES ('c698654dd2254608920cdb3d7f1bbe9d', '角色管理', '/role/manager', '角色管理');
INSERT INTO `t_resource` VALUES ('c7422de1780647d6921d75ade9c11180', '管理员添加页面', '/manager/toAddManager', '管理员添加页面');
INSERT INTO `t_resource` VALUES ('c8d62d803d364b819a04800644ecbc83', '就诊记录详情-未完成', '/medicalRecord/unfinishedMedicalRecordDetail/*', '就诊记录详情-未完成');
INSERT INTO `t_resource` VALUES ('cb3e9b91078a4458adda2aa4f716a2d4', '疾病删除', '/disease/delete/*', '疾病删除');
INSERT INTO `t_resource` VALUES ('cd906dea2fa449ddabd20275cdfe3f03', '资源搜索', '/resource/search', '资源搜索');
INSERT INTO `t_resource` VALUES ('ce0cb7ea8e734ea99b22e185dd55aaff', '居民体检记录管理', '/resident/healthRecord', '居民体检记录管理');
INSERT INTO `t_resource` VALUES ('d079fc6f75eb49148b9be9fe63c5a526', '医生管理', '/doctor/manage', '医生管理');
INSERT INTO `t_resource` VALUES ('d12fc2d7bc534a628aff3e3ddf5102fd', '疾病史详情', '/diseaseHistory/diseaseHistoryDetail/*', '疾病史详情');
INSERT INTO `t_resource` VALUES ('d31da12a2be24b67bfcc6e53ad7edc01', '角色更新操作', '/role/update', '角色更新操作');
INSERT INTO `t_resource` VALUES ('d79782ab79c546d28022742d36840dc8', '居民健康信息查询', '/resident/healthInfo', '居民健康信息查询');
INSERT INTO `t_resource` VALUES ('d9584d4b35824d4890b5edc1d61d80ca', '疾病类型删除', '/diseaseType/delete/*', '疾病类型删除');
INSERT INTO `t_resource` VALUES ('d9b4cebbad0a456189612e79111e6626', '角色删除', '/role/delete/*', '角色删除');
INSERT INTO `t_resource` VALUES ('dbfbf63c78294adead7db7440e824836', '医院编号唯一性检查', '/hospital/checkNumberUnique/*', '医院编号唯一性检查');
INSERT INTO `t_resource` VALUES ('defce548a8664d42a425628e112fbe09', '家庭信息更新', '/family/editFamily', '家庭信息更新');
INSERT INTO `t_resource` VALUES ('df058fe97463410285200ca37cee019f', '管理员更新', '/manager/edit', '管理员更新');
INSERT INTO `t_resource` VALUES ('dfc4b47ebe894edd9ac6592a4a9d1acc', '疾病史获取-根据居民id', '/diseaseHistory/getDiseaseHistoryByResidentUuid/*', '疾病史获取-根据居民id');
INSERT INTO `t_resource` VALUES ('e1924142e94d404ba7c4b461634aeb37', '医生个人信息编辑', '/doctor/edit', '医生个人信息编辑');
INSERT INTO `t_resource` VALUES ('e2ceb979e1ec42b8beee4c072546c38f', '新闻详情', '/news/detail/*', '新闻详情');
INSERT INTO `t_resource` VALUES ('e2fd5fa03b9a49bfa060fea41b1f1dca', '科室编号唯一性检查', '/department/checkNumberUnique/*', '科室编号唯一性检查');
INSERT INTO `t_resource` VALUES ('e3669d837bab4fdaad327ea096303005', '管理员添加操作', '/manager/addManager', '管理员添加操作');
INSERT INTO `t_resource` VALUES ('e7717d1a09c0480faddc26d97c0c13b3', '管理员查询', '/manager/search', '管理员查询');
INSERT INTO `t_resource` VALUES ('e88511afa07d41df8d6e62d546f4f055', '免疫记录新建', '/immuneRecord/create/*', '免疫记录新建');
INSERT INTO `t_resource` VALUES ('eb1d31a9abe84712a6410a7281f0b34e', '疾病类型添加', '/diseaseType/add', '疾病类型添加');
INSERT INTO `t_resource` VALUES ('ebef3376c260432a85340834c660b1f8', '医生删除', '/doctor/delete/*', '医生删除');
INSERT INTO `t_resource` VALUES ('ef36fad1e3774a11b233067b3bf5f6a1', '居民详情', '/resident/get/*', '居民详情');
INSERT INTO `t_resource` VALUES ('ef387f24aab4466d9b7c60aa24fbe9b9', '角色英文名唯一性检查', '/role/checkRoleENameUnique/*', '角色英文名唯一性检查');
INSERT INTO `t_resource` VALUES ('f0365f80b4e1484a8682b3a8f8e89251', '疾病添加', '/disease/add', '疾病添加');
INSERT INTO `t_resource` VALUES ('f03c54c1d6f346ad91d67f4ad4a4019d', '疾病类型查询-根据级别', '/diseaseType/getDiseaseType/*', '疾病类型查询-根据级别');
INSERT INTO `t_resource` VALUES ('f1ac35ed65c04140b5d4b50410f2fffa', '就诊记录新建页面', '/medicalRecord/toCreate', '就诊记录新建页面');
INSERT INTO `t_resource` VALUES ('f59be6ee96cc4f4d89e8e072c14f0475', '体检记录查询-根据居民', '/healthRecord/getHealthRecord/*', '体检记录查询-根据居民');
INSERT INTO `t_resource` VALUES ('f933dcf78539497bb52d33912089f979', '就诊记录编辑疾病名称', '/medicalRecord/editDiseaseName', '就诊记录编辑疾病名称');
INSERT INTO `t_resource` VALUES ('f9bd86b397f94ac59b8c623fc67673b0', '新闻更新页面', '/news/toEdit/*', '新闻更新页面');
INSERT INTO `t_resource` VALUES ('ffa068a06c0d4456b61bdb8799b9edf0', '就诊记录-添加就诊报告', '/medicalRecord/addCheckReport', '就诊记录-添加就诊报告');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `uuid` varchar(255) NOT NULL,
  `cName` varchar(255) NOT NULL,
  `eName` varchar(255) NOT NULL,
  `description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('0', '医院管理员', 'ROLE_hospitalManager', '%SystemRole%');
INSERT INTO `t_role` VALUES ('1', '审核员', 'ROLE_assessor', '%SystemRole%');
INSERT INTO `t_role` VALUES ('2', '系统管理员', 'ROLE_systemManager', '%SystemRole%');
INSERT INTO `t_role` VALUES ('3', '医生', 'ROLE_doctor', '%SystemRole%');
INSERT INTO `t_role` VALUES ('4', '居民', 'ROLE_resident', '%SystemRole%');
INSERT INTO `t_role` VALUES ('5', '户主', 'ROLE_householder', '%SystemRole%');

-- ----------------------------
-- Table structure for t_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `t_role_resource`;
CREATE TABLE `t_role_resource` (
  `uuid` varchar(255) NOT NULL,
  `roleUuid` varchar(255) NOT NULL,
  `resourceUuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `roleresource_role` (`roleUuid`),
  KEY `roleresource` (`resourceUuid`),
  CONSTRAINT `roleresource` FOREIGN KEY (`resourceUuid`) REFERENCES `t_resource` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `roleresource_role` FOREIGN KEY (`roleUuid`) REFERENCES `t_role` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_resource
-- ----------------------------
INSERT INTO `t_role_resource` VALUES ('00070978ff4c40768e2248c4364ee743', '3', '6eafda2b9d9e4f4e9ab0549b8986d3bb');
INSERT INTO `t_role_resource` VALUES ('03d666de8527455ba7c5099ba623bec1', '1', 'e2ceb979e1ec42b8beee4c072546c38f');
INSERT INTO `t_role_resource` VALUES ('04b06292a00d4d2fb858092b1757d7fa', '2', '092318e7b69a4292a3c2ff9d868fee03');
INSERT INTO `t_role_resource` VALUES ('04e88a1475714bd285fe62007a5058cc', '3', '8b8af33315224f47b04dfda0a81d5c1e');
INSERT INTO `t_role_resource` VALUES ('050ddac5f2a84754a180f6a7cfd2d13c', '3', '7acf3608a5314298a7bba67daaace96c');
INSERT INTO `t_role_resource` VALUES ('05bf922554884891b3c4b96c5917835f', '2', '0154d116ede6436587612d593fe4cbff');
INSERT INTO `t_role_resource` VALUES ('07048f5f99834294bc708700143cb363', '4', '24cb1f69f5ad4ee2911943050eea8526');
INSERT INTO `t_role_resource` VALUES ('0763a5d2184f4010a1a664718854ce7e', '3', '1a6ca490c9664406a5d3a131b597ad9e');
INSERT INTO `t_role_resource` VALUES ('0ac836b4267a435cb7dbf40dc6d0ea67', '3', '982eafbfc1814059a5764bc028b38c1d');
INSERT INTO `t_role_resource` VALUES ('13a31a94d1ea46afaea34d63f0c9a83c', '3', '4e16aa550a39474a86be01e9a1e26c03');
INSERT INTO `t_role_resource` VALUES ('141fd3d3ce0c447188b865dc1ba90f73', '2', '8af9bbb7fe4943b288c67b26de7fab30');
INSERT INTO `t_role_resource` VALUES ('144805b1da7742d8bf5b098027c54a9f', '4', 'ce0cb7ea8e734ea99b22e185dd55aaff');
INSERT INTO `t_role_resource` VALUES ('15cb5609c158450d9e5043dcce2dac11', '0', '7acf3608a5314298a7bba67daaace96c');
INSERT INTO `t_role_resource` VALUES ('15cc7cf21e68421390f4ec4b295abbff', '3', 'c8d62d803d364b819a04800644ecbc83');
INSERT INTO `t_role_resource` VALUES ('15e0f95857834f5aa2e472271c6a1011', '3', '9c24b919426a4b54b6b94e3f5e7b5863');
INSERT INTO `t_role_resource` VALUES ('1742a8b610344a18b9cc50f8b81d5b1e', '2', 'f0365f80b4e1484a8682b3a8f8e89251');
INSERT INTO `t_role_resource` VALUES ('180f88cd12cd49dfb2c46e8be2853936', '2', 'df058fe97463410285200ca37cee019f');
INSERT INTO `t_role_resource` VALUES ('18630a3e2b804f3ab8f0987595a91264', '4', '4552efe831b747b9af64b5d255861022');
INSERT INTO `t_role_resource` VALUES ('1908d3f450354aa9818f0730976a2fc8', '3', '1aa754b37258487cb0dbeaf8e1340379');
INSERT INTO `t_role_resource` VALUES ('19403f15f8134beca54eb269374a3c8c', '0', '790d5474983c47e08cd7fabb35dbd20c');
INSERT INTO `t_role_resource` VALUES ('1951bd5eb9554ae4840be13e20dba69e', '2', 'ba6069d6c63b4268b95ed96bf922f05e');
INSERT INTO `t_role_resource` VALUES ('19b3e4fa514941a198dece116e87db84', '0', '8242e413f50c4d2593e65c0f1bcea783');
INSERT INTO `t_role_resource` VALUES ('1a90931f2aa1411b91be4356f5b5eba8', '3', '26861743a0d641c696437a1d929a0c29');
INSERT INTO `t_role_resource` VALUES ('1b7afb2149a741cd8cf35ab7534a0914', '2', 'c695fe9824454d2c9b3c2bf5b80a7d9f');
INSERT INTO `t_role_resource` VALUES ('1bac89f5001b48698cecbc3891157fc3', '1', '1d3a4457d5a94b188e9916ba1474296c');
INSERT INTO `t_role_resource` VALUES ('1e52fd000d6c45c9aa78a1c502ce7cb7', '3', '6494e120066045bd98ba615d23b7e5a8');
INSERT INTO `t_role_resource` VALUES ('1e9c94e0ca9f46c78abf25613a38f382', '2', '363d651c5c354f58ab5daec3b9f8fddc');
INSERT INTO `t_role_resource` VALUES ('1fd3c52a4a094fb6b4b98ac0be2fa882', '3', 'a6d865146ea84ebe9a34b8737502f013');
INSERT INTO `t_role_resource` VALUES ('20797f1a73df4627a0dfc98ec94ff18b', '2', '1d3a4457d5a94b188e9916ba1474296c');
INSERT INTO `t_role_resource` VALUES ('24a19918cc3446a7acacb5e39414091f', '2', 'd9b4cebbad0a456189612e79111e6626');
INSERT INTO `t_role_resource` VALUES ('24d31b63192649f6ae9fae3a6c212c9c', '3', 'ace751057a8145ce9504b6dc21628398');
INSERT INTO `t_role_resource` VALUES ('25db2bcbe4c447129bb058af37972b90', '3', '1d3a4457d5a94b188e9916ba1474296c');
INSERT INTO `t_role_resource` VALUES ('2789352113f84ad987c0cd098eaae568', '3', '0604e260e1964c099bcdc0c87dad42c5');
INSERT INTO `t_role_resource` VALUES ('28fbf30f53b2496599c02a6128b8c990', '2', '0604e260e1964c099bcdc0c87dad42c5');
INSERT INTO `t_role_resource` VALUES ('2bb55a5de01741c4ad6dba2e4db9274e', '1', '98c19dcc1db740418a2bf02bbd0ce0e1');
INSERT INTO `t_role_resource` VALUES ('2dd96690cbdf48e1bb59a7e751e53882', '2', 'd31da12a2be24b67bfcc6e53ad7edc01');
INSERT INTO `t_role_resource` VALUES ('30bbd9acbec646c1bdf5647e90f52b95', '2', '13d9d180d3ba45e680ef573d49e62761');
INSERT INTO `t_role_resource` VALUES ('321fbe0c32c44427aa9b35efa880fca7', '2', '083e10f097ef4cc88db52988fb135933');
INSERT INTO `t_role_resource` VALUES ('32bf8219a63343fab28a84162fc915fb', '2', '0a4991bf50ec4330bb552300be758258');
INSERT INTO `t_role_resource` VALUES ('36741fe3df0f4cfb83f39f6677054aab', '0', 'e2ceb979e1ec42b8beee4c072546c38f');
INSERT INTO `t_role_resource` VALUES ('3756876f46ca49a1b57e140e264d8fb9', '2', '37af9c88f43a4015b0570f8d9429b918');
INSERT INTO `t_role_resource` VALUES ('3d51bdbb3bde41b0b947659f6dd9a058', '0', 'ebef3376c260432a85340834c660b1f8');
INSERT INTO `t_role_resource` VALUES ('4145042d14a949c09a6f4ebb628b9e7d', '2', '5aef36ca7e8143f7938c41a35ce004c6');
INSERT INTO `t_role_resource` VALUES ('41fdadb12b7642e68b346afbc3f7a17e', '1', '05e78782d11b4e44b5ab9ea5a813c029');
INSERT INTO `t_role_resource` VALUES ('47fa1ad9c1ab494a82b6715adc98177f', '3', 'f03c54c1d6f346ad91d67f4ad4a4019d');
INSERT INTO `t_role_resource` VALUES ('49092f88cf7e440589dc466f93119be7', '4', '0604e260e1964c099bcdc0c87dad42c5');
INSERT INTO `t_role_resource` VALUES ('49cde3346a354e3f9ce70893902e9e93', '2', 'cb3e9b91078a4458adda2aa4f716a2d4');
INSERT INTO `t_role_resource` VALUES ('4bbfdfdd6a4341e0b04b18a1430ed285', '5', 'defce548a8664d42a425628e112fbe09');
INSERT INTO `t_role_resource` VALUES ('4c88e6f72762409f8568930d0ee78adc', '2', '490cfe600e5c4b55a3581dad619eca48');
INSERT INTO `t_role_resource` VALUES ('4e3aec8fe2e0462ca92ea6d83e304ce8', '0', 'd079fc6f75eb49148b9be9fe63c5a526');
INSERT INTO `t_role_resource` VALUES ('4e59d9de29a04343a28ca96f3c90bcea', '2', 'f03c54c1d6f346ad91d67f4ad4a4019d');
INSERT INTO `t_role_resource` VALUES ('52ea7f50a45b40f3a4ba04efd64cb6a6', '2', '54fc88ee4ed542d182c943d2137978c8');
INSERT INTO `t_role_resource` VALUES ('531ef7a7e9bb4fb4b2a2f31de1fe30bb', '4', '4989828159714b6c83e6943f7c3b5c94');
INSERT INTO `t_role_resource` VALUES ('53dc89d98f4a45139aac7aa42aced242', '4', 'd79782ab79c546d28022742d36840dc8');
INSERT INTO `t_role_resource` VALUES ('55c4f1711bfe4bcabbf0e41582cb8e97', '2', '982ad41796e04da6b9d866cd81cbab90');
INSERT INTO `t_role_resource` VALUES ('5706b4e08297420fb40743352086a845', '2', '8ae28597053c47b48ace1c192be07ac2');
INSERT INTO `t_role_resource` VALUES ('5c22d0d72683464083dbde3788e57ec5', '3', '5205bd061ea242f99186f3b272fe312d');
INSERT INTO `t_role_resource` VALUES ('5d277a2bbb074d4382464dbc0ee5201a', '4', 'a37621bebfa148309ae269b0e6c18db1');
INSERT INTO `t_role_resource` VALUES ('5f5c948e0d0a4eecbd55df776a04c471', '2', '887609d9f191424b995a830ca6058d0f');
INSERT INTO `t_role_resource` VALUES ('65dd07eb2d4a4a5d8761bd549247457b', '3', 'a37621bebfa148309ae269b0e6c18db1');
INSERT INTO `t_role_resource` VALUES ('665567cd8b414199951894adb330afd4', '2', '4a01246436634e47b903514e95365040');
INSERT INTO `t_role_resource` VALUES ('66716b0655444d309573d099a5625348', '2', 'e2ceb979e1ec42b8beee4c072546c38f');
INSERT INTO `t_role_resource` VALUES ('667c8e356d124f7f83e902f5441f7eb5', '2', 'bf5f545551724ce9b75e33b8cdd6348b');
INSERT INTO `t_role_resource` VALUES ('66851c71eade477ea047a9a01d099185', '2', '6494e120066045bd98ba615d23b7e5a8');
INSERT INTO `t_role_resource` VALUES ('67e21ef40cd44fb1a20f426b5a023b92', '2', 'a1e00ec329a74bfeb6bbc719d718f911');
INSERT INTO `t_role_resource` VALUES ('694ec68eba754caba667da591323d9a7', '2', 'dbfbf63c78294adead7db7440e824836');
INSERT INTO `t_role_resource` VALUES ('6cc7a107ec0a4a7baeb3d812f2688cca', '4', 'b1612b0c44c84604b7bf2fe699ffa8e4');
INSERT INTO `t_role_resource` VALUES ('6dcc833301b34978817c2efaec1a81e9', '0', 'f9bd86b397f94ac59b8c623fc67673b0');
INSERT INTO `t_role_resource` VALUES ('712a1764f5804b4f880b3cf98d98bcec', '2', '1a8473d9a1624a40aeb9f97dd84a4426');
INSERT INTO `t_role_resource` VALUES ('7415d4abb817428aaed79795233e20f5', '4', 'aec14cab2bba410785fcf7ee9af198bc');
INSERT INTO `t_role_resource` VALUES ('74bdd7f157a64c76af85b744a2c26713', '2', '47f035dcdca04c0fb20c10c58441d050');
INSERT INTO `t_role_resource` VALUES ('761d5b24908f402883dfc9fd6c9f49b0', '3', 'f933dcf78539497bb52d33912089f979');
INSERT INTO `t_role_resource` VALUES ('764572a226294c37b2d623eb799cebc3', '2', '5888fb0706114603b6a18e052c39c8c3');
INSERT INTO `t_role_resource` VALUES ('775e54f685b34a86ae028295f2c8b8e6', '2', 'c7422de1780647d6921d75ade9c11180');
INSERT INTO `t_role_resource` VALUES ('7863ca549e7b44928f513d52dbeb6c66', '2', '982eafbfc1814059a5764bc028b38c1d');
INSERT INTO `t_role_resource` VALUES ('78db1715d99d428c8d3bc1d0b1144cc4', '2', 'b15ed26f7a31445693d3d26c67be3583');
INSERT INTO `t_role_resource` VALUES ('7bb7aafa84a0475398b5d30e23ef79ec', '2', '8eea1b5b07ed4ff4a473c47fdbb14980');
INSERT INTO `t_role_resource` VALUES ('7d314040cab84d9ea5377b0255e6df96', '0', '48dba22ef052498ba1525b2e7e4bc987');
INSERT INTO `t_role_resource` VALUES ('7d5278f5863a4183ba3ea556cec6e546', '2', '98c19dcc1db740418a2bf02bbd0ce0e1');
INSERT INTO `t_role_resource` VALUES ('7e81d80d674748e8a2391d9c2d3b9a6b', '2', 'b333bba196224fdcb8df97f259fb1f14');
INSERT INTO `t_role_resource` VALUES ('815c54c34f544e8ea51d81ef2f9df324', '2', 'ef387f24aab4466d9b7c60aa24fbe9b9');
INSERT INTO `t_role_resource` VALUES ('816d34df303f471c9fd860842bd4dff5', '2', '33593600ece148d8b897a443d3192279');
INSERT INTO `t_role_resource` VALUES ('83d1156fc387448fb9d7c16376a27365', '4', '5d601a4b16d944c6abe31b25eeeca828');
INSERT INTO `t_role_resource` VALUES ('84ffbc281a564f1f974e728cfa93d0b7', '3', '8eea1b5b07ed4ff4a473c47fdbb14980');
INSERT INTO `t_role_resource` VALUES ('85b8f1416eb94e9f8dc269ddf1935fd8', '2', 'e7717d1a09c0480faddc26d97c0c13b3');
INSERT INTO `t_role_resource` VALUES ('8a2809b1a6bf4834a7dc29dca6156402', '1', '3141bd0792f04d88b4ccc1a6619c6d25');
INSERT INTO `t_role_resource` VALUES ('8b64fd6acaa1424483401805aa332ed4', '2', 'b5af00b6c8604b1cb0036df26bdc52ff');
INSERT INTO `t_role_resource` VALUES ('8c6be5186a2a4bb2b9e3d74e00a0f597', '2', '0ace598e0bd24b528e2fe7136e6f68d7');
INSERT INTO `t_role_resource` VALUES ('9050dea5acc84d5096f61304f2180a4e', '2', '2d783fa1f7404e479d73686b80f8a706');
INSERT INTO `t_role_resource` VALUES ('960e8bcbf0054f10a6acdd3aa4409f7d', '3', '8242e413f50c4d2593e65c0f1bcea783');
INSERT INTO `t_role_resource` VALUES ('96108c6417dc45dab8b58cfa3b7f6e01', '2', '64a28c8d5f14439289d7f12a6e6b8a9e');
INSERT INTO `t_role_resource` VALUES ('96a9748fb08546c6ac4adb6b30e5cece', '0', '484f2fba719f45a1b58a7a876e9f7b2e');
INSERT INTO `t_role_resource` VALUES ('96f96a4e718d4594abbefc5e47159ab5', '2', 'f9bd86b397f94ac59b8c623fc67673b0');
INSERT INTO `t_role_resource` VALUES ('97022f2b084a4b709359752711414ae8', '2', 'ef36fad1e3774a11b233067b3bf5f6a1');
INSERT INTO `t_role_resource` VALUES ('987f1cce2a2c46f8b3c17f28680129a7', '0', '68b8bea0047f44c08a5eacd0d5744e09');
INSERT INTO `t_role_resource` VALUES ('988ea144be9547ada4583c2dcb620923', '3', '41ba9c87b86649d2b759dd5f66207240');
INSERT INTO `t_role_resource` VALUES ('997465be7ca34eadac5d70521cecb3fc', '0', '0984ce00a6ca4c79ad5cd69e05772c4b');
INSERT INTO `t_role_resource` VALUES ('99d9ec1682b8442ab263a761ecf48d44', '2', '2b5cfbe32aff47eaaa93074950c6b75b');
INSERT INTO `t_role_resource` VALUES ('9ae19d6083444beeb4481c6442cdb82f', '2', 'a88629b29e904acb92f01c4430c04028');
INSERT INTO `t_role_resource` VALUES ('9e2dc22f667846c4adfa58904e9132f6', '3', '8f165c93ae9d485ba7fe22398311fcb4');
INSERT INTO `t_role_resource` VALUES ('a062eca05d5c43a6b9d19879196fa25c', '3', '98c19dcc1db740418a2bf02bbd0ce0e1');
INSERT INTO `t_role_resource` VALUES ('a24d6d6401134d36bffa487c24789e9e', '2', 'd9584d4b35824d4890b5edc1d61d80ca');
INSERT INTO `t_role_resource` VALUES ('a295cd9e36704d158ff139e5ec86b8ce', '1', '0604e260e1964c099bcdc0c87dad42c5');
INSERT INTO `t_role_resource` VALUES ('a50d46e7fd2c47b8a1700f0ea463965b', '0', 'a4e1e6643411452ebaf5d0730108800e');
INSERT INTO `t_role_resource` VALUES ('a7c613e847ff41aa93a9f297452176cd', '0', '58b78211eb6b40cc85ee7eab5f84335a');
INSERT INTO `t_role_resource` VALUES ('a8bb2f387bd04ae8b41ebeb4153abd48', '2', '70eda230170a4d108c640af0d0f38e63');
INSERT INTO `t_role_resource` VALUES ('a9a8cc65730b4960a953f802f15c8ae1', '4', 'c461fbe667074d8ab1e517a48de71546');
INSERT INTO `t_role_resource` VALUES ('aa4f99c2134e42a3a5fe728fc8d0c30d', '3', 'ffa068a06c0d4456b61bdb8799b9edf0');
INSERT INTO `t_role_resource` VALUES ('ae254ec87fd24e3f99f34627190c4e23', '0', '1d3a4457d5a94b188e9916ba1474296c');
INSERT INTO `t_role_resource` VALUES ('af03dc19e66648c88ccf6dd530699569', '3', '18302a123c6e4075a64d368920fd69fc');
INSERT INTO `t_role_resource` VALUES ('b01024d263704f56ba1a7d595e0f433b', '4', 'c0fb8b5ef0134ddaa29fd49e262cadae');
INSERT INTO `t_role_resource` VALUES ('b089e30e7c9d4bf3a563d2a712b05872', '3', 'f9bd86b397f94ac59b8c623fc67673b0');
INSERT INTO `t_role_resource` VALUES ('b0cefa4361a94eff899a2566ee3fd8d1', '3', 'e2ceb979e1ec42b8beee4c072546c38f');
INSERT INTO `t_role_resource` VALUES ('b6361ca7047545fdac07a81a368f1448', '3', '0bafaf6024924aa18c5bcbe728c75b02');
INSERT INTO `t_role_resource` VALUES ('b671d45ffaff4674be4fb39ffc85ec30', '0', '4e8d3c00adf34b969d910a1cbb76438d');
INSERT INTO `t_role_resource` VALUES ('b6ee07e552574dbba2e396a8691ef37a', '2', 'a6d865146ea84ebe9a34b8737502f013');
INSERT INTO `t_role_resource` VALUES ('bc34c82e2af648d3b293406f24b339b5', '4', 'f59be6ee96cc4f4d89e8e072c14f0475');
INSERT INTO `t_role_resource` VALUES ('befd43091e804a1abd253aa321093d86', '2', '0f00e77ace3f4470b1a8b92513632b67');
INSERT INTO `t_role_resource` VALUES ('bf49acafd316412e8c266ea3c76f95d2', '2', '8242e413f50c4d2593e65c0f1bcea783');
INSERT INTO `t_role_resource` VALUES ('c11eaa82b4914c3cab3247a1d4b23567', '2', 'ada7dc08b7b440d4a83249062c065a20');
INSERT INTO `t_role_resource` VALUES ('c150a0ee8fff4a91ba46677c81a79d1e', '2', 'e3669d837bab4fdaad327ea096303005');
INSERT INTO `t_role_resource` VALUES ('c53169ed0bad4660a5857d24db0eb428', '0', 'a13642e5764c4575b9742c3267002576');
INSERT INTO `t_role_resource` VALUES ('c6e8fc9b597b46fda494f86d23f97a4f', '4', '8ad739c51b524df585d0b6552e593859');
INSERT INTO `t_role_resource` VALUES ('c80a4fc1f9bc460a903dcd55bfc63ac4', '3', 'e1924142e94d404ba7c4b461634aeb37');
INSERT INTO `t_role_resource` VALUES ('c9289e258175461d8e7339f276585792', '0', '98c19dcc1db740418a2bf02bbd0ce0e1');
INSERT INTO `t_role_resource` VALUES ('c936487dc9ca4e42ab350af990f8b73e', '0', '0604e260e1964c099bcdc0c87dad42c5');
INSERT INTO `t_role_resource` VALUES ('c96f00d6c2344a52a7b4903b91d0b20d', '2', 'c698654dd2254608920cdb3d7f1bbe9d');
INSERT INTO `t_role_resource` VALUES ('ce132a0639ac411fb7f2f640df916637', '2', 'cd906dea2fa449ddabd20275cdfe3f03');
INSERT INTO `t_role_resource` VALUES ('d05c7a134b474466b436f66e58524aa1', '3', '8ad739c51b524df585d0b6552e593859');
INSERT INTO `t_role_resource` VALUES ('d6bbd60ddd9447719678db4ae0ee5b85', '3', 'e88511afa07d41df8d6e62d546f4f055');
INSERT INTO `t_role_resource` VALUES ('d6dd248d6cef42e2874fdb647fb6ac54', '2', 'a48efdd63ea94770903a5fd33300483f');
INSERT INTO `t_role_resource` VALUES ('d738b0ba39e94d6788587acb8f970b83', '0', '5b71d03556c946e09acd9c7416d9b9d9');
INSERT INTO `t_role_resource` VALUES ('d7c057f7fa1f4a33afd036a3ea71e21d', '4', '18bf95c66e3b4fa1bd18f99d7dbaaf9b');
INSERT INTO `t_role_resource` VALUES ('d843212e8a114435b5a34c21f8c14bcc', '4', 'd12fc2d7bc534a628aff3e3ddf5102fd');
INSERT INTO `t_role_resource` VALUES ('d90f454c19d0411590429d05f5818b5c', '3', '43c33a95bdde426e82590c7698defba6');
INSERT INTO `t_role_resource` VALUES ('dbddb91af66f484fb6d255ca68b37121', '0', '61482f1e49f0491eab45e6af01d09fd9');
INSERT INTO `t_role_resource` VALUES ('df047fd1c8604860b180b6d96364f3ac', '2', '8b94bb2f3f79436b9d2426e213a79133');
INSERT INTO `t_role_resource` VALUES ('e269055046494f07a3fdb19f69c7a5a1', '2', 'bbf62dd34fcd4379afd6989336a6d230');
INSERT INTO `t_role_resource` VALUES ('e3fcda58a3134e90a92256339f575e84', '3', 'f1ac35ed65c04140b5d4b50410f2fffa');
INSERT INTO `t_role_resource` VALUES ('e529211d1fe9404aaf30146963dcb701', '4', 'dfc4b47ebe894edd9ac6592a4a9d1acc');
INSERT INTO `t_role_resource` VALUES ('e558f23a290d4003a9d222dcd0b48786', '2', '7acf3608a5314298a7bba67daaace96c');
INSERT INTO `t_role_resource` VALUES ('e73ad98124514f81ad3554e4048e8eaf', '2', 'a4b660ea18fd43ac8d509b390abc117f');
INSERT INTO `t_role_resource` VALUES ('e9c19fa31af244559f9a6728e4e9e35f', '2', '095aedd6e4ab4e3b99f0cf6f8902c037');
INSERT INTO `t_role_resource` VALUES ('eb898e1710414573bedc849d9a1bba44', '2', 'a9278833f99f44eda6eb5dc12f954a0f');
INSERT INTO `t_role_resource` VALUES ('eefab52ec82f4df38577ec7418816108', '2', 'b7a6f4539d82457aae13b0667bd523eb');
INSERT INTO `t_role_resource` VALUES ('ef59553444bb4d4d8fa20c92659ae9c5', '5', '64dd9241f6f14444bb25bbdd63d9091e');
INSERT INTO `t_role_resource` VALUES ('ef6a22fbd30f467a8c7b6f34e6c5fbad', '2', '02d4cd3bd5cd4b1ebdd312de2447ced0');
INSERT INTO `t_role_resource` VALUES ('f011d868e58842c4aec28a5bbe4a6253', '0', '6494e120066045bd98ba615d23b7e5a8');
INSERT INTO `t_role_resource` VALUES ('f0158698ad27451c8417186ea83f4ca3', '2', 'a61bf6e4fc524c39a692d2a04e81cb35');
INSERT INTO `t_role_resource` VALUES ('f1e98b282e8f41d0a23799b3aeaf5a70', '2', '2ef14fdc9a6f44ba9675d4822108d1d3');
INSERT INTO `t_role_resource` VALUES ('f48f5125cd9d4823980fae61e41dbd9e', '4', '4dc2be053d7f49f1a8ef5b8d4301d9bf');
INSERT INTO `t_role_resource` VALUES ('f779719a3b434e0a95e039b1055b2747', '4', '9020fe55a21f487480bce4840b42f433');
INSERT INTO `t_role_resource` VALUES ('f8be00c61e9644b2990d953a329e87ea', '3', '1c1f6600aa4c42648d50c475bc630cd2');
INSERT INTO `t_role_resource` VALUES ('f9bb7277e449472e85521192c515f660', '2', 'aeb205f1262d4c3bb8654db532ee5db5');
INSERT INTO `t_role_resource` VALUES ('fa0891ee0a474292b860339179b249d5', '0', 'e2fd5fa03b9a49bfa060fea41b1f1dca');
INSERT INTO `t_role_resource` VALUES ('fa39b1189cbb4abf8184f5e5c467f33f', '2', '61c1ccf250c1467781670ba9bd00eb73');
INSERT INTO `t_role_resource` VALUES ('fa4a7cfc0c3c4fdfae68aa55ea2aa508', '2', 'eb1d31a9abe84712a6410a7281f0b34e');
INSERT INTO `t_role_resource` VALUES ('fce41762e8b04dc49e070f843f9ead0c', '0', 'a6d865146ea84ebe9a34b8737502f013');
INSERT INTO `t_role_resource` VALUES ('fdde27856fd24aa6b4e5ea025da97531', '4', 'ef36fad1e3774a11b233067b3bf5f6a1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `uuid` varchar(255) NOT NULL,
  `userUuid` varchar(255) NOT NULL,
  `roleUuid` varchar(255) NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `userrole_user` (`userUuid`) USING BTREE,
  KEY `userrole_role` (`roleUuid`) USING BTREE,
  CONSTRAINT `userrole_role` FOREIGN KEY (`roleUuid`) REFERENCES `t_role` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('008e03c5d7c2415da0606eeeb8aa22dc', 'f3f6f4127daa49e6ba5136caf2f4f63b', '4');
INSERT INTO `t_user_role` VALUES ('05d446f38fec44898f8e8634cb36fca6', '480a63e56a5948e59e2b242ece855e06', '4');
INSERT INTO `t_user_role` VALUES ('1dc87e5174684c2fb401444ece638be1', '1029ccbc28bbd48bc92664e1c0992ad', '2');
INSERT INTO `t_user_role` VALUES ('22c4162ea78a4ebb879970cf118528d0', '9c42c3ed93964560b76cc78712ae013c', '4');
INSERT INTO `t_user_role` VALUES ('35ec461d9af44ba7989e8614b94da343', '0543717c208a4a85886365ae3e2df130', '3');
INSERT INTO `t_user_role` VALUES ('42852940032445058c35757935d49f43', '7d15e9976cb2429995cda5f39fb8a5f5', '4');
INSERT INTO `t_user_role` VALUES ('576395342f0f4979bbe52aef9ce7f76d', '7d15e9976cb2429995cda5f39fb8a5f5', '5');
INSERT INTO `t_user_role` VALUES ('5de69eada9274d5182c5311819dfc9a9', 'c0960f97d3a342ddabe850263edb4b2a', '1');
INSERT INTO `t_user_role` VALUES ('75c3414d8e36464aac730ced6e54d9fe', 'e181d5588ec44538b748782418c4f606', '4');
INSERT INTO `t_user_role` VALUES ('772579fec1e94fc29aa61c2b61672dfe', '94eb6d6e066d44a8a1d5726915005d14', '4');
INSERT INTO `t_user_role` VALUES ('910d74ed24f24f508d60bdc8acc36834', 'e181d5588ec44538b748782418c4f606', '5');
INSERT INTO `t_user_role` VALUES ('a20eae147f0149dc8f4c7cf7299c77b7', '94eb6d6e066d44a8a1d5726915005d14', '5');
INSERT INTO `t_user_role` VALUES ('b09925ed992c430aa3ba552e20558c58', 'abbfd7fc81174bf59a2def2e892bba49', '0');
INSERT INTO `t_user_role` VALUES ('b65298fdd6824069ba0fdd70418704ac', 'a58bb63c59984f099f9459191e7269ef', '0');
INSERT INTO `t_user_role` VALUES ('c833aa3dd3c547f1a0dd89c438dc6a5e', '097d0de052554d4f9cbc35f8f7f341c9', '3');
INSERT INTO `t_user_role` VALUES ('e0f6c511e7b042aca350a9a89f3a25bb', 'b3edd5d0f5c5499fb586bb3679bf22d1', '4');
INSERT INTO `t_user_role` VALUES ('ea669c65f5e049b49f2165523bdf1e4d', 'bc6c40e5a764473abb2608937125cf60', '3');
