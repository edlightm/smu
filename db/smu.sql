/*
Navicat MySQL Data Transfer

Source Server         : Dr Sems
Source Server Version : 50041
Source Host           : localhost:3306
Source Database       : smu

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2016-07-01 03:38:30
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `tblapplicant`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant`;
CREATE TABLE `tblapplicant` (
  `applicant_id` int(50) NOT NULL auto_increment,
  `applicant_number` varchar(50) default NULL,
  `firstnames` varchar(200) NOT NULL,
  `surname` varchar(200) NOT NULL,
  `applicant_type_id` int(1) NOT NULL default '1',
  `previous_regnumber` varchar(200) default NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_acceptance`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_acceptance`;
CREATE TABLE `tblapplicant_acceptance` (
  `applicant_id` int(50) NOT NULL,
  `programme_id` int(50) NOT NULL,
  `attendance_type_id` int(1) NOT NULL,
  `employee_id` int(50) NOT NULL,
  `system_date` date default NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_acceptance
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_application_status`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_application_status`;
CREATE TABLE `tblapplicant_application_status` (
  `applicant_id` int(50) NOT NULL,
  `applicant_status_id` int(1) NOT NULL default '0',
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_application_status
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_certificates`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_certificates`;
CREATE TABLE `tblapplicant_certificates` (
  `applicant_id` int(50) NOT NULL,
  `certificate_name` varchar(200) NOT NULL,
  `certificate_url` text NOT NULL,
  `certficate_type_id` int(50) NOT NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_certificates
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_contacts`;
CREATE TABLE `tblapplicant_contacts` (
  `applicant_id` int(50) NOT NULL,
  `permanent_address` text,
  `permanent_address_town_id` int(50) default NULL,
  `contact_address` text,
  `contact_town_id` int(50) default NULL,
  `mobile_number` varchar(100) default NULL,
  `phone_number` varchar(100) default NULL,
  `email_address` varchar(100) default NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_contacts
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_employment`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_employment`;
CREATE TABLE `tblapplicant_employment` (
  `applicant_employment_id` int(50) NOT NULL auto_increment,
  `applicant_id` int(50) NOT NULL,
  `employment_history` text,
  `employment_year_range` varchar(50) NOT NULL,
  PRIMARY KEY  (`applicant_employment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_employment
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_enrollment`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_enrollment`;
CREATE TABLE `tblapplicant_enrollment` (
  `applicant_enrollement_id` int(50) NOT NULL auto_increment,
  `applicant_id` int(50) NOT NULL,
  `reg_number` varchar(100) NOT NULL,
  `system_date` date default NULL,
  PRIMARY KEY  (`applicant_enrollement_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_enrollment
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_next_of_kin`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_next_of_kin`;
CREATE TABLE `tblapplicant_next_of_kin` (
  `applicant_nok_id` int(50) NOT NULL auto_increment,
  `applicant_id` int(50) NOT NULL,
  `nok_name` varchar(200) NOT NULL,
  `nok_address` text,
  `nok_email` varchar(200) default NULL,
  `nok_mobile` varchar(200) default NULL,
  `nok_phone` varchar(200) default NULL,
  `nok_employer` varchar(200) default NULL,
  `nok_relationship_id` int(50) NOT NULL,
  `nok_emp_number` varchar(100) default NULL,
  PRIMARY KEY  (`applicant_nok_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_next_of_kin
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_password`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_password`;
CREATE TABLE `tblapplicant_password` (
  `applicant_id` int(50) NOT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_password
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_payment`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_payment`;
CREATE TABLE `tblapplicant_payment` (
  `applicant_id` int(50) NOT NULL,
  `receipt_number` varchar(100) default NULL,
  `approved` int(1) NOT NULL default '0',
  `banked` int(1) NOT NULL default '0',
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_payment
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_period`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_period`;
CREATE TABLE `tblapplicant_period` (
  `applicant_id` int(50) NOT NULL,
  `period_id` int(50) NOT NULL,
  `entry-type_id` int(1) NOT NULL,
  `category_id` int(1) NOT NULL,
  `date_created` date default NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_period
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_personal`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_personal`;
CREATE TABLE `tblapplicant_personal` (
  `applicant_id` int(50) NOT NULL,
  `sex_id` int(1) NOT NULL,
  `title_id` int(5) NOT NULL,
  `religion_id` int(20) NOT NULL,
  `date_of_birth` date NOT NULL,
  `marital_status_id` int(1) NOT NULL,
  `national_id` varchar(50) default NULL,
  `nationality_id` int(50) NOT NULL,
  `nationality_other` varchar(200) default NULL,
  `place_of_birth_id` int(50) default NULL,
  `place_of_birth_other` varchar(100) default NULL,
  `citizenship` varchar(100) default NULL,
  `passport_number` varchar(100) default NULL,
  `permanent_resident` int(1) NOT NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_personal
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_points`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_points`;
CREATE TABLE `tblapplicant_points` (
  `applicant_id` int(50) NOT NULL,
  `points_id` int(10) default NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_points
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_programmes`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_programmes`;
CREATE TABLE `tblapplicant_programmes` (
  `applicant_id` int(50) NOT NULL,
  `programme_id` int(50) NOT NULL,
  `choice_position` int(1) NOT NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_programmes
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_qualifications`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_qualifications`;
CREATE TABLE `tblapplicant_qualifications` (
  `applicant_qualification_id` int(50) NOT NULL auto_increment,
  `applicant_id` int(50) NOT NULL,
  `exam_level_id` int(50) NOT NULL,
  `exam_board_id` int(50) NOT NULL,
  `subject_id` int(50) NOT NULL,
  `subject_result` varchar(5) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `school_id` int(55) NOT NULL,
  PRIMARY KEY  (`applicant_qualification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_qualifications
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_qualification_school`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_qualification_school`;
CREATE TABLE `tblapplicant_qualification_school` (
  `school_id` int(50) NOT NULL auto_increment,
  `applicant_id` int(50) NOT NULL,
  `school_name` varchar(250) NOT NULL,
  `year` decimal(50,0) NOT NULL,
  `school_town_id` int(50) default NULL,
  `level` varchar(50) default NULL,
  PRIMARY KEY  (`school_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_qualification_school
-- ----------------------------

-- ----------------------------
-- Table structure for `tblapplicant_sponsor`
-- ----------------------------
DROP TABLE IF EXISTS `tblapplicant_sponsor`;
CREATE TABLE `tblapplicant_sponsor` (
  `applicant_id` int(50) NOT NULL,
  `source_of_funds` varchar(100) NOT NULL,
  PRIMARY KEY  (`applicant_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblapplicant_sponsor
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsystem_attendance_type`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_attendance_type`;
CREATE TABLE `tblsystem_attendance_type` (
  `attendance_type_id` int(50) NOT NULL auto_increment,
  `attendance_type_name` varchar(150) NOT NULL,
  PRIMARY KEY  (`attendance_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_attendance_type
-- ----------------------------
INSERT INTO `tblsystem_attendance_type` VALUES ('1', 'NORMAL');
INSERT INTO `tblsystem_attendance_type` VALUES ('2', 'MATURITY');
INSERT INTO `tblsystem_attendance_type` VALUES ('3', 'BLOCK');
INSERT INTO `tblsystem_attendance_type` VALUES ('4', 'PART-TIME');

-- ----------------------------
-- Table structure for `tblsystem_category_type`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_category_type`;
CREATE TABLE `tblsystem_category_type` (
  `category_type_id` int(50) NOT NULL auto_increment,
  `category_type_name` varchar(150) NOT NULL,
  PRIMARY KEY  (`category_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tblsystem_category_type
-- ----------------------------
INSERT INTO `tblsystem_category_type` VALUES ('1', 'UNDER GRADUATE');
INSERT INTO `tblsystem_category_type` VALUES ('2', 'POST GRADUATE');
INSERT INTO `tblsystem_category_type` VALUES ('3', '');

-- ----------------------------
-- Table structure for `tblsystem_certificate_type`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_certificate_type`;
CREATE TABLE `tblsystem_certificate_type` (
  `certficate_type_id` int(50) NOT NULL auto_increment,
  `certificate_type_name` varchar(150) NOT NULL,
  PRIMARY KEY  (`certficate_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_certificate_type
-- ----------------------------
INSERT INTO `tblsystem_certificate_type` VALUES ('1', 'GRADE 7');
INSERT INTO `tblsystem_certificate_type` VALUES ('2', 'ZJC');
INSERT INTO `tblsystem_certificate_type` VALUES ('3', 'O-LEVEL');
INSERT INTO `tblsystem_certificate_type` VALUES ('4', 'A-LEVEL');
INSERT INTO `tblsystem_certificate_type` VALUES ('5', 'CERTICICATE');
INSERT INTO `tblsystem_certificate_type` VALUES ('6', 'DIPLOMA');
INSERT INTO `tblsystem_certificate_type` VALUES ('7', 'UNDER GRADUATE DEGREE');
INSERT INTO `tblsystem_certificate_type` VALUES ('8', 'POST GRADUATE DEGREE');

-- ----------------------------
-- Table structure for `tblsystem_citizernship`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_citizernship`;
CREATE TABLE `tblsystem_citizernship` (
  `citizernship_id` int(50) NOT NULL auto_increment,
  `citizernship_name` varchar(150) NOT NULL,
  PRIMARY KEY  (`citizernship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_citizernship
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsystem_country`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_country`;
CREATE TABLE `tblsystem_country` (
  `country_id` int(11) NOT NULL auto_increment,
  `country_name` varchar(50) default NULL,
  PRIMARY KEY  (`country_id`)
) ENGINE=MyISAM AUTO_INCREMENT=245 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_country
-- ----------------------------
INSERT INTO `tblsystem_country` VALUES ('1', 'Afghanistan');
INSERT INTO `tblsystem_country` VALUES ('2', 'Aland Islands');
INSERT INTO `tblsystem_country` VALUES ('3', 'Albania');
INSERT INTO `tblsystem_country` VALUES ('4', 'Algeria');
INSERT INTO `tblsystem_country` VALUES ('5', 'American Samoa');
INSERT INTO `tblsystem_country` VALUES ('6', 'Andorra');
INSERT INTO `tblsystem_country` VALUES ('7', 'Angola');
INSERT INTO `tblsystem_country` VALUES ('8', 'Anguilla');
INSERT INTO `tblsystem_country` VALUES ('9', 'Antarctica');
INSERT INTO `tblsystem_country` VALUES ('10', 'Antigua And Barbuda');
INSERT INTO `tblsystem_country` VALUES ('11', 'Argentina');
INSERT INTO `tblsystem_country` VALUES ('12', 'Armenia');
INSERT INTO `tblsystem_country` VALUES ('13', 'Aruba');
INSERT INTO `tblsystem_country` VALUES ('14', 'Australia');
INSERT INTO `tblsystem_country` VALUES ('15', 'Austria');
INSERT INTO `tblsystem_country` VALUES ('16', 'Azerbaijan');
INSERT INTO `tblsystem_country` VALUES ('17', 'Bahamas');
INSERT INTO `tblsystem_country` VALUES ('18', 'Bahrain');
INSERT INTO `tblsystem_country` VALUES ('19', 'Bangladesh');
INSERT INTO `tblsystem_country` VALUES ('20', 'Barbados');
INSERT INTO `tblsystem_country` VALUES ('21', 'Belarus');
INSERT INTO `tblsystem_country` VALUES ('22', 'Belgium');
INSERT INTO `tblsystem_country` VALUES ('23', 'Belize');
INSERT INTO `tblsystem_country` VALUES ('24', 'Benin');
INSERT INTO `tblsystem_country` VALUES ('25', 'Bermuda');
INSERT INTO `tblsystem_country` VALUES ('26', 'Bhutan');
INSERT INTO `tblsystem_country` VALUES ('27', 'Bolivia');
INSERT INTO `tblsystem_country` VALUES ('28', 'Bosnia And Herzegovina');
INSERT INTO `tblsystem_country` VALUES ('29', 'Botswana');
INSERT INTO `tblsystem_country` VALUES ('30', 'Bouvet Island');
INSERT INTO `tblsystem_country` VALUES ('31', 'Brazil');
INSERT INTO `tblsystem_country` VALUES ('32', 'British Indian Ocean Territory');
INSERT INTO `tblsystem_country` VALUES ('33', 'Brunei Darussalam');
INSERT INTO `tblsystem_country` VALUES ('34', 'Bulgaria');
INSERT INTO `tblsystem_country` VALUES ('35', 'Burkina Faso');
INSERT INTO `tblsystem_country` VALUES ('36', 'Burundi');
INSERT INTO `tblsystem_country` VALUES ('37', 'Cambodia');
INSERT INTO `tblsystem_country` VALUES ('38', 'Cameroon');
INSERT INTO `tblsystem_country` VALUES ('39', 'Canada');
INSERT INTO `tblsystem_country` VALUES ('40', 'Cape Verde');
INSERT INTO `tblsystem_country` VALUES ('41', 'Cayman Islands');
INSERT INTO `tblsystem_country` VALUES ('42', 'Central African Republic');
INSERT INTO `tblsystem_country` VALUES ('43', 'Chad');
INSERT INTO `tblsystem_country` VALUES ('44', 'Chile');
INSERT INTO `tblsystem_country` VALUES ('45', 'China');
INSERT INTO `tblsystem_country` VALUES ('46', 'Christmas Island');
INSERT INTO `tblsystem_country` VALUES ('47', 'Cocos (Keeling) Islands');
INSERT INTO `tblsystem_country` VALUES ('48', 'Colombia');
INSERT INTO `tblsystem_country` VALUES ('49', 'Comoros');
INSERT INTO `tblsystem_country` VALUES ('50', 'Congo');
INSERT INTO `tblsystem_country` VALUES ('51', 'Congo, The Democratic Republic Of The');
INSERT INTO `tblsystem_country` VALUES ('52', 'Cook Islands');
INSERT INTO `tblsystem_country` VALUES ('53', 'Costa Rica');
INSERT INTO `tblsystem_country` VALUES ('54', 'Cote D\'Ivoire');
INSERT INTO `tblsystem_country` VALUES ('55', 'Croatia');
INSERT INTO `tblsystem_country` VALUES ('56', 'Cuba');
INSERT INTO `tblsystem_country` VALUES ('57', 'Cyprus');
INSERT INTO `tblsystem_country` VALUES ('58', 'Czech Republic');
INSERT INTO `tblsystem_country` VALUES ('59', 'Denmark');
INSERT INTO `tblsystem_country` VALUES ('60', 'Djibouti');
INSERT INTO `tblsystem_country` VALUES ('61', 'Dominica');
INSERT INTO `tblsystem_country` VALUES ('62', 'Dominican Republic');
INSERT INTO `tblsystem_country` VALUES ('63', 'Ecuador');
INSERT INTO `tblsystem_country` VALUES ('64', 'Egypt');
INSERT INTO `tblsystem_country` VALUES ('65', 'El Salvador');
INSERT INTO `tblsystem_country` VALUES ('66', 'Equatorial Guinea');
INSERT INTO `tblsystem_country` VALUES ('67', 'Eritrea');
INSERT INTO `tblsystem_country` VALUES ('68', 'Estonia');
INSERT INTO `tblsystem_country` VALUES ('69', 'Ethiopia');
INSERT INTO `tblsystem_country` VALUES ('70', 'Falkland Islands (Malvinas)');
INSERT INTO `tblsystem_country` VALUES ('71', 'Faroe Islands');
INSERT INTO `tblsystem_country` VALUES ('72', 'Fiji');
INSERT INTO `tblsystem_country` VALUES ('73', 'Finland');
INSERT INTO `tblsystem_country` VALUES ('74', 'France');
INSERT INTO `tblsystem_country` VALUES ('75', 'French Guiana');
INSERT INTO `tblsystem_country` VALUES ('76', 'French Polynesia');
INSERT INTO `tblsystem_country` VALUES ('77', 'French Southern Territories');
INSERT INTO `tblsystem_country` VALUES ('78', 'Gabon');
INSERT INTO `tblsystem_country` VALUES ('79', 'Gambia');
INSERT INTO `tblsystem_country` VALUES ('80', 'Georgia');
INSERT INTO `tblsystem_country` VALUES ('81', 'Germany');
INSERT INTO `tblsystem_country` VALUES ('82', 'Ghana');
INSERT INTO `tblsystem_country` VALUES ('83', 'Gibraltar');
INSERT INTO `tblsystem_country` VALUES ('84', 'Greece');
INSERT INTO `tblsystem_country` VALUES ('85', 'Greenland');
INSERT INTO `tblsystem_country` VALUES ('86', 'Grenada');
INSERT INTO `tblsystem_country` VALUES ('87', 'Guadeloupe');
INSERT INTO `tblsystem_country` VALUES ('88', 'Guam');
INSERT INTO `tblsystem_country` VALUES ('89', 'Guatemala');
INSERT INTO `tblsystem_country` VALUES ('90', 'Guernsey');
INSERT INTO `tblsystem_country` VALUES ('91', 'Guinea');
INSERT INTO `tblsystem_country` VALUES ('92', 'Guinea-Bissau');
INSERT INTO `tblsystem_country` VALUES ('93', 'Guyana');
INSERT INTO `tblsystem_country` VALUES ('94', 'Haiti');
INSERT INTO `tblsystem_country` VALUES ('95', 'Heard Island And Mcdonald Islands');
INSERT INTO `tblsystem_country` VALUES ('96', 'Holy See (Vatican City State)');
INSERT INTO `tblsystem_country` VALUES ('97', 'Honduras');
INSERT INTO `tblsystem_country` VALUES ('98', 'Hong Kong');
INSERT INTO `tblsystem_country` VALUES ('99', 'Hungary');
INSERT INTO `tblsystem_country` VALUES ('100', 'Iceland');
INSERT INTO `tblsystem_country` VALUES ('101', 'India');
INSERT INTO `tblsystem_country` VALUES ('102', 'Indonesia');
INSERT INTO `tblsystem_country` VALUES ('103', 'Iran, Islamic Republic Of');
INSERT INTO `tblsystem_country` VALUES ('104', 'Iraq');
INSERT INTO `tblsystem_country` VALUES ('105', 'Ireland');
INSERT INTO `tblsystem_country` VALUES ('106', 'Isle Of Man');
INSERT INTO `tblsystem_country` VALUES ('107', 'Israel');
INSERT INTO `tblsystem_country` VALUES ('108', 'Italy');
INSERT INTO `tblsystem_country` VALUES ('109', 'Jamaica');
INSERT INTO `tblsystem_country` VALUES ('110', 'Japan');
INSERT INTO `tblsystem_country` VALUES ('111', 'Jersey');
INSERT INTO `tblsystem_country` VALUES ('112', 'Jordan');
INSERT INTO `tblsystem_country` VALUES ('113', 'Kazakhstan');
INSERT INTO `tblsystem_country` VALUES ('114', 'Kenya');
INSERT INTO `tblsystem_country` VALUES ('115', 'Kiribati');
INSERT INTO `tblsystem_country` VALUES ('116', 'Korea, Democratic People\'S Republic Of');
INSERT INTO `tblsystem_country` VALUES ('117', 'Korea, Republic Of');
INSERT INTO `tblsystem_country` VALUES ('118', 'Kuwait');
INSERT INTO `tblsystem_country` VALUES ('119', 'Kyrgyzstan');
INSERT INTO `tblsystem_country` VALUES ('120', 'Lao People\'S Democratic Republic');
INSERT INTO `tblsystem_country` VALUES ('121', 'Latvia');
INSERT INTO `tblsystem_country` VALUES ('122', 'Lebanon');
INSERT INTO `tblsystem_country` VALUES ('123', 'Lesotho');
INSERT INTO `tblsystem_country` VALUES ('124', 'Liberia');
INSERT INTO `tblsystem_country` VALUES ('125', 'Libyan Arab Jamahiriya');
INSERT INTO `tblsystem_country` VALUES ('126', 'Liechtenstein');
INSERT INTO `tblsystem_country` VALUES ('127', 'Lithuania');
INSERT INTO `tblsystem_country` VALUES ('128', 'Luxembourg');
INSERT INTO `tblsystem_country` VALUES ('129', 'Macao');
INSERT INTO `tblsystem_country` VALUES ('130', 'Macedonia, The Former Yugoslav Republic Of');
INSERT INTO `tblsystem_country` VALUES ('131', 'Madagascar');
INSERT INTO `tblsystem_country` VALUES ('132', 'Malawi');
INSERT INTO `tblsystem_country` VALUES ('133', 'Malaysia');
INSERT INTO `tblsystem_country` VALUES ('134', 'Maldives');
INSERT INTO `tblsystem_country` VALUES ('135', 'Mali');
INSERT INTO `tblsystem_country` VALUES ('136', 'Malta');
INSERT INTO `tblsystem_country` VALUES ('137', 'Marshall Islands');
INSERT INTO `tblsystem_country` VALUES ('138', 'Martinique');
INSERT INTO `tblsystem_country` VALUES ('139', 'Mauritania');
INSERT INTO `tblsystem_country` VALUES ('140', 'Mauritius');
INSERT INTO `tblsystem_country` VALUES ('141', 'Mayotte');
INSERT INTO `tblsystem_country` VALUES ('142', 'Mexico');
INSERT INTO `tblsystem_country` VALUES ('143', 'Micronesia, Federated States Of');
INSERT INTO `tblsystem_country` VALUES ('144', 'Moldova, Republic Of');
INSERT INTO `tblsystem_country` VALUES ('145', 'Monaco');
INSERT INTO `tblsystem_country` VALUES ('146', 'Mongolia');
INSERT INTO `tblsystem_country` VALUES ('147', 'Montserrat');
INSERT INTO `tblsystem_country` VALUES ('148', 'Morocco');
INSERT INTO `tblsystem_country` VALUES ('149', 'Mozambique');
INSERT INTO `tblsystem_country` VALUES ('150', 'Myanmar');
INSERT INTO `tblsystem_country` VALUES ('151', 'Namibia');
INSERT INTO `tblsystem_country` VALUES ('152', 'Nauru');
INSERT INTO `tblsystem_country` VALUES ('153', 'Nepal');
INSERT INTO `tblsystem_country` VALUES ('154', 'Netherlands');
INSERT INTO `tblsystem_country` VALUES ('155', 'Netherlands Antilles');
INSERT INTO `tblsystem_country` VALUES ('156', 'New Caledonia');
INSERT INTO `tblsystem_country` VALUES ('157', 'New Zealand');
INSERT INTO `tblsystem_country` VALUES ('158', 'Nicaragua');
INSERT INTO `tblsystem_country` VALUES ('159', 'Niger');
INSERT INTO `tblsystem_country` VALUES ('160', 'Nigeria');
INSERT INTO `tblsystem_country` VALUES ('161', 'Niue');
INSERT INTO `tblsystem_country` VALUES ('162', 'Norfolk Island');
INSERT INTO `tblsystem_country` VALUES ('163', 'Northern Mariana Islands');
INSERT INTO `tblsystem_country` VALUES ('164', 'Norway');
INSERT INTO `tblsystem_country` VALUES ('165', 'Oman');
INSERT INTO `tblsystem_country` VALUES ('166', 'Pakistan');
INSERT INTO `tblsystem_country` VALUES ('167', 'Palau');
INSERT INTO `tblsystem_country` VALUES ('168', 'Palestinian Territory, Occupied');
INSERT INTO `tblsystem_country` VALUES ('169', 'Panama');
INSERT INTO `tblsystem_country` VALUES ('170', 'Papua New Guinea');
INSERT INTO `tblsystem_country` VALUES ('171', 'Paraguay');
INSERT INTO `tblsystem_country` VALUES ('172', 'Peru');
INSERT INTO `tblsystem_country` VALUES ('173', 'Philippines');
INSERT INTO `tblsystem_country` VALUES ('174', 'Pitcairn');
INSERT INTO `tblsystem_country` VALUES ('175', 'Poland');
INSERT INTO `tblsystem_country` VALUES ('176', 'Portugal');
INSERT INTO `tblsystem_country` VALUES ('177', 'Puerto Rico');
INSERT INTO `tblsystem_country` VALUES ('178', 'Qatar');
INSERT INTO `tblsystem_country` VALUES ('179', 'Reunion');
INSERT INTO `tblsystem_country` VALUES ('180', 'Romania');
INSERT INTO `tblsystem_country` VALUES ('181', 'Russian Federation');
INSERT INTO `tblsystem_country` VALUES ('182', 'Rwanda');
INSERT INTO `tblsystem_country` VALUES ('183', 'Saint Helena');
INSERT INTO `tblsystem_country` VALUES ('184', 'Saint Kitts And Nevis');
INSERT INTO `tblsystem_country` VALUES ('185', 'Saint Lucia');
INSERT INTO `tblsystem_country` VALUES ('186', 'Saint Pierre And Miquelon');
INSERT INTO `tblsystem_country` VALUES ('187', 'Saint Vincent And The Grenadines');
INSERT INTO `tblsystem_country` VALUES ('188', 'Samoa');
INSERT INTO `tblsystem_country` VALUES ('189', 'San Marino');
INSERT INTO `tblsystem_country` VALUES ('190', 'Sao Tome And Principe');
INSERT INTO `tblsystem_country` VALUES ('191', 'Saudi Arabia');
INSERT INTO `tblsystem_country` VALUES ('192', 'Senegal');
INSERT INTO `tblsystem_country` VALUES ('193', 'Serbia And Montenegro');
INSERT INTO `tblsystem_country` VALUES ('194', 'Seychelles');
INSERT INTO `tblsystem_country` VALUES ('195', 'Sierra Leone');
INSERT INTO `tblsystem_country` VALUES ('196', 'Singapore');
INSERT INTO `tblsystem_country` VALUES ('197', 'Slovakia');
INSERT INTO `tblsystem_country` VALUES ('198', 'Slovenia');
INSERT INTO `tblsystem_country` VALUES ('199', 'Solomon Islands');
INSERT INTO `tblsystem_country` VALUES ('200', 'Somalia');
INSERT INTO `tblsystem_country` VALUES ('201', 'South Africa');
INSERT INTO `tblsystem_country` VALUES ('202', 'South Georgia And The South Sandwich Islands');
INSERT INTO `tblsystem_country` VALUES ('203', 'Spain');
INSERT INTO `tblsystem_country` VALUES ('204', 'Sri Lanka');
INSERT INTO `tblsystem_country` VALUES ('205', 'Sudan');
INSERT INTO `tblsystem_country` VALUES ('206', 'Suriname');
INSERT INTO `tblsystem_country` VALUES ('207', 'Svalbard And Jan Mayen');
INSERT INTO `tblsystem_country` VALUES ('208', 'Swaziland');
INSERT INTO `tblsystem_country` VALUES ('209', 'Sweden');
INSERT INTO `tblsystem_country` VALUES ('210', 'Switzerland');
INSERT INTO `tblsystem_country` VALUES ('211', 'Syrian Arab Republic');
INSERT INTO `tblsystem_country` VALUES ('212', 'Taiwan, Province Of China');
INSERT INTO `tblsystem_country` VALUES ('213', 'Tajikistan');
INSERT INTO `tblsystem_country` VALUES ('214', 'Tanzania, United Republic Of');
INSERT INTO `tblsystem_country` VALUES ('215', 'Thailand');
INSERT INTO `tblsystem_country` VALUES ('216', 'Timor-Leste');
INSERT INTO `tblsystem_country` VALUES ('217', 'Togo');
INSERT INTO `tblsystem_country` VALUES ('218', 'Tokelau');
INSERT INTO `tblsystem_country` VALUES ('219', 'Tonga');
INSERT INTO `tblsystem_country` VALUES ('220', 'Trinidad And Tobago');
INSERT INTO `tblsystem_country` VALUES ('221', 'Tunisia');
INSERT INTO `tblsystem_country` VALUES ('222', 'Turkey');
INSERT INTO `tblsystem_country` VALUES ('223', 'Turkmenistan');
INSERT INTO `tblsystem_country` VALUES ('224', 'Turks And Caicos Islands');
INSERT INTO `tblsystem_country` VALUES ('225', 'Tuvalu');
INSERT INTO `tblsystem_country` VALUES ('226', 'Uganda');
INSERT INTO `tblsystem_country` VALUES ('227', 'Ukraine');
INSERT INTO `tblsystem_country` VALUES ('228', 'United Arab Emirates');
INSERT INTO `tblsystem_country` VALUES ('229', 'United Kingdom');
INSERT INTO `tblsystem_country` VALUES ('230', 'United States');
INSERT INTO `tblsystem_country` VALUES ('231', 'United States Minor Outlying Islands');
INSERT INTO `tblsystem_country` VALUES ('232', 'Uruguay');
INSERT INTO `tblsystem_country` VALUES ('233', 'Uzbekistan');
INSERT INTO `tblsystem_country` VALUES ('234', 'Vanuatu');
INSERT INTO `tblsystem_country` VALUES ('235', 'Venezuela');
INSERT INTO `tblsystem_country` VALUES ('236', 'Viet Nam');
INSERT INTO `tblsystem_country` VALUES ('237', 'Virgin Islands, British');
INSERT INTO `tblsystem_country` VALUES ('238', 'Virgin Islands, U.S.');
INSERT INTO `tblsystem_country` VALUES ('239', 'Wallis And Futuna');
INSERT INTO `tblsystem_country` VALUES ('240', 'Western Sahara');
INSERT INTO `tblsystem_country` VALUES ('241', 'Yemen');
INSERT INTO `tblsystem_country` VALUES ('242', 'Zambia');
INSERT INTO `tblsystem_country` VALUES ('243', 'Zimbabwe');
INSERT INTO `tblsystem_country` VALUES ('244', 'South Sudan');

-- ----------------------------
-- Table structure for `tblsystem_exam_board`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_exam_board`;
CREATE TABLE `tblsystem_exam_board` (
  `exam_board_id` int(50) NOT NULL auto_increment,
  `exam_board_name` varchar(200) NOT NULL,
  PRIMARY KEY  (`exam_board_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_exam_board
-- ----------------------------
INSERT INTO `tblsystem_exam_board` VALUES ('1', 'ZIMSEC');
INSERT INTO `tblsystem_exam_board` VALUES ('2', 'CAMBRIDGE');

-- ----------------------------
-- Table structure for `tblsystem_faculty`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_faculty`;
CREATE TABLE `tblsystem_faculty` (
  `faculty_id` int(11) NOT NULL auto_increment,
  `faculty_code` varchar(10) default NULL,
  `faculty_name` varchar(200) default NULL,
  PRIMARY KEY  (`faculty_id`),
  UNIQUE KEY `faculty_id` (`faculty_id`)
) ENGINE=MyISAM AUTO_INCREMENT=779 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_faculty
-- ----------------------------
INSERT INTO `tblsystem_faculty` VALUES ('1', 'ILLL', 'INSTITUTE OF LIFELONG LEARNING');
INSERT INTO `tblsystem_faculty` VALUES ('2', 'SEBS', 'SCHOOL OF ENTREPRENEURSHIP AND BUSINESS SCIENCES');
INSERT INTO `tblsystem_faculty` VALUES ('3', 'SEST', 'SCHOOL OF ENGINEERING SCIENCES AND TECHNOLOGY');
INSERT INTO `tblsystem_faculty` VALUES ('4', 'SAST', 'SCHOOL OF AGRICULTURAL SCIENCES AND TECHNOLOGY');
INSERT INTO `tblsystem_faculty` VALUES ('5', 'ALLE', 'ADULT AND LIFELONG EDUCATION');
INSERT INTO `tblsystem_faculty` VALUES ('6', 'SHAT', 'SCHOOL OF HOSPITALITY AND TOURISM');
INSERT INTO `tblsystem_faculty` VALUES ('7', 'SAAD', 'SCHOOL OF ART AND DESIGN');
INSERT INTO `tblsystem_faculty` VALUES ('8', 'SNSM', 'SCHOOL OF NATURAL SCIENCES AND MATHEMATICS');
INSERT INTO `tblsystem_faculty` VALUES ('9', 'SWEC', 'SCHOOL OF WILDLIFE, ECOLOGY AND CONSERVATION');
INSERT INTO `tblsystem_faculty` VALUES ('10', 'NT', 'NON TEACHING ');
INSERT INTO `tblsystem_faculty` VALUES ('778', 'ATL', 'ACADEMY OF TEACHING AND LEARNING');

-- ----------------------------
-- Table structure for `tblsystem_marital_status`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_marital_status`;
CREATE TABLE `tblsystem_marital_status` (
  `marital_status_id` int(50) NOT NULL auto_increment,
  `marital_status_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`marital_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of tblsystem_marital_status
-- ----------------------------
INSERT INTO `tblsystem_marital_status` VALUES ('1', 'SINGLE');
INSERT INTO `tblsystem_marital_status` VALUES ('2', 'MARRIED');
INSERT INTO `tblsystem_marital_status` VALUES ('3', 'WIDOWED');

-- ----------------------------
-- Table structure for `tblsystem_nationality`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_nationality`;
CREATE TABLE `tblsystem_nationality` (
  `nationality_id` int(50) NOT NULL auto_increment,
  `nationality_name` varchar(150) NOT NULL,
  PRIMARY KEY  (`nationality_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_nationality
-- ----------------------------

-- ----------------------------
-- Table structure for `tblsystem_programme`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_programme`;
CREATE TABLE `tblsystem_programme` (
  `programme_id` bigint(20) NOT NULL auto_increment,
  `programme_name` varchar(200) NOT NULL,
  `programme_code` varchar(20) NOT NULL,
  `programme_type_id` int(11) default '1',
  `faculty_id` bigint(20) NOT NULL,
  PRIMARY KEY  (`programme_id`),
  UNIQUE KEY `code` (`programme_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_programme
-- ----------------------------
INSERT INTO `tblsystem_programme` VALUES ('1', 'ADVANCED DIPLOMA IN CREATIVE ART AND DESIGN', 'CCADD', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('2', 'ADVANCED DIPLOMA IN CLOTHING AND TEXTILE TECHNOLOGY', 'CCTTD', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('3', 'ADVANCED DIPLOMA IN HOSPITALITY AND TOURISM', 'CHTD', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('4', 'ADVANCED DIPLOMA IN COSMETOLOGY', 'CCOSD', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('5', 'ADVANCED DIPLOMA IN MECHANICAL  ENGINEERING', 'CMSED', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('6', 'ADVANCED DIPLOMA IN AUTOMOTIVE ENGINEERING', 'CAED', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('7', 'ADVANCED DIPLOMA IN WOOD CONSTRUCTION TECHNOLOGY', 'CWCTD', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('8', 'ADVANCED DIPLOMA IN BUSINESS STUDIES', 'CBSD', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('9', 'ADVANCED DIPLOMA IN OFFICE TECHNOLOGY & ADMINISTRATION', 'CSSD', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('10', 'ADVANCED DIPLOMA IN COMPUTING AND INFORMATION TECHNOLOGY', 'CCSD', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('11', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE  IN PRODUCTION ENGINEERING', 'BTPE', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('12', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN HOSPITALITY AND TOURISM', 'BTHT', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('13', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN INTERNATIONAL MARKETING', 'BTIM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('14', 'BACHELOR OF SCIENCE HONOURS DEGREE IN ENVIRONMENTAL SCIENCE AND TECHNOLOGY', 'BEST', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('15', 'BACHELOR OF TECHNOLOGY  HONOURS DEGREE  IN FOOD SCIENCE & TECHNOLOGY', 'BTFS', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('16', 'BACHELOR OF TECHNOLOGY  HONOURS DEGREE IN AGRICULTURAL ENGINEERING', 'BTAE', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('17', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN POST HARVEST TECHNOLOGY', 'BTPH', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('45', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN CREATIVE ART AND DESIGN', 'BTCAD', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('50', 'BACHELOR OF  TECHNOLOGY HONOURS  DEGREE IN FOOD SCIENCE & TECHNOLOGY', 'BTFSP', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('57', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN IRRIGATION  ENGINEERING', 'BTIE', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('58', 'BACHELOR OF COMMERCE (HONS) DEGREE IN ACCOUNTANCY', 'BCAC', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('59', 'BACHELOR OF COMMERCE HONOURS IN RETAIL MANAGEMENT', 'BCRM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('60', 'BACHELOR OF TECHNOLOGY  HONOURS DEGREE  IN ENTREPRENEURSHIP AND BUSINESS MANAGEMENT', 'BTEB', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('61', 'BACHELOR OF FINE ARTS (HONS)', 'BFA', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('62', 'BACHELOR OF TECHNOLOGY IN EDUCATION DEGREE', 'BTED', '1', '5');
INSERT INTO `tblsystem_programme` VALUES ('65', 'ADVANCED DIPLOMA IN TECHNOLOGY EDUCATION', 'CTED', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('66', 'BACHELOR OF COMMERCE (HONS) IN BANKING AND FINANCE', 'BCBF', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('67', 'BACHELOR OF ENGINEERING HONOURS DEGREE IN RENEWABLE ENERGY', 'BERE', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('68', 'BACHELOR OF ENGINEERING HONOURS DEGREE IN MECHATRONICS ENGINEERING', 'BEME', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('69', 'BACHELOR OF COM (HONS) IN ENTREPRENUERSHIP AND BUSINESS MANAGEMENT', 'BCEB', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('70', 'BACHELOR OF COMMERCE HONOURS DEGEREE IN INTERNATIONAL PURCHASING LOGISTICS AND TRANSPORT', 'BCPL', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('72', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN COMPUTING & INFORMATION TECHNOLOGY', 'BTCI', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('75', 'MASTER OF SCIENCE IN STRATEGIC MANAGEMENT DEGREE', 'MSCSM', '2', '2');
INSERT INTO `tblsystem_programme` VALUES ('76', 'BACHELOR OF TECHNOLOGY  HONOURS DEGREE IN BIOTECHNOLOGY', 'BTBT', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('77', 'BACHELOR OF SCIENCE HONOURS DEGREE  IN ENVIROMENTAL HEALTH', 'BTEH', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('78', 'BACHELOR OF TECHNOLOGY EDUCATION DEGREE', 'BTE', '1', '1');
INSERT INTO `tblsystem_programme` VALUES ('79', 'BACHELOR OF SCIENCE HONOURS DEGREE  IN PUBLIC FINANCE AND ACCOUNTING', 'BPFA', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('80', 'BACHELOR OF SCIENCE DEGREE  IN NURSING EDUCATION', 'BSCNE', '1', '1');
INSERT INTO `tblsystem_programme` VALUES ('81', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE  IN RETAIL MANAGEMENT', 'BTRM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('82', 'BACHELOR OF TECHNOLOGY  HONOURS DEGREE IN INTERNATIONAL PURCHASING LOGISTICS AND TRANSPORT', 'BTPLT', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('83', 'BACHELOR OF SCIENCE HONOURS DEGREE IN ACCOUNTANCY', 'BSCAC', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('85', 'BACHELOR OF TECHNOLOGY HONOURS IN FUELS AND ENERGY ENGINEERING', 'BTFE', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('86', 'BACHELOR OF TECHNOLOGY (HONS) IN CLOTHING FASHION DESIGN', 'BTCFD', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('87', 'BACHELOR OF SCIENCE DEGREE IN HIV AND AIDS MANAGEMENT AND COMMUNITY DEVELOPMENT', 'BSCHAM', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('89', 'BACHELOR OF SCIENCE HONS IN OFFICE ADMINISTRATION & TECHNOLOGY', 'BOAT', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('93', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE  IN TRAVEL AND RECREATION ', 'BTTR', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('94', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN WILDLIFE AND SAFARI MANAGEMENT', 'BTWS', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('95', 'POST GRADUATE DIPLOMA IN CORPORATE STRATEGY AND MANAGEMENT', 'PGDCSM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('96', 'MASTER OF PHILOSOPHY', 'MPHILBUS', '2', '2');
INSERT INTO `tblsystem_programme` VALUES ('97', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN IRRIGATION  ENGINEERING', 'BTIE2', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('98', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE IN POST HARVEST TECHNOLOGY', 'BTPH2', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('99', 'BACHELOR OF TECHNOLOGY  HONOURS DEGREE IN AGRICULTURAL ENGINEERING', 'BTAE2', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('100', 'BRIDGING SHORT COURSE', 'HBSC', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('101', 'BRIDGING SHORT COURSE', 'BBSC', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('102', 'BRIDGING SHORT COURSE', 'EBSC', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('103', 'BRIDGING SHORT COURSE', 'ABSC', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('104', 'BRIDGING SHORT COURSE', 'IBSC', '1', '1');
INSERT INTO `tblsystem_programme` VALUES ('105', 'BACHELOR OF ENGINEERING HONOURS DEGREE IN MECHATRONICS ENGINEERING', 'BEME2', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('106', 'BACHELOR OF TECHNOLOGY HONOURS IN FUELS AND ENERGY ENGINEERING', 'BTFE2', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('107', 'BACHELOR OF TECHNOLOGY HONOURS DEGREE  IN PRODUCTION ENGINEERING', 'BTPE2', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('108', 'MASTER OF PHILOSOPHY', 'MPHILENG', '2', '3');
INSERT INTO `tblsystem_programme` VALUES ('109', 'DOCTOR OF  PHILOSOPHY', 'DPhilEng', '3', '3');
INSERT INTO `tblsystem_programme` VALUES ('110', 'BACHELOR OF SCIENCE HONOURS DEGREE IN ANIMAL PRODUCTION AND TECHNOLOGY', 'BSAPT', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('111', 'MASTER OF SCIENCE DEGREE IN POST HARVEST SCIENCE AND TECHNOLOGY', 'MSCPHT', '2', '4');
INSERT INTO `tblsystem_programme` VALUES ('112', 'BACHELOR OF SCIENCE HONOURS DEGREE IN INFORMATION TECHNOLOGY', 'BSIT', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('113', 'BACHELOR OF ENGINEERING HONOURS DEGREE IN MECHATRONICS', 'BEMC', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('114', 'BACHELOR OF ENGINEERING HONOURS DEGREE IN FUELS AND ENERGY', 'BEFE', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('115', 'BACHELOR OF ENGINEERING HONOURS DEGREE IN PRODUCTION ENGINEERING', 'BEPE', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('116', 'BACHELOR OF SCIENCE HONOURS DEGREE IN SUPPLY CHAIN MANAGEMENT', 'BSSCM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('117', 'BACHELOR OF SCIENCE HONOURS DEGREE IN MARKETING', 'BSMKT', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('118', 'BACHELOR OF SCIENCE HONOURS DEGREE IN ENTREPRENEURSHIP AND BUSINESS MANAGEMENT', 'BSEBM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('119', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CONSUMER SCIENCE', 'BSCS', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('120', 'BACHELOR OF SCIENCE HONOURS DEGREE IN BIOTECHNOLOGY', 'BSBIO', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('121', 'BACHELOR OF SCIENCE HONOURS DEGREE IN FOOD SCIENCE AND TECHNOLOGY', 'BSFST', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('122', 'BACHELOR OF SCIENCE HONOURS DEGREE IN ENVIRONMENTAL HEALTH', 'BSEH', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('124', 'BACHELOR OF SCIENCE HONOURS DEGREE IN AGRICULTURAL ENGINEERING', 'BSAE', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('125', 'BACHELOR OF SCIENCE HONOURS DEGREE IN HOSPITALITY AND TOURISM ', 'BSHT', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('126', 'BACHELOR OF SCIENCE HONOURS DEGREE IN TRAVEL AND RECREATION', 'BSTR', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('127', 'BACHELOR OF SCIENCE HONOURS DEGREE IN WILDLIFE AND SAFARI MANAGEMENT', 'BSWSM', '1', '9');
INSERT INTO `tblsystem_programme` VALUES ('128', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CREATIVE ART AND DESIGN', 'BSCAD', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('129', 'BACHELOR OF SCIENCE HONOURS DEGREE IN FINE ART', 'BSFA', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('130', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CLOTHING FASHION DESIGN', 'BSCFD', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('131', 'BACHELOR OF SCIENCE HONOURS DEGREE IN ENVIRONMENTAL ENGINEERING', 'BSEE', '1', '3');
INSERT INTO `tblsystem_programme` VALUES ('133', 'MASTER OF PHILOSOPHY', 'MPHILHOS', '2', '6');
INSERT INTO `tblsystem_programme` VALUES ('134', 'BACHELOR OF SCIENCE HONOURS DEGREE IN POST HARVEST TECHNOLOGY', 'BSPH', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('135', 'BACHELOR OF SCIENCE HONOURS DEGREE IN IRRIGATION  ENGINEERING', 'BSIE', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('136', 'BACHELOR OF SCIENCE HONOURS DEGREE IN INTERNATIONAL MARKETING', 'BSIM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('137', 'BACHELOR OF SCIENCE  HONOURS DEGREE IN BUSINESS MANAGEMENT AND ENTREPRENEURSHIP', 'BSBE', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('138', 'BACHELOR OF SCIENCE HONOURS DEGREE  IN RETAIL MANAGEMENT', 'BSRM', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('139', 'BACHELOR OF SCIENCE  HONOURS DEGREE IN INTERNATIONAL PURCHASING LOGISTICS AND TRANSPORT', 'BSPLT', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('140', 'MASTERS DEGREE IN BUSINESS INTELLIGENCE', 'MBI', '2', '2');
INSERT INTO `tblsystem_programme` VALUES ('141', 'BACHELOR OF SCIENCE HONOURS DEGREE IN PHYSICS', 'BSPHS', '1', '8');
INSERT INTO `tblsystem_programme` VALUES ('142', 'BACHELOR OF SCIENCE HONOURS DEGREE IN  MATHEMATICS  OR STATISTICS', 'BSMTH', '1', '8');
INSERT INTO `tblsystem_programme` VALUES ('143', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CHEMISTRY', 'BSCHM', '1', '8');
INSERT INTO `tblsystem_programme` VALUES ('144', 'BACHELOR OF SCIENCE HONOURS DEGREE IN BIOLOGY', 'BSBIOL', '1', '8');
INSERT INTO `tblsystem_programme` VALUES ('145', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CROP SCIENCE AND TECHNOLOGY', 'BSCST', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('146', 'BACHELOR OF SCIENCE HONOURS DEGREE IN RETAIL MANAGEMENT AND CONSUMER SCIENCE', 'BSRMCS', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('147', 'BACHELOR OF SCIENCE HONOURS DEGREE IN BUSINESS MANAGEMENT AND ENTERPRENEURSHIP', 'BSBME', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('148', 'MASTER OF PHILOSOPHY', 'MPHILAGR', '2', '4');
INSERT INTO `tblsystem_programme` VALUES ('149', 'MASTER OF PHILOSOPHY', 'MPHILART', '2', '7');
INSERT INTO `tblsystem_programme` VALUES ('150', 'MASTER OF PHILOSOPHY', 'MPHILNAT', '2', '8');
INSERT INTO `tblsystem_programme` VALUES ('151', 'MASTER OF PHILOSOPHY', 'MPHILACE', '2', '5');
INSERT INTO `tblsystem_programme` VALUES ('152', 'MASTER OF PHILOSOPHY', 'MPHILILL', '2', '1');
INSERT INTO `tblsystem_programme` VALUES ('153', 'DOCTOR OF  PHILOSOPHY', 'DPhilBus', '3', '2');
INSERT INTO `tblsystem_programme` VALUES ('154', 'DOCTOR OF  PHILOSOPHY', 'DPhilHos', '3', '6');
INSERT INTO `tblsystem_programme` VALUES ('155', 'DOCTOR OF  PHILOSOPHY', 'DPhilAgr', '3', '4');
INSERT INTO `tblsystem_programme` VALUES ('156', 'DOCTOR OF  PHILOSOPHY', 'DPhilArt', '3', '7');
INSERT INTO `tblsystem_programme` VALUES ('157', 'DOCTOR OF  PHILOSOPHY', 'DPhilNat', '3', '8');
INSERT INTO `tblsystem_programme` VALUES ('158', 'DOCTOR OF  PHILOSOPHY', 'DPhilAce', '3', '5');
INSERT INTO `tblsystem_programme` VALUES ('159', 'DOCTOR OF  PHILOSOPHY', 'DPhilIll', '3', '1');
INSERT INTO `tblsystem_programme` VALUES ('160', 'BACHELOR OF  SCIENCE HONOURS DEGREE IN WILDLIFE, ECOLOGY AND CONSERVATION', 'BSWEC', '1', '9');
INSERT INTO `tblsystem_programme` VALUES ('161', 'INTEGRATED FOUNDATION YEAR SCIENCE', 'IFYSC', '1', '8');
INSERT INTO `tblsystem_programme` VALUES ('162', 'DOCTOR OF  PHILOSOPHY', 'DPhilWec', '3', '9');
INSERT INTO `tblsystem_programme` VALUES ('163', 'MASTER OF PHILOSOPHY', 'MPHILWEC', '2', '9');
INSERT INTO `tblsystem_programme` VALUES ('164', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CLOTHING FASHION DESIGN', 'BSCFD2', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('165', 'BACHELOR OF SCIENCE HONOURS DEGREE IN FINE ART', 'BSFA2', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('166', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CREATIVE ART AND DESIGN', 'BSCAD2', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('167', 'BACHELOR OF SCIENCE  HONOURS DEGREE IN BUSINESS MANAGEMENT AND ENTREPRENEURSHIP', 'BSBE2', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('168', 'BACHELOR OF SCIENCE HONOURS DEGREE IN ACCOUNTANCY', 'BSCAC2', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('169', 'BACHELOR OF SCIENCE HONOURS DEGREE IN INTERNATIONAL MARKETING', 'BSIM2', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('170', 'BACHELOR OF SCIENCE HONOURS DEGREE IN RETAIL MANAGEMENT AND CONSUMER SCIENCE', 'BSRMCS2', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('171', 'BACHELOR OF SCIENCE HONOURS DEGREE IN SUPPLY CHAIN MANAGEMENT', 'BSSCM2', '1', '2');
INSERT INTO `tblsystem_programme` VALUES ('172', 'BACHELOR OF SCIENCE HONOURS DEGREE IN HOSPITALITY AND TOURISM', 'BSHT2', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('173', 'BACHELOR OF SCIENCE HONOURS DEGREE IN TRAVEL AND RECREATION', 'BSTR2', '1', '6');
INSERT INTO `tblsystem_programme` VALUES ('174', 'BACHELOR OF SCIENCE HONOURS DEGREE IN AGRICULTURAL ENGINEERING', 'BSAE2', '1', '4');
INSERT INTO `tblsystem_programme` VALUES ('175', 'MASTER OF SCIENCE DEGREE IN APPLIED ENTREPRENEURSHIP', 'MSCAE', '2', '2');
INSERT INTO `tblsystem_programme` VALUES ('176', 'BACHELOR OF SCIENCE HONOURS DEGREE IN FRESHWATER AND FISHERY SCIENCE', 'BSFWFS', '1', '9');
INSERT INTO `tblsystem_programme` VALUES ('177', 'BACHELOR OF SCIENCE HONOURS DEGREE IN VISUAL COMMUNICATION AND MULTIMEDIA DESIGN', 'BSVCMD', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('178', 'BACHELOR OF SCIENCE HONOURS DEGREE IN CREATIVE ART AND INDUSTRIAL DESIGN', 'BSCAID', '1', '7');
INSERT INTO `tblsystem_programme` VALUES ('179', 'MASTER OF SCIENCE DEGREE IN SUPPLY CHAIN MANAGEMENT', 'MSCSCM', '2', '2');
INSERT INTO `tblsystem_programme` VALUES ('180', 'MASTER OF SCIENCE DEGREE IN HOSPITALITY AND TOURISM', 'MSCHT', '2', '6');
INSERT INTO `tblsystem_programme` VALUES ('181', 'POST-GRADUATE DIPLOMA IN HIGHER EDUCATION', 'PGDHE', '1', '778');

-- ----------------------------
-- Table structure for `tblsystem_relationship`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_relationship`;
CREATE TABLE `tblsystem_relationship` (
  `relationship_id` int(50) NOT NULL auto_increment,
  `relationship_name` varchar(100) NOT NULL,
  PRIMARY KEY  (`relationship_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_relationship
-- ----------------------------
INSERT INTO `tblsystem_relationship` VALUES ('1', 'MOTHER');
INSERT INTO `tblsystem_relationship` VALUES ('2', 'FATHER');
INSERT INTO `tblsystem_relationship` VALUES ('3', 'SISTER');
INSERT INTO `tblsystem_relationship` VALUES ('4', 'BROTHER');

-- ----------------------------
-- Table structure for `tblsystem_religion`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_religion`;
CREATE TABLE `tblsystem_religion` (
  `religion_id` int(50) NOT NULL auto_increment,
  `religion_name` varchar(100) NOT NULL,
  PRIMARY KEY  (`religion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_religion
-- ----------------------------
INSERT INTO `tblsystem_religion` VALUES ('1', 'CHRISTIANITY');
INSERT INTO `tblsystem_religion` VALUES ('2', 'HINDUISM');
INSERT INTO `tblsystem_religion` VALUES ('3', 'TRADITIONAL');

-- ----------------------------
-- Table structure for `tblsystem_result_weight`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_result_weight`;
CREATE TABLE `tblsystem_result_weight` (
  `result_id` int(11) NOT NULL auto_increment,
  `result_name` varchar(50) NOT NULL,
  `result_weight` int(50) default NULL,
  PRIMARY KEY  (`result_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_result_weight
-- ----------------------------
INSERT INTO `tblsystem_result_weight` VALUES ('1', 'A', '5');
INSERT INTO `tblsystem_result_weight` VALUES ('2', 'B', '4');
INSERT INTO `tblsystem_result_weight` VALUES ('3', 'C', '3');
INSERT INTO `tblsystem_result_weight` VALUES ('4', 'D', '2');
INSERT INTO `tblsystem_result_weight` VALUES ('5', 'F', '1');
INSERT INTO `tblsystem_result_weight` VALUES ('6', 'O', '0');

-- ----------------------------
-- Table structure for `tblsystem_sex`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_sex`;
CREATE TABLE `tblsystem_sex` (
  `sex_id` int(50) NOT NULL auto_increment,
  `sex_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`sex_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_sex
-- ----------------------------
INSERT INTO `tblsystem_sex` VALUES ('1', 'MALE');
INSERT INTO `tblsystem_sex` VALUES ('2', 'FEMALE');

-- ----------------------------
-- Table structure for `tblsystem_subject`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_subject`;
CREATE TABLE `tblsystem_subject` (
  `subject_id` int(11) default NULL,
  `subject_name` varchar(50) default NULL,
  `subject_code` varchar(50) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_subject
-- ----------------------------
INSERT INTO `tblsystem_subject` VALUES ('1', 'Accounting', 'ACCNTG');
INSERT INTO `tblsystem_subject` VALUES ('2', 'Accounts', 'ACCNTS');
INSERT INTO `tblsystem_subject` VALUES ('3', 'AGRICULTURE', 'AGRIC');
INSERT INTO `tblsystem_subject` VALUES ('4', 'Art', 'ART');
INSERT INTO `tblsystem_subject` VALUES ('5', 'Art and Craft', 'ARTCRT');
INSERT INTO `tblsystem_subject` VALUES ('6', 'Bible Knowledge', 'BK');
INSERT INTO `tblsystem_subject` VALUES ('7', 'Biological Studies, London', 'BIOLON');
INSERT INTO `tblsystem_subject` VALUES ('8', 'BIOLOGY', 'BIO');
INSERT INTO `tblsystem_subject` VALUES ('9', 'Bookkeeping and Accounting', 'BKACC');
INSERT INTO `tblsystem_subject` VALUES ('10', 'Botany', 'BOTAN');
INSERT INTO `tblsystem_subject` VALUES ('11', 'Building Studies', 'BLDSTDS');
INSERT INTO `tblsystem_subject` VALUES ('12', 'Business Studies', null);
INSERT INTO `tblsystem_subject` VALUES ('13', 'Chemistry', null);
INSERT INTO `tblsystem_subject` VALUES ('14', 'Commerce', null);
INSERT INTO `tblsystem_subject` VALUES ('15', 'Computer Science', null);
INSERT INTO `tblsystem_subject` VALUES ('16', 'Computer Studies', null);
INSERT INTO `tblsystem_subject` VALUES ('17', 'Computing', null);
INSERT INTO `tblsystem_subject` VALUES ('18', 'Cookery', null);
INSERT INTO `tblsystem_subject` VALUES ('19', 'Craft and Design', null);
INSERT INTO `tblsystem_subject` VALUES ('20', 'Divinity', null);
INSERT INTO `tblsystem_subject` VALUES ('21', 'Domestic Science', null);
INSERT INTO `tblsystem_subject` VALUES ('22', 'Drama and Theatre Arts (AEB)', null);
INSERT INTO `tblsystem_subject` VALUES ('23', 'Economic  Geography', null);
INSERT INTO `tblsystem_subject` VALUES ('24', 'Economic  Principles', null);
INSERT INTO `tblsystem_subject` VALUES ('25', 'Economic and Political Studies', null);
INSERT INTO `tblsystem_subject` VALUES ('26', 'Economic and Public Affairs', null);
INSERT INTO `tblsystem_subject` VALUES ('27', 'Economic and Social History', null);
INSERT INTO `tblsystem_subject` VALUES ('28', 'Economic History', null);
INSERT INTO `tblsystem_subject` VALUES ('29', 'Economics', null);
INSERT INTO `tblsystem_subject` VALUES ('30', 'Electricity and Electronics', null);
INSERT INTO `tblsystem_subject` VALUES ('31', 'Electronic Systems(AEB)', null);
INSERT INTO `tblsystem_subject` VALUES ('32', 'ELECTRONICS', null);
INSERT INTO `tblsystem_subject` VALUES ('33', 'Elementary Physiology', null);
INSERT INTO `tblsystem_subject` VALUES ('34', 'Elements of Sociology', null);
INSERT INTO `tblsystem_subject` VALUES ('35', 'Engineering Drawing', null);
INSERT INTO `tblsystem_subject` VALUES ('36', 'Engineering Science', null);
INSERT INTO `tblsystem_subject` VALUES ('38', 'ENGLISH LANGUAGE', null);
INSERT INTO `tblsystem_subject` VALUES ('40', 'Environmental Biology (AEB)', null);
INSERT INTO `tblsystem_subject` VALUES ('41', 'Environmental studies', null);
INSERT INTO `tblsystem_subject` VALUES ('42', 'FASHION AND FABRICS', null);
INSERT INTO `tblsystem_subject` VALUES ('43', 'FOOD AND NUTRITION', null);
INSERT INTO `tblsystem_subject` VALUES ('44', 'FOOD SCIENCE', null);
INSERT INTO `tblsystem_subject` VALUES ('45', 'French', null);
INSERT INTO `tblsystem_subject` VALUES ('46', 'French Literature (Cambridge)', null);
INSERT INTO `tblsystem_subject` VALUES ('47', 'French Studies', null);
INSERT INTO `tblsystem_subject` VALUES ('98', 'Art and Design', null);
INSERT INTO `tblsystem_subject` VALUES (null, 'Commercial Studies', null);
INSERT INTO `tblsystem_subject` VALUES ('50', 'General Science', null);
INSERT INTO `tblsystem_subject` VALUES ('51', 'GEO & MECH/BUILDING DRAWING', null);
INSERT INTO `tblsystem_subject` VALUES ('52', 'GEOGRAPHY', null);
INSERT INTO `tblsystem_subject` VALUES ('53', 'Geology', null);
INSERT INTO `tblsystem_subject` VALUES ('54', 'Government and Political Studies/Policies', null);
INSERT INTO `tblsystem_subject` VALUES ('55', 'Government Economics and Commerce', null);
INSERT INTO `tblsystem_subject` VALUES ('56', 'Health Science', null);
INSERT INTO `tblsystem_subject` VALUES ('57', 'HISTORY', null);
INSERT INTO `tblsystem_subject` VALUES ('58', 'History Ancient', null);
INSERT INTO `tblsystem_subject` VALUES ('59', 'History and Appreciation of Music', null);
INSERT INTO `tblsystem_subject` VALUES ('60', 'History Art', null);
INSERT INTO `tblsystem_subject` VALUES ('61', 'Home Biology', null);
INSERT INTO `tblsystem_subject` VALUES ('62', 'Home Economics', null);
INSERT INTO `tblsystem_subject` VALUES ('63', 'HUMAN AND SOCIAL BIOLOGY', null);
INSERT INTO `tblsystem_subject` VALUES ('64', 'Integrated Science', null);
INSERT INTO `tblsystem_subject` VALUES ('65', 'Law', null);
INSERT INTO `tblsystem_subject` VALUES ('66', 'LITERATURE IN ENGLISH', null);
INSERT INTO `tblsystem_subject` VALUES ('67', 'Management of Business', null);
INSERT INTO `tblsystem_subject` VALUES ('68', 'MANAGEMENT OF BUSSINESS', null);
INSERT INTO `tblsystem_subject` VALUES ('69', 'MATHEMATICS', null);
INSERT INTO `tblsystem_subject` VALUES ('99', 'Design and Technology', null);
INSERT INTO `tblsystem_subject` VALUES ('72', 'Metalwork', 'MTW');
INSERT INTO `tblsystem_subject` VALUES ('73', 'Music', null);
INSERT INTO `tblsystem_subject` VALUES ('74', 'Ndebele', null);
INSERT INTO `tblsystem_subject` VALUES ('75', 'Needlework', null);
INSERT INTO `tblsystem_subject` VALUES ('76', 'Physical Science', null);
INSERT INTO `tblsystem_subject` VALUES ('77', 'Physics', null);
INSERT INTO `tblsystem_subject` VALUES ('78', 'Physics with Chemistry', null);
INSERT INTO `tblsystem_subject` VALUES ('79', 'Political Studies', null);
INSERT INTO `tblsystem_subject` VALUES ('80', 'Portuguese', null);
INSERT INTO `tblsystem_subject` VALUES ('81', 'Principles of Accounts', null);
INSERT INTO `tblsystem_subject` VALUES ('82', 'Principles of Economics', null);
INSERT INTO `tblsystem_subject` VALUES ('83', 'Psychology', null);
INSERT INTO `tblsystem_subject` VALUES ('84', 'Religious Studies', null);
INSERT INTO `tblsystem_subject` VALUES ('85', 'Rural Biology', null);
INSERT INTO `tblsystem_subject` VALUES ('86', 'Science', null);
INSERT INTO `tblsystem_subject` VALUES ('87', 'SHONA', null);
INSERT INTO `tblsystem_subject` VALUES ('88', 'Social Science', null);
INSERT INTO `tblsystem_subject` VALUES ('89', 'Sociology', null);
INSERT INTO `tblsystem_subject` VALUES ('90', 'Statistics', null);
INSERT INTO `tblsystem_subject` VALUES ('91', 'Surveying', null);
INSERT INTO `tblsystem_subject` VALUES ('92', 'Technical Drawing', null);
INSERT INTO `tblsystem_subject` VALUES ('93', 'Technical Graphics', null);
INSERT INTO `tblsystem_subject` VALUES ('94', 'TEXTILES AND CLOTHING DESIGN', null);
INSERT INTO `tblsystem_subject` VALUES ('95', 'TEXTILES TECHNOLOGY', null);
INSERT INTO `tblsystem_subject` VALUES ('96', 'Wood Work', null);
INSERT INTO `tblsystem_subject` VALUES ('97', 'Travel and Tourism', 'WW');
INSERT INTO `tblsystem_subject` VALUES ('98', 'Information and Communication Technology', 'ICT');
INSERT INTO `tblsystem_subject` VALUES ('99', 'Combined Science', 'CS');
INSERT INTO `tblsystem_subject` VALUES ('100', 'Extended Science', 'ES');
INSERT INTO `tblsystem_subject` VALUES ('101', 'Food Studies', 'FS');
INSERT INTO `tblsystem_subject` VALUES ('102', 'Travel and Tourism', 'TT');
INSERT INTO `tblsystem_subject` VALUES ('103', 'First Language English', 'FLE');
INSERT INTO `tblsystem_subject` VALUES ('104', 'Environmental Management', 'EM');
INSERT INTO `tblsystem_subject` VALUES ('105', 'Applied Information and Communication Technology', 'AICT');
INSERT INTO `tblsystem_subject` VALUES ('106', 'Information and Technology', 'IT');

-- ----------------------------
-- Table structure for `tblsystem_title`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_title`;
CREATE TABLE `tblsystem_title` (
  `title_id` int(50) NOT NULL auto_increment,
  `title_name` varchar(50) NOT NULL,
  PRIMARY KEY  (`title_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_title
-- ----------------------------
INSERT INTO `tblsystem_title` VALUES ('1', 'MR');
INSERT INTO `tblsystem_title` VALUES ('2', 'MS');
INSERT INTO `tblsystem_title` VALUES ('3', 'MRS');
INSERT INTO `tblsystem_title` VALUES ('4', 'PROF');
INSERT INTO `tblsystem_title` VALUES ('5', 'DR');
INSERT INTO `tblsystem_title` VALUES ('6', 'SIR');

-- ----------------------------
-- Table structure for `tblsystem_towns`
-- ----------------------------
DROP TABLE IF EXISTS `tblsystem_towns`;
CREATE TABLE `tblsystem_towns` (
  `town_id` int(11) NOT NULL auto_increment,
  `town_name` varchar(50) default NULL,
  `province_id` int(11) default NULL,
  PRIMARY KEY  (`town_id`)
) ENGINE=MyISAM AUTO_INCREMENT=201 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of tblsystem_towns
-- ----------------------------
INSERT INTO `tblsystem_towns` VALUES ('1', 'ARCTURUS', '5');
INSERT INTO `tblsystem_towns` VALUES ('2', 'BANKET', '6');
INSERT INTO `tblsystem_towns` VALUES ('3', 'BEATRICE', '5');
INSERT INTO `tblsystem_towns` VALUES ('4', 'BEIRA', '11');
INSERT INTO `tblsystem_towns` VALUES ('5', 'BEITBRIDGE', '9');
INSERT INTO `tblsystem_towns` VALUES ('6', 'BIKITA', '7');
INSERT INTO `tblsystem_towns` VALUES ('7', 'BINDURA', '4');
INSERT INTO `tblsystem_towns` VALUES ('8', 'BINGA', '8');
INSERT INTO `tblsystem_towns` VALUES ('9', 'BIRCHENOUGH BRIDGE', '3');
INSERT INTO `tblsystem_towns` VALUES ('10', 'BUHERA', '3');
INSERT INTO `tblsystem_towns` VALUES ('11', 'BULAWAYO', '1');
INSERT INTO `tblsystem_towns` VALUES ('12', 'CENTENARY', '4');
INSERT INTO `tblsystem_towns` VALUES ('13', 'CHAKARI', '6');
INSERT INTO `tblsystem_towns` VALUES ('14', 'CHATSWORTH', '7');
INSERT INTO `tblsystem_towns` VALUES ('15', 'CHECHECHE', '6');
INSERT INTO `tblsystem_towns` VALUES ('16', 'CHEGUTU', '3');
INSERT INTO `tblsystem_towns` VALUES ('17', 'CHIKOMBA', '5');
INSERT INTO `tblsystem_towns` VALUES ('18', 'CHIMANIMANI', '3');
INSERT INTO `tblsystem_towns` VALUES ('19', 'CHIMOIYO', '11');
INSERT INTO `tblsystem_towns` VALUES ('20', 'CHINHOYI', '6');
INSERT INTO `tblsystem_towns` VALUES ('21', 'CHIPANGAYI', '7');
INSERT INTO `tblsystem_towns` VALUES ('22', 'CHIPATA', '11');
INSERT INTO `tblsystem_towns` VALUES ('23', 'CHIPINGE', '3');
INSERT INTO `tblsystem_towns` VALUES ('24', 'CHIREDZI', '7');
INSERT INTO `tblsystem_towns` VALUES ('25', 'CHIRUMHANZU', '7');
INSERT INTO `tblsystem_towns` VALUES ('26', 'CHIRUNDU', '6');
INSERT INTO `tblsystem_towns` VALUES ('27', 'CHITUNGWIZA', '2');
INSERT INTO `tblsystem_towns` VALUES ('28', 'CHIVHU', '5');
INSERT INTO `tblsystem_towns` VALUES ('29', 'CHIVI', '7');
INSERT INTO `tblsystem_towns` VALUES ('30', 'CHIWESHE', '4');
INSERT INTO `tblsystem_towns` VALUES ('31', 'CONCESSION', '4');
INSERT INTO `tblsystem_towns` VALUES ('32', 'DARWENDALE', '6');
INSERT INTO `tblsystem_towns` VALUES ('33', 'DETE', '8');
INSERT INTO `tblsystem_towns` VALUES ('34', 'DOROWA', '5');
INSERT INTO `tblsystem_towns` VALUES ('35', 'ESIGODINI', '9');
INSERT INTO `tblsystem_towns` VALUES ('36', 'FIGTREE', '9');
INSERT INTO `tblsystem_towns` VALUES ('37', 'FILABUSI', '9');
INSERT INTO `tblsystem_towns` VALUES ('38', 'GERMANY-REGENSBURG', '11');
INSERT INTO `tblsystem_towns` VALUES ('39', 'GLENDALE', '4');
INSERT INTO `tblsystem_towns` VALUES ('40', 'GOKWE', '10');
INSERT INTO `tblsystem_towns` VALUES ('41', 'GURUVE', '4');
INSERT INTO `tblsystem_towns` VALUES ('42', 'GUTU', '7');
INSERT INTO `tblsystem_towns` VALUES ('43', 'GWANDA', '9');
INSERT INTO `tblsystem_towns` VALUES ('44', 'GWERU', '10');
INSERT INTO `tblsystem_towns` VALUES ('45', 'HARARE', '2');
INSERT INTO `tblsystem_towns` VALUES ('46', 'HAUNA', '11');
INSERT INTO `tblsystem_towns` VALUES ('47', 'HEADLANDS', '3');
INSERT INTO `tblsystem_towns` VALUES ('48', 'HURUNGWE', '6');
INSERT INTO `tblsystem_towns` VALUES ('49', 'HWANGE', '8');
INSERT INTO `tblsystem_towns` VALUES ('50', 'INSIZA', '9');
INSERT INTO `tblsystem_towns` VALUES ('51', 'JERERA', '7');
INSERT INTO `tblsystem_towns` VALUES ('52', 'JOTSHOLO', '8');
INSERT INTO `tblsystem_towns` VALUES ('53', 'JULIASDALE', '3');
INSERT INTO `tblsystem_towns` VALUES ('54', 'JURU', '5');
INSERT INTO `tblsystem_towns` VALUES ('55', 'KADOMA', '6');
INSERT INTO `tblsystem_towns` VALUES ('56', 'KARIBA', '6');
INSERT INTO `tblsystem_towns` VALUES ('57', 'KAROI', '6');
INSERT INTO `tblsystem_towns` VALUES ('58', 'KEZI', '9');
INSERT INTO `tblsystem_towns` VALUES ('59', 'KWEKWE', '10');
INSERT INTO `tblsystem_towns` VALUES ('60', 'LALAPANZI', '10');
INSERT INTO `tblsystem_towns` VALUES ('61', 'LISHINGA', '11');
INSERT INTO `tblsystem_towns` VALUES ('62', 'LUPANE', '8');
INSERT INTO `tblsystem_towns` VALUES ('63', 'MACHEKE', '5');
INSERT INTO `tblsystem_towns` VALUES ('64', 'MAGUNJE', '6');
INSERT INTO `tblsystem_towns` VALUES ('65', 'MAKONDE', '6');
INSERT INTO `tblsystem_towns` VALUES ('66', 'MAKONI', '3');
INSERT INTO `tblsystem_towns` VALUES ('67', 'MAKUTI', '6');
INSERT INTO `tblsystem_towns` VALUES ('68', 'MALAWI', '11');
INSERT INTO `tblsystem_towns` VALUES ('69', 'MAPUTO', '11');
INSERT INTO `tblsystem_towns` VALUES ('70', 'MARONDERA', '5');
INSERT INTO `tblsystem_towns` VALUES ('71', 'MASHAVA', '7');
INSERT INTO `tblsystem_towns` VALUES ('72', 'MASVINGO', '7');
INSERT INTO `tblsystem_towns` VALUES ('73', 'MATAGA', '11');
INSERT INTO `tblsystem_towns` VALUES ('74', 'MATOPOS', '9');
INSERT INTO `tblsystem_towns` VALUES ('75', 'MAZOWE', '4');
INSERT INTO `tblsystem_towns` VALUES ('76', 'MAZVIWA', '10');
INSERT INTO `tblsystem_towns` VALUES ('77', 'MBERENGWA', '10');
INSERT INTO `tblsystem_towns` VALUES ('78', 'MHANGURA', '6');
INSERT INTO `tblsystem_towns` VALUES ('79', 'MOUNT DARWIN', '4');
INSERT INTO `tblsystem_towns` VALUES ('80', 'MUDZI', '5');
INSERT INTO `tblsystem_towns` VALUES ('81', 'MUNYATI', '10');
INSERT INTO `tblsystem_towns` VALUES ('82', 'MURAMBINDA', '3');
INSERT INTO `tblsystem_towns` VALUES ('83', 'MUREWA', '5');
INSERT INTO `tblsystem_towns` VALUES ('84', 'MUROMBEDZI', '6');
INSERT INTO `tblsystem_towns` VALUES ('85', 'MUTAMBARA', '5');
INSERT INTO `tblsystem_towns` VALUES ('86', 'MUTARE', '3');
INSERT INTO `tblsystem_towns` VALUES ('87', 'MUTASA', '3');
INSERT INTO `tblsystem_towns` VALUES ('88', 'MUTOKO', '5');
INSERT INTO `tblsystem_towns` VALUES ('89', 'MUTORASHANGA', '6');
INSERT INTO `tblsystem_towns` VALUES ('90', 'MVUMA', '10');
INSERT INTO `tblsystem_towns` VALUES ('91', 'MVURWI', '6');
INSERT INTO `tblsystem_towns` VALUES ('92', 'MWENEZI', '7');
INSERT INTO `tblsystem_towns` VALUES ('93', 'NAMPULA', '11');
INSERT INTO `tblsystem_towns` VALUES ('94', 'NDANGA', '7');
INSERT INTO `tblsystem_towns` VALUES ('95', 'NGUNDU', '7');
INSERT INTO `tblsystem_towns` VALUES ('96', 'NKAYI', '8');
INSERT INTO `tblsystem_towns` VALUES ('97', 'NORTON', '6');
INSERT INTO `tblsystem_towns` VALUES ('98', 'NYAMANDHLOVU', '8');
INSERT INTO `tblsystem_towns` VALUES ('99', 'NYANGA', '3');
INSERT INTO `tblsystem_towns` VALUES ('100', 'NYANINGWE', '7');
INSERT INTO `tblsystem_towns` VALUES ('101', 'NYAZURA', '3');
INSERT INTO `tblsystem_towns` VALUES ('102', 'NYIKA', '7');
INSERT INTO `tblsystem_towns` VALUES ('103', 'ODZI', '7');
INSERT INTO `tblsystem_towns` VALUES ('104', 'PEMBA', '11');
INSERT INTO `tblsystem_towns` VALUES ('105', 'PENHALONGA', '7');
INSERT INTO `tblsystem_towns` VALUES ('106', 'PLUMTREE', '8');
INSERT INTO `tblsystem_towns` VALUES ('107', 'QULIMANI', '11');
INSERT INTO `tblsystem_towns` VALUES ('108', 'RAFFINGORA', '6');
INSERT INTO `tblsystem_towns` VALUES ('109', 'REDCLIFF', '10');
INSERT INTO `tblsystem_towns` VALUES ('110', 'RUSAPE', '7');
INSERT INTO `tblsystem_towns` VALUES ('111', 'RUSHINGA', '4');
INSERT INTO `tblsystem_towns` VALUES ('112', 'RUTENGA', '7');
INSERT INTO `tblsystem_towns` VALUES ('113', 'RUWA', '2');
INSERT INTO `tblsystem_towns` VALUES ('114', 'SANYATI', '6');
INSERT INTO `tblsystem_towns` VALUES ('115', 'SEKE', '2');
INSERT INTO `tblsystem_towns` VALUES ('116', 'SELOUS', '6');
INSERT INTO `tblsystem_towns` VALUES ('117', 'SHAMVA', '4');
INSERT INTO `tblsystem_towns` VALUES ('118', 'SHANGANI', '9');
INSERT INTO `tblsystem_towns` VALUES ('119', 'SHURUGWI', '7');
INSERT INTO `tblsystem_towns` VALUES ('120', 'SOUTH AFRICA - JOHANNESBURG', '11');
INSERT INTO `tblsystem_towns` VALUES ('121', 'SOUTH AFRICA - MELROSE ARCH', '11');
INSERT INTO `tblsystem_towns` VALUES ('122', 'TETE', '11');
INSERT INTO `tblsystem_towns` VALUES ('123', 'TRELAWNEY', '6');
INSERT INTO `tblsystem_towns` VALUES ('124', 'TRIANGLE', '7');
INSERT INTO `tblsystem_towns` VALUES ('125', 'TSHOLOTSHO', '8');
INSERT INTO `tblsystem_towns` VALUES ('126', 'TURK MINE', '9');
INSERT INTO `tblsystem_towns` VALUES ('127', 'VICTORIA FALLS', '9');
INSERT INTO `tblsystem_towns` VALUES ('128', 'WEDZA ', '5');
INSERT INTO `tblsystem_towns` VALUES ('129', 'WEST NICHOLSON', '9');
INSERT INTO `tblsystem_towns` VALUES ('130', 'ZAKA', '7');
INSERT INTO `tblsystem_towns` VALUES ('131', 'ZAMBIA - LUSAKA', '11');
INSERT INTO `tblsystem_towns` VALUES ('132', 'ZVIMBA', '6');
INSERT INTO `tblsystem_towns` VALUES ('133', 'ZVISHAVANE', '10');
INSERT INTO `tblsystem_towns` VALUES ('143', 'GOROMONZI', null);
INSERT INTO `tblsystem_towns` VALUES ('140', 'CAMBARE', '11');
INSERT INTO `tblsystem_towns` VALUES ('144', 'CONGO', null);
INSERT INTO `tblsystem_towns` VALUES ('145', 'LOMAGUNDI', null);
INSERT INTO `tblsystem_towns` VALUES ('146', 'SADZA', null);
INSERT INTO `tblsystem_towns` VALUES ('147', 'CHARTER', null);
INSERT INTO `tblsystem_towns` VALUES ('148', 'CHIBI', null);
INSERT INTO `tblsystem_towns` VALUES ('149', 'ZAWARA KRAAL', null);
INSERT INTO `tblsystem_towns` VALUES ('150', 'GATHS MINE', null);
INSERT INTO `tblsystem_towns` VALUES ('151', 'BLANTRE', null);
INSERT INTO `tblsystem_towns` VALUES ('152', null, '1');
INSERT INTO `tblsystem_towns` VALUES ('153', 'NEMATOMBO', null);
INSERT INTO `tblsystem_towns` VALUES ('154', 'CH NEMATOMBO', null);
INSERT INTO `tblsystem_towns` VALUES ('155', 'MAZORODZE MARTENITY HOME', null);
INSERT INTO `tblsystem_towns` VALUES ('156', 'UZUMBA/MARAMBA/PFUNGWE-UMP', null);
INSERT INTO `tblsystem_towns` VALUES ('157', 'GOKWE NORTH', null);
INSERT INTO `tblsystem_towns` VALUES ('158', 'MUZARAMBANI', null);
INSERT INTO `tblsystem_towns` VALUES ('159', 'MKOBA', null);
INSERT INTO `tblsystem_towns` VALUES ('160', 'MUOKO', null);
INSERT INTO `tblsystem_towns` VALUES ('161', 'MHANGULA', null);
INSERT INTO `tblsystem_towns` VALUES ('162', 'UMZINGWANE', null);
INSERT INTO `tblsystem_towns` VALUES ('163', 'KAZANGARARE', null);
INSERT INTO `tblsystem_towns` VALUES ('164', 'MJINGA', null);
INSERT INTO `tblsystem_towns` VALUES ('165', 'MATOBO', null);
INSERT INTO `tblsystem_towns` VALUES ('166', 'UMGUZA', null);
INSERT INTO `tblsystem_towns` VALUES ('167', 'BUBI', null);
INSERT INTO `tblsystem_towns` VALUES ('168', 'KINSHASA', null);
INSERT INTO `tblsystem_towns` VALUES ('169', 'BOTSWANA', null);
INSERT INTO `tblsystem_towns` VALUES ('170', 'DOMBOSHAVA', null);
INSERT INTO `tblsystem_towns` VALUES ('171', 'ETHOPIA', null);
INSERT INTO `tblsystem_towns` VALUES ('172', 'GOKWE SOUTH', null);
INSERT INTO `tblsystem_towns` VALUES ('173', 'LIAONING', null);
INSERT INTO `tblsystem_towns` VALUES ('174', 'HWEDZA', null);
INSERT INTO `tblsystem_towns` VALUES ('175', 'MHONDORO', null);
INSERT INTO `tblsystem_towns` VALUES ('176', 'ZAMBIA', null);
INSERT INTO `tblsystem_towns` VALUES ('177', 'HARTLEY', null);
INSERT INTO `tblsystem_towns` VALUES ('178', 'NAMIBIA', null);
INSERT INTO `tblsystem_towns` VALUES ('179', 'NAMIBIA WINDHOEK', null);
INSERT INTO `tblsystem_towns` VALUES ('180', 'BULILIMA MANGWE', null);
INSERT INTO `tblsystem_towns` VALUES ('181', 'WEST GERMANY HAMBURG', null);
INSERT INTO `tblsystem_towns` VALUES ('182', 'UNITED KINGDOM', null);
INSERT INTO `tblsystem_towns` VALUES ('183', 'BURUNDI', null);
INSERT INTO `tblsystem_towns` VALUES ('184', 'NYABIKERE', null);
INSERT INTO `tblsystem_towns` VALUES ('185', 'MSANA', null);
INSERT INTO `tblsystem_towns` VALUES ('186', 'YAMBIO', null);
INSERT INTO `tblsystem_towns` VALUES ('187', 'FANGAK', null);
INSERT INTO `tblsystem_towns` VALUES ('188', 'IBAHURE', null);
INSERT INTO `tblsystem_towns` VALUES ('189', 'NGEZI', null);
INSERT INTO `tblsystem_towns` VALUES ('190', 'MADZIWA', null);
INSERT INTO `tblsystem_towns` VALUES ('191', 'MHONDORO-NGEZI', null);
INSERT INTO `tblsystem_towns` VALUES ('192', 'MUTAWATAWA', null);
INSERT INTO `tblsystem_towns` VALUES ('193', 'SHABHANI', null);
INSERT INTO `tblsystem_towns` VALUES ('194', 'SINOA', null);
INSERT INTO `tblsystem_towns` VALUES ('195', 'SALISBURY', null);
INSERT INTO `tblsystem_towns` VALUES ('196', 'BRAMPTON', null);
INSERT INTO `tblsystem_towns` VALUES ('197', 'MARANGE', null);
INSERT INTO `tblsystem_towns` VALUES ('198', 'CHINA', null);
INSERT INTO `tblsystem_towns` VALUES ('199', 'KENYA', null);
INSERT INTO `tblsystem_towns` VALUES ('200', 'MUZARABANI', null);

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL auto_increment,
  `name` varchar(50) default NULL,
  `pass` varchar(50) default NULL,
  `email` varchar(50) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of users
-- ----------------------------
