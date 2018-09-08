/*
Navicat MySQL Data Transfer

Source Server         : web_graduation_project
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : ssm_system

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-09-09 06:59:15
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_comment`
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `news_id` int(20) NOT NULL,
  `content` varchar(100) NOT NULL,
  `createtime` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for `t_like`
-- ----------------------------
DROP TABLE IF EXISTS `t_like`;
CREATE TABLE `t_like` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_like
-- ----------------------------

-- ----------------------------
-- Table structure for `t_news`
-- ----------------------------
DROP TABLE IF EXISTS `t_news`;
CREATE TABLE `t_news` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `newstype_id` int(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tpic_url` varchar(100) DEFAULT NULL,
  `newsabstract` varchar(100) NOT NULL,
  `content` longtext NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `reading` int(100) unsigned zerofill NOT NULL DEFAULT '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000',
  `status` int(20) NOT NULL DEFAULT '0',
  `createtime` varchar(100) NOT NULL,
  `cpic_url` varchar(100) DEFAULT NULL,
  `stick` int(20) NOT NULL DEFAULT '0',
  `audit` int(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news
-- ----------------------------
INSERT INTO `t_news` VALUES ('4', '1', '文章1', null, '文章1摘要', '<p>文章1内容</p>', '6', '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000002', '1', '2018-09-07 22:52:49', null, '0', '0');
INSERT INTO `t_news` VALUES ('5', '1', '文章2', '', '文章2摘要', '<p><img src=\"http://127.0.0.1:8080/ssm_system/ueditorimage/20180908/1536336537990003150.jpg\" title=\"1536336537990003150.jpg\" alt=\"1.jpg\"/>文章2内容</p>', '6', '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001', '1', '2018-09-07 22:53:06', '', '0', '0');
INSERT INTO `t_news` VALUES ('6', '4', '何为指弹', '', '指弹是一种演奏方式，又称作钢弦木吉他演奏。', '<p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">&nbsp;&nbsp;&nbsp;&nbsp;指弹是一种演奏方式，又称作钢弦木吉他演奏，英文为Fingerstyle guitar，是一种吉它加花的奏法，在音乐界非常新兴的项目，而这些手法大多来自民间的继承，结合了</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%BC%97%E6%8B%89%E9%97%A8%E6%88%88/490678\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">弗拉门戈</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">，</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%A4%8F%E5%A8%81%E5%A4%B7/6068\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">夏威夷</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">，</span><a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%A5%BF%E7%8F%AD%E7%89%99/148941\" style=\"color: rgb(19, 110, 194); text-decoration-line: none; font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; white-space: normal; background-color: rgb(255, 255, 255);\">西班牙</a><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\">等吉他演奏法与打板技巧并不断的创新。 指弹吉他可以用手指弹奏，也是可以用拨片和指套来演奏，与古典吉他最大的不同是，指弹吉他广泛应用许多的调弦法，拍击， 手法完全不受限制，只要能用一把吉他作出任何美妙音乐 皆为Fingerstyle木吉他音乐， 融合现代和声，Jazz ，Blues，Celtic，Country，R&amp;B等风格，并融入演奏者自己之创作与编曲想法。</span></p><p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\"></span></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">演奏法</h3><p>一、定弦：根据指弹吉他重低音弹奏的需要，由第六弦至第一弦调弦为EADGBE(362573)；</p><p>二、左手持琴与右手弹奏：</p><p>1．左手姿势</p><p>①左手持琴拇指放在琴颈的后面，使之与琴保持平衡。</p><p>②左手各指弯曲放在琴的指板上，合理地应用各个手指各指应依次按在指板上的品格根部。左手</p><p>2．右手姿势</p><p>①右手弹奏时，手掌与各个手指应放松，弹奏动作要小。</p><p>②拇指和其他指共同弹奏时要处理好协调关系，避免相互碰撞。</p><p>三、交替低音：学习指弹吉他演奏时，最好从交替低音弹奏开始。作为一种技巧，弹奏时用右手拇指在低音各弦上进行交替练习。注意小节间的拍节。每一拍音、音符、时值都要正确。以C大调和弦中的音为例，左手按住品格位置，然后用右手拇指从第<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E4%BA%94%E5%BC%A6%E5%BC%B9\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">五弦弹</a>至第四弦。</p><p>四、弹奏单旋律：旋律部分在最高音的三条弦上演奏(它们分别是三弦G，二弦B和一弦E)，用食指弹G弦；用中指弹B弦；用无名指弹E弦。</p><p>五、褪击法(Hammer—on)：演奏中，经常会遇到乐谱中的音符有连线，在连线上标有“H”的符号，这就是“褪击法”。可理解为上连音奏法，右手弹奏第一个音符后，紧接着用左手弹奏第二个音符，而用左手弹奏这第二个音时，则采用这种“钮击法”来弹奏，会使人感到一种新颖及富有魅力的音响效果。</p><p>六、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%89%B9%E6%8B%89%E7%BB%B4%E6%96%AF\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">特拉维斯</a>拨奏法(Travis PicUng)：最初是以著名吉他演奏家——“默尔·持拉维斯(Merle Travis)开创发展而流传于世界各地。</p><p>七、滑音(S1ide)奏法：缩写为SL。手指在同一条琴弦上进行滑行而完成的动作。具体地说，左手指在某一条琴弦上向上或向下滑动，是由右手的弹奏同步来完成。要注意的是，左手按压琴弦要有足够的压力，而滑行速度根据乐曲所需的时值而定，鉴于乐曲的需要，左手拇指也可在低音弦上滑音。更有特点的滑音奏法是左手食指加指套进行滑奏，发音清脆响亮，十分动听。</p><p>八、三连音奏法：采用钮击法和拉放奏法相结合来完成。三连音第一音弹奏，第二音用银击法，第三音还原，完成的动作称为拉放奏法，“p”为拉放(PMll一oH)奏法缩写。</p><p><span style=\"background-color: rgb(255, 255, 255); font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; font-size: 22px;\">代表人物</span></p><p><br/></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">传统美国指弹</h3><p>传统指弹的代表人物——传统美式指弹：<a target=\"_blank\" href=\"https://baike.baidu.com/item/Leo%20Kottke\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Leo Kottke</a>,<a target=\"_blank\" href=\"https://baike.baidu.com/item/Chet%20Atkins\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Chet Atkins</a>，<a target=\"_blank\" href=\"https://baike.baidu.com/item/Tommy%20Emmanuel\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">Tommy Emmanuel</a>欧洲Celtic风格的代表：Bensusan</p><p><a class=\"lemma-anchor para-title\" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a><a class=\"lemma-anchor \" style=\"color: rgb(19, 110, 194); position: absolute; top: -50px;\"></a></p><h3 class=\"title-text\" style=\"margin: 0px; padding: 0px; font-size: 18px; font-weight: 400;\">现代指弹</h3><p>现代指弹风格：现代指弹风格则是以DonRoss，Michael Hedges等一批吉他大师的创新演奏为主体的，风格更多的是Newage，funk，Latin等曲风。对比传统指弹演奏技巧，现代指弹演奏技巧方面则注</p><p>重“音效”，有时会运用到效果器。比如日本演奏家中川砂仁，押尾光太郎等。现代指弹的音色效果出众，演奏时往往伴随敲击面板，敲打泛音，slap等技术。</p><p><span style=\"font-weight: 700;\">指弹吉他民间高手</span></p><p>著名的指弹吉他民间歌手有汤姆·帕克斯顿(Tom Paxton)、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%90%BC%C2%B7%E8%B4%9D%E5%85%B9\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">琼·贝兹</a>(Joan Bhez)和戈登·莱持富特(Gordoo Lisntsoot)等人。能使指弹吉他真正得到推广的，还得归功于城市的吉他弹奏家、音乐家、作曲家，他们把民间的指弹吉他技艺推前了一步，使之日臻完善。贡献不小的是指弹吉他演奏家<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E8%8E%B1%E5%A5%A5\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">莱奥</a>·考特基(Leo Kottke)，他非常完美地将指弹吉他给予表现。其中作品有《贫穷的男孩》、《最后的蒸汽机车》、《基督在那里·不在东和西》等，还都录制成吉他唱片，出版曲集有《莱奥·考特基六和十二弦吉他》等，很受世界各国人民的欢迎。由于他在指弹吉他方面有杰出的贡献，卓越的成就，从六十年代开始，曾连续五年在美国被评为“最佳民间吉他演奏家”美称。</p><p><span style=\"background-color: rgb(255, 255, 255); font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; font-size: 22px;\">问题答疑</span></p><p><span style=\"background-color: rgb(255, 255, 255); font-family: &quot;Microsoft YaHei&quot;, SimHei, Verdana; font-size: 22px;\"></span></p><p><span style=\"font-weight: 700;\">什么是指弹？</span></p><p>什么是指弹( Finger-Style )</p><p>首先“指弹”并不是一种吉他的类型或者名称。许多人习惯把琴颈较细、金属弦的吉他称为“民谣吉他”，而琴颈较粗、尼龙弦的吉他称为“古典吉他”，那么理所当然也把“指弹”当作一种吉他的类型。这样理解就错了，“民谣吉他”、“古典吉他”以演奏内容来命名尚且勉强可以接受，至于“指弹吉他”，难道还有“脚弹吉他”么？ 有，国外的确有一位用脚趾弹吉他的高手。但以弹琴的部位命名吉他实在显得有些肤浅，况且“古典吉他”等也是用手指演奏的。所以，“指弹”不等于用手指弹。</p><p>“指弹”是一种吉他的演奏形式，或者说演奏手法。著名的指弹<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E6%BC%94%E5%A5%8F%E5%A4%A7%E5%B8%88\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">演奏大师</a>Tommy Emmanuel说过“‘finger style’- is akin to playing guitar the way a pianist plays piano”，他认为指弹（finger-style）是一种类似弹钢琴的吉他演奏形式。在我心中，指弹是一种充分利用吉他的指板、有限的手指和时间演奏出层次分明的曲子的独奏形式， 其和声的饱满程度相当于两把以上使用一般方式演奏的吉他，甚至可以与钢琴媲美。指弹的技巧是高度自由的，你可以结合使用各种技巧例如：古典<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E5%90%89%E4%BB%96%E6%8A%80%E5%B7%A7\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">吉他技巧</a>、<a target=\"_blank\" href=\"https://baike.baidu.com/item/%E7%94%B5%E5%90%89%E4%BB%96\" style=\"color: rgb(19, 110, 194); text-decoration-line: none;\">电吉他</a>技巧、BASS吉他技巧，</p><p style=\"text-align: center;\"><img src=\"http://127.0.0.1:8080/ssm_system/ueditorimage/20180908/1536366538526093600.jpg\" title=\"1536366538526093600.jpg\" alt=\"指弹大师tommy.jpg\"/></p><p style=\"text-align: center;\">指弹大师Tommy</p><p>甚至可以在吉他上敲鼓！指弹演奏的内容多种多样，乡村、Blues、爵士等等，还有许多即兴的成分。对于指弹，每个人都可以有自己的理解，你可以不赞同我的观点。只要去理解它、思考它并多欣赏其他人的演奏，你就会越来越了解什么是指弹。</p><p><span style=\"font-weight: 700;\">指弹和独奏的区别？</span></p><p>独奏有很多种形式，指弹只是其中一种。我个人觉得指弹可以是一种形式也可以是一种风格（包罗了其他各类的风格）。指弹几乎算是现在最高级别的独奏形式。引用一位同行的话：“指弹很注重低音的进行，如果把指弹曲子的低音单独弹出来，可能也算是一个旋律。而一般的独奏，低音只是装饰，旋律基本在中音或高音进行，一般人练一段时间都能上手。”</p><p><span style=\"font-weight: 700;\">指弹与古典的区别？</span></p><p>指弹用原声吉他，古典用古典吉他，一个是金属弦，一个是尼龙弦。</p><p>金属弦的音色变化比古典的丰富，因为琴弦细导致左手的细微动作比古典琴更敏感。古典琴的声音比较深沉，而箱琴更加明亮清澈。古典经历数百年沉淀与升华，很博大，也很“学院”派。而指弹在节奏上作的文章比较多，随意性比较大，左手技巧相对比古典音乐简单，重点技巧移向右手。引用一位古典朋友的话：“在很多年前，我曾听过一盘钢弦演奏古典吉他曲的磁带，演奏者是个外国人，演奏的不错，就是钢弦的声音比之尼龙弦来说音色变化少，延音似乎是长些。之后听了现代一些指弹风格后才逐渐明白，其实那是一种音乐风格，也是演奏吉他中派生出的一派。”简单来说，古典有几百年的沉淀，指弹有天马行空的想象力。不要去分谁高谁低。关于这种争论已经太多了，很多古典人带着高傲的眼光去看待不同于古典的其他事物，这其实是一种品性和修养皆不足的表现。</p><p>从演奏的角度上来看，古典更多的倾向于用吉他的音色以及对其的控制去诠释音乐作品，而指弹在考虑音色之余更多的会考虑节奏，换句话说，古典演奏的着眼点更多在吉他音色和演奏技巧，而指弹演奏的着眼点除了音色和技巧，更多集中在乐队或交响乐团所会产生的交汇感上，创作思路上的不同也因以上的不同而不同。</p><p><br/></p><p><span style=\"color: rgb(51, 51, 51); font-family: arial, 宋体, sans-serif; font-size: 14px; text-indent: 28px; background-color: rgb(255, 255, 255);\"><br/></span><br/></p>', '6', '0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000030', '1', '2018-09-07 22:54:02', '', '0', '0');

-- ----------------------------
-- Table structure for `t_news_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_news_type`;
CREATE TABLE `t_news_type` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_news_type
-- ----------------------------
INSERT INTO `t_news_type` VALUES ('1', '公司动态', '公司动态相关描述');
INSERT INTO `t_news_type` VALUES ('2', '通知公告', '通知公告相关描述');
INSERT INTO `t_news_type` VALUES ('4', '员工动态', '员工动态相关描述');

-- ----------------------------
-- Table structure for `t_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` int(20) unsigned zerofill NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES ('1', '00000000000000000000', '主页面', '访问欢迎页面', '/index');
INSERT INTO `t_permission` VALUES ('2', '00000000000000000000', '欢迎页面', '访问欢迎页面', '/welcome');
INSERT INTO `t_permission` VALUES ('3', '00000000000000000000', '操作员及权限管理', '菜单显示：操作员及权限管理模块', '/操作员及权限管理');
INSERT INTO `t_permission` VALUES ('4', '00000000000000000000', '企业内容发布及管理', '菜单显示：企业内容发布及管理模块', '/企业内容发布及管理');
INSERT INTO `t_permission` VALUES ('6', '00000000000000000000', '企业相册管理', '企业相册管理', '/企业相册管理');
INSERT INTO `t_permission` VALUES ('7', '00000000000000000000', '学习考核管理', '菜单显示：系统管理模块', '/学习考核管理');
INSERT INTO `t_permission` VALUES ('8', '00000000000000000000', '系统管理', '菜单显示：系统管理模块', '/系统管理');
INSERT INTO `t_permission` VALUES ('9', '00000000000000000003', '用户管理', '用户管理', '/用户管理');
INSERT INTO `t_permission` VALUES ('10', '00000000000000000003', '角色管理', '角色管理', '/角色管理');
INSERT INTO `t_permission` VALUES ('11', '00000000000000000003', '权限管理', '权限管理', '/权限管理');
INSERT INTO `t_permission` VALUES ('12', '00000000000000000006', '相册内容管理', '相册内容管理', '/相册内容管理');
INSERT INTO `t_permission` VALUES ('13', '00000000000000000006', '相册类型管理', '相册类型管理', '/相册类型管理');
INSERT INTO `t_permission` VALUES ('14', '00000000000000000009', '添加用户', '编辑相册', '/addUser');
INSERT INTO `t_permission` VALUES ('15', '00000000000000000009', '删除用户', '删除相册', '/deleteUser');
INSERT INTO `t_permission` VALUES ('16', '00000000000000000009', '修改用户', '修改用户', '/editUser');
INSERT INTO `t_permission` VALUES ('17', '00000000000000000009', '查找用户', '查找用户', '/searchUser');
INSERT INTO `t_permission` VALUES ('18', '00000000000000000009', '用户列表', '用户列表', '/listUser');
INSERT INTO `t_permission` VALUES ('22', '00000000000000000004', '信息内容管理', '信息内容管理', '/信息内容管理');
INSERT INTO `t_permission` VALUES ('23', '00000000000000000004', '信息类型管理', '信息类型管理', '/信息类型管理');

-- ----------------------------
-- Table structure for `t_photo`
-- ----------------------------
DROP TABLE IF EXISTS `t_photo`;
CREATE TABLE `t_photo` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  `uploaduser` varchar(225) DEFAULT NULL,
  `uploadtime` varchar(225) NOT NULL,
  `filename` varchar(225) NOT NULL,
  `salt` varchar(225) CHARACTER SET utf8mb4 DEFAULT NULL,
  `tid` int(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_photo
-- ----------------------------
INSERT INTO `t_photo` VALUES ('21', '相册1', '相册1', 'admin', '2018-09-05 06:57:00', 'f4ac363b87594e78c4f3b57f95cfd1ba', 'fEPgmxVMrcWwY+FPvC6weA==', '1');
INSERT INTO `t_photo` VALUES ('22', '相册2', '相册2', 'admin', '2018-09-05 08:35:19', '2c9e4b8b29db42cf95c3a56da3d491eb', 'ZKZy5fpLEzpBDBZQ8Vvdtg==', '2');
INSERT INTO `t_photo` VALUES ('23', '相册3', '相册3', 'admin', '2018-09-07 18:22:44', '6d9f4eac2f4ce453bedbe2992a8d61af', '9C5SovRg5KSvcZP6vGnilQ==', '3');

-- ----------------------------
-- Table structure for `t_photo_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_photo_type`;
CREATE TABLE `t_photo_type` (
  `id` int(225) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `description` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_photo_type
-- ----------------------------
INSERT INTO `t_photo_type` VALUES ('1', '类型一', '类型一');
INSERT INTO `t_photo_type` VALUES ('2', '类型二', '类型二');
INSERT INTO `t_photo_type` VALUES ('3', '类型三', '类型三');

-- ----------------------------
-- Table structure for `t_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `desc_` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', 'admin', '超级管理员：拥有全部权限');
INSERT INTO `t_role` VALUES ('2', 'editor', '文档管理员：拥有全部操作文档（增删改查）权限');
INSERT INTO `t_role` VALUES ('3', 'photo', '相册管理员：拥有全部操作相册（增删改查）权限');

-- ----------------------------
-- Table structure for `t_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rid` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES ('7', '7', '4');
INSERT INTO `t_role_permission` VALUES ('8', '7', '3');
INSERT INTO `t_role_permission` VALUES ('9', '7', '2');
INSERT INTO `t_role_permission` VALUES ('10', '7', '1');
INSERT INTO `t_role_permission` VALUES ('81', '2', '1');
INSERT INTO `t_role_permission` VALUES ('82', '2', '2');
INSERT INTO `t_role_permission` VALUES ('83', '2', '4');
INSERT INTO `t_role_permission` VALUES ('84', '3', '1');
INSERT INTO `t_role_permission` VALUES ('85', '3', '2');
INSERT INTO `t_role_permission` VALUES ('86', '3', '6');
INSERT INTO `t_role_permission` VALUES ('87', '12', '1');
INSERT INTO `t_role_permission` VALUES ('88', '12', '2');
INSERT INTO `t_role_permission` VALUES ('89', '12', '3');
INSERT INTO `t_role_permission` VALUES ('90', '12', '9');
INSERT INTO `t_role_permission` VALUES ('91', '12', '14');
INSERT INTO `t_role_permission` VALUES ('92', '12', '15');
INSERT INTO `t_role_permission` VALUES ('93', '12', '16');
INSERT INTO `t_role_permission` VALUES ('94', '12', '17');
INSERT INTO `t_role_permission` VALUES ('95', '12', '18');
INSERT INTO `t_role_permission` VALUES ('96', '12', '10');
INSERT INTO `t_role_permission` VALUES ('97', '12', '11');
INSERT INTO `t_role_permission` VALUES ('132', '15', '1');
INSERT INTO `t_role_permission` VALUES ('133', '15', '2');
INSERT INTO `t_role_permission` VALUES ('134', '15', '3');
INSERT INTO `t_role_permission` VALUES ('135', '15', '9');
INSERT INTO `t_role_permission` VALUES ('136', '15', '14');
INSERT INTO `t_role_permission` VALUES ('137', '15', '15');
INSERT INTO `t_role_permission` VALUES ('138', '15', '16');
INSERT INTO `t_role_permission` VALUES ('139', '15', '17');
INSERT INTO `t_role_permission` VALUES ('140', '15', '18');
INSERT INTO `t_role_permission` VALUES ('141', '15', '10');
INSERT INTO `t_role_permission` VALUES ('142', '15', '11');
INSERT INTO `t_role_permission` VALUES ('143', '15', '4');
INSERT INTO `t_role_permission` VALUES ('187', '16', '1');
INSERT INTO `t_role_permission` VALUES ('188', '16', '2');
INSERT INTO `t_role_permission` VALUES ('189', '16', '3');
INSERT INTO `t_role_permission` VALUES ('190', '16', '9');
INSERT INTO `t_role_permission` VALUES ('191', '16', '14');
INSERT INTO `t_role_permission` VALUES ('192', '16', '15');
INSERT INTO `t_role_permission` VALUES ('193', '16', '16');
INSERT INTO `t_role_permission` VALUES ('194', '16', '17');
INSERT INTO `t_role_permission` VALUES ('195', '16', '18');
INSERT INTO `t_role_permission` VALUES ('196', '14', '1');
INSERT INTO `t_role_permission` VALUES ('197', '14', '2');
INSERT INTO `t_role_permission` VALUES ('198', '14', '3');
INSERT INTO `t_role_permission` VALUES ('199', '14', '9');
INSERT INTO `t_role_permission` VALUES ('200', '14', '15');
INSERT INTO `t_role_permission` VALUES ('201', '14', '16');
INSERT INTO `t_role_permission` VALUES ('202', '14', '17');
INSERT INTO `t_role_permission` VALUES ('203', '14', '18');
INSERT INTO `t_role_permission` VALUES ('204', '1', '1');
INSERT INTO `t_role_permission` VALUES ('205', '1', '2');
INSERT INTO `t_role_permission` VALUES ('206', '1', '3');
INSERT INTO `t_role_permission` VALUES ('207', '1', '9');
INSERT INTO `t_role_permission` VALUES ('208', '1', '14');
INSERT INTO `t_role_permission` VALUES ('209', '1', '15');
INSERT INTO `t_role_permission` VALUES ('210', '1', '16');
INSERT INTO `t_role_permission` VALUES ('211', '1', '17');
INSERT INTO `t_role_permission` VALUES ('212', '1', '18');
INSERT INTO `t_role_permission` VALUES ('213', '1', '10');
INSERT INTO `t_role_permission` VALUES ('214', '1', '11');
INSERT INTO `t_role_permission` VALUES ('215', '1', '4');
INSERT INTO `t_role_permission` VALUES ('216', '1', '22');
INSERT INTO `t_role_permission` VALUES ('217', '1', '23');
INSERT INTO `t_role_permission` VALUES ('218', '1', '6');
INSERT INTO `t_role_permission` VALUES ('219', '1', '12');
INSERT INTO `t_role_permission` VALUES ('220', '1', '13');
INSERT INTO `t_role_permission` VALUES ('221', '1', '7');
INSERT INTO `t_role_permission` VALUES ('222', '1', '8');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `salt` varchar(100) DEFAULT NULL,
  `realname` varchar(100) DEFAULT NULL,
  `sex` int(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(225) DEFAULT NULL,
  `entrytime` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('6', 'admin', '1cf9357295632811aee67a3bbcd817b6', 'Aj9RuuvakKlv5GV7b+YxhQ==', '超级管理员', '1', '18100001234', 'hovinghuang@qq.com', '成都市武侯区', '2018-08-25');
INSERT INTO `t_user` VALUES ('8', 'editor', '022a7ca0bae7faee7beee91d11f96dad', '1Fs2/rLZhdQLm3SaXUpc9w==', '文档管理员', '0', '18100001234', 'editor@qq.com', '成都市武侯区', '2018-08-26');
INSERT INTO `t_user` VALUES ('9', 'photo', 'e8a27d0577dbdd4cdd6cfcfbccba6edf', 'uws/4qqROK4uYYO9NjM5Ow==', '相册管理员', '0', '18100001234', 'editor@qq.com', '成都市武侯区', '2018-08-26');
INSERT INTO `t_user` VALUES ('24', '00', '2f64a4fdff205d405ea5fca835795285', '2i7hrLoOgmn6gn6tRNOBgQ==', '00', '1', '00', '00', '00', '2018-08-26');
INSERT INTO `t_user` VALUES ('25', '11', '98235ebe9e4bfd94494db7a4a00e02d3', 'KNtkUtHYR8ZhxVkSCj6b8Q==', '11', '1', '11', '11', '11', '2018-08-26');
INSERT INTO `t_user` VALUES ('26', '22', 'd5aea66e69a53acc8fec2903d065c412', 'FVNFBgLoDuPwsHfBnoxong==', '22', '1', '22', '22', '22', '2018-08-27');
INSERT INTO `t_user` VALUES ('27', '33', 'c589ff090e88c8b1a725d278a4e9bfde', 'x9E/j0feXkIJMbtYll6W6w==', '33', '1', '33', '33', '33', '2018-08-27');
INSERT INTO `t_user` VALUES ('31', '44', '307d4f60d70b79beb680cb8c097dc910', 'KIbOMiORY51g1qO0O5wFIQ==', '44', '1', '44', '44', '44', '2018-08-27');
INSERT INTO `t_user` VALUES ('32', '55', '8b39677d170b6771713c5a5b06e209ab', '4sXT4SLjWDJG4X0vDk+mog==', '55', '1', '55', '55', '55', '2018-08-27');
INSERT INTO `t_user` VALUES ('33', '66', '2fefce97ec9c35d244e909175f903c0c', 'PbWkzsegX8LRWTHGDmOKHg==', '666', '1', '66', '66', '66', '2018-08-27');
INSERT INTO `t_user` VALUES ('34', '77', 'cde9a697714199581a51d7307e42177c', 'bxzPFPr4fgTJJeDhRYrQ9A==', '7777', '1', '77', '77', '7777777', '2018-08-27');

-- ----------------------------
-- Table structure for `t_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL,
  `rid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('6', '9', '3');
INSERT INTO `t_user_role` VALUES ('8', '8', '2');
INSERT INTO `t_user_role` VALUES ('10', '6', '1');
INSERT INTO `t_user_role` VALUES ('12', '24', '14');
INSERT INTO `t_user_role` VALUES ('13', '25', '16');
