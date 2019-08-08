/*
Navicat MySQL Data Transfer

Source Server         : Servidor Local
Source Server Version : 50625
Source Host           : 192.168.0.100:3306
Source Database       : dashsoccer

Target Server Type    : MYSQL
Target Server Version : 50625
File Encoding         : 65001

Date: 2019-07-10 09:34:38
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for Campeonato
-- ----------------------------
DROP TABLE IF EXISTS `Campeonato`;
CREATE TABLE `Campeonato` (
  `ID_Campeonato` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DataInicial` date NOT NULL,
  `DataFinal` date NOT NULL,
  `QtEquipas` int(11) DEFAULT NULL,
  `ID_Escalao` int(11) DEFAULT NULL,
  `REF_Epoca` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Campeonato`),
  KEY `IDX_3D70BB1AA8F65B5C` (`ID_Escalao`),
  KEY `IDX_3D70BB1ACD11D9A4` (`REF_Epoca`),
  CONSTRAINT `FK_3D70BB1AA8F65B5C` FOREIGN KEY (`ID_Escalao`) REFERENCES `Escalao` (`ID_Escalao`),
  CONSTRAINT `FK_3D70BB1ACD11D9A4` FOREIGN KEY (`REF_Epoca`) REFERENCES `Epoca` (`ID_epoca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Campeonato
-- ----------------------------

-- ----------------------------
-- Table structure for Campeonato_Clube
-- ----------------------------
DROP TABLE IF EXISTS `Campeonato_Clube`;
CREATE TABLE `Campeonato_Clube` (
  `ID_Campeonato` int(11) NOT NULL,
  `ID_Clube` int(11) NOT NULL,
  PRIMARY KEY (`ID_Campeonato`,`ID_Clube`),
  KEY `IDX_9846894D33B5ABC0` (`ID_Campeonato`),
  KEY `IDX_9846894D48E6B18C` (`ID_Clube`),
  CONSTRAINT `FK_9846894D33B5ABC0` FOREIGN KEY (`ID_Campeonato`) REFERENCES `Campeonato` (`ID_Campeonato`),
  CONSTRAINT `FK_9846894D48E6B18C` FOREIGN KEY (`ID_Clube`) REFERENCES `Clube` (`ID_Clube`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Campeonato_Clube
-- ----------------------------

-- ----------------------------
-- Table structure for Clube
-- ----------------------------
DROP TABLE IF EXISTS `Clube`;
CREATE TABLE `Clube` (
  `ID_Clube` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Abrv` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `N_FPF` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Associacao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Fundacao` date DEFAULT NULL,
  `Presidente` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Estadio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Cidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Foto` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Clube`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Clube
-- ----------------------------
INSERT INTO `Clube` VALUES ('1', 'Clube Desportivo de Estarreja', 'CDE', '26500', 'AF Aveiro', '1944-11-27', 'Pedro Mendes', 'Dr. Tavares da Silva', 'Estarreja', 'Portugal', 'CDElogo.png');

-- ----------------------------
-- Table structure for DadosInscricao
-- ----------------------------
DROP TABLE IF EXISTS `DadosInscricao`;
CREATE TABLE `DadosInscricao` (
  `ID_dadosInscricao` int(11) NOT NULL AUTO_INCREMENT,
  `ExameMedico` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FichaInscricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CopiaCC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DataValidadeCC` date DEFAULT NULL,
  `CopiaCCEncarregado` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DataValidadeCCEncarregado` date DEFAULT NULL,
  `FichaInscricaoFPF` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_dadosInscricao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of DadosInscricao
-- ----------------------------

-- ----------------------------
-- Table structure for DocumentoEntidade
-- ----------------------------
DROP TABLE IF EXISTS `DocumentoEntidade`;
CREATE TABLE `DocumentoEntidade` (
  `ID_documento` int(11) NOT NULL AUTO_INCREMENT,
  `REF_entidade` int(11) NOT NULL,
  `REF_tipodocumento` int(11) NOT NULL,
  `ficheiro` varchar(255) NOT NULL,
  `descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_documento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of DocumentoEntidade
-- ----------------------------

-- ----------------------------
-- Table structure for Entidade
-- ----------------------------
DROP TABLE IF EXISTS `Entidade`;
CREATE TABLE `Entidade` (
  `ID_Entidade` int(11) NOT NULL AUTO_INCREMENT,
  `nLicenca` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Telf` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Telm` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DataNasc` date DEFAULT NULL,
  `Naturalidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Pais` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CC` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `NIF` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GSanguineo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Habilitacoes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Doencas` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Profissao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UltimaAtualizacao` date DEFAULT NULL,
  `FotoInscricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `FotoCromos` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `REF_TipoEnt` int(11) DEFAULT NULL,
  `REF_Equipamento` int(11) DEFAULT NULL,
  `REF_Morada` int(11) DEFAULT NULL,
  `REF_Inscricao` int(11) DEFAULT NULL,
  `Estado` tinyint(1) NOT NULL,
  `REF_Posicao` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Entidade`),
  KEY `IDX_1A5F8484AAF9AA81` (`REF_TipoEnt`),
  KEY `IDX_1A5F84843AD8BCDA` (`REF_Equipamento`),
  KEY `IDX_1A5F8484EBA2E53C` (`REF_Morada`),
  KEY `IDX_1A5F84847276E2D6` (`REF_Inscricao`),
  KEY `IDX_1A5F8484DB19A7F2` (`REF_Posicao`),
  CONSTRAINT `FK_1A5F84843AD8BCDA` FOREIGN KEY (`REF_Equipamento`) REFERENCES `Equipamento` (`ID_equipamento`) ON DELETE CASCADE,
  CONSTRAINT `FK_1A5F84847276E2D6` FOREIGN KEY (`REF_Inscricao`) REFERENCES `DadosInscricao` (`ID_dadosInscricao`),
  CONSTRAINT `FK_1A5F8484AAF9AA81` FOREIGN KEY (`REF_TipoEnt`) REFERENCES `TipoEntidade` (`ID_tipoentidade`),
  CONSTRAINT `FK_1A5F8484DB19A7F2` FOREIGN KEY (`REF_Posicao`) REFERENCES `Posicao` (`ID_Posicao`),
  CONSTRAINT `FK_1A5F8484EBA2E53C` FOREIGN KEY (`REF_Morada`) REFERENCES `Morada` (`ID_Morada`)
) ENGINE=InnoDB AUTO_INCREMENT=1694 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Entidade
-- ----------------------------
INSERT INTO `Entidade` VALUES ('1', '895784', 'João Vitor Bastos Costeira', '234838850', '911488919', 'joao_vitor_costeira@hotmail.com', '1998-03-29', '', 'Portugal', '14840299', '242154913', '', '10º Ano', '', '', '2018-10-02', '', '', '1', null, '1', null, '0', null);
INSERT INTO `Entidade` VALUES ('2', '892805', 'Rodrigo Oliveira Moura', '256991497', '915012100', 'rm_sib20@hotmail.com', '1998-04-07', '', 'Portugal', '14841147', '226850676', '', '10º Ano', '', '', '2018-10-02', '', '', '1', null, '2', null, '0', null);
INSERT INTO `Entidade` VALUES ('3', '9833367894561', 'Dinis José Bispo Pires', '234845286', '918218851', 'dinis_11@hotmail.com', '1998-04-15', '', 'Portugal', '15217023', '248706004', 'A+', '11º Ano', '', '', '2017-11-13', 'uploads/d6abe4d020.png', '', '1', null, '3', null, '0', null);
INSERT INTO `Entidade` VALUES ('4', '892751', 'João Tiago dos Santos de Sousa', '234041686', '913225828', 'joao_tiago_09@hotmail.com', '1998-05-15', '', 'Portugal', '14792818', '227083202', 'O-', '11º Ano', '', '', '2017-11-13', '', '', '1', null, '4', null, '0', null);
INSERT INTO `Entidade` VALUES ('5', '33333333', 'André Nunes Rodrigues', '', '910261874', 'andre_n_r@msn.com', '1998-05-19', '', 'Portugal', '15258322', '227051483', '', '12º Ano', '', '', '2017-11-13', '', '', '1', null, '5', null, '0', null);
INSERT INTO `Entidade` VALUES ('9', '922043', 'Jorge Gabriel Vieira Teixeira', '234844117', '911815366', 'jorge.teixeira1999@hotmail.com', '1999-02-03', '', 'Portugal', '15496958', '242873154', 'O+', '10º ano', '', '', '2017-11-13', '', '', '1', null, '9', null, '0', null);
INSERT INTO `Entidade` VALUES ('10', '000026', 'Marcelo Oliveira Teixeira', '', '913371201', 'marcelofabio22@hotmail.com', '1999-02-03', '', 'Portugal', '15898787', '263746968', '', '11º Ano', '', '', '2017-11-13', '', '', '1', null, '10', null, '0', null);
INSERT INTO `Entidade` VALUES ('11', '1008537', 'Luís Paulo Silva Almeida', '919622354', '912140291', '', '1999-03-01', '', 'Portugal', '15977896', '252777522', '', '8º Ano', '', '', '2018-10-02', '', '', '1', null, '11', null, '0', null);
INSERT INTO `Entidade` VALUES ('12', '952917', 'Gabriel Alexandre Martins Soares', '234849385', '918297593', '', '1999-04-26', '', 'Portugal', '15717971', '246778334', '', '9º ano', '', '', '2018-10-02', '', '', '1', null, '12', null, '0', null);
INSERT INTO `Entidade` VALUES ('13', '000027', 'Márcio Filipe Lemos Paiva', '', '919095747', '', '1999-05-01', '', 'Portugal', '15822979', '229671985', '', '10º Ano', '', '', '2017-11-13', '', '', '1', null, '13', null, '0', null);
INSERT INTO `Entidade` VALUES ('14', '000028', 'Miguel José Bandeira Neves', '234288463', '964655773', 'eugenia_maria@sapo.pt', '1999-05-13', '', 'Portugal', '15449401', '269830308', '', '10º Ano', '', '', '2017-11-13', '', '', '1', null, '14', null, '0', null);
INSERT INTO `Entidade` VALUES ('15', '922041', 'Gonçalo Manuel Valente da Silva', '234881213', '917859528', 'gvalente046@gmail.com', '1999-05-19', '', 'Portugal', '15496969', '234881213', '', '11º Ano', '', '', '2018-10-02', '', '', '1', null, '15', null, '0', null);
INSERT INTO `Entidade` VALUES ('16', '923055', 'Simão Pedro Matos Antão Oliveira', '234841586', '918050027', 'simao.rosso@hotmail.com', '1999-06-11', '', 'Portugal', '15491048', '271038012', '', '11º Ano', '', '', '2018-10-02', '', '', '1', null, '16', null, '0', null);
INSERT INTO `Entidade` VALUES ('17', '923159', 'Daniel Alves Silva', '', '962527879', '', '1999-07-31', '', 'Portugal', '15483683', '272240230', '', '11º Ano', '', '', '2018-10-02', '', '', '1', null, '17', null, '0', null);
INSERT INTO `Entidade` VALUES ('18', '923045', 'José Carlos Gonçalves Almeida', '234843488', '917039104', '', '1999-08-04', '', 'Portugal', '15219254', '230956483', 'B+', '10º Ano', 'Hiperactividade', '', '2017-11-13', '', '', '1', null, '18', null, '0', null);
INSERT INTO `Entidade` VALUES ('19', '952913', 'Gonçalo Brandão Almeida Santos', '234842192', '911139128', 'sgoncalocbrandaop@hotmail.com', '1999-10-20', '', 'Portugal', '14363336', '248712063', '', '11º Ano', 'Alergia a Ácaros', '', '2017-11-13', '', '', '1', null, '19', null, '0', null);
INSERT INTO `Entidade` VALUES ('20', '923148', 'Nuno Miguel Pereira Ramos', '', '912497199', '', '1999-11-09', '', 'Portugal', '15396107', '247319880', 'O+', '9º ano', 'Asma', '', '2018-10-02', '', '', '1', null, '20', null, '0', null);
INSERT INTO `Entidade` VALUES ('21', '922042', 'Paulo Gonçalo Pinho Melo', '', '912654202', '', '1999-11-13', '', 'Portugal', '15496965', '000000000', '', '8º Ano', '', '', '2018-10-02', '', '', '1', null, '21', null, '0', null);
INSERT INTO `Entidade` VALUES ('22', '923145', 'José de Pinho Silva', '234880317', '918670740', 'zesilva067@hotmail.com', '1999-11-18', '', 'Portugal', '15487243', '252753445', '', '11º', '', '', '2018-10-02', '', '', '1', null, '22', null, '0', null);
INSERT INTO `Entidade` VALUES ('23', '000031', 'Pedro Reis Graça Resende', '256692731', '915641397', 'pe26@sapo.pt', '1999-12-02', '', 'Portugal', '15493391', '272609447', '', '8º Ano', '', '', '2018-10-02', '', '', '1', null, '23', null, '0', null);
INSERT INTO `Entidade` VALUES ('24', '966640', 'Fernando Pereira Mendes', '234847346', '961103878', '', '2000-01-03', '', 'Portugal', '15962282', '232143315', '', '11º Ano', '', '', '2018-10-04', '', '', '1', '261', '24', null, '1', null);
INSERT INTO `Entidade` VALUES ('25', '1011059', 'João Pedro Soutinho Oliveira', '', '916138221', 'sempresiga45@gmail.com', '2000-02-16', 'Portuguesa', 'Portugal', '15863599', '265381916', 'O+', '10º Ano', '', '', '2018-10-04', '', '', '1', '265', '25', null, '1', null);
INSERT INTO `Entidade` VALUES ('26', '955778', 'Rafael Soares Rebelo', '', '915281241', 'rafael.rebelo.7@live.com.pt', '2000-02-27', '', 'Portugal', '15674732', '232985227', '', '10º Ano', '', '', '2018-11-14', '', '', '1', null, '26', null, '0', null);
INSERT INTO `Entidade` VALUES ('27', '959477', 'Leonel André Costa Matos', '', '916183920', 'leonelmatos80@gmail.com', '2000-03-12', '', 'Portugal', '158190008', '234584688', '', '10º Ano', '', '', '2018-10-04', '', '', '1', '266', '27', null, '1', null);
INSERT INTO `Entidade` VALUES ('28', '955779', 'Rafael Vieira Gonçalves', '', '926241581', 'rafavgoncalves@gmail.com', '2000-05-23', '', 'Portugal', '151978476', '233490060', 'B+', '9º Ano', '', '', '2018-11-14', '', '', '1', null, '28', null, '0', null);
INSERT INTO `Entidade` VALUES ('29', '989353', 'Armando José Pereira Olim', '234841833', '932846329', 'armandoolim@hotmail.com', '2000-08-15', '', 'Portugal', '30173970', '253391920', '', '11º Ano', '', '', '2018-10-04', '', '', '1', '267', '29', null, '1', null);
INSERT INTO `Entidade` VALUES ('30', '956524', 'Tomás Costa Vieira', '234286235', '917727750', 'tomascv0209@gmail.com', '2000-09-02', '', 'Portugal', '15008392', '238253767', 'O+', '9º Ano', '', '', '2018-10-04', '', '', '1', '264', '30', null, '1', null);
INSERT INTO `Entidade` VALUES ('31', '956542', 'Rafael da Silva Dias', '', '914334335', 'rafael.dsd@gmail.com', '2000-09-15', '', 'Portugal', '15809486', '236829300', 'O+', '11º Ano', '', '', '2018-11-14', '', '', '1', null, '31', null, '0', null);
INSERT INTO `Entidade` VALUES ('32', '955773', 'Carlos André Soares dos Santos', '', '932328186', 'andre.santos@karisa.pt', '2000-10-01', '', 'Portugal', '13926035', '235245135', 'O+', '11º Ano', '', '', '2018-11-14', '', '', '1', null, '32', null, '0', null);
INSERT INTO `Entidade` VALUES ('34', '1082798', 'Leandro Filipe Fonseca', '', '913204789', 'fadohulkefalcao@hotmail.com', '2001-01-18', '', 'Portugal', '30451293', '271485388', '', '8º Ano', '', '', '2018-11-14', '', '', '1', '223', '34', null, '0', '1');
INSERT INTO `Entidade` VALUES ('35', '991125', 'Ricardo Manuel Batista Rodriguez', '234849125', '969607516', 'ricardombatista.23@gmail.com', '2001-01-23', '', 'Portugal', '14259484', '258777125', '', '9º Ano', '', '', '2017-11-13', '', '', '1', null, '35', null, '0', null);
INSERT INTO `Entidade` VALUES ('36', '987316', 'Ricardo Tavares Cirne', '', '917945313', 'ricardocirne@sapo.pt', '2001-01-29', '', 'Portugal', '15455930', '236169025', '', '10º Ano', '', '', '2018-10-04', '', '', '1', '183', '36', null, '1', null);
INSERT INTO `Entidade` VALUES ('37', '987329', 'Vasco Xavier Marques Almeida', '234845139', '910438118', 'vasco-cde@hotmail.com', '2001-02-16', '', 'Portugal', '30064977', '238912680', '', '7º Ano', '', '', '2017-11-13', '', '', '1', null, '37', null, '0', null);
INSERT INTO `Entidade` VALUES ('38', '987325', 'Samuel Correia Leite', '234847166', '911984096', 'samy.dragao@hotmail.com', '2001-02-21', '', 'Portugal', '30168772', '235714623', '', '9º ano', '', '', '2017-11-13', '', '', '1', null, '38', null, '0', null);
INSERT INTO `Entidade` VALUES ('39', '987323', 'Rodrigo Teixeira Marques', '234083710', '915397254', 'manuel.tm@netvisao.pt', '2001-03-26', '', 'Portugal', '14457954', '262827786', 'O+', '9º ano', '', '', '2018-10-04', '', '', '1', '213', '39', null, '1', null);
INSERT INTO `Entidade` VALUES ('40', '000024', 'Hugo Rafael da Costa Oliveira', '234844893', '964345952', 'hugo.rafa.3@hotmail.com', '2001-05-28', '', 'Portugal', '30870691', '265529328', 'B+', '', '', '', '2017-11-13', '', '', '1', null, '40', null, '0', null);
INSERT INTO `Entidade` VALUES ('41', '991755', 'Miguel Lopes Mendonça', '', '966297255', 'miguelmendonca20@hotmail.com', '2001-06-09', '', 'Portugal', '14384331', '238399397', 'RHA+', '9º ano', '', '', '2017-11-13', '', '', '1', null, '41', null, '0', null);
INSERT INTO `Entidade` VALUES ('42', '1010999', 'Diogo Santos Vigário', '234838613', '919395029', '', '2001-06-18', '', 'Portugal', '30298604', '238328899', 'ORH+', '8º Ano', 'Miopia', '', '2017-11-13', '', '', '1', null, '42', null, '0', null);
INSERT INTO `Entidade` VALUES ('43', '1108675', 'Diogo André Correia Anjos', '', '916828002', 'diogoandre1005@gmail.com', '2001-06-22', '', 'Portugal', '30745227', '240526325', 'A+', '9º Ano', '', '', '2018-11-14', '', '', '1', '234', '43', null, '0', null);
INSERT INTO `Entidade` VALUES ('44', '1017535', 'Ricardo Ribeiro da Costa Almeida Ferreira', '234871329', '967037732', 'ricardo_1234@live.com.pt', '2001-09-05', '', 'Portugal', '15698834', '275449645', 'ABRH+', '9º ano', '', '', '2019-07-08', '', '', '1', null, '44', null, '1', null);
INSERT INTO `Entidade` VALUES ('45', '985577', 'Fernando César Matos Maia', '234880589', '910011631', '', '2001-09-10', '', 'Portugal', '30086237', '240382730', '', '8º Ano', '', '', '2017-11-13', '', '', '1', null, '45', null, '0', null);
INSERT INTO `Entidade` VALUES ('46', '000025', 'Rui Miguel Murteira Costa', '', '961826258', '', '2001-09-22', '', 'Portugal', '30082417', '239519400', 'O H-', '9º Ano', '', '', '2017-11-13', '', '', '1', null, '46', null, '0', null);
INSERT INTO `Entidade` VALUES ('47', '987335', 'Rui Pedro Azevedo Viana Oliveira', '', '962862386', '', '2001-12-22', 'Portugal', 'Portugal', '15975935', '239574591', 'O+', '9º ano', 'Bronquite Asmática, Alergias: Pólen, Pó…', '', '2017-11-13', '', '', '1', null, '47', null, '0', null);
INSERT INTO `Entidade` VALUES ('48', '1078259', 'Diogo Filipe da Silva Dias', '234848066', '918953864', 'diogofilipinho@hotmail.com', '2001-12-23', '', 'Portugal', '30748139', '253820642', 'A+', '9º Ano', '', '', '2018-11-14', '', '', '1', '231', '48', null, '0', null);
INSERT INTO `Entidade` VALUES ('49', '987319', 'Rodrigo Marques Martins', '', '912430986', 'rodrigo2001martins@hotmail.com', '2001-12-31', '', 'Portugal', '14630500', '257342974', '', '9º ano', '', '', '2017-11-13', '', '', '1', null, '49', null, '0', null);
INSERT INTO `Entidade` VALUES ('50', '1011288', 'Rúben Oliveira Barge', '256049168', '913699615', '', '2002-01-08', '', 'Portugal', '30375959', '262092506', '', '', '', '', '2018-10-05', '', '', '1', '90', '50', null, '1', null);
INSERT INTO `Entidade` VALUES ('51', '1010991', 'Guilherme Costa Marques Ribeiro', '913998765', '913998765', 'guicosta5@hotmail.com', '2002-01-15', '', 'Portugal', '15902141', '245437916', 'O-', '8º Ano', 'Diabetes', '', '2017-08-14', '', '', '1', '69', '51', null, '1', null);
INSERT INTO `Entidade` VALUES ('52', '1011664', 'Diogo Rafael Marques Matos', '234871045', '', '', '2002-02-08', '', 'Portugal', '30511379', '240585704', 'O+', '10º Ano', '', '', '2018-10-05', '', '', '1', '79', '52', null, '1', '1');
INSERT INTO `Entidade` VALUES ('53', '1034017', 'Luís Miguel Pereira Resende', '234838959', '919859630', 'moluscosresende@gmail.com', '2002-02-19', '', 'Portugal', '14426820', '244184844', '', '8º Ano', 'Asma e Bronquite (Hiperactivo)', '', '2017-10-02', '', '', '1', '135', '53', null, '1', null);
INSERT INTO `Entidade` VALUES ('54', '1075429', 'Tiago Oliveira Silva', '', '', '', '2002-02-23', '', 'Portugal', '30855293', '240946014', 'ARH+P', '8º Ano', '', '', '2017-11-13', '', '', '1', null, '54', null, '0', null);
INSERT INTO `Entidade` VALUES ('55', '1008557', 'Emanuel Rodrigues Silva de Jesus', '', '933004308', 'manu.7.slb@gmail.com', '2002-03-26', '', 'Portugal', '15610581', '262831740', 'A+', '8º Ano', '', '', '2018-10-05', '', '', '1', '178', '55', null, '1', null);
INSERT INTO `Entidade` VALUES ('56', '1010974', 'Leandro Filipe da Silva Baptista', '', '919072182', '', '2002-03-30', 'Aveiro', 'Portugal', '30479273', '250793210', '', '8º Ano', '', '', '2018-11-14', '', '', '1', '177', '56', null, '0', null);
INSERT INTO `Entidade` VALUES ('57', '1013849', 'António Pedro Silva Marques', '234849871', '962025404', '', '2002-04-02', '', 'Portugal', '14956372', '258800845', '', '', '', '', '2018-11-14', '', '', '1', '70', '57', null, '0', null);
INSERT INTO `Entidade` VALUES ('58', '1017532', 'Diogo Alexandre Aguiar Pereira', '256598409', '963911638', 'aguiar8@hotmail.com', '2002-04-12', '', 'Portugal', '15383988', '255958200', 'O+', '10º Ano', '', '', '2018-10-05', '', '', '1', '277', '58', null, '1', null);
INSERT INTO `Entidade` VALUES ('59', '1010992', 'João Miguel Silva Tavares Amador', '234871265', '966112266', 'familiaamador@sapo.pt', '2002-04-18', '', 'Portugal', '15619798', '241689988', 'O-', '9º Ano', '', '', '2018-11-14', '', '', '1', '204', '59', null, '0', null);
INSERT INTO `Entidade` VALUES ('60', '1010996', 'Pedro Nuno Arrojado Mendes', '', '968534960', 'Pedrito.Kikas@gmail.com', '2002-04-19', '', 'Portugal', '14903072', '241075041', '', '8º Ano', 'Diabetes - Dependente de Insulina-hipotinoidismo-eutirox75', '', '2018-10-05', '', '', '1', '133', '60', null, '1', null);
INSERT INTO `Entidade` VALUES ('61', '1063830', 'Miguel Figueiredo Moreira', '', '919548917', 'analuisa1382@hotmail.com', '2002-04-27', 'Aveiro', 'Portugal', '14939862', '255987455', '', '11º Ano', '', '', '2018-10-05', '', '', '1', '5', '61', null, '1', null);
INSERT INTO `Entidade` VALUES ('62', '1013090', 'Daniel Filipe Luz Figueiredo', '234842235', '910585591', 'daniel.figueiredo.cs@gmail.com', '2002-05-11', '', 'Portugal', '30465240', '246420618', 'O+', '10º Ano', '', '', '2018-10-05', '', '', '1', '46', '62', null, '1', null);
INSERT INTO `Entidade` VALUES ('63', '1010993', 'João Pedro Silva Sousa', '234188403', '967466925', 'joaops2007@hotmail.com', '2002-05-16', 'Estarreja', 'Portugal', '15831094', '242397271', 'A+', '9º Ano', '', '', '2018-10-05', '', '', '1', '99', '63', null, '1', null);
INSERT INTO `Entidade` VALUES ('64', '1010985', 'André Miguel Quingosta Jardim', '234286173', '968366373', '', '2002-05-18', '', 'Portugal', '14290608', '241386535', 'A+', '8º Ano', '', '', '2018-11-14', '', '', '1', '134', '64', null, '0', null);
INSERT INTO `Entidade` VALUES ('65', '1019391', 'Guilherme Manuel Pinho Barbosa', '256025335', '919734884', 'aldo-barbosa@sapo.pt', '2002-05-30', '', 'Portugal', '30515026', '242319971', 'A+', '7º Ano', '', '', '2017-11-13', '', '', '1', null, '65', null, '0', null);
INSERT INTO `Entidade` VALUES ('66', '1011988', 'Samuel Filipe Ferreira Ribeiro', '234847199', '963046510', 'samuribeiro@live.com.pt', '2002-07-26', '', 'Portugal', '30511919', '264423747', 'O+', '9º Ano', 'Asma', '', '2018-11-14', '', '', '1', '220', '66', null, '0', '1');
INSERT INTO `Entidade` VALUES ('67', '1077716', 'Racel Vitinho Cleofas Vasco', '', '963952471', 'vitinhoqueiros@hotmail.com', '2002-08-04', 'Moçambique', 'Portugal', 'AB24003', '000000010', '', '10º Ano', '', '', '2018-10-05', '', '', '1', '50', '67', null, '1', null);
INSERT INTO `Entidade` VALUES ('68', '1010990', 'Gonçalo Miguel Rodrigues Soutinho', '', '965617779', 'pcesarco@gmail.com', '2002-09-12', '', 'Portugal', '15350570', '245322604', '', '9º Ano', '', '', '2018-11-14', '', '', '1', '104', '68', null, '0', null);
INSERT INTO `Entidade` VALUES ('69', '1042600', 'Gonçalo José Santos Amaral', '', '914993701', 'gjsamaral@gmail.com', '2002-09-21', 'Ovar', 'Portugal', '30805461', '248193600', 'O+', '9º Ano', '', '', '2018-11-14', '', '', '1', '78', '69', null, '0', null);
INSERT INTO `Entidade` VALUES ('70', '1013718', 'Gonçalo Ferreira Oliveira', '', '968769581', 'aafonsomo@hotmail.com', '2002-10-07', '', 'Portugal', '30512540', '244558981', 'Arh+', '8º Ano', '', '', '2017-11-13', '', '', '1', null, '70', null, '0', null);
INSERT INTO `Entidade` VALUES ('71', '1107635', 'Orlando Miguel Maia Dias', '', '910196931', '', '2002-10-22', '', 'Portugal', '14602730', '242464068', 'O+', '6º Ano', '', '', '2018-10-05', '', '', '1', '66', '71', null, '1', null);
INSERT INTO `Entidade` VALUES ('72', '1010998', 'Tomás Rafael Marques Santos ', '234849105', '963466632', 'ivetesantos@netvisao.pt', '2002-10-22', '', 'Portugal', '30221991', '242821898', 'O+', '8º Ano', '', '', '2018-10-05', '', '', '1', '119', '72', null, '1', null);
INSERT INTO `Entidade` VALUES ('73', '1010989', 'Duarte de Freitas Garrido', '', '', '', '2002-12-04', '', 'Portugal', '14734054', '249788560', 'O+', '10º Ano', 'alergia(acaros, feijão verde, alho francês, pessego)', '', '2018-10-05', '', '', '1', '77', '73', null, '1', null);
INSERT INTO `Entidade` VALUES ('74', '1013717', 'Francisco José da Silva Almeida', '234844634', '918600504', 'anaalmeida36@hotmail.com', '2002-12-10', '', 'Portugal', '30512969', '255297041', 'A+', '8º Ano', '', '', '2017-11-13', '', '', '1', null, '74', null, '0', null);
INSERT INTO `Entidade` VALUES ('75', '000020', 'Tiago Rafael Matos Cunha', '', '918188825', 'tiago.rafaelcunha@gmail.com', '2003-01-16', '', 'Portugal', '30673648', '274997495', '', '7º Ano', '', '', '2017-11-13', '', '', '1', null, '75', null, '0', null);
INSERT INTO `Entidade` VALUES ('76', '000021', 'Vitor Emanuel Rodrigues', '234849137', '917505895', 'vitorbatista200@hotmail.com', '2003-02-07', '', 'Portugal', '15475458', '244777349', '', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '76', null, '0', null);
INSERT INTO `Entidade` VALUES ('77', '000022', 'Hugo Daniel Valente Pinto', '', '966810223', '', '2003-03-13', '', 'Portugal', '30803168', '274802716', '', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '77', null, '0', null);
INSERT INTO `Entidade` VALUES ('78', '1082794', 'João Pedro Fonseca Alves', '968493774', '917961603', 'joao.pedro2003@hotmail.com', '2003-04-07', '', 'Portugal', '15286398', '276006070', '', '9º Ano', '', '', '2018-11-29', '', '', '1', '48', '78', null, '0', null);
INSERT INTO `Entidade` VALUES ('79', '1052773', 'Paulo Alexandre Matos Gonçalo', '256065683', '911795078', 'paulogoncalo@hotmail.com', '2003-06-16', '', 'Portugal', '30841769', '248719513', 'O+', '9º Ano', '', '', '2018-10-05', '', '', '1', '94', '79', null, '1', '1');
INSERT INTO `Entidade` VALUES ('80', '1035464', 'Miguel da Silva Matos', '234849297', '925582969', '', '2003-06-26', '', 'Portugal', '30577395', '246201789', '', '6º Ano', '', '', '2018-10-05', '', '', '1', '115', '80', null, '1', null);
INSERT INTO `Entidade` VALUES ('81', '1035460', 'José Rodrigo Gouveia Bandeira', '', '915450636', 'rodrigobandeiracde@hotmail.com', '2003-07-11', 'Portugal', 'Portugal', '30586309', '246670690', '', '9º Ano', '', '', '2018-10-05', '', '', '1', '118', '81', null, '1', null);
INSERT INTO `Entidade` VALUES ('82', '1104571', 'Gonçalo Alexandre Rebelo Almeida', '', '965343295', '', '2003-07-17', '', 'Portugal', '30682592', '267596413', '', '7º Ano', '', '', '2018-10-05', '', '', '1', '16', '82', null, '1', null);
INSERT INTO `Entidade` VALUES ('83', '1104577', 'Miguel Alexandre Rebelo Almeida', '', '965343295', '', '2003-07-17', '', 'Portugal', '30682536', '267596618', 'O+', '7º Ano', '', '', '2018-10-05', '', '', '1', '15', '83', null, '1', null);
INSERT INTO `Entidade` VALUES ('84', '000023', 'Daniel José Formigo Bastos', '', '919291093', 'p_formigo_123@hotmail.com', '2003-07-28', '', 'Portugal', '30821833', '244709700', 'A', '7º Ano', '', '', '2017-11-13', '', '', '1', null, '84', null, '0', null);
INSERT INTO `Entidade` VALUES ('85', '1013026', 'Bruno Alexandre Vidinha dos Santos', '', '911167756', '', '2003-08-03', '', 'Portugal', '30506376', '262103745', '', '7º Ano', '', '', '2017-08-14', '', '', '1', '21', '85', null, '1', null);
INSERT INTO `Entidade` VALUES ('86', '1035449', 'André Manuel Bandeira Neves', '234288463', '910334255', 'eugenia_maria@sapo.pt', '2003-09-04', '', 'Portugal', '30586652', '269830510', 'A+', '8º Ano', '', '', '2018-11-14', '', '', '1', '106', '86', null, '0', null);
INSERT INTO `Entidade` VALUES ('87', '1035478', 'Jorge Manuel Oliveira Soares', '', '915418586', '', '2003-09-10', '', 'Portugal', '15730219', '245025510', 'B+', '7º Ano', '', '', '2017-11-13', '', '', '1', null, '87', null, '0', null);
INSERT INTO `Entidade` VALUES ('88', '1035245', 'Rodrigo Silva Soares', '256691225', '', 'seraos.rodrigo@gmail.com', '2003-09-14', '', 'Portugal', '15514109', '245779388', '', '10º Ano', '', '', '2018-10-05', '', '', '1', '26', '88', null, '1', null);
INSERT INTO `Entidade` VALUES ('89', '1078055', 'Justino Luís Martins Oliveira', '234282625', '968893463', '', '2003-09-19', '', 'Portugal', '14553275', '246357274', '', '6º Ano', '', '', '2017-11-13', '', '', '1', null, '89', null, '0', null);
INSERT INTO `Entidade` VALUES ('90', '1035250', 'Tomás Manuel da Costa Gomes Fernandes', '234867872', '913464807', 'tkf855071@gmail.com', '2003-10-18', '', 'Portugal', '14815087', '260330310', '', '8ª Ano', '', '', '2018-10-05', '', '', '1', '59', '90', null, '1', null);
INSERT INTO `Entidade` VALUES ('91', '1035479', 'Sérgio Miguel da Silva Valente', '234843569', '', '', '2003-11-04', '', 'Portugal', '30586705', '246438851', '', '7º Ano', '', '', '2017-11-13', '', '', '1', null, '91', null, '0', null);
INSERT INTO `Entidade` VALUES ('92', '1046447', 'Miguel Aleixo Vieira', '', '964817896', '', '2003-11-14', '', 'Portugal', '14762874', '246691000', 'A+', '7º Ano', '', '', '2018-10-05', '', '', '1', '11', '92', null, '1', '1');
INSERT INTO `Entidade` VALUES ('93', '1020410', 'Sérgio Miguel de Oliveira Resende', '234289661', '916040028', 'sdosilva@creditoagricola.pt', '2003-12-11', '', 'Portugal', '30504077', '245695311', '', '9º Ano', '', '', '2018-10-05', '', '', '1', '27', '93', null, '1', null);
INSERT INTO `Entidade` VALUES ('94', '1064019', 'João Vaz dos Ramos Alfredo', '', '926172507', '', '2004-01-17', '', 'São Tomé e Princípe', '99043487', '269717064', 'O', '', '', '', '2017-11-13', '', '', '1', null, '94', null, '0', null);
INSERT INTO `Entidade` VALUES ('95', '1053095', 'João Miguel Oliveira Pinto Silva', '', '917596138', 'isa_silva75@sapo.pt', '2004-01-20', '', 'Portugal', '30779891', '250258323', '', '6º Ano', '', '', '2017-11-13', '', '', '1', null, '95', null, '0', null);
INSERT INTO `Entidade` VALUES ('96', '1055726', 'Bernardo Alfredo Quinta Bastos', '234190457', '965570385', 'amdb38@hotmail.com', '2004-01-24', '', 'Portugal', '30717917', '268255512', 'A-', '6º Ano', 'Rim esq. Dilatado…', '', '2017-11-13', '', '', '1', null, '96', null, '0', null);
INSERT INTO `Entidade` VALUES ('97', '1162991', 'Rita da Silva Montenegro', '234086886', '914014394', '', '2004-04-03', '', 'Portugal', '30196313', '249285150', 'O+', '6º Ano', '', '', '2018-11-14', '', '', '1', '74', '97', null, '0', null);
INSERT INTO `Entidade` VALUES ('98', '1052986', 'Afonso Domingues Freire', '', '', '', '2004-04-17', '', 'Portugal', '30295436', '247084662', 'O+', '5º Ano', '', '', '2018-11-14', '', '', '1', '112', '98', null, '0', null);
INSERT INTO `Entidade` VALUES ('99', '1053223', 'Rodrigo Salgado Rebelo', '234542124', '932891788', '', '2004-04-27', '', 'Portugal', '30820850', '250613791', 'ORH+', '', '', '', '2018-10-06', '', '', '1', '44', '99', null, '1', null);
INSERT INTO `Entidade` VALUES ('100', '1053005', 'Diogo Filipe Almeida Ferreira', '234087922', '911119260', 'fmcferreira@msn.com', '2004-05-07', '', 'Portugal', '30837131', '253551820', '', '7º Ano', '', '', '2018-11-14', '', '', '1', '166', '100', null, '0', '1');
INSERT INTO `Entidade` VALUES ('101', '1053086', 'Gonçalo Oliveira Sacadura Botte', '', '912893410', '', '2004-05-25', '', 'Portugal', '30710926', '258470267', '', '8º Ano', '', '', '2018-10-06', '', '', '1', '125', '101', null, '1', null);
INSERT INTO `Entidade` VALUES ('102', '1053200', 'Miguel da Silva Oliveira', '', '912885352', '', '2004-03-27', '', 'Portugal', '30709192', '270398830', 'A+', '8º Ano', '', '', '2018-10-06', '', '', '1', '164', '102', null, '1', null);
INSERT INTO `Entidade` VALUES ('103', '1052998', 'Daniel José Jesus Teixeira', '', '912286939', '', '2004-06-03', '', 'Portugal', '15395600', '275056287', 'B+', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '103', null, '0', null);
INSERT INTO `Entidade` VALUES ('104', '1046430', 'Diogo da Fonseca Pereira', '234881114', '', 'antoniopereira8@hotmail.com', '2004-06-05', '', 'Portugal', '15062888', '248733320', '', '6º Ano', '', '', '2018-11-14', '', '', '1', '67', '104', null, '0', null);
INSERT INTO `Entidade` VALUES ('105', '1053229', 'Tiago Pontes Cunha', '', '961526804', 'tiguicunha2004@hotmail.com', '2004-06-15', '', 'Portugal', '15043161', '249691507', 'O-', '8º Ano', 'Asma', '', '2018-10-06', '', '', '1', '63', '105', null, '1', null);
INSERT INTO `Entidade` VALUES ('106', '1053159', 'Marco Aurélio Soares Pinho', '', '916468514', '27079@ufp.edu.pt', '2004-06-29', '', 'Portugal', '30233665', '269021477', 'A-', '6º Ano', '', '', '2017-11-13', '', '', '1', null, '106', null, '0', null);
INSERT INTO `Entidade` VALUES ('107', '1055723', 'João Rafael Matos Carvalho', '', '917029142', '', '2004-07-05', '', 'Portugal', '15738064', '273748254', '', '7º Ano', '', '', '2018-10-06', '', '', '1', '101', '107', null, '1', null);
INSERT INTO `Entidade` VALUES ('108', '1053162', 'Mário Manuel Ruela Valente', '234855106', '927224741', 'marioruela321@gmail.com', '2004-07-07', '', 'Portugal', '14764479', '249421348', 'A+', '9º Ano', '', '', '2018-10-06', '', '', '1', '22', '108', null, '1', null);
INSERT INTO `Entidade` VALUES ('109', '1053206', 'Pedro Emanuel Silva Vieira', '', '', '', '2004-07-11', '', 'Portugal', '30026039', '250339862', '', '8º Ano', '', '', '2018-10-06', '', '', '1', '43', '109', null, '1', null);
INSERT INTO `Entidade` VALUES ('110', '1055725', 'Gonçalo Machado Almeida', '256598186', '', '', '2004-10-14', '', 'Portugal', '159767787', '266543570', 'A+', '7º Ano', '', '', '2018-11-14', '', '', '1', '53', '110', null, '0', null);
INSERT INTO `Entidade` VALUES ('111', '1053091', 'Guilherme Miguel Rebelo e Silva ', '234849678', '964395083', 'carlasilvarebelo@gmail.com', '2004-10-19', '', 'Portugal', '30148452', '251234363', 'A+', '', '', '', '2018-11-14', '', '', '1', '29', '111', null, '0', null);
INSERT INTO `Entidade` VALUES ('112', '1053011', 'Diogo Soares Castro ', '', '', '', '2004-11-19', '', 'Portugal', '30475817', '250324032', '', '6º Ano', '', '', '2017-08-28', '', '', '1', '37', '112', null, '1', null);
INSERT INTO `Entidade` VALUES ('113', '1055722', 'Renato Pinto Correia ', '', '', '', '2004-11-20', '', 'Portugal', '30308036', '251677427', 'O+', '6º Ano', '', '', '2018-11-14', '', '', '1', '126', '113', null, '0', '1');
INSERT INTO `Entidade` VALUES ('114', '1053019', 'Duarte Miguel Couto da Silva Mendonça', '234199988', '913066760', '', '2004-11-24', '', 'Portugal', '30202375', '257214062', 'A-', '5º Ano', '', '', '2018-11-14', '', '', '1', '195', '114', null, '0', null);
INSERT INTO `Entidade` VALUES ('115', '1128216', 'João Pedro Moreno da Silva', '256109987', '', 'JOAOPEDROMORENO2005@HOTMAIL.COM', '2005-02-09', '', 'Portugal', '30602901', '273484613', 'O+', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '115', null, '0', null);
INSERT INTO `Entidade` VALUES ('116', '1083915', 'Lourenço Pereira Mendes', '234847346', '961103878', '', '2005-02-26', 'Amarante', 'Portugal', '31086353', '251702286', '', '5º Ano', '', '', '2018-11-14', '', '', '1', '143', '116', null, '0', null);
INSERT INTO `Entidade` VALUES ('117', '1083918', 'Pedro dos Santos Cunha', '234869171', '966514138', 'ncunha78@gmail.com', '2005-03-06', '', 'Portugal', '30697779', '254612563', 'A-', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '117', null, '0', null);
INSERT INTO `Entidade` VALUES ('118', '1083912', 'João Pedro Oliveira Marques', '', '965248811', 'pierres.silva@gmail.com', '2005-03-22', '', 'Portugal', '31093474', '257261753', '', '6º Ano', '', '', '2018-10-06', '', '', '1', '65', '118', null, '1', null);
INSERT INTO `Entidade` VALUES ('119', '1083913', 'João Pedro Silva Tavares Lopes Mendes', '234841364', '967072685', '', '2005-03-30', '', 'Portugal', '15059756', '252209214', 'O+', '6º Ano', '', '', '2018-10-06', '', '', '1', '81', '119', null, '1', null);
INSERT INTO `Entidade` VALUES ('120', '1083914', 'João da Silva Fernandes', '234182718', '', '', '2005-05-24', '', 'Portugal', '30467165', '254414567', '', '', '', '', '2018-10-06', '', '', '1', '127', '120', null, '1', null);
INSERT INTO `Entidade` VALUES ('121', '1104567', 'Renato Miguel Silva Matos', '914993645', '918980315', '', '2005-05-31', '', 'Portugal', '15535134', '262116073', '', '5º Ano', '', '', '2018-10-06', '', '', '1', '109', '121', null, '1', null);
INSERT INTO `Entidade` VALUES ('122', '1083923', 'Simão de Oliveira Resende', '234289661', '916040028', 'sdosilva@creditoagricola.pt', '2005-05-31', '', 'Portugal', '30688889', '253062926', '', '8º Ano', '', '', '2018-10-06', '', '', '1', '28', '122', null, '1', null);
INSERT INTO `Entidade` VALUES ('123', '1083925', 'Simão Pita Pereira', '234865319', '965856064', '', '2005-06-15', 'Murtosa', 'Portugal', '31077977', '261081179', '', '7º Ano', '', '', '2018-10-06', '', '', '1', '142', '123', null, '1', null);
INSERT INTO `Entidade` VALUES ('124', '1083927', 'Tiago Santos Alves', '234867320', '912112335', '', '2005-06-16', '', 'Portugal', '15267470', '258975474', 'A+', '', '', '', '2018-10-06', '', '', '1', '144', '124', null, '1', null);
INSERT INTO `Entidade` VALUES ('125', '000015', 'Diogo Henriques Paiva Sardo', '', '', '', '2005-06-23', '', 'Portugal', '15598453', '255261853', 'A Rh+', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '125', null, '0', null);
INSERT INTO `Entidade` VALUES ('126', '000016', 'Tiago Vasconcelos de Mira Serrano', '234869226', '962901818', 'paula-vasconcelos@sapo.pt', '2005-06-25', '', 'Portugal', '30139777', '260871516', 'ORH+', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '126', null, '0', null);
INSERT INTO `Entidade` VALUES ('127', '1083904', 'António Antão Santos', '', '939778232', 'antonio.antao.santos@gmail.com', '2005-08-01', '', 'Portugal', '30955238', '255247168', 'ORH+', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '127', null, '0', null);
INSERT INTO `Entidade` VALUES ('128', '1083926', 'Tiago André Rodrigues Soares', '', '918378090', '', '2005-09-14', '', 'Portugal', '15381725', '257810978', '', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '128', null, '0', null);
INSERT INTO `Entidade` VALUES ('129', '1083920', 'Rodrigo da Silva Marques', '', '919834536', '', '2005-09-23', '', 'Portugal', '30738169', '268644926', 'A+', '7º Ano', '', '', '2018-10-06', '', '', '1', '239', '129', null, '1', null);
INSERT INTO `Entidade` VALUES ('130', '1176010', 'Diogo dos Santos Oliveira e Silva', '', '968237285-936656794', '', '2005-09-29', '', 'Portugal', '31514640', '276098617', '', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '130', null, '0', null);
INSERT INTO `Entidade` VALUES ('131', '1083905', 'Daniel Alexandre Ventura Soares', '', '966931340', 'qidosdany@sapo.pt', '2005-10-04', 'Murtosa', 'Portugal', '30725576', '254873243', '', '6º Ano', '', '', '2018-11-14', '', '', '1', '163', '131', null, '0', null);
INSERT INTO `Entidade` VALUES ('132', '000018', 'Tiago Rafael Resende Rodrigues', '', '914032203', '', '2005-10-08', '', 'Portugal', '15826626', '000000000', '', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '132', null, '0', null);
INSERT INTO `Entidade` VALUES ('133', '000019', 'David Antunes Silva', '234847090', '960466940', '', '2005-10-18', '', 'Portugal', '30312389', '255186415', '', '5º Ano', '', '', '2017-11-13', '', '', '1', null, '133', null, '0', null);
INSERT INTO `Entidade` VALUES ('134', '1083919', 'Rodrigo da Silva Fima', '234291127', '910397752', '', '2005-12-11', 'Murtosa', 'Portugal', '30472354', '271295325', '', '5º Ano', '', '', '2018-10-06', '', '', '1', '54', '134', null, '1', null);
INSERT INTO `Entidade` VALUES ('135', '1083906', 'Ivan Miguel da Silva Fonseca', '', '914806835', '', '2005-12-21', '', 'Portugal', '30814434', '255510195', 'A+', '6º Ano', '', '', '2018-11-14', '', '', '1', '123', '135', null, '0', null);
INSERT INTO `Entidade` VALUES ('136', '1167013', 'Tomás Lopes Almeida', '234871120', '936792894', '', '2006-01-31', '', 'Portugal', '15075628', '258597631', 'A+', '', '', '', '2018-10-09', '', '', '1', '196', '136', null, '1', null);
INSERT INTO `Entidade` VALUES ('137', '1100679', 'Pedro Rafael Oliveira Marques', '234849086-234025741', '963095802', '', '2006-02-20', '', 'Portugal', '30513291', '260155284', '', '6º Ano', '', '', '2018-10-09', '', '', '1', '199', '137', null, '1', null);
INSERT INTO `Entidade` VALUES ('138', '1114540', 'João Manuel Soares Pereira', '234871038', '918161665', '', '2006-02-21', '', 'Portugal', '30905495', '256236410', 'O+', '', '', '', '2017-06-30', '', '', '1', null, '138', null, '0', null);
INSERT INTO `Entidade` VALUES ('139', '1114547', 'Rodrigo Costeira Almeida', '234483459', '912407156', '', '2006-02-24', '', 'Portugal', '30196564', '256520011', 'O-', '4º Ano', '', '', '2019-01-15', '', '', '1', '102', '139', null, '1', null);
INSERT INTO `Entidade` VALUES ('140', '1102768', 'Diogo Bernardo de Almeida', '234186724', '967785515', '', '2006-03-02', '', 'Portugal', '30957624', '256038880', '', '5º Ano', '', '', '2018-08-31', '', '', '1', '186', '140', null, '0', null);
INSERT INTO `Entidade` VALUES ('141', '1102780', 'Pedro Carvalho Oliveira', '', '928021215', 'pedroco06@gmail.com', '2006-03-04', 'Estarreja', 'Portugal', '30509141', '256011508', 'B-', '5º Ano', '', 'Estudante', '2018-12-04', 'uploads/011d1b4c87.jpg', '', '1', '39', '141', null, '1', '4');
INSERT INTO `Entidade` VALUES ('142', '1114541', 'Miguel Moreira Malafaia', '', '916817156', '', '2006-04-04', '', 'Portugal', '30645200', '274126400', 'AB+', '4º Ano', '', '', '2018-10-09', '', '', '1', '95', '142', null, '1', null);
INSERT INTO `Entidade` VALUES ('143', '1102775', 'Hugo Miguel Barroqueiro Dias', '', '', '', '2006-05-03', '', 'Portugal', '30051311', '262996014', 'A+', '6º Ano', '', '', '2017-08-14', '', '', '1', '25', '143', null, '1', null);
INSERT INTO `Entidade` VALUES ('144', '1102786', 'Simão Azevedo Cruz', '234841401', '962847549', '', '2006-05-05', '', 'Portugal', '30252783', '258955244', 'O+', '4º Ano', '', '', '2018-10-09', '', '', '1', '51', '144', null, '1', null);
INSERT INTO `Entidade` VALUES ('145', '1102773', 'Gonçalo Miguel da Silva Rodrigues', '', '934880186', '', '2006-05-18', '', 'Portugal', '30705196', '271417358', 'O+', '6º Ano', 'Bronquite asmatica', '', '2018-10-09', '', '', '1', '47', '145', null, '1', null);
INSERT INTO `Entidade` VALUES ('146', '1100680', 'Santiago Sousa Fernandes', '', '965659622', '', '2006-06-09', '', 'Portugal', '30465688', '256990700', 'O+', '6º Ano', '', '', '2018-10-09', '', '', '1', '82', '146', null, '1', null);
INSERT INTO `Entidade` VALUES ('147', '1102781', 'Samuel Pereira de Sousa ', '234866455', '', '', '2006-06-27', '', 'Portugal', '15887860', '258626496', '', '7º Ano', '', '', '2018-10-09', '', '', '1', '116', '147', null, '1', null);
INSERT INTO `Entidade` VALUES ('148', '1133580', 'João Pedro da Cruz Tavares', '', '', 'cruz.jp.2006@gmail.com', '2006-07-24', '', 'Portugal', '30296774', '257544631', '', '7º Ano', 'Auditivo (não houve a 100/)', '', '2018-10-09', '', '', '1', '117', '148', null, '1', null);
INSERT INTO `Entidade` VALUES ('149', '1102770', 'Duarte Rodriguez Oliveira', '234114399', '918381280', 'andre.oliveira@cm-estarreja.pt', '2006-07-25', 'Beduído', 'Portugal', '15304383', '257263241', '', '4º Ano', '', '', '2018-10-09', '', '', '1', '150', '149', null, '1', null);
INSERT INTO `Entidade` VALUES ('150', '1102743', 'António Gabriel Henriques da Silva Gonçalves', '', '', '', '2006-08-04', '', 'Portugal', '31260348', '260864528', '', '5º Ano', '', '', '2018-10-09', '', '', '1', '187', '150', null, '1', null);
INSERT INTO `Entidade` VALUES ('151', '1102746', 'Alexandre Miguel Aguiar Domingues de Sá Esteves', '', '966046398', '', '2006-08-15', '', 'Portugal', '30477130', '271312793', 'B/RH+', '6º Ano', '', '', '2018-10-09', '', '', '1', '2', '151', null, '1', null);
INSERT INTO `Entidade` VALUES ('152', '999999', 'João Carlos da Silva Valente', '234196683', '916945831', '', '2006-08-29', '', 'Portugal', '30838023', '259188883', '', '4º Ano', '', '', '2017-06-30', '', '', '1', null, '152', null, '0', null);
INSERT INTO `Entidade` VALUES ('153', '1114543', 'Nuno Miguel Vaz Pinho', '', '918943222', 'nunomiguelvazpinho@hotmail.com', '2006-09-03', '', 'Portugal', '30311423', '267308396', '', '6º Ano', 'alergias ao polen, pelos de animais e ao sol', '', '2018-10-09', '', '', '1', '88', '153', null, '1', null);
INSERT INTO `Entidade` VALUES ('154', '1114537', 'Dinis Machado Viana', '', '', '', '2006-09-15', '', 'Portugal', '30971387', '274013401', '', '4º Ano', 'conjuntivite alergica', '', '2018-10-09', '', '', '1', '105', '154', null, '1', null);
INSERT INTO `Entidade` VALUES ('155', '1133581', 'José Dinis Couto Valente Lacerda de Oliveira', '', '', '', '2006-09-26', '', 'Portugal', '31335817', '275229963', '', '4º Ano', 'Rinite Alérgica ', '', '2017-08-10', '', '', '1', null, '155', null, '0', null);
INSERT INTO `Entidade` VALUES ('156', '1102750', 'César Augusto Marques Soares', '234185919', '962767911', '', '2006-10-12', 'Beduido', 'Portugal', '31096999', '258120274', 'A-', '5º Ano', '', '', '2018-10-09', '', '', '1', '52', '156', null, '1', '1');
INSERT INTO `Entidade` VALUES ('157', '1107249', 'Vasco Ramos Pereira', '964790407', '964460989', 'vasquinhoramos@gmail.com', '2006-12-05', '', 'Portugal', '30606893', '258621940', 'A-', '6º Ano', '', '', '2018-10-09', '', '', '1', '64', '157', null, '1', null);
INSERT INTO `Entidade` VALUES ('158', '1114545', 'Ricardo Fonseca Oliveira', '234842904', '918379538', '', '2006-12-07', '', 'Portugal', '30077303', '258509902', '', '4º Ano', '', '', '2018-10-09', '', '', '1', '113', '158', null, '1', '1');
INSERT INTO `Entidade` VALUES ('159', '1114534', 'Afonso Fernandes da Silva', '', '', '', '2006-12-13', '', 'Portugal', '30994035', '258836989', 'O+', '6º Ano', '', '', '2018-10-09', '', '', '1', '108', '159', null, '1', null);
INSERT INTO `Entidade` VALUES ('160', '1114538', 'João Fernandes da Silva', '', '', '', '2006-12-13', '', 'Portugal', '31005096', '258836580', 'O+', '6º Ano', 'Bronquite asmatica', '', '2018-10-09', '', '', '1', '107', '160', null, '1', null);
INSERT INTO `Entidade` VALUES ('161', '1143062', 'Gonçalo Miranda Faria', '234189050', '', '', '2007-01-05', '', 'Portugal', '30562463', '258939583', 'O+', '3º Ano', '', '', '2018-10-09', '', '', '1', '211', '161', null, '1', null);
INSERT INTO `Entidade` VALUES ('162', '1143035', 'Afonso José Silva Costa', '234547060', '969302551', '', '2007-01-17', '', 'Portugal', '30064619', '261996479', 'ARH+', '3º Ano', '', '', '2018-10-10', '', '', '1', '71', '162', null, '1', null);
INSERT INTO `Entidade` VALUES ('163', '1143037', 'Bernardo Martim Melo Soares', '234855637', '965815758', '', '2007-02-12', '', 'Portugal', '30522710', '265414920', '', '4º Ano', '', '', '2018-11-14', '', '', '1', '73', '163', null, '0', null);
INSERT INTO `Entidade` VALUES ('164', '1143071', 'João Tiago Paiva Mendonça', '', '967123286', '', '2007-02-18', '', 'Portugal', '31232273', '261070444', 'A+', '4º Ano', '', '', '2017-11-09', '', '', '1', '72', '164', null, '0', null);
INSERT INTO `Entidade` VALUES ('165', '1167021', 'João José da Silva Pereira Macedo', '', '964748288', 'luismanuel@sapo.pt', '2007-03-07', '', 'Portugal', '30565008', '263716058', 'O RH+', '', 'operado ao coração em 2011-sem restrições para o desporto', '', '2017-11-09', '', '', '1', null, '165', null, '0', null);
INSERT INTO `Entidade` VALUES ('166', '1143064', 'Ivo Samuel Rodrigues Sousa', '', '964701922', 'iasousa24@sapo.pt', '2007-03-13', '', 'Portugal', '30625356', '274123762', '', '3º Ano', '', '', '2017-11-09', '', '', '1', null, '166', null, '0', null);
INSERT INTO `Entidade` VALUES ('167', '1143036', 'Bernardo António Brandão Paradela Santos', '', '', '', '2007-03-21', '', 'Portugal', '31515998', '274160030', '', '4º Ano', '', '', '2017-11-09', '', '', '1', null, '167', null, '0', null);
INSERT INTO `Entidade` VALUES ('168', '1143080', 'Tiago Bastos Pinto ', '', '', '', '2007-03-23', '', 'Portugal', '31093678', '262011212', 'A+', '5º Ano', '', '', '2018-10-10', '', '', '1', '80', '168', null, '1', null);
INSERT INTO `Entidade` VALUES ('169', '1143066', 'João Pedro Medina Antunes Tomé', '234842429', '919772960', '', '2007-03-26', 'Beduído', 'Portugal', '31200511', '260261386', 'O+', '5º Ano', '', '', '2018-10-10', '', '', '1', '23', '169', null, '1', '1');
INSERT INTO `Entidade` VALUES ('170', '1143029', 'Afonso Miguel Pereira Vidal', '', '917563600', '', '2007-03-29', '', 'Portugal', '30099269', '268518896', '', '2º Ano', '', '', '2018-11-14', '', '', '1', '180', '170', null, '0', null);
INSERT INTO `Entidade` VALUES ('171', '1151278', 'Rossano Santos Lopes', '234082987', '915761334', '', '2007-03-31', 'Coimbra', 'Portugal', '31418680', '259981745', '', '3º Ano', '', '', '2018-10-10', '', '', '1', '179', '171', null, '1', null);
INSERT INTO `Entidade` VALUES ('172', '1143077', 'Martim Dinis Resende Pinto', '', '966967756', 'pintomepr@gmail.com', '2007-04-03', '', 'Portugal', '15689234', '260456390', '', '3º Ano', 'asma/alergica', '', '2018-10-09', '', '', '1', '122', '172', null, '1', null);
INSERT INTO `Entidade` VALUES ('173', '1143058', 'Duarte Marques Figueiredo ', '', '', '', '2007-04-11', '', 'Portugal', '15976521', '259684996', '', '2º Ano', '', '', '2018-10-09', '', '', '1', '60', '173', null, '1', null);
INSERT INTO `Entidade` VALUES ('174', '1143074', 'Lourenço Antão Santos', '', '', 'Lourencoantaosantos@gmail.com', '2007-05-15', 'Porto', 'Portugal', '30954244', '260097489', 'A+', '5º Ano', '', '', '2018-10-10', '', '', '1', '189', '174', null, '1', null);
INSERT INTO `Entidade` VALUES ('175', '1167022', 'João Paulo Oliveira Penajóia', '234865930', '966641693', 'paulopenajoia@hotmail.com', '2007-05-27', '', 'Portugal', '15798256', '261046772', '', '6º Ano', '', '', '2018-10-10', '', '', '1', '8', '175', null, '1', null);
INSERT INTO `Entidade` VALUES ('176', '1143041', 'Bruno Emanuel Vieira Ruela', '234185708', '', '', '2007-05-29', '', 'Portugal', '30516882', '271989840', '', '3º Ano', '', '', '2018-11-14', '', '', '1', '91', '176', null, '0', null);
INSERT INTO `Entidade` VALUES ('177', '1143038', 'Bernardo Montenegro Oliveira ', '', '935424440', '', '2007-06-08', '', 'Portugal', '15830232', '264688988', '', '3º Ano', '', '', '2018-11-14', '', '', '1', '13', '177', null, '0', null);
INSERT INTO `Entidade` VALUES ('178', '1167019', 'Guilherme Camões Carinha da Silva', '', '925040528', '', '2007-06-20', 'Salreu', 'Portugal', '310132205', '261073923', 'A+', '5º Ano', '', '', '2018-10-10', '', '', '1', '97', '178', null, '1', null);
INSERT INTO `Entidade` VALUES ('179', '1143032', 'António André Padinha Rebelo', '234867918', '910568595', '', '2007-07-08', '', 'Portugal', '30673418', '274991748', '', '3º Ano', '', '', '2018-11-14', '', '', '1', '4', '179', null, '0', null);
INSERT INTO `Entidade` VALUES ('180', '1143042', 'David Valente Henriques', '', '934577016', 'davidhen2007@icloud.com', '2007-10-23', '', 'Portugal', '15500517', '261823256', 'A+', '4º Ano', '', '', '2018-10-10', '', '', '1', '227', '180', null, '1', null);
INSERT INTO `Entidade` VALUES ('181', '1148224', 'Xavier Gomes Gonçalves', '', '', '', '2007-11-12', '', 'Portugal', '15510835', '262457610', 'O+', '4º Ano', '', '', '2018-10-10', '', '', '1', '89', '181', null, '1', null);
INSERT INTO `Entidade` VALUES ('182', '000014', 'Gonçalo Soares dos Reis', '', '', '', '2008-03-04', '', 'Portugal', '000', '000000000', 'RH O+', '2º Ano', '', '', '2017-07-04', '', '', '1', null, '182', null, '0', null);
INSERT INTO `Entidade` VALUES ('183', '1172180', 'João Ricardo Silva Rodrigues', '', '965241700', '', '2008-03-13', '', 'Portugal', '15614090', '263370836', '', '2º Ano', '', '', '2017-11-09', '', '', '1', null, '183', null, '0', null);
INSERT INTO `Entidade` VALUES ('184', '1172209', 'Rúben Santos Teques', '', '', '', '2008-03-19', '', 'Portugal', '15615683', '262983346', '', '4º Ano', '', '', '2018-10-10', '', '', '1', '12', '184', null, '1', null);
INSERT INTO `Entidade` VALUES ('185', '1172203', 'Rafael Castro e Silva', '', '914041932', 'soniacosmeticos@sapo.pt', '2008-07-08', '', 'Portugal', '15719538', '266493610', 'B+', '3º Ano', '', '', '2017-08-28', '', '', '1', '139', '185', null, '0', null);
INSERT INTO `Entidade` VALUES ('186', '1172204', 'Ricardo Miguel Matos Barbosa', '', '916262313', 'miguelsotam@gmail.com', '2008-07-29', '', 'Portugal', '15743865', '269376674', '', '4º Ano', '', '', '2018-11-15', '', '', '1', '9', '186', null, '0', null);
INSERT INTO `Entidade` VALUES ('187', '1172148', 'Diogo Alexandre Duarte da Silva', '', '967238197', '', '2008-08-06', '', 'Portugal', '15750644', '269590382', '', '2º Ano', '', '', '2018-11-15', '', '', '1', '181', '187', null, '0', null);
INSERT INTO `Entidade` VALUES ('188', '1172164', 'Gabriel Filipe Silva Maia', '912626872', '912626072', '', '2008-08-19', '', 'Portugal', '15765786', '271358670', 'B+', '2º Ano', '', '', '2018-10-10', '', '', '1', '197', '188', null, '1', null);
INSERT INTO `Entidade` VALUES ('189', '1172198', 'Martim José Ferro Marques Couto', '234869496', '', '', '2008-09-01', '', 'Portugal', '15797872', '207404887', 'O+', '2º Ano', '', '', '2018-10-10', '', '', '1', '136', '189', null, '1', null);
INSERT INTO `Entidade` VALUES ('190', '1172211', 'Tomás Silva Pinheiro', '', '', '', '2008-09-01', '', 'Portugal', '15796665', '273966227', '', 'Pré-escola', '', '', '2018-10-10', '', '', '1', '294', '190', null, '1', null);
INSERT INTO `Entidade` VALUES ('191', '1172201', 'Martim Simões Almeida', '234181980', '966181072', '', '2008-09-03', '', 'Portugal', '15797729', '264634047', 'A+', 'Pré-escola', '', '', '2018-10-10', '', '', '1', '18', '191', null, '1', null);
INSERT INTO `Entidade` VALUES ('192', '1172171', 'João Pedro da Silva Pires', '', '', '', '2008-10-15', '', 'Portugal', '15832060', '265220009', 'O+', '1º Ano', '', '', '2018-10-10', '', '', '1', '61', '192', null, '1', null);
INSERT INTO `Entidade` VALUES ('193', '1172183', 'José Carlos Proença Teixeira', '234331058', '', '', '2008-11-13', '', 'Portugal', '30000255', '269924396', '', '2º Ano', '', '', '2018-10-10', '', '', '1', '19', '193', null, '1', null);
INSERT INTO `Entidade` VALUES ('194', '1172185', 'Lucas dos Santos Pereira Rosa', '234868000', '', '', '2008-11-18', '', 'Portugal', '15853326', '265697190', 'A+', '2º Ano', '', '', '2018-10-10', '', '', '1', '20', '194', null, '1', null);
INSERT INTO `Entidade` VALUES ('195', '1172199', 'Martim Ramos Nunes', '234869100', '968189202', '', '2008-12-13', '', 'Portugal', '15887412', '267027931', '', '4º Ano', '', '', '2018-10-10', '', '', '1', '170', '195', null, '1', null);
INSERT INTO `Entidade` VALUES ('196', '1185172', 'Martim Daniel Amador Ribeiro', '234848082', '', '', '2009-01-28', 'Estarreja', 'Portugal', '15912889', '265985790', '', '3º Ano', '', '', '2018-10-10', '', '', '1', '111', '196', null, '1', null);
INSERT INTO `Entidade` VALUES ('197', '1184742', 'Dinis de Noronha Freire Valente Garcia', '', '966214052', '', '2009-02-08', '', 'Portugal', '15966792', '266647529', '', '1º Ano', '', '', '2018-10-10', '', '', '1', '92', '197', null, '1', null);
INSERT INTO `Entidade` VALUES ('198', '1184744', 'Nuno Gonçalo Pupaza Mortágua', '', '', '', '2009-02-18', '', 'Portugal', '15928654', '266255116', '', '1º Ano', '', '', '2018-10-10', '', '', '1', '114', '198', null, '1', '1');
INSERT INTO `Entidade` VALUES ('199', '1185173', 'Miguel Tavares Ferreira', '234183440', '966788118', 'migueltferreira@netvisao.pt', '2009-03-26', 'Salreu', 'Portugal', '15950461', '266285147', 'A+', '1º Ano', '', '', '2017-08-16', '', '', '1', '31', '199', null, '1', null);
INSERT INTO `Entidade` VALUES ('200', '1184740', 'Gil Sacadura Botte da Fonseca', '234843012', '964823744', '', '2009-04-08', '', 'Portugal', '15961516', '266431020', '', '3º Ano', '', '', '2018-10-10', '', '', '1', '45', '200', null, '1', null);
INSERT INTO `Entidade` VALUES ('201', '1184739', 'Dinis José Figueiredo Tavares', '', '', '', '2009-04-25', '', 'Portugal', '15986592', '269662057', 'orh+', '3º Ano', '', '', '2018-10-10', '', '', '1', '36', '201', null, '1', null);
INSERT INTO `Entidade` VALUES ('202', '1185170', 'Lucas Miguel Silva Campos', '', '919214492', '', '2009-04-28', '', 'Portugal', '15988167', '270003266', '', '1º Ano', '', '', '2017-11-13', '', '', '1', null, '202', null, '0', null);
INSERT INTO `Entidade` VALUES ('203', '1185174', 'Paulo Bruno Nogueira Mano ', '234843355', '919670706', '', '2009-05-22', '', 'Portugal', '30034202', '268532656', '', 'Pré-escola', '', '', '2018-10-10', '', '', '1', '184', '203', null, '1', null);
INSERT INTO `Entidade` VALUES ('204', '1184750', 'Rodrigo Nunes Valente', '234086243', '961389331', 'evanunesvalente@gmail.com', '2009-06-15', '', 'Portugal', '30051627', '268427097', 'O-', '1º Ano', '', '', '2017-07-04', '', '', '1', null, '204', null, '0', null);
INSERT INTO `Entidade` VALUES ('205', '1185169', 'Afonso Oliveira Macedo', '', '917799692', 'pmacedo1@gmail.com', '2009-06-22', 'Estarreja', 'Portugal', '30059589', '267426798', '', '1º Ano', '', '', '2018-10-10', '', '', '1', '182', '205', null, '1', null);
INSERT INTO `Entidade` VALUES ('206', '1185178', 'Rafael Tavares Fidalgo', '', '', '', '2009-06-30', '', 'Portugal', '30067743', '267985169', '', '1º Ano', '', '', '2018-10-10', '', '', '1', '38', '206', null, '1', null);
INSERT INTO `Entidade` VALUES ('207', '1185799', 'Dinis Rufino Bandeira', '', '', '', '2009-08-28', '', 'Portugal', '30143824', '269148795', '', '3º Ano', '', '', '2018-10-10', '', '', '1', '32', '207', null, '1', '1');
INSERT INTO `Entidade` VALUES ('208', '000013', 'João Vasco Alegria de Oliveira', '', '', '', '2009-09-03', '', 'Portugal', '30148275', '270033947', '', '1º', 'Miopia e Estigmatismo', '', '2017-06-30', '', '', '1', null, '208', null, '0', null);
INSERT INTO `Entidade` VALUES ('209', '1185438', 'Manuel Domingues Freire', '', '966487136', '', '2009-10-04', '', 'Portugal', '30174529', '269549420', 'A+', 'Pré-escola', 'Sopro inocente (pode efectuar exercicio fisico)', '', '2018-11-15', '', '', '1', '110', '209', null, '0', null);
INSERT INTO `Entidade` VALUES ('210', '1185176', 'Paulo Sérgio Alves de Abreu Freire', '', '917063816', '', '2009-10-10', 'Glória', 'Portugal', '30177188', '275520676', '', '3º Ano', '', '', '2018-10-10', '', '', '1', '35', '210', null, '1', null);
INSERT INTO `Entidade` VALUES ('211', '1184738', 'Martim Augusto Couras Gonçalves', '', '961614343', '', '2009-10-20', '', 'Portugal', '30183732', '268628092', '', 'Pré-escola', '', '', '2018-10-10', '', '', '1', '56', '211', null, '1', null);
INSERT INTO `Entidade` VALUES ('212', '1184755', 'Tomás Marques Proença Gouveia', '964222972', '968640679', 'sandra.marques@moldit.pt', '2009-10-24', 'Salreu', 'Portugal', '30185833', '269424342', '', '1º Ano', '', '', '2018-10-10', '', '', '1', '34', '212', null, '1', null);
INSERT INTO `Entidade` VALUES ('213', '1184756', 'José David Castaño de Oliveira', '234050565', '920258998', '', '2009-11-11', '', 'Portugal', '31235614', '280292740', '', 'Pré-escola', '', '', '2018-10-10', '', '', '1', '145', '213', null, '1', null);
INSERT INTO `Entidade` VALUES ('214', '1213425', 'Pedro Rebelo de Couto', '', '', '', '2010-03-03', '', 'Portugal', '30298517', '273090542', 'B-', 'Pré-escola', '', '', '2018-10-23', '', '', '1', '7', '214', null, '1', null);
INSERT INTO `Entidade` VALUES ('215', '1213424', 'Duarte Rafael Dias Sousa', '', '', '', '2010-04-28', '', 'Portugal', '30348920', '270693688', 'A-', '', '', '', '2018-10-23', '', '', '1', '55', '215', null, '1', null);
INSERT INTO `Entidade` VALUES ('216', '000006', 'Martim Marques Gomes', '', '963834150', '', '2010-07-07', '', 'Portugal', '30426028', '271099445', '', '', '', '', '2017-11-13', '', '', '1', null, '216', null, '0', null);
INSERT INTO `Entidade` VALUES ('217', '1213418', 'Santiago Reis Lopes', '256687366', '936401711', '', '2010-07-20', '', '', '30441376', '273291769', 'A-', 'Ensino básico', '', '', '2018-10-23', '', '', '1', '3', '217', null, '1', null);
INSERT INTO `Entidade` VALUES ('219', '12134115', 'Martim Miranda Faria', '234189050', '969015058', '', '2010-08-03', '', 'Portugal', '30456774', '272714364', 'O+', 'Pré-escola', '', '', '2018-10-23', '', '', '1', '207', '219', null, '1', null);
INSERT INTO `Entidade` VALUES ('220', '1213420', 'Tiago Rafael Henriques Ferreira', '', '', '', '2010-08-28', '', 'Portugal', '30477020', '271599332', '', 'Pré-escola', 'rim direito sem crescimento', '', '2018-10-23', '', '', '1', '49', '220', null, '1', null);
INSERT INTO `Entidade` VALUES ('221', '12113419', 'Miguel da Silva Reis', '234194957', '918701968', '', '2010-11-24', '', 'Portugal', '30545174', '273227530', 'A-', '2º ano', '', '', '2018-10-23', '', '', '1', '167', '221', null, '1', null);
INSERT INTO `Entidade` VALUES ('222', '1213421', 'Gonçalo Filipe Almeida Ferreira', '', '911219207', '', '2010-12-19', '', 'Portugal', '30559881', '273071572', '', '3º Ano', '', '', '2018-10-23', '', '', '1', '168', '222', null, '1', null);
INSERT INTO `Entidade` VALUES ('223', '1220079', 'Daniel Bastos Tavares', '', '', '', '2010-03-30', '', 'Portugal', '30652102', '274847353', 'A-', 'Pré-escola', '', '', '2018-11-15', '', '', '1', '83', '223', null, '0', null);
INSERT INTO `Entidade` VALUES ('224', '1220077', 'Dinis Marques Caneira', '', '', '', '2011-06-10', 'Bunheiro', 'Portugal', '30735355', '276008472', '', 'Pré-escola', '', '', '2017-08-16', '', '', '1', '75', '224', null, '1', null);
INSERT INTO `Entidade` VALUES ('225', '1220078', 'Gaspar Marques Caneira', '', '', '', '2011-06-10', '', 'Portugal', '30735358', '276008472', '', 'Primária', '', '', '2017-08-16', '', '', '1', '76', '225', null, '1', null);
INSERT INTO `Entidade` VALUES ('226', '000002', 'Diogo Amador Marquinhos', '', '914702731', '', '2011-08-25', '', 'Portugal', '30798735', '278340792', 'B+', 'Pré-escola', '', '', '2017-06-30', '', '', '1', null, '226', null, '0', null);
INSERT INTO `Entidade` VALUES ('227', '1220081', 'Afonso Rebelo de Couto', '', '933845997', '', '2012-05-21', '', 'Portugal', '30992530', '278550380', '', '', '', '', '2017-08-16', '', '', '1', '6', '227', null, '1', null);
INSERT INTO `Entidade` VALUES ('228', '', 'Alexandre Gomes Oliveira', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '228', null, '1', null);
INSERT INTO `Entidade` VALUES ('229', '', 'André Filipe da Silva Cancela', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '229', null, '1', null);
INSERT INTO `Entidade` VALUES ('230', '', 'André Filipe Rodrigues da Silva', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '230', null, '1', null);
INSERT INTO `Entidade` VALUES ('231', '', 'Diogo Rafael Silva Costa Almeida', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '231', null, '1', null);
INSERT INTO `Entidade` VALUES ('232', '', 'Federico da Silva Amorim', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '232', null, '1', null);
INSERT INTO `Entidade` VALUES ('233', '', 'João Paulo Soares Almeida', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '233', null, '1', null);
INSERT INTO `Entidade` VALUES ('234', '', 'João Pedro da Cruz Oliveira', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '234', null, '1', null);
INSERT INTO `Entidade` VALUES ('235', '', 'João Pedro Oliveira Antunes Correia', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '235', null, '1', null);
INSERT INTO `Entidade` VALUES ('236', '', 'João Tiago Oliveira Rodrigues', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '236', null, '1', null);
INSERT INTO `Entidade` VALUES ('237', '', 'Luis Miguel Alves Belo Moreira Silva', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '237', null, '1', null);
INSERT INTO `Entidade` VALUES ('238', '', 'Marcelo Daniel Marques Santiago', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '238', null, '1', null);
INSERT INTO `Entidade` VALUES ('239', '', 'Miguel Angelo Gomes Silva', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '239', null, '1', null);
INSERT INTO `Entidade` VALUES ('240', '', 'Pedro Agostinho Silva Neves', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', null, null, '240', null, '1', null);
INSERT INTO `Entidade` VALUES ('241', '', 'Ricardo Manuel da Silva Tavares', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '241', null, '1', null);
INSERT INTO `Entidade` VALUES ('242', '', 'Sergio Jorge Sousa Machado', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '242', null, '1', null);
INSERT INTO `Entidade` VALUES ('243', '', 'Tiago Miguel Bastos Melo', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '243', null, '1', null);
INSERT INTO `Entidade` VALUES ('244', '', 'Tiago Pereira Andrade', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '244', null, '1', null);
INSERT INTO `Entidade` VALUES ('245', '', 'Vitor Hugo Chula dos Santos', '', '', '', null, '', '', '', '', '', '', '', '', null, '', '', '1', null, '245', null, '1', null);
INSERT INTO `Entidade` VALUES ('639', null, 'Teste', null, null, null, '2016-08-28', null, null, '123456789', '123456789', null, null, null, null, '2016-08-29', 'user.png', null, '5', null, '229', null, '1', null);
INSERT INTO `Entidade` VALUES ('640', null, 'Teste', null, null, null, '2017-11-12', null, null, '999999999', '456789123', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '230', null, '1', null);
INSERT INTO `Entidade` VALUES ('641', null, 'Francisco António dos Santos Oliveira', null, '917799790', 'foliveira@digitalmente.net', '2018-12-03', null, null, '9997012', '207301336', null, null, null, null, '2018-12-04', 'user.png', null, '5', null, '231', null, '1', null);
INSERT INTO `Entidade` VALUES ('642', null, 'André Filipe Valente Oliveira', null, '918381280', 'andre.oliveira@cm-estarreja.pt', '2018-10-08', null, null, '12536688', '214180012', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '232', null, '1', null);
INSERT INTO `Entidade` VALUES ('645', null, 'asdas', null, null, null, '2017-11-12', null, null, '11111111', '111222333', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '235', null, '1', null);
INSERT INTO `Entidade` VALUES ('646', null, 'Nuno Alexandre Rodrigues da Silva', null, '967238197', 'nunoboss_11@hotmail.com', '2018-11-14', null, null, '10210468', '179779664', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '236', null, '1', null);
INSERT INTO `Entidade` VALUES ('647', null, 'Paula Alexandra Nunes Silva', null, '912626872', 'paulinhamigas@hotmail.com', '2018-10-09', null, null, '12344387', '218332416', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '237', null, '1', null);
INSERT INTO `Entidade` VALUES ('648', null, 'Liliana Cristina Resende de Matos', null, '910158755', null, '2018-11-14', null, null, '13221998', '224301497', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '238', null, '1', null);
INSERT INTO `Entidade` VALUES ('713', null, 'Sónia Alexandra dos Santos e Castro', null, '914041932', 'soniacosmeticos@sapo.pt', '2017-08-27', null, null, '13420014', '240932838', null, null, null, null, '2017-08-28', 'user.png', null, '5', null, '271', null, '1', null);
INSERT INTO `Entidade` VALUES ('714', null, 'Walter Augusto Valente Marques Couto', null, '967237820', 'waltercouto@gmail.com', '2018-10-09', null, null, '12082534', '285220661', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '272', null, '1', null);
INSERT INTO `Entidade` VALUES ('715', null, 'Carlos Alberto Rodrigues Pires', null, '919121314', 'carpires@gmail.com', '2018-10-09', null, null, '13863084', '206997566', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '273', null, '1', null);
INSERT INTO `Entidade` VALUES ('716', null, 'Francisco José Pereira Rosa', null, '916218831', 'chicor.sapo@gmail.com', '2018-10-09', null, null, '10864773', '203124804', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '274', null, '1', null);
INSERT INTO `Entidade` VALUES ('717', null, 'Paulo Jorge Soares Nunes', null, '968189202', 'paulo.j.nunes@telecom.pt', '2018-10-09', null, null, '11006346', '222371820', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '275', null, '1', null);
INSERT INTO `Entidade` VALUES ('718', null, 'Rui Manuel Rocha Teixeira', null, '968345200', 'ruipeixaria@hotmail.com', '2018-10-09', null, null, '09919935', '192180835', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '276', null, '1', null);
INSERT INTO `Entidade` VALUES ('719', null, 'Rui Manuel Santos Almeida', '', '966181072', 'ruialmeida299@hotmail.com', '2018-10-09', null, null, '13652033', '199719861', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '277', null, '1', null);
INSERT INTO `Entidade` VALUES ('720', null, 'Liliana Patrícia Afonso Silva Rodrigues', null, '969142389', null, '2017-11-08', null, null, '12546743', '237278871', null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '278', null, '1', null);
INSERT INTO `Entidade` VALUES ('721', null, 'Sofia Rebelo dos Santos', null, '918678927', 'sofia_santos16@hotmail.com', '2018-10-09', null, null, '12809480', '210316160', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '279', null, '1', null);
INSERT INTO `Entidade` VALUES ('722', null, 'Marco Paulo da Costa Pinheiro', null, '937058555', 'mpmarcopinheiro54@hotmail.com', '2018-10-09', null, null, '11317973', '219580812', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '280', null, '1', null);
INSERT INTO `Entidade` VALUES ('723', null, 'Jorge Manuel de Almeida Faria', null, '919797327', '', '2018-10-08', null, null, '44444444', '333333333', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '281', null, '1', null);
INSERT INTO `Entidade` VALUES ('724', null, 'Isidro António da Silva Sousa', null, '964701922', 'iasousa24@sapo.pt', '2017-11-08', null, null, '07008201', '157573141', null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '282', null, '1', null);
INSERT INTO `Entidade` VALUES ('725', null, 'Isabel Maria Soares Silva Camacho', null, '969302551', 'isabel.camachobranca@gmail.com', '2018-10-09', null, null, '09047531', '203210425', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '283', null, '1', null);
INSERT INTO `Entidade` VALUES ('726', null, 'Bruno Ricardo Pereira Ruela', null, '919319464', null, '2018-11-13', null, null, '12275612', '227386051', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '284', null, '1', null);
INSERT INTO `Entidade` VALUES ('727', null, 'Inácio José da Silva Soares', null, '965815758', null, '2018-11-13', null, null, '10239040', '189966165', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '285', null, '1', null);
INSERT INTO `Entidade` VALUES ('728', null, 'Vitor Manuel da Silva de Oliveira', null, '965066590', 'vitinha.vitinha@hotmail.com', '2018-11-13', null, null, '12913892', '192160907', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '286', null, '1', null);
INSERT INTO `Entidade` VALUES ('729', null, 'Paulo Alexandre da Silva Caldas de Oliveira Mendonça', null, '967123286', 'pascomendonca@gmail.com', '2017-11-08', null, null, '10628291', '173488242', null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '287', null, '1', null);
INSERT INTO `Entidade` VALUES ('730', null, 'Catarina Matos Camões Sobral Carinha da Silva', null, '966364548', 'caticamoes@gmail.com', '2018-10-09', null, null, '10357342', '205856497', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '288', null, '1', null);
INSERT INTO `Entidade` VALUES ('731', null, 'Maria Manuela de Oliveira Dias Medina', null, '919772960', 'minel_medina@yahoo.com', '2018-10-09', null, null, '05527844', '151111324', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '289', null, '1', null);
INSERT INTO `Entidade` VALUES ('732', null, 'Paulo Rossano Cardoso Lopes', null, '915761334', null, '2018-10-09', null, null, '11578040', '220121966', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '290', null, '1', null);
INSERT INTO `Entidade` VALUES ('733', null, 'António Augusto Guerra Alves da Costa Santos', null, '935004907-964534451', 'ancosa10@gmail.com', '2018-10-09', null, null, '09986655', '200531417', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '291', null, '1', null);
INSERT INTO `Entidade` VALUES ('734', null, 'Fernando Manuel Paradela Santos', null, '962308729', 'fermandoparadela@hotmail.com', '2017-11-08', null, null, '06231835', '182572153', null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '292', null, '1', null);
INSERT INTO `Entidade` VALUES ('735', null, 'Jorge Manuel Vaz Pereira Gonçalves', null, '916577518', 'jorgeagulhas@hotmail.com', '2018-10-09', null, null, '11582682', '209920130', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '293', null, '1', null);
INSERT INTO `Entidade` VALUES ('736', null, 'Maria Cristina Pinho Resende Pinto', null, '966967756', 'pintomepr@gmail.com', '2018-10-08', null, null, '09645188', '195958500', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '294', null, '1', null);
INSERT INTO `Entidade` VALUES ('737', null, 'Adolfo Figueiredo Vidal', null, '917563600', 'adolfo.vidal@cm-estarreja.pt', '2018-11-13', null, null, '08085889', '187009341', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '295', null, '1', null);
INSERT INTO `Entidade` VALUES ('738', null, 'César André de Oliveira Rebelo', null, '911978258', null, '2018-11-13', null, null, '12915084', '227581105', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '296', null, '1', null);
INSERT INTO `Entidade` VALUES ('739', null, 'Eduardo Figueiredo Marques', null, '917336649', 'e_dada97@hotmail.com', '2018-10-08', null, null, '12290293', '232026750', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '297', null, '1', null);
INSERT INTO `Entidade` VALUES ('740', null, 'Carmen Sofia da Silva Marques', null, '935348386', 'uba@sapo.pt', '2018-10-09', null, null, '32345432', '323454321', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '298', null, '1', null);
INSERT INTO `Entidade` VALUES ('741', null, 'Luis Manuel Pereira da Silva', null, '964748288', 'luismanuel@sapo.pt', '2017-11-08', null, null, '10212051', '215526988', null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '299', null, '1', null);
INSERT INTO `Entidade` VALUES ('742', null, 'Paulo Jose Mesquita Penajóia', null, '966641693', 'paulopenajoia@hotmail.com', '2018-10-09', null, null, '10126327', '204926130', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '300', null, '1', null);
INSERT INTO `Entidade` VALUES ('743', null, 'Teresa Lúcia de Oliveira Bastos', null, '918164459', 'a.pinto.35@gmail.com', '2018-10-09', null, null, '44444444', '444444444', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '301', null, '1', null);
INSERT INTO `Entidade` VALUES ('744', null, 'Susana Catarina Matos Henriques da Silva', null, '961526873', null, '2018-10-08', null, null, '10876285', '208947850', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '302', null, '1', null);
INSERT INTO `Entidade` VALUES ('745', null, 'Henrique Marques de Oliveira', '', '918379538', 'oliveirahenrique65@hotmail.com', '2018-10-08', null, null, '7325467', '000000000', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '303', null, '1', null);
INSERT INTO `Entidade` VALUES ('746', null, 'Aida Maria de Oliveira e Cruz', null, '966306664', 'cruz.aidinha@gmail.com', '2018-10-08', null, null, '10555587', '184278937', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '304', null, '1', null);
INSERT INTO `Entidade` VALUES ('747', null, 'António Manuel Oliveira Marques', null, '963095802', null, '2018-10-08', null, null, '07945176', '154097349', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '305', null, '1', null);
INSERT INTO `Entidade` VALUES ('748', null, 'Dora Patrícia Espanha Ramos', null, '967713136', 'doraespanha@live.com.pt', '2018-10-08', null, null, '11388761', '214606503', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '306', null, '1', null);
INSERT INTO `Entidade` VALUES ('749', null, 'Maria de Lurdes de Azevedo Vaz Pinho', null, '913641760', null, '2018-10-08', null, null, '07342687', '178659355', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '307', null, '1', null);
INSERT INTO `Entidade` VALUES ('750', null, 'Sérgio Filipe Gomes Cruz', null, '965112175', 'sergiofilipe547@hotmail.com', '2018-10-08', null, null, '11267431', '203265661', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '308', null, '1', null);
INSERT INTO `Entidade` VALUES ('751', null, 'Agostinho da Silva Almeida', null, '936792894', 'agostinho.almeida@dataloc.pt', '2018-10-08', null, null, '12209475', '199515182', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '309', null, '1', null);
INSERT INTO `Entidade` VALUES ('752', null, 'Carlos Augusto Ferreira Soares', null, '962767911', 'cafs1@sapo.pt', '2018-10-08', null, null, '10357201', '203903854', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '310', null, '1', null);
INSERT INTO `Entidade` VALUES ('753', null, 'Alcides José de Sá Esteves', null, '966046398', '', '2018-10-08', null, null, '07646774', '176893903', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '311', null, '1', null);
INSERT INTO `Entidade` VALUES ('754', null, 'João Paulo Barbosa da Silva', null, '967807650', 'joaopaus@gmail.com', '2018-10-08', null, null, '56456754', '234543234', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '312', null, '1', null);
INSERT INTO `Entidade` VALUES ('755', null, 'Pedro Miguel Rodrigues da Silva', null, '917977656', 'pedro.rodrigues1981@hotmail.com', '2018-10-08', null, null, '11938899', '225573075', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '313', null, '1', null);
INSERT INTO `Entidade` VALUES ('756', null, 'Laura Maria Couto Valente Lacerda de Oliveira', null, '926591482', 'laura.c.v.lacerda@gmail.com', '2017-08-09', null, null, '07651745', '172195454', null, null, null, null, '2017-08-10', 'user.png', null, '5', null, '314', null, '1', null);
INSERT INTO `Entidade` VALUES ('757', null, 'Fernando Jorge Amador Tavares de Sousa', null, '916322540', 'fernandojtsousa@gmail.com', '2018-10-08', null, null, '10158827', '201756765', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '315', null, '1', null);
INSERT INTO `Entidade` VALUES ('758', null, 'Paulo Daniel Correia Viana', null, '933268717', 'paulo.viana@prozinco.com', '2018-10-08', null, null, '10105109', '207521727', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '316', null, '1', null);
INSERT INTO `Entidade` VALUES ('759', null, 'Pedro Alexandre Castanheira Afonso de Almeida', null, '967785515', 'peterpanmaster@gmail.com', '2018-08-30', null, null, '09909033', '199237409', null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '317', null, '1', null);
INSERT INTO `Entidade` VALUES ('760', null, 'Marco Paulo Marques Dias', null, '964712792', 'marcopdias@gmail.com', '2017-08-13', null, null, '10137857', '206480112', null, null, null, null, '2017-08-14', 'user.png', null, '5', null, '318', null, '1', null);
INSERT INTO `Entidade` VALUES ('761', null, 'Lúcia de Resende Moreira', null, '916817156', 'lucmoreira@iol.pt', '2018-10-08', null, null, '11330646', '211371696', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '319', null, '1', null);
INSERT INTO `Entidade` VALUES ('762', null, 'José Paulo Gonçalves Fernandes', null, '965659622', 'fernandes.jpg@gmail.com', '2018-10-08', null, null, '09932513', '196839700', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '320', null, '1', null);
INSERT INTO `Entidade` VALUES ('763', null, 'João Paulo Barbosa da Silva', null, '967807650', 'joaopaus@gmail.com', '2018-10-08', null, null, '76895432', '345678901', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '321', null, '1', null);
INSERT INTO `Entidade` VALUES ('764', null, 'Ana Maria Ferreira da Silva Costeira', null, '912407156', 'anacosteira71@gmail.com', '2019-01-14', null, null, '09966396', '164361324', null, null, null, null, '2019-01-15', 'user.png', null, '5', null, '322', null, '1', null);
INSERT INTO `Entidade` VALUES ('765', null, 'Mário Sérgio Lopes de Castro', null, '967238119', 'electro.mariosergio@sapo.pt', '2017-08-27', null, null, '10075325', '200214667', null, null, null, null, '2017-08-28', 'user.png', null, '5', null, '323', null, '1', null);
INSERT INTO `Entidade` VALUES ('766', null, 'António José Marques Rebelo', null, '932891788', 'antoniojmrebelo@gmail.com', '2018-10-05', null, null, '11813627', '209945699', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '324', null, '1', null);
INSERT INTO `Entidade` VALUES ('767', null, 'Filipe Martinho Cipriano Ferreira', null, '911119207', 'fmcferreira@msn.com', '2018-11-13', null, null, '11086084', '203649532', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '325', null, '1', null);
INSERT INTO `Entidade` VALUES ('768', null, 'Pedro Miguel Tavares Oliveira', null, '913618036', 'pmtoliveira@gmail.com', '2018-10-05', null, null, '09516672', '188938257', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '326', null, '1', null);
INSERT INTO `Entidade` VALUES ('769', null, 'Maria Helena Miranda Pontes', null, '961526804', 'mct.pontes@gmail.com', '2018-10-05', null, null, '08092268', '157748871', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '327', null, '1', null);
INSERT INTO `Entidade` VALUES ('770', null, 'Luis Miguel da Silva Mendonça', null, '961040122', null, '2018-11-13', null, null, '11224080', '169267024', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '328', null, '1', null);
INSERT INTO `Entidade` VALUES ('771', null, 'Susana Maria Soares Santos Campos', null, '916468514', '27079@ufp.edu.pt', '2017-11-12', null, null, '12291271', '210586168', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '329', null, '1', null);
INSERT INTO `Entidade` VALUES ('772', null, 'Anabela Teixeira de Matos', null, '917029142', 'anabelamatos188@hotmail.com', '2018-10-05', null, null, '12016013', '224035479', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '330', null, '1', null);
INSERT INTO `Entidade` VALUES ('773', null, 'Manuel Maguil Valente Freire', null, '966487136', 'mfreire71@gmail.com', '2018-11-13', null, null, '10443806', '188827790', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '331', null, '1', null);
INSERT INTO `Entidade` VALUES ('774', null, 'Luis Filipe Fernandes Correia', null, '912649272', 'Luis.correia_@hotmail.com', '2018-11-13', null, null, '11388266', '217878261', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '332', null, '1', null);
INSERT INTO `Entidade` VALUES ('775', null, 'Sandro Augusto Sacadura Botte', null, '910161427', 'sandro.botte@gmail.com', '2018-10-05', null, null, '10057464', '164213260', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '333', null, '1', null);
INSERT INTO `Entidade` VALUES ('776', null, 'João Henriques Silva Vieira', null, '914198403', null, '2018-10-05', null, null, '07412723', '172025966', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '334', null, '1', null);
INSERT INTO `Entidade` VALUES ('777', null, 'Sérgio Paulo Montenegro Osório Vinha', null, '918181718', null, '2018-11-13', null, null, '09646098', '197308740', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '335', null, '1', null);
INSERT INTO `Entidade` VALUES ('778', null, 'Ester Maria Ferreira Valente', null, '969127354', 'estervalente3@gmail.com', '2018-10-05', null, null, '12058311', '000000002', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '336', null, '1', null);
INSERT INTO `Entidade` VALUES ('779', null, 'Gabriel Dinis Cardoso e Silva', null, '962401058', 'gabrieldcsilva@gmail.com', '2018-11-13', null, null, '10142148', '173386938', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '337', null, '1', null);
INSERT INTO `Entidade` VALUES ('780', null, 'Luis Miguel da Conceição Almeida', null, '924400286', 'luisalmeida26@hotmail.com', '2018-11-13', null, null, '11656227', '222105968', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '338', null, '1', null);
INSERT INTO `Entidade` VALUES ('781', null, 'António Manuel Silva Pereira', null, '961406450', 'antoniopereira8@hotmail.com', '2018-11-13', null, null, '8563936', '000000003', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '339', null, '1', null);
INSERT INTO `Entidade` VALUES ('782', null, 'Alfredo Manuel Dias Bastos', '234190457', null, 'amdb38@hotmail.com', '2017-11-12', null, null, '7818250', '000000004', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '340', null, '1', null);
INSERT INTO `Entidade` VALUES ('783', null, 'Andreia Carina Fernandes da Silva Fima', null, '918801771', 'andreiafima@gmail.com', '2018-10-05', null, null, '117288867', '231694172', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '341', null, '1', null);
INSERT INTO `Entidade` VALUES ('784', null, 'Paulo Jorge Baptista dos Santos', null, '936656794', null, '2017-11-12', null, null, '09880763', '187009791', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '342', null, '1', null);
INSERT INTO `Entidade` VALUES ('785', null, 'José Manuel Couto Fonseca', null, '916736689', null, '2018-11-13', null, null, '11973184', '221347933', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '343', null, '1', null);
INSERT INTO `Entidade` VALUES ('786', null, 'Dário Jorge Lopes Matos', null, '918980315', null, '2018-10-05', null, null, '11617639', '206292503', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '344', null, '1', null);
INSERT INTO `Entidade` VALUES ('787', null, 'Fernando Pinheiro Mendes', null, '961103878', 'fernando.mendes@cuf-qi.pt', '2018-11-13', null, null, '09586471', '208379649', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '345', null, '1', null);
INSERT INTO `Entidade` VALUES ('788', null, 'Armindo António Valente Pereira', null, '965856064', 'armgralho@sapo.pt', '2018-10-05', null, null, '10073847', '176282289', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '346', null, '1', null);
INSERT INTO `Entidade` VALUES ('789', null, 'Liceth Roxana Mendez da Silva', null, null, null, '2017-11-12', null, null, '00000002', '000000005', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '347', null, '1', null);
INSERT INTO `Entidade` VALUES ('790', null, 'António Augusto Guerra Alves da Costa Santos', null, '935004907-964534451', 'ancasa10@gmail.com', '2017-11-12', null, null, '099866550', '200531410', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '348', null, '1', null);
INSERT INTO `Entidade` VALUES ('791', null, 'Pedro Miguel Castro Tavares Bastos Mendes', null, '967072685', 'pedro.mendes.santander@gmail.com', '2018-10-05', null, null, '10777902', '173386350', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '349', null, '1', null);
INSERT INTO `Entidade` VALUES ('792', null, 'Pedro Sérgio de Oliveira e Silva', null, '965248811', 'pierres.silva@gmail.com', '2018-10-05', null, null, '08141117', '170985253', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '350', null, '1', null);
INSERT INTO `Entidade` VALUES ('793', null, 'Sérgio Domingo de Oliveira da Silva', null, '916040028', 'sdosilva@creditoagricola.pt', '2018-10-05', null, null, '11634177', '207602921', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '351', null, '1', null);
INSERT INTO `Entidade` VALUES ('794', null, 'Jorge Manuel Brandão Fernandes', null, '913461934', 'jorgepardal29@hotmail.com', '2018-10-05', null, null, '10408456', '205835368', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '352', null, '1', null);
INSERT INTO `Entidade` VALUES ('795', null, 'Lisete Cristina Esteves dos Santos', null, '912112335', 'lisete.santos@gmail.com', '2018-10-05', null, null, '54656785', '456666666', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '353', null, '1', null);
INSERT INTO `Entidade` VALUES ('796', null, 'José de Sousa Soares', null, '966931340', 'qidosdany@sapo.pt', '2018-11-13', null, null, '07021910', '177780274', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '354', null, '1', null);
INSERT INTO `Entidade` VALUES ('797', null, 'Paulino António Valente Dias', null, '960082206', 'diasp@iol.pt', '2017-11-12', null, null, '06979407', '189310731', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '355', null, '1', null);
INSERT INTO `Entidade` VALUES ('798', null, 'António Manuel Azevedo Oliveira', null, '914302224', null, '2017-11-12', null, null, '05401247', '114618410', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '356', null, '1', null);
INSERT INTO `Entidade` VALUES ('799', null, 'José Manuel da Costa Dias', null, '934240688', 'zecarias66@hotmail.com', '2018-11-13', null, null, '09985831', '175450196', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '357', null, '1', null);
INSERT INTO `Entidade` VALUES ('800', null, 'Marisol Tavares Marques Martins', null, '918615644', 'manymartins@sapo.pt', '2017-11-12', null, null, '10435844', '207300887', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '358', null, '1', null);
INSERT INTO `Entidade` VALUES ('801', null, 'Fernanda Maria da Silva Costa', null, '915459863', 'fernandacosta.72@hotmail.com', '2018-10-03', null, null, '09819574', '195319494', null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '359', null, '1', null);
INSERT INTO `Entidade` VALUES ('802', null, 'Maria de Fátima Figueiredo Soares Rebelo', null, '961036486', 'fatimasoares@vistaalegre.com', '2018-11-13', null, null, '11431435', '188969047', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '360', null, '1', null);
INSERT INTO `Entidade` VALUES ('803', null, 'Fátima de Olim Pinto', null, '919972218', null, '2017-11-12', null, null, '13742428', '219370150', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '361', null, '1', null);
INSERT INTO `Entidade` VALUES ('804', null, 'Fernando Paulo Marques Gonçalves', null, null, 'fpauloma@gmail.com', '2018-11-13', null, null, '08067961', '180000136', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '362', null, '1', null);
INSERT INTO `Entidade` VALUES ('805', null, 'Maria Isabel Figueiredo Soares', null, '962520430', 'isabelcosmeticos@sapo.pt', '2018-11-13', null, null, '11631317', '202748820', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '363', null, '1', null);
INSERT INTO `Entidade` VALUES ('806', null, 'Carla Margarida Santos Costa', null, '918230048', 'carlacosta209@gmail.com', '2018-10-03', null, null, '09939923', '203841433', null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '364', null, '1', null);
INSERT INTO `Entidade` VALUES ('807', null, 'Carlos Manuel de Matos Vigário', null, '913783545', null, '2017-11-12', null, null, '12003181', '210722509', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '365', null, '1', null);
INSERT INTO `Entidade` VALUES ('808', null, 'Manuel Tavares Marques', null, '962694834', 'manuel.tm@netvisao.pt', '2018-10-03', null, null, '05535766', '170489906', null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '366', null, '1', null);
INSERT INTO `Entidade` VALUES ('809', null, 'Joaquim Fernando de Oliveira Cirne', null, '914535353', 'carramona@sapo.pt', '2018-10-03', null, null, '07825232', '174486936', null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '367', null, '1', null);
INSERT INTO `Entidade` VALUES ('810', null, 'Sandra Cristina Ribeiro de Almeida e Silva', null, '919377996', 'sandralmeida@live.com.pt', '2017-11-12', null, null, '10670865', '206190255', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '368', null, '1', null);
INSERT INTO `Entidade` VALUES ('811', null, 'Maria Cristina de Oliveira Correia', null, '917966498', 'cris_ocorreia@hotmail.com', '2017-11-12', null, null, '10859839', '195958683', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '369', null, '1', null);
INSERT INTO `Entidade` VALUES ('812', null, 'Dulce Maria Rodriguez Rodriguez Pinho', null, '969607516', 'dulcebpinho@hotmail.com', '2017-11-12', null, null, '12219327', '209772751', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '370', null, '1', null);
INSERT INTO `Entidade` VALUES ('813', null, 'Manuel José Silva Costa', null, '918716322', null, '2018-11-13', null, null, '04303556', '163427720', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '371', null, '1', null);
INSERT INTO `Entidade` VALUES ('814', null, 'Emilia Celeste Silva Matos', null, '917142890', null, '2017-11-12', null, null, '09061822', '197308589', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '372', null, '1', null);
INSERT INTO `Entidade` VALUES ('815', null, 'Germano Almeida Ferreira', null, '910900917', null, '2019-07-07', null, null, '08550815', '207548986', null, null, null, null, '2019-07-08', 'user.png', null, '5', null, '373', null, '1', null);
INSERT INTO `Entidade` VALUES ('816', null, 'Yohana Janquelys de Oliveira Castano', null, '920258998', null, '2018-10-09', null, null, '31162427', '280292627', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '374', null, '1', null);
INSERT INTO `Entidade` VALUES ('817', null, 'Almerinda Maria da Silva Rodrigues', null, '919214492', null, '2017-11-12', null, null, '14422661', '242946518', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '375', null, '1', null);
INSERT INTO `Entidade` VALUES ('818', null, 'Miguel Mano Tavares de Sousa Mano', null, '967000874', null, '2018-10-09', null, null, '8075908', '000000007', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '376', null, '1', null);
INSERT INTO `Entidade` VALUES ('819', null, 'Carlos Manuel Pires da Silva Ribeiro', null, '927779056', 'cribeiro74@gmail.com', '2018-10-09', null, null, '10320294', '197451357', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '377', null, '1', null);
INSERT INTO `Entidade` VALUES ('820', null, 'Pedro Luis Valente dos Santos baptista Garcia', null, '966214052', 'pedro.garcia.2@gmail.com', '2018-10-09', null, null, '07441738', '182550648', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '378', null, '1', null);
INSERT INTO `Entidade` VALUES ('821', null, 'Paulo Sérgio Pinto de Abreu Freire', null, '917063816', 'pfreire.escola@gmail.com', '2018-10-09', null, null, '10550187', '206124759', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '379', null, '1', null);
INSERT INTO `Entidade` VALUES ('822', null, 'Virgílio Azevedo', null, '919052435', 'ionelaclaudia2014@gmail.com', '2018-10-09', null, null, '64839287', '345765324', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '380', null, '1', null);
INSERT INTO `Entidade` VALUES ('823', null, 'Eva Margarida dos Santos Nunes Valente', null, '961389331', 'evanunesvalente@gmail.com', '2017-07-03', null, null, '11496042', '167410180', null, null, null, null, '2017-07-04', 'user.png', null, '5', null, '381', null, '1', null);
INSERT INTO `Entidade` VALUES ('824', null, 'Maria Josefa da Silva Figueiredo', null, '967068279', 'josefa.figueiredo@sapo.pt', '2018-10-09', null, null, '07800946', '191363936', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '382', null, '1', null);
INSERT INTO `Entidade` VALUES ('825', null, 'Sandra Cristina Tavares Marques', null, '964653559', 'sandra.marques@moldit.pt', '2018-10-09', null, null, '11132283', '201876507', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '383', null, '1', null);
INSERT INTO `Entidade` VALUES ('826', null, 'Rui Pedro Brandão Gonçalves', null, '961614343', 'rui@meleditores.pt', '2018-10-09', null, null, '11379568', '224301470', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '384', null, '1', null);
INSERT INTO `Entidade` VALUES ('827', null, 'Pedro Daniel Henriques Marques Ferreira', null, '966788118', 'pedroferreira@netvisao.pt', '2017-08-15', null, null, '10066212', '173329179', null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '385', null, '1', null);
INSERT INTO `Entidade` VALUES ('828', null, 'Ana Isabel Pereira Tavares', null, '965228156', 'anatavares125@gmail.com', '2018-10-09', null, null, '12324678', '212285912', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '386', null, '1', null);
INSERT INTO `Entidade` VALUES ('829', null, 'Virgilio Manuel Figueiredo Bandeira', null, '969055486', 'vmbandeira@hotmail.com', '2018-10-09', null, null, '10773914', '173444822', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '387', null, '1', null);
INSERT INTO `Entidade` VALUES ('830', null, 'Paulo Armindo Rodrigues de Sousa Macedo', null, '917799692', 'pmacedo1@gmail.com', '2018-10-09', null, null, '08879095', '196337240', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '388', null, '1', null);
INSERT INTO `Entidade` VALUES ('831', null, 'Manuel Maguil Valente Freire', null, '966487136', 'mfreire71@gmail.com', '2018-11-14', null, null, '10443808', '188827790', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '389', null, '1', null);
INSERT INTO `Entidade` VALUES ('832', null, 'Ricardo Miguel Oliveira da Fonseca', null, '964823744', 'ricardomfonseca@gmail.com', '2018-10-09', null, null, '10823512', '211370940', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '390', null, '1', null);
INSERT INTO `Entidade` VALUES ('834', null, 'antonio silva costa', null, null, null, '2016-11-13', null, null, '12345678', '123456789', null, null, null, null, '2016-11-14', 'user.png', null, '5', null, '392', null, '1', null);
INSERT INTO `Entidade` VALUES ('835', null, 'maria emilia', null, null, null, '2016-11-13', null, null, '112233444', '1122334441', null, null, null, null, '2016-11-14', 'user.png', null, '5', null, '391', null, '1', null);
INSERT INTO `Entidade` VALUES ('836', null, 'Aldo Manuel Ferreira Barbosa', null, '919734884', 'aldobarbosa@sapo.pt', '2017-11-12', null, null, '103435598', '211146480', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '393', null, '1', null);
INSERT INTO `Entidade` VALUES ('837', null, 'Jorge Francisco Ferreira Santos', null, '915418586', null, '2017-11-12', null, null, '06979302', '140105603', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '394', null, '1', null);
INSERT INTO `Entidade` VALUES ('838', null, 'Paula Isabel Ferreira da Silva Valente', null, '912821139', null, '2017-11-12', null, null, '112782297', '212009923', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '395', null, '1', null);
INSERT INTO `Entidade` VALUES ('839', null, 'Paula Maria Rodrigues da Silva', null, '912814916', 'jomen.silva29@gmail.com', '2018-10-04', null, null, '12050942', '208877029', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '396', null, '1', null);
INSERT INTO `Entidade` VALUES ('840', null, 'Maria Iveta Marques Dias Santos', null, '963466632', 'ivetesantos@netvisao.pt', '2018-10-04', null, null, '09697490', '185872603', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '397', null, '1', null);
INSERT INTO `Entidade` VALUES ('949', null, 'Donzília Maria Ribeiro da Silva', null, '918161130', 'donziliasilva17@gmail.com', '2018-11-13', null, null, '10835245', '211282936', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '452', null, '1', null);
INSERT INTO `Entidade` VALUES ('950', null, 'Alexandre Manuel Valente Almeida', null, '965343295', 'alexgomi03@gmail.com', '2018-10-04', null, null, '9593839', '000000009', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '453', null, '1', null);
INSERT INTO `Entidade` VALUES ('951', null, 'Homorata Cleófas Manejo', null, '962341027', 'homoqueiros@hotmail.com', '2018-10-04', null, null, 'AB105138', '000000010', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '454', null, '1', null);
INSERT INTO `Entidade` VALUES ('952', null, 'António José de Oliveira Marques', null, '962025404', null, '2018-11-13', null, null, '07016909', '150275854', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '455', null, '1', null);
INSERT INTO `Entidade` VALUES ('953', null, 'Olga Maria Rodrigues da Silva', null, '967267209', 'olgamrs2007@hotmail.com', '2018-10-04', null, null, '8975817', '000000011', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '456', null, '1', null);
INSERT INTO `Entidade` VALUES ('954', null, 'Orlando da Silva Dias', null, '918960569', 'orlandodias@live.com.pt', '2018-10-04', null, null, '13320184', '164213384', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '457', null, '1', null);
INSERT INTO `Entidade` VALUES ('955', null, 'Vera Lucia Martins da Fonseca', null, '917961603', null, '2018-11-28', null, null, '12872634', '233063889', null, null, null, null, '2018-11-29', 'user.png', null, '5', null, '458', null, '1', null);
INSERT INTO `Entidade` VALUES ('956', null, 'José Manuel de Andrade Neves', null, '968935322', null, '2018-11-13', null, null, '07424830', '171157923', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '459', null, '1', null);
INSERT INTO `Entidade` VALUES ('957', null, 'Sandra Paula Pinho Matos Gonçalo', null, '919065210', null, '2018-10-04', null, null, '9422957', '899889988', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '460', null, '1', null);
INSERT INTO `Entidade` VALUES ('958', null, 'Paulo Manuel Silva Gonçalo', null, '917314898', null, '2018-10-04', null, null, '', '090909090', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '461', null, '1', null);
INSERT INTO `Entidade` VALUES ('959', null, 'Sonia da Conceição Proença Gouveia', null, '919405588', null, '2018-10-04', null, null, '09563001', '297301350', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '462', null, '1', null);
INSERT INTO `Entidade` VALUES ('960', null, 'Sandra Maria Jose Jardim Fernandes', null, '968366373/916254499', 'sandraquingosta@gmail.com', '2018-11-13', null, null, '13510959', '228140803', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '463', null, '1', null);
INSERT INTO `Entidade` VALUES ('961', null, 'Armindo da Silva e Matos', null, '969636126', 'armindosotam@gmail.com', '2018-10-04', null, null, '10334292', '196527651', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '464', null, '1', null);
INSERT INTO `Entidade` VALUES ('962', null, 'Alvaro Alexandre Soares Margarido dos Santos', null, '917813174', null, '2017-08-13', null, null, '10446872', '189702788', null, null, null, null, '2017-08-14', 'user.png', null, '5', null, '465', null, '1', null);
INSERT INTO `Entidade` VALUES ('963', null, 'Sofia Laura Gomes Branco de Matos Resende da Silva', null, '917374655', null, '2018-10-04', null, null, '11095195', '206873247', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '466', null, '1', null);
INSERT INTO `Entidade` VALUES ('964', null, 'Luis Avelino da Silva Figueiredo', null, '916340950', 'luis.avelino.figueiredo@gmail.com', '2018-10-04', null, null, '11786407', '212973606', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '467', null, '1', null);
INSERT INTO `Entidade` VALUES ('965', null, 'Nuno Filipe Silva Tavares Amador', null, '966112266', 'familiaamador@sapo.pt', '2018-11-13', null, null, '10284976', '199314675', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '468', null, '1', null);
INSERT INTO `Entidade` VALUES ('966', null, 'Anabela Valente Arrojado', null, '967619334', 'belarrojado@insuflaveis.com', '2018-10-04', null, null, '09909908', '241075041', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '469', null, '1', null);
INSERT INTO `Entidade` VALUES ('968', null, 'Alexandre Manuel Valente de Almeida', null, '965343295', 'alexgomi03@gmail.com', '2018-10-04', null, null, '9593839', '000000013', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '471', null, '1', null);
INSERT INTO `Entidade` VALUES ('969', null, 'Ana Luisa da Silva Figueiredo', null, '928024011', 'analuisa1382@hotmail.com', '2018-10-04', null, null, '12582137', '220868727', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '472', null, '1', null);
INSERT INTO `Entidade` VALUES ('970', null, 'Artur Jorge de Carvalho Fernandes', null, '913464807', 'artur.fcdef@hotmail.com', '2018-10-04', null, null, '13157358', '220658633', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '473', null, '1', null);
INSERT INTO `Entidade` VALUES ('971', null, 'Milton Cesar de Melo Garrido', null, '914897102', 'miltoncesargarrido@hotmail.com', '2018-10-04', null, null, '10390086', '209810149', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '474', null, '1', null);
INSERT INTO `Entidade` VALUES ('972', null, 'Pedro Miguel da Silva Matos', null, '966864720', 'pedromatos20101977@gmail.com', '2018-10-04', null, null, '11348750', '200016431', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '475', null, '1', null);
INSERT INTO `Entidade` VALUES ('973', null, 'Manuel Henriques da Silva Vieira', null, '964817896', 'Manuel.vieira16@hotmail.com', '2018-10-04', null, null, '10654176', '188969144', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '476', null, '1', null);
INSERT INTO `Entidade` VALUES ('974', null, 'Sonia Cristina Monteiro Rodrigues Soutinho', null, '965617779', 'srsoutinho@gmail.com', '2018-11-13', null, null, '09842801', '206987544', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '477', null, '1', null);
INSERT INTO `Entidade` VALUES ('975', null, 'Nuno Miguel Marques Ribeiro', null, '913413429', 'mantorras_ribeiro@hotmail.com', '2017-08-13', null, null, '10937923', '214873935', null, null, null, null, '2017-08-14', 'user.png', null, '5', null, '478', null, '1', null);
INSERT INTO `Entidade` VALUES ('976', null, 'Raquel Ribeiro da Silva Fernandes de Carvalho', null, '917799791', '', '2018-12-03', 'Vila Nova Famalicão', 'Portugal', '', '090909090', null, 'Bacharelato Incompleto', null, 'Empresário', '2018-12-04', 'user.png', null, '5', null, '479', null, '1', null);
INSERT INTO `Entidade` VALUES ('977', null, 'João Carlos Pereira Oliveira', '', '964288546', 'joaocarlos_quimico@hotmail.com', '2018-10-03', null, null, '09461904', '180572407', null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '480', null, '1', null);
INSERT INTO `Entidade` VALUES ('978', '1008739', 'Marcelo Rafael Silva Figueiredo', null, '915306501', 'paulojsfigueiredo@hotmail.com', '2001-10-05', 'Portuguesa', 'Portugal', '304741418', '238676633', null, '9º ano', null, null, '2018-11-14', 'user.png', null, '1', '128', '481', null, '0', null);
INSERT INTO `Entidade` VALUES ('979', null, 'Paulo José da Silva Figueiredo', null, '917297398', 'paulojsfigueiredo@hotmail.com', '2018-11-13', null, null, '10406814', '197167004', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '481', null, '1', null);
INSERT INTO `Entidade` VALUES ('980', '1073917', 'João António Santos Pinheiro', null, null, null, '2001-04-03', null, 'Portugal', '15494474', '250462664', null, '7º ano', 'Vitiligo (manchas brancas) - síndrome de Gilbert', null, '2017-11-13', 'user.png', null, '1', null, '482', null, '0', null);
INSERT INTO `Entidade` VALUES ('981', null, 'António Manuel da Silva Pinheiro', '', '914016094', null, '2017-11-12', null, null, '09653176', '196993717', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '482', null, '1', null);
INSERT INTO `Entidade` VALUES ('983', null, 'Eliana Soares Rodrigues', '916007434', '968126561', 'elianasoaresrodrigues@hotmail.com', '2017-05-18', null, null, '11609556', '215262204', null, null, null, null, '2017-05-19', 'user.png', null, '5', null, '483', null, '1', null);
INSERT INTO `Entidade` VALUES ('984', '9999999', 'Fábio Alexandre Lopes de Freitas', null, '916819202', null, '2000-07-13', null, 'Portugal', '14816128', '250857316', null, '10º ano', null, null, '2018-10-04', 'user.png', null, '1', '263', '484', null, '1', null);
INSERT INTO `Entidade` VALUES ('985', null, 'Luis Duarte Simões de Freitas', null, '964742481', 'simoesfreitas1964@gmail.com', '2018-10-03', null, null, '999999999', '999999999', null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '484', null, '1', null);
INSERT INTO `Entidade` VALUES ('986', null, 'Alice Maria de Oliveira Neves', '', '913699615', null, '2018-10-04', null, null, '10669675', '191104299', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '485', null, '1', null);
INSERT INTO `Entidade` VALUES ('987', null, 'Isabel Resende', '234838959', '910226367', 'moluscosresende@gmail.com', '2017-10-01', null, null, '11184054', '205530427', null, null, null, null, '2017-10-02', 'user.png', null, '5', null, '486', null, '1', null);
INSERT INTO `Entidade` VALUES ('988', null, 'Arminda Oliveira de Almeida Silva', '', '914360831', null, '2017-11-12', null, null, '10695440', '187195269', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '487', null, '1', null);
INSERT INTO `Entidade` VALUES ('989', null, 'Cláudia Cristina Esperança de Aguiar', null, '963911638', 'aguiar8@hotmail.com', '2018-10-04', null, null, '10618407', '206300344', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '488', null, '1', null);
INSERT INTO `Entidade` VALUES ('990', null, 'Vitor Paulo Almeida Amaral', null, '965158394', 'vitorpauloamaral@sapo.pt', '2018-11-13', null, null, '8542067', '999999999', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '489', null, '1', null);
INSERT INTO `Entidade` VALUES ('991', null, 'Ana Maria de Oliveira e Silva e Almeida', null, '918600504', 'anaalmeida36@hotmail.com', '2017-11-12', null, null, '09077256', '192259571', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '490', null, '1', null);
INSERT INTO `Entidade` VALUES ('992', null, 'Um Pai de Testes', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '491', null, '1', null);
INSERT INTO `Entidade` VALUES ('993', null, 'Uma Mae de Testes', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '492', null, '1', null);
INSERT INTO `Entidade` VALUES ('994', null, 'Clara Bela Neves Lopes Almeida', null, '913870888', 'clara.lopes.almeida@gmail.com', '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '493', null, '1', null);
INSERT INTO `Entidade` VALUES ('995', null, 'Maria de La Salete O. Tavares', null, '913623285', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '494', null, '1', null);
INSERT INTO `Entidade` VALUES ('996', null, 'António Manuel Pinto de Almeida', null, '912411436', 'toalmeida76@hotmail.com', '2019-01-14', null, null, null, null, null, null, null, null, '2019-01-15', 'user.png', null, '5', null, '495', null, '1', null);
INSERT INTO `Entidade` VALUES ('997', null, 'Sónia Regina Ramos Bernardo', null, '964438576', 'soniabernardo76@hotmail.com', '2018-08-30', null, null, null, null, null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '496', null, '1', null);
INSERT INTO `Entidade` VALUES ('998', null, 'Vitor Manuel Henriques Malafaia', null, '916817156', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '497', null, '1', null);
INSERT INTO `Entidade` VALUES ('999', null, 'Celeste Maria da Silva Barroqueiro Dias', null, '964713155', 'diasceleste@gmail.com', '2017-08-13', null, null, null, null, null, null, null, null, '2017-08-14', 'user.png', null, '5', null, '498', null, '1', null);
INSERT INTO `Entidade` VALUES ('1000', null, 'Ana Isabel Henriques de Azevedo', null, '964254226', 'anazevedo38@hotmail.com', '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '499', null, '1', null);
INSERT INTO `Entidade` VALUES ('1001', null, 'Manuel Avelino Martins Tavares', '', '965690967', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '500', null, '1', null);
INSERT INTO `Entidade` VALUES ('1002', null, 'Maria da Conceição', null, '912332619', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '501', null, '1', null);
INSERT INTO `Entidade` VALUES ('1003', null, 'Maria Cristina Saraiva de Sousa', null, '964447804', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '502', null, '1', null);
INSERT INTO `Entidade` VALUES ('1004', null, 'Beatriz da Conceição Matos Pereira sousa', null, '912779952', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '503', null, '1', null);
INSERT INTO `Entidade` VALUES ('1005', null, 'Susana Belinda Pereira Rodriguez', '', '916284159', 'sbelinda34@gmail.com', '2018-10-08', null, null, '', '928394876', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '504', null, '1', null);
INSERT INTO `Entidade` VALUES ('1006', null, 'Vitor Manuel Pinto Gonçalves', null, '961578091', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '505', null, '1', null);
INSERT INTO `Entidade` VALUES ('1007', null, 'Rosa Maria Aguiar Domingues', null, '964099788', 'rosa.domingues@gmail.com', '2018-10-08', null, null, '07465118-8-ZY6', '190269545', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '506', null, '1', null);
INSERT INTO `Entidade` VALUES ('1008', null, 'Manuel Augusto Oliveira Pinho', null, null, null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '507', null, '1', null);
INSERT INTO `Entidade` VALUES ('1009', null, 'Anabela da Silva Machado', null, '933268731', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '508', null, '1', null);
INSERT INTO `Entidade` VALUES ('1010', null, '...', null, null, null, '2017-08-09', null, null, null, null, null, null, null, null, '2017-08-10', 'user.png', null, '5', null, '509', null, '1', null);
INSERT INTO `Entidade` VALUES ('1011', null, 'Margarida Isabel Oliveira Marques', null, '966596553', 'marquesmarg@sapo.pt', '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '510', null, '1', null);
INSERT INTO `Entidade` VALUES ('1012', null, 'Paulo Jorge Pereira Vasconcelos', null, '963641390', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '511', null, '1', null);
INSERT INTO `Entidade` VALUES ('1013', null, 'Eva Maria Duarte Fonseca', null, '914264804', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '512', null, '1', null);
INSERT INTO `Entidade` VALUES ('1014', null, '.Arminda Maria Tavares Fernandes..', null, '962466406', 'armindamtfernandes@gmail.com', '2018-10-08', null, null, '10675675', '173249060', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '513', null, '1', null);
INSERT INTO `Entidade` VALUES ('1015', null, '.Arminda Maria Tavares Fernandes..', null, '962466406', 'armindamtfernandes@gmail.com', '2018-10-08', null, null, '11675675', '000000001', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '514', null, '1', null);
INSERT INTO `Entidade` VALUES ('1016', null, 'Bruno Cristiano Almeida Tavares', null, '965139263', null, '2018-11-14', null, null, '11942458', '213309823', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '515', null, '1', null);
INSERT INTO `Entidade` VALUES ('1017', null, 'Ana Daniel Santos Bastos', null, '965442517', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '516', null, '1', null);
INSERT INTO `Entidade` VALUES ('1018', null, 'Paula Cristina da Silva Marques Caneira', null, '918565440', null, '2017-08-15', null, null, '10866536', '198734905', null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '517', null, '1', null);
INSERT INTO `Entidade` VALUES ('1019', null, 'Alfredo Manuel Rodrigues Caneira', null, '919338088', null, '2017-08-15', null, null, null, null, null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '518', null, '1', null);
INSERT INTO `Entidade` VALUES ('1020', null, 'Paula Cristina da Silva Marques Caneira', null, '918565440', null, '2017-08-15', null, null, '10866536', '198734905', null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '519', null, '1', null);
INSERT INTO `Entidade` VALUES ('1021', null, 'Alfredo Manuel Rodrigues Caneira', null, '919338088', null, '2017-08-15', null, null, null, null, null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '520', null, '1', null);
INSERT INTO `Entidade` VALUES ('1022', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '521', null, '1', null);
INSERT INTO `Entidade` VALUES ('1023', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '522', null, '1', null);
INSERT INTO `Entidade` VALUES ('1024', null, 'Joel de Sousa Couto', null, '933845997', 'joelsousacouto@gmail.com', '2017-08-15', null, null, '12088127', '229895255', null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '523', null, '1', null);
INSERT INTO `Entidade` VALUES ('1025', null, 'Anabela Marques Rebelo Couto', null, '910484287', null, '2017-08-15', null, null, null, null, null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '524', null, '1', null);
INSERT INTO `Entidade` VALUES ('1026', null, 'Joel Sousa Couto', null, '933845997', 'joelsousacouto@gmail.com', '2018-10-22', null, null, '12088127', '229895255', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '525', null, '1', null);
INSERT INTO `Entidade` VALUES ('1027', null, 'Anabela Rebelo', null, '910484287', null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '526', null, '1', null);
INSERT INTO `Entidade` VALUES ('1028', null, 'Bruno Emanuel Oliveira e sousa', null, '917694206', null, '2018-10-22', null, null, '13171736', '222269359', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '527', null, '1', null);
INSERT INTO `Entidade` VALUES ('1029', null, 'Patrícia Liliana Sousa Dias', null, '918538190', null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '528', null, '1', null);
INSERT INTO `Entidade` VALUES ('1030', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '529', null, '1', null);
INSERT INTO `Entidade` VALUES ('1031', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '530', null, '1', null);
INSERT INTO `Entidade` VALUES ('1032', null, 'Liliana Patrícia Carvalho Reis', null, '936401711', 'marcolopes-lilireis@hotmail.com', '2018-10-22', null, null, '11977407', '213137941', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '531', null, '1', null);
INSERT INTO `Entidade` VALUES ('1033', null, 'Marco Pereira Lopes', null, '915323897', 'marcolopes-lilireis@hotmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '532', null, '1', null);
INSERT INTO `Entidade` VALUES ('1034', null, 'Daniel Oliveira da Silva', null, '962987857', 'daniel.silva@egi.com.pt', '2017-08-27', null, null, '10342886', '196527686', null, null, null, null, '2017-08-28', 'user.png', null, '5', null, '533', null, '1', null);
INSERT INTO `Entidade` VALUES ('1035', null, 'Gorete Silva Flávio', '234841047', null, null, '2017-08-27', null, null, null, null, null, null, null, null, '2017-08-28', 'user.png', null, '5', null, '534', null, '1', null);
INSERT INTO `Entidade` VALUES ('1036', null, 'Jorge Manuel de Almeida Faria', null, '919797327', 'jf.jorgefaria@gmail.com', '2018-10-22', null, null, '3333333', '444444444', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '535', null, '1', null);
INSERT INTO `Entidade` VALUES ('1037', null, 'Ilda Maria Silva Miranda Faria', null, '969015058', 'if.ildafaria@gmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '536', null, '1', null);
INSERT INTO `Entidade` VALUES ('1038', null, 'Sónia Patrícia Oliveira Henriques', null, '912659854', 'spohenriques@hotmail.com', '2018-10-22', null, null, '11967815', '211549908', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '537', null, '1', null);
INSERT INTO `Entidade` VALUES ('1039', null, 'Filipe Miguel Pires Ferreira', null, '911794100', 'fmpferreira@hotmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '538', null, '1', null);
INSERT INTO `Entidade` VALUES ('1040', null, 'Sérgio Reis', null, '918701968', 'reis.sergio@gmail.com', '2018-10-22', null, null, '10661133', '193075350', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '539', null, '1', null);
INSERT INTO `Entidade` VALUES ('1041', null, 'Cristina Reis', '', '917450067', 'cristinasilva.reis@gmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '540', null, '1', null);
INSERT INTO `Entidade` VALUES ('1042', null, 'Filipe Martinho Cipriano Ferreira', null, '911119207', 'fmcferreira@msn.com', '2018-10-22', null, null, '11086084', '203649532', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '541', null, '1', null);
INSERT INTO `Entidade` VALUES ('1043', null, 'Carla Alexandrina Veríssimo Almeida Ferreira', null, '911119217', null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '542', null, '1', null);
INSERT INTO `Entidade` VALUES ('1044', null, 'Verónica Alexandra de Oliveira Amador', null, '963111343', 'vaamador@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '543', null, '1', null);
INSERT INTO `Entidade` VALUES ('1045', null, 'Ana Sofia de Noronha Freire', null, '963577552', 'ananoronhafreire17@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '544', null, '1', null);
INSERT INTO `Entidade` VALUES ('1046', null, 'Claudia Ionela Pupaza Mortágua de Azevedo', null, '919052435', 'ionelaclaudia2014@gmail.com', '2018-10-09', null, null, '30571687', '246319623', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '545', null, '1', null);
INSERT INTO `Entidade` VALUES ('1047', null, 'Karina da Silva Tavares Ferreira', null, '965563272', 'karinast@netvisao.pt', '2017-08-15', null, null, null, null, null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '546', null, '1', null);
INSERT INTO `Entidade` VALUES ('1048', null, 'Sara Botte', null, '966756589', 'sarabotte@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '547', null, '1', null);
INSERT INTO `Entidade` VALUES ('1049', null, 'José Pedro Sá Couto Pinto Tavares', null, '969028100', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '548', null, '1', null);
INSERT INTO `Entidade` VALUES ('1050', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '549', null, '1', null);
INSERT INTO `Entidade` VALUES ('1051', null, 'Isabel Margarida da Silva Marques Nogueira', null, '919670706', 'isabelmsmnogueira@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '550', null, '1', null);
INSERT INTO `Entidade` VALUES ('1052', null, '...', null, null, null, '2017-07-03', null, null, null, null, null, null, null, null, '2017-07-04', 'user.png', null, '5', null, '551', null, '1', null);
INSERT INTO `Entidade` VALUES ('1053', null, 'Paula Cristina Gonçalves Fernandes Oliveira', null, '917872397', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '552', null, '1', null);
INSERT INTO `Entidade` VALUES ('1054', null, 'Bruno Rafael da Silva Fidalgo', null, '965228156', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '553', null, '1', null);
INSERT INTO `Entidade` VALUES ('1055', null, 'Carmen Tavares Rufino bandeira', null, '966430557', 'vmfbandeira@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '554', null, '1', null);
INSERT INTO `Entidade` VALUES ('1056', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '555', null, '1', null);
INSERT INTO `Entidade` VALUES ('1057', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '556', null, '1', null);
INSERT INTO `Entidade` VALUES ('1058', null, 'Susana Maria Marques Domingues Freire', null, '963513008', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '557', null, '1', null);
INSERT INTO `Entidade` VALUES ('1059', null, 'Célia Patrícia de Oliveira Alves', null, '914882841', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '558', null, '1', null);
INSERT INTO `Entidade` VALUES ('1060', null, 'Ana Gonçalves', '961614343', '962910307', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '559', null, '1', null);
INSERT INTO `Entidade` VALUES ('1061', null, 'José Augusto Proença Gouveia', null, '915245182', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '560', null, '1', null);
INSERT INTO `Entidade` VALUES ('1062', null, 'David Alfonso Castaño Velasquez', null, '920259622', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '561', null, '1', null);
INSERT INTO `Entidade` VALUES ('1063', null, '...', null, null, null, '2017-07-03', null, null, null, null, null, null, null, null, '2017-07-04', 'user.png', null, '5', null, '562', null, '1', null);
INSERT INTO `Entidade` VALUES ('1064', null, '...', null, null, null, '2017-07-03', null, null, null, null, null, null, null, null, '2017-07-04', 'user.png', null, '5', null, '563', null, '1', null);
INSERT INTO `Entidade` VALUES ('1065', null, '...', null, null, null, '2017-11-08', null, null, null, null, null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '564', null, '1', null);
INSERT INTO `Entidade` VALUES ('1066', null, 'Francisco Manuel Amador Dias Teques', null, null, null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '565', null, '1', null);
INSERT INTO `Entidade` VALUES ('1067', null, 'Ricardo Moreira e Silva', null, null, null, '2017-08-27', null, null, null, null, null, null, null, null, '2017-08-28', 'user.png', null, '5', null, '566', null, '1', null);
INSERT INTO `Entidade` VALUES ('1068', null, 'Ricardo Barbosa', null, '916262313', 'barbosaricardo773@gmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '567', null, '1', null);
INSERT INTO `Entidade` VALUES ('1069', null, 'Sandra Paula Silva Duarte', null, '910078211', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '568', null, '1', null);
INSERT INTO `Entidade` VALUES ('1070', null, 'Carlos Alberto Sousa Maia', null, '910859674', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '569', null, '1', null);
INSERT INTO `Entidade` VALUES ('1071', null, 'Cristina Isabel Lopes Ferro', null, '966606609', 'cristinailferro@gamil.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '570', null, '1', null);
INSERT INTO `Entidade` VALUES ('1072', null, 'Sara Cristina Valente da Silva', null, '937045000', 'saracvspinheiro@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '571', null, '1', null);
INSERT INTO `Entidade` VALUES ('1073', null, 'Mónica Alexandra de Sá Torres Simões', null, '965167883', 'mastsimoes@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '572', null, '1', null);
INSERT INTO `Entidade` VALUES ('1074', null, 'Sandra Couras', null, '966476384', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '573', null, '1', null);
INSERT INTO `Entidade` VALUES ('1075', null, 'Márcia Vitoria Castro Proença', null, '968345280', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '574', null, '1', null);
INSERT INTO `Entidade` VALUES ('1076', null, 'Fátima Elizabeth Lopes dos Santos', null, '918544544', 'fatinha.lopes79@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '575', null, '1', null);
INSERT INTO `Entidade` VALUES ('1077', null, 'Carina Isabel Fernandes Ramos', null, null, null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '576', null, '1', null);
INSERT INTO `Entidade` VALUES ('1078', null, 'Ilda Maria da Silva Miranda Faria', null, '969015058', 'if.ildafaria@gmail.com', '2018-10-08', null, null, '10890202', '218650884', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '577', null, '1', null);
INSERT INTO `Entidade` VALUES ('1079', null, 'Ricardo José Sousa Costa', null, '969302554', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '578', null, '1', null);
INSERT INTO `Entidade` VALUES ('1080', null, 'Fernanda Maria Silva Melo Soares', null, null, null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '579', null, '1', null);
INSERT INTO `Entidade` VALUES ('1081', null, 'Maria João Henriques da Costa Paiva', null, '962388100', null, '2017-11-08', null, null, null, null, null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '580', null, '1', null);
INSERT INTO `Entidade` VALUES ('1082', null, '...', null, null, null, '2017-11-08', null, null, null, null, null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '581', null, '1', null);
INSERT INTO `Entidade` VALUES ('1083', null, '...', null, null, null, '2017-11-08', null, null, null, null, null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '582', null, '1', null);
INSERT INTO `Entidade` VALUES ('1084', null, '...', null, null, null, '2017-11-08', null, null, null, null, null, null, null, null, '2017-11-09', 'user.png', null, '5', null, '583', null, '1', null);
INSERT INTO `Entidade` VALUES ('1085', null, 'Amândio António da Silva Pinto', null, '962687732', 'a.pinto.35@gmail.com', '2018-10-09', null, null, '10118267', '199584080', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '584', null, '1', null);
INSERT INTO `Entidade` VALUES ('1086', null, 'Emanuel Pereira Antunes Tomé', null, '913102448', 'epatome@yahoo.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '585', null, '1', null);
INSERT INTO `Entidade` VALUES ('1087', null, 'Celeste Maria Loureiro Pereira', null, null, null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '586', null, '1', null);
INSERT INTO `Entidade` VALUES ('1088', null, 'Cláudia Sófia Santos Rebelo', null, '913305040', 'cssr1973@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '587', null, '1', null);
INSERT INTO `Entidade` VALUES ('1089', null, 'Fernando Augusto Almeida Pinto', null, '966334664', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '588', null, '1', null);
INSERT INTO `Entidade` VALUES ('1090', null, 'Carla Alexandra Tavares Marques', null, '414639934', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '589', null, '1', null);
INSERT INTO `Entidade` VALUES ('1091', null, 'Ana Catarina Ferreira Antão', null, '965650099', 'ancosa10@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '590', null, '1', null);
INSERT INTO `Entidade` VALUES ('1092', null, 'Helena Maria Matoa Oliveira', null, '965661711', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '591', null, '1', null);
INSERT INTO `Entidade` VALUES ('1093', null, 'Carina Alexandra Vieira Castelhano Ruela', '', '910613547', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '592', null, '1', null);
INSERT INTO `Entidade` VALUES ('1094', null, 'Vera Sandra Montenegro Osório de Vinha', null, '925224432', 'veravinha@hotmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '593', null, '1', null);
INSERT INTO `Entidade` VALUES ('1095', null, 'Luis Miguel Henriques Carinha R. da Silva', null, '969178122', 'luis.carinha.silva@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '594', null, '1', null);
INSERT INTO `Entidade` VALUES ('1096', null, 'Carla Susana Rodrigues Padinha Rebelo', null, '910568595', 'susana.padinha@sapo.pt', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '595', null, '1', null);
INSERT INTO `Entidade` VALUES ('1097', null, 'Fernando Manuel de Almeida Henriques', null, '932448712', 'uba@sapo.pt', '2018-10-09', null, null, '10316564', '202937399', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '596', null, '1', null);
INSERT INTO `Entidade` VALUES ('1098', null, 'Liliana Catarina Almeida Gomes', null, '913984957', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '597', null, '1', null);
INSERT INTO `Entidade` VALUES ('1099', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '598', null, '1', null);
INSERT INTO `Entidade` VALUES ('1100', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '599', null, '1', null);
INSERT INTO `Entidade` VALUES ('1101', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '600', null, '1', null);
INSERT INTO `Entidade` VALUES ('1102', null, 'Sonia Cláudia Ferreira Pereira', null, '912049654', 'sofepereira@gmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '601', null, '1', null);
INSERT INTO `Entidade` VALUES ('1103', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '602', null, '1', null);
INSERT INTO `Entidade` VALUES ('1104', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '603', null, '1', null);
INSERT INTO `Entidade` VALUES ('1105', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '604', null, '1', null);
INSERT INTO `Entidade` VALUES ('1106', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '605', null, '1', null);
INSERT INTO `Entidade` VALUES ('1107', null, 'Lília Elisabeth Oliveira Marques', null, '964889532', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '606', null, '1', null);
INSERT INTO `Entidade` VALUES ('1108', null, 'Cristina', null, '963841626', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '607', null, '1', null);
INSERT INTO `Entidade` VALUES ('1109', null, 'Magda Alexandra L. Silva', null, '919275459', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '608', null, '1', null);
INSERT INTO `Entidade` VALUES ('1110', null, 'Cidália Cristina da Silva Resende Matos', null, '914993645', 'cidalia-cristina2011@hotmail.com', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '609', null, '1', null);
INSERT INTO `Entidade` VALUES ('1111', null, 'Sofia Laura Gomes Branco M. R. Silva', null, '917374655', 'slresende@hotmail.com', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '610', null, '1', null);
INSERT INTO `Entidade` VALUES ('1112', null, 'Deolinda Rosa da Silva Pita Pereira', '234865319', null, 'armgralho@sapo.pt', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '611', null, '1', null);
INSERT INTO `Entidade` VALUES ('1113', null, 'José Carlos Monteiro Alves', null, '919915024', 'jose.monteiro.alves@hotmail.com', '2018-10-05', null, null, '10256921', '180881426', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '612', null, '1', null);
INSERT INTO `Entidade` VALUES ('1114', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '613', null, '1', null);
INSERT INTO `Entidade` VALUES ('1115', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '614', null, '1', null);
INSERT INTO `Entidade` VALUES ('1116', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '615', null, '1', null);
INSERT INTO `Entidade` VALUES ('1117', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '616', null, '1', null);
INSERT INTO `Entidade` VALUES ('1118', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '617', null, '1', null);
INSERT INTO `Entidade` VALUES ('1119', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '618', null, '1', null);
INSERT INTO `Entidade` VALUES ('1120', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '619', null, '1', null);
INSERT INTO `Entidade` VALUES ('1121', null, 'Daniel da Silva Marques', null, null, null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '620', null, '1', null);
INSERT INTO `Entidade` VALUES ('1122', null, 'maria', null, null, null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '621', null, '1', null);
INSERT INTO `Entidade` VALUES ('1123', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '622', null, '1', null);
INSERT INTO `Entidade` VALUES ('1124', null, 'Cristina Maria Andrade da Costa Ventura', null, '964092143', 'ventura_cristina@sapo.pt', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '623', null, '1', null);
INSERT INTO `Entidade` VALUES ('1125', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '624', null, '1', null);
INSERT INTO `Entidade` VALUES ('1126', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '625', null, '1', null);
INSERT INTO `Entidade` VALUES ('1127', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '626', null, '1', null);
INSERT INTO `Entidade` VALUES ('1128', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '627', null, '1', null);
INSERT INTO `Entidade` VALUES ('1129', null, 'Paulo Jorge Fernandes Fima', null, '918189320', 'paulofima@gmail.com', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '628', null, '1', null);
INSERT INTO `Entidade` VALUES ('1130', null, 'Carla Cristina Marques Pereira da Silva', null, '917695622', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '629', null, '1', null);
INSERT INTO `Entidade` VALUES ('1131', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '630', null, '1', null);
INSERT INTO `Entidade` VALUES ('1132', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '631', null, '1', null);
INSERT INTO `Entidade` VALUES ('1133', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '632', null, '1', null);
INSERT INTO `Entidade` VALUES ('1134', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '633', null, '1', null);
INSERT INTO `Entidade` VALUES ('1135', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '634', null, '1', null);
INSERT INTO `Entidade` VALUES ('1136', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '635', null, '1', null);
INSERT INTO `Entidade` VALUES ('1137', null, 'Pedro Pereira Silva Alves', null, '914239904', null, '2018-11-28', null, null, null, null, null, null, null, null, '2018-11-29', 'user.png', null, '5', null, '636', null, '1', null);
INSERT INTO `Entidade` VALUES ('1138', null, '...', null, null, null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '637', null, '1', null);
INSERT INTO `Entidade` VALUES ('1139', null, 'José António Tavares Bandeira', null, '912291784', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '638', null, '1', null);
INSERT INTO `Entidade` VALUES ('1140', null, 'Lúcia Maria da Silva Rebelo', '', '968064736', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '639', null, '1', null);
INSERT INTO `Entidade` VALUES ('1141', null, 'Lúcia Maria da Silva Rebelo', null, null, null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '640', null, '1', null);
INSERT INTO `Entidade` VALUES ('1142', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '641', null, '1', null);
INSERT INTO `Entidade` VALUES ('1143', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '642', null, '1', null);
INSERT INTO `Entidade` VALUES ('1144', null, 'Carla Maria Soares Vidinha dos Santos', null, '917373265', null, '2017-08-13', null, null, null, null, null, null, null, null, '2017-08-14', 'user.png', null, '5', null, '643', null, '1', null);
INSERT INTO `Entidade` VALUES ('1145', null, 'Eugénia Maria Oliveira Bandeira', null, '964655773', 'eugenia_maria@sapo.pt', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '644', null, '1', null);
INSERT INTO `Entidade` VALUES ('1146', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '645', null, '1', null);
INSERT INTO `Entidade` VALUES ('1147', null, 'Fernando Figueiredo Soares', null, '962684351', 'fernandoseraos@sapo.pt', '2018-10-04', null, null, '11658520', '194527697', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '646', null, '1', null);
INSERT INTO `Entidade` VALUES ('1148', null, 'Sónia Maria Valente da Silva', null, '962877027', 'ainos.silva@gmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '647', null, '1', null);
INSERT INTO `Entidade` VALUES ('1149', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '648', null, '1', null);
INSERT INTO `Entidade` VALUES ('1150', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '649', null, '1', null);
INSERT INTO `Entidade` VALUES ('1151', null, '...', null, null, null, '2017-07-25', null, null, null, null, null, null, null, null, '2017-08-11', 'user.png', null, '5', null, '650', null, '1', null);
INSERT INTO `Entidade` VALUES ('1152', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '651', null, '1', null);
INSERT INTO `Entidade` VALUES ('1153', null, 'Deolinda de Jesus Aleixo Rebimbas', null, '966864903', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '652', null, '1', null);
INSERT INTO `Entidade` VALUES ('1154', null, 'Sérgio Domingo de Oliveira da Silva', null, '916040028', 'sdosilva@creditoagricola.pt', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '653', null, '1', null);
INSERT INTO `Entidade` VALUES ('1155', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '654', null, '1', null);
INSERT INTO `Entidade` VALUES ('1156', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '655', null, '1', null);
INSERT INTO `Entidade` VALUES ('1157', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '656', null, '1', null);
INSERT INTO `Entidade` VALUES ('1158', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '657', null, '1', null);
INSERT INTO `Entidade` VALUES ('1159', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '658', null, '1', null);
INSERT INTO `Entidade` VALUES ('1160', null, 'Maria Liliana Rodrigues da Silva Viana', null, '917421656', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '659', null, '1', null);
INSERT INTO `Entidade` VALUES ('1161', null, 'Susana Maria Marques Domingues Freire', null, '963513008', 'sfreire74@gmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '660', null, '1', null);
INSERT INTO `Entidade` VALUES ('1162', null, 'Elisabete Pinho Salgado Rebelo', null, '964660779', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '661', null, '1', null);
INSERT INTO `Entidade` VALUES ('1163', null, 'Carla Alexandra Veríssimo Almeida Ferreira', null, '911119217', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '662', null, '1', null);
INSERT INTO `Entidade` VALUES ('1164', null, 'Sandra Maria Silva Oliveira', null, '965755145', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '663', null, '1', null);
INSERT INTO `Entidade` VALUES ('1165', null, 'Carla Sófia Ramos Silva Oliveira', null, '913640156', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '664', null, '1', null);
INSERT INTO `Entidade` VALUES ('1166', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '665', null, '1', null);
INSERT INTO `Entidade` VALUES ('1167', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '666', null, '1', null);
INSERT INTO `Entidade` VALUES ('1168', null, 'Paula Pereira da Fonseca', null, '966298460', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '667', null, '1', null);
INSERT INTO `Entidade` VALUES ('1169', null, 'Custódio Manuel Barbosa da Cunha', null, '961526803', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '668', null, '1', null);
INSERT INTO `Entidade` VALUES ('1170', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '669', null, '1', null);
INSERT INTO `Entidade` VALUES ('1171', null, 'Vitor José da Fonseca Lopes Carvalho', null, '917067556', 'vitor.lopes@ua.pt', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '670', null, '1', null);
INSERT INTO `Entidade` VALUES ('1172', null, 'Mário Sérgio da Silva Ruela', null, null, null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '671', null, '1', null);
INSERT INTO `Entidade` VALUES ('1173', null, 'Lúcia Maria Resende Silva', null, '912731212', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '672', null, '1', null);
INSERT INTO `Entidade` VALUES ('1174', null, 'Maria Elisabete de Amorim Machado', null, '935908262', 'betasalo@hotmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '673', null, '1', null);
INSERT INTO `Entidade` VALUES ('1175', null, 'Carla Sófia da Silva Rebe', null, '964395083', 'carlasilvarebelo@gmail.com', '2018-11-13', null, null, '11093899', '206997450', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '674', null, '1', null);
INSERT INTO `Entidade` VALUES ('1176', null, 'Cristina Maria Marques Soares Castro', null, '963342799', null, '2017-08-27', null, null, null, null, null, null, null, null, '2017-08-28', 'user.png', null, '5', null, '675', null, '1', null);
INSERT INTO `Entidade` VALUES ('1177', null, 'Célia Maria da Silva Pinto', null, '912665086', null, '2018-11-13', null, null, '11085753', '199584052', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '676', null, '1', null);
INSERT INTO `Entidade` VALUES ('1178', null, 'Patrícia Raquel S. G. R. Couto', null, '966059100', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '677', null, '1', null);
INSERT INTO `Entidade` VALUES ('1179', null, '...', null, null, null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '678', null, '1', null);
INSERT INTO `Entidade` VALUES ('1180', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '679', null, '1', null);
INSERT INTO `Entidade` VALUES ('1181', null, 'Gabriela Maria Tavares da Silva Cirne', null, '916942783', null, '2018-10-03', null, null, null, null, null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '680', null, '1', null);
INSERT INTO `Entidade` VALUES ('1182', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '681', null, '1', null);
INSERT INTO `Entidade` VALUES ('1183', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '682', null, '1', null);
INSERT INTO `Entidade` VALUES ('1184', null, 'Clarinda Marques', null, '966191255', 'clarinda.marques@gmail.com', '2018-10-03', null, null, null, null, null, null, null, null, '2018-10-04', 'user.png', null, '5', null, '683', null, '1', null);
INSERT INTO `Entidade` VALUES ('1185', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '684', null, '1', null);
INSERT INTO `Entidade` VALUES ('1186', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '685', null, '1', null);
INSERT INTO `Entidade` VALUES ('1187', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '686', null, '1', null);
INSERT INTO `Entidade` VALUES ('1188', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '687', null, '1', null);
INSERT INTO `Entidade` VALUES ('1189', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '688', null, '1', null);
INSERT INTO `Entidade` VALUES ('1190', null, 'Carlos André da Silva Anjos', null, '919444849 . Tia', null, '2018-11-13', null, null, '111111111', '222222222', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '689', null, '1', null);
INSERT INTO `Entidade` VALUES ('1191', null, 'Maria de Fátima Conceição Pais Correia', '', '919444849 . Tia', null, '2018-11-13', null, null, '33333333', '444444444', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '690', null, '1', null);
INSERT INTO `Entidade` VALUES ('1192', null, '...', null, null, null, '2019-07-07', null, null, null, null, null, null, null, null, '2019-07-08', 'user.png', null, '5', null, '691', null, '1', null);
INSERT INTO `Entidade` VALUES ('1193', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '692', null, '1', null);
INSERT INTO `Entidade` VALUES ('1194', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '693', null, '1', null);
INSERT INTO `Entidade` VALUES ('1195', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '694', null, '1', null);
INSERT INTO `Entidade` VALUES ('1196', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '695', null, '1', null);
INSERT INTO `Entidade` VALUES ('1197', null, 'Gracinda da Silva Carinha Dias', null, null, null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '696', null, '1', null);
INSERT INTO `Entidade` VALUES ('1198', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '697', null, '1', null);
INSERT INTO `Entidade` VALUES ('1199', null, 'Mário José Oliveira Barge', null, '919192518', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '698', null, '1', null);
INSERT INTO `Entidade` VALUES ('1200', null, 'Ana Rosa Cerqueira Pereira Costa', null, '915388520', null, '2017-08-13', null, null, null, null, null, null, null, null, '2017-08-14', 'user.png', null, '5', null, '699', null, '1', null);
INSERT INTO `Entidade` VALUES ('1201', null, 'Sandra Cristina Marques Matos', null, '969487583', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '700', null, '1', null);
INSERT INTO `Entidade` VALUES ('1202', null, 'Francisco Lopes Resende', null, '910226367', 'moluscosresende@gmail.com', '2017-10-01', null, null, null, null, null, null, null, null, '2017-10-02', 'user.png', null, '5', null, '701', null, '1', null);
INSERT INTO `Entidade` VALUES ('1203', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '702', null, '1', null);
INSERT INTO `Entidade` VALUES ('1204', null, '', null, null, null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '703', null, '1', null);
INSERT INTO `Entidade` VALUES ('1205', null, 'Paulo Jorge de Almeida Baptista', null, '913471789', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '704', null, '1', null);
INSERT INTO `Entidade` VALUES ('1206', null, 'Maria do Carmo Silva', null, '969335761', 'mcarmosilva2@sapo.pt', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '705', null, '1', null);
INSERT INTO `Entidade` VALUES ('1207', null, 'Jorge Miguel Pereira Guiomar', null, '934194002', 'jorge_guiomar@portugalmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '706', null, '1', null);
INSERT INTO `Entidade` VALUES ('1208', null, 'Maria de Fátima Silva Pires Nunes Valente', null, '913915164', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '707', null, '1', null);
INSERT INTO `Entidade` VALUES ('1209', null, 'Pedro Nuno Pereira Almeida M. Pinto', null, '966044634', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '708', null, '1', null);
INSERT INTO `Entidade` VALUES ('1210', null, 'Carlos Miguel Branco Moreira', null, '963994886', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '709', null, '1', null);
INSERT INTO `Entidade` VALUES ('1211', null, 'Sofia Manuela Monteiro Luz Figueiredo', null, '910297186', 'sofia_figueiredo@hotmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '710', null, '1', null);
INSERT INTO `Entidade` VALUES ('1212', null, 'Alcino José Dias de Sousa', null, '968046488', 'alcinosoos@hotmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '711', null, '1', null);
INSERT INTO `Entidade` VALUES ('1213', null, 'Jesus Quingosta Valente Tavares', null, '968366373', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '712', null, '1', null);
INSERT INTO `Entidade` VALUES ('1214', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '713', null, '1', null);
INSERT INTO `Entidade` VALUES ('1215', null, 'Almerindo Fernando Valente Ribeiro', null, '961839977', 'fernando1968@live.com.pt', '2018-11-13', null, null, '12042942', '199794421', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '714', null, '1', null);
INSERT INTO `Entidade` VALUES ('1216', null, 'Paula Cristina Correia da Silva Ferreira Ribeiro', null, '962996475', 'paularibeiro1969@live.com.pt', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '715', null, '1', null);
INSERT INTO `Entidade` VALUES ('1217', null, 'Paulo Queirós', null, '962085287', 'pauloqueiros72@hotmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '716', null, '1', null);
INSERT INTO `Entidade` VALUES ('1218', null, 'Paulo César Correia Soutinho', null, '965628308', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '717', null, '1', null);
INSERT INTO `Entidade` VALUES ('1219', null, 'Cristina Maria Gomes Santos', null, null, null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '718', null, '1', null);
INSERT INTO `Entidade` VALUES ('1220', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '719', null, '1', null);
INSERT INTO `Entidade` VALUES ('1221', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '720', null, '1', null);
INSERT INTO `Entidade` VALUES ('1222', null, 'Maria Florinda dos Santos Maia', null, '964658304', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '721', null, '1', null);
INSERT INTO `Entidade` VALUES ('1223', null, 'António Manuel Matos dos Santos', null, '962533978', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '722', null, '1', null);
INSERT INTO `Entidade` VALUES ('1224', null, 'Celia Marlene Ruivo Freitas Garrido', null, '914897368', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '723', null, '1', null);
INSERT INTO `Entidade` VALUES ('1225', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '724', null, '1', null);
INSERT INTO `Entidade` VALUES ('1226', null, 'Susana Raquel Silva Valente', null, '917297398', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '725', null, '1', null);
INSERT INTO `Entidade` VALUES ('1227', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '726', null, '1', null);
INSERT INTO `Entidade` VALUES ('1228', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '727', null, '1', null);
INSERT INTO `Entidade` VALUES ('1229', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '728', null, '1', null);
INSERT INTO `Entidade` VALUES ('1230', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '729', null, '1', null);
INSERT INTO `Entidade` VALUES ('1231', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '730', null, '1', null);
INSERT INTO `Entidade` VALUES ('1232', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '731', null, '1', null);
INSERT INTO `Entidade` VALUES ('1233', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '732', null, '1', null);
INSERT INTO `Entidade` VALUES ('1234', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '733', null, '1', null);
INSERT INTO `Entidade` VALUES ('1235', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '734', null, '1', null);
INSERT INTO `Entidade` VALUES ('1236', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '735', null, '1', null);
INSERT INTO `Entidade` VALUES ('1237', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '736', null, '1', null);
INSERT INTO `Entidade` VALUES ('1238', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '737', null, '1', null);
INSERT INTO `Entidade` VALUES ('1239', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '738', null, '1', null);
INSERT INTO `Entidade` VALUES ('1240', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '739', null, '1', null);
INSERT INTO `Entidade` VALUES ('1241', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '740', null, '1', null);
INSERT INTO `Entidade` VALUES ('1242', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '741', null, '1', null);
INSERT INTO `Entidade` VALUES ('1243', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '742', null, '1', null);
INSERT INTO `Entidade` VALUES ('1244', null, '...', null, null, null, '2017-06-29', null, null, null, null, null, null, null, null, '2017-06-30', 'user.png', null, '5', null, '743', null, '1', null);
INSERT INTO `Entidade` VALUES ('1245', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '744', null, '1', null);
INSERT INTO `Entidade` VALUES ('1246', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '745', null, '1', null);
INSERT INTO `Entidade` VALUES ('1247', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '746', null, '1', null);
INSERT INTO `Entidade` VALUES ('1248', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '747', null, '1', null);
INSERT INTO `Entidade` VALUES ('1249', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '748', null, '1', null);
INSERT INTO `Entidade` VALUES ('1250', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '749', null, '1', null);
INSERT INTO `Entidade` VALUES ('1251', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '750', null, '1', null);
INSERT INTO `Entidade` VALUES ('1252', null, '...', null, null, null, '2017-11-12', null, null, null, null, null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '751', null, '1', null);
INSERT INTO `Entidade` VALUES ('1253', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '752', null, '1', null);
INSERT INTO `Entidade` VALUES ('1254', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '753', null, '1', null);
INSERT INTO `Entidade` VALUES ('1255', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '754', null, '1', null);
INSERT INTO `Entidade` VALUES ('1256', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '755', null, '1', null);
INSERT INTO `Entidade` VALUES ('1257', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '756', null, '1', null);
INSERT INTO `Entidade` VALUES ('1258', null, '...', null, null, null, '2018-10-01', null, null, null, null, null, null, null, null, '2018-10-02', 'user.png', null, '5', null, '757', null, '1', null);
INSERT INTO `Entidade` VALUES ('1259', '1194383', 'Tiago Aleixo Vieira', null, '964817896', null, '2008-07-27', 'Veiros', 'Portugal', '15838331', '266393764', 'A+', '3º ano', null, null, '2018-10-10', 'user.png', null, '1', '10', '758', null, '1', null);
INSERT INTO `Entidade` VALUES ('1260', null, 'Deolinda de Jesus Aleixo Rebimbas', null, '966864903', '', '2018-10-09', null, null, '', '000000000', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '759', null, '1', null);
INSERT INTO `Entidade` VALUES ('1261', null, 'Manuel Henriques Silva Vieira', null, '964817896', 'manuel.vieira16@hotmail.com', '2017-07-07', null, null, '10654176', null, null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '760', null, '1', null);
INSERT INTO `Entidade` VALUES ('1262', '1194694', 'Guilherme Marques Silva', '234292800', '962568986', 'ana.l.marques@hotmail.com', '2008-06-12', null, 'Portugal', '156866846', '264878515', 'A+', '4º Ano', 'Agnesia renal à direita', null, '2018-10-10', 'user.png', null, '1', '14', '761', null, '1', null);
INSERT INTO `Entidade` VALUES ('1263', null, 'Cristovão Manuel Marques Silva', '234292800', '962568986', 'caisrib@aeiou.pt', '2018-10-09', null, null, '101674147ZY6', '202160068', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '762', null, '1', null);
INSERT INTO `Entidade` VALUES ('1264', null, 'Ana Luísa Silva Marques', null, '966845584', 'ana.l.marques@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '763', null, '1', null);
INSERT INTO `Entidade` VALUES ('1265', '11111111111', 'Daniel José da Silva Naia', null, '918982777', 'marisa.naia@hotmail.com', '2007-03-14', 'Murtosa', 'Portugal', '30107085', '259474398', null, '5º Ano', null, null, '2018-11-14', 'user.png', null, '1', '30', '764', null, '0', '1');
INSERT INTO `Entidade` VALUES ('1266', null, 'Luís Alberto Naia Oliveira', null, '918982777', null, '2018-11-13', null, null, '12239481', '225521679', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '765', null, '1', null);
INSERT INTO `Entidade` VALUES ('1267', null, 'Marisa Andreia Tavares e Silva Naia', null, '918982777', 'marisa.naia@hotmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '766', null, '1', null);
INSERT INTO `Entidade` VALUES ('1268', '1220082', 'Rodrigo Oliveira Fernandes', null, '919409968', 'joaojtf@gmail.com', '2011-12-19', 'Estarreja', 'Portugal', '30884099', '277558077', null, null, null, null, '2018-11-15', 'user.png', null, '1', '33', '767', null, '0', null);
INSERT INTO `Entidade` VALUES ('1269', null, 'João José Tavares Fernandes', null, '919409968', 'joaojtf@gmail.com', '2018-11-14', null, null, '12390144', '231958846', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '768', null, '1', null);
INSERT INTO `Entidade` VALUES ('1270', null, 'Carla Alexandra de Pinho Oliveira', null, '913640232', 'mina.alex72@gmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '769', null, '1', null);
INSERT INTO `Entidade` VALUES ('1271', '1035033', 'Gonçalo Miguel Fonseca Lopes', null, null, 'goncas.lopes6@gmail.com', '2003-04-26', null, 'Portugal', '30573033', '247367125', null, '8º Ano', null, null, '2018-10-05', 'user.png', null, '1', '40', '770', null, '1', null);
INSERT INTO `Entidade` VALUES ('1272', null, 'Márcio Miguel Costa Ramos Lopes', null, '966000515', 'marcio.lopes@cuf.pt', '2018-10-04', null, null, '11239852', '173330304', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '771', null, '1', null);
INSERT INTO `Entidade` VALUES ('1273', null, 'Patrícia Alexandra Resende da Fonseca', null, '964105302', 'patrfonseca@iol.pt', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '772', null, '1', null);
INSERT INTO `Entidade` VALUES ('1274', '1077655', 'Francisco José Couto Alho', null, '960124778', null, '2005-06-21', 'Portuguesa', 'Portugal', '30980854', '257440151', null, '7º Ano', null, null, '2018-10-06', 'user.png', null, '1', '41', '773', null, '1', '1');
INSERT INTO `Entidade` VALUES ('1275', null, 'Eugénia Maria de Oliveira Couto', null, '968848929', 'eugeniacouto69@mail.com', '2018-10-05', null, null, '08649328', '198734980', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '774', null, '1', null);
INSERT INTO `Entidade` VALUES ('1276', '1199989', 'Daniel Pinho OLiveira', '914221068', '918464626', 'luisoliveirams@gmail.com', '2009-01-12', 'Santa Maria da Feira', 'Portugal', '15902616', '267706901', 'A+', null, null, null, '2018-10-10', 'user.png', null, '1', '42', '775', null, '1', null);
INSERT INTO `Entidade` VALUES ('1277', null, 'Luis Manuel Santos Oliveira', null, '914221068', 'luisoliveirams@gmail.com', '2018-10-09', null, null, '10866827', '203456912', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '776', null, '1', null);
INSERT INTO `Entidade` VALUES ('1278', null, 'Tânia Décia Oliveira Pinho', null, '918464626', 'taniadecia@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '777', null, '1', null);
INSERT INTO `Entidade` VALUES ('1279', '0000001111', 'Miguel Duarte Ferreira', null, '915460106', null, '2013-07-25', 'Avanca', 'Portugal', '31272923', '281308098', 'O-', null, 'Alergias', null, '2018-11-15', 'user.png', null, '1', '57', '778', null, '1', null);
INSERT INTO `Entidade` VALUES ('1280', null, 'Vera Gracinda Alves Duarte', null, '915460103', null, '2018-11-14', null, null, '31272923', '281308098', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '779', null, '1', null);
INSERT INTO `Entidade` VALUES ('1281', null, 'Luis Miguel Santos Ferreira', null, '914555749', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '780', null, '1', null);
INSERT INTO `Entidade` VALUES ('1282', '1181727', 'Leandro Ramos Rodrigues', null, null, null, '2006-09-08', null, 'Portugal', '30466060', '258196912', null, '6ª ano', null, null, '2018-08-31', 'user.png', null, '1', '58', '781', null, '0', null);
INSERT INTO `Entidade` VALUES ('1283', null, 'Sónia Cristina Lopes Ramos', null, '964714922', 'sonialean@gmail.com', '2018-08-30', null, null, '12676217', '221194843', null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '782', null, '1', null);
INSERT INTO `Entidade` VALUES ('1284', null, 'Jorge Alexandre dos Santos Rodrigues', null, '967886413', null, '2018-08-30', null, null, null, null, null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '783', null, '1', null);
INSERT INTO `Entidade` VALUES ('1285', '1118402', 'Guilherme Tavares Moreira', null, null, null, '2008-01-30', 'Coimbra', 'Portugal', '15571902', '262870614', null, '4º Ano', null, null, '2018-10-10', 'user.png', null, '1', '62', '784', null, '1', '1');
INSERT INTO `Entidade` VALUES ('1286', null, 'Maribel Rodrigues Tavares', null, '925890149', 'tavaresmaribel@gmail.com', '2018-10-09', null, null, '12501777', '173330460', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '785', null, '1', null);
INSERT INTO `Entidade` VALUES ('1287', null, 'Pedro José Pinto Moreira', null, '968272483', 'pedro.moreira@coriente.pt', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '786', null, '1', null);
INSERT INTO `Entidade` VALUES ('1288', '1194696', 'André Filipe Maia Dias', null, '912565276', null, '2006-01-16', null, 'Portugal', '30285007', '255587058', 'A+', null, null, null, '2018-08-31', 'user.png', null, '1', '68', '787', null, '0', null);
INSERT INTO `Entidade` VALUES ('1289', null, 'Orlando da Silva Dias', null, '918960569', 'orlandodias@live.com.pt', '2018-08-30', null, null, '13320184', '164213384', null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '788', null, '1', null);
INSERT INTO `Entidade` VALUES ('1290', null, 'Maria Florinda dos Santos Maia', null, '964658304', null, '2018-08-30', null, null, null, null, null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '789', null, '1', null);
INSERT INTO `Entidade` VALUES ('1291', '1204181', 'David Garcia de Pinho e Silva', null, '938116540', 'ruijorge13@gmail.com', '2009-05-01', null, 'Portugal', '15992592', '269982043', 'O+', null, null, null, '2018-10-10', 'user.png', null, '1', '84', '790', null, '1', null);
INSERT INTO `Entidade` VALUES ('1292', null, 'Rui Jorge de Oliveira Pinho e Silva', null, '938116540', 'ruijorge13@gmail.com', '2018-10-09', null, null, '10545405', '203438159', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '791', null, '1', null);
INSERT INTO `Entidade` VALUES ('1293', null, 'Ana Carla Vilhena Garcia', null, '969569725', 'vilhenagarcia1976@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '792', null, '1', null);
INSERT INTO `Entidade` VALUES ('1294', '1165432', 'João Tomás da Silva Pires', null, '916338505', null, '2005-10-29', null, 'Portugal', '31511921', '258625295', null, '8º Ano', null, null, '2018-10-06', 'user.png', null, '1', '85', '793', null, '1', null);
INSERT INTO `Entidade` VALUES ('1295', null, 'Liz Paulo Marques Dias Silva Pires', null, '916338505', null, '2018-10-05', null, null, '10239094', '234321677', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '794', null, '1', null);
INSERT INTO `Entidade` VALUES ('1296', null, 'Maria Julieta F. Silva Pires', null, '916299285', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '795', null, '1', null);
INSERT INTO `Entidade` VALUES ('1297', '0000005', 'Luis Henrique Bandeira Oliveira Mendonça', null, '916616685', null, '2004-09-08', null, 'Portugal', '30707356', '249600625', null, null, null, null, '2018-10-06', 'user.png', null, '1', '86', '796', null, '1', null);
INSERT INTO `Entidade` VALUES ('1298', null, 'João António Silva Caldas Oliveira Mendonça', null, '916616685', null, '2018-10-05', null, null, '89898989', '121212121', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '797', null, '1', null);
INSERT INTO `Entidade` VALUES ('1299', null, 'Maria Margarida Reis Cunha Silva Bandeira', null, '916652041', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '798', null, '1', null);
INSERT INTO `Entidade` VALUES ('1300', '00990099', 'Ricardo Andrade Magalhães', null, '969430742', 'ricardomagalhaes2005@hotmail.com', '2005-09-03', 'Estarreja', 'Portugal', '30791364', '257549129', 'O+', '6º Ano', null, null, '2018-11-29', 'user.png', null, '1', '87', '799', null, '0', '1');
INSERT INTO `Entidade` VALUES ('1301', null, 'Vitor Manuel Ribeiro Magalhães', null, '967835811', 'vmrm69@sapo.pt', '2018-11-28', null, null, '09323938', '183065670', null, null, null, null, '2018-11-29', 'user.png', null, '5', null, '800', null, '1', null);
INSERT INTO `Entidade` VALUES ('1302', null, 'Lúcia de Fátima Ribeiro Andrade', null, '967835305', 'luciandrade1972@hotmail.com', '2018-11-28', null, null, null, null, null, null, null, null, '2018-11-29', 'user.png', null, '5', null, '801', null, '1', null);
INSERT INTO `Entidade` VALUES ('1303', '1013106', 'Pedro Miguel Fonseca Valente', null, '915099954', 'pedromfvalente@gmail.com', '2002-05-12', 'Válega', 'Portugal', '30102799', '240916590', null, null, null, null, '2018-10-05', 'user.png', null, '1', '93', '802', null, '1', null);
INSERT INTO `Entidade` VALUES ('1304', null, 'Olímpio Manuel Marques Valente', null, '919702492', null, '2018-10-04', null, null, '56764323', '678765432', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '803', null, '1', null);
INSERT INTO `Entidade` VALUES ('1305', null, 'Maria de Fátima Borges Fonseca Valente', null, '914753726', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '804', null, '1', null);
INSERT INTO `Entidade` VALUES ('1306', '0000000000009', 'Tomás Garrido Pereira', null, '910672913', null, '2007-06-29', null, 'Portugal', '31234201', '263045200', null, '4º Ano', null, null, '2018-10-09', 'user.png', null, '1', '96', '805', null, '1', null);
INSERT INTO `Entidade` VALUES ('1307', null, 'Adelinda de Fátima Marques G. Valente', null, '964584646', 'adelindamgarrido@gmail.com', '2018-10-08', null, null, '09930633', '181276690', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '806', null, '1', null);
INSERT INTO `Entidade` VALUES ('1308', null, 'Carlos Alberto da Silva Pereira', null, '965570662', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '807', null, '1', null);
INSERT INTO `Entidade` VALUES ('1309', '1220084', 'Santiago Silva Matos Couras', null, null, null, '2012-01-25', 'Murtosa', 'Portugal', '30909264', '279574541', null, null, null, null, '2017-08-16', 'user.png', null, '1', '98', '808', null, '1', null);
INSERT INTO `Entidade` VALUES ('1310', null, 'Liliana Filipa Tavares Valente Couras', null, '914371724', null, '2017-08-15', null, null, '23454342', '123455432', null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '809', null, '1', null);
INSERT INTO `Entidade` VALUES ('1311', null, 'Sérgio Fernando da Silva Matos', null, '914836959', null, '2017-08-15', null, null, null, null, null, null, null, null, '2017-08-16', 'user.png', null, '5', null, '810', null, '1', null);
INSERT INTO `Entidade` VALUES ('1312', '1197719', 'Martim Pimenta Paiva', null, '964195312', null, '2007-01-30', 'Bunheiro', 'Portugal', '30903747', '259337242', null, null, null, null, '2018-10-10', 'user.png', null, '1', '100', '811', null, '1', null);
INSERT INTO `Entidade` VALUES ('1313', null, 'Sérgio Manuel Oliveira Paiva', null, '964195312', 'sergiomopaiva@gmail.com', '2018-10-09', null, null, '11095180', '207602905', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '812', null, '1', null);
INSERT INTO `Entidade` VALUES ('1314', null, 'Marina Isabel Silva Pimenta Paiva', null, '963904755', 'marinaispimentep@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '813', null, '1', null);
INSERT INTO `Entidade` VALUES ('1315', '1213417', 'Samuel Oliveira Silva Flávio', null, '962987857', null, '2010-07-31', null, 'Portugal', '30448998', '272858346', 'O+', null, null, null, '2018-10-23', 'user.png', null, '1', '103', '814', null, '1', '1');
INSERT INTO `Entidade` VALUES ('1316', null, 'Daniel Oliveira da Silva', null, '962987857', 'daniel.silva@egi.com.pt', '2018-10-22', null, null, '10342886', '196527686', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '815', null, '1', null);
INSERT INTO `Entidade` VALUES ('1317', null, 'Gorete da Silva Flávio', '234841047', null, null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '816', null, '1', null);
INSERT INTO `Entidade` VALUES ('1318', null, 'Armando José Silva Alho', null, null, null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '817', null, '1', null);
INSERT INTO `Entidade` VALUES ('1319', '6787650', 'Marco António de Almeida Dias', null, '933677263', null, '2003-09-09', 'Portuguesa', 'Portugal', '30814047', '275513564', null, '8º Ano', null, null, '2018-10-05', 'user.png', null, '1', '120', '818', null, '1', null);
INSERT INTO `Entidade` VALUES ('1320', null, 'Paulo António Valente Dias', null, '938420044', 'paulo.dias1975@hotmail.com', '2018-10-04', null, null, '10595867', '199584176', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '819', null, '1', null);
INSERT INTO `Entidade` VALUES ('1321', null, 'Susana Ferreira de Almeida Dias', null, '933325619', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '820', null, '1', null);
INSERT INTO `Entidade` VALUES ('1322', '1200624', 'Ivo Resende Valente', null, '938880094', 'valenteartur@gmail.com', '2009-01-28', 'Portuguesa', 'Portugal', '15963450', '268329753', null, '2º Ano', null, null, '2018-10-10', 'user.png', null, '1', '121', '821', null, '1', null);
INSERT INTO `Entidade` VALUES ('1323', null, 'Artur Jorge Correia Valente', null, '938880094', 'valenteartur@gmail.com', '2018-10-09', null, null, '15963450', '268329753', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '822', null, '1', null);
INSERT INTO `Entidade` VALUES ('1324', null, 'Susana Santos Resende', null, '931042849', 'resendesusana@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '823', null, '1', null);
INSERT INTO `Entidade` VALUES ('1325', '1195718', 'Jorge André Almeida Pinho', null, '912304963', null, '2004-02-10', 'Bunheiro', 'Portugal', '30363255', '259435210', null, '7º Ano', null, null, '2018-11-14', 'user.png', null, '1', '124', '824', null, '0', null);
INSERT INTO `Entidade` VALUES ('1326', null, 'Jorge Filipe Duarte Pinho', null, '919662857', 'duarte.pinho1981@outlook.pt', '2018-11-13', null, null, '11944638', '224823280', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '825', null, '1', null);
INSERT INTO `Entidade` VALUES ('1327', null, 'Rosaria de Lurdes Almeida Casalinho', null, '0101010101', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '826', null, '1', null);
INSERT INTO `Entidade` VALUES ('1330', '658634', 'Gustavo Manuel Fonseca Magalhães', null, '911960014', 'gmf.magalhães@gmail.com', '1988-10-10', null, 'Portugal', '13352416', '254399258', null, null, null, null, '2017-10-14', 'user.png', null, '1', '129', '829', null, '1', null);
INSERT INTO `Entidade` VALUES ('1331', '822267', 'João Miguel Fernandes Pinho', null, '915932655', null, '1995-09-16', null, 'Portugal', '14515051', '231394993', null, null, null, null, '2018-10-04', 'user.png', null, '1', '130', '830', null, '1', null);
INSERT INTO `Entidade` VALUES ('1332', '848571', 'Tiago Miguel Miranda Silva', null, '910096480', 'tiagommiranda@gmail.com', '1996-04-09', null, 'Portugal', '14706659', '248740369', null, null, null, null, '2018-10-02', 'user.png', null, '1', '131', '831', null, '0', null);
INSERT INTO `Entidade` VALUES ('1333', '736593', 'João Pedro Oliveira Antunes Correia', null, '913435198', 'jpedro_66@hotmail.com', '1992-08-05', null, 'Porugal', '13889023', '271006935', null, null, null, null, '2018-10-03', 'user.png', null, '1', '132', '832', null, '1', null);
INSERT INTO `Entidade` VALUES ('1334', '822254', 'André Filipe Rodrigues da Silva', null, '917376475', 'andre-estarreja@hotmail.com', '1995-01-02', 'Estarreja', 'Portugal', '14501195', '254203027', null, null, null, null, '2018-10-04', 'user.png', null, '1', '137', '833', null, '1', null);
INSERT INTO `Entidade` VALUES ('1335', '889077', 'Leandro Alexandre Henriques Almeida', null, null, 'henriques ep@hotmail.com', '1997-09-09', null, 'Portugal', '15223357', '226694631', null, null, null, null, '2018-10-02', 'user.png', null, '1', '138', '834', null, '0', null);
INSERT INTO `Entidade` VALUES ('1336', '1110405', 'Rui Pedro Rebelo Ferreira', null, '939328176', 'ruipedroferreira89@gmail.com', '2004-12-05', 'Torreira', 'Portugal', '30502065', '271672285', null, '7º Ano', null, null, '2018-10-06', 'user.png', null, '1', '140', '835', null, '1', null);
INSERT INTO `Entidade` VALUES ('1337', null, 'Anabela Morim Rebelo Ferreira', null, '912370679', 'panabela1976morim@gmail.com', '2018-10-05', null, null, '11112664', '201757672', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '836', null, '1', null);
INSERT INTO `Entidade` VALUES ('1338', null, 'Jorge Alípio Reis Ferreira', null, '912370842', 'jalipio634@gmail.com', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '837', null, '1', null);
INSERT INTO `Entidade` VALUES ('1339', '1185171', 'Manuel Fragoso Laranjeira', null, null, null, '2009-04-02', null, '', '15958951', '267658621', null, '2º Ano', null, null, '2018-10-10', 'user.png', null, '1', '141', '838', null, '1', null);
INSERT INTO `Entidade` VALUES ('1340', null, 'Pedro Miguel da Silva Laranjeira', null, '963783603', 'pmsl1973@hotmail.com', '2018-10-09', null, null, '76767676', '676767676', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '839', null, '1', null);
INSERT INTO `Entidade` VALUES ('1341', null, 'Maria Amélia Fragoso Valente', null, '963795410', 'mafvalente@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '840', null, '1', null);
INSERT INTO `Entidade` VALUES ('1342', '12121212', 'David Miguel dos Santos Sá Ferreira', null, '969875531', null, '2005-07-21', null, 'Portugal', '15743055', '256562113', null, null, null, null, '2018-10-06', 'user.png', null, '1', '149', '841', null, '1', '1');
INSERT INTO `Entidade` VALUES ('1343', null, 'Júlio Jardim de Sá Ferreira', null, '969875531', 'julio.jardim28@gmail.com', '2018-10-05', null, null, '09800352', '208366342', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '842', null, '1', null);
INSERT INTO `Entidade` VALUES ('1344', null, 'Clara Margarida Cardoso dos Santos', null, null, null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '843', null, '1', null);
INSERT INTO `Entidade` VALUES ('1345', '0000011111', 'Márcio André da Silva Costeira', null, '91329600', 'marcio_costeira@hotmail.com', '2002-10-04', 'Aveiro', 'Portugal', '77668876', '987890987', null, null, null, null, '2018-11-14', 'user.png', null, '1', '147', '844', null, '0', null);
INSERT INTO `Entidade` VALUES ('1346', null, 'Sandra Cristina Silva Ramos Costeira', null, '913797205', null, '2018-11-13', null, null, '333333333', '465456545', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '845', null, '1', null);
INSERT INTO `Entidade` VALUES ('1347', null, 'Luís André Silva Costeira', null, '910572637', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '846', null, '1', null);
INSERT INTO `Entidade` VALUES ('1348', '1044225', 'Diogo Filipe Silva Pereira', null, '910103512', null, '2003-02-23', null, null, '10293847', '657483920', null, null, null, null, '2018-10-05', 'user.png', null, '1', '148', '847', null, '1', null);
INSERT INTO `Entidade` VALUES ('1349', null, 'Paulo Miguel Lopes Pereira', null, '915745503', 'paulopereira105@hotmail.com', '2018-10-04', null, null, '11317721', '219470642', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '848', null, '1', null);
INSERT INTO `Entidade` VALUES ('1350', null, 'Marisa Santos Silva Pereira', null, '914648977', 'marisapereira105@hotmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '849', null, '1', null);
INSERT INTO `Entidade` VALUES ('1351', '752969', 'Gonçalo Ferreira Bem Haja', '234753353', '916188539', 'gbemhaja@gmail.com', '1993-01-15', 'Portuguesa', 'Portugal', '14077986', '230782493', null, 'Mestrado', null, null, '2018-10-02', 'user.png', null, '1', '151', '850', null, '0', null);
INSERT INTO `Entidade` VALUES ('1352', '765259', 'Gabriel Fernando ATZ', null, '916735588', 'gabatz4@hotmail.com', '1981-08-04', null, 'Brasil', '30358697', '241250765', null, null, null, null, '2018-10-02', 'user.png', null, '1', '152', '851', null, '0', null);
INSERT INTO `Entidade` VALUES ('1353', '824080', 'Pedro Miguel Tavares Oliveira', null, '913769325', 'oliveira_887@hotmail.com', '1994-01-16', 'Vale de Cambra', 'Portugal', '14514212', '261778480', null, '9º Ano', null, null, '2018-10-03', 'user.png', null, '1', '153', '852', null, '0', null);
INSERT INTO `Entidade` VALUES ('1354', '892722', 'Vasco Costa Rodrigues', null, '918084660', 'vasquinho.rodrigues7@gmail.com', '1995-01-01', 'Santa Maria da Feira', 'Portugal', '15010365', '258297832', null, '12ª Ano', null, null, '2018-10-02', 'user.png', null, '1', '154', '853', null, '0', null);
INSERT INTO `Entidade` VALUES ('1355', '895623', 'Óscar Rafael Nunes Gomes', null, '910392091', 'oscargomes97@gmail.com', '1997-08-01', 'Ovar', 'Portugal', '1475239', '270563792', null, '12º Ano', null, null, '2018-10-02', 'user.png', null, '1', '155', '854', null, '0', null);
INSERT INTO `Entidade` VALUES ('1356', '595057', 'Firmino Vieira Salgado', null, '918859565', null, '1984-12-29', null, 'Portugal', '12727251', '225664046', null, '9º Ano', null, null, '2018-10-02', 'user.png', null, '1', '156', '855', null, '0', null);
INSERT INTO `Entidade` VALUES ('1358', '825285', 'Nuno Miguel Soares Dias', null, '911069681', 'nunomiguel1993@hotmail.com', '1993-10-14', 'Silvalde', 'Portugal', '14522040', '227200322', null, null, null, '6º Ano', '2018-10-02', 'user.png', null, '1', '158', '857', null, '0', null);
INSERT INTO `Entidade` VALUES ('1359', '863489', 'Fábio Fernandes Novo', null, '911555881', 'fabionovo42@gmail.com', '1997-02-18', 'Ovar', 'Portugal', '14762921', '252664108', null, '12º Ano', null, null, '2018-10-02', 'user.png', null, '1', '159', '858', null, '0', null);
INSERT INTO `Entidade` VALUES ('1360', '846821', 'Ricardo Jorge Costa Fazenda', null, '914665221', 'ricardofazenda18@hotmail.com', '1995-06-04', 'Oliveira de Azemeis', 'Portugal', '1425430', '241808103', null, '12º Ano', null, null, '2018-10-03', 'user.png', null, '1', '160', '859', null, '1', null);
INSERT INTO `Entidade` VALUES ('1361', '685260', 'Bruno Rafael Oliveira marques', null, '917925403', 'brunocasalinho25@gmail.com', '1990-07-09', 'Estarreja', 'Portugal', '13550253', '256987319', null, '12º Ano', null, null, '2018-11-14', 'user.png', null, '1', '161', '860', null, '0', null);
INSERT INTO `Entidade` VALUES ('1362', '891626', 'Gonçalo Filipe Costa Gomes', null, '918486167', null, '1998-06-19', 'Portuguesa', 'Portugal', '15229578', '239778642', null, '12º Ano', null, null, '2018-10-03', 'user.png', null, '1', '162', '861', null, '1', null);
INSERT INTO `Entidade` VALUES ('1363', '1161630', 'João Pedro Rodrigues Oliveira e Silva', null, null, null, '2003-10-06', 'Portuguesa', 'Portugal', '30062786', '254731945', null, null, null, null, '2018-11-14', 'user.png', null, '1', '165', '862', null, '0', null);
INSERT INTO `Entidade` VALUES ('1364', null, 'José Maria de Oliveira e Silva', null, '914630320', null, '2017-11-12', null, null, '05461511', '164495100', null, null, null, null, '2017-11-13', 'user.png', null, '5', null, '863', null, '1', null);
INSERT INTO `Entidade` VALUES ('1365', '00000000001', 'José Tomás Santarém do Carmo', null, '967343915', 'verasantare_ft@hotmail.com', '2009-08-05', 'Porto', 'Portugal', '30103106', '270601384', null, null, null, null, '2018-11-15', 'user.png', null, '1', '169', '864', null, '0', null);
INSERT INTO `Entidade` VALUES ('1366', null, 'Vera Diana Ferreira Santarém do Carmo', null, '967343915', 'verasantare_ft@hotmail.com', '2018-11-14', null, null, '12176384', '217727107', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '865', null, '1', null);
INSERT INTO `Entidade` VALUES ('1367', null, 'José Fernando Teixeira Tavares do Carmo', null, '938225389', 'zevireu@hotmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '866', null, '1', null);
INSERT INTO `Entidade` VALUES ('1368', '1104568', 'Tomás Leite Valente', null, '918736577', 'danielavalente00@hotmail.com', '2005-01-21', null, null, '30308300', '262178206', null, '9ºAno', null, null, '2018-10-06', 'user.png', null, '1', '171', '867', null, '1', null);
INSERT INTO `Entidade` VALUES ('1369', null, 'Daniela Marisa Oliveira Leite Valente', null, '918736577', 'danielavalente00@hotmail.com', '2018-10-05', null, null, '12393962', '212991183', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '868', null, '1', null);
INSERT INTO `Entidade` VALUES ('1370', null, 'Bruno Manuel Oliveira Valente', null, '914468290', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '869', null, '1', null);
INSERT INTO `Entidade` VALUES ('1371', '111111', 'Rodrigo Filipe Silva Leite Tavares', null, null, null, '2007-02-22', 'Aveiro', 'Portugal', '30771862', '267036728', null, '5º Ano', null, null, '2018-11-14', 'user.png', null, '1', '172', '870', null, '0', null);
INSERT INTO `Entidade` VALUES ('1372', null, 'Tânia Alexandra Azevedo Silva Leite Tavares', null, '916477283', null, '2018-11-13', null, null, '12872619', '224030906', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '871', null, '1', null);
INSERT INTO `Entidade` VALUES ('1373', null, 'Jorge Filipe Cunha Tavares', null, '916474138', 'jorgetavares_00@hotmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '872', null, '1', null);
INSERT INTO `Entidade` VALUES ('1374', '1013830', 'Rúben Filipe Batista Marques', null, '916533444', null, '2002-09-21', 'Válega', 'Portugal', '30051312', '267044674', null, '11º Ano', null, null, '2018-10-05', 'user.png', null, '1', '173', '873', null, '1', '1');
INSERT INTO `Entidade` VALUES ('1375', null, 'António Joaquim Vitoriano Marques', null, '916533444', null, '2018-10-04', null, null, '8161177', '987689871', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '874', null, '1', null);
INSERT INTO `Entidade` VALUES ('1376', null, 'Maria de Fátima Batista Gama Marques', null, '910292274', 'fatimamarques1900@hotmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '875', null, '1', null);
INSERT INTO `Entidade` VALUES ('1377', '3333333333', 'Xavier Marques Cirne', null, '917065384', 'm.fatima.cirne@hotmail.com', '2004-03-31', 'Aveiro', 'Portugal', '15518173', '247107905', 'O-', '6º Ano', null, null, '2018-10-06', 'user.png', null, '1', '174', '876', null, '1', null);
INSERT INTO `Entidade` VALUES ('1378', null, 'Maria de Fátima de Oliveira Marques', null, '917065384', 'm.fatima.cirne@hotmail.com', '2018-10-05', null, null, '11855119', '196638860', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '877', null, '1', null);
INSERT INTO `Entidade` VALUES ('1379', null, 'Rui Manuel Almeida Cirne', null, '910460500', 'ruicirne@hotmail.com', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '878', null, '1', null);
INSERT INTO `Entidade` VALUES ('1380', '1184748', 'Tiago José Valente da Silva', null, '932365627', null, '2004-06-02', null, 'Portugal', '30333419', '252189558', null, '7º Ano', null, null, '2018-10-06', 'user.png', null, '1', '175', '879', null, '1', null);
INSERT INTO `Entidade` VALUES ('1381', null, 'José Manuel Beirão da Silva', null, '964687684', 'jose_m_b_silva@hotmail.com', '2018-10-05', null, null, '11223890', '211189685', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '880', null, '1', null);
INSERT INTO `Entidade` VALUES ('1382', null, 'Maria Celina Valente Abreu', null, '966040610', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '881', null, '1', null);
INSERT INTO `Entidade` VALUES ('1383', '1011276', 'Diogo Fonseca Tavares', null, null, null, '2002-04-30', null, null, '30050672', '262875527', null, '9ª Ano', null, null, '2018-11-14', 'user.png', null, '1', '176', '882', null, '0', null);
INSERT INTO `Entidade` VALUES ('1384', null, 'Maria Idalina Valente Fonseca Tavares', null, '916294753', 'idalinatavares5@gmail.com', '2018-11-13', null, null, '10412028', '190807270', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '883', null, '1', null);
INSERT INTO `Entidade` VALUES ('1385', null, 'Ricardo da Silva Tavares', null, '933556317', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '884', null, '1', null);
INSERT INTO `Entidade` VALUES ('1386', '00000081', 'Rui Manuel Campos Timóteo', null, '914997959', null, '2005-06-29', 'Murtosa', 'Portugal', '31383208', '274674130', null, '5º Ano', null, null, '2018-11-14', 'user.png', null, '1', '185', '885', null, '0', null);
INSERT INTO `Entidade` VALUES ('1387', null, 'Judite do Carmo Matos Campos Timóteo', null, '914997959', null, '2018-11-13', null, null, '12056888', '209364289', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '886', null, '1', null);
INSERT INTO `Entidade` VALUES ('1388', null, 'Rui Manuel da Fonseca Timóteo', null, '918837190', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '887', null, '1', null);
INSERT INTO `Entidade` VALUES ('1389', '1213423', 'Salvador Marques Torres Tavares', null, null, null, '2010-10-22', 'Aveiro', 'Portugal', '88866660', '980987678', null, null, null, null, '2018-10-23', 'user.png', null, '1', '188', '888', null, '1', null);
INSERT INTO `Entidade` VALUES ('1390', null, 'Luis Filipe Bandeira Torres Tavares', null, '961361230', 'luistorrestavares@gmail.com', '2018-10-22', null, null, '33333333', '454567675', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '889', null, '1', null);
INSERT INTO `Entidade` VALUES ('1391', null, 'Carla Sófia dos Reis Marques', null, '963792460', null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '890', null, '1', null);
INSERT INTO `Entidade` VALUES ('1393', '1204178', 'Alexandre Cardoso Valente', null, null, null, '2008-07-10', null, 'Portugal', '15721822', '263939375', 'O+', '4º Ano', null, null, '2018-10-10', 'user.png', null, '1', '190', '892', null, '1', null);
INSERT INTO `Entidade` VALUES ('1394', null, 'José Augusto Borges Valente', null, '969587003', 'joseabvalente@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '893', null, '1', null);
INSERT INTO `Entidade` VALUES ('1395', null, 'Ana Cláudia Cardoso Valente', null, '963644542', 'anavalente77@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '894', null, '1', null);
INSERT INTO `Entidade` VALUES ('1396', '1216616', 'Daniel Vaz dos Ramos Alfredo', null, null, null, '2008-03-30', null, null, '66666666', '980965478', null, null, null, null, '2018-11-15', 'user.png', null, '1', '191', '895', null, '0', null);
INSERT INTO `Entidade` VALUES ('1397', null, 'Bonfim dos Ramos Alfredo', null, '926172507', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '896', null, '1', null);
INSERT INTO `Entidade` VALUES ('1398', null, 'Augusta Espirito Santo Vaz', null, null, null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '897', null, '1', null);
INSERT INTO `Entidade` VALUES ('1399', '888888', 'Miguel Guilherme Borges Oliveira Silva', null, '966580198', 'phots82@gmail.com', '2013-12-06', null, null, '31350564', '132456543', null, null, null, null, '2018-11-15', 'user.png', null, '1', '192', '898', null, '0', null);
INSERT INTO `Entidade` VALUES ('1400', null, 'Paulo Henrique de Oliveira Tavares da Silva', null, '966580198', null, '2018-11-14', null, null, null, '456776543', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '899', null, '1', null);
INSERT INTO `Entidade` VALUES ('1401', null, 'Luísa Mafalda Soutinho Borges', null, '967369800', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '900', null, '1', null);
INSERT INTO `Entidade` VALUES ('1402', '1213416', 'João Paulo Reis Pires', null, '932316471', null, '2010-12-30', null, null, '30567957', '273449460', 'A+', null, null, null, '2018-10-23', 'user.png', null, '1', '193', '901', null, '1', null);
INSERT INTO `Entidade` VALUES ('1403', null, 'Paulo Rafael da Silva Pires', null, '932316471', 'pirecese21@hotmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '902', null, '1', null);
INSERT INTO `Entidade` VALUES ('1404', null, 'Alda Susana da Silva Reis', null, null, 'aldapires@hotmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '903', null, '1', null);
INSERT INTO `Entidade` VALUES ('1405', '1228394', 'Estêvão Martinho Rodrigues Silva Dias', null, '965815433', 'lisete.dias@hotmail.com', '2006-06-09', '', 'Portuguesa', '30996672', '256895783', 'O+', '5º Ano', null, null, '2018-10-19', 'user.png', null, '1', '194', '904', null, '1', null);
INSERT INTO `Entidade` VALUES ('1406', null, 'Maria Lisete Rodrigues Silva', null, '965815433', null, '2018-10-18', null, null, null, null, null, null, null, null, '2018-10-19', 'user.png', null, '5', null, '905', null, '1', null);
INSERT INTO `Entidade` VALUES ('1407', null, 'Manuel Gomes Dias', null, '962566973', null, '2018-10-18', null, null, null, null, null, null, null, null, '2018-10-19', 'user.png', null, '5', null, '906', null, '1', null);
INSERT INTO `Entidade` VALUES ('1408', '43434343', 'André Miguel Ribeiro Silva', null, '936102768', null, '2000-07-20', null, null, '46567876', '234565432', 'A+', '10º Ano', null, null, '2018-11-14', 'user.png', null, '1', '198', '907', null, '0', null);
INSERT INTO `Entidade` VALUES ('1409', null, 'Pedro Miguel Domingues Silva', null, '934233936', 'pedro.silva@yazaki-europe.com', '2018-11-13', null, null, '12345678', '987654321', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '908', null, '1', null);
INSERT INTO `Entidade` VALUES ('1410', null, 'Elizabeth Maria Ribeiro Silva', null, '939033960', 'elizabeth.ribeiro77@gmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '909', null, '1', null);
INSERT INTO `Entidade` VALUES ('1411', '445534', 'Miguel Monteiro da Fonseca', null, null, 'miguelfonseca2002@hotmail.com', '2002-06-06', null, null, '30436329', '291806747', null, null, null, null, '2018-10-05', 'user.png', null, '1', '200', '910', null, '1', null);
INSERT INTO `Entidade` VALUES ('1412', null, 'Henrique Nuno Oliveira da Fonseca', null, '964415061', 'hnunofonseca@hotmail.com', '2018-10-04', null, null, '34567887', '122332435', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '911', null, '1', null);
INSERT INTO `Entidade` VALUES ('1413', null, 'Paula Alexandra Monteiro da Fonseca', null, '966188719', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '912', null, '1', null);
INSERT INTO `Entidade` VALUES ('1414', '444455', 'Guilherme Xavier Marques Alves', null, '939649211', null, '2005-09-23', 'Portuguesa', 'Portugal', '31249341', '255953178', 'A+', '7º Ano', null, null, '2018-10-06', 'user.png', null, '1', '201', '913', null, '1', null);
INSERT INTO `Entidade` VALUES ('1415', null, 'António Manuel de Castro Alves', null, '913406040', null, '2018-10-05', null, null, '44335522', '678789873', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '914', null, '1', null);
INSERT INTO `Entidade` VALUES ('1416', null, 'Irene Augusta Tavares Marques', null, '965563761', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '915', null, '1', null);
INSERT INTO `Entidade` VALUES ('1417', '980987', 'Nuno Francisco Venâncio Morais', null, '964788532', null, '2009-02-14', 'Porto', 'Portugal', '15922034', '227960734', 'O+', null, null, null, '2018-10-10', 'user.png', null, '1', '202', '916', null, '1', null);
INSERT INTO `Entidade` VALUES ('1418', null, 'Paulo Jorge Oliveira Morais', null, '967446917', null, '2018-10-09', null, null, '12234683', '227960734', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '917', null, '1', null);
INSERT INTO `Entidade` VALUES ('1419', null, 'Patrícia Isabel Fernandes Venâncio Morais', null, '964788532', '', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '918', null, '1', null);
INSERT INTO `Entidade` VALUES ('1420', '657430', 'Gabriel Jorge da Costa Barroso de Santo António', null, null, null, '2011-07-27', null, 'Portugal', '30773389', '276749782', null, null, null, null, '2017-09-30', 'user.png', null, '1', '203', '919', null, '1', null);
INSERT INTO `Entidade` VALUES ('1421', null, 'Vera Isabel da Costa Barroso de Santo António', null, '966073013', 'barrososic@hotmail.com', '2017-09-29', null, null, '12516100', '240980867', null, null, null, null, '2017-09-30', 'user.png', null, '5', null, '920', null, '1', null);
INSERT INTO `Entidade` VALUES ('1422', null, 'Sergio Gabriel Duarte de Santo António', null, '964764837', 'santo1976@hotmail.com', '2017-09-29', null, null, null, null, null, null, null, null, '2017-09-30', 'user.png', null, '5', null, '921', null, '1', null);
INSERT INTO `Entidade` VALUES ('1423', '324578', 'Duarte Marquez Silva', null, null, null, '2013-03-09', 'Vila Nova de Gaia', 'Portugal', '31184414', '280543115', 'A+', 'Pré', null, null, '2017-09-30', 'user.png', null, '1', '205', '922', null, '1', null);
INSERT INTO `Entidade` VALUES ('1424', null, 'Ana Karina da Costa Marquez  Silva', null, '916492226', 'ana_karina104@hotmail.com', '2017-09-29', null, null, '13445219', '217128998', null, null, null, null, '2017-09-30', 'user.png', null, '5', null, '923', null, '1', null);
INSERT INTO `Entidade` VALUES ('1425', null, 'Martinho Armando de Oliveira da Silva Marquez', null, '914167594', null, '2017-09-29', null, null, null, null, null, null, null, null, '2017-09-30', 'user.png', null, '5', null, '924', null, '1', null);
INSERT INTO `Entidade` VALUES ('1426', '909098', 'Gustavo Marquez da Silva', null, null, null, '2013-03-09', 'Vila Nova de Gaia', 'Portugal', '31184405', '280543042', 'A+', 'Pré', null, null, '2017-09-30', 'user.png', null, '1', '206', '925', null, '1', null);
INSERT INTO `Entidade` VALUES ('1427', null, 'Ana Karina da Costa Marquez Silva', null, '916492226', 'ana_karina104@hotmail.com', '2017-09-29', null, null, '13445219', '217128998', null, null, null, null, '2017-09-30', 'user.png', null, '5', null, '926', null, '1', null);
INSERT INTO `Entidade` VALUES ('1428', null, 'Martinho Armando de Oliveira da Silva Marquez', null, '914167594', null, '2017-09-29', null, null, null, null, null, null, null, null, '2017-09-30', 'user.png', null, '5', null, '927', null, '1', null);
INSERT INTO `Entidade` VALUES ('1429', '1111112', 'Samuel Oliveira Guiomar', null, null, null, '2009-06-09', null, 'Portugal', '30049494', '274145987', null, '4º Ano', null, null, '2018-10-10', 'user.png', null, '1', '208', '928', null, '1', '1');
INSERT INTO `Entidade` VALUES ('1430', null, 'Tiago Miguel Guiomar Silva', null, '967719148', 'tiago.silva.328@hotmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '929', null, '1', null);
INSERT INTO `Entidade` VALUES ('1431', null, 'Ana Cristina Oliveira Silva', null, '962438182', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '930', null, '1', null);
INSERT INTO `Entidade` VALUES ('1432', '211111111', 'Gustavo Filipe Garcês Dias', null, null, null, '2009-12-23', 'Estarreja', null, '30231306', '274851172', null, null, null, null, '2018-10-10', 'user.png', null, '1', '209', '931', null, '1', null);
INSERT INTO `Entidade` VALUES ('1433', null, 'Helena Cristina Carmo Garcês', null, '914386711', 'helena.garces@iol.pt', '2018-10-09', null, null, '3333334', '454567890', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '932', null, '1', null);
INSERT INTO `Entidade` VALUES ('1434', null, 'Jorge Filipe Oliveira Dias', null, '918556162', 'jo_dias@msn.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '933', null, '1', null);
INSERT INTO `Entidade` VALUES ('1435', '111112', 'Mateus Oliveira Gaudêncio', null, '928055092', null, '2008-08-21', null, 'Portugal', '15735162', '264201167', null, '4º Ano', null, null, '2018-10-10', 'user.png', null, '1', '210', '934', null, '1', null);
INSERT INTO `Entidade` VALUES ('1436', null, 'Cristina Alexandra Morgado Torres de Oliveira', null, '912649663', 'cristinatorres1973@gmail.com', '2018-10-09', null, null, '10064343', '205505112', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '935', null, '1', null);
INSERT INTO `Entidade` VALUES ('1437', null, 'Paulo Fernando da Costa Gaudêncio', null, '918289254', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '936', null, '1', null);
INSERT INTO `Entidade` VALUES ('1438', '1006320', 'Rodrigo Vigário Pinto', null, null, null, '2002-02-10', 'Estarreja', null, '13452312', '543456231', null, null, null, null, '2018-11-14', 'user.png', null, '1', '212', '937', null, '0', null);
INSERT INTO `Entidade` VALUES ('1439', null, 'António Paulo Miranda Gonçalves Pinto', null, '969115909', 'apaulopinto1@gmail.com', '2018-11-13', null, null, '34567890', '987689098', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '938', null, '1', null);
INSERT INTO `Entidade` VALUES ('1440', null, 'Paula Cristina Vigário Pinto', null, '965489509', null, '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '939', null, '1', null);
INSERT INTO `Entidade` VALUES ('1441', '123456', 'Christian Abranches Guedes', null, null, null, '2012-12-27', null, 'Portugal', '31133236', '280587961', null, null, null, null, '2017-10-13', 'user.png', null, '1', '214', '940', null, '1', null);
INSERT INTO `Entidade` VALUES ('1442', null, 'Joel Peter Guedes Rodrigues', null, '966572731', 's.morsms@hotmail.com', '2017-10-12', null, null, '31133236', '280587961', null, null, null, null, '2017-10-13', 'user.png', null, '5', null, '941', null, '1', null);
INSERT INTO `Entidade` VALUES ('1443', null, 'Carina Elisabete Marques Abranches Guedes', null, '916429014', 'carinaabranches@hotmail.com', '2017-10-12', null, null, null, null, null, null, null, null, '2017-10-13', 'user.png', null, '5', null, '942', null, '1', null);
INSERT INTO `Entidade` VALUES ('1444', '123213', 'Afonso Tavares Silva', null, null, null, '2011-09-30', null, 'Portugal', '30827946', '277834937', null, '1º Ano', null, null, '2018-10-23', 'user.png', null, '1', '215', '943', null, '1', null);
INSERT INTO `Entidade` VALUES ('1445', null, 'Tito Miguel Monteiro Silva', null, '965368618', 'titomiguel1976@hotmail.com', '2018-10-22', null, null, '11464852', '211956694', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '944', null, '1', null);
INSERT INTO `Entidade` VALUES ('1446', null, 'Isabel Cristina Valente Tavares Silva', null, '964474068', 'cristina.silva.9@hotmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '945', null, '1', null);
INSERT INTO `Entidade` VALUES ('1447', '241234', 'Gonçalo Rodrigues Fernandes', null, null, null, '2012-05-30', 'Estareja', 'Portugal', '31000197', '278614159', null, null, null, null, '2017-10-04', 'user.png', null, '1', '216', '946', null, '1', null);
INSERT INTO `Entidade` VALUES ('1448', null, 'Edgar Daniel Pereira Fernandes', null, '965201490', 'e.fernands80@gmail.com', '2017-10-03', null, null, '11824723', '226451178', null, null, null, null, '2017-10-04', 'user.png', null, '5', null, '947', null, '1', null);
INSERT INTO `Entidade` VALUES ('1449', null, 'Ana Catarina Rodrigues Santo António Fernandes', null, '964789577', 'catarina.antonio82@gmail.com', '2017-10-03', null, null, null, null, null, null, null, null, '2017-10-04', 'user.png', null, '5', null, '948', null, '1', null);
INSERT INTO `Entidade` VALUES ('1450', '122112', 'Gustavo José Campos Couras', null, null, null, '2012-04-08', null, 'Portugal', '30957602', '279322607', null, null, null, null, '2017-10-04', 'user.png', null, '1', '217', '949', null, '1', null);
INSERT INTO `Entidade` VALUES ('1451', null, 'Paula Alexandra Tavares Valente Couras', null, '916461358', null, '2017-10-03', null, null, '12424266', '214356442', null, null, null, null, '2017-10-04', 'user.png', null, '5', null, '950', null, '1', null);
INSERT INTO `Entidade` VALUES ('1452', null, 'Marco António Matos Campos', null, '916402456', null, '2017-10-03', null, null, null, null, null, null, null, null, '2017-10-04', 'user.png', null, '5', null, '951', null, '1', null);
INSERT INTO `Entidade` VALUES ('1453', '112233', 'Salvador Rodrigues Soares', null, null, null, '2012-04-28', null, 'Portugal', '30972696', '278433030', 'O+', null, null, null, '2018-11-15', 'user.png', null, '1', '218', '952', null, '0', null);
INSERT INTO `Entidade` VALUES ('1454', null, 'Arménio José Oliveira Soares', null, '917295918', 'armenios@portugalmail.pt', '2018-11-14', null, null, '11821663', '228504155', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '953', null, '1', null);
INSERT INTO `Entidade` VALUES ('1455', null, 'Liliana Raquel Gouveia Rodrigues', null, '966331046', 'lilianagrodrigues@gmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '954', null, '1', null);
INSERT INTO `Entidade` VALUES ('1456', '221133', 'Guilherme Rodrigues Soares', null, null, null, '2008-01-16', null, 'Portugal', '15560601', '262461900', 'O+', null, null, null, '2018-11-15', 'user.png', null, '1', '219', '955', null, '0', null);
INSERT INTO `Entidade` VALUES ('1457', null, 'Arménio José Oliveira Soares', null, '917295918', 'armenios@portugalmail.pt', '2018-11-14', null, null, '11821863', '228504155', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '956', null, '1', null);
INSERT INTO `Entidade` VALUES ('1458', null, 'Liliana Raquel Gouveia Rodrigues', null, '966331046', 'lilianagrodrigues@gmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '957', null, '1', null);
INSERT INTO `Entidade` VALUES ('1459', '332211', 'André Jorge da Silva Marques Nunes', null, null, null, '2008-05-08', 'Aveiro', 'Portugal', '15666770', '268620482', null, null, null, null, '2017-10-05', 'user.png', null, '1', '221', '958', null, '1', null);
INSERT INTO `Entidade` VALUES ('1460', null, 'Ana Rita Gomes da Silva', null, '910775314', 'rita_silva_7@hotmail.com', '2017-10-04', null, null, '13758801', '257794557', null, null, null, null, '2017-10-05', 'user.png', null, '5', null, '959', null, '1', null);
INSERT INTO `Entidade` VALUES ('1461', null, 'Rui Jorge Marques Nunes', null, '917994690', null, '2017-10-04', null, null, null, null, null, null, null, null, '2017-10-05', 'user.png', null, '5', null, '960', null, '1', null);
INSERT INTO `Entidade` VALUES ('1462', '123321', 'Alejandro Manuel Lopez Gonzalez', null, null, null, '2007-12-22', null, 'Venezuela', '31983241', '291442188', null, null, null, null, '2018-11-14', 'user.png', null, '1', '222', '961', null, '0', null);
INSERT INTO `Entidade` VALUES ('1463', null, 'Deima Carolina Gonzalez Bracho', null, '933960910', 'deimagonzalez@hotmail.com', '2018-11-13', null, null, '896947', '345432345', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '962', null, '1', null);
INSERT INTO `Entidade` VALUES ('1464', null, 'Ricardo Laurindo Tavares', null, '933960910', 'laudo6@hotmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '963', null, '1', null);
INSERT INTO `Entidade` VALUES ('1465', '111223', 'Afonso Nunes Teixeira de Lacerda Neves', null, null, null, '2013-01-02', null, null, '311365019', '280130902', null, null, null, null, '2018-11-15', 'user.png', null, '1', '224', '964', null, '1', null);
INSERT INTO `Entidade` VALUES ('1466', null, 'Joana Carolina Nunes Teixeira de Lacerda Neves', null, '918283980', 'joana.pajoana@gmail.com', '2018-11-14', null, null, '1234322', '234565434', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '965', null, '1', null);
INSERT INTO `Entidade` VALUES ('1467', null, 'Ricardo Jorge Nunes Teixeira de Lacerda Neves', null, '917766343', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '966', null, '1', null);
INSERT INTO `Entidade` VALUES ('1468', '2111111', 'José Pedro Valente Monteiro', null, '913206363', null, '2010-01-14', 'Salreu', 'Portugal', '30247086', '269931457', null, null, null, null, '2018-10-23', 'user.png', null, '1', '225', '967', null, '1', null);
INSERT INTO `Entidade` VALUES ('1469', null, 'Aida Maria Marques Teixeira Valente Monteiro', null, '913206363', 'aida14106@gmail.com', '2018-10-22', null, null, '12064384', '214296180', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '968', null, '1', null);
INSERT INTO `Entidade` VALUES ('1470', null, 'Hugo Filipe Oliveira Monteiro', null, '937080360', null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '969', null, '1', null);
INSERT INTO `Entidade` VALUES ('1471', '123123', 'Vasco Pinto Ferreira', null, null, null, '2010-11-20', 'Beduido', 'Portugal', '30542498', '272614726', null, '1º Ano', null, null, '2017-10-06', 'user.png', null, '1', '226', '970', null, '1', null);
INSERT INTO `Entidade` VALUES ('1472', null, 'Vitor Manuel Tavares Ferreira', null, '914253784', 'vferreira@dow.com', '2017-10-05', null, null, '10536622', '193477203', null, null, null, null, '2017-10-06', 'user.png', null, '5', null, '971', null, '1', null);
INSERT INTO `Entidade` VALUES ('1473', null, 'Maria Raquel do Carmo Pinto Ferreira', null, '963676929', null, '2017-10-05', null, null, null, null, null, null, null, null, '2017-10-06', 'user.png', null, '5', null, '972', null, '1', null);
INSERT INTO `Entidade` VALUES ('1474', '1204538', 'José Filipe Marques Rocha', null, '968222955', 'camilojrocha@gmail.com', '2009-03-21', 'Estarreja', 'Portugal', '159458234', '267241933', null, '2º Ano', null, null, '2018-10-10', 'user.png', null, '1', '228', '973', null, '1', null);
INSERT INTO `Entidade` VALUES ('1475', null, 'Camilo José Tavares Resende Gomes Rocha', null, '968222955', 'camilojrocha@gmail.com', '2018-10-09', null, null, '22222222', '333333333', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '974', null, '1', null);
INSERT INTO `Entidade` VALUES ('1476', null, 'Regina Maria Marques', null, '96269704', 'regina.m.marques@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '975', null, '1', null);
INSERT INTO `Entidade` VALUES ('1477', '848566', 'Leonardo Miguel Santos Monteiro', null, '917590120', 'leopesquina@hotmail.com', '1996-02-11', null, 'Portugal', '66666666', '876787654', null, null, null, null, '2018-11-14', 'user.png', null, '1', null, '976', null, '0', null);
INSERT INTO `Entidade` VALUES ('1478', '911175', 'André Filipe da Silva Ribas', null, '917047577', 'andre.ribass@ua.pt', '1993-08-03', null, 'Portugal', '14504718', '253612411', null, null, null, null, '2018-10-02', 'user.png', null, '1', null, '977', null, '0', null);
INSERT INTO `Entidade` VALUES ('1479', '1222596', 'Joaquim Puig', null, '918066704', 'joacopuig10@gmail.com', '1996-07-06', null, 'Argentina', 'AAD663211', '787654345', null, null, null, null, '2018-10-02', 'user.png', null, '1', null, '978', null, '0', null);
INSERT INTO `Entidade` VALUES ('1480', '2132111', 'Lucio Marcelo Lopez', null, '+543424086185', null, '1996-01-03', null, 'Argentina', 'AA2792517', '765789098', null, null, null, null, '2018-10-02', 'user.png', null, '1', null, '979', null, '0', null);
INSERT INTO `Entidade` VALUES ('1481', '1226337', 'Ivan Ezequiel Ortigosa', null, '935205152/918066704', null, '1995-03-11', null, 'Argentina', 'AAD655954', '980909765', null, null, null, null, '2018-10-03', 'user.png', null, '1', null, '980', null, '0', null);
INSERT INTO `Entidade` VALUES ('1483', '863499', 'Afonso Sá Vaz de Oliveira', null, '915958810', 'afonsosvoliveira@gmail.com', '1997-08-06', null, 'Portugal', '14700237', '265808871', null, 'Licenciado', null, null, '2018-10-03', 'user.png', null, '1', null, '982', null, '0', null);
INSERT INTO `Entidade` VALUES ('1495', '5342312', 'Manuel Catarino Santos Silva', null, '918443050', null, '2002-09-20', 'Porto', 'Portugal', '14975665', '242517650', 'A+', null, null, null, '2018-11-14', 'user.png', null, '1', '229', '994', null, '0', null);
INSERT INTO `Entidade` VALUES ('1496', null, 'Vitor Manuel dos Santos Silva', null, '917278673', 'vitor.silva130@gmail.com', '2018-11-13', null, null, '63627265', '165243673', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '995', null, '1', null);
INSERT INTO `Entidade` VALUES ('1497', null, 'Anete Marisa Pinto Gomes Catarino', null, '', 'anete.catarino@gmail.com', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '996', null, '1', null);
INSERT INTO `Entidade` VALUES ('1498', '154235', 'Diogo Rafael Sousa Dias', null, null, null, '2009-10-14', 'Cambrigde', null, '35635252', '162537654', null, null, null, null, '2018-10-10', 'user.png', null, '1', '230', '997', null, '1', null);
INSERT INTO `Entidade` VALUES ('1499', null, 'Pedro Miguel Correia Dias', null, null, 'dias691@hotmail.co.uk', '2018-10-09', null, null, '36524267', '265345726', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '998', null, '1', null);
INSERT INTO `Entidade` VALUES ('1500', null, 'Ana Cristina Mateus Sousa', null, null, 'estrela78@hotmail.co.uk', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '999', null, '1', null);
INSERT INTO `Entidade` VALUES ('1501', '114356', 'Luciano Américo Lopes Moreira', null, '914545831', 'henriqueisabel21@gmail.com', '2006-12-19', null, null, '1911212006', '266252443', null, '5º Ano', null, null, '2018-08-31', 'user.png', null, '1', '232', '1000', null, '0', null);
INSERT INTO `Entidade` VALUES ('1502', null, 'Isabel Maria Fernandes Lopes da Silva', null, '915611514', '', '2018-08-30', null, null, '222222222', '333333333', null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '1001', null, '1', null);
INSERT INTO `Entidade` VALUES ('1503', null, 'Henrique dos Santos Moreira', null, null, 'henriqueisabel21@gmail.com', '2018-08-30', null, null, null, null, null, null, null, null, '2018-08-31', 'user.png', null, '5', null, '1002', null, '1', null);
INSERT INTO `Entidade` VALUES ('1504', '231121', 'Leonardo Rafael Afonso Oliveira', null, '938691065', 'leonardoafonso772@gmail.com', '2002-07-31', null, 'Portugal', '30169042', '263024504', null, '7ºAno', null, null, '2018-10-05', 'user.png', null, '1', '233', '1003', null, '1', null);
INSERT INTO `Entidade` VALUES ('1505', null, 'Manuel Alberto Oliveira Sousa', null, '963855672', null, '2018-10-04', null, null, '13094830', '194767396', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '1004', null, '1', null);
INSERT INTO `Entidade` VALUES ('1506', null, 'Maria Manuela Correia Afonso Lopes Oliveira', null, '966421959', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '1005', null, '1', null);
INSERT INTO `Entidade` VALUES ('1507', '1144332', 'João Miguel Assunção Figueiredo', null, '937018034  mãe', 'quelspaecor@gmail.com', '2013-04-03', 'Aveiro', 'Portugal', '31200608', '280612400', 'O+', null, null, null, '2018-11-15', 'user.png', null, '1', '235', '1006', null, '0', null);
INSERT INTO `Entidade` VALUES ('1508', null, 'Silvia Raquel da Silva Assunção', null, '937018034', 'quelspaecor@gmail.com', '2018-11-14', null, null, '3333334', '123432123', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1007', null, '1', null);
INSERT INTO `Entidade` VALUES ('1509', null, 'José Romeu Valente Figueira', null, '914443410', 'oficinamagro@hotmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1008', null, '1', null);
INSERT INTO `Entidade` VALUES ('1510', '11113343', 'Gonçalo Rafael Assunção Figueira', null, null, null, '2010-09-23', 'Aveiro', 'Portugal', '30502720', '274575493', null, null, null, null, '2018-11-15', 'user.png', null, '1', '236', '1009', null, '0', null);
INSERT INTO `Entidade` VALUES ('1511', null, 'Silvia Raquel da Silva Assunção', null, '937018034', 'quelspaecor@gmail.com', '2018-11-14', null, null, '1232323', '232425141', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1010', null, '1', null);
INSERT INTO `Entidade` VALUES ('1512', null, 'José Romeu Valente Figueira', null, '914443410', 'oficinamagro@hotmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1011', null, '1', null);
INSERT INTO `Entidade` VALUES ('1513', '1123212', 'André Miguel Ribeiro Silva', '936102768', '934233936', 'andre.mig@hotmail.com', '2000-07-20', null, null, '30234056', '269026720', null, null, null, null, '2018-11-14', 'user.png', null, '1', null, '1012', null, '0', null);
INSERT INTO `Entidade` VALUES ('1514', '961383', 'Rúben Gonçalo Soares Azevedo', null, '967677988', null, '2000-07-21', null, null, '15820920', '265988829', null, null, null, null, '2018-10-04', 'user.png', null, '1', '237', '1013', null, '1', null);
INSERT INTO `Entidade` VALUES ('1515', '123232', 'Tomás Nadais Rodrigues Martins', null, '914622930', 'tomasnadais@gmail.com', '1999-11-02', null, null, '14770250', '123212121', null, null, null, null, '2018-11-14', 'user.png', null, '1', null, '1014', null, '0', null);
INSERT INTO `Entidade` VALUES ('1516', '923157', 'Carlos Daniel da Silva Ferreira', null, '918942644', null, '1999-09-28', null, 'Portugal', '15471779', '232554455', 'A+', null, null, null, '2018-10-04', 'user.png', null, '1', '260', '1015', null, '1', null);
INSERT INTO `Entidade` VALUES ('1517', '983790', 'Jorge Emanuel Tavares Silva', null, '916608781', 'jorginhoh1@hotmail.com', '2000-08-01', null, null, '15826549', '271761180', 'O+', null, null, null, '2018-11-14', 'user.png', null, '1', null, '1016', null, '0', null);
INSERT INTO `Entidade` VALUES ('1518', '955775', 'Fábio Daniel Oliveira e Silva Flavio', null, '911926924', null, '2000-09-29', 'Estarreja', 'Portugal', '14889953', '148899536', 'A+', '10º Ano', null, null, '2018-10-04', 'user.png', null, '1', '262', '1017', null, '1', null);
INSERT INTO `Entidade` VALUES ('1519', '5676544', 'Salvador Amador Lopes Ribeiro', null, null, null, '2014-09-01', 'Vila Nova de Gaia', 'Portugal', '31493802', '284033448', null, null, null, null, '2017-11-23', 'user.png', null, '1', '238', '1018', null, '1', null);
INSERT INTO `Entidade` VALUES ('1520', null, 'Sandra Amador', null, '912255707', 'mariaposa.pt@gmail.com', '2017-11-22', null, null, '1111111', '222222222', null, null, null, null, '2017-11-23', 'user.png', null, '5', null, '1019', null, '1', null);
INSERT INTO `Entidade` VALUES ('1521', null, 'Renato Valente', null, '914938413', 'renatocvalente@gmail.com', '2017-11-22', null, null, null, null, null, null, null, null, '2017-11-23', 'user.png', null, '5', null, '1020', null, '1', null);
INSERT INTO `Entidade` VALUES ('1522', '77777', 'Jorge Leandro Saleiro Vilarinho', null, '912458916', null, '2002-11-26', null, 'Portugal', '30415294', '262448491', null, null, null, null, '2018-11-14', 'user.png', null, '1', '240', '1021', null, '0', null);
INSERT INTO `Entidade` VALUES ('1523', null, 'Jorge Nelson Pires Vilarinho', '', '914190250', '', '2018-11-13', null, null, '08351905', '171545389', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '1022', null, '1', null);
INSERT INTO `Entidade` VALUES ('1524', null, 'Maria Gracelina Moreira Saleiro', '', null, '', '2018-11-13', null, null, null, null, null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '1023', null, '1', null);
INSERT INTO `Entidade` VALUES ('1525', '3333333333333', 'Rui Miguel Murteira Costa', null, '962051515', null, '2001-09-22', null, null, '30082417', '239519400', 'O-', '10º Ano', null, null, '2018-11-14', 'user.png', null, '1', '241', '1024', null, '0', null);
INSERT INTO `Entidade` VALUES ('1526', null, 'Luis Manuel Oliveira Costa', null, '962563196', null, '2018-11-13', null, null, '10964675', '191869481', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '1025', null, '1', null);
INSERT INTO `Entidade` VALUES ('1527', null, 'Maria Helena Duarte Murteira', null, null, null, '2018-11-13', null, null, '22222223', '345432345', null, null, null, null, '2018-11-14', 'user.png', null, '5', null, '1026', null, '1', null);
INSERT INTO `Entidade` VALUES ('1528', '3456543', 'Dinis Tavares da Costa Marques Figueira', '964080125 mãe', '967018967 avó', null, '2010-09-17', 'Pardilhó', 'Portugal', '30497523', '272627992', null, '2º ano', null, null, '2018-10-23', 'user.png', null, '1', '242', '1027', null, '1', null);
INSERT INTO `Entidade` VALUES ('1529', null, 'Elisabete Tavares da Costa', null, '964080125', 'elisabete.costa@cgd.pt', '2018-10-22', null, null, '11297329', '202675220', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1028', null, '1', null);
INSERT INTO `Entidade` VALUES ('1530', null, 'Carlos Vitor Marques Tavares', null, '965009470', 'carlosvitormf@gmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1029', null, '1', null);
INSERT INTO `Entidade` VALUES ('1531', '44444444', 'Alexandre Goís Carvalho Simões', null, '969093669', null, '2008-12-21', 'Portuguesa', 'Portugal', '15772853', '258726075', null, null, null, null, '2018-11-15', 'user.png', null, '1', '243', '1030', null, '0', null);
INSERT INTO `Entidade` VALUES ('1532', null, 'Paulo Jorge Tavares Simões', null, '912679910', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1031', null, '1', null);
INSERT INTO `Entidade` VALUES ('1533', '123432', 'Carlos Bruno Anjos Ruela', null, '919393210', 'kaparica37@gmail.com', '1997-11-16', 'Portuguesa', 'Portugal', '14958338', '123456789', null, null, null, null, '2018-10-03', 'user.png', null, '1', '244', '1032', null, '1', null);
INSERT INTO `Entidade` VALUES ('1534', '65476', 'Jorge André Pinho Graça', null, '910506521', 'j.andre10@hotmail.com', '1999-04-23', 'Portuguesa', 'Portugal', '14737876', '234543212', null, null, null, null, '2018-10-03', 'user.png', null, '1', '245', '1033', null, '1', null);
INSERT INTO `Entidade` VALUES ('1535', '23454', 'João Paulo Gomes Duarte', null, '912642578', 'joaopgduarte10@gmail.com', '1994-06-18', 'Brasileira', 'Brasil', '356065', '145674321', null, null, null, null, '2018-10-03', 'user.png', null, '1', '246', '1034', null, '1', null);
INSERT INTO `Entidade` VALUES ('1536', '45326', 'Tyler Nicholas Pinho', null, '962966518', 'tylerpinho20@aol.com', '1996-07-12', 'USA', 'USA', '31977386', '135797543', null, null, null, null, '2018-10-03', 'user.png', null, '1', '247', '1035', null, '1', null);
INSERT INTO `Entidade` VALUES ('1537', '729946', 'André Melo Themudo Soares Castro', null, '912424516', null, '1992-11-20', 'Portuguesa', 'Portugal', '13857716', '345432123', null, null, null, null, '2018-10-03', 'user.png', null, '1', '248', '1036', null, '1', null);
INSERT INTO `Entidade` VALUES ('1538', '561723', 'Sérgio Jorge Sousa Machado', '', '916685329', '', '1981-12-28', 'Portuguesa', 'Portugal', '12084123', '238691985', null, null, null, null, '2018-10-03', 'user.png', null, '1', '249', '1037', null, '1', null);
INSERT INTO `Entidade` VALUES ('1539', '707653', 'João Pedro Calcado Corte Real', null, '963545292', null, '1989-01-07', 'Portuguesa', 'Portugal', '13561958', '204926092', null, null, null, null, '2018-10-03', 'user.png', null, '1', '250', '1038', null, '1', null);
INSERT INTO `Entidade` VALUES ('1540', '727945', 'Raul Manuel Alves da Rocha', null, '917221494', null, '1990-01-25', 'Portuguesa', 'Portugal', '13768743', '243363443', null, null, null, null, '2018-10-03', 'user.png', null, '1', '251', '1039', null, '1', null);
INSERT INTO `Entidade` VALUES ('1541', '889606', 'Rui Jorge Oliveira Santos', null, '915446607', null, '1995-07-21', 'Portuguesa', 'Portugal', '147594146', '235821047', null, null, null, null, '2018-10-03', 'user.png', null, '1', '252', '1040', null, '1', null);
INSERT INTO `Entidade` VALUES ('1542', '567512', 'Nuno André da Costa Oliveira', null, '916043596', null, '1982-04-21', 'Portuguesa', 'Portugal', '11854348', '212884999', null, null, null, null, '2018-10-03', 'user.png', null, '1', '253', '1041', null, '1', null);
INSERT INTO `Entidade` VALUES ('1543', '890563', 'José Olavo Semedo Martins', null, '918846950', null, '1996-01-03', 'Portuguesa', 'Portugal', '14686426', '267366060', null, null, null, null, '2018-10-03', 'user.png', null, '1', '254', '1042', null, '1', null);
INSERT INTO `Entidade` VALUES ('1544', '847928', 'Duarte Castro Alves', null, '914065797', null, '1996-03-14', 'Portuguesa', 'Portugal', '13658296', '123321345', null, null, null, null, '2018-10-03', 'user.png', null, '1', '255', '1043', null, '1', null);
INSERT INTO `Entidade` VALUES ('1545', '750177', 'Miguel Ângelo Calcado de Almeida', null, '915873029', null, '1992-12-18', 'Portuguesa', 'Portugal', '14050755', '232123543', null, null, null, null, '2018-10-03', 'user.png', null, '1', '256', '1044', null, '1', null);
INSERT INTO `Entidade` VALUES ('1546', '858860', 'João Miguel Oliveira Soares', null, '912378353', null, '1997-05-31', 'Portuguesa', 'Portugal', '14861816', '432154321', null, null, null, null, '2018-10-04', 'user.png', null, '1', '257', '1045', null, '1', null);
INSERT INTO `Entidade` VALUES ('1547', '981557', 'António Daniel Vieira Carvalho', null, '918053781', null, '1996-02-08', 'Portuguesa', 'Portugal', '15147832', '238134946', null, null, null, null, '2018-10-04', 'user.png', null, '1', '258', '1046', null, '1', null);
INSERT INTO `Entidade` VALUES ('1548', '923158', 'Daniel Alves Silva', null, '911115364', null, '1999-07-31', 'Portuguesa', 'Portugal', '15483683', '187654321', null, null, null, null, '2018-10-04', 'user.png', null, '1', '259', '1047', null, '1', null);
INSERT INTO `Entidade` VALUES ('1549', '23456', 'Daniel David Meaño de Oliveira', '234865791', null, 'danieldanielmeano@gmail.com', '2001-12-26', 'Venezuelana', 'Portugal', '15074452', '257583947', null, null, null, null, '2018-10-04', 'user.png', null, '1', '268', '1048', null, '1', null);
INSERT INTO `Entidade` VALUES ('1550', '1073918', 'João António Santos Pinheiro', null, '916558100', null, '2001-04-23', 'Portuguesa', 'Portugal', '15494474', '250462664', null, null, null, null, '2018-10-04', 'user.png', null, '1', '269', '1049', null, '1', null);
INSERT INTO `Entidade` VALUES ('1552', '1011000', 'Diogo Santos Vigário', null, '914355381', null, '2001-06-18', 'Portuguesa', 'Portugal', '302986049', '211979546', null, null, null, null, '2018-11-14', 'user.png', null, '1', '271', '1051', null, '0', null);
INSERT INTO `Entidade` VALUES ('1553', '234543', 'Carlos Manuel França Cálix', null, '913707565', null, '2001-10-21', 'Portuguesa', 'Portugal', '30680164', '254369936', null, null, null, null, '2018-10-04', 'user.png', null, '1', '272', '1052', null, '1', null);
INSERT INTO `Entidade` VALUES ('1554', '994338', 'Bruno Marques', null, '912458165', 'lourencomarques44@gmail.com', '2001-03-04', 'Portuguesa', 'Portugal', '301822328', '251584720', 'O+', null, null, null, '2018-10-04', 'user.png', null, '1', '273', '1053', null, '1', null);
INSERT INTO `Entidade` VALUES ('1555', '987330', 'Vasco Xavier Marques Almeida', null, '910438118', 'vasco-cde@hotmail.com', '2001-02-16', 'Portuguesa', 'Portugal', '30064977', '238912680', null, null, null, null, '2018-10-04', 'user.png', null, '1', '274', '1054', null, '1', null);
INSERT INTO `Entidade` VALUES ('1556', '11111111', 'Abel Xavier Marques Andrade', null, '915970271', 'abelmarques260@gmail.com', '2001-12-07', 'Portuguesa', 'Venezuela', '15945186', '266539190', null, null, null, null, '2018-10-04', 'user.png', null, '1', '275', '1055', null, '1', null);
INSERT INTO `Entidade` VALUES ('1557', '11111112', 'Christopher Alexander Esteves Cortes', null, '938779007', 'christopheresteves1108@gmail.com', '2001-08-11', 'Portuguesa', 'Venezuela', '31573632', '296306070', null, null, null, null, '2018-10-04', 'user.png', null, '1', '276', '1056', null, '1', null);
INSERT INTO `Entidade` VALUES ('1558', '1111345', 'João Pedro de Galvão e Silva', null, null, 'josegalvao31@gmail.com', '2002-09-09', 'Avanca', 'Portugal', '14401793', '247364193', 'O+', null, null, null, '2018-10-05', 'user.png', null, '1', '278', '1057', null, '1', null);
INSERT INTO `Entidade` VALUES ('1559', null, 'Elisabete Marisa da Costa Galvão', null, '966649587', 'marisagalvao2777@live.com.pt', '2018-10-04', null, null, '11110955', '215700694', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '1058', null, '1', null);
INSERT INTO `Entidade` VALUES ('1560', null, 'António Luis da Silva', null, '917204123', 'antoniol.silva1965@gmail.com', '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '1059', null, '1', null);
INSERT INTO `Entidade` VALUES ('1561', '1234563', 'Bruno Ferreira Silva', null, null, 'jessi.silva54@gmail.com', '2002-07-02', 'Ovar', 'Portugal', '30819702', '250397919', 'A+', null, null, null, '2018-10-05', 'user.png', null, '1', '279', '1060', null, '1', null);
INSERT INTO `Entidade` VALUES ('1562', null, 'Eduardo Jorge Valente Silva', null, '938357018', null, '2018-10-04', null, null, '9611330', '169004627', null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '1061', null, '1', null);
INSERT INTO `Entidade` VALUES ('1563', null, 'Maria Lasalete Ferreira Crez Silva', null, '933737824', null, '2018-10-04', null, null, null, null, null, null, null, null, '2018-10-05', 'user.png', null, '5', null, '1062', null, '1', null);
INSERT INTO `Entidade` VALUES ('1564', '1083910', 'João Pedro Novo Sabina', null, '963632245', null, '2005-04-08', 'Torreira', 'Portugal', '15020423', '253748054', null, '7ºAno', null, null, '2018-10-06', 'user.png', null, '1', '280', '1063', null, '1', null);
INSERT INTO `Entidade` VALUES ('1565', null, 'Rosa Maria Evaristo Novo', null, '961537051', 'rosanovo72@gmail.com', '2018-10-05', null, null, '9851961', '175965579', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1064', null, '1', null);
INSERT INTO `Entidade` VALUES ('1566', null, 'Diamantino Manuel Sabina', null, '961320720', 'diamantino.sabina@gmail.com', '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1065', null, '1', null);
INSERT INTO `Entidade` VALUES ('1567', '111111324', 'Pedro Miguel Rodrigues Pinto', null, '916561558', null, '2005-06-27', null, null, '15942734', '255404360', null, '7ºAno', null, null, '2018-10-06', 'user.png', null, '1', '281', '1066', null, '1', null);
INSERT INTO `Entidade` VALUES ('1568', null, 'Miguel Duarte Pinto Pereira', null, '916561558', null, '2018-10-05', null, null, '12841388', '224239228', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1067', null, '1', null);
INSERT INTO `Entidade` VALUES ('1569', null, 'Cátia Sofia Pereira Rodrigues', null, '913345654', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1068', null, '1', null);
INSERT INTO `Entidade` VALUES ('1570', '990099', 'Ricardo Andrade Magalhães', null, '969430742', 'ricardomagalhaes2005@hotmail.com', '2005-09-03', null, null, '30791364', '257549129', 'O+', null, null, null, '2018-11-29', 'user.png', null, '1', null, '1069', null, '0', null);
INSERT INTO `Entidade` VALUES ('1571', '432151', 'Tiago André Rodrigues Soares', null, '918378090', null, '2005-09-14', null, 'Portugal', '15381725', '257810978', null, null, null, null, '2018-10-06', 'user.png', null, '1', '282', '1070', null, '1', null);
INSERT INTO `Entidade` VALUES ('1572', null, 'Ana Paula Rodrigues Cabral', null, '918378090', 'anaprcabral@hotmail.com', '2018-10-05', null, null, '15381725', '257810978', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1071', null, '1', null);
INSERT INTO `Entidade` VALUES ('1573', null, 'José Manuel Carvalho Marques', null, null, null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1072', null, '1', null);
INSERT INTO `Entidade` VALUES ('1574', '765432', 'Ricardo Daniel Tavares Nunes', null, '962817443', null, '2004-05-22', null, null, '14984216', '257751874', 'A+', null, null, null, '2018-10-06', 'user.png', null, '1', '283', '1073', null, '1', null);
INSERT INTO `Entidade` VALUES ('1575', null, 'Graça Maria Nunes de Pinho Tavares', null, '962817443', null, '2018-10-05', null, null, '7433389', '171085752', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1074', null, '1', null);
INSERT INTO `Entidade` VALUES ('1576', null, 'António Manuel Tavares Silva', null, '962817443', null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1075', null, '1', null);
INSERT INTO `Entidade` VALUES ('1577', '2323451', 'Sabastian José Oliveira', null, '910039748', 'sabasmeano@gmail.com', '2004-07-09', null, null, '15074463', '257583670', null, null, null, null, '2018-10-06', 'user.png', null, '1', '284', '1076', null, '1', null);
INSERT INTO `Entidade` VALUES ('1578', null, 'Marlene de Oliveira da Silva', null, null, 'lene4669@gmail.com', '2018-10-05', null, null, '12502378', '244430829', null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1077', null, '1', null);
INSERT INTO `Entidade` VALUES ('1579', null, 'Arquimedes José Meaño Sanchez', null, null, null, '2018-10-05', null, null, null, null, null, null, null, null, '2018-10-06', 'user.png', null, '5', null, '1078', null, '1', null);
INSERT INTO `Entidade` VALUES ('1580', '1107246', 'Martim Aleixo Sousa', null, '918382164', 'sousacarlos72@gmail.com', '2006-12-06', 'Ovar', 'Portugal', '30356709', '258537027', null, '6º Ano', null, null, '2018-10-19', 'user.png', null, '1', '285', '1079', null, '1', null);
INSERT INTO `Entidade` VALUES ('1581', null, 'Carlos Manuel', null, '918382164', 'sousacarlos72@gmai.com', '2018-10-18', null, null, '10911879', '197807534', null, null, null, null, '2018-10-19', 'user.png', null, '5', null, '1080', null, '1', null);
INSERT INTO `Entidade` VALUES ('1582', null, 'Ana Paula Oliveira Aleixo', null, '918622461', null, '2018-10-18', null, null, null, null, null, null, null, null, '2018-10-19', 'user.png', null, '5', null, '1081', null, '1', null);
INSERT INTO `Entidade` VALUES ('1583', '1194308', 'Rodrigo Miguel Silva Sousa', '234849569', null, null, '2006-09-26', 'Estarreja', 'Portugal', '15408709', '258167408', null, '6º Ano', null, null, '2018-10-19', 'user.png', null, '1', '286', '1082', null, '1', null);
INSERT INTO `Entidade` VALUES ('1584', null, 'António Boaventura Alves de Sousa', null, '962705488', null, '2018-10-18', null, null, '7685224', '173809243', null, null, null, null, '2018-10-19', 'user.png', null, '5', null, '1083', null, '1', null);
INSERT INTO `Entidade` VALUES ('1585', null, 'Rosa Maria Tavares Silva', null, '962924795', 'rosa.mariats@hotmail.com', '2018-10-18', null, null, null, null, null, null, null, null, '2018-10-19', 'user.png', null, '5', null, '1084', null, '1', null);
INSERT INTO `Entidade` VALUES ('1586', '123411', 'Diogo Miranda Amarante', null, null, null, '2007-02-12', null, 'Portugal', '30504750', '262067439', null, null, null, null, '2018-10-09', 'user.png', null, '1', '287', '1085', null, '1', null);
INSERT INTO `Entidade` VALUES ('1587', null, 'António João Rodrigues Miranda', null, null, null, '2018-10-08', null, null, '7329829', '182343367', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '1086', null, '1', null);
INSERT INTO `Entidade` VALUES ('1588', '1457321', 'Rodrigo Pinho Peixoto', null, '935952549', null, '2007-03-10', 'Porto', 'Portugal', '30976147', '259737178', 'O+', '6º Ano', null, null, '2018-10-09', 'user.png', null, '1', '288', '1087', null, '1', null);
INSERT INTO `Entidade` VALUES ('1589', null, 'Serafim da Silva Peixoto', null, null, null, '2018-10-08', null, null, '8428031', '179219278', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '1088', null, '1', null);
INSERT INTO `Entidade` VALUES ('1590', null, 'Irene sofia Henriques Pereira de Pinho', null, '925419015', null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '1089', null, '1', null);
INSERT INTO `Entidade` VALUES ('1591', '2321245', 'Fabiano Silva Monteiro', null, null, null, '2007-04-23', null, 'Portugal', '31224573', '262352273', null, null, null, null, '2018-10-09', 'user.png', null, '1', '289', '1090', null, '1', null);
INSERT INTO `Entidade` VALUES ('1592', null, 'António da Silva Monteiro', null, '935098437monteirosilvaantónio84@gmail.com', null, '2018-10-08', null, null, '13268840', '224756184', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '1091', null, '1', null);
INSERT INTO `Entidade` VALUES ('1593', null, 'Elisabete Mónica Pereira Monteiro', null, '935098437', null, '2018-10-08', null, null, '13305069', '214136868', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '1092', null, '1', null);
INSERT INTO `Entidade` VALUES ('1594', '11443321', 'Diogo Costa Cunha Valente', null, '931985423', null, '2007-01-02', 'Ovar', 'Portugal', '31386908', '262336880', null, null, null, null, '2018-10-09', 'user.png', null, '1', '290', '1093', null, '1', null);
INSERT INTO `Entidade` VALUES ('1595', null, 'Patrícia Manuel da Costa Cunha', null, '931985423', null, '2018-10-08', null, null, '11068460', '219039046', null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '1094', null, '1', null);
INSERT INTO `Entidade` VALUES ('1596', null, 'Edgar da Graça Valente', null, null, null, '2018-10-08', null, null, null, null, null, null, null, null, '2018-10-09', 'user.png', null, '5', null, '1095', null, '1', null);
INSERT INTO `Entidade` VALUES ('1597', '543211', 'João Tiago Paiva Mendonça', null, null, 'paulo.oliveira.mendonca@gmail.com', '2007-02-18', 'Murtosa', 'Portugal', '31232273', '261070444', null, null, null, null, '2018-10-10', 'user.png', null, '1', '291', '1096', null, '1', null);
INSERT INTO `Entidade` VALUES ('1598', null, 'Paulo Alexandre da Silva Caldas de Oliveira Mendonça', '', '967123286', 'paulo.oliveira.mendonca@gmail.com', '2018-10-09', null, null, '10628291', '173488242', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1097', null, '1', null);
INSERT INTO `Entidade` VALUES ('1599', null, 'Maria João Henriques da Costa Paiva', null, '962388100', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1098', null, '1', null);
INSERT INTO `Entidade` VALUES ('1600', '1235555', 'Diogo Oliveira Cabilhas', null, '913664630', 'paula_cabilhas@hotmail.com', '2007-06-14', 'Pardilhó', 'Portugal', '31231706', '274284987', null, '5º Ano', null, null, '2018-10-10', 'user.png', null, '1', '292', '1099', null, '1', null);
INSERT INTO `Entidade` VALUES ('1601', null, 'Paula Cristina Gomes Oliveira Cabilhas', null, '913664630', 'paula_cabilhas@hotmail.com', '2018-10-09', null, null, '9838179', '196638887', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1100', null, '1', null);
INSERT INTO `Entidade` VALUES ('1602', null, 'Paulo Alexandre da Silva Cabilhas', null, '913271279', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1101', null, '1', null);
INSERT INTO `Entidade` VALUES ('1603', '111111111', 'Guilherme Afonso Rodrigues Saramago', null, null, null, '2007-02-28', 'Salreu', 'Portugal', '31595262', '274821524', null, null, null, null, '2018-10-10', 'user.png', null, '1', '293', '1102', null, '1', null);
INSERT INTO `Entidade` VALUES ('1604', null, 'Sandra Cristina Bastos Rodrigues', null, '913405931', null, '2018-10-09', null, null, '11703138', '224906160', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1103', null, '1', null);
INSERT INTO `Entidade` VALUES ('1605', null, 'Carlos Alberto Pereira Saramago', null, '914665080', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1104', null, '1', null);
INSERT INTO `Entidade` VALUES ('1606', '11224433', 'Santiago Nunes Gomes', null, '912333479', null, '2008-09-03', null, 'Portugal', '15799356', '275094383', null, '4º Ano', null, null, '2018-10-10', 'user.png', null, '1', '295', '1105', null, '1', null);
INSERT INTO `Entidade` VALUES ('1607', null, 'Rui Jorge Marques Gomes', null, '912333479', null, '2018-10-09', null, null, '10371274', '196027276', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1106', null, '1', null);
INSERT INTO `Entidade` VALUES ('1608', null, 'Susana Maria de Pinho Nunes', null, '917305118', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1107', null, '1', null);
INSERT INTO `Entidade` VALUES ('1609', '54345654', 'Diogo Miguel Antão de Afonso', null, '962412149 pai', null, '2008-09-09', 'Estarreja', 'Portugal', '30745342', '275835936', null, '4º Ano', null, null, '2018-10-10', 'user.png', null, '1', '296', '1108', null, '1', null);
INSERT INTO `Entidade` VALUES ('1610', null, 'Luis Miguel de Oliveira Afonso', null, '962412149', 'rluismanuela@gmail.com', '2018-10-09', null, null, '9611136', '189652225', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1109', null, '1', null);
INSERT INTO `Entidade` VALUES ('1611', null, 'Maria Manuela de Sousa Antão', null, '961910759', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1110', null, '1', null);
INSERT INTO `Entidade` VALUES ('1612', '2123324', 'Samuel Pereira Figueiredo', null, '964566918', null, '2008-11-19', null, null, '15853656', '265360560', null, '4º Ano', 'Asmatico - faz tratamento', null, '2018-10-10', 'user.png', null, '1', '297', '1111', null, '1', null);
INSERT INTO `Entidade` VALUES ('1613', null, 'Rui Manuel Rodrigues de Figueiredo', null, '964566918', null, '2018-10-09', null, null, '10050893', '193509482', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1112', null, '1', null);
INSERT INTO `Entidade` VALUES ('1614', null, 'Claudia Sofia da Silva Pereira Figueiredo', null, '967568191', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1113', null, '1', null);
INSERT INTO `Entidade` VALUES ('1615', '2343212', 'Ricardo Daniel Soares Gonchar', null, null, null, '2009-11-08', null, null, '30196886', '269683836', null, null, null, null, '2018-10-10', 'user.png', null, '1', '298', '1114', null, '1', null);
INSERT INTO `Entidade` VALUES ('1616', null, 'Yuliya Gonchar', null, '913378822', 'ysg1@hotmail.com', '2018-10-09', null, null, '31188099', '243927495', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1115', null, '1', null);
INSERT INTO `Entidade` VALUES ('1617', null, 'João Valente', null, '963979533', null, '2018-10-09', null, null, '30196886', '269683836', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1116', null, '1', null);
INSERT INTO `Entidade` VALUES ('1618', '432543', 'Deyker Didier Vasconcelos Matos', null, '912559076', 'dig24lisseth@gmail.com', '2009-09-30', 'Caracas', 'Venezuela', '32139815', '295457864', null, null, null, null, '2018-10-10', 'user.png', null, '1', '299', '1117', null, '1', null);
INSERT INTO `Entidade` VALUES ('1619', null, 'José Alberto Vasconcelos Sousa', null, '928056619', null, '2018-10-09', null, null, '31710245', '295218177', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1118', null, '1', null);
INSERT INTO `Entidade` VALUES ('1620', null, 'Digna Lisseth Matos Ochoa', null, '912559076', 'dig24lisseth@gmail.com', '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1119', null, '1', null);
INSERT INTO `Entidade` VALUES ('1621', '1221233', 'Dinis Vieira Miranda', null, '916036891', null, '2009-06-09', 'Portuguesa', 'Portugal', '30049737', '271583681', null, null, null, null, '2018-10-10', 'user.png', null, '1', '300', '1120', null, '1', null);
INSERT INTO `Entidade` VALUES ('1622', null, 'Raquel da Conceição Rodrigues Vieira', null, '916036891', null, '2018-10-09', null, null, '11258418', '211254975', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1121', null, '1', null);
INSERT INTO `Entidade` VALUES ('1623', null, 'Alfredo José da Silva Miranda', null, '917139987', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1122', null, '1', null);
INSERT INTO `Entidade` VALUES ('1624', '121213', 'Pol Sousa Mestres', null, '912867785', 'mestresmar37@gmail.com', '2009-06-30', 'Tarragona', 'Espanha', '3223440', '279362064', 'O+', null, 'Asmatico', null, '2018-10-10', 'user.png', null, '1', '301', '1123', null, '1', null);
INSERT INTO `Entidade` VALUES ('1625', null, 'Maria del Mar Mestres Ramon', null, '912867785', 'mestresmar37@gmail.com', '2018-10-09', null, null, 'BEQ179036', '111111111', null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1124', null, '1', null);
INSERT INTO `Entidade` VALUES ('1626', null, 'Paulo Guilherme Sousa Dias', null, '918381799', null, '2018-10-09', null, null, null, null, null, null, null, null, '2018-10-10', 'user.png', null, '5', null, '1125', null, '1', null);
INSERT INTO `Entidade` VALUES ('1627', '343212', 'Tiago Cristovão da Silva Dias', null, null, null, '2011-02-05', 'Canelas', 'Portugal', '30595128', '273662562', null, null, null, null, '2018-10-23', 'user.png', null, '1', '302', '1126', null, '1', null);
INSERT INTO `Entidade` VALUES ('1628', null, 'Paulo Valente Dias', null, '965643344', 'paulodias1975@gmail.com.com', '2018-10-22', null, null, '10544757', '208024514', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1127', null, '1', null);
INSERT INTO `Entidade` VALUES ('1629', null, 'Catarina Alexandra Ramos da Silva', null, '965386450', 'catarina.alexandra.ramos.silva@gmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1128', null, '1', null);
INSERT INTO `Entidade` VALUES ('1630', '1251058', 'Sebastião José Pereira da Silveira', null, '963667439', 'ajfsilveira@gmail.com', '2011-09-12', null, 'Portugal', '30813096', '277276390', null, null, null, null, '2018-11-15', 'user.png', null, '1', '303', '1129', null, '1', null);
INSERT INTO `Entidade` VALUES ('1631', null, 'Abílio José Ferreira da Silveira', null, '963667439', 'ajfsilveira@gmail.com', '2018-11-14', null, null, '23432123', '345665432', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1130', null, '1', null);
INSERT INTO `Entidade` VALUES ('1632', null, 'Ilidia Mónica Marques Pereira', null, null, null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1131', null, '1', null);
INSERT INTO `Entidade` VALUES ('1633', '00000000', 'Rodrigo da Cruz Reis', null, '965327471', 'carlosmpcreis@hotmail.com', '2010-11-24', 'Matosinhos', 'Portugal', '30545940', '275101509', null, '2º Ano', null, null, '2018-10-23', 'user.png', null, '1', '304', '1132', null, '1', null);
INSERT INTO `Entidade` VALUES ('1634', null, 'Carlos Manuel da Costa Reis', null, '965327471', 'carlosmpcreis@hotmail.com', '2018-10-22', null, null, '11332970', '221896643', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1133', null, '1', null);
INSERT INTO `Entidade` VALUES ('1635', null, 'Fernanda Marisa Rodrigues da Cruz', null, '965480399', 'fmarisarcruz@hotmail.com', '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1134', null, '1', null);
INSERT INTO `Entidade` VALUES ('1636', '0000002', 'David José da Silva Chipelo', null, '913175602', null, '2010-08-11', null, 'Portugal', '30525326', '272514845', null, '3º Ano', 'Suspeita de asma', null, '2018-10-23', 'user.png', null, '1', '305', '1135', null, '1', null);
INSERT INTO `Entidade` VALUES ('1637', null, 'Loredana Narcisa Bondoc', null, '913175602', null, '2018-10-22', null, null, '31584989', '242800327', null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1136', null, '1', null);
INSERT INTO `Entidade` VALUES ('1638', null, 'José António da Silva Chipelo', null, '912457336', null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1137', null, '1', null);
INSERT INTO `Entidade` VALUES ('1639', '00000003', 'Baltasar Marques Pires', null, null, null, '2010-12-21', null, 'Portugal', '30562223', '273364367', null, null, null, null, '2018-10-23', 'user.png', null, '1', '306', '1138', null, '1', null);
INSERT INTO `Entidade` VALUES ('1640', null, 'Sonia Alexandra Soutinho Marques', null, '960182425', null, '2018-10-22', null, null, null, null, null, null, null, null, '2018-10-23', 'user.png', null, '5', null, '1139', null, '1', null);
INSERT INTO `Entidade` VALUES ('1641', '323456', 'Andrés Santiago Yánez Ferreira', '234844124', null, null, '2008-12-05', 'Venezuelana', 'Venezuela', '30289514', '296947873', 'O-', '3º Ano', null, 'Estudante', '2018-11-15', 'user.png', null, '1', '307', '1140', null, '1', null);
INSERT INTO `Entidade` VALUES ('1642', null, 'Natália Ferreira de Almeida', null, '', 'natalia_ferreira@hotmail.com', '2018-11-14', null, null, '14487739', '249610736', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1141', null, '1', null);
INSERT INTO `Entidade` VALUES ('1643', null, 'Marlon Ismael Yánez Querecuto', null, '916817231', 'marlon_yanez@outlook.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1142', null, '1', null);
INSERT INTO `Entidade` VALUES ('1644', '1232123', 'João Silva Pinho', null, '966855683', 'carlosmvpinho@gmail.com', '2010-11-10', 'Murtosa', 'Portugal', '30253164', '270234136', null, '1º Ciclo', null, 'Estudante', '2018-11-15', 'user.png', null, '1', '308', '1143', null, '1', null);
INSERT INTO `Entidade` VALUES ('1645', null, 'Carlos Manuel Valente de Pinho', null, '966855683', 'carlosmvpinho@gmail.com', '2018-11-14', null, null, '09786750', '187009899', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1144', null, '1', null);
INSERT INTO `Entidade` VALUES ('1646', null, 'Olga de Fátima Pereira Silva', null, '960150751', 'olgafpsilva@sapo.pt', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1145', null, '1', null);
INSERT INTO `Entidade` VALUES ('1647', '6545632', 'Leonardo José Silva Rodrigues Botrav', null, null, null, '2004-10-25', 'Portuguesa', 'Portugal', '310672490', '258436077', null, 'Secundária', null, null, '2018-11-15', 'user.png', null, '1', '309', '1146', null, '1', null);
INSERT INTO `Entidade` VALUES ('1648', null, 'Guida Maria da Silva Rodrigues', null, '912318977', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1147', null, '1', null);
INSERT INTO `Entidade` VALUES ('1649', '1122112', 'Ricardo Henrique Silva Carvalho', '234284037', '913300258', null, '2005-01-19', null, null, '31533815', '252547934', null, null, null, null, '2018-11-15', 'user.png', null, '1', '310', '1148', null, '1', null);
INSERT INTO `Entidade` VALUES ('1650', null, 'Ana Teresa de Jesus Silva', null, null, null, '2018-11-14', null, null, '10427984', '206704453', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1149', null, '1', null);
INSERT INTO `Entidade` VALUES ('1651', '5443456', 'Diego Martim Afonso de Marquez', null, null, null, '2011-10-27', 'Portuguesa', null, '30847220', '277699894', null, null, null, null, '2018-11-15', 'user.png', null, '1', '311', '1150', null, '1', null);
INSERT INTO `Entidade` VALUES ('1652', null, 'Jessika Sharon Marques Marquez', null, '910502691', 'jessikasharon@hotmail.com', '2018-11-14', null, null, '111111', '111111111', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1151', null, '1', null);
INSERT INTO `Entidade` VALUES ('1653', null, 'Cláudio Alexandre da Silva Afonso', null, null, null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1152', null, '1', null);
INSERT INTO `Entidade` VALUES ('1654', '44444', 'Gustavo Alexandre Gomes Urbano', null, '910271693  (mãe)', 'patriciaurbano@sapo.pt', '2011-07-16', 'Portuguesa', null, '30765044', '278300561', null, null, null, null, '2018-11-15', 'user.png', null, '1', '312', '1153', null, '1', null);
INSERT INTO `Entidade` VALUES ('1655', null, 'Patrícia Isabel Lopes Urbano', null, '910271693', 'patriciaurbano@sapo.pt', '2018-11-14', null, null, '111111', '111111112', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1154', null, '1', null);
INSERT INTO `Entidade` VALUES ('1656', '332244', 'Bruno Rafael Silva Sousa', null, '969494964-966005785', 'brunobenfiquista447@gmail.com', '2005-12-17', 'Portuguesa', null, '15601951', '256947368', null, null, null, null, '2018-11-15', 'user.png', null, '1', '313', '1155', null, '1', null);
INSERT INTO `Entidade` VALUES ('1657', null, 'António João Lopes Sousa', null, '966005785', 'sousaj73@hotmail.com', '2018-11-14', null, null, '10452672', '186462204', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1156', null, '1', null);
INSERT INTO `Entidade` VALUES ('1658', null, 'Maria Manuela Tavares Silva Sousa', null, '969494964', 'mariamanuelas@sapo.pt', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1157', null, '1', null);
INSERT INTO `Entidade` VALUES ('1659', '378908', 'Duarte Marques Pires', null, null, null, '2013-08-17', 'Portuguesa', null, '31287280', '281873011', null, null, null, null, '2018-11-15', 'user.png', null, '1', '314', '1158', null, '1', null);
INSERT INTO `Entidade` VALUES ('1660', null, 'Rui Baltazar Rodrigues Pires', null, '915864298', 'rbpires@gmail.com', '2018-11-14', null, null, '13911622', '214606511', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1159', null, '1', null);
INSERT INTO `Entidade` VALUES ('1661', null, 'Sonia Alexandra Soutinho Marques', null, '960182425', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1160', null, '1', null);
INSERT INTO `Entidade` VALUES ('1662', '222212', 'Duarte Martins Marques', null, '919035618', 'landiny@gmail.com', '2013-01-26', 'Portuguesa', null, '31149723', '280348991', null, null, null, null, '2018-11-15', 'user.png', null, '1', '315', '1161', null, '1', null);
INSERT INTO `Entidade` VALUES ('1663', null, 'Orlando Manuel Nogueira Marques', null, '919035618', 'landiny@gmail.com', '2018-11-14', null, null, '11863713', '218574703', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1162', null, '1', null);
INSERT INTO `Entidade` VALUES ('1664', null, 'Sandra Soares Martins', null, '965566866', 'sandrasoaresmartins@gmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1163', null, '1', null);
INSERT INTO `Entidade` VALUES ('1665', '4455533', 'João Nuno Teixeira Laranjeira', '', null, '', '2013-11-15', 'Portuguesa', 'Portugal', '31360688', '382373780', 'O+', null, null, null, '2018-11-15', 'user.png', null, '1', '316', '1164', null, '1', null);
INSERT INTO `Entidade` VALUES ('1666', null, 'Jorge Daniel Gonçalves Laranjeira', null, '968805025', 'jorge.d.laranjeira@gmail.com', '2018-11-14', null, null, '10759685', '173297641', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1165', null, '1', null);
INSERT INTO `Entidade` VALUES ('1667', null, 'Bárbara Isabel Aniceto T. Laranjeira', null, '919388053', 'barbara.i.laranjeira@gmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1166', null, '1', null);
INSERT INTO `Entidade` VALUES ('1668', '444555', 'Diogo Miguel Martins Damas', null, '914644520', null, '2012-03-27', 'Portuguesa', 'Portugal', '30948308', '278155936', null, null, null, null, '2018-11-15', 'user.png', null, '1', '317', '1167', null, '1', null);
INSERT INTO `Entidade` VALUES ('1669', null, 'Célia Maria Rodrigues Martins', null, '914644520', 'celia-mrm@hotmail.com', '2018-11-14', null, null, '10871557', '212781715', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1168', null, '1', null);
INSERT INTO `Entidade` VALUES ('1670', null, 'Frederico António Ribeiro Damas', null, '916978638', 'fredericodamas@hotmail.com', '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1169', null, '1', null);
INSERT INTO `Entidade` VALUES ('1671', '44433322', 'Leonardo Vieira da Costa Marques', null, null, null, '2012-09-12', 'Portuguesa', 'Portugal', '31075879', '279813228', 'A+', '1º Ano', null, null, '2018-11-15', 'user.png', null, '1', null, '1170', null, '1', null);
INSERT INTO `Entidade` VALUES ('1672', null, 'Liliana da Costa Marques', null, '964730272', 'lilianacmarques@outlook.com', '2018-11-14', null, null, '11669002', '222110465', null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1171', null, '1', null);
INSERT INTO `Entidade` VALUES ('1673', null, 'Joaquim Domingos de Sousa Marques', '', '927397618', null, '2018-11-14', null, null, null, null, null, null, null, null, '2018-11-15', 'user.png', null, '5', null, '1172', null, '1', null);
INSERT INTO `Entidade` VALUES ('1674', '2323343', 'Rafael Castro e Silva', '', '914041932', 'soniacosmaticos@sapo.pt', '2008-07-08', 'Portuguesa', 'Portugal', '15719538', '266493610', 'B+', null, null, null, '2018-11-29', 'user.png', null, '1', '318', '1173', null, '1', null);
INSERT INTO `Entidade` VALUES ('1675', null, 'Sónia Alexandra dos Santos e Castro', null, '914041932', 'soniacosmeticos@sapo.pt', '2018-11-28', null, null, null, null, null, null, null, null, '2018-11-29', 'user.png', null, '5', null, '1174', null, '1', null);
INSERT INTO `Entidade` VALUES ('1677', '111221', 'Gonçalo Dinís Silva Monteiro', null, '934090177', null, '2006-01-05', null, 'Portugal', '31657818', '269286829', null, null, 'Bronquite', null, '2018-12-05', 'user.png', null, '1', '319', '1176', null, '1', null);
INSERT INTO `Entidade` VALUES ('1678', null, 'Joaquim Jesus Freitas Silva', null, '918676538', null, '2018-12-04', null, null, null, null, null, null, null, null, '2018-12-05', 'user.png', null, '5', null, '1177', null, '1', null);
INSERT INTO `Entidade` VALUES ('1679', null, 'Júlia Arminda Almeida Lopes e Silva', null, null, null, '2018-12-04', null, null, null, null, null, null, null, null, '2018-12-05', 'user.png', null, '5', null, '1178', null, '1', null);
INSERT INTO `Entidade` VALUES ('1680', null, 'Joaquim Jesus Freitas Silva', null, '918676538', null, '2018-12-04', null, null, null, null, null, null, null, null, '2018-12-05', 'user.png', null, '5', null, '1179', null, '1', null);
INSERT INTO `Entidade` VALUES ('1681', null, 'Júlia Arminda Almeida Lopes e Silva', null, null, null, '2018-12-04', null, null, null, null, null, null, null, null, '2018-12-05', 'user.png', null, '5', null, '1180', null, '1', null);
INSERT INTO `Entidade` VALUES ('1682', '555333222', 'João Gabriel Marques Silva', null, null, null, '2009-02-12', 'Estarreja', 'Portugal', '15921223', '275066886', null, '4º Ano', null, null, '2018-12-10', 'user.png', null, '1', '320', '1181', null, '1', null);
INSERT INTO `Entidade` VALUES ('1683', null, 'João Pedro Silva', null, '967115549', 'jp.silva39@hotmail.com', '2018-12-09', null, null, '10895205', '189671726', null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1182', null, '1', null);
INSERT INTO `Entidade` VALUES ('1684', null, 'Ana Sofia Soutinho Marques', null, null, null, '2018-12-09', null, null, null, null, null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1183', null, '1', null);
INSERT INTO `Entidade` VALUES ('1685', '2211111', 'Duarte Resende Costa', null, null, null, '2011-09-06', null, 'Portugal', '30809419', '277476194', null, 'º Ano', null, null, '2018-12-10', 'user.png', null, '1', '321', '1184', null, '1', null);
INSERT INTO `Entidade` VALUES ('1686', null, 'Alberto Jorge Daniel Resende Costa', null, '968656141', 'alberto.costa@ua.pt', '2018-12-09', null, null, null, null, null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1185', null, '1', null);
INSERT INTO `Entidade` VALUES ('1687', null, 'Rosa Maria Branco de Matos Costa Resende', null, '917722103', null, '2018-12-09', null, null, null, null, null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1186', null, '1', null);
INSERT INTO `Entidade` VALUES ('1688', '1111342', 'Duarte Pereira de Sousa', null, '917318833', null, '2014-11-27', null, 'Portugal', '31535917', '284589586', null, null, 'Alergias alimentares', null, '2018-12-10', 'user.png', null, '1', '322', '1187', null, '1', null);
INSERT INTO `Entidade` VALUES ('1689', null, 'Luis Miguel Pereira de Sousa', null, '966492010', 'miguel.sousa@hotmail.com', '2018-12-09', null, null, '5555555', '333444222', null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1188', null, '1', null);
INSERT INTO `Entidade` VALUES ('1690', null, 'Raquel Sofia Valente Pereira', null, '917318833', null, '2018-12-09', null, null, null, null, null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1189', null, '1', null);
INSERT INTO `Entidade` VALUES ('1691', '442221', 'Diogo Miguel Silva Oliveira', null, '936733089', null, '2012-03-09', null, null, '30937177', '278011110', null, null, null, null, '2018-12-10', 'user.png', null, '1', '323', '1190', null, '1', null);
INSERT INTO `Entidade` VALUES ('1692', null, 'Pedro Miguel dos Santos Rosas Oliveira', null, '936733089', 'pedromrso@gmail.com', '2018-12-09', null, null, '12024294', '216336988', null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1191', null, '1', null);
INSERT INTO `Entidade` VALUES ('1693', null, 'Marisa Isabel Matos Silva', null, null, null, '2018-12-09', null, null, null, null, null, null, null, null, '2018-12-10', 'user.png', null, '5', null, '1192', null, '1', null);

-- ----------------------------
-- Table structure for Entidade_Escalao
-- ----------------------------
DROP TABLE IF EXISTS `Entidade_Escalao`;
CREATE TABLE `Entidade_Escalao` (
  `ID_Entidade` int(11) NOT NULL,
  `ID_Escalao` int(11) NOT NULL,
  PRIMARY KEY (`ID_Entidade`,`ID_Escalao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Entidade_Escalao
-- ----------------------------
INSERT INTO `Entidade_Escalao` VALUES ('1', '9');
INSERT INTO `Entidade_Escalao` VALUES ('2', '9');
INSERT INTO `Entidade_Escalao` VALUES ('3', '9');
INSERT INTO `Entidade_Escalao` VALUES ('4', '9');
INSERT INTO `Entidade_Escalao` VALUES ('5', '9');
INSERT INTO `Entidade_Escalao` VALUES ('6', '9');
INSERT INTO `Entidade_Escalao` VALUES ('7', '9');
INSERT INTO `Entidade_Escalao` VALUES ('8', '9');
INSERT INTO `Entidade_Escalao` VALUES ('9', '9');
INSERT INTO `Entidade_Escalao` VALUES ('10', '9');
INSERT INTO `Entidade_Escalao` VALUES ('11', '9');
INSERT INTO `Entidade_Escalao` VALUES ('12', '9');
INSERT INTO `Entidade_Escalao` VALUES ('13', '9');
INSERT INTO `Entidade_Escalao` VALUES ('14', '9');
INSERT INTO `Entidade_Escalao` VALUES ('15', '9');
INSERT INTO `Entidade_Escalao` VALUES ('16', '9');
INSERT INTO `Entidade_Escalao` VALUES ('17', '9');
INSERT INTO `Entidade_Escalao` VALUES ('18', '9');
INSERT INTO `Entidade_Escalao` VALUES ('19', '9');
INSERT INTO `Entidade_Escalao` VALUES ('20', '9');
INSERT INTO `Entidade_Escalao` VALUES ('21', '9');
INSERT INTO `Entidade_Escalao` VALUES ('22', '9');
INSERT INTO `Entidade_Escalao` VALUES ('23', '9');
INSERT INTO `Entidade_Escalao` VALUES ('24', '8');
INSERT INTO `Entidade_Escalao` VALUES ('25', '8');
INSERT INTO `Entidade_Escalao` VALUES ('26', '8');
INSERT INTO `Entidade_Escalao` VALUES ('27', '8');
INSERT INTO `Entidade_Escalao` VALUES ('28', '8');
INSERT INTO `Entidade_Escalao` VALUES ('29', '8');
INSERT INTO `Entidade_Escalao` VALUES ('30', '8');
INSERT INTO `Entidade_Escalao` VALUES ('31', '8');
INSERT INTO `Entidade_Escalao` VALUES ('32', '8');
INSERT INTO `Entidade_Escalao` VALUES ('33', '8');
INSERT INTO `Entidade_Escalao` VALUES ('34', '8');
INSERT INTO `Entidade_Escalao` VALUES ('35', '8');
INSERT INTO `Entidade_Escalao` VALUES ('36', '8');
INSERT INTO `Entidade_Escalao` VALUES ('37', '8');
INSERT INTO `Entidade_Escalao` VALUES ('38', '8');
INSERT INTO `Entidade_Escalao` VALUES ('39', '8');
INSERT INTO `Entidade_Escalao` VALUES ('40', '8');
INSERT INTO `Entidade_Escalao` VALUES ('41', '8');
INSERT INTO `Entidade_Escalao` VALUES ('42', '8');
INSERT INTO `Entidade_Escalao` VALUES ('43', '8');
INSERT INTO `Entidade_Escalao` VALUES ('44', '8');
INSERT INTO `Entidade_Escalao` VALUES ('45', '8');
INSERT INTO `Entidade_Escalao` VALUES ('46', '8');
INSERT INTO `Entidade_Escalao` VALUES ('47', '8');
INSERT INTO `Entidade_Escalao` VALUES ('48', '8');
INSERT INTO `Entidade_Escalao` VALUES ('49', '8');
INSERT INTO `Entidade_Escalao` VALUES ('50', '7');
INSERT INTO `Entidade_Escalao` VALUES ('51', '7');
INSERT INTO `Entidade_Escalao` VALUES ('52', '7');
INSERT INTO `Entidade_Escalao` VALUES ('53', '7');
INSERT INTO `Entidade_Escalao` VALUES ('54', '7');
INSERT INTO `Entidade_Escalao` VALUES ('55', '7');
INSERT INTO `Entidade_Escalao` VALUES ('56', '7');
INSERT INTO `Entidade_Escalao` VALUES ('57', '7');
INSERT INTO `Entidade_Escalao` VALUES ('58', '7');
INSERT INTO `Entidade_Escalao` VALUES ('59', '7');
INSERT INTO `Entidade_Escalao` VALUES ('60', '7');
INSERT INTO `Entidade_Escalao` VALUES ('61', '7');
INSERT INTO `Entidade_Escalao` VALUES ('62', '7');
INSERT INTO `Entidade_Escalao` VALUES ('63', '7');
INSERT INTO `Entidade_Escalao` VALUES ('64', '7');
INSERT INTO `Entidade_Escalao` VALUES ('65', '7');
INSERT INTO `Entidade_Escalao` VALUES ('66', '7');
INSERT INTO `Entidade_Escalao` VALUES ('67', '7');
INSERT INTO `Entidade_Escalao` VALUES ('68', '7');
INSERT INTO `Entidade_Escalao` VALUES ('69', '7');
INSERT INTO `Entidade_Escalao` VALUES ('70', '7');
INSERT INTO `Entidade_Escalao` VALUES ('71', '7');
INSERT INTO `Entidade_Escalao` VALUES ('72', '7');
INSERT INTO `Entidade_Escalao` VALUES ('73', '7');
INSERT INTO `Entidade_Escalao` VALUES ('74', '7');
INSERT INTO `Entidade_Escalao` VALUES ('75', '7');
INSERT INTO `Entidade_Escalao` VALUES ('76', '7');
INSERT INTO `Entidade_Escalao` VALUES ('77', '7');
INSERT INTO `Entidade_Escalao` VALUES ('78', '7');
INSERT INTO `Entidade_Escalao` VALUES ('79', '7');
INSERT INTO `Entidade_Escalao` VALUES ('80', '7');
INSERT INTO `Entidade_Escalao` VALUES ('81', '7');
INSERT INTO `Entidade_Escalao` VALUES ('82', '7');
INSERT INTO `Entidade_Escalao` VALUES ('83', '7');
INSERT INTO `Entidade_Escalao` VALUES ('84', '7');
INSERT INTO `Entidade_Escalao` VALUES ('85', '7');
INSERT INTO `Entidade_Escalao` VALUES ('86', '7');
INSERT INTO `Entidade_Escalao` VALUES ('87', '7');
INSERT INTO `Entidade_Escalao` VALUES ('88', '7');
INSERT INTO `Entidade_Escalao` VALUES ('89', '7');
INSERT INTO `Entidade_Escalao` VALUES ('90', '7');
INSERT INTO `Entidade_Escalao` VALUES ('91', '7');
INSERT INTO `Entidade_Escalao` VALUES ('92', '7');
INSERT INTO `Entidade_Escalao` VALUES ('93', '7');
INSERT INTO `Entidade_Escalao` VALUES ('94', '6');
INSERT INTO `Entidade_Escalao` VALUES ('95', '6');
INSERT INTO `Entidade_Escalao` VALUES ('96', '6');
INSERT INTO `Entidade_Escalao` VALUES ('97', '6');
INSERT INTO `Entidade_Escalao` VALUES ('98', '6');
INSERT INTO `Entidade_Escalao` VALUES ('99', '6');
INSERT INTO `Entidade_Escalao` VALUES ('100', '6');
INSERT INTO `Entidade_Escalao` VALUES ('101', '6');
INSERT INTO `Entidade_Escalao` VALUES ('102', '6');
INSERT INTO `Entidade_Escalao` VALUES ('103', '6');
INSERT INTO `Entidade_Escalao` VALUES ('104', '6');
INSERT INTO `Entidade_Escalao` VALUES ('105', '6');
INSERT INTO `Entidade_Escalao` VALUES ('106', '6');
INSERT INTO `Entidade_Escalao` VALUES ('107', '6');
INSERT INTO `Entidade_Escalao` VALUES ('108', '6');
INSERT INTO `Entidade_Escalao` VALUES ('109', '6');
INSERT INTO `Entidade_Escalao` VALUES ('110', '6');
INSERT INTO `Entidade_Escalao` VALUES ('111', '6');
INSERT INTO `Entidade_Escalao` VALUES ('112', '6');
INSERT INTO `Entidade_Escalao` VALUES ('113', '6');
INSERT INTO `Entidade_Escalao` VALUES ('114', '6');
INSERT INTO `Entidade_Escalao` VALUES ('115', '5');
INSERT INTO `Entidade_Escalao` VALUES ('116', '5');
INSERT INTO `Entidade_Escalao` VALUES ('117', '5');
INSERT INTO `Entidade_Escalao` VALUES ('118', '5');
INSERT INTO `Entidade_Escalao` VALUES ('119', '5');
INSERT INTO `Entidade_Escalao` VALUES ('120', '5');
INSERT INTO `Entidade_Escalao` VALUES ('121', '5');
INSERT INTO `Entidade_Escalao` VALUES ('122', '5');
INSERT INTO `Entidade_Escalao` VALUES ('123', '5');
INSERT INTO `Entidade_Escalao` VALUES ('124', '5');
INSERT INTO `Entidade_Escalao` VALUES ('125', '5');
INSERT INTO `Entidade_Escalao` VALUES ('126', '5');
INSERT INTO `Entidade_Escalao` VALUES ('127', '5');
INSERT INTO `Entidade_Escalao` VALUES ('128', '5');
INSERT INTO `Entidade_Escalao` VALUES ('129', '5');
INSERT INTO `Entidade_Escalao` VALUES ('130', '5');
INSERT INTO `Entidade_Escalao` VALUES ('131', '5');
INSERT INTO `Entidade_Escalao` VALUES ('132', '5');
INSERT INTO `Entidade_Escalao` VALUES ('133', '5');
INSERT INTO `Entidade_Escalao` VALUES ('134', '5');
INSERT INTO `Entidade_Escalao` VALUES ('135', '5');
INSERT INTO `Entidade_Escalao` VALUES ('136', '4');
INSERT INTO `Entidade_Escalao` VALUES ('137', '4');
INSERT INTO `Entidade_Escalao` VALUES ('138', '4');
INSERT INTO `Entidade_Escalao` VALUES ('139', '4');
INSERT INTO `Entidade_Escalao` VALUES ('140', '4');
INSERT INTO `Entidade_Escalao` VALUES ('141', '4');
INSERT INTO `Entidade_Escalao` VALUES ('142', '4');
INSERT INTO `Entidade_Escalao` VALUES ('143', '4');
INSERT INTO `Entidade_Escalao` VALUES ('144', '4');
INSERT INTO `Entidade_Escalao` VALUES ('145', '4');
INSERT INTO `Entidade_Escalao` VALUES ('146', '4');
INSERT INTO `Entidade_Escalao` VALUES ('147', '4');
INSERT INTO `Entidade_Escalao` VALUES ('148', '4');
INSERT INTO `Entidade_Escalao` VALUES ('149', '4');
INSERT INTO `Entidade_Escalao` VALUES ('150', '4');
INSERT INTO `Entidade_Escalao` VALUES ('151', '4');
INSERT INTO `Entidade_Escalao` VALUES ('152', '4');
INSERT INTO `Entidade_Escalao` VALUES ('153', '4');
INSERT INTO `Entidade_Escalao` VALUES ('154', '4');
INSERT INTO `Entidade_Escalao` VALUES ('155', '4');
INSERT INTO `Entidade_Escalao` VALUES ('156', '4');
INSERT INTO `Entidade_Escalao` VALUES ('157', '4');
INSERT INTO `Entidade_Escalao` VALUES ('158', '4');
INSERT INTO `Entidade_Escalao` VALUES ('159', '4');
INSERT INTO `Entidade_Escalao` VALUES ('160', '4');
INSERT INTO `Entidade_Escalao` VALUES ('161', '3');
INSERT INTO `Entidade_Escalao` VALUES ('162', '3');
INSERT INTO `Entidade_Escalao` VALUES ('163', '3');
INSERT INTO `Entidade_Escalao` VALUES ('164', '3');
INSERT INTO `Entidade_Escalao` VALUES ('165', '3');
INSERT INTO `Entidade_Escalao` VALUES ('166', '3');
INSERT INTO `Entidade_Escalao` VALUES ('167', '3');
INSERT INTO `Entidade_Escalao` VALUES ('168', '3');
INSERT INTO `Entidade_Escalao` VALUES ('169', '3');
INSERT INTO `Entidade_Escalao` VALUES ('170', '3');
INSERT INTO `Entidade_Escalao` VALUES ('171', '3');
INSERT INTO `Entidade_Escalao` VALUES ('172', '3');
INSERT INTO `Entidade_Escalao` VALUES ('173', '3');
INSERT INTO `Entidade_Escalao` VALUES ('174', '3');
INSERT INTO `Entidade_Escalao` VALUES ('175', '3');
INSERT INTO `Entidade_Escalao` VALUES ('176', '3');
INSERT INTO `Entidade_Escalao` VALUES ('177', '3');
INSERT INTO `Entidade_Escalao` VALUES ('178', '3');
INSERT INTO `Entidade_Escalao` VALUES ('179', '3');
INSERT INTO `Entidade_Escalao` VALUES ('180', '3');
INSERT INTO `Entidade_Escalao` VALUES ('181', '3');
INSERT INTO `Entidade_Escalao` VALUES ('182', '2');
INSERT INTO `Entidade_Escalao` VALUES ('183', '2');
INSERT INTO `Entidade_Escalao` VALUES ('184', '2');
INSERT INTO `Entidade_Escalao` VALUES ('185', '2');
INSERT INTO `Entidade_Escalao` VALUES ('186', '2');
INSERT INTO `Entidade_Escalao` VALUES ('187', '2');
INSERT INTO `Entidade_Escalao` VALUES ('188', '2');
INSERT INTO `Entidade_Escalao` VALUES ('189', '2');
INSERT INTO `Entidade_Escalao` VALUES ('190', '2');
INSERT INTO `Entidade_Escalao` VALUES ('191', '2');
INSERT INTO `Entidade_Escalao` VALUES ('192', '2');
INSERT INTO `Entidade_Escalao` VALUES ('193', '2');
INSERT INTO `Entidade_Escalao` VALUES ('194', '2');
INSERT INTO `Entidade_Escalao` VALUES ('195', '2');
INSERT INTO `Entidade_Escalao` VALUES ('196', '1');
INSERT INTO `Entidade_Escalao` VALUES ('197', '1');
INSERT INTO `Entidade_Escalao` VALUES ('198', '1');
INSERT INTO `Entidade_Escalao` VALUES ('199', '1');
INSERT INTO `Entidade_Escalao` VALUES ('200', '1');
INSERT INTO `Entidade_Escalao` VALUES ('201', '1');
INSERT INTO `Entidade_Escalao` VALUES ('202', '1');
INSERT INTO `Entidade_Escalao` VALUES ('203', '1');
INSERT INTO `Entidade_Escalao` VALUES ('204', '1');
INSERT INTO `Entidade_Escalao` VALUES ('205', '1');
INSERT INTO `Entidade_Escalao` VALUES ('206', '1');
INSERT INTO `Entidade_Escalao` VALUES ('207', '1');
INSERT INTO `Entidade_Escalao` VALUES ('208', '1');
INSERT INTO `Entidade_Escalao` VALUES ('209', '1');
INSERT INTO `Entidade_Escalao` VALUES ('210', '1');
INSERT INTO `Entidade_Escalao` VALUES ('211', '1');
INSERT INTO `Entidade_Escalao` VALUES ('212', '1');
INSERT INTO `Entidade_Escalao` VALUES ('213', '1');
INSERT INTO `Entidade_Escalao` VALUES ('214', '11');
INSERT INTO `Entidade_Escalao` VALUES ('215', '11');
INSERT INTO `Entidade_Escalao` VALUES ('216', '11');
INSERT INTO `Entidade_Escalao` VALUES ('217', '11');
INSERT INTO `Entidade_Escalao` VALUES ('218', '11');
INSERT INTO `Entidade_Escalao` VALUES ('219', '11');
INSERT INTO `Entidade_Escalao` VALUES ('220', '11');
INSERT INTO `Entidade_Escalao` VALUES ('221', '11');
INSERT INTO `Entidade_Escalao` VALUES ('222', '11');
INSERT INTO `Entidade_Escalao` VALUES ('223', '11');
INSERT INTO `Entidade_Escalao` VALUES ('224', '11');
INSERT INTO `Entidade_Escalao` VALUES ('225', '11');
INSERT INTO `Entidade_Escalao` VALUES ('226', '11');
INSERT INTO `Entidade_Escalao` VALUES ('227', '11');
INSERT INTO `Entidade_Escalao` VALUES ('228', '10');
INSERT INTO `Entidade_Escalao` VALUES ('229', '10');
INSERT INTO `Entidade_Escalao` VALUES ('230', '10');
INSERT INTO `Entidade_Escalao` VALUES ('231', '10');
INSERT INTO `Entidade_Escalao` VALUES ('232', '10');
INSERT INTO `Entidade_Escalao` VALUES ('233', '10');
INSERT INTO `Entidade_Escalao` VALUES ('234', '10');
INSERT INTO `Entidade_Escalao` VALUES ('235', '10');
INSERT INTO `Entidade_Escalao` VALUES ('236', '10');
INSERT INTO `Entidade_Escalao` VALUES ('237', '10');
INSERT INTO `Entidade_Escalao` VALUES ('238', '10');
INSERT INTO `Entidade_Escalao` VALUES ('239', '10');
INSERT INTO `Entidade_Escalao` VALUES ('240', '10');
INSERT INTO `Entidade_Escalao` VALUES ('241', '10');
INSERT INTO `Entidade_Escalao` VALUES ('242', '10');
INSERT INTO `Entidade_Escalao` VALUES ('243', '10');
INSERT INTO `Entidade_Escalao` VALUES ('244', '10');
INSERT INTO `Entidade_Escalao` VALUES ('245', '10');

-- ----------------------------
-- Table structure for Entidade_Modalidade
-- ----------------------------
DROP TABLE IF EXISTS `Entidade_Modalidade`;
CREATE TABLE `Entidade_Modalidade` (
  `ID_Entidade` int(11) NOT NULL,
  `ID_Modalidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Entidade`,`ID_Modalidade`),
  KEY `IDX_5375DF738345E416` (`ID_Entidade`),
  KEY `IDX_5375DF7356BD73F3` (`ID_Modalidade`),
  CONSTRAINT `FK_5375DF7356BD73F3` FOREIGN KEY (`ID_Modalidade`) REFERENCES `Modalidade` (`ID_Modalidade`),
  CONSTRAINT `FK_5375DF738345E416` FOREIGN KEY (`ID_Entidade`) REFERENCES `Entidade` (`ID_Entidade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Entidade_Modalidade
-- ----------------------------
INSERT INTO `Entidade_Modalidade` VALUES ('1', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('2', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('3', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('4', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('5', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('9', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('10', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('11', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('12', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('13', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('14', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('15', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('16', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('17', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('18', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('19', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('20', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('21', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('22', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('23', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('24', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('25', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('26', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('27', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('28', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('29', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('30', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('31', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('32', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('34', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('35', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('36', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('37', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('38', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('39', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('40', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('41', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('42', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('43', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('44', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('45', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('46', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('47', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('48', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('49', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('50', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('51', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('52', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('53', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('54', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('55', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('56', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('57', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('58', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('59', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('60', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('61', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('62', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('63', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('64', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('65', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('66', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('67', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('68', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('69', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('70', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('71', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('72', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('73', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('74', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('75', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('76', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('77', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('78', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('79', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('80', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('81', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('82', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('83', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('84', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('85', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('86', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('87', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('88', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('89', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('90', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('91', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('92', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('93', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('94', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('95', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('96', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('97', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('98', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('99', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('100', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('101', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('102', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('103', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('104', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('105', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('106', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('107', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('108', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('109', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('110', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('111', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('112', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('113', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('114', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('115', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('116', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('117', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('118', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('119', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('120', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('121', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('122', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('123', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('124', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('125', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('126', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('127', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('128', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('129', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('130', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('131', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('132', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('133', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('134', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('135', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('136', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('137', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('138', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('139', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('140', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('141', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('142', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('143', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('144', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('145', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('146', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('147', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('148', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('149', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('150', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('151', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('152', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('153', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('154', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('155', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('156', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('157', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('158', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('159', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('160', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('161', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('162', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('163', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('164', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('165', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('166', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('167', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('168', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('169', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('170', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('171', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('172', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('173', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('174', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('175', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('176', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('177', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('178', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('179', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('180', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('181', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('182', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('183', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('184', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('185', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('186', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('187', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('188', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('189', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('190', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('191', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('192', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('193', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('194', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('195', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('196', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('197', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('198', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('199', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('200', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('201', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('202', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('203', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('204', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('205', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('206', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('207', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('208', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('209', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('210', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('211', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('212', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('213', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('214', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('215', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('216', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('217', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('219', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('220', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('221', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('222', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('223', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('224', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('225', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('226', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('227', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('228', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('229', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('230', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('231', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('232', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('233', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('234', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('235', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('236', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('237', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('238', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('239', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('240', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('241', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('242', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('243', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('244', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('245', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('978', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('980', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('984', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1259', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1262', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1265', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1268', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1271', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1274', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1276', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1279', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1282', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1285', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1288', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1291', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1294', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1297', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1300', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1303', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1306', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1309', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1312', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1315', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1319', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1322', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1325', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1330', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1331', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1332', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1333', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1334', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1335', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1336', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1339', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1342', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1345', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1348', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1351', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1352', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1353', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1354', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1355', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1356', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1358', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1359', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1360', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1361', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1362', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1363', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1365', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1368', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1371', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1374', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1377', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1380', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1383', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1386', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1389', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1393', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1396', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1399', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1402', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1405', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1408', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1411', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1414', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1417', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1420', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1423', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1426', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1429', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1432', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1435', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1438', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1441', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1444', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1447', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1450', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1453', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1456', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1459', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1462', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1465', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1468', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1471', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1474', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1477', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1478', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1479', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1480', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1481', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1483', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1495', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1498', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1501', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1504', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1507', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1510', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1513', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1514', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1515', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1516', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1517', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1518', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1519', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1522', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1525', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1528', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1531', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1533', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1534', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1535', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1536', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1537', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1538', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1539', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1540', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1541', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1542', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1543', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1544', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1545', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1546', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1547', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1548', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1549', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1550', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1552', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1553', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1554', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1555', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1556', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1557', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1558', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1561', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1564', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1567', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1570', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1571', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1574', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1577', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1580', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1583', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1586', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1588', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1591', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1594', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1597', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1600', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1603', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1606', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1609', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1612', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1615', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1618', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1621', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1624', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1627', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1630', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1633', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1636', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1639', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1641', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1644', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1647', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1649', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1651', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1654', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1656', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1659', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1662', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1665', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1668', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1671', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1674', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1677', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1682', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1685', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1688', '1');
INSERT INTO `Entidade_Modalidade` VALUES ('1691', '1');

-- ----------------------------
-- Table structure for EntidadeREL
-- ----------------------------
DROP TABLE IF EXISTS `EntidadeREL`;
CREATE TABLE `EntidadeREL` (
  `ID_EntidadeRel` int(11) NOT NULL AUTO_INCREMENT,
  `ID_Entidade` int(11) DEFAULT NULL,
  `ID_EntidadeAssoc` int(11) DEFAULT NULL,
  `ID_EntidadeAssocTipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_EntidadeRel`),
  KEY `IDX_201A375B8345E416` (`ID_Entidade`),
  KEY `IDX_201A375B6A1028FB` (`ID_EntidadeAssoc`),
  KEY `IDX_201A375B5083AE90` (`ID_EntidadeAssocTipo`),
  CONSTRAINT `FK_201A375B5083AE90` FOREIGN KEY (`ID_EntidadeAssocTipo`) REFERENCES `TipoREL` (`ID_tiporel`),
  CONSTRAINT `FK_201A375B6A1028FB` FOREIGN KEY (`ID_EntidadeAssoc`) REFERENCES `Entidade` (`ID_Entidade`) ON DELETE CASCADE,
  CONSTRAINT `FK_201A375B8345E416` FOREIGN KEY (`ID_Entidade`) REFERENCES `Entidade` (`ID_Entidade`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1400 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of EntidadeREL
-- ----------------------------
INSERT INTO `EntidadeREL` VALUES ('2', '141', '641', '2');
INSERT INTO `EntidadeREL` VALUES ('4', '149', '642', '2');
INSERT INTO `EntidadeREL` VALUES ('9', '187', '646', '1');
INSERT INTO `EntidadeREL` VALUES ('10', '188', '647', '2');
INSERT INTO `EntidadeREL` VALUES ('11', '186', '648', '2');
INSERT INTO `EntidadeREL` VALUES ('12', '185', '713', '2');
INSERT INTO `EntidadeREL` VALUES ('13', '189', '714', '1');
INSERT INTO `EntidadeREL` VALUES ('14', '192', '715', '1');
INSERT INTO `EntidadeREL` VALUES ('15', '194', '716', '1');
INSERT INTO `EntidadeREL` VALUES ('16', '195', '717', '1');
INSERT INTO `EntidadeREL` VALUES ('17', '193', '718', '1');
INSERT INTO `EntidadeREL` VALUES ('18', '191', '719', '1');
INSERT INTO `EntidadeREL` VALUES ('19', '183', '720', '2');
INSERT INTO `EntidadeREL` VALUES ('20', '184', '721', '2');
INSERT INTO `EntidadeREL` VALUES ('21', '190', '722', '1');
INSERT INTO `EntidadeREL` VALUES ('22', '161', '723', '2');
INSERT INTO `EntidadeREL` VALUES ('23', '166', '724', '1');
INSERT INTO `EntidadeREL` VALUES ('24', '162', '725', '2');
INSERT INTO `EntidadeREL` VALUES ('25', '176', '726', '1');
INSERT INTO `EntidadeREL` VALUES ('26', '163', '727', '1');
INSERT INTO `EntidadeREL` VALUES ('27', '177', '728', '1');
INSERT INTO `EntidadeREL` VALUES ('28', '164', '729', '1');
INSERT INTO `EntidadeREL` VALUES ('29', '178', '730', '2');
INSERT INTO `EntidadeREL` VALUES ('30', '169', '731', '2');
INSERT INTO `EntidadeREL` VALUES ('31', '171', '732', '1');
INSERT INTO `EntidadeREL` VALUES ('32', '174', '733', '1');
INSERT INTO `EntidadeREL` VALUES ('33', '167', '734', '1');
INSERT INTO `EntidadeREL` VALUES ('34', '181', '735', '1');
INSERT INTO `EntidadeREL` VALUES ('35', '172', '736', '2');
INSERT INTO `EntidadeREL` VALUES ('36', '170', '737', '1');
INSERT INTO `EntidadeREL` VALUES ('37', '179', '738', '1');
INSERT INTO `EntidadeREL` VALUES ('38', '173', '739', '1');
INSERT INTO `EntidadeREL` VALUES ('39', '180', '740', '1');
INSERT INTO `EntidadeREL` VALUES ('40', '165', '741', '1');
INSERT INTO `EntidadeREL` VALUES ('41', '175', '742', '1');
INSERT INTO `EntidadeREL` VALUES ('42', '168', '743', '1');
INSERT INTO `EntidadeREL` VALUES ('43', '150', '744', '2');
INSERT INTO `EntidadeREL` VALUES ('44', '158', '745', '1');
INSERT INTO `EntidadeREL` VALUES ('45', '148', '746', '2');
INSERT INTO `EntidadeREL` VALUES ('46', '137', '747', '1');
INSERT INTO `EntidadeREL` VALUES ('47', '157', '748', '2');
INSERT INTO `EntidadeREL` VALUES ('48', '153', '749', '2');
INSERT INTO `EntidadeREL` VALUES ('49', '144', '750', '1');
INSERT INTO `EntidadeREL` VALUES ('50', '136', '751', '1');
INSERT INTO `EntidadeREL` VALUES ('51', '156', '752', '1');
INSERT INTO `EntidadeREL` VALUES ('52', '151', '753', '1');
INSERT INTO `EntidadeREL` VALUES ('53', '159', '754', '2');
INSERT INTO `EntidadeREL` VALUES ('54', '145', '755', '1');
INSERT INTO `EntidadeREL` VALUES ('55', '155', '756', '2');
INSERT INTO `EntidadeREL` VALUES ('56', '147', '757', '1');
INSERT INTO `EntidadeREL` VALUES ('57', '154', '758', '1');
INSERT INTO `EntidadeREL` VALUES ('58', '140', '759', '1');
INSERT INTO `EntidadeREL` VALUES ('59', '143', '760', '1');
INSERT INTO `EntidadeREL` VALUES ('60', '142', '761', '2');
INSERT INTO `EntidadeREL` VALUES ('61', '146', '762', '1');
INSERT INTO `EntidadeREL` VALUES ('62', '160', '763', '2');
INSERT INTO `EntidadeREL` VALUES ('63', '139', '764', '2');
INSERT INTO `EntidadeREL` VALUES ('64', '112', '765', '1');
INSERT INTO `EntidadeREL` VALUES ('65', '99', '766', '1');
INSERT INTO `EntidadeREL` VALUES ('66', '100', '767', '1');
INSERT INTO `EntidadeREL` VALUES ('67', '102', '768', '1');
INSERT INTO `EntidadeREL` VALUES ('68', '105', '769', '2');
INSERT INTO `EntidadeREL` VALUES ('69', '114', '770', '1');
INSERT INTO `EntidadeREL` VALUES ('70', '106', '771', '2');
INSERT INTO `EntidadeREL` VALUES ('71', '107', '772', '2');
INSERT INTO `EntidadeREL` VALUES ('72', '98', '773', '1');
INSERT INTO `EntidadeREL` VALUES ('73', '113', '774', '2');
INSERT INTO `EntidadeREL` VALUES ('74', '101', '775', '1');
INSERT INTO `EntidadeREL` VALUES ('75', '109', '776', '1');
INSERT INTO `EntidadeREL` VALUES ('76', '97', '777', '1');
INSERT INTO `EntidadeREL` VALUES ('77', '108', '778', '2');
INSERT INTO `EntidadeREL` VALUES ('78', '111', '779', '2');
INSERT INTO `EntidadeREL` VALUES ('79', '110', '780', '1');
INSERT INTO `EntidadeREL` VALUES ('80', '104', '781', '1');
INSERT INTO `EntidadeREL` VALUES ('81', '96', '782', '1');
INSERT INTO `EntidadeREL` VALUES ('82', '134', '783', '2');
INSERT INTO `EntidadeREL` VALUES ('83', '130', '784', '1');
INSERT INTO `EntidadeREL` VALUES ('84', '135', '785', '1');
INSERT INTO `EntidadeREL` VALUES ('85', '121', '786', '1');
INSERT INTO `EntidadeREL` VALUES ('86', '116', '787', '1');
INSERT INTO `EntidadeREL` VALUES ('87', '123', '788', '1');
INSERT INTO `EntidadeREL` VALUES ('88', '115', '789', '2');
INSERT INTO `EntidadeREL` VALUES ('89', '127', '790', '1');
INSERT INTO `EntidadeREL` VALUES ('90', '119', '791', '1');
INSERT INTO `EntidadeREL` VALUES ('91', '118', '792', '1');
INSERT INTO `EntidadeREL` VALUES ('92', '122', '793', '1');
INSERT INTO `EntidadeREL` VALUES ('93', '120', '794', '1');
INSERT INTO `EntidadeREL` VALUES ('94', '124', '795', '1');
INSERT INTO `EntidadeREL` VALUES ('95', '131', '796', '1');
INSERT INTO `EntidadeREL` VALUES ('97', '47', '798', '1');
INSERT INTO `EntidadeREL` VALUES ('98', '48', '799', '1');
INSERT INTO `EntidadeREL` VALUES ('99', '49', '800', '2');
INSERT INTO `EntidadeREL` VALUES ('106', '42', '807', '1');
INSERT INTO `EntidadeREL` VALUES ('107', '39', '808', '1');
INSERT INTO `EntidadeREL` VALUES ('108', '36', '809', '1');
INSERT INTO `EntidadeREL` VALUES ('109', '37', '810', '2');
INSERT INTO `EntidadeREL` VALUES ('110', '38', '811', '2');
INSERT INTO `EntidadeREL` VALUES ('111', '35', '812', '2');
INSERT INTO `EntidadeREL` VALUES ('112', '34', '813', '9');
INSERT INTO `EntidadeREL` VALUES ('113', '45', '814', '2');
INSERT INTO `EntidadeREL` VALUES ('114', '44', '815', '1');
INSERT INTO `EntidadeREL` VALUES ('115', '213', '816', '2');
INSERT INTO `EntidadeREL` VALUES ('116', '202', '817', '2');
INSERT INTO `EntidadeREL` VALUES ('117', '203', '818', '1');
INSERT INTO `EntidadeREL` VALUES ('118', '196', '819', '1');
INSERT INTO `EntidadeREL` VALUES ('119', '197', '820', '1');
INSERT INTO `EntidadeREL` VALUES ('120', '210', '821', '1');
INSERT INTO `EntidadeREL` VALUES ('121', '198', '822', '2');
INSERT INTO `EntidadeREL` VALUES ('122', '204', '823', '2');
INSERT INTO `EntidadeREL` VALUES ('123', '201', '824', '2');
INSERT INTO `EntidadeREL` VALUES ('124', '212', '825', '2');
INSERT INTO `EntidadeREL` VALUES ('125', '211', '826', '1');
INSERT INTO `EntidadeREL` VALUES ('126', '199', '827', '1');
INSERT INTO `EntidadeREL` VALUES ('127', '206', '828', '2');
INSERT INTO `EntidadeREL` VALUES ('128', '207', '829', '1');
INSERT INTO `EntidadeREL` VALUES ('129', '205', '830', '1');
INSERT INTO `EntidadeREL` VALUES ('130', '209', '831', '1');
INSERT INTO `EntidadeREL` VALUES ('131', '200', '832', '1');
INSERT INTO `EntidadeREL` VALUES ('134', '65', '836', '1');
INSERT INTO `EntidadeREL` VALUES ('135', '87', '837', '1');
INSERT INTO `EntidadeREL` VALUES ('136', '91', '838', '2');
INSERT INTO `EntidadeREL` VALUES ('137', '55', '839', '2');
INSERT INTO `EntidadeREL` VALUES ('138', '72', '840', '2');
INSERT INTO `EntidadeREL` VALUES ('139', '56', '949', '2');
INSERT INTO `EntidadeREL` VALUES ('140', '82', '950', '1');
INSERT INTO `EntidadeREL` VALUES ('141', '67', '951', '2');
INSERT INTO `EntidadeREL` VALUES ('142', '57', '952', '1');
INSERT INTO `EntidadeREL` VALUES ('143', '63', '953', '2');
INSERT INTO `EntidadeREL` VALUES ('144', '71', '954', '1');
INSERT INTO `EntidadeREL` VALUES ('145', '78', '955', '2');
INSERT INTO `EntidadeREL` VALUES ('146', '86', '956', '1');
INSERT INTO `EntidadeREL` VALUES ('147', '79', '957', '2');
INSERT INTO `EntidadeREL` VALUES ('148', '79', '958', '2');
INSERT INTO `EntidadeREL` VALUES ('149', '81', '959', '2');
INSERT INTO `EntidadeREL` VALUES ('150', '64', '960', '2');
INSERT INTO `EntidadeREL` VALUES ('151', '80', '961', '1');
INSERT INTO `EntidadeREL` VALUES ('152', '85', '962', '1');
INSERT INTO `EntidadeREL` VALUES ('153', '93', '963', '2');
INSERT INTO `EntidadeREL` VALUES ('154', '62', '964', '1');
INSERT INTO `EntidadeREL` VALUES ('155', '59', '965', '1');
INSERT INTO `EntidadeREL` VALUES ('156', '60', '966', '2');
INSERT INTO `EntidadeREL` VALUES ('158', '83', '968', '1');
INSERT INTO `EntidadeREL` VALUES ('159', '61', '969', '2');
INSERT INTO `EntidadeREL` VALUES ('160', '90', '970', '1');
INSERT INTO `EntidadeREL` VALUES ('161', '73', '971', '1');
INSERT INTO `EntidadeREL` VALUES ('162', '52', '972', '1');
INSERT INTO `EntidadeREL` VALUES ('163', '92', '973', '1');
INSERT INTO `EntidadeREL` VALUES ('164', '68', '974', '2');
INSERT INTO `EntidadeREL` VALUES ('165', '51', '975', '1');
INSERT INTO `EntidadeREL` VALUES ('168', '978', '979', '1');
INSERT INTO `EntidadeREL` VALUES ('169', '980', '981', '7');
INSERT INTO `EntidadeREL` VALUES ('172', '50', '986', '2');
INSERT INTO `EntidadeREL` VALUES ('173', '53', '987', '2');
INSERT INTO `EntidadeREL` VALUES ('174', '54', '988', '2');
INSERT INTO `EntidadeREL` VALUES ('175', '58', '989', '2');
INSERT INTO `EntidadeREL` VALUES ('176', '69', '990', '1');
INSERT INTO `EntidadeREL` VALUES ('177', '74', '991', '2');
INSERT INTO `EntidadeREL` VALUES ('178', '1', '992', '1');
INSERT INTO `EntidadeREL` VALUES ('179', '1', '993', '2');
INSERT INTO `EntidadeREL` VALUES ('180', '141', '976', '1');
INSERT INTO `EntidadeREL` VALUES ('181', '136', '994', '2');
INSERT INTO `EntidadeREL` VALUES ('182', '137', '995', '2');
INSERT INTO `EntidadeREL` VALUES ('183', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('184', '140', '997', '2');
INSERT INTO `EntidadeREL` VALUES ('185', '142', '998', '1');
INSERT INTO `EntidadeREL` VALUES ('186', '143', '999', '2');
INSERT INTO `EntidadeREL` VALUES ('187', '144', '1000', '2');
INSERT INTO `EntidadeREL` VALUES ('188', '148', '1001', '1');
INSERT INTO `EntidadeREL` VALUES ('189', '145', '1002', '2');
INSERT INTO `EntidadeREL` VALUES ('190', '146', '1003', '2');
INSERT INTO `EntidadeREL` VALUES ('191', '147', '1004', '2');
INSERT INTO `EntidadeREL` VALUES ('192', '149', '1005', '1');
INSERT INTO `EntidadeREL` VALUES ('193', '150', '1006', '1');
INSERT INTO `EntidadeREL` VALUES ('194', '151', '1007', '2');
INSERT INTO `EntidadeREL` VALUES ('195', '153', '1008', '1');
INSERT INTO `EntidadeREL` VALUES ('196', '154', '1009', '2');
INSERT INTO `EntidadeREL` VALUES ('197', '155', '1010', '1');
INSERT INTO `EntidadeREL` VALUES ('198', '156', '1011', '2');
INSERT INTO `EntidadeREL` VALUES ('199', '157', '1012', '1');
INSERT INTO `EntidadeREL` VALUES ('200', '158', '1013', '2');
INSERT INTO `EntidadeREL` VALUES ('201', '159', '1014', '1');
INSERT INTO `EntidadeREL` VALUES ('202', '160', '1015', '1');
INSERT INTO `EntidadeREL` VALUES ('203', '223', '1016', '1');
INSERT INTO `EntidadeREL` VALUES ('204', '223', '1017', '2');
INSERT INTO `EntidadeREL` VALUES ('205', '224', '1018', '1');
INSERT INTO `EntidadeREL` VALUES ('206', '224', '1019', '2');
INSERT INTO `EntidadeREL` VALUES ('207', '225', '1020', '1');
INSERT INTO `EntidadeREL` VALUES ('208', '225', '1021', '2');
INSERT INTO `EntidadeREL` VALUES ('209', '226', '1022', '1');
INSERT INTO `EntidadeREL` VALUES ('210', '226', '1023', '2');
INSERT INTO `EntidadeREL` VALUES ('211', '227', '1024', '1');
INSERT INTO `EntidadeREL` VALUES ('212', '227', '1025', '2');
INSERT INTO `EntidadeREL` VALUES ('213', '214', '1026', '1');
INSERT INTO `EntidadeREL` VALUES ('214', '214', '1027', '2');
INSERT INTO `EntidadeREL` VALUES ('215', '215', '1028', '1');
INSERT INTO `EntidadeREL` VALUES ('216', '215', '1029', '2');
INSERT INTO `EntidadeREL` VALUES ('217', '216', '1030', '1');
INSERT INTO `EntidadeREL` VALUES ('218', '216', '1031', '2');
INSERT INTO `EntidadeREL` VALUES ('219', '217', '1032', '1');
INSERT INTO `EntidadeREL` VALUES ('220', '217', '1033', '2');
INSERT INTO `EntidadeREL` VALUES ('223', '219', '1036', '1');
INSERT INTO `EntidadeREL` VALUES ('224', '219', '1037', '2');
INSERT INTO `EntidadeREL` VALUES ('225', '220', '1038', '1');
INSERT INTO `EntidadeREL` VALUES ('226', '220', '1039', '2');
INSERT INTO `EntidadeREL` VALUES ('227', '221', '1040', '1');
INSERT INTO `EntidadeREL` VALUES ('228', '221', '1041', '2');
INSERT INTO `EntidadeREL` VALUES ('229', '222', '1042', '1');
INSERT INTO `EntidadeREL` VALUES ('230', '222', '1043', '2');
INSERT INTO `EntidadeREL` VALUES ('231', '196', '1044', '2');
INSERT INTO `EntidadeREL` VALUES ('232', '197', '1045', '2');
INSERT INTO `EntidadeREL` VALUES ('233', '198', '1046', '2');
INSERT INTO `EntidadeREL` VALUES ('234', '199', '1047', '2');
INSERT INTO `EntidadeREL` VALUES ('235', '200', '1048', '2');
INSERT INTO `EntidadeREL` VALUES ('236', '201', '1049', '2');
INSERT INTO `EntidadeREL` VALUES ('237', '202', '1050', '2');
INSERT INTO `EntidadeREL` VALUES ('238', '203', '1051', '2');
INSERT INTO `EntidadeREL` VALUES ('239', '204', '1052', '2');
INSERT INTO `EntidadeREL` VALUES ('240', '205', '1053', '2');
INSERT INTO `EntidadeREL` VALUES ('241', '206', '1054', '1');
INSERT INTO `EntidadeREL` VALUES ('242', '207', '1055', '2');
INSERT INTO `EntidadeREL` VALUES ('243', '208', '1056', '1');
INSERT INTO `EntidadeREL` VALUES ('244', '208', '1057', '2');
INSERT INTO `EntidadeREL` VALUES ('245', '209', '1058', '2');
INSERT INTO `EntidadeREL` VALUES ('246', '210', '1059', '2');
INSERT INTO `EntidadeREL` VALUES ('247', '211', '1060', '2');
INSERT INTO `EntidadeREL` VALUES ('248', '212', '1061', '1');
INSERT INTO `EntidadeREL` VALUES ('249', '213', '1062', '1');
INSERT INTO `EntidadeREL` VALUES ('250', '182', '1063', '1');
INSERT INTO `EntidadeREL` VALUES ('251', '182', '1064', '2');
INSERT INTO `EntidadeREL` VALUES ('252', '183', '1065', '1');
INSERT INTO `EntidadeREL` VALUES ('253', '184', '1066', '1');
INSERT INTO `EntidadeREL` VALUES ('254', '185', '1067', '1');
INSERT INTO `EntidadeREL` VALUES ('255', '186', '1068', '1');
INSERT INTO `EntidadeREL` VALUES ('256', '187', '1069', '2');
INSERT INTO `EntidadeREL` VALUES ('257', '188', '1070', '1');
INSERT INTO `EntidadeREL` VALUES ('258', '189', '1071', '2');
INSERT INTO `EntidadeREL` VALUES ('259', '190', '1072', '2');
INSERT INTO `EntidadeREL` VALUES ('260', '191', '1073', '2');
INSERT INTO `EntidadeREL` VALUES ('261', '192', '1074', '2');
INSERT INTO `EntidadeREL` VALUES ('262', '193', '1075', '2');
INSERT INTO `EntidadeREL` VALUES ('263', '194', '1076', '2');
INSERT INTO `EntidadeREL` VALUES ('264', '195', '1077', '2');
INSERT INTO `EntidadeREL` VALUES ('265', '161', '1078', '1');
INSERT INTO `EntidadeREL` VALUES ('266', '162', '1079', '1');
INSERT INTO `EntidadeREL` VALUES ('267', '163', '1080', '2');
INSERT INTO `EntidadeREL` VALUES ('268', '164', '1081', '2');
INSERT INTO `EntidadeREL` VALUES ('269', '165', '1082', '2');
INSERT INTO `EntidadeREL` VALUES ('270', '166', '1083', '2');
INSERT INTO `EntidadeREL` VALUES ('271', '167', '1084', '2');
INSERT INTO `EntidadeREL` VALUES ('272', '168', '1085', '2');
INSERT INTO `EntidadeREL` VALUES ('273', '169', '1086', '1');
INSERT INTO `EntidadeREL` VALUES ('274', '170', '1087', '2');
INSERT INTO `EntidadeREL` VALUES ('275', '171', '1088', '2');
INSERT INTO `EntidadeREL` VALUES ('276', '172', '1089', '1');
INSERT INTO `EntidadeREL` VALUES ('277', '173', '1090', '2');
INSERT INTO `EntidadeREL` VALUES ('278', '174', '1091', '2');
INSERT INTO `EntidadeREL` VALUES ('279', '175', '1092', '2');
INSERT INTO `EntidadeREL` VALUES ('280', '176', '1093', '2');
INSERT INTO `EntidadeREL` VALUES ('281', '177', '1094', '2');
INSERT INTO `EntidadeREL` VALUES ('282', '178', '1095', '1');
INSERT INTO `EntidadeREL` VALUES ('283', '179', '1096', '2');
INSERT INTO `EntidadeREL` VALUES ('284', '180', '1097', '2');
INSERT INTO `EntidadeREL` VALUES ('285', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('286', '138', '1099', '1');
INSERT INTO `EntidadeREL` VALUES ('287', '152', '1100', '1');
INSERT INTO `EntidadeREL` VALUES ('288', '115', '1101', '1');
INSERT INTO `EntidadeREL` VALUES ('289', '116', '1102', '2');
INSERT INTO `EntidadeREL` VALUES ('290', '117', '1103', '1');
INSERT INTO `EntidadeREL` VALUES ('291', '117', '1104', '2');
INSERT INTO `EntidadeREL` VALUES ('292', '117', '1105', '1');
INSERT INTO `EntidadeREL` VALUES ('293', '117', '1106', '2');
INSERT INTO `EntidadeREL` VALUES ('294', '118', '1107', '2');
INSERT INTO `EntidadeREL` VALUES ('295', '119', '1108', '2');
INSERT INTO `EntidadeREL` VALUES ('296', '120', '1109', '2');
INSERT INTO `EntidadeREL` VALUES ('297', '121', '1110', '2');
INSERT INTO `EntidadeREL` VALUES ('298', '122', '1111', '2');
INSERT INTO `EntidadeREL` VALUES ('299', '123', '1112', '2');
INSERT INTO `EntidadeREL` VALUES ('300', '124', '1113', '2');
INSERT INTO `EntidadeREL` VALUES ('301', '125', '1114', '1');
INSERT INTO `EntidadeREL` VALUES ('302', '125', '1115', '2');
INSERT INTO `EntidadeREL` VALUES ('303', '126', '1116', '1');
INSERT INTO `EntidadeREL` VALUES ('304', '126', '1117', '2');
INSERT INTO `EntidadeREL` VALUES ('305', '127', '1118', '2');
INSERT INTO `EntidadeREL` VALUES ('306', '128', '1119', '1');
INSERT INTO `EntidadeREL` VALUES ('307', '128', '1120', '2');
INSERT INTO `EntidadeREL` VALUES ('308', '129', '1121', '1');
INSERT INTO `EntidadeREL` VALUES ('309', '129', '1122', '2');
INSERT INTO `EntidadeREL` VALUES ('310', '130', '1123', '2');
INSERT INTO `EntidadeREL` VALUES ('311', '131', '1124', '2');
INSERT INTO `EntidadeREL` VALUES ('312', '132', '1125', '1');
INSERT INTO `EntidadeREL` VALUES ('313', '132', '1126', '2');
INSERT INTO `EntidadeREL` VALUES ('314', '133', '1127', '1');
INSERT INTO `EntidadeREL` VALUES ('315', '133', '1128', '2');
INSERT INTO `EntidadeREL` VALUES ('316', '134', '1129', '1');
INSERT INTO `EntidadeREL` VALUES ('317', '135', '1130', '2');
INSERT INTO `EntidadeREL` VALUES ('318', '75', '1131', '1');
INSERT INTO `EntidadeREL` VALUES ('319', '75', '1132', '2');
INSERT INTO `EntidadeREL` VALUES ('320', '76', '1133', '1');
INSERT INTO `EntidadeREL` VALUES ('321', '76', '1134', '2');
INSERT INTO `EntidadeREL` VALUES ('322', '77', '1135', '1');
INSERT INTO `EntidadeREL` VALUES ('323', '77', '1136', '2');
INSERT INTO `EntidadeREL` VALUES ('324', '78', '1137', '1');
INSERT INTO `EntidadeREL` VALUES ('325', '80', '1138', '2');
INSERT INTO `EntidadeREL` VALUES ('326', '81', '1139', '1');
INSERT INTO `EntidadeREL` VALUES ('327', '82', '1140', '2');
INSERT INTO `EntidadeREL` VALUES ('328', '83', '1141', '2');
INSERT INTO `EntidadeREL` VALUES ('329', '84', '1142', '1');
INSERT INTO `EntidadeREL` VALUES ('330', '84', '1143', '2');
INSERT INTO `EntidadeREL` VALUES ('331', '85', '1144', '2');
INSERT INTO `EntidadeREL` VALUES ('332', '86', '1145', '2');
INSERT INTO `EntidadeREL` VALUES ('333', '87', '1146', '2');
INSERT INTO `EntidadeREL` VALUES ('334', '88', '1147', '1');
INSERT INTO `EntidadeREL` VALUES ('335', '88', '1148', '2');
INSERT INTO `EntidadeREL` VALUES ('336', '89', '1149', '1');
INSERT INTO `EntidadeREL` VALUES ('337', '89', '1150', '2');
INSERT INTO `EntidadeREL` VALUES ('338', '90', '1151', '2');
INSERT INTO `EntidadeREL` VALUES ('339', '91', '1152', '1');
INSERT INTO `EntidadeREL` VALUES ('340', '92', '1153', '2');
INSERT INTO `EntidadeREL` VALUES ('341', '93', '1154', '1');
INSERT INTO `EntidadeREL` VALUES ('342', '94', '1155', '1');
INSERT INTO `EntidadeREL` VALUES ('343', '94', '1156', '2');
INSERT INTO `EntidadeREL` VALUES ('344', '95', '1157', '1');
INSERT INTO `EntidadeREL` VALUES ('345', '95', '1158', '2');
INSERT INTO `EntidadeREL` VALUES ('346', '96', '1159', '2');
INSERT INTO `EntidadeREL` VALUES ('347', '97', '1160', '2');
INSERT INTO `EntidadeREL` VALUES ('348', '98', '1161', '2');
INSERT INTO `EntidadeREL` VALUES ('349', '99', '1162', '2');
INSERT INTO `EntidadeREL` VALUES ('350', '100', '1163', '2');
INSERT INTO `EntidadeREL` VALUES ('351', '101', '1164', '2');
INSERT INTO `EntidadeREL` VALUES ('352', '102', '1165', '2');
INSERT INTO `EntidadeREL` VALUES ('353', '103', '1166', '1');
INSERT INTO `EntidadeREL` VALUES ('354', '103', '1167', '2');
INSERT INTO `EntidadeREL` VALUES ('355', '104', '1168', '2');
INSERT INTO `EntidadeREL` VALUES ('356', '105', '1169', '1');
INSERT INTO `EntidadeREL` VALUES ('357', '106', '1170', '1');
INSERT INTO `EntidadeREL` VALUES ('358', '107', '1171', '1');
INSERT INTO `EntidadeREL` VALUES ('359', '108', '1172', '1');
INSERT INTO `EntidadeREL` VALUES ('360', '109', '1173', '2');
INSERT INTO `EntidadeREL` VALUES ('361', '110', '1174', '2');
INSERT INTO `EntidadeREL` VALUES ('362', '111', '1175', '1');
INSERT INTO `EntidadeREL` VALUES ('363', '112', '1176', '2');
INSERT INTO `EntidadeREL` VALUES ('364', '113', '1177', '1');
INSERT INTO `EntidadeREL` VALUES ('365', '114', '1178', '2');
INSERT INTO `EntidadeREL` VALUES ('366', '34', '1179', '9');
INSERT INTO `EntidadeREL` VALUES ('367', '35', '1180', '1');
INSERT INTO `EntidadeREL` VALUES ('368', '36', '1181', '2');
INSERT INTO `EntidadeREL` VALUES ('369', '37', '1182', '1');
INSERT INTO `EntidadeREL` VALUES ('370', '38', '1183', '1');
INSERT INTO `EntidadeREL` VALUES ('371', '39', '1184', '2');
INSERT INTO `EntidadeREL` VALUES ('372', '40', '1185', '1');
INSERT INTO `EntidadeREL` VALUES ('373', '40', '1186', '2');
INSERT INTO `EntidadeREL` VALUES ('374', '41', '1187', '1');
INSERT INTO `EntidadeREL` VALUES ('375', '41', '1188', '2');
INSERT INTO `EntidadeREL` VALUES ('376', '42', '1189', '2');
INSERT INTO `EntidadeREL` VALUES ('377', '43', '1190', '1');
INSERT INTO `EntidadeREL` VALUES ('378', '43', '1191', '2');
INSERT INTO `EntidadeREL` VALUES ('379', '44', '1192', '2');
INSERT INTO `EntidadeREL` VALUES ('380', '45', '1193', '1');
INSERT INTO `EntidadeREL` VALUES ('381', '46', '1194', '1');
INSERT INTO `EntidadeREL` VALUES ('382', '46', '1195', '2');
INSERT INTO `EntidadeREL` VALUES ('383', '47', '1196', '2');
INSERT INTO `EntidadeREL` VALUES ('384', '48', '1197', '2');
INSERT INTO `EntidadeREL` VALUES ('385', '49', '1198', '1');
INSERT INTO `EntidadeREL` VALUES ('386', '50', '1199', '1');
INSERT INTO `EntidadeREL` VALUES ('387', '51', '1200', '2');
INSERT INTO `EntidadeREL` VALUES ('388', '52', '1201', '2');
INSERT INTO `EntidadeREL` VALUES ('389', '53', '1202', '1');
INSERT INTO `EntidadeREL` VALUES ('390', '54', '1203', '1');
INSERT INTO `EntidadeREL` VALUES ('391', '55', '1204', '1');
INSERT INTO `EntidadeREL` VALUES ('392', '56', '1205', '1');
INSERT INTO `EntidadeREL` VALUES ('393', '57', '1206', '2');
INSERT INTO `EntidadeREL` VALUES ('394', '58', '1207', '1');
INSERT INTO `EntidadeREL` VALUES ('395', '59', '1208', '2');
INSERT INTO `EntidadeREL` VALUES ('396', '60', '1209', '1');
INSERT INTO `EntidadeREL` VALUES ('397', '61', '1210', '1');
INSERT INTO `EntidadeREL` VALUES ('398', '62', '1211', '2');
INSERT INTO `EntidadeREL` VALUES ('399', '63', '1212', '1');
INSERT INTO `EntidadeREL` VALUES ('400', '64', '1213', '1');
INSERT INTO `EntidadeREL` VALUES ('401', '65', '1214', '2');
INSERT INTO `EntidadeREL` VALUES ('402', '66', '1215', '1');
INSERT INTO `EntidadeREL` VALUES ('403', '66', '1216', '2');
INSERT INTO `EntidadeREL` VALUES ('404', '67', '1217', '1');
INSERT INTO `EntidadeREL` VALUES ('405', '68', '1218', '1');
INSERT INTO `EntidadeREL` VALUES ('406', '69', '1219', '2');
INSERT INTO `EntidadeREL` VALUES ('407', '70', '1220', '1');
INSERT INTO `EntidadeREL` VALUES ('408', '70', '1221', '2');
INSERT INTO `EntidadeREL` VALUES ('409', '71', '1222', '2');
INSERT INTO `EntidadeREL` VALUES ('410', '72', '1223', '1');
INSERT INTO `EntidadeREL` VALUES ('411', '73', '1224', '2');
INSERT INTO `EntidadeREL` VALUES ('412', '74', '1225', '1');
INSERT INTO `EntidadeREL` VALUES ('413', '978', '1226', '2');
INSERT INTO `EntidadeREL` VALUES ('414', '980', '1227', '8');
INSERT INTO `EntidadeREL` VALUES ('415', '9', '1228', '1');
INSERT INTO `EntidadeREL` VALUES ('416', '9', '1229', '2');
INSERT INTO `EntidadeREL` VALUES ('417', '10', '1230', '1');
INSERT INTO `EntidadeREL` VALUES ('418', '10', '1231', '2');
INSERT INTO `EntidadeREL` VALUES ('419', '11', '1232', '1');
INSERT INTO `EntidadeREL` VALUES ('420', '11', '1233', '2');
INSERT INTO `EntidadeREL` VALUES ('421', '12', '1234', '1');
INSERT INTO `EntidadeREL` VALUES ('422', '12', '1235', '2');
INSERT INTO `EntidadeREL` VALUES ('423', '13', '1236', '1');
INSERT INTO `EntidadeREL` VALUES ('424', '13', '1237', '2');
INSERT INTO `EntidadeREL` VALUES ('425', '14', '1238', '1');
INSERT INTO `EntidadeREL` VALUES ('426', '14', '1239', '2');
INSERT INTO `EntidadeREL` VALUES ('427', '15', '1240', '1');
INSERT INTO `EntidadeREL` VALUES ('428', '15', '1241', '2');
INSERT INTO `EntidadeREL` VALUES ('429', '16', '1242', '1');
INSERT INTO `EntidadeREL` VALUES ('430', '16', '1243', '2');
INSERT INTO `EntidadeREL` VALUES ('431', '16', '1244', '1');
INSERT INTO `EntidadeREL` VALUES ('432', '16', '1245', '2');
INSERT INTO `EntidadeREL` VALUES ('433', '17', '1246', '1');
INSERT INTO `EntidadeREL` VALUES ('434', '17', '1247', '2');
INSERT INTO `EntidadeREL` VALUES ('435', '18', '1248', '1');
INSERT INTO `EntidadeREL` VALUES ('436', '18', '1249', '2');
INSERT INTO `EntidadeREL` VALUES ('437', '19', '1250', '1');
INSERT INTO `EntidadeREL` VALUES ('438', '19', '1251', '2');
INSERT INTO `EntidadeREL` VALUES ('440', '21', '1253', '1');
INSERT INTO `EntidadeREL` VALUES ('441', '21', '1254', '2');
INSERT INTO `EntidadeREL` VALUES ('442', '22', '1255', '1');
INSERT INTO `EntidadeREL` VALUES ('443', '22', '1256', '2');
INSERT INTO `EntidadeREL` VALUES ('444', '23', '1257', '1');
INSERT INTO `EntidadeREL` VALUES ('445', '23', '1258', '2');
INSERT INTO `EntidadeREL` VALUES ('446', '207', '1055', '2');
INSERT INTO `EntidadeREL` VALUES ('447', '217', '1033', '2');
INSERT INTO `EntidadeREL` VALUES ('448', '217', '1033', '2');
INSERT INTO `EntidadeREL` VALUES ('449', '217', '1033', '2');
INSERT INTO `EntidadeREL` VALUES ('450', '179', '1096', '2');
INSERT INTO `EntidadeREL` VALUES ('451', '179', '1096', '2');
INSERT INTO `EntidadeREL` VALUES ('452', '212', '1061', '1');
INSERT INTO `EntidadeREL` VALUES ('453', '212', '1061', '1');
INSERT INTO `EntidadeREL` VALUES ('454', '191', '1073', '2');
INSERT INTO `EntidadeREL` VALUES ('455', '194', '1076', '2');
INSERT INTO `EntidadeREL` VALUES ('456', '194', '1076', '2');
INSERT INTO `EntidadeREL` VALUES ('457', '182', '1064', '2');
INSERT INTO `EntidadeREL` VALUES ('458', '204', '1052', '2');
INSERT INTO `EntidadeREL` VALUES ('459', '61', '1210', '1');
INSERT INTO `EntidadeREL` VALUES ('460', '61', '1210', '1');
INSERT INTO `EntidadeREL` VALUES ('461', '61', '1210', '1');
INSERT INTO `EntidadeREL` VALUES ('462', '61', '1210', '1');
INSERT INTO `EntidadeREL` VALUES ('463', '227', '1025', '2');
INSERT INTO `EntidadeREL` VALUES ('464', '227', '1025', '2');
INSERT INTO `EntidadeREL` VALUES ('465', '214', '1027', '2');
INSERT INTO `EntidadeREL` VALUES ('466', '214', '1027', '2');
INSERT INTO `EntidadeREL` VALUES ('467', '175', '1092', '2');
INSERT INTO `EntidadeREL` VALUES ('468', '175', '1092', '2');
INSERT INTO `EntidadeREL` VALUES ('469', '175', '1092', '2');
INSERT INTO `EntidadeREL` VALUES ('470', '186', '1068', '1');
INSERT INTO `EntidadeREL` VALUES ('471', '186', '1068', '1');
INSERT INTO `EntidadeREL` VALUES ('472', '1259', '1260', '2');
INSERT INTO `EntidadeREL` VALUES ('473', '1259', '1261', '1');
INSERT INTO `EntidadeREL` VALUES ('474', '1259', '1261', '1');
INSERT INTO `EntidadeREL` VALUES ('475', '92', '1153', '2');
INSERT INTO `EntidadeREL` VALUES ('476', '92', '1153', '2');
INSERT INTO `EntidadeREL` VALUES ('477', '184', '1066', '1');
INSERT INTO `EntidadeREL` VALUES ('478', '184', '1066', '1');
INSERT INTO `EntidadeREL` VALUES ('479', '184', '1066', '1');
INSERT INTO `EntidadeREL` VALUES ('480', '184', '1066', '1');
INSERT INTO `EntidadeREL` VALUES ('481', '227', '1025', '2');
INSERT INTO `EntidadeREL` VALUES ('482', '214', '1027', '2');
INSERT INTO `EntidadeREL` VALUES ('483', '177', '1094', '2');
INSERT INTO `EntidadeREL` VALUES ('484', '177', '1094', '2');
INSERT INTO `EntidadeREL` VALUES ('485', '177', '1094', '2');
INSERT INTO `EntidadeREL` VALUES ('486', '1262', '1263', '1');
INSERT INTO `EntidadeREL` VALUES ('487', '1262', '1264', '2');
INSERT INTO `EntidadeREL` VALUES ('488', '1262', '1264', '2');
INSERT INTO `EntidadeREL` VALUES ('489', '83', '1141', '2');
INSERT INTO `EntidadeREL` VALUES ('490', '82', '1140', '2');
INSERT INTO `EntidadeREL` VALUES ('491', '161', '1078', '1');
INSERT INTO `EntidadeREL` VALUES ('492', '161', '1078', '1');
INSERT INTO `EntidadeREL` VALUES ('493', '82', '1140', '2');
INSERT INTO `EntidadeREL` VALUES ('494', '82', '1140', '2');
INSERT INTO `EntidadeREL` VALUES ('495', '82', '1140', '2');
INSERT INTO `EntidadeREL` VALUES ('496', '191', '1073', '2');
INSERT INTO `EntidadeREL` VALUES ('497', '193', '1075', '2');
INSERT INTO `EntidadeREL` VALUES ('498', '194', '1076', '2');
INSERT INTO `EntidadeREL` VALUES ('499', '85', '1144', '2');
INSERT INTO `EntidadeREL` VALUES ('500', '108', '1172', '1');
INSERT INTO `EntidadeREL` VALUES ('501', '169', '1086', '1');
INSERT INTO `EntidadeREL` VALUES ('502', '196', '1044', '2');
INSERT INTO `EntidadeREL` VALUES ('503', '196', '1044', '2');
INSERT INTO `EntidadeREL` VALUES ('504', '196', '1044', '2');
INSERT INTO `EntidadeREL` VALUES ('505', '83', '1141', '2');
INSERT INTO `EntidadeREL` VALUES ('506', '143', '999', '2');
INSERT INTO `EntidadeREL` VALUES ('507', '88', '1148', '2');
INSERT INTO `EntidadeREL` VALUES ('508', '93', '1154', '1');
INSERT INTO `EntidadeREL` VALUES ('509', '122', '1111', '2');
INSERT INTO `EntidadeREL` VALUES ('510', '111', '1175', '2');
INSERT INTO `EntidadeREL` VALUES ('511', '1265', '1266', '1');
INSERT INTO `EntidadeREL` VALUES ('512', '1265', '1267', '2');
INSERT INTO `EntidadeREL` VALUES ('513', '199', '1047', '2');
INSERT INTO `EntidadeREL` VALUES ('514', '217', '1033', '2');
INSERT INTO `EntidadeREL` VALUES ('515', '207', '1055', '2');
INSERT INTO `EntidadeREL` VALUES ('516', '1268', '1269', '1');
INSERT INTO `EntidadeREL` VALUES ('517', '1268', '1270', '2');
INSERT INTO `EntidadeREL` VALUES ('518', '212', '1061', '1');
INSERT INTO `EntidadeREL` VALUES ('519', '210', '1059', '2');
INSERT INTO `EntidadeREL` VALUES ('520', '201', '1049', '1');
INSERT INTO `EntidadeREL` VALUES ('521', '112', '1176', '2');
INSERT INTO `EntidadeREL` VALUES ('522', '206', '1054', '1');
INSERT INTO `EntidadeREL` VALUES ('523', '44', '1192', '2');
INSERT INTO `EntidadeREL` VALUES ('524', '169', '1086', '1');
INSERT INTO `EntidadeREL` VALUES ('525', '141', '976', '1');
INSERT INTO `EntidadeREL` VALUES ('526', '1271', '1272', '1');
INSERT INTO `EntidadeREL` VALUES ('527', '1271', '1273', '2');
INSERT INTO `EntidadeREL` VALUES ('528', '1274', '1275', '2');
INSERT INTO `EntidadeREL` VALUES ('529', '1276', '1277', '1');
INSERT INTO `EntidadeREL` VALUES ('530', '1276', '1278', '2');
INSERT INTO `EntidadeREL` VALUES ('531', '109', '1173', '2');
INSERT INTO `EntidadeREL` VALUES ('532', '99', '1162', '2');
INSERT INTO `EntidadeREL` VALUES ('533', '200', '1048', '2');
INSERT INTO `EntidadeREL` VALUES ('534', '62', '1211', '2');
INSERT INTO `EntidadeREL` VALUES ('535', '145', '1002', '2');
INSERT INTO `EntidadeREL` VALUES ('536', '78', '1137', '1');
INSERT INTO `EntidadeREL` VALUES ('537', '220', '1039', '2');
INSERT INTO `EntidadeREL` VALUES ('538', '67', '1217', '1');
INSERT INTO `EntidadeREL` VALUES ('539', '144', '1000', '2');
INSERT INTO `EntidadeREL` VALUES ('540', '156', '1011', '2');
INSERT INTO `EntidadeREL` VALUES ('541', '110', '1174', '2');
INSERT INTO `EntidadeREL` VALUES ('542', '147', '1004', '2');
INSERT INTO `EntidadeREL` VALUES ('543', '134', '1129', '1');
INSERT INTO `EntidadeREL` VALUES ('544', '215', '1029', '2');
INSERT INTO `EntidadeREL` VALUES ('545', '211', '1060', '2');
INSERT INTO `EntidadeREL` VALUES ('546', '1279', '1280', '2');
INSERT INTO `EntidadeREL` VALUES ('547', '1279', '1281', '1');
INSERT INTO `EntidadeREL` VALUES ('548', '1282', '1283', '2');
INSERT INTO `EntidadeREL` VALUES ('549', '1282', '1284', '1');
INSERT INTO `EntidadeREL` VALUES ('550', '90', '1151', '2');
INSERT INTO `EntidadeREL` VALUES ('551', '173', '1090', '2');
INSERT INTO `EntidadeREL` VALUES ('552', '192', '1074', '2');
INSERT INTO `EntidadeREL` VALUES ('553', '1285', '1286', '2');
INSERT INTO `EntidadeREL` VALUES ('554', '1285', '1287', '1');
INSERT INTO `EntidadeREL` VALUES ('555', '105', '1169', '1');
INSERT INTO `EntidadeREL` VALUES ('556', '157', '1012', '1');
INSERT INTO `EntidadeREL` VALUES ('557', '118', '1107', '2');
INSERT INTO `EntidadeREL` VALUES ('558', '71', '1222', '2');
INSERT INTO `EntidadeREL` VALUES ('559', '104', '1168', '2');
INSERT INTO `EntidadeREL` VALUES ('560', '104', '1168', '2');
INSERT INTO `EntidadeREL` VALUES ('561', '104', '1168', '2');
INSERT INTO `EntidadeREL` VALUES ('562', '1288', '1289', '1');
INSERT INTO `EntidadeREL` VALUES ('563', '1288', '1290', '2');
INSERT INTO `EntidadeREL` VALUES ('564', '71', '1222', '2');
INSERT INTO `EntidadeREL` VALUES ('565', '1288', '1290', '2');
INSERT INTO `EntidadeREL` VALUES ('566', '51', '1200', '2');
INSERT INTO `EntidadeREL` VALUES ('567', '57', '1206', '2');
INSERT INTO `EntidadeREL` VALUES ('568', '162', '1079', '1');
INSERT INTO `EntidadeREL` VALUES ('569', '186', '1068', '1');
INSERT INTO `EntidadeREL` VALUES ('570', '164', '1081', '2');
INSERT INTO `EntidadeREL` VALUES ('571', '163', '1080', '2');
INSERT INTO `EntidadeREL` VALUES ('572', '97', '1160', '2');
INSERT INTO `EntidadeREL` VALUES ('573', '224', '1019', '1');
INSERT INTO `EntidadeREL` VALUES ('574', '225', '1021', '1');
INSERT INTO `EntidadeREL` VALUES ('575', '73', '1224', '2');
INSERT INTO `EntidadeREL` VALUES ('576', '69', '1219', '2');
INSERT INTO `EntidadeREL` VALUES ('577', '52', '1201', '2');
INSERT INTO `EntidadeREL` VALUES ('578', '168', '1085', '1');
INSERT INTO `EntidadeREL` VALUES ('579', '119', '1108', '2');
INSERT INTO `EntidadeREL` VALUES ('580', '146', '1003', '2');
INSERT INTO `EntidadeREL` VALUES ('581', '223', '1017', '2');
INSERT INTO `EntidadeREL` VALUES ('582', '1291', '1292', '1');
INSERT INTO `EntidadeREL` VALUES ('583', '1291', '1293', '2');
INSERT INTO `EntidadeREL` VALUES ('584', '1294', '1295', '1');
INSERT INTO `EntidadeREL` VALUES ('585', '1294', '1296', '2');
INSERT INTO `EntidadeREL` VALUES ('586', '1297', '1298', '1');
INSERT INTO `EntidadeREL` VALUES ('587', '1297', '1299', '2');
INSERT INTO `EntidadeREL` VALUES ('588', '1300', '1301', '1');
INSERT INTO `EntidadeREL` VALUES ('589', '1300', '1302', '2');
INSERT INTO `EntidadeREL` VALUES ('590', '153', '1008', '1');
INSERT INTO `EntidadeREL` VALUES ('591', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('592', '50', '1199', '1');
INSERT INTO `EntidadeREL` VALUES ('593', '176', '1093', '2');
INSERT INTO `EntidadeREL` VALUES ('594', '197', '1045', '2');
INSERT INTO `EntidadeREL` VALUES ('595', '1303', '1304', '1');
INSERT INTO `EntidadeREL` VALUES ('596', '1303', '1305', '2');
INSERT INTO `EntidadeREL` VALUES ('597', '1306', '1307', '2');
INSERT INTO `EntidadeREL` VALUES ('598', '1306', '1308', '1');
INSERT INTO `EntidadeREL` VALUES ('599', '178', '1095', '1');
INSERT INTO `EntidadeREL` VALUES ('600', '1309', '1310', '2');
INSERT INTO `EntidadeREL` VALUES ('601', '1309', '1311', '1');
INSERT INTO `EntidadeREL` VALUES ('602', '63', '1212', '1');
INSERT INTO `EntidadeREL` VALUES ('603', '1312', '1313', '1');
INSERT INTO `EntidadeREL` VALUES ('604', '1312', '1314', '2');
INSERT INTO `EntidadeREL` VALUES ('605', '107', '1171', '1');
INSERT INTO `EntidadeREL` VALUES ('606', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('607', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('608', '1315', '1316', '1');
INSERT INTO `EntidadeREL` VALUES ('609', '1315', '1317', '2');
INSERT INTO `EntidadeREL` VALUES ('610', '68', '1218', '1');
INSERT INTO `EntidadeREL` VALUES ('611', '154', '1009', '2');
INSERT INTO `EntidadeREL` VALUES ('612', '86', '1145', '2');
INSERT INTO `EntidadeREL` VALUES ('613', '160', '1015', '2');
INSERT INTO `EntidadeREL` VALUES ('614', '159', '1014', '2');
INSERT INTO `EntidadeREL` VALUES ('615', '160', '1015', '2');
INSERT INTO `EntidadeREL` VALUES ('616', '121', '1110', '2');
INSERT INTO `EntidadeREL` VALUES ('617', '209', '1058', '2');
INSERT INTO `EntidadeREL` VALUES ('618', '196', '1044', '2');
INSERT INTO `EntidadeREL` VALUES ('619', '98', '1161', '2');
INSERT INTO `EntidadeREL` VALUES ('620', '156', '1011', '2');
INSERT INTO `EntidadeREL` VALUES ('621', '158', '1013', '2');
INSERT INTO `EntidadeREL` VALUES ('622', '155', '1010', '1');
INSERT INTO `EntidadeREL` VALUES ('623', '158', '1013', '2');
INSERT INTO `EntidadeREL` VALUES ('624', '198', '1046', '2');
INSERT INTO `EntidadeREL` VALUES ('625', '90', '1260', '2');
INSERT INTO `EntidadeREL` VALUES ('626', '90', '1260', '2');
INSERT INTO `EntidadeREL` VALUES ('627', '50', '1199', '1');
INSERT INTO `EntidadeREL` VALUES ('628', '51', '1200', '2');
INSERT INTO `EntidadeREL` VALUES ('629', '52', '1201', '2');
INSERT INTO `EntidadeREL` VALUES ('630', '57', '1206', '2');
INSERT INTO `EntidadeREL` VALUES ('631', '61', '1210', '1');
INSERT INTO `EntidadeREL` VALUES ('632', '62', '1211', '2');
INSERT INTO `EntidadeREL` VALUES ('633', '63', '1212', '1');
INSERT INTO `EntidadeREL` VALUES ('634', '67', '1217', '1');
INSERT INTO `EntidadeREL` VALUES ('635', '68', '1218', '1');
INSERT INTO `EntidadeREL` VALUES ('636', '69', '1219', '2');
INSERT INTO `EntidadeREL` VALUES ('637', '73', '1224', '2');
INSERT INTO `EntidadeREL` VALUES ('638', '1303', '1305', '2');
INSERT INTO `EntidadeREL` VALUES ('639', '78', '1137', '1');
INSERT INTO `EntidadeREL` VALUES ('640', '79', '958', '2');
INSERT INTO `EntidadeREL` VALUES ('641', '83', '1141', '2');
INSERT INTO `EntidadeREL` VALUES ('642', '85', '1144', '2');
INSERT INTO `EntidadeREL` VALUES ('643', '88', '1148', '2');
INSERT INTO `EntidadeREL` VALUES ('644', '90', '1260', '2');
INSERT INTO `EntidadeREL` VALUES ('645', '92', '1153', '2');
INSERT INTO `EntidadeREL` VALUES ('646', '90', '1260', '2');
INSERT INTO `EntidadeREL` VALUES ('647', '93', '1154', '1');
INSERT INTO `EntidadeREL` VALUES ('648', '97', '1160', '2');
INSERT INTO `EntidadeREL` VALUES ('649', '98', '1161', '2');
INSERT INTO `EntidadeREL` VALUES ('650', '99', '1162', '2');
INSERT INTO `EntidadeREL` VALUES ('651', '104', '1168', '2');
INSERT INTO `EntidadeREL` VALUES ('652', '105', '1169', '1');
INSERT INTO `EntidadeREL` VALUES ('653', '107', '1171', '1');
INSERT INTO `EntidadeREL` VALUES ('654', '109', '1173', '2');
INSERT INTO `EntidadeREL` VALUES ('655', '110', '1174', '2');
INSERT INTO `EntidadeREL` VALUES ('656', '111', '1175', '2');
INSERT INTO `EntidadeREL` VALUES ('657', '1271', '1273', '2');
INSERT INTO `EntidadeREL` VALUES ('658', '1297', '1299', '2');
INSERT INTO `EntidadeREL` VALUES ('659', '82', '1140', '2');
INSERT INTO `EntidadeREL` VALUES ('660', '80', '1138', '2');
INSERT INTO `EntidadeREL` VALUES ('661', '118', '1107', '2');
INSERT INTO `EntidadeREL` VALUES ('662', '119', '1108', '2');
INSERT INTO `EntidadeREL` VALUES ('663', '121', '1110', '2');
INSERT INTO `EntidadeREL` VALUES ('664', '122', '1111', '2');
INSERT INTO `EntidadeREL` VALUES ('665', '134', '1129', '1');
INSERT INTO `EntidadeREL` VALUES ('666', '1274', '1318', '1');
INSERT INTO `EntidadeREL` VALUES ('667', '1294', '1296', '2');
INSERT INTO `EntidadeREL` VALUES ('668', '1300', '1302', '2');
INSERT INTO `EntidadeREL` VALUES ('669', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('670', '141', '976', '1');
INSERT INTO `EntidadeREL` VALUES ('671', '142', '998', '1');
INSERT INTO `EntidadeREL` VALUES ('672', '143', '999', '2');
INSERT INTO `EntidadeREL` VALUES ('673', '144', '1000', '2');
INSERT INTO `EntidadeREL` VALUES ('674', '145', '1002', '2');
INSERT INTO `EntidadeREL` VALUES ('675', '146', '1003', '2');
INSERT INTO `EntidadeREL` VALUES ('676', '147', '1004', '2');
INSERT INTO `EntidadeREL` VALUES ('677', '148', '1001', '1');
INSERT INTO `EntidadeREL` VALUES ('678', '147', '1004', '2');
INSERT INTO `EntidadeREL` VALUES ('679', '151', '1007', '2');
INSERT INTO `EntidadeREL` VALUES ('680', '153', '1008', '1');
INSERT INTO `EntidadeREL` VALUES ('681', '154', '1009', '2');
INSERT INTO `EntidadeREL` VALUES ('682', '156', '1011', '2');
INSERT INTO `EntidadeREL` VALUES ('683', '157', '1012', '1');
INSERT INTO `EntidadeREL` VALUES ('684', '158', '1013', '2');
INSERT INTO `EntidadeREL` VALUES ('685', '159', '1014', '2');
INSERT INTO `EntidadeREL` VALUES ('686', '160', '1015', '2');
INSERT INTO `EntidadeREL` VALUES ('687', '1282', '1284', '1');
INSERT INTO `EntidadeREL` VALUES ('688', '162', '1079', '1');
INSERT INTO `EntidadeREL` VALUES ('689', '163', '1080', '2');
INSERT INTO `EntidadeREL` VALUES ('690', '164', '1081', '2');
INSERT INTO `EntidadeREL` VALUES ('691', '168', '1085', '1');
INSERT INTO `EntidadeREL` VALUES ('692', '169', '1086', '1');
INSERT INTO `EntidadeREL` VALUES ('693', '173', '1090', '2');
INSERT INTO `EntidadeREL` VALUES ('694', '175', '1092', '2');
INSERT INTO `EntidadeREL` VALUES ('695', '176', '1093', '2');
INSERT INTO `EntidadeREL` VALUES ('696', '177', '1094', '2');
INSERT INTO `EntidadeREL` VALUES ('697', '178', '1095', '1');
INSERT INTO `EntidadeREL` VALUES ('698', '179', '1096', '2');
INSERT INTO `EntidadeREL` VALUES ('699', '1306', '1308', '1');
INSERT INTO `EntidadeREL` VALUES ('700', '1312', '1314', '2');
INSERT INTO `EntidadeREL` VALUES ('701', '184', '1066', '1');
INSERT INTO `EntidadeREL` VALUES ('702', '186', '1068', '1');
INSERT INTO `EntidadeREL` VALUES ('703', '191', '1073', '2');
INSERT INTO `EntidadeREL` VALUES ('704', '192', '1074', '2');
INSERT INTO `EntidadeREL` VALUES ('705', '193', '1075', '2');
INSERT INTO `EntidadeREL` VALUES ('706', '194', '1076', '2');
INSERT INTO `EntidadeREL` VALUES ('707', '1259', '1261', '1');
INSERT INTO `EntidadeREL` VALUES ('708', '1259', '1261', '1');
INSERT INTO `EntidadeREL` VALUES ('709', '1259', '1260', '1');
INSERT INTO `EntidadeREL` VALUES ('710', '1259', '1260', '1');
INSERT INTO `EntidadeREL` VALUES ('711', '1262', '1264', '2');
INSERT INTO `EntidadeREL` VALUES ('712', '1282', '1284', '1');
INSERT INTO `EntidadeREL` VALUES ('713', '1285', '1287', '1');
INSERT INTO `EntidadeREL` VALUES ('714', '198', '1046', '2');
INSERT INTO `EntidadeREL` VALUES ('715', '1291', '1293', '2');
INSERT INTO `EntidadeREL` VALUES ('716', '197', '1045', '2');
INSERT INTO `EntidadeREL` VALUES ('717', '196', '1044', '2');
INSERT INTO `EntidadeREL` VALUES ('718', '209', '1058', '2');
INSERT INTO `EntidadeREL` VALUES ('719', '200', '1048', '2');
INSERT INTO `EntidadeREL` VALUES ('720', '1276', '1278', '2');
INSERT INTO `EntidadeREL` VALUES ('721', '206', '1054', '1');
INSERT INTO `EntidadeREL` VALUES ('722', '210', '1059', '2');
INSERT INTO `EntidadeREL` VALUES ('723', '207', '1055', '2');
INSERT INTO `EntidadeREL` VALUES ('724', '201', '1049', '1');
INSERT INTO `EntidadeREL` VALUES ('725', '199', '1047', '2');
INSERT INTO `EntidadeREL` VALUES ('726', '199', '1047', '2');
INSERT INTO `EntidadeREL` VALUES ('727', '212', '1061', '1');
INSERT INTO `EntidadeREL` VALUES ('728', '211', '1060', '2');
INSERT INTO `EntidadeREL` VALUES ('729', '1276', '1278', '2');
INSERT INTO `EntidadeREL` VALUES ('730', '225', '1021', '1');
INSERT INTO `EntidadeREL` VALUES ('731', '223', '1017', '2');
INSERT INTO `EntidadeREL` VALUES ('732', '1309', '1311', '1');
INSERT INTO `EntidadeREL` VALUES ('733', '224', '1019', '1');
INSERT INTO `EntidadeREL` VALUES ('734', '227', '1025', '2');
INSERT INTO `EntidadeREL` VALUES ('735', '227', '1025', '2');
INSERT INTO `EntidadeREL` VALUES ('736', '1268', '1270', '2');
INSERT INTO `EntidadeREL` VALUES ('737', '1279', '1281', '1');
INSERT INTO `EntidadeREL` VALUES ('738', '1315', '1317', '2');
INSERT INTO `EntidadeREL` VALUES ('739', '214', '1027', '2');
INSERT INTO `EntidadeREL` VALUES ('740', '217', '1033', '2');
INSERT INTO `EntidadeREL` VALUES ('741', '217', '1033', '1');
INSERT INTO `EntidadeREL` VALUES ('742', '215', '1029', '2');
INSERT INTO `EntidadeREL` VALUES ('743', '220', '1039', '2');
INSERT INTO `EntidadeREL` VALUES ('744', '1274', '1318', '1');
INSERT INTO `EntidadeREL` VALUES ('745', '79', '958', '2');
INSERT INTO `EntidadeREL` VALUES ('746', '92', '1153', '2');
INSERT INTO `EntidadeREL` VALUES ('747', '52', '1201', '2');
INSERT INTO `EntidadeREL` VALUES ('748', '81', '1139', '1');
INSERT INTO `EntidadeREL` VALUES ('749', '72', '1223', '1');
INSERT INTO `EntidadeREL` VALUES ('750', '135', '1130', '2');
INSERT INTO `EntidadeREL` VALUES ('751', '1319', '1320', '1');
INSERT INTO `EntidadeREL` VALUES ('752', '1319', '1321', '2');
INSERT INTO `EntidadeREL` VALUES ('753', '1322', '1323', '1');
INSERT INTO `EntidadeREL` VALUES ('754', '1322', '1324', '2');
INSERT INTO `EntidadeREL` VALUES ('755', '172', '1089', '1');
INSERT INTO `EntidadeREL` VALUES ('756', '135', '1130', '2');
INSERT INTO `EntidadeREL` VALUES ('757', '1325', '1326', '1');
INSERT INTO `EntidadeREL` VALUES ('758', '1325', '1327', '2');
INSERT INTO `EntidadeREL` VALUES ('759', '978', '1226', '2');
INSERT INTO `EntidadeREL` VALUES ('760', '978', '1226', '2');
INSERT INTO `EntidadeREL` VALUES ('761', '141', '976', '1');
INSERT INTO `EntidadeREL` VALUES ('762', '113', '1177', '2');
INSERT INTO `EntidadeREL` VALUES ('763', '101', '1164', '2');
INSERT INTO `EntidadeREL` VALUES ('764', '113', '1177', '2');
INSERT INTO `EntidadeREL` VALUES ('765', '120', '1109', '2');
INSERT INTO `EntidadeREL` VALUES ('766', '978', '1226', '2');
INSERT INTO `EntidadeREL` VALUES ('767', '978', '1226', '2');
INSERT INTO `EntidadeREL` VALUES ('768', '113', '1177', '2');
INSERT INTO `EntidadeREL` VALUES ('769', '101', '1164', '2');
INSERT INTO `EntidadeREL` VALUES ('770', '60', '1209', '1');
INSERT INTO `EntidadeREL` VALUES ('771', '64', '1213', '1');
INSERT INTO `EntidadeREL` VALUES ('772', '64', '1213', '1');
INSERT INTO `EntidadeREL` VALUES ('773', '53', '1202', '1');
INSERT INTO `EntidadeREL` VALUES ('774', '189', '1071', '2');
INSERT INTO `EntidadeREL` VALUES ('775', '1288', '1290', '2');
INSERT INTO `EntidadeREL` VALUES ('776', '71', '1222', '2');
INSERT INTO `EntidadeREL` VALUES ('777', '185', '1067', '1');
INSERT INTO `EntidadeREL` VALUES ('778', '1336', '1337', '2');
INSERT INTO `EntidadeREL` VALUES ('779', '1336', '1338', '1');
INSERT INTO `EntidadeREL` VALUES ('780', '1339', '1340', '1');
INSERT INTO `EntidadeREL` VALUES ('781', '1339', '1341', '2');
INSERT INTO `EntidadeREL` VALUES ('782', '123', '1112', '2');
INSERT INTO `EntidadeREL` VALUES ('783', '116', '1102', '2');
INSERT INTO `EntidadeREL` VALUES ('784', '124', '1113', '1');
INSERT INTO `EntidadeREL` VALUES ('785', '1339', '1341', '2');
INSERT INTO `EntidadeREL` VALUES ('786', '185', '1067', '1');
INSERT INTO `EntidadeREL` VALUES ('787', '116', '1102', '2');
INSERT INTO `EntidadeREL` VALUES ('788', '116', '1102', '2');
INSERT INTO `EntidadeREL` VALUES ('789', '1336', '1338', '1');
INSERT INTO `EntidadeREL` VALUES ('790', '123', '1112', '2');
INSERT INTO `EntidadeREL` VALUES ('791', '124', '1113', '1');
INSERT INTO `EntidadeREL` VALUES ('792', '213', '1062', '1');
INSERT INTO `EntidadeREL` VALUES ('793', '52', '1201', '2');
INSERT INTO `EntidadeREL` VALUES ('794', '79', '958', '2');
INSERT INTO `EntidadeREL` VALUES ('795', '92', '1153', '2');
INSERT INTO `EntidadeREL` VALUES ('796', '113', '1177', '2');
INSERT INTO `EntidadeREL` VALUES ('797', '1274', '1318', '1');
INSERT INTO `EntidadeREL` VALUES ('798', '156', '1011', '2');
INSERT INTO `EntidadeREL` VALUES ('799', '113', '1177', '2');
INSERT INTO `EntidadeREL` VALUES ('800', '198', '1046', '2');
INSERT INTO `EntidadeREL` VALUES ('802', '80', '1138', '2');
INSERT INTO `EntidadeREL` VALUES ('803', '86', '1145', '2');
INSERT INTO `EntidadeREL` VALUES ('804', '108', '1172', '1');
INSERT INTO `EntidadeREL` VALUES ('805', '112', '1176', '2');
INSERT INTO `EntidadeREL` VALUES ('806', '1342', '1343', '1');
INSERT INTO `EntidadeREL` VALUES ('807', '1342', '1344', '2');
INSERT INTO `EntidadeREL` VALUES ('808', '1342', '1344', '2');
INSERT INTO `EntidadeREL` VALUES ('809', '1345', '1346', '2');
INSERT INTO `EntidadeREL` VALUES ('810', '1345', '1347', '1');
INSERT INTO `EntidadeREL` VALUES ('811', '1342', '1344', '2');
INSERT INTO `EntidadeREL` VALUES ('812', '1342', '1344', '2');
INSERT INTO `EntidadeREL` VALUES ('813', '1348', '1349', '1');
INSERT INTO `EntidadeREL` VALUES ('814', '1348', '1350', '2');
INSERT INTO `EntidadeREL` VALUES ('815', '1348', '1350', '2');
INSERT INTO `EntidadeREL` VALUES ('816', '1342', '1344', '2');
INSERT INTO `EntidadeREL` VALUES ('817', '1342', '1344', '2');
INSERT INTO `EntidadeREL` VALUES ('818', '1345', '1347', '1');
INSERT INTO `EntidadeREL` VALUES ('819', '1348', '1350', '2');
INSERT INTO `EntidadeREL` VALUES ('820', '141', '976', '1');
INSERT INTO `EntidadeREL` VALUES ('821', '141', '976', '1');
INSERT INTO `EntidadeREL` VALUES ('822', '149', '1005', '1');
INSERT INTO `EntidadeREL` VALUES ('823', '131', '1124', '2');
INSERT INTO `EntidadeREL` VALUES ('824', '1300', '1302', '2');
INSERT INTO `EntidadeREL` VALUES ('825', '1300', '1302', '2');
INSERT INTO `EntidadeREL` VALUES ('826', '102', '1165', '2');
INSERT INTO `EntidadeREL` VALUES ('827', '102', '1165', '2');
INSERT INTO `EntidadeREL` VALUES ('828', '149', '1005', '2');
INSERT INTO `EntidadeREL` VALUES ('829', '148', '1001', '1');
INSERT INTO `EntidadeREL` VALUES ('831', '100', '1163', '2');
INSERT INTO `EntidadeREL` VALUES ('832', '221', '1041', '2');
INSERT INTO `EntidadeREL` VALUES ('833', '222', '1043', '2');
INSERT INTO `EntidadeREL` VALUES ('834', '108', '1172', '1');
INSERT INTO `EntidadeREL` VALUES ('835', '1365', '1366', '2');
INSERT INTO `EntidadeREL` VALUES ('836', '1365', '1367', '1');
INSERT INTO `EntidadeREL` VALUES ('837', '1365', '1367', '1');
INSERT INTO `EntidadeREL` VALUES ('838', '195', '1077', '2');
INSERT INTO `EntidadeREL` VALUES ('839', '1368', '1369', '2');
INSERT INTO `EntidadeREL` VALUES ('840', '1368', '1370', '1');
INSERT INTO `EntidadeREL` VALUES ('841', '1371', '1372', '2');
INSERT INTO `EntidadeREL` VALUES ('842', '1371', '1373', '1');
INSERT INTO `EntidadeREL` VALUES ('843', '1371', '1373', '1');
INSERT INTO `EntidadeREL` VALUES ('844', '1374', '1375', '1');
INSERT INTO `EntidadeREL` VALUES ('845', '1374', '1376', '2');
INSERT INTO `EntidadeREL` VALUES ('846', '1371', '1373', '1');
INSERT INTO `EntidadeREL` VALUES ('847', '1377', '1378', '2');
INSERT INTO `EntidadeREL` VALUES ('848', '1377', '1379', '1');
INSERT INTO `EntidadeREL` VALUES ('849', '1380', '1381', '1');
INSERT INTO `EntidadeREL` VALUES ('850', '1380', '1382', '2');
INSERT INTO `EntidadeREL` VALUES ('851', '1380', '1382', '2');
INSERT INTO `EntidadeREL` VALUES ('852', '1383', '1384', '2');
INSERT INTO `EntidadeREL` VALUES ('853', '1383', '1385', '1');
INSERT INTO `EntidadeREL` VALUES ('854', '56', '1205', '1');
INSERT INTO `EntidadeREL` VALUES ('855', '55', '1204', '1');
INSERT INTO `EntidadeREL` VALUES ('856', '55', '1204', '1');
INSERT INTO `EntidadeREL` VALUES ('857', '171', '1088', '2');
INSERT INTO `EntidadeREL` VALUES ('858', '170', '1087', '2');
INSERT INTO `EntidadeREL` VALUES ('859', '187', '1069', '2');
INSERT INTO `EntidadeREL` VALUES ('860', '205', '1053', '2');
INSERT INTO `EntidadeREL` VALUES ('861', '36', '1181', '2');
INSERT INTO `EntidadeREL` VALUES ('862', '203', '1051', '2');
INSERT INTO `EntidadeREL` VALUES ('863', '1386', '1387', '2');
INSERT INTO `EntidadeREL` VALUES ('864', '1386', '1388', '1');
INSERT INTO `EntidadeREL` VALUES ('865', '1386', '1388', '1');
INSERT INTO `EntidadeREL` VALUES ('866', '140', '997', '2');
INSERT INTO `EntidadeREL` VALUES ('867', '150', '1006', '1');
INSERT INTO `EntidadeREL` VALUES ('868', '1389', '1390', '1');
INSERT INTO `EntidadeREL` VALUES ('869', '1389', '1391', '2');
INSERT INTO `EntidadeREL` VALUES ('870', '174', '1091', '2');
INSERT INTO `EntidadeREL` VALUES ('871', '1393', '1394', '1');
INSERT INTO `EntidadeREL` VALUES ('872', '1393', '1395', '2');
INSERT INTO `EntidadeREL` VALUES ('873', '1396', '1397', '1');
INSERT INTO `EntidadeREL` VALUES ('874', '1396', '1398', '2');
INSERT INTO `EntidadeREL` VALUES ('875', '1399', '1400', '1');
INSERT INTO `EntidadeREL` VALUES ('876', '1399', '1401', '2');
INSERT INTO `EntidadeREL` VALUES ('877', '1402', '1403', '1');
INSERT INTO `EntidadeREL` VALUES ('878', '1402', '1404', '2');
INSERT INTO `EntidadeREL` VALUES ('879', '1405', '1406', '2');
INSERT INTO `EntidadeREL` VALUES ('880', '1405', '1407', '1');
INSERT INTO `EntidadeREL` VALUES ('881', '114', '1178', '2');
INSERT INTO `EntidadeREL` VALUES ('882', '1377', '1379', '1');
INSERT INTO `EntidadeREL` VALUES ('883', '136', '994', '2');
INSERT INTO `EntidadeREL` VALUES ('884', '141', '976', '2');
INSERT INTO `EntidadeREL` VALUES ('885', '188', '1070', '1');
INSERT INTO `EntidadeREL` VALUES ('886', '159', '1014', '2');
INSERT INTO `EntidadeREL` VALUES ('887', '160', '1015', '2');
INSERT INTO `EntidadeREL` VALUES ('888', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('889', '168', '1085', '1');
INSERT INTO `EntidadeREL` VALUES ('890', '158', '1013', '2');
INSERT INTO `EntidadeREL` VALUES ('891', '1365', '1367', '1');
INSERT INTO `EntidadeREL` VALUES ('892', '1282', '1284', '1');
INSERT INTO `EntidadeREL` VALUES ('893', '1408', '1409', '1');
INSERT INTO `EntidadeREL` VALUES ('894', '1408', '1410', '2');
INSERT INTO `EntidadeREL` VALUES ('895', '1402', '1404', '2');
INSERT INTO `EntidadeREL` VALUES ('896', '188', '1070', '1');
INSERT INTO `EntidadeREL` VALUES ('897', '137', '995', '2');
INSERT INTO `EntidadeREL` VALUES ('898', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('899', '175', '1092', '2');
INSERT INTO `EntidadeREL` VALUES ('900', '1411', '1412', '1');
INSERT INTO `EntidadeREL` VALUES ('901', '1411', '1413', '2');
INSERT INTO `EntidadeREL` VALUES ('902', '1414', '1415', '1');
INSERT INTO `EntidadeREL` VALUES ('903', '1414', '1416', '2');
INSERT INTO `EntidadeREL` VALUES ('904', '1417', '1418', '1');
INSERT INTO `EntidadeREL` VALUES ('905', '1417', '1419', '2');
INSERT INTO `EntidadeREL` VALUES ('906', '1420', '1421', '2');
INSERT INTO `EntidadeREL` VALUES ('907', '1420', '1422', '1');
INSERT INTO `EntidadeREL` VALUES ('908', '59', '1208', '2');
INSERT INTO `EntidadeREL` VALUES ('909', '1423', '1424', '2');
INSERT INTO `EntidadeREL` VALUES ('910', '1423', '1425', '1');
INSERT INTO `EntidadeREL` VALUES ('911', '1426', '1427', '2');
INSERT INTO `EntidadeREL` VALUES ('912', '1426', '1428', '1');
INSERT INTO `EntidadeREL` VALUES ('913', '53', '1202', '1');
INSERT INTO `EntidadeREL` VALUES ('914', '59', '1208', '2');
INSERT INTO `EntidadeREL` VALUES ('915', '193', '1075', '2');
INSERT INTO `EntidadeREL` VALUES ('916', '1262', '1264', '2');
INSERT INTO `EntidadeREL` VALUES ('917', '213', '1062', '1');
INSERT INTO `EntidadeREL` VALUES ('918', '198', '1046', '2');
INSERT INTO `EntidadeREL` VALUES ('919', '141', '976', '2');
INSERT INTO `EntidadeREL` VALUES ('920', '1377', '1379', '1');
INSERT INTO `EntidadeREL` VALUES ('921', '120', '1109', '2');
INSERT INTO `EntidadeREL` VALUES ('922', '223', '1017', '2');
INSERT INTO `EntidadeREL` VALUES ('923', '219', '1037', '2');
INSERT INTO `EntidadeREL` VALUES ('924', '219', '1037', '2');
INSERT INTO `EntidadeREL` VALUES ('925', '1429', '1430', '1');
INSERT INTO `EntidadeREL` VALUES ('926', '1429', '1431', '2');
INSERT INTO `EntidadeREL` VALUES ('927', '1432', '1433', '2');
INSERT INTO `EntidadeREL` VALUES ('928', '1432', '1434', '1');
INSERT INTO `EntidadeREL` VALUES ('929', '198', '1046', '2');
INSERT INTO `EntidadeREL` VALUES ('930', '1435', '1436', '2');
INSERT INTO `EntidadeREL` VALUES ('931', '1435', '1437', '1');
INSERT INTO `EntidadeREL` VALUES ('932', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('933', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('934', '213', '1062', '1');
INSERT INTO `EntidadeREL` VALUES ('935', '161', '1078', '2');
INSERT INTO `EntidadeREL` VALUES ('936', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('937', '1371', '1373', '1');
INSERT INTO `EntidadeREL` VALUES ('938', '1265', '1267', '2');
INSERT INTO `EntidadeREL` VALUES ('939', '120', '1109', '2');
INSERT INTO `EntidadeREL` VALUES ('940', '1386', '1388', '1');
INSERT INTO `EntidadeREL` VALUES ('941', '1438', '1439', '1');
INSERT INTO `EntidadeREL` VALUES ('942', '1438', '1440', '2');
INSERT INTO `EntidadeREL` VALUES ('943', '39', '1184', '2');
INSERT INTO `EntidadeREL` VALUES ('944', '1441', '1442', '1');
INSERT INTO `EntidadeREL` VALUES ('945', '1441', '1443', '2');
INSERT INTO `EntidadeREL` VALUES ('946', '1444', '1445', '1');
INSERT INTO `EntidadeREL` VALUES ('947', '1444', '1446', '2');
INSERT INTO `EntidadeREL` VALUES ('948', '1447', '1448', '1');
INSERT INTO `EntidadeREL` VALUES ('949', '1447', '1449', '2');
INSERT INTO `EntidadeREL` VALUES ('950', '1450', '1451', '2');
INSERT INTO `EntidadeREL` VALUES ('951', '1450', '1452', '1');
INSERT INTO `EntidadeREL` VALUES ('952', '1453', '1454', '1');
INSERT INTO `EntidadeREL` VALUES ('953', '1453', '1455', '2');
INSERT INTO `EntidadeREL` VALUES ('954', '1456', '1457', '1');
INSERT INTO `EntidadeREL` VALUES ('955', '1456', '1458', '2');
INSERT INTO `EntidadeREL` VALUES ('956', '66', '1216', '2');
INSERT INTO `EntidadeREL` VALUES ('957', '66', '1216', '2');
INSERT INTO `EntidadeREL` VALUES ('958', '1459', '1460', '2');
INSERT INTO `EntidadeREL` VALUES ('959', '1459', '1461', '1');
INSERT INTO `EntidadeREL` VALUES ('960', '1462', '1463', '2');
INSERT INTO `EntidadeREL` VALUES ('961', '1462', '1464', '1');
INSERT INTO `EntidadeREL` VALUES ('962', '34', '1179', '9');
INSERT INTO `EntidadeREL` VALUES ('963', '1465', '1466', '2');
INSERT INTO `EntidadeREL` VALUES ('964', '1465', '1467', '1');
INSERT INTO `EntidadeREL` VALUES ('965', '1468', '1469', '2');
INSERT INTO `EntidadeREL` VALUES ('966', '1468', '1470', '1');
INSERT INTO `EntidadeREL` VALUES ('967', '1471', '1472', '1');
INSERT INTO `EntidadeREL` VALUES ('968', '1471', '1473', '2');
INSERT INTO `EntidadeREL` VALUES ('969', '1462', '1464', '1');
INSERT INTO `EntidadeREL` VALUES ('970', '180', '1097', '1');
INSERT INTO `EntidadeREL` VALUES ('971', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('972', '1265', '1267', '2');
INSERT INTO `EntidadeREL` VALUES ('973', '1462', '1464', '1');
INSERT INTO `EntidadeREL` VALUES ('974', '1474', '1475', '1');
INSERT INTO `EntidadeREL` VALUES ('975', '1474', '1476', '2');
INSERT INTO `EntidadeREL` VALUES ('976', '1474', '1476', '2');
INSERT INTO `EntidadeREL` VALUES ('977', '1444', '1446', '2');
INSERT INTO `EntidadeREL` VALUES ('978', '1441', '1443', '2');
INSERT INTO `EntidadeREL` VALUES ('979', '1453', '1455', '2');
INSERT INTO `EntidadeREL` VALUES ('980', '1468', '1470', '1');
INSERT INTO `EntidadeREL` VALUES ('981', '193', '1075', '2');
INSERT INTO `EntidadeREL` VALUES ('982', '66', '1216', '2');
INSERT INTO `EntidadeREL` VALUES ('983', '66', '1216', '2');
INSERT INTO `EntidadeREL` VALUES ('984', '66', '1216', '2');
INSERT INTO `EntidadeREL` VALUES ('985', '1438', '1440', '2');
INSERT INTO `EntidadeREL` VALUES ('986', '1495', '1496', '1');
INSERT INTO `EntidadeREL` VALUES ('987', '1495', '1497', '2');
INSERT INTO `EntidadeREL` VALUES ('988', '1498', '1499', '1');
INSERT INTO `EntidadeREL` VALUES ('989', '1498', '1500', '2');
INSERT INTO `EntidadeREL` VALUES ('990', '48', '1197', '2');
INSERT INTO `EntidadeREL` VALUES ('991', '1501', '1502', '2');
INSERT INTO `EntidadeREL` VALUES ('992', '1501', '1503', '1');
INSERT INTO `EntidadeREL` VALUES ('993', '1501', '1503', '1');
INSERT INTO `EntidadeREL` VALUES ('994', '1504', '1505', '1');
INSERT INTO `EntidadeREL` VALUES ('995', '1504', '1506', '2');
INSERT INTO `EntidadeREL` VALUES ('996', '43', '1191', '2');
INSERT INTO `EntidadeREL` VALUES ('997', '43', '1191', '2');
INSERT INTO `EntidadeREL` VALUES ('998', '43', '1191', '2');
INSERT INTO `EntidadeREL` VALUES ('999', '43', '1191', '2');
INSERT INTO `EntidadeREL` VALUES ('1000', '43', '1191', '2');
INSERT INTO `EntidadeREL` VALUES ('1001', '166', '1083', '2');
INSERT INTO `EntidadeREL` VALUES ('1002', '166', '1083', '2');
INSERT INTO `EntidadeREL` VALUES ('1003', '166', '1083', '2');
INSERT INTO `EntidadeREL` VALUES ('1004', '164', '1081', '2');
INSERT INTO `EntidadeREL` VALUES ('1005', '167', '1084', '2');
INSERT INTO `EntidadeREL` VALUES ('1006', '165', '1082', '2');
INSERT INTO `EntidadeREL` VALUES ('1007', '165', '1082', '2');
INSERT INTO `EntidadeREL` VALUES ('1008', '183', '1065', '1');
INSERT INTO `EntidadeREL` VALUES ('1009', '190', '1072', '2');
INSERT INTO `EntidadeREL` VALUES ('1010', '190', '1072', '2');
INSERT INTO `EntidadeREL` VALUES ('1011', '1462', '1464', '1');
INSERT INTO `EntidadeREL` VALUES ('1012', '1462', '1464', '1');
INSERT INTO `EntidadeREL` VALUES ('1013', '9', '1229', '2');
INSERT INTO `EntidadeREL` VALUES ('1014', '10', '1231', '2');
INSERT INTO `EntidadeREL` VALUES ('1015', '13', '1237', '2');
INSERT INTO `EntidadeREL` VALUES ('1016', '14', '1239', '2');
INSERT INTO `EntidadeREL` VALUES ('1017', '18', '1249', '2');
INSERT INTO `EntidadeREL` VALUES ('1018', '19', '1251', '2');
INSERT INTO `EntidadeREL` VALUES ('1019', '115', '1101', '1');
INSERT INTO `EntidadeREL` VALUES ('1020', '117', '1106', '2');
INSERT INTO `EntidadeREL` VALUES ('1021', '125', '1115', '2');
INSERT INTO `EntidadeREL` VALUES ('1022', '126', '1117', '2');
INSERT INTO `EntidadeREL` VALUES ('1023', '127', '1118', '2');
INSERT INTO `EntidadeREL` VALUES ('1024', '128', '1120', '2');
INSERT INTO `EntidadeREL` VALUES ('1025', '129', '1122', '2');
INSERT INTO `EntidadeREL` VALUES ('1026', '130', '1123', '2');
INSERT INTO `EntidadeREL` VALUES ('1027', '132', '1126', '2');
INSERT INTO `EntidadeREL` VALUES ('1028', '133', '1128', '2');
INSERT INTO `EntidadeREL` VALUES ('1029', '75', '1132', '2');
INSERT INTO `EntidadeREL` VALUES ('1030', '76', '1134', '2');
INSERT INTO `EntidadeREL` VALUES ('1031', '77', '1136', '2');
INSERT INTO `EntidadeREL` VALUES ('1032', '84', '1143', '2');
INSERT INTO `EntidadeREL` VALUES ('1033', '87', '1146', '2');
INSERT INTO `EntidadeREL` VALUES ('1034', '89', '1150', '2');
INSERT INTO `EntidadeREL` VALUES ('1035', '91', '1152', '1');
INSERT INTO `EntidadeREL` VALUES ('1036', '94', '1156', '2');
INSERT INTO `EntidadeREL` VALUES ('1037', '94', '1156', '2');
INSERT INTO `EntidadeREL` VALUES ('1038', '95', '1158', '2');
INSERT INTO `EntidadeREL` VALUES ('1039', '96', '1159', '2');
INSERT INTO `EntidadeREL` VALUES ('1040', '103', '1167', '2');
INSERT INTO `EntidadeREL` VALUES ('1041', '106', '1170', '1');
INSERT INTO `EntidadeREL` VALUES ('1042', '35', '1180', '1');
INSERT INTO `EntidadeREL` VALUES ('1043', '37', '1182', '1');
INSERT INTO `EntidadeREL` VALUES ('1044', '38', '1183', '1');
INSERT INTO `EntidadeREL` VALUES ('1045', '40', '1186', '2');
INSERT INTO `EntidadeREL` VALUES ('1046', '41', '1188', '2');
INSERT INTO `EntidadeREL` VALUES ('1047', '42', '1189', '2');
INSERT INTO `EntidadeREL` VALUES ('1048', '44', '1192', '2');
INSERT INTO `EntidadeREL` VALUES ('1049', '45', '1193', '1');
INSERT INTO `EntidadeREL` VALUES ('1050', '46', '1195', '2');
INSERT INTO `EntidadeREL` VALUES ('1051', '47', '1196', '2');
INSERT INTO `EntidadeREL` VALUES ('1052', '49', '1198', '1');
INSERT INTO `EntidadeREL` VALUES ('1053', '54', '1203', '1');
INSERT INTO `EntidadeREL` VALUES ('1054', '54', '1203', '1');
INSERT INTO `EntidadeREL` VALUES ('1055', '65', '1214', '2');
INSERT INTO `EntidadeREL` VALUES ('1056', '70', '1221', '2');
INSERT INTO `EntidadeREL` VALUES ('1057', '74', '1225', '1');
INSERT INTO `EntidadeREL` VALUES ('1058', '980', '1227', '8');
INSERT INTO `EntidadeREL` VALUES ('1059', '202', '1050', '2');
INSERT INTO `EntidadeREL` VALUES ('1060', '216', '1031', '2');
INSERT INTO `EntidadeREL` VALUES ('1061', '1507', '1508', '2');
INSERT INTO `EntidadeREL` VALUES ('1062', '1507', '1509', '1');
INSERT INTO `EntidadeREL` VALUES ('1063', '1510', '1511', '2');
INSERT INTO `EntidadeREL` VALUES ('1064', '1510', '1512', '1');
INSERT INTO `EntidadeREL` VALUES ('1065', '1408', '1410', '2');
INSERT INTO `EntidadeREL` VALUES ('1066', '22', '1256', '2');
INSERT INTO `EntidadeREL` VALUES ('1067', '17', '1247', '2');
INSERT INTO `EntidadeREL` VALUES ('1068', '12', '1235', '2');
INSERT INTO `EntidadeREL` VALUES ('1069', '11', '1233', '2');
INSERT INTO `EntidadeREL` VALUES ('1070', '21', '1254', '2');
INSERT INTO `EntidadeREL` VALUES ('1071', '1519', '1520', '2');
INSERT INTO `EntidadeREL` VALUES ('1072', '1519', '1521', '9');
INSERT INTO `EntidadeREL` VALUES ('1073', '129', '1122', '2');
INSERT INTO `EntidadeREL` VALUES ('1074', '1522', '1523', '1');
INSERT INTO `EntidadeREL` VALUES ('1075', '1522', '1524', '2');
INSERT INTO `EntidadeREL` VALUES ('1076', '1522', '1524', '2');
INSERT INTO `EntidadeREL` VALUES ('1077', '1525', '1526', '1');
INSERT INTO `EntidadeREL` VALUES ('1078', '1525', '1527', '2');
INSERT INTO `EntidadeREL` VALUES ('1079', '1528', '1529', '2');
INSERT INTO `EntidadeREL` VALUES ('1080', '1528', '1530', '1');
INSERT INTO `EntidadeREL` VALUES ('1082', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('1083', '140', '997', '2');
INSERT INTO `EntidadeREL` VALUES ('1084', '1282', '1284', '1');
INSERT INTO `EntidadeREL` VALUES ('1085', '1288', '1290', '2');
INSERT INTO `EntidadeREL` VALUES ('1086', '1405', '1407', '1');
INSERT INTO `EntidadeREL` VALUES ('1087', '1501', '1503', '1');
INSERT INTO `EntidadeREL` VALUES ('1088', '1', '993', '2');
INSERT INTO `EntidadeREL` VALUES ('1089', '11', '1233', '2');
INSERT INTO `EntidadeREL` VALUES ('1090', '12', '1235', '2');
INSERT INTO `EntidadeREL` VALUES ('1091', '15', '1241', '2');
INSERT INTO `EntidadeREL` VALUES ('1092', '16', '1245', '2');
INSERT INTO `EntidadeREL` VALUES ('1093', '17', '1247', '2');
INSERT INTO `EntidadeREL` VALUES ('1094', '21', '1254', '2');
INSERT INTO `EntidadeREL` VALUES ('1095', '22', '1256', '2');
INSERT INTO `EntidadeREL` VALUES ('1096', '23', '1258', '2');
INSERT INTO `EntidadeREL` VALUES ('1097', '23', '1258', '2');
INSERT INTO `EntidadeREL` VALUES ('1098', '36', '1181', '2');
INSERT INTO `EntidadeREL` VALUES ('1099', '39', '1184', '2');
INSERT INTO `EntidadeREL` VALUES ('1100', '79', '958', '2');
INSERT INTO `EntidadeREL` VALUES ('1101', '1348', '1350', '2');
INSERT INTO `EntidadeREL` VALUES ('1102', '88', '1148', '2');
INSERT INTO `EntidadeREL` VALUES ('1103', '92', '1153', '2');
INSERT INTO `EntidadeREL` VALUES ('1104', '1319', '1321', '2');
INSERT INTO `EntidadeREL` VALUES ('1105', '1319', '1321', '2');
INSERT INTO `EntidadeREL` VALUES ('1106', '1271', '1273', '2');
INSERT INTO `EntidadeREL` VALUES ('1107', '93', '1154', '1');
INSERT INTO `EntidadeREL` VALUES ('1108', '80', '1138', '2');
INSERT INTO `EntidadeREL` VALUES ('1109', '81', '1139', '1');
INSERT INTO `EntidadeREL` VALUES ('1110', '83', '1141', '2');
INSERT INTO `EntidadeREL` VALUES ('1111', '82', '1140', '2');
INSERT INTO `EntidadeREL` VALUES ('1112', '90', '1260', '2');
INSERT INTO `EntidadeREL` VALUES ('1113', '78', '1137', '1');
INSERT INTO `EntidadeREL` VALUES ('1114', '58', '1207', '1');
INSERT INTO `EntidadeREL` VALUES ('1115', '67', '1217', '1');
INSERT INTO `EntidadeREL` VALUES ('1116', '52', '1201', '2');
INSERT INTO `EntidadeREL` VALUES ('1117', '1411', '1413', '2');
INSERT INTO `EntidadeREL` VALUES ('1118', '50', '1199', '1');
INSERT INTO `EntidadeREL` VALUES ('1119', '60', '1209', '1');
INSERT INTO `EntidadeREL` VALUES ('1120', '55', '1204', '1');
INSERT INTO `EntidadeREL` VALUES ('1121', '1303', '1305', '2');
INSERT INTO `EntidadeREL` VALUES ('1122', '73', '1224', '2');
INSERT INTO `EntidadeREL` VALUES ('1123', '1504', '1506', '2');
INSERT INTO `EntidadeREL` VALUES ('1124', '62', '1211', '2');
INSERT INTO `EntidadeREL` VALUES ('1125', '72', '1223', '1');
INSERT INTO `EntidadeREL` VALUES ('1126', '63', '1212', '1');
INSERT INTO `EntidadeREL` VALUES ('1127', '61', '1210', '1');
INSERT INTO `EntidadeREL` VALUES ('1128', '1374', '1376', '2');
INSERT INTO `EntidadeREL` VALUES ('1129', '50', '1199', '1');
INSERT INTO `EntidadeREL` VALUES ('1130', '71', '1222', '2');
INSERT INTO `EntidadeREL` VALUES ('1131', '63', '1212', '1');
INSERT INTO `EntidadeREL` VALUES ('1132', '1558', '1559', '2');
INSERT INTO `EntidadeREL` VALUES ('1133', '1558', '1560', '1');
INSERT INTO `EntidadeREL` VALUES ('1134', '1558', '1560', '1');
INSERT INTO `EntidadeREL` VALUES ('1135', '1561', '1562', '1');
INSERT INTO `EntidadeREL` VALUES ('1136', '1561', '1563', '2');
INSERT INTO `EntidadeREL` VALUES ('1137', '119', '1108', '2');
INSERT INTO `EntidadeREL` VALUES ('1138', '123', '1112', '2');
INSERT INTO `EntidadeREL` VALUES ('1139', '120', '1109', '2');
INSERT INTO `EntidadeREL` VALUES ('1140', '122', '1111', '2');
INSERT INTO `EntidadeREL` VALUES ('1141', '129', '1122', '2');
INSERT INTO `EntidadeREL` VALUES ('1142', '1274', '1318', '1');
INSERT INTO `EntidadeREL` VALUES ('1143', '118', '1107', '2');
INSERT INTO `EntidadeREL` VALUES ('1144', '121', '1110', '2');
INSERT INTO `EntidadeREL` VALUES ('1145', '1294', '1296', '2');
INSERT INTO `EntidadeREL` VALUES ('1146', '1368', '1370', '1');
INSERT INTO `EntidadeREL` VALUES ('1147', '134', '1129', '1');
INSERT INTO `EntidadeREL` VALUES ('1148', '1342', '1344', '2');
INSERT INTO `EntidadeREL` VALUES ('1149', '1414', '1416', '2');
INSERT INTO `EntidadeREL` VALUES ('1150', '124', '1113', '1');
INSERT INTO `EntidadeREL` VALUES ('1151', '1564', '1565', '2');
INSERT INTO `EntidadeREL` VALUES ('1152', '1564', '1566', '1');
INSERT INTO `EntidadeREL` VALUES ('1153', '1567', '1568', '1');
INSERT INTO `EntidadeREL` VALUES ('1154', '1567', '1569', '2');
INSERT INTO `EntidadeREL` VALUES ('1155', '1300', '1302', '2');
INSERT INTO `EntidadeREL` VALUES ('1156', '1571', '1572', '2');
INSERT INTO `EntidadeREL` VALUES ('1157', '1571', '1573', '1');
INSERT INTO `EntidadeREL` VALUES ('1158', '100', '1163', '2');
INSERT INTO `EntidadeREL` VALUES ('1159', '107', '1171', '1');
INSERT INTO `EntidadeREL` VALUES ('1160', '107', '1171', '1');
INSERT INTO `EntidadeREL` VALUES ('1161', '109', '1173', '2');
INSERT INTO `EntidadeREL` VALUES ('1162', '105', '1169', '1');
INSERT INTO `EntidadeREL` VALUES ('1163', '99', '1162', '2');
INSERT INTO `EntidadeREL` VALUES ('1164', '1377', '1379', '1');
INSERT INTO `EntidadeREL` VALUES ('1165', '1297', '1299', '2');
INSERT INTO `EntidadeREL` VALUES ('1166', '102', '1165', '2');
INSERT INTO `EntidadeREL` VALUES ('1167', '101', '1164', '2');
INSERT INTO `EntidadeREL` VALUES ('1168', '1380', '1382', '2');
INSERT INTO `EntidadeREL` VALUES ('1169', '1336', '1338', '1');
INSERT INTO `EntidadeREL` VALUES ('1170', '108', '1172', '1');
INSERT INTO `EntidadeREL` VALUES ('1171', '1574', '1575', '2');
INSERT INTO `EntidadeREL` VALUES ('1172', '1574', '1576', '1');
INSERT INTO `EntidadeREL` VALUES ('1173', '1577', '1578', '2');
INSERT INTO `EntidadeREL` VALUES ('1174', '1577', '1579', '1');
INSERT INTO `EntidadeREL` VALUES ('1175', '141', '976', '2');
INSERT INTO `EntidadeREL` VALUES ('1176', '153', '1008', '1');
INSERT INTO `EntidadeREL` VALUES ('1177', '142', '998', '1');
INSERT INTO `EntidadeREL` VALUES ('1178', '158', '1013', '2');
INSERT INTO `EntidadeREL` VALUES ('1179', '137', '995', '2');
INSERT INTO `EntidadeREL` VALUES ('1180', '154', '1009', '2');
INSERT INTO `EntidadeREL` VALUES ('1181', '149', '1005', '2');
INSERT INTO `EntidadeREL` VALUES ('1182', '144', '1000', '2');
INSERT INTO `EntidadeREL` VALUES ('1183', '145', '1002', '2');
INSERT INTO `EntidadeREL` VALUES ('1184', '136', '994', '2');
INSERT INTO `EntidadeREL` VALUES ('1185', '151', '1007', '2');
INSERT INTO `EntidadeREL` VALUES ('1186', '148', '1001', '1');
INSERT INTO `EntidadeREL` VALUES ('1187', '147', '1004', '2');
INSERT INTO `EntidadeREL` VALUES ('1188', '146', '1003', '2');
INSERT INTO `EntidadeREL` VALUES ('1189', '157', '1012', '1');
INSERT INTO `EntidadeREL` VALUES ('1190', '159', '1014', '2');
INSERT INTO `EntidadeREL` VALUES ('1191', '159', '1014', '2');
INSERT INTO `EntidadeREL` VALUES ('1192', '160', '1015', '2');
INSERT INTO `EntidadeREL` VALUES ('1193', '150', '1006', '1');
INSERT INTO `EntidadeREL` VALUES ('1194', '156', '1011', '2');
INSERT INTO `EntidadeREL` VALUES ('1195', '1405', '1407', '1');
INSERT INTO `EntidadeREL` VALUES ('1196', '1405', '1407', '1');
INSERT INTO `EntidadeREL` VALUES ('1197', '1580', '1581', '1');
INSERT INTO `EntidadeREL` VALUES ('1198', '1580', '1582', '2');
INSERT INTO `EntidadeREL` VALUES ('1199', '1583', '1584', '1');
INSERT INTO `EntidadeREL` VALUES ('1200', '1583', '1585', '2');
INSERT INTO `EntidadeREL` VALUES ('1201', '1586', '1587', '1');
INSERT INTO `EntidadeREL` VALUES ('1202', '1588', '1589', '1');
INSERT INTO `EntidadeREL` VALUES ('1203', '1588', '1590', '2');
INSERT INTO `EntidadeREL` VALUES ('1204', '1591', '1592', '1');
INSERT INTO `EntidadeREL` VALUES ('1205', '1591', '1593', '2');
INSERT INTO `EntidadeREL` VALUES ('1206', '1594', '1595', '2');
INSERT INTO `EntidadeREL` VALUES ('1207', '1594', '1596', '1');
INSERT INTO `EntidadeREL` VALUES ('1208', '161', '1078', '2');
INSERT INTO `EntidadeREL` VALUES ('1209', '1306', '1308', '1');
INSERT INTO `EntidadeREL` VALUES ('1210', '172', '1089', '1');
INSERT INTO `EntidadeREL` VALUES ('1211', '173', '1090', '2');
INSERT INTO `EntidadeREL` VALUES ('1212', '1312', '1314', '2');
INSERT INTO `EntidadeREL` VALUES ('1213', '169', '1086', '1');
INSERT INTO `EntidadeREL` VALUES ('1214', '174', '1091', '2');
INSERT INTO `EntidadeREL` VALUES ('1215', '1597', '1598', '1');
INSERT INTO `EntidadeREL` VALUES ('1216', '1597', '1599', '2');
INSERT INTO `EntidadeREL` VALUES ('1217', '175', '1092', '2');
INSERT INTO `EntidadeREL` VALUES ('1218', '178', '1095', '1');
INSERT INTO `EntidadeREL` VALUES ('1219', '162', '1079', '1');
INSERT INTO `EntidadeREL` VALUES ('1220', '168', '1085', '1');
INSERT INTO `EntidadeREL` VALUES ('1221', '181', '1098', '2');
INSERT INTO `EntidadeREL` VALUES ('1222', '180', '1097', '1');
INSERT INTO `EntidadeREL` VALUES ('1223', '171', '1088', '2');
INSERT INTO `EntidadeREL` VALUES ('1224', '1600', '1601', '2');
INSERT INTO `EntidadeREL` VALUES ('1225', '1600', '1602', '1');
INSERT INTO `EntidadeREL` VALUES ('1226', '1603', '1604', '2');
INSERT INTO `EntidadeREL` VALUES ('1227', '1603', '1605', '1');
INSERT INTO `EntidadeREL` VALUES ('1228', '1259', '1260', '1');
INSERT INTO `EntidadeREL` VALUES ('1229', '191', '1073', '2');
INSERT INTO `EntidadeREL` VALUES ('1230', '1393', '1395', '2');
INSERT INTO `EntidadeREL` VALUES ('1231', '188', '1070', '1');
INSERT INTO `EntidadeREL` VALUES ('1232', '192', '1074', '2');
INSERT INTO `EntidadeREL` VALUES ('1233', '195', '1077', '2');
INSERT INTO `EntidadeREL` VALUES ('1234', '1285', '1287', '1');
INSERT INTO `EntidadeREL` VALUES ('1235', '1435', '1437', '1');
INSERT INTO `EntidadeREL` VALUES ('1236', '189', '1071', '2');
INSERT INTO `EntidadeREL` VALUES ('1237', '194', '1076', '2');
INSERT INTO `EntidadeREL` VALUES ('1238', '184', '1066', '1');
INSERT INTO `EntidadeREL` VALUES ('1239', '1262', '1264', '2');
INSERT INTO `EntidadeREL` VALUES ('1240', '193', '1075', '2');
INSERT INTO `EntidadeREL` VALUES ('1241', '190', '1072', '2');
INSERT INTO `EntidadeREL` VALUES ('1242', '190', '1072', '2');
INSERT INTO `EntidadeREL` VALUES ('1243', '1606', '1607', '1');
INSERT INTO `EntidadeREL` VALUES ('1244', '1606', '1608', '2');
INSERT INTO `EntidadeREL` VALUES ('1245', '1609', '1610', '1');
INSERT INTO `EntidadeREL` VALUES ('1246', '1609', '1611', '2');
INSERT INTO `EntidadeREL` VALUES ('1247', '1612', '1613', '1');
INSERT INTO `EntidadeREL` VALUES ('1248', '1612', '1614', '2');
INSERT INTO `EntidadeREL` VALUES ('1249', '1339', '1341', '2');
INSERT INTO `EntidadeREL` VALUES ('1250', '1474', '1476', '2');
INSERT INTO `EntidadeREL` VALUES ('1251', '1417', '1419', '2');
INSERT INTO `EntidadeREL` VALUES ('1252', '203', '1051', '2');
INSERT INTO `EntidadeREL` VALUES ('1253', '212', '1061', '1');
INSERT INTO `EntidadeREL` VALUES ('1254', '205', '1053', '2');
INSERT INTO `EntidadeREL` VALUES ('1255', '1322', '1324', '2');
INSERT INTO `EntidadeREL` VALUES ('1256', '198', '1046', '2');
INSERT INTO `EntidadeREL` VALUES ('1257', '207', '1055', '2');
INSERT INTO `EntidadeREL` VALUES ('1258', '196', '1044', '2');
INSERT INTO `EntidadeREL` VALUES ('1259', '1432', '1434', '1');
INSERT INTO `EntidadeREL` VALUES ('1260', '206', '1054', '1');
INSERT INTO `EntidadeREL` VALUES ('1261', '1276', '1278', '2');
INSERT INTO `EntidadeREL` VALUES ('1262', '1498', '1500', '2');
INSERT INTO `EntidadeREL` VALUES ('1263', '210', '1059', '2');
INSERT INTO `EntidadeREL` VALUES ('1264', '201', '1049', '1');
INSERT INTO `EntidadeREL` VALUES ('1265', '213', '1062', '1');
INSERT INTO `EntidadeREL` VALUES ('1266', '1429', '1431', '2');
INSERT INTO `EntidadeREL` VALUES ('1267', '1291', '1293', '2');
INSERT INTO `EntidadeREL` VALUES ('1268', '200', '1048', '2');
INSERT INTO `EntidadeREL` VALUES ('1269', '197', '1045', '2');
INSERT INTO `EntidadeREL` VALUES ('1270', '1615', '1616', '2');
INSERT INTO `EntidadeREL` VALUES ('1271', '1615', '1617', '1');
INSERT INTO `EntidadeREL` VALUES ('1272', '211', '1060', '2');
INSERT INTO `EntidadeREL` VALUES ('1273', '1618', '1619', '1');
INSERT INTO `EntidadeREL` VALUES ('1274', '1618', '1620', '2');
INSERT INTO `EntidadeREL` VALUES ('1275', '1621', '1622', '2');
INSERT INTO `EntidadeREL` VALUES ('1276', '1621', '1623', '1');
INSERT INTO `EntidadeREL` VALUES ('1277', '1624', '1625', '2');
INSERT INTO `EntidadeREL` VALUES ('1278', '1624', '1626', '1');
INSERT INTO `EntidadeREL` VALUES ('1279', '1580', '1582', '2');
INSERT INTO `EntidadeREL` VALUES ('1280', '1405', '1407', '1');
INSERT INTO `EntidadeREL` VALUES ('1281', '1583', '1585', '2');
INSERT INTO `EntidadeREL` VALUES ('1282', '1444', '1446', '2');
INSERT INTO `EntidadeREL` VALUES ('1283', '1627', '1628', '1');
INSERT INTO `EntidadeREL` VALUES ('1284', '1627', '1629', '2');
INSERT INTO `EntidadeREL` VALUES ('1285', '1627', '1629', '2');
INSERT INTO `EntidadeREL` VALUES ('1286', '1630', '1631', '1');
INSERT INTO `EntidadeREL` VALUES ('1287', '1630', '1632', '2');
INSERT INTO `EntidadeREL` VALUES ('1288', '1402', '1404', '2');
INSERT INTO `EntidadeREL` VALUES ('1289', '221', '1041', '2');
INSERT INTO `EntidadeREL` VALUES ('1290', '217', '1033', '1');
INSERT INTO `EntidadeREL` VALUES ('1291', '219', '1037', '2');
INSERT INTO `EntidadeREL` VALUES ('1292', '214', '1027', '2');
INSERT INTO `EntidadeREL` VALUES ('1293', '1389', '1391', '2');
INSERT INTO `EntidadeREL` VALUES ('1294', '220', '1039', '1');
INSERT INTO `EntidadeREL` VALUES ('1295', '222', '1043', '2');
INSERT INTO `EntidadeREL` VALUES ('1296', '215', '1029', '2');
INSERT INTO `EntidadeREL` VALUES ('1297', '1528', '1530', '1');
INSERT INTO `EntidadeREL` VALUES ('1298', '1315', '1317', '2');
INSERT INTO `EntidadeREL` VALUES ('1299', '1468', '1470', '1');
INSERT INTO `EntidadeREL` VALUES ('1300', '1633', '1634', '1');
INSERT INTO `EntidadeREL` VALUES ('1301', '1633', '1635', '2');
INSERT INTO `EntidadeREL` VALUES ('1302', '1636', '1637', '2');
INSERT INTO `EntidadeREL` VALUES ('1303', '1636', '1638', '1');
INSERT INTO `EntidadeREL` VALUES ('1304', '1639', '1640', '2');
INSERT INTO `EntidadeREL` VALUES ('1305', '1525', '1527', '2');
INSERT INTO `EntidadeREL` VALUES ('1306', '1408', '1410', '2');
INSERT INTO `EntidadeREL` VALUES ('1307', '978', '1226', '2');
INSERT INTO `EntidadeREL` VALUES ('1308', '48', '1197', '2');
INSERT INTO `EntidadeREL` VALUES ('1309', '43', '1191', '2');
INSERT INTO `EntidadeREL` VALUES ('1310', '34', '1179', '9');
INSERT INTO `EntidadeREL` VALUES ('1311', '1522', '1524', '2');
INSERT INTO `EntidadeREL` VALUES ('1312', '1495', '1497', '2');
INSERT INTO `EntidadeREL` VALUES ('1313', '1438', '1440', '2');
INSERT INTO `EntidadeREL` VALUES ('1314', '1383', '1385', '1');
INSERT INTO `EntidadeREL` VALUES ('1315', '1345', '1347', '1');
INSERT INTO `EntidadeREL` VALUES ('1316', '69', '1219', '2');
INSERT INTO `EntidadeREL` VALUES ('1317', '68', '1218', '1');
INSERT INTO `EntidadeREL` VALUES ('1318', '66', '1216', '2');
INSERT INTO `EntidadeREL` VALUES ('1319', '64', '1213', '1');
INSERT INTO `EntidadeREL` VALUES ('1320', '59', '1208', '2');
INSERT INTO `EntidadeREL` VALUES ('1321', '57', '1206', '2');
INSERT INTO `EntidadeREL` VALUES ('1322', '56', '1205', '1');
INSERT INTO `EntidadeREL` VALUES ('1323', '86', '1145', '2');
INSERT INTO `EntidadeREL` VALUES ('1324', '1386', '1388', '1');
INSERT INTO `EntidadeREL` VALUES ('1325', '1325', '1327', '2');
INSERT INTO `EntidadeREL` VALUES ('1326', '135', '1130', '2');
INSERT INTO `EntidadeREL` VALUES ('1327', '131', '1124', '2');
INSERT INTO `EntidadeREL` VALUES ('1328', '116', '1102', '2');
INSERT INTO `EntidadeREL` VALUES ('1329', '114', '1178', '2');
INSERT INTO `EntidadeREL` VALUES ('1330', '113', '1177', '2');
INSERT INTO `EntidadeREL` VALUES ('1331', '111', '1175', '2');
INSERT INTO `EntidadeREL` VALUES ('1332', '110', '1174', '2');
INSERT INTO `EntidadeREL` VALUES ('1333', '104', '1168', '2');
INSERT INTO `EntidadeREL` VALUES ('1334', '100', '1163', '2');
INSERT INTO `EntidadeREL` VALUES ('1335', '98', '1161', '2');
INSERT INTO `EntidadeREL` VALUES ('1336', '97', '1160', '2');
INSERT INTO `EntidadeREL` VALUES ('1337', '163', '1080', '2');
INSERT INTO `EntidadeREL` VALUES ('1338', '170', '1087', '2');
INSERT INTO `EntidadeREL` VALUES ('1339', '176', '1093', '2');
INSERT INTO `EntidadeREL` VALUES ('1340', '177', '1094', '2');
INSERT INTO `EntidadeREL` VALUES ('1341', '179', '1096', '2');
INSERT INTO `EntidadeREL` VALUES ('1342', '1265', '1267', '2');
INSERT INTO `EntidadeREL` VALUES ('1343', '1371', '1373', '1');
INSERT INTO `EntidadeREL` VALUES ('1344', '1462', '1464', '1');
INSERT INTO `EntidadeREL` VALUES ('1345', '186', '1068', '1');
INSERT INTO `EntidadeREL` VALUES ('1346', '187', '1069', '2');
INSERT INTO `EntidadeREL` VALUES ('1347', '1396', '1398', '2');
INSERT INTO `EntidadeREL` VALUES ('1348', '1456', '1458', '2');
INSERT INTO `EntidadeREL` VALUES ('1349', '209', '1058', '2');
INSERT INTO `EntidadeREL` VALUES ('1350', '1365', '1367', '1');
INSERT INTO `EntidadeREL` VALUES ('1351', '223', '1017', '2');
INSERT INTO `EntidadeREL` VALUES ('1352', '1510', '1512', '1');
INSERT INTO `EntidadeREL` VALUES ('1353', '1268', '1270', '2');
INSERT INTO `EntidadeREL` VALUES ('1354', '1630', '1632', '2');
INSERT INTO `EntidadeREL` VALUES ('1355', '1399', '1401', '2');
INSERT INTO `EntidadeREL` VALUES ('1356', '1453', '1455', '2');
INSERT INTO `EntidadeREL` VALUES ('1357', '1507', '1509', '1');
INSERT INTO `EntidadeREL` VALUES ('1358', '1641', '1642', '2');
INSERT INTO `EntidadeREL` VALUES ('1359', '1641', '1643', '1');
INSERT INTO `EntidadeREL` VALUES ('1360', '1644', '1645', '1');
INSERT INTO `EntidadeREL` VALUES ('1361', '1644', '1646', '2');
INSERT INTO `EntidadeREL` VALUES ('1362', '1647', '1648', '2');
INSERT INTO `EntidadeREL` VALUES ('1363', '1649', '1650', '2');
INSERT INTO `EntidadeREL` VALUES ('1364', '1651', '1652', '2');
INSERT INTO `EntidadeREL` VALUES ('1365', '1651', '1653', '1');
INSERT INTO `EntidadeREL` VALUES ('1366', '1654', '1655', '2');
INSERT INTO `EntidadeREL` VALUES ('1367', '1656', '1657', '2');
INSERT INTO `EntidadeREL` VALUES ('1368', '1656', '1658', '2');
INSERT INTO `EntidadeREL` VALUES ('1369', '1279', '1281', '1');
INSERT INTO `EntidadeREL` VALUES ('1370', '1465', '1467', '1');
INSERT INTO `EntidadeREL` VALUES ('1371', '1659', '1660', '1');
INSERT INTO `EntidadeREL` VALUES ('1372', '1659', '1661', '2');
INSERT INTO `EntidadeREL` VALUES ('1373', '1662', '1663', '1');
INSERT INTO `EntidadeREL` VALUES ('1374', '1662', '1664', '2');
INSERT INTO `EntidadeREL` VALUES ('1375', '1665', '1666', '1');
INSERT INTO `EntidadeREL` VALUES ('1376', '1665', '1667', '2');
INSERT INTO `EntidadeREL` VALUES ('1377', '1668', '1669', '2');
INSERT INTO `EntidadeREL` VALUES ('1378', '1668', '1670', '1');
INSERT INTO `EntidadeREL` VALUES ('1379', '1671', '1672', '2');
INSERT INTO `EntidadeREL` VALUES ('1380', '1671', '1673', '1');
INSERT INTO `EntidadeREL` VALUES ('1381', '1300', '1302', '2');
INSERT INTO `EntidadeREL` VALUES ('1382', '78', '1137', '1');
INSERT INTO `EntidadeREL` VALUES ('1383', '1674', '1675', '2');
INSERT INTO `EntidadeREL` VALUES ('1384', '141', '976', '2');
INSERT INTO `EntidadeREL` VALUES ('1385', '1677', '1678', '1');
INSERT INTO `EntidadeREL` VALUES ('1386', '1677', '1679', '2');
INSERT INTO `EntidadeREL` VALUES ('1387', '1677', '1680', '1');
INSERT INTO `EntidadeREL` VALUES ('1388', '1677', '1681', '2');
INSERT INTO `EntidadeREL` VALUES ('1389', '1682', '1683', '1');
INSERT INTO `EntidadeREL` VALUES ('1390', '1682', '1684', '2');
INSERT INTO `EntidadeREL` VALUES ('1391', '1685', '1686', '1');
INSERT INTO `EntidadeREL` VALUES ('1392', '1685', '1687', '2');
INSERT INTO `EntidadeREL` VALUES ('1393', '1688', '1689', '1');
INSERT INTO `EntidadeREL` VALUES ('1394', '1688', '1690', '2');
INSERT INTO `EntidadeREL` VALUES ('1395', '1691', '1692', '1');
INSERT INTO `EntidadeREL` VALUES ('1396', '1691', '1693', '2');
INSERT INTO `EntidadeREL` VALUES ('1397', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('1398', '139', '996', '1');
INSERT INTO `EntidadeREL` VALUES ('1399', '44', '1192', '2');

-- ----------------------------
-- Table structure for EntidadeResp_Escalao
-- ----------------------------
DROP TABLE IF EXISTS `EntidadeResp_Escalao`;
CREATE TABLE `EntidadeResp_Escalao` (
  `ID_Entidade` int(11) NOT NULL,
  `ID_Escalao` int(11) NOT NULL,
  PRIMARY KEY (`ID_Entidade`,`ID_Escalao`),
  KEY `IDX_186E8F2B8345E416` (`ID_Entidade`),
  KEY `IDX_186E8F2BA8F65B5C` (`ID_Escalao`),
  CONSTRAINT `FK_186E8F2B8345E416` FOREIGN KEY (`ID_Entidade`) REFERENCES `Entidade` (`ID_Entidade`),
  CONSTRAINT `FK_186E8F2BA8F65B5C` FOREIGN KEY (`ID_Escalao`) REFERENCES `Escalao` (`ID_Escalao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of EntidadeResp_Escalao
-- ----------------------------
INSERT INTO `EntidadeResp_Escalao` VALUES ('976', '4');

-- ----------------------------
-- Table structure for Epoca
-- ----------------------------
DROP TABLE IF EXISTS `Epoca`;
CREATE TABLE `Epoca` (
  `ID_epoca` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DataInicio` date NOT NULL,
  `DataFim` date NOT NULL,
  PRIMARY KEY (`ID_epoca`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Epoca
-- ----------------------------
INSERT INTO `Epoca` VALUES ('2', '2016-2017', '2016-07-01', '2017-06-23');
INSERT INTO `Epoca` VALUES ('3', '2017-2018', '2017-06-24', '2018-06-19');
INSERT INTO `Epoca` VALUES ('4', '2018-2019', '2018-06-19', '2019-06-20');
INSERT INTO `Epoca` VALUES ('5', '2019-2020', '2019-06-21', '2020-06-20');

-- ----------------------------
-- Table structure for EquipaJogo
-- ----------------------------
DROP TABLE IF EXISTS `EquipaJogo`;
CREATE TABLE `EquipaJogo` (
  `TempoJogado` int(11) NOT NULL DEFAULT '0',
  `ID_Jornada` int(11) NOT NULL,
  `ID_Entidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Jornada`,`ID_Entidade`),
  KEY `IDX_69BC03178345E416` (`ID_Entidade`),
  KEY `IDX_69BC0317BD5E0D20` (`ID_Jornada`),
  CONSTRAINT `FK_69BC03178345E416` FOREIGN KEY (`ID_Entidade`) REFERENCES `Entidade` (`ID_Entidade`),
  CONSTRAINT `FK_69BC0317BD5E0D20` FOREIGN KEY (`ID_Jornada`) REFERENCES `Jornada` (`ID_Jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of EquipaJogo
-- ----------------------------

-- ----------------------------
-- Table structure for Equipamento
-- ----------------------------
DROP TABLE IF EXISTS `Equipamento`;
CREATE TABLE `Equipamento` (
  `ID_equipamento` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Numero` int(11) NOT NULL,
  `REF_Tamanho` int(11) DEFAULT NULL,
  `observacoes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`ID_equipamento`),
  KEY `IDX_360E49E5D622CB87` (`REF_Tamanho`),
  CONSTRAINT `FK_360E49E5D622CB87` FOREIGN KEY (`REF_Tamanho`) REFERENCES `Tamanho` (`ID_Tamanho`)
) ENGINE=InnoDB AUTO_INCREMENT=324 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Equipamento
-- ----------------------------
INSERT INTO `Equipamento` VALUES ('2', 'Alex', '7', '10', null);
INSERT INTO `Equipamento` VALUES ('3', 'Santi', '10', '9', null);
INSERT INTO `Equipamento` VALUES ('4', 'Tony', '70', '10', null);
INSERT INTO `Equipamento` VALUES ('5', 'Moreira', '98', '3', null);
INSERT INTO `Equipamento` VALUES ('6', 'Afonso Couto', '17', '8', null);
INSERT INTO `Equipamento` VALUES ('7', 'Pedro Couto', '17', '8', null);
INSERT INTO `Equipamento` VALUES ('8', 'J. Penajóia', '53', '9', null);
INSERT INTO `Equipamento` VALUES ('9', 'Ricardinho', '40', '10', null);
INSERT INTO `Equipamento` VALUES ('10', 'Tiago Vieira', '20', '8', null);
INSERT INTO `Equipamento` VALUES ('11', 'Vieira', '12', '2', 'Guarda Redes');
INSERT INTO `Equipamento` VALUES ('12', 'Rúben Teques', '10', '9', null);
INSERT INTO `Equipamento` VALUES ('13', 'Lálu', '93', '10', null);
INSERT INTO `Equipamento` VALUES ('14', 'G. Marques', '9', '9', null);
INSERT INTO `Equipamento` VALUES ('15', 'M. Almeida', '17', '3', null);
INSERT INTO `Equipamento` VALUES ('16', 'Gonçalo A.', '11', '3', null);
INSERT INTO `Equipamento` VALUES ('18', 'Almeida', '17', '10', null);
INSERT INTO `Equipamento` VALUES ('19', 'José Carlos', '7', '9', null);
INSERT INTO `Equipamento` VALUES ('20', 'Lucas', '11', '9', null);
INSERT INTO `Equipamento` VALUES ('21', 'Bruno', '4', '3', null);
INSERT INTO `Equipamento` VALUES ('22', 'Mário Manuel', '8', '3', null);
INSERT INTO `Equipamento` VALUES ('23', 'Tomé', '99', '10', null);
INSERT INTO `Equipamento` VALUES ('25', 'Hugo', '6', '10', null);
INSERT INTO `Equipamento` VALUES ('26', 'Rodrigo', '19', '3', null);
INSERT INTO `Equipamento` VALUES ('27', 'Resende', '6', '2', null);
INSERT INTO `Equipamento` VALUES ('28', 'Simão R.', '90', '11', null);
INSERT INTO `Equipamento` VALUES ('29', 'Gui', '9', '11', null);
INSERT INTO `Equipamento` VALUES ('30', 'Naia', '71', '2', null);
INSERT INTO `Equipamento` VALUES ('31', 'Miguel', '91', '10', null);
INSERT INTO `Equipamento` VALUES ('32', 'Dinis Bandeira', '99', '9', null);
INSERT INTO `Equipamento` VALUES ('33', 'Rodrigo F.', '19', '8', null);
INSERT INTO `Equipamento` VALUES ('34', 'Tomás', '97', '7', null);
INSERT INTO `Equipamento` VALUES ('35', 'Paulo Freire', '59', '8', null);
INSERT INTO `Equipamento` VALUES ('36', 'Dinis Tavares', '77', '9', null);
INSERT INTO `Equipamento` VALUES ('37', 'Castro', '20', '10', null);
INSERT INTO `Equipamento` VALUES ('38', 'Rafa', '42', '8', null);
INSERT INTO `Equipamento` VALUES ('39', 'P. Oliveira', '8', '11', 'img_9255');
INSERT INTO `Equipamento` VALUES ('40', 'G. Lopes', '5', '2', null);
INSERT INTO `Equipamento` VALUES ('41', 'Francisco', '74', '10', 'Guarda Redes');
INSERT INTO `Equipamento` VALUES ('42', 'Daniel', '80', '9', null);
INSERT INTO `Equipamento` VALUES ('43', 'Vieirinha', '3', '11', null);
INSERT INTO `Equipamento` VALUES ('44', 'Salgado', '22', '11', null);
INSERT INTO `Equipamento` VALUES ('45', 'Gil Fonseca', '76', '8', null);
INSERT INTO `Equipamento` VALUES ('46', 'Daniel', '63', '3', null);
INSERT INTO `Equipamento` VALUES ('47', 'Gonçalo R.', '11', '2', null);
INSERT INTO `Equipamento` VALUES ('48', 'Alves', '13', '10', null);
INSERT INTO `Equipamento` VALUES ('49', 'Tiago Rafael', '7', '9', null);
INSERT INTO `Equipamento` VALUES ('50', 'Racel', '97', '2', null);
INSERT INTO `Equipamento` VALUES ('51', 'Simão Cruz', '20', '11', null);
INSERT INTO `Equipamento` VALUES ('52', 'César', '1', '11', 'Guarda Redes');
INSERT INTO `Equipamento` VALUES ('53', 'G. Machado', '2', '2', null);
INSERT INTO `Equipamento` VALUES ('54', 'Fima', '71', '11', null);
INSERT INTO `Equipamento` VALUES ('55', 'Duarte Sousa', '15', '8', null);
INSERT INTO `Equipamento` VALUES ('56', 'Martim G.', '41', '8', null);
INSERT INTO `Equipamento` VALUES ('57', 'Miguel', '6', '8', null);
INSERT INTO `Equipamento` VALUES ('58', 'Leandro R.', '3', '10', null);
INSERT INTO `Equipamento` VALUES ('59', 'Quintas', '25', '11', null);
INSERT INTO `Equipamento` VALUES ('60', 'Duda', '50', '9', null);
INSERT INTO `Equipamento` VALUES ('61', 'João Pedro', '8', '8', null);
INSERT INTO `Equipamento` VALUES ('62', 'Gui Moreira', '1', '10', null);
INSERT INTO `Equipamento` VALUES ('63', 'Tiago Cunha', '45', '2', null);
INSERT INTO `Equipamento` VALUES ('64', 'Vasco', '9', '10', null);
INSERT INTO `Equipamento` VALUES ('65', 'J. Marques', '72', '10', null);
INSERT INTO `Equipamento` VALUES ('66', 'Lando', '56', '3', null);
INSERT INTO `Equipamento` VALUES ('67', 'Diogo Pereira', '16', '11', null);
INSERT INTO `Equipamento` VALUES ('68', 'André Dias', '17', '10', null);
INSERT INTO `Equipamento` VALUES ('69', 'Gui', '87', '2', null);
INSERT INTO `Equipamento` VALUES ('70', 'Toni', '77', '2', null);
INSERT INTO `Equipamento` VALUES ('71', 'A. Costa', '97', '11', null);
INSERT INTO `Equipamento` VALUES ('72', 'Mendonça', '88', '9', null);
INSERT INTO `Equipamento` VALUES ('73', 'B. Martim', '69', '10', null);
INSERT INTO `Equipamento` VALUES ('74', 'Montenegro', '23', '11', null);
INSERT INTO `Equipamento` VALUES ('75', 'Dinis', '14', '7', null);
INSERT INTO `Equipamento` VALUES ('76', 'Gaspar', '13', '7', null);
INSERT INTO `Equipamento` VALUES ('77', 'Duarte', '89', '3', null);
INSERT INTO `Equipamento` VALUES ('78', 'Amaral', '66', '3', null);
INSERT INTO `Equipamento` VALUES ('79', 'Diogo', '99', '3', 'Guarda Redes. Pedir uma camisola extra de manga comprida.');
INSERT INTO `Equipamento` VALUES ('80', 'Tiago Pinto', '85', '10', null);
INSERT INTO `Equipamento` VALUES ('81', 'João Pedro', '77', '11', null);
INSERT INTO `Equipamento` VALUES ('82', 'Santi', '10', '10', null);
INSERT INTO `Equipamento` VALUES ('83', 'Daniel Tavares', '9', '9', null);
INSERT INTO `Equipamento` VALUES ('84', 'David Garcia', '45', '11', null);
INSERT INTO `Equipamento` VALUES ('85', 'João Tomás', '82', '10', null);
INSERT INTO `Equipamento` VALUES ('86', 'Mendonça', '26', '10', null);
INSERT INTO `Equipamento` VALUES ('87', 'Ricardo', '79', '11', null);
INSERT INTO `Equipamento` VALUES ('88', 'Nuno', '4', '9', null);
INSERT INTO `Equipamento` VALUES ('89', 'Xavier Gonçalves', '52', '9', 'Xavier Gonçalves');
INSERT INTO `Equipamento` VALUES ('90', 'Rúben Barge', '60', '3', null);
INSERT INTO `Equipamento` VALUES ('91', 'Bruno R.', '63', '10', null);
INSERT INTO `Equipamento` VALUES ('92', 'Dinis Garcia', '75', '8', null);
INSERT INTO `Equipamento` VALUES ('93', 'Pedro', '92', '3', null);
INSERT INTO `Equipamento` VALUES ('94', 'P. Gonçalo', '1', '3', 'Guarda Redes');
INSERT INTO `Equipamento` VALUES ('95', 'Malafaia', '19', '10', null);
INSERT INTO `Equipamento` VALUES ('96', 'Tomás Pereira', '62', '9', null);
INSERT INTO `Equipamento` VALUES ('97', 'Camões', '72', '10', null);
INSERT INTO `Equipamento` VALUES ('98', 'Santiago C.', '29', '7', null);
INSERT INTO `Equipamento` VALUES ('99', 'Sousa', '73', '3', null);
INSERT INTO `Equipamento` VALUES ('100', 'Martim Paiva', '81', '10', null);
INSERT INTO `Equipamento` VALUES ('101', 'João Carvalho', '30', '2', null);
INSERT INTO `Equipamento` VALUES ('102', 'Costeira', '27', '10', null);
INSERT INTO `Equipamento` VALUES ('103', 'Samuel', '1', '8', null);
INSERT INTO `Equipamento` VALUES ('104', 'Soutinho', '90', '2', null);
INSERT INTO `Equipamento` VALUES ('105', 'Vianinha', '2', '10', null);
INSERT INTO `Equipamento` VALUES ('106', 'A. Neves', '35', '3', null);
INSERT INTO `Equipamento` VALUES ('107', 'Jonas', '21', '10', null);
INSERT INTO `Equipamento` VALUES ('108', 'Afonso', '22', '10', null);
INSERT INTO `Equipamento` VALUES ('109', 'Renato Matos', '84', '11', null);
INSERT INTO `Equipamento` VALUES ('110', 'Manuel', '47', '8', null);
INSERT INTO `Equipamento` VALUES ('111', 'Martim Ribeiro', '82', '8', null);
INSERT INTO `Equipamento` VALUES ('112', 'Afonso', '15', '2', null);
INSERT INTO `Equipamento` VALUES ('113', 'Rica', '12', '10', null);
INSERT INTO `Equipamento` VALUES ('114', 'Nuno Mortágua', '95', '9', null);
INSERT INTO `Equipamento` VALUES ('115', 'M. Matos', '10', '2', null);
INSERT INTO `Equipamento` VALUES ('116', 'Samuca', '24', '10', null);
INSERT INTO `Equipamento` VALUES ('117', 'J. P.', '23', '10', null);
INSERT INTO `Equipamento` VALUES ('118', 'Bandeira', '14', '3', null);
INSERT INTO `Equipamento` VALUES ('119', 'T. Santos', '75', '3', null);
INSERT INTO `Equipamento` VALUES ('120', 'M. Dias', '18', '3', null);
INSERT INTO `Equipamento` VALUES ('121', 'Ivo Valente', '55', '8', null);
INSERT INTO `Equipamento` VALUES ('122', 'M. Pinto', '94', '9', null);
INSERT INTO `Equipamento` VALUES ('123', 'Ivan', '78', '10', null);
INSERT INTO `Equipamento` VALUES ('124', 'Jorge', '47', '2', null);
INSERT INTO `Equipamento` VALUES ('125', 'Gonçalo Botte', '7', '11', null);
INSERT INTO `Equipamento` VALUES ('126', 'Renato', '44', '2', 'Guarda Redes');
INSERT INTO `Equipamento` VALUES ('127', 'Silva', '88', '11', 'Mais uma camisola de manga comprida');
INSERT INTO `Equipamento` VALUES ('128', 'Marcelo', '72', '3', null);
INSERT INTO `Equipamento` VALUES ('129', 'CDE', '4', '3', 'Calção M');
INSERT INTO `Equipamento` VALUES ('130', 'J. Pinho', '16', '3', 'Calção M');
INSERT INTO `Equipamento` VALUES ('131', 'CDE', '20', '2', 'Calção M');
INSERT INTO `Equipamento` VALUES ('132', 'João Correia', '6', '3', 'Calção L');
INSERT INTO `Equipamento` VALUES ('133', 'Pedrito', '91', '3', null);
INSERT INTO `Equipamento` VALUES ('134', 'Jardim', '80', '3', null);
INSERT INTO `Equipamento` VALUES ('135', 'Luís R.', '85', '3', null);
INSERT INTO `Equipamento` VALUES ('136', 'Martim Bila', '6', '9', null);
INSERT INTO `Equipamento` VALUES ('137', 'André Silva', '8', '3', null);
INSERT INTO `Equipamento` VALUES ('138', 'CDE', '14', '4', null);
INSERT INTO `Equipamento` VALUES ('139', 'Rafa', '5', '9', null);
INSERT INTO `Equipamento` VALUES ('140', 'Rui F.', '22', '11', null);
INSERT INTO `Equipamento` VALUES ('141', 'M. Laranjeira', '66', '10', null);
INSERT INTO `Equipamento` VALUES ('142', 'Pitagralho', '85', '10', null);
INSERT INTO `Equipamento` VALUES ('143', 'Lourenço', '80', '10', null);
INSERT INTO `Equipamento` VALUES ('144', 'Alves', '89', '11', null);
INSERT INTO `Equipamento` VALUES ('145', 'José Castaño', '88', '8', 'O nome do atleta é José Castaño');
INSERT INTO `Equipamento` VALUES ('146', 'Samuel', '1', '8', null);
INSERT INTO `Equipamento` VALUES ('147', 'Marcinho', '51', '2', null);
INSERT INTO `Equipamento` VALUES ('148', 'D. Pereira', '31', '3', null);
INSERT INTO `Equipamento` VALUES ('149', 'David', '99', '11', null);
INSERT INTO `Equipamento` VALUES ('150', 'Duda', '25', '11', null);
INSERT INTO `Equipamento` VALUES ('151', 'CDE', '2', '2', 'calção M');
INSERT INTO `Equipamento` VALUES ('152', 'CDE', '3', '1', null);
INSERT INTO `Equipamento` VALUES ('153', 'CDE', '17', '3', null);
INSERT INTO `Equipamento` VALUES ('154', 'CDE', '23', '2', null);
INSERT INTO `Equipamento` VALUES ('155', 'CDE', '18', '5', null);
INSERT INTO `Equipamento` VALUES ('156', 'CDE', '81', '4', 'calção XL');
INSERT INTO `Equipamento` VALUES ('157', 'CDE', '7', '3', null);
INSERT INTO `Equipamento` VALUES ('158', 'CDE', '1', '5', null);
INSERT INTO `Equipamento` VALUES ('159', 'CDE', '10', '2', 'calção M');
INSERT INTO `Equipamento` VALUES ('160', 'R. Fazenda', '3', '2', 'calção M');
INSERT INTO `Equipamento` VALUES ('161', 'CDE', '28', '3', 'calção L');
INSERT INTO `Equipamento` VALUES ('162', 'Gonçalo Horto', '10', '4', null);
INSERT INTO `Equipamento` VALUES ('163', 'Dany', '75', '10', null);
INSERT INTO `Equipamento` VALUES ('164', 'Miguelito', '33', '11', null);
INSERT INTO `Equipamento` VALUES ('165', 'Silva', '28', '3', null);
INSERT INTO `Equipamento` VALUES ('166', 'Diogo F.', '50', '11', null);
INSERT INTO `Equipamento` VALUES ('167', 'Miguel Reis', '24', '8', null);
INSERT INTO `Equipamento` VALUES ('168', 'Gonçalo F.', '6', '8', null);
INSERT INTO `Equipamento` VALUES ('169', 'J. Tomás', '85', '8', null);
INSERT INTO `Equipamento` VALUES ('170', 'Martim Nunes', '13', '8', null);
INSERT INTO `Equipamento` VALUES ('171', 'Tomás', '98', '11', null);
INSERT INTO `Equipamento` VALUES ('172', 'Rodrigo', '54', '9', null);
INSERT INTO `Equipamento` VALUES ('173', 'Rúben Marques', '78', '3', null);
INSERT INTO `Equipamento` VALUES ('174', 'Xavi', '21', '4', null);
INSERT INTO `Equipamento` VALUES ('175', 'Tiago Silva', '42', '2', null);
INSERT INTO `Equipamento` VALUES ('176', 'Tavares', '70', '3', null);
INSERT INTO `Equipamento` VALUES ('177', 'L. Baptista', '67', '3', null);
INSERT INTO `Equipamento` VALUES ('178', 'Manu. J', '69', '3', null);
INSERT INTO `Equipamento` VALUES ('179', 'Rossano', '65', '11', null);
INSERT INTO `Equipamento` VALUES ('180', 'Vidal', '80', '10', null);
INSERT INTO `Equipamento` VALUES ('181', 'Diogo S.', '31', '11', null);
INSERT INTO `Equipamento` VALUES ('182', 'Afonso Macedo', '52', '8', null);
INSERT INTO `Equipamento` VALUES ('183', 'Cirne', '5', '2', null);
INSERT INTO `Equipamento` VALUES ('184', 'Paulo Mano', '44', '8', null);
INSERT INTO `Equipamento` VALUES ('185', 'Timóteo', '73', '11', null);
INSERT INTO `Equipamento` VALUES ('186', 'Diogo', '29', '10', null);
INSERT INTO `Equipamento` VALUES ('187', 'Tó', '13', '9', null);
INSERT INTO `Equipamento` VALUES ('188', 'Salvador', '22', '8', null);
INSERT INTO `Equipamento` VALUES ('189', 'Lourenço', '56', '9', null);
INSERT INTO `Equipamento` VALUES ('190', 'Alexandre', '14', '9', null);
INSERT INTO `Equipamento` VALUES ('191', 'Bonfim', '19', '2', null);
INSERT INTO `Equipamento` VALUES ('192', 'Miguel Silva', '7', '7', null);
INSERT INTO `Equipamento` VALUES ('193', 'João Pires', '35', '8', null);
INSERT INTO `Equipamento` VALUES ('194', 'Martinho Dias', '18', '2', null);
INSERT INTO `Equipamento` VALUES ('195', 'Duarte Mendonça', '38', '11', null);
INSERT INTO `Equipamento` VALUES ('196', 'Tomás', '5', '10', null);
INSERT INTO `Equipamento` VALUES ('197', 'Maia', '29', '10', null);
INSERT INTO `Equipamento` VALUES ('198', 'aaaa', '44', '1', null);
INSERT INTO `Equipamento` VALUES ('199', 'Pedro Marques', '16', '10', null);
INSERT INTO `Equipamento` VALUES ('200', 'Miguel F.', '74', '3', null);
INSERT INTO `Equipamento` VALUES ('201', 'Gui', '76', '11', null);
INSERT INTO `Equipamento` VALUES ('202', 'Nuno', '68', '10', null);
INSERT INTO `Equipamento` VALUES ('203', 'Gabriel S. A.', '30', '8', null);
INSERT INTO `Equipamento` VALUES ('204', 'João Amador', '86', '2', null);
INSERT INTO `Equipamento` VALUES ('205', 'Duarte Silva', '8', '7', null);
INSERT INTO `Equipamento` VALUES ('206', 'Gustavo Silva', '16', '7', null);
INSERT INTO `Equipamento` VALUES ('207', 'Martim Faria', '13', '8', null);
INSERT INTO `Equipamento` VALUES ('208', 'Samuel', '48', '10', null);
INSERT INTO `Equipamento` VALUES ('209', 'Guga', '74', '9', null);
INSERT INTO `Equipamento` VALUES ('210', 'Mateus', '18', '10', null);
INSERT INTO `Equipamento` VALUES ('211', 'Gonçalo Faria', '77', '10', null);
INSERT INTO `Equipamento` VALUES ('212', 'Rodrigo P.', '88', '3', null);
INSERT INTO `Equipamento` VALUES ('213', 'Teixeira', '6', '3', null);
INSERT INTO `Equipamento` VALUES ('214', 'Christian', '27', '7', null);
INSERT INTO `Equipamento` VALUES ('215', 'Afonso', '10', '8', null);
INSERT INTO `Equipamento` VALUES ('216', 'Gonçalo F.', '5', '7', null);
INSERT INTO `Equipamento` VALUES ('217', 'Couras', '99', '7', null);
INSERT INTO `Equipamento` VALUES ('218', 'Salvador', '88', '7', null);
INSERT INTO `Equipamento` VALUES ('219', 'Gui Soares', '3', '9', null);
INSERT INTO `Equipamento` VALUES ('220', 'Samuel', '71', '3', null);
INSERT INTO `Equipamento` VALUES ('221', 'André N.', '4', '9', null);
INSERT INTO `Equipamento` VALUES ('222', 'Lopez', '12', '9', null);
INSERT INTO `Equipamento` VALUES ('223', 'Leandro', '95', '4', null);
INSERT INTO `Equipamento` VALUES ('224', 'Afonso Neves', '77', '7', null);
INSERT INTO `Equipamento` VALUES ('225', 'J. P.', '21', '9', null);
INSERT INTO `Equipamento` VALUES ('226', 'Vasco F.', '16', '8', null);
INSERT INTO `Equipamento` VALUES ('227', 'David Henriques', '79', '10', null);
INSERT INTO `Equipamento` VALUES ('228', 'José Filipe', '43', '9', null);
INSERT INTO `Equipamento` VALUES ('229', 'M. Silva', '55', '3', null);
INSERT INTO `Equipamento` VALUES ('230', 'Diogo Dias', '80', '10', null);
INSERT INTO `Equipamento` VALUES ('231', 'Diogo', '64', '3', null);
INSERT INTO `Equipamento` VALUES ('232', 'Luciano', '28', '10', null);
INSERT INTO `Equipamento` VALUES ('233', 'Léo', '57', '4', null);
INSERT INTO `Equipamento` VALUES ('234', 'Diogo André', '79', '3', null);
INSERT INTO `Equipamento` VALUES ('235', 'João Figueira', '12', '7', null);
INSERT INTO `Equipamento` VALUES ('236', 'Figueira', '11', '8', null);
INSERT INTO `Equipamento` VALUES ('237', 'Rúben Azevedo', '2', '3', null);
INSERT INTO `Equipamento` VALUES ('238', 'Salvador', '24', '6', null);
INSERT INTO `Equipamento` VALUES ('239', 'Rodrigo Marques', '87', '11', null);
INSERT INTO `Equipamento` VALUES ('240', 'L. Saleiro', '76', '2', null);
INSERT INTO `Equipamento` VALUES ('241', 'Rui Costa', '93', '3', null);
INSERT INTO `Equipamento` VALUES ('242', 'Dinis', '8', '9', null);
INSERT INTO `Equipamento` VALUES ('243', 'A. Goís', '30', '11', null);
INSERT INTO `Equipamento` VALUES ('244', 'Kaparica', '19', '3', null);
INSERT INTO `Equipamento` VALUES ('245', 'A. Graça', '37', '3', null);
INSERT INTO `Equipamento` VALUES ('246', 'João Paulo', '11', '3', null);
INSERT INTO `Equipamento` VALUES ('247', 'Tyler', '14', '4', null);
INSERT INTO `Equipamento` VALUES ('248', 'Temudo', '20', '4', null);
INSERT INTO `Equipamento` VALUES ('249', 'Machadinho', '26', '3', null);
INSERT INTO `Equipamento` VALUES ('250', 'Cabilhas', '21', '4', null);
INSERT INTO `Equipamento` VALUES ('251', 'Ginho', '9', '4', null);
INSERT INTO `Equipamento` VALUES ('252', 'Flecha', '7', '3', null);
INSERT INTO `Equipamento` VALUES ('253', 'Oliveira', '32', '4', null);
INSERT INTO `Equipamento` VALUES ('254', 'Semedo', '2', '4', null);
INSERT INTO `Equipamento` VALUES ('255', 'Duarte', '13', '4', null);
INSERT INTO `Equipamento` VALUES ('256', 'Miguel', '1', '5', null);
INSERT INTO `Equipamento` VALUES ('257', 'Soares', '97', '4', null);
INSERT INTO `Equipamento` VALUES ('258', 'Pechelim', '26', '3', null);
INSERT INTO `Equipamento` VALUES ('259', 'Dani', '17', '4', null);
INSERT INTO `Equipamento` VALUES ('260', 'Carlos', '24', '3', null);
INSERT INTO `Equipamento` VALUES ('261', 'Nani', '11', '3', null);
INSERT INTO `Equipamento` VALUES ('262', 'Fábio Flávio', '3', '3', null);
INSERT INTO `Equipamento` VALUES ('263', 'Fábio  Freitas', '4', '3', null);
INSERT INTO `Equipamento` VALUES ('264', 'Tomás', '1', '3', 'G.R.');
INSERT INTO `Equipamento` VALUES ('265', 'J.P.', '7', '2', null);
INSERT INTO `Equipamento` VALUES ('266', 'Leonel Matos', '8', '3', null);
INSERT INTO `Equipamento` VALUES ('267', 'Olim', '9', '2', null);
INSERT INTO `Equipamento` VALUES ('268', 'Daniel Meaño', '11', '3', null);
INSERT INTO `Equipamento` VALUES ('269', 'João Pinheiro', '11', '3', null);
INSERT INTO `Equipamento` VALUES ('270', 'Ricardo', '13', '3', null);
INSERT INTO `Equipamento` VALUES ('271', 'Vigário', '14', '3', null);
INSERT INTO `Equipamento` VALUES ('272', 'Cálix', '15', '3', null);
INSERT INTO `Equipamento` VALUES ('273', 'Bruno Marques', '16', '3', null);
INSERT INTO `Equipamento` VALUES ('274', 'Xavier', '17', '3', null);
INSERT INTO `Equipamento` VALUES ('275', 'Abel Andrade', '17', '3', null);
INSERT INTO `Equipamento` VALUES ('276', 'Christopher', '18', '3', null);
INSERT INTO `Equipamento` VALUES ('277', 'Pereira', '96', '3', null);
INSERT INTO `Equipamento` VALUES ('278', 'Galvão', '62', '4', null);
INSERT INTO `Equipamento` VALUES ('279', 'Bruno', '52', '3', null);
INSERT INTO `Equipamento` VALUES ('280', 'Sabina', '91', '3', null);
INSERT INTO `Equipamento` VALUES ('281', 'Pedro P.', '86', '2', null);
INSERT INTO `Equipamento` VALUES ('282', 'Tiaguinho', '92', '2', null);
INSERT INTO `Equipamento` VALUES ('283', 'Ricardo', '32', '3', null);
INSERT INTO `Equipamento` VALUES ('284', 'Sebastian', '36', '3', null);
INSERT INTO `Equipamento` VALUES ('285', 'M. Sousa', '14', '11', null);
INSERT INTO `Equipamento` VALUES ('286', 'Sousa', '40', '10', null);
INSERT INTO `Equipamento` VALUES ('287', 'Miranda', '10', '11', null);
INSERT INTO `Equipamento` VALUES ('288', 'Serafim', '99', '11', null);
INSERT INTO `Equipamento` VALUES ('289', 'Fabiano', '99', '11', null);
INSERT INTO `Equipamento` VALUES ('290', 'Diogo Valente', '99', '10', null);
INSERT INTO `Equipamento` VALUES ('291', 'Mendonça', '88', '9', null);
INSERT INTO `Equipamento` VALUES ('292', 'Cabilhas', '67', '10', null);
INSERT INTO `Equipamento` VALUES ('293', 'Saramago', '70', '10', null);
INSERT INTO `Equipamento` VALUES ('294', 'Tomás Pinheiro', '24', '10', null);
INSERT INTO `Equipamento` VALUES ('295', 'Santiago', '27', '10', null);
INSERT INTO `Equipamento` VALUES ('296', 'Diogo Afonso', '2', '10', null);
INSERT INTO `Equipamento` VALUES ('297', 'Samuel', '15', '9', null);
INSERT INTO `Equipamento` VALUES ('298', 'Ricardo', '90', '9', null);
INSERT INTO `Equipamento` VALUES ('299', 'Deyler Didier', '92', '9', null);
INSERT INTO `Equipamento` VALUES ('300', 'Dinis M.', '70', '9', null);
INSERT INTO `Equipamento` VALUES ('301', 'Pol', '54', '9', null);
INSERT INTO `Equipamento` VALUES ('302', 'Tiago Dias', '28', '8', null);
INSERT INTO `Equipamento` VALUES ('303', 'Sebastião', '20', '8', null);
INSERT INTO `Equipamento` VALUES ('304', 'Rodrigo', '23', '8', null);
INSERT INTO `Equipamento` VALUES ('305', 'David J.', '11', '8', null);
INSERT INTO `Equipamento` VALUES ('306', 'Baltasar', '25', '8', null);
INSERT INTO `Equipamento` VALUES ('307', 'Andrés', '28', '11', null);
INSERT INTO `Equipamento` VALUES ('308', 'Pinho', '32', '9', null);
INSERT INTO `Equipamento` VALUES ('309', 'Leonardo', '24', '3', null);
INSERT INTO `Equipamento` VALUES ('310', 'Ricardo Carvalho', '81', '3', null);
INSERT INTO `Equipamento` VALUES ('311', 'Diego', '27', '7', null);
INSERT INTO `Equipamento` VALUES ('312', 'Guto', '51', '9', null);
INSERT INTO `Equipamento` VALUES ('313', 'Bruno Sousa', '93', '2', null);
INSERT INTO `Equipamento` VALUES ('314', 'Duarte', '15', '7', null);
INSERT INTO `Equipamento` VALUES ('315', 'Duarte Marques', '18', '7', null);
INSERT INTO `Equipamento` VALUES ('316', 'João Nuno', '40', '7', null);
INSERT INTO `Equipamento` VALUES ('317', 'Diogo', '33', '8', null);
INSERT INTO `Equipamento` VALUES ('318', 'Rafa', '5', '8', null);
INSERT INTO `Equipamento` VALUES ('319', 'Gonçalo D.', '5', '11', null);
INSERT INTO `Equipamento` VALUES ('320', 'J. Gabriel', '89', '9', null);
INSERT INTO `Equipamento` VALUES ('321', 'Duarte C.', '55', '8', null);
INSERT INTO `Equipamento` VALUES ('322', 'Duarte Sousa', '0', '7', null);
INSERT INTO `Equipamento` VALUES ('323', 'Diogo Oliveira', '1', '7', null);

-- ----------------------------
-- Table structure for Escalao
-- ----------------------------
DROP TABLE IF EXISTS `Escalao`;
CREATE TABLE `Escalao` (
  `ID_Escalao` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `DataInicial` date NOT NULL,
  `DataFinal` date NOT NULL,
  `ID_Modalidade` int(11) DEFAULT NULL,
  `REF_Epoca` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Escalao`),
  KEY `IDX_BBC7735F56BD73F3` (`ID_Modalidade`),
  KEY `IDX_BBC7735FCD11D9A4` (`REF_Epoca`),
  CONSTRAINT `FK_BBC7735F56BD73F3` FOREIGN KEY (`ID_Modalidade`) REFERENCES `Modalidade` (`ID_Modalidade`),
  CONSTRAINT `FK_BBC7735FCD11D9A4` FOREIGN KEY (`REF_Epoca`) REFERENCES `Epoca` (`ID_epoca`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Escalao
-- ----------------------------
INSERT INTO `Escalao` VALUES ('1', 'Traquinas B', '2010-01-01', '2010-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('2', 'Traquinas A', '2009-01-01', '2009-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('3', 'Benjamins B', '2008-01-01', '2008-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('4', 'Benjamins A', '2007-01-01', '2007-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('5', 'Infantis B', '2006-01-01', '2006-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('6', 'Infantis A', '2005-01-01', '2005-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('7', 'Iniciados', '2003-01-01', '2004-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('8', 'Juvenis', '2001-01-01', '2002-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('10', 'Séniores', '1976-01-01', '1998-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('11', 'Petizes', '2011-01-01', '2014-12-31', '1', '3');
INSERT INTO `Escalao` VALUES ('12', 'Júniores', '1999-01-01', '1999-12-01', '1', '3');
INSERT INTO `Escalao` VALUES ('13', 'Traquinas B', '2011-01-01', '2011-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('14', 'Infantis A', '2006-01-01', '2006-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('15', 'Traquinas A', '2010-01-01', '2010-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('16', 'Séniores', '1975-01-01', '1999-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('17', 'Petizes', '2012-01-01', '2016-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('18', 'Júniores', '2000-01-01', '2001-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('19', 'Juvenis', '2002-01-01', '2003-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('20', 'Iniciados', '2004-01-01', '2005-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('21', 'Infantis B', '2007-01-01', '2007-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('22', 'Benjamins B', '2009-01-01', '2009-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('23', 'Benjamins A', '2008-01-01', '2008-12-31', '1', '4');
INSERT INTO `Escalao` VALUES ('24', 'Petizes', '2013-01-01', '2017-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('25', 'Traquinas B', '2012-01-01', '2012-12-01', '1', '5');
INSERT INTO `Escalao` VALUES ('26', 'Traquinas A', '2011-01-01', '2011-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('27', 'Benjamins B', '2010-01-01', '2010-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('28', 'Benjamins A', '2009-01-01', '2009-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('29', 'Infantis B', '2008-01-01', '2008-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('30', 'Infantis A', '2007-01-01', '2007-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('31', 'Iniciados', '2005-01-01', '2006-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('32', 'Juvenis', '2003-01-01', '2004-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('33', 'Júniores', '2001-01-01', '2002-12-31', '1', '5');
INSERT INTO `Escalao` VALUES ('34', 'Séniores', '1980-01-01', '2000-12-31', '1', '5');

-- ----------------------------
-- Table structure for JogadorEstatistica
-- ----------------------------
DROP TABLE IF EXISTS `JogadorEstatistica`;
CREATE TABLE `JogadorEstatistica` (
  `Tempo` int(11) NOT NULL,
  `ID_Jornada` int(11) NOT NULL,
  `ID_Entidade` int(11) NOT NULL,
  `ID_Evento` int(11) NOT NULL,
  PRIMARY KEY (`ID_Jornada`,`ID_Entidade`,`ID_Evento`,`Tempo`),
  KEY `IDX_6475C2038345E416` (`ID_Entidade`),
  KEY `IDX_6475C2031D9A5B2B` (`ID_Evento`),
  KEY `IDX_6475C203BD5E0D20` (`ID_Jornada`),
  CONSTRAINT `FK_6475C2031D9A5B2B` FOREIGN KEY (`ID_Evento`) REFERENCES `TipoEvento` (`ID_Evento`),
  CONSTRAINT `FK_6475C2038345E416` FOREIGN KEY (`ID_Entidade`) REFERENCES `Entidade` (`ID_Entidade`),
  CONSTRAINT `FK_6475C203BD5E0D20` FOREIGN KEY (`ID_Jornada`) REFERENCES `Jornada` (`ID_Jornada`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of JogadorEstatistica
-- ----------------------------

-- ----------------------------
-- Table structure for Jornada
-- ----------------------------
DROP TABLE IF EXISTS `Jornada`;
CREATE TABLE `Jornada` (
  `ID_Jornada` int(11) NOT NULL AUTO_INCREMENT,
  `ID_ClubeCasa` int(11) DEFAULT NULL,
  `LocalJogo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `DataJogo` date DEFAULT NULL,
  `HoraJogo` time DEFAULT NULL,
  `LocalConcentracao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `HoraConcentracao` time DEFAULT NULL,
  `GolosCasa` int(11) NOT NULL DEFAULT '0',
  `GolosVisit` int(11) NOT NULL DEFAULT '0',
  `Duracao` int(11) NOT NULL DEFAULT '0',
  `ID_ClubeVisit` int(11) DEFAULT NULL,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REF_Campeonato` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Jornada`),
  KEY `IDX_AE6F2523CC67F24F` (`ID_ClubeCasa`),
  KEY `IDX_AE6F2523C6A8DB4E` (`ID_ClubeVisit`),
  KEY `IDX_AE6F25235D9EBCD1` (`REF_Campeonato`),
  CONSTRAINT `FK_AE6F25235D9EBCD1` FOREIGN KEY (`REF_Campeonato`) REFERENCES `Campeonato` (`ID_Campeonato`),
  CONSTRAINT `FK_AE6F2523C6A8DB4E` FOREIGN KEY (`ID_ClubeVisit`) REFERENCES `Clube` (`ID_Clube`),
  CONSTRAINT `FK_AE6F2523CC67F24F` FOREIGN KEY (`ID_ClubeCasa`) REFERENCES `Clube` (`ID_Clube`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Jornada
-- ----------------------------

-- ----------------------------
-- Table structure for Modalidade
-- ----------------------------
DROP TABLE IF EXISTS `Modalidade`;
CREATE TABLE `Modalidade` (
  `ID_Modalidade` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Modalidade`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Modalidade
-- ----------------------------
INSERT INTO `Modalidade` VALUES ('1', 'Futebol');
INSERT INTO `Modalidade` VALUES ('2', 'Natação');

-- ----------------------------
-- Table structure for ModoPagamento
-- ----------------------------
DROP TABLE IF EXISTS `ModoPagamento`;
CREATE TABLE `ModoPagamento` (
  `ID_Modo_Pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REF_Epoca` int(11) DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_Modo_Pagamento`),
  KEY `IDX_35152372CD11D9A4` (`REF_Epoca`),
  CONSTRAINT `FK_35152372CD11D9A4` FOREIGN KEY (`REF_Epoca`) REFERENCES `Epoca` (`ID_epoca`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ModoPagamento
-- ----------------------------
INSERT INTO `ModoPagamento` VALUES ('10', '1 Pagamento - Até 31/07/2017', '3', '1');
INSERT INTO `ModoPagamento` VALUES ('11', '2 Pagamentos - Até 31/07/2017', '3', '1');
INSERT INTO `ModoPagamento` VALUES ('12', '3 Pagamentos - Até 31/07/2017', '3', '1');
INSERT INTO `ModoPagamento` VALUES ('13', '1 Pagamento - Depois de 31/07/2017', '3', '1');
INSERT INTO `ModoPagamento` VALUES ('14', '2 Pagamentos - Depois de 31/07/2017', '3', '1');
INSERT INTO `ModoPagamento` VALUES ('15', '3 Pagamentos - Depois de 31/07/2017', '3', '1');

-- ----------------------------
-- Table structure for ModoPagamentoEntidade
-- ----------------------------
DROP TABLE IF EXISTS `ModoPagamentoEntidade`;
CREATE TABLE `ModoPagamentoEntidade` (
  `ID_Modo_Pagamento_Entidade` int(11) NOT NULL AUTO_INCREMENT,
  `REF_Modo_Pagamento` int(11) DEFAULT NULL,
  `REF_Entidade` int(11) DEFAULT NULL,
  `REF_Epoca` int(11) DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL DEFAULT '1',
  `Descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Modo_Pagamento_Entidade`),
  KEY `IDX_30A595B6DDB704E9` (`REF_Modo_Pagamento`),
  KEY `IDX_30A595B64DB815FC` (`REF_Entidade`),
  KEY `IDX_30A595B64DB8783A` (`REF_Epoca`) USING BTREE,
  CONSTRAINT `FK_30A595B64DB815FC` FOREIGN KEY (`REF_Entidade`) REFERENCES `Entidade` (`ID_Entidade`),
  CONSTRAINT `FK_30A595B64DB8783A` FOREIGN KEY (`REF_Epoca`) REFERENCES `Epoca` (`ID_epoca`),
  CONSTRAINT `FK_30A595B6DDB704E9` FOREIGN KEY (`REF_Modo_Pagamento`) REFERENCES `ModoPagamento` (`ID_Modo_Pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of ModoPagamentoEntidade
-- ----------------------------
INSERT INTO `ModoPagamentoEntidade` VALUES ('1', '10', '141', '3', '1', '1 Pagamento - Até 31/07/2017');

-- ----------------------------
-- Table structure for Morada
-- ----------------------------
DROP TABLE IF EXISTS `Morada`;
CREATE TABLE `Morada` (
  `ID_Morada` int(11) NOT NULL AUTO_INCREMENT,
  `Rua` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Numero` int(11) DEFAULT NULL,
  `Andar` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CodPostal4` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CodPostal3` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Localidade` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID_Morada`)
) ENGINE=InnoDB AUTO_INCREMENT=1193 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Morada
-- ----------------------------
INSERT INTO `Morada` VALUES ('1', 'Rua do Areal', '15', '1', '3870', '420', 'Torreira');
INSERT INTO `Morada` VALUES ('2', 'Lugar das Vendas, Edif. Norte', '404', '1', '3720', '486', 'Pinheiro da Bemposta');
INSERT INTO `Morada` VALUES ('3', 'Rua Pedro Calado', '1', null, '3865', '285', 'Salreu');
INSERT INTO `Morada` VALUES ('4', 'Rua dos Percursores', '24', '1', '3870', '211', 'Murtosa');
INSERT INTO `Morada` VALUES ('5', 'Rua da Nestlé', '95', null, '3860', '071', 'Avanca');
INSERT INTO `Morada` VALUES ('6', 'Rua Manuel da Silva Carreira  UL', null, null, '3720', '597', 'Ul-Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('7', 'Bairro da Teixugueira', '230', '2', '3860', '860', 'Estarreja');
INSERT INTO `Morada` VALUES ('8', 'Rua Conde Ferreira', '65', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('9', 'Rua Padre Donaciano Abreu Freire - Ed. Lusíadas II', '10', null, '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('10', 'Rua da Arribada', '200', null, '3860', '092', 'Avanca');
INSERT INTO `Morada` VALUES ('11', 'Rua dos Salvadores da Nathalie', '10', null, '3870', '410', 'Torreira');
INSERT INTO `Morada` VALUES ('12', 'Rua Agro de Meios', '10', null, '3860', '586', 'Veiros');
INSERT INTO `Morada` VALUES ('13', 'Rua Manuel José da Silva, Edificio Altamira', '27', '1', '3720', '307', 'Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('14', 'Rua Dr Manuel Andrade', '45', null, '3865', '033', 'Canelas');
INSERT INTO `Morada` VALUES ('15', 'Rua das Mestras', '40', null, '3870', '032', 'Bunheiro');
INSERT INTO `Morada` VALUES ('16', 'Rua Aceiro', '2', null, '3860', '227', 'Estarreja');
INSERT INTO `Morada` VALUES ('17', 'Rua Padre Alves Garrido', '0', null, '3860', '088', 'Avanca');
INSERT INTO `Morada` VALUES ('18', 'Travessa de Santa Luzia ', '10', null, '3860', '661', 'Veiros');
INSERT INTO `Morada` VALUES ('19', 'Travessa Drº António Madureira, Vivenda', '7', null, '3860', '249', 'Estarreja');
INSERT INTO `Morada` VALUES ('20', 'Travessa da Rua Nova', '26', null, '3860', '731', 'Pardilhó');
INSERT INTO `Morada` VALUES ('21', 'Bairro da Teixugueira', '222', '2', '3860', '860', 'Estarreja');
INSERT INTO `Morada` VALUES ('22', 'Rua Areia do Gonde', '73', null, '3860', '064', 'Avanca');
INSERT INTO `Morada` VALUES ('23', 'Rua Padre Salvador Terra', '277', null, '3860', '015', 'Avanca');
INSERT INTO `Morada` VALUES ('24', 'Rua das Barreiras ', '1', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('25', 'Rua de S. Tiago', '27', '1', '3860', '301', 'Estarreja');
INSERT INTO `Morada` VALUES ('26', 'Rua do Falcão', '170', null, '3860', '160', 'Avanca');
INSERT INTO `Morada` VALUES ('27', 'Rua Jornal de Estarreja', '43', '1', '3860', '365', 'Estarreja');
INSERT INTO `Morada` VALUES ('28', 'Rua Visconde Valdemouro', '23', '3', '3860', '389', 'Estarreja');
INSERT INTO `Morada` VALUES ('29', 'Rua Cidade Porto Novo - Urb. Póvoa de baixo', '215', null, '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('30', 'Rua Quinta Velha', '548', '1', '3860', '299', 'Estarreja');
INSERT INTO `Morada` VALUES ('31', 'Rua Bairro São Filipe - Póvoa de Cima', '1', null, '3860', '292', 'Estarreja');
INSERT INTO `Morada` VALUES ('32', 'Rua Barreiro de Cima', '17', null, '3860', '207', 'Estarreja');
INSERT INTO `Morada` VALUES ('33', 'Travessa do Vale Grande -  Porto Baixo', '4', null, '3865', '268', 'Salreu');
INSERT INTO `Morada` VALUES ('34', 'Rua das Tílias - Urbanização da Póvoa de Baixo', '1', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('35', 'Rua General Themudo Barata', '15', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('36', 'Beco do Outeiro Alto', '12', null, '2870', '027', 'Bunheiro');
INSERT INTO `Morada` VALUES ('37', 'Rua Fonte dos batizados', '16', null, '3860', '223', 'Estarreja');
INSERT INTO `Morada` VALUES ('38', 'Rua Tomé', '17', null, '3865', '288', 'Salreu');
INSERT INTO `Morada` VALUES ('39', 'Av. 25 de Abril', '53', '3', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('40', 'Rua do Barreiro de Além - Santiais', '23', null, '3860', '311', 'Estarreja');
INSERT INTO `Morada` VALUES ('41', 'Urbanização Quinta dos Leites', '99', null, '3870', '319', 'Torreira');
INSERT INTO `Morada` VALUES ('42', 'Estrada Nacional 327-Quintas do Norte', '467', null, '3870', '303', 'Torreira');
INSERT INTO `Morada` VALUES ('43', 'Rua 13 de Setembro  - Póvoa de Baixo', '35', null, '3860', '274', 'Estarreja');
INSERT INTO `Morada` VALUES ('44', 'Rua Padre Donaciano Abreu Freire', '43', '4', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('45', 'Travessa Dr António Duarte de Oliveira', '6', null, '3860', '051', 'Avanca');
INSERT INTO `Morada` VALUES ('46', 'Rua Lagoa de Assões, Bloco 2', '0', '0', '3880', '723', 'Ovar');
INSERT INTO `Morada` VALUES ('47', 'Rua Desembargador Oliveira Pinto', '12', '0', '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('48', 'Urbanização da Póvoa de Baixo', '228', null, '3860', '350', 'Estarreja');
INSERT INTO `Morada` VALUES ('49', 'Rua do Areal - Ed. Areal', '5', '1', '3870', '406', 'Torreira');
INSERT INTO `Morada` VALUES ('50', 'Rua da Ribeira', '25', null, '3880', '507', 'Válega');
INSERT INTO `Morada` VALUES ('51', 'RuaTomas Figueiredo - Bloco 228 - R/c A', '0', '0', '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('52', 'Rua do Outeiro, Beduído', '27', null, '3860', '230', 'Estarreja');
INSERT INTO `Morada` VALUES ('53', 'Rua dos Margidos,Quintas do Norte', '13', null, '3870', '303', 'Torreira');
INSERT INTO `Morada` VALUES ('54', 'Rua do Serrado', '0', null, '3720', '000', 'Loureiro');
INSERT INTO `Morada` VALUES ('55', 'Rua Dr. João Carlos Vaz Cunha', '73', null, '3870', '355', 'Torreira');
INSERT INTO `Morada` VALUES ('56', 'Estrada Nacional 109', '76', 'R/C', '3865', '011', 'Canelas');
INSERT INTO `Morada` VALUES ('57', 'Rua Marques Rodrigues - Quinta Costeira', '27', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('58', 'Rua dos Engenhos', '502', null, '3880', '682', 'Válega');
INSERT INTO `Morada` VALUES ('59', 'Av 25 de Abril', '65', '3ºesq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('60', 'Rua Padre Donaciano Abreu Freire', '12', '5ºesq', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('61', 'Rua Picoto sul - Canelas', '14', null, '3865', '032', 'Estarreja');
INSERT INTO `Morada` VALUES ('62', 'Travessa da Escola Primária', '12', null, '3860', '314', 'Estarreja');
INSERT INTO `Morada` VALUES ('63', 'Rua de Trás', '194', null, '3860', '361', 'Estarreja');
INSERT INTO `Morada` VALUES ('64', 'Rua D. Manuel - Conjunto Altamira', '85', '2ºDD', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('65', 'Rua da Galiza, Lote 3', '17', '3', '3720', '125', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('66', 'Rua Areosa do Sul', '28', null, '3860', '205', 'Estarreja');
INSERT INTO `Morada` VALUES ('67', 'Rua do infantado', '28', null, '3860', '360', 'Estarreja');
INSERT INTO `Morada` VALUES ('68', 'Travessa Santo António', '18', null, '3860', '648', 'Veiros');
INSERT INTO `Morada` VALUES ('69', 'Rua Padre Eloy de Pinho', '8', '1', '3880', '255', 'Ovar');
INSERT INTO `Morada` VALUES ('70', 'Rua das Olas', '2', null, '3860', '632', 'Veiros');
INSERT INTO `Morada` VALUES ('71', 'Rua João Augusto Sousa Fernandes', '70', null, '3860', '601', 'Veiros');
INSERT INTO `Morada` VALUES ('72', 'Rua Póvoa de Baixo', '30', null, '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('73', 'Rua da Póvoa de Baixo', '34', null, '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('74', 'Rua São Geraldo', '67', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('75', 'Praça Jaime Arneixo - Ap I', '0', '1', '3870', '224', 'Murtosa');
INSERT INTO `Morada` VALUES ('76', 'Travessa da Boavista, norte', '1', null, '3865', '315', 'Salreu');
INSERT INTO `Morada` VALUES ('77', 'Rua Major Ferreira', '42', null, '3860', '000', 'Estarreja');
INSERT INTO `Morada` VALUES ('78', 'Rua Tomaz de Figueiredo - Bloco 226 - R/C A', '43', null, '3860', '261', 'Estarreja');
INSERT INTO `Morada` VALUES ('79', 'Largo 5 de Outubro', '23', '3', '3880', '062', 'Ovar');
INSERT INTO `Morada` VALUES ('80', 'Rua do Serrano - Deveza Santiais', '4', null, '3860', '245', 'Estarreja');
INSERT INTO `Morada` VALUES ('81', 'Av. Visconde Salreu', '9', null, '3860', '254', 'Salreu');
INSERT INTO `Morada` VALUES ('82', 'Rua General Themudo Barata', '12', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('83', 'Rua General Themudo Barata', '12', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('84', 'Rua Canto do Esteiro - Povoa de Baixo', '24', null, '3860', '262', 'Estarreja');
INSERT INTO `Morada` VALUES ('85', 'Rua 15 de Maio ', '705', null, '3880', '503', 'Valega');
INSERT INTO `Morada` VALUES ('86', 'Rua Dr Manuel Andrade', '45', null, '3865', '033', 'Canelas');
INSERT INTO `Morada` VALUES ('87', 'Travessa do Bairro S. Filipe - Póvoa de Cima', '8', null, '3860', '295', 'Estarreja');
INSERT INTO `Morada` VALUES ('88', 'Rua da Boavista - Macieira - Loureiro', '731', null, '3720', '060', 'Loureiro - OAZ');
INSERT INTO `Morada` VALUES ('89', 'Rua do Meio - Povoa de Cima ', '16', null, '3860', '294', 'Estarreja');
INSERT INTO `Morada` VALUES ('90', 'Rua do Mercado - Pardelhas', '15', null, '3870', '101', 'Murtosa');
INSERT INTO `Morada` VALUES ('91', 'Rua dos Barreiros - Barreiro de Cima', '20', null, '3860', '216', 'Estarreja');
INSERT INTO `Morada` VALUES ('92', 'Rua São Geraldo', '60', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('93', 'Rua da Ribeirinha', '35', null, '3870', '268', 'Murtosa');
INSERT INTO `Morada` VALUES ('94', 'Rua Dr Manuel Ferreira Silva', '5', null, '3860', '860', 'Estarreja');
INSERT INTO `Morada` VALUES ('95', 'Rua da Boavista,  Salreu', '27', null, '3865', '215', 'Salreu');
INSERT INTO `Morada` VALUES ('96', 'Rua Professor Dr Egas Moniz', '10', '1', '3860', '078', 'Avanca');
INSERT INTO `Morada` VALUES ('97', 'Avenida 25 de Abril - Ed. Pais Pinto ', '77', '4', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('98', 'Largo do Matinho', '14', null, '3865', '105', 'Fermelã - Estarreja ');
INSERT INTO `Morada` VALUES ('99', 'Rua Nova - Urbanização Porto Riba - Fracção F - Soutelo- Branca', '1', null, '3850', '587', 'Albergaria a Velha');
INSERT INTO `Morada` VALUES ('100', 'Rua Desembargador Correia Teles', '310', '2', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('101', 'Rua Marques Rodrigues', '17', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('102', 'Rua Direira', '3', null, '3865', '022', 'Canelas');
INSERT INTO `Morada` VALUES ('103', 'Rua Cidade Porto Novo', '216', null, '3860', '242', 'Estarreja');
INSERT INTO `Morada` VALUES ('104', 'Rua Dr Agostinho L.P. Valente', '25', null, '3860', '436', 'Pardilhó');
INSERT INTO `Morada` VALUES ('105', 'Rua das Tílias', '17', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('106', 'Lugar das Arrotas-Pardelhas', '31', null, '3870', '193', 'Murtosa');
INSERT INTO `Morada` VALUES ('107', 'Rua Maria de Lurdes Breu', '61', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('108', 'Rua António Maria Silva e Pinho - Pardilhó', '121', null, '3860', '431', 'Pardilhó');
INSERT INTO `Morada` VALUES ('109', 'Rua Mártires da Pátria - Veiros', '5', null, '3860', '636', 'Estarreja');
INSERT INTO `Morada` VALUES ('110', 'Rua de Macau - Sargaçal ', '116', '1', '3880', '644', 'Válega');
INSERT INTO `Morada` VALUES ('111', 'Rua D. Francisco Nunes Teixeira', '31', null, '3860', '289', 'Estarreja');
INSERT INTO `Morada` VALUES ('112', 'Rua da Brejinha', '20', null, '3860', '296', 'Estarreja');
INSERT INTO `Morada` VALUES ('113', 'Urbanização da Póvoa de Baixo', '223', null, '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('114', 'Rua Conde Ferreira', '65', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('115', 'Rua da Raia Seca - fundo do pinheiro', '78', null, '3720', '475', 'Pinheiro da Bemposta');
INSERT INTO `Morada` VALUES ('116', 'Rua das Barreira', '1', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('117', 'Rua Professor Abílio Ramos, Nº32', '32', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('118', 'Rua da Feira Santo Amaro', '25', null, '3860', '318', 'Estarreja');
INSERT INTO `Morada` VALUES ('119', 'Av. 25 de Abril', '55', '4º esq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('120', 'Edíficio Flamingo-Bloco B-RC Direito-Estrada de São Filipe', '1', null, '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('121', 'Rua dos Tarolas', '7', null, '3860', '715', 'Pardilhó');
INSERT INTO `Morada` VALUES ('122', 'Rua da Rigueirinha', '35', null, '3870', '268', 'Murtosa');
INSERT INTO `Morada` VALUES ('123', 'Rua D. Dinis', '58', null, '3870', '162', 'Murtosa');
INSERT INTO `Morada` VALUES ('124', 'Rua Germano Cruz', '19', null, '3870', '288', 'Monte - Murtosa');
INSERT INTO `Morada` VALUES ('125', 'EN 327', '309', null, '3870', '304', 'Torreira');
INSERT INTO `Morada` VALUES ('126', 'Urbanização da Torreirinha', '48', null, '3870', '366', 'Torreira');
INSERT INTO `Morada` VALUES ('127', 'Av. 12 de Julho', '4', '1', '3870', '391', 'Torreira');
INSERT INTO `Morada` VALUES ('128', 'Areosa do Norte', '17', null, '3860', '204', 'Estarreja');
INSERT INTO `Morada` VALUES ('129', 'Rua das Tílias', '104', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('130', 'Rua Marques Rodrigues', '52', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('131', 'Urb. Torreirinha', '19', null, '3870', '366', 'Torreira');
INSERT INTO `Morada` VALUES ('132', 'Rua da Quinta Velha', '548', '3', '3860', '299', 'Estarreja');
INSERT INTO `Morada` VALUES ('133', 'Rua Padre Joaquim Domingues da Silva', '6', null, '3865', '031', 'Canelas-Estarreja');
INSERT INTO `Morada` VALUES ('134', 'Rua da Estrada', '176', null, '3870', '195', 'Murtosa');
INSERT INTO `Morada` VALUES ('135', 'Rua Dr António Maria - Feital - Loureiro', '271', null, '3720', '055', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('136', 'Rua Dr António de Abreu Freire', '2', '2', '3860', '251', 'Estarreja');
INSERT INTO `Morada` VALUES ('137', 'Travessa do Crasto - Santo Amaro', '3', null, '3860', '323', 'Estarreja');
INSERT INTO `Morada` VALUES ('138', 'Rua da Balsa', '44', null, '3865', '211', 'Salreu');
INSERT INTO `Morada` VALUES ('139', 'Rua Nossa Senhora das Areias', '87', null, '3800', '901', 'São Jacinto');
INSERT INTO `Morada` VALUES ('140', 'Rua Padre Donaciano Abreu Freire', '12', '1', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('141', 'Travessa do Outeiro do Coval', '17', null, '3860', '258', 'Estarreja');
INSERT INTO `Morada` VALUES ('142', 'Rua Prof  Cecília Oliveira - Póvoa de baixo', '20', null, '3860', '269', 'Estarreja');
INSERT INTO `Morada` VALUES ('143', 'Travessa Santo António Veiros', '14', null, '3860', '648', 'Estarreja');
INSERT INTO `Morada` VALUES ('144', 'Rua Desembargador Oliveira Pinto', '157', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('145', 'Rua do Rato', '143', null, '3870', '870', 'Monte - Murtosa');
INSERT INTO `Morada` VALUES ('146', 'Rua Tomás Figueiredo', '14', '', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('147', 'Rua dos Passadouros', '49', null, '3870', '028', 'Bunheiro');
INSERT INTO `Morada` VALUES ('148', 'Rua General Artur Beirão', '68', null, '3865', '029', 'Canelas');
INSERT INTO `Morada` VALUES ('149', 'Rua Padre Donaciano Abreu Freire', '10', '2', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('150', 'Rua Padre José  Possidonio Henriques', '12', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('151', 'Travessa do Falcão', '8', null, '3865', '004', 'Canelas');
INSERT INTO `Morada` VALUES ('152', 'Rua do norte - Rochico', '69', null, '3865', '110', 'Fermelã');
INSERT INTO `Morada` VALUES ('153', 'Rua da Feiteira - Povoa de Baixo', '12', null, '3860', '263', 'Estarreja');
INSERT INTO `Morada` VALUES ('154', 'Rua da Bandulha', '34', null, '3865', '001', 'Canelas');
INSERT INTO `Morada` VALUES ('155', 'Rua General Themudo Barata', '26', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('156', 'Rua Padre Donaciano Abreu Freire', '10', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('157', 'Rua Fundação Benjamim Dias Costa', '11', null, '3860', '153', 'Avanca');
INSERT INTO `Morada` VALUES ('158', 'Rua Dr Joaquim Rodrigues da Silva', '17', null, '3865', '219', 'Salreu');
INSERT INTO `Morada` VALUES ('159', 'Rua Padre José Possidónio Henriques', '20', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('160', 'Rua Padre José Possidónio Henriques', '20', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('161', 'Avenida 25 de Abril - Ed Palácio-Bloco C', '10', '1', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('162', 'Rua da Formiga - Moradia C', '8', null, '3850', '571', 'Branca');
INSERT INTO `Morada` VALUES ('163', 'Beco do Salgueiro', '10', null, '3860', '512', 'Pardilhó');
INSERT INTO `Morada` VALUES ('164', 'Rua António Vieira Pinto', '31', null, '3870', '127', 'Monte-Murtosa');
INSERT INTO `Morada` VALUES ('165', 'Rua D. Manuel l', '0', '7', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('166', 'Rua da Imprensa', '68', null, '3860', '496', 'Pardilhó');
INSERT INTO `Morada` VALUES ('167', 'Rua do Arieiro', '7', null, '3865', '203', 'Salreu');
INSERT INTO `Morada` VALUES ('168', 'Rua Maurício de Almeida - Urb. Póvoa de Baixo', '117', null, '3860', '349', 'Estarreja');
INSERT INTO `Morada` VALUES ('169', 'Rua Desembargador Oliveira Pinto', '2', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('170', 'Quinta do Valdujo', '0', null, '3865', '240', 'Salreu');
INSERT INTO `Morada` VALUES ('171', 'Rua Dr. Joaquim Simões', '230', '3', '3860', '339', 'Estarreja');
INSERT INTO `Morada` VALUES ('172', 'Rua Dr. Tavares da Silva', '1', null, '3860', '377', 'Estarreja');
INSERT INTO `Morada` VALUES ('173', 'Rua Dr  Manuel Andrade', '139', '1ºC', '3860', '372', 'Estarreja');
INSERT INTO `Morada` VALUES ('174', 'Av 12 de Julho', '4', null, '3870', '391', 'Torreira');
INSERT INTO `Morada` VALUES ('175', 'Rua Sidonio Pais', '21', null, '3870', '177', 'Murtosa');
INSERT INTO `Morada` VALUES ('176', 'Rua Adou de Cima', '47', null, '3865', '202', 'Salreu');
INSERT INTO `Morada` VALUES ('177', 'Rua Luis de Camões', '56', '1', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('178', 'Rua Desembargador Oliveira Pinto', '29', null, '3865', '273', 'Salreu');
INSERT INTO `Morada` VALUES ('179', 'Rua do Chão-Velho', '17', null, '3870', '145', 'Murtosa');
INSERT INTO `Morada` VALUES ('180', 'Rua Desembargador Oliveira Pinto', '24', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('181', 'Rua José Maria da Silva Garganta', '5', null, '3860', '663', 'Veiros');
INSERT INTO `Morada` VALUES ('182', 'Rua de Pintim', '760', null, '3880', '511', 'Válega');
INSERT INTO `Morada` VALUES ('183', 'Rua Maria Lurdes Abreu', '1', null, '3865', '865', 'Salreu');
INSERT INTO `Morada` VALUES ('184', 'Rua da Aldeia', '17', null, '3865', '301', 'Canelas');
INSERT INTO `Morada` VALUES ('185', 'Travessa do Outeiro', '1', null, '3860', '264', 'Estarreja');
INSERT INTO `Morada` VALUES ('186', 'Rua Isabel Cartas', '2', null, '3860', '712', 'Estarreja');
INSERT INTO `Morada` VALUES ('187', 'Rua 15 de Maio', '933', null, '3880', '503', 'Válega');
INSERT INTO `Morada` VALUES ('188', 'Fradelos - Branca', '0', null, '3850', '057', 'Albergaria a Velha');
INSERT INTO `Morada` VALUES ('189', 'Rua Arrais João Faustino', '15', null, '3870', '332', 'Torreira');
INSERT INTO `Morada` VALUES ('190', 'Rua Dr Albino dos Reis', '570', '1º And', '3720', '067', 'Loureiro');
INSERT INTO `Morada` VALUES ('191', 'Rua da Teixeira', '27', null, '3865', '016', 'Canelas');
INSERT INTO `Morada` VALUES ('192', 'Rua de S. Martinho', '34', null, '3865', '271', 'Salreu');
INSERT INTO `Morada` VALUES ('193', 'Rua da Igreja', '13', null, '3800', '901', 'S. Jacinto');
INSERT INTO `Morada` VALUES ('194', 'Rua da Estrada', '173', '0', '3870', '065', 'Murtosa');
INSERT INTO `Morada` VALUES ('195', 'Rua Dr Barbosa Magalhães', '19', null, '3870', '212', 'Murtosa');
INSERT INTO `Morada` VALUES ('196', 'Rua Conselheiro José Luciano de Castro', '144', '2º', '3860', '358', 'Estarreja');
INSERT INTO `Morada` VALUES ('197', 'Rua do Professor Primario', '4', null, '3860', '260', 'Estarreja');
INSERT INTO `Morada` VALUES ('198', 'Rua Tomás de Figueiredo', '95', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('199', 'Tv. Fonte de S. Martinho', '3', null, '3865', '329', 'Salreu');
INSERT INTO `Morada` VALUES ('200', 'Travessa Canto do Esteiro', '5', null, '3860', '270', 'Estarreja');
INSERT INTO `Morada` VALUES ('201', 'Rua do Lavrador', '8', null, '3860', '215', 'Estarreja');
INSERT INTO `Morada` VALUES ('202', 'Rua da Saudade', '54', null, '3870', '159', 'Murtosa');
INSERT INTO `Morada` VALUES ('203', 'Rua Desembargador Correia Teles', '1', '2º', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('204', 'Rua de Bertufe', '53', null, '3880', '569', 'Válega');
INSERT INTO `Morada` VALUES ('205', 'Rua Padre Donaciano de Abreu Freire', '12', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('206', 'Urb. Povoa de Baixo - Rua das Tilias', '105', null, '3860', '348', 'Estarreja');
INSERT INTO `Morada` VALUES ('207', 'Rua de Salreu', '22', null, '3865', '286', 'Salreu');
INSERT INTO `Morada` VALUES ('208', 'Rua Domingos José da Costa', '38', null, '3720', '284', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('209', 'Largo do Matinho', '14', null, '3865', '105', 'Fermelã');
INSERT INTO `Morada` VALUES ('210', 'Rua Padre António Maria Pinho', '202', '2ºesq', '3860', '383', 'Estarreja');
INSERT INTO `Morada` VALUES ('211', 'Rua das Chouninhas', '166', null, '3860', '093', 'Avanca');
INSERT INTO `Morada` VALUES ('212', 'Rua do Mato', '6', null, '3865', '255', 'Salreu');
INSERT INTO `Morada` VALUES ('213', 'Teixugueira', '222', '2ºD', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('214', 'Beco das Barreiras', '6', '1', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('215', 'Rua Padre Donaciano Abreu Freire', '43', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('216', 'Rua do Professor Primário', '15', '1', '3860', '260', 'Estarreja');
INSERT INTO `Morada` VALUES ('217', 'Rua Joaquim Bastos - Madail', '461', null, '3720', '116', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('218', 'Rua Agostinho Leite', '51', null, '3860', '357', 'Estarreja');
INSERT INTO `Morada` VALUES ('219', 'Av. 25 de Abril - Ed. Palácio - Bl. C', '10', '0', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('220', 'Rua Fonte dos Luendros - casa 8', '4', null, '3850', '587', 'Soutelo');
INSERT INTO `Morada` VALUES ('221', 'Rua Prof. António Ferreira Pitarma', '0', null, '3860', '443', 'Pardilhó');
INSERT INTO `Morada` VALUES ('222', 'Rua Desembargador Correia Teles', '310', '2', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('223', 'Rua Manuel José Dias, 35', '35', null, '3870', '031', 'Bunheiro');
INSERT INTO `Morada` VALUES ('224', 'Rua do Fertal', '39', null, '3870', '021', 'Bunheiro');
INSERT INTO `Morada` VALUES ('225', 'Rua do Fertal', '39', null, '3870', '021', 'Bunheiro');
INSERT INTO `Morada` VALUES ('226', 'Rua da cabine', '4', null, '3870', '140', 'Murtosa');
INSERT INTO `Morada` VALUES ('227', 'Beco das Barreiras', '6', '1', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('228', 'Travessa do Outeiro do Coval', '17', '0', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('229', 'Rua Pedro Calado', '1', null, '3865', '285', 'Salreu');
INSERT INTO `Morada` VALUES ('230', 'Rua Pedro Calado', '1', null, '3865', '285', 'Salreu');
INSERT INTO `Morada` VALUES ('231', 'Travessa do Outeiro do Coval', '17', null, '3860', '258', 'Estarreja');
INSERT INTO `Morada` VALUES ('232', 'Rua Padre Donaciano Abreu Freire', '10', '2', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('233', 'Travessa Outeiro Coval 17', '1517', '0', '3860', '258', 'Estarreja');
INSERT INTO `Morada` VALUES ('234', 'Travessa Outeiro Coval', '17', null, '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('235', 'Rua dos Percursores', '12', '1', '3870', '211', 'Murtosa');
INSERT INTO `Morada` VALUES ('236', 'Rua 15 de Maio', '933', null, '3880', '503', 'Válega');
INSERT INTO `Morada` VALUES ('237', 'Fradelos - Branca', '0', null, '3850', '057', 'Albergaria a Velha');
INSERT INTO `Morada` VALUES ('238', 'Rua Isabel Cartas', '2', null, '3860', '712', 'Estarreja');
INSERT INTO `Morada` VALUES ('271', 'Travessa do Outeiro', '1', null, '3860', '264', 'Estarreja');
INSERT INTO `Morada` VALUES ('272', 'Rua Arrais João Faustino', '15', null, '3870', '332', 'Torreira');
INSERT INTO `Morada` VALUES ('273', 'Rua de S. Martinho', '34', null, '3865', '271', 'Salreu');
INSERT INTO `Morada` VALUES ('274', 'Rua da Estrada', '173', '0', '3870', '065', 'Murtosa');
INSERT INTO `Morada` VALUES ('275', 'Rua Dr Barbosa Magalhães', '19', null, '3870', '212', 'Murtosa');
INSERT INTO `Morada` VALUES ('276', 'Rua da Igreja', '13', null, '3800', '901', 'S. Jacinto');
INSERT INTO `Morada` VALUES ('277', 'Rua da Teixeira', '27', null, '3865', '016', 'Canelas');
INSERT INTO `Morada` VALUES ('278', 'Rua Maria Lurdes Abreu', '1', null, '3865', '865', 'Salreu');
INSERT INTO `Morada` VALUES ('279', 'Rua da Aldeia', '17', null, '3865', '301', 'Canelas');
INSERT INTO `Morada` VALUES ('280', 'Rua Banda Musical', '660', null, '3720', '069', 'Loureiro');
INSERT INTO `Morada` VALUES ('281', 'Avenida 25 de Abril - Ed Palácio-Bloco C', '10', '1', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('282', 'Rua da Imprensa', '68', null, '3860', '496', 'Pardilhó');
INSERT INTO `Morada` VALUES ('283', 'Rua da Formiga - Moradia C', '8', null, '3850', '571', 'Branca');
INSERT INTO `Morada` VALUES ('284', 'Rua Adou de Cima', '47', null, '3865', '202', 'Salreu');
INSERT INTO `Morada` VALUES ('285', 'Beco do Salgueiro', '10', null, '3860', '512', 'Pardilhó');
INSERT INTO `Morada` VALUES ('286', 'Rua Luis de Camões', '56', '1', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('287', 'Rua António Vieira Pinto', '31', null, '3870', '127', 'Monte-Murtosa');
INSERT INTO `Morada` VALUES ('288', 'Rua Desembargador Oliveira Pinto', '29', null, '3865', '273', 'Salreu');
INSERT INTO `Morada` VALUES ('289', 'Rua Desembargador Oliveira Pinto', '2', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('290', 'Rua Dr. Joaquim Simões', '230', '3', '3860', '339', 'Estarreja');
INSERT INTO `Morada` VALUES ('291', 'Av 12 de Julho', '4', null, '3870', '391', 'Torreira');
INSERT INTO `Morada` VALUES ('292', 'Rua do Arieiro', '7', null, '3865', '203', 'Salreu');
INSERT INTO `Morada` VALUES ('293', 'Rua José Maria da Silva Garganta', '5', null, '3860', '663', 'Veiros');
INSERT INTO `Morada` VALUES ('294', 'Rua Dr. Tavares da Silva', '1', null, '3860', '377', 'Estarreja');
INSERT INTO `Morada` VALUES ('295', 'Quinta do Valdujo', '0', null, '3865', '240', 'Salreu');
INSERT INTO `Morada` VALUES ('296', 'Rua do Chão-Velho', '17', null, '3870', '145', 'Murtosa');
INSERT INTO `Morada` VALUES ('297', 'Rua Dr  Manuel Andrade', '139', '1ºC', '3860', '372', 'Estarreja');
INSERT INTO `Morada` VALUES ('298', 'Rua Desembargador Oliveira Pinto', '24', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('299', 'Rua D. Manuel l', '0', '7', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('300', 'Rua Sidonio Pais', '21', null, '3870', '177', 'Murtosa');
INSERT INTO `Morada` VALUES ('301', 'Rua Maurício de Almeida - Urb. Póvoa de Baixo', '117', null, '3860', '349', 'Estarreja');
INSERT INTO `Morada` VALUES ('302', 'Rua Padre José  Possidonio Henriques', '12', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('303', 'Rua Dr Joaquim Rodrigues da Silva', '17', null, '3865', '219', 'Salreu');
INSERT INTO `Morada` VALUES ('304', 'Rua General Artur Beirão', '68', null, '3865', '029', 'Canelas');
INSERT INTO `Morada` VALUES ('305', 'Travessa do Crasto - Santo Amaro', '3', null, '3860', '323', 'Estarreja');
INSERT INTO `Morada` VALUES ('306', 'Rua Fundação Benjamim Dias Costa', '11', null, '3860', '153', 'Avanca');
INSERT INTO `Morada` VALUES ('307', 'Rua da Feiteira - Povoa de Baixo', '12', null, '3860', '263', 'Estarreja');
INSERT INTO `Morada` VALUES ('308', 'Rua Desembargador Oliveira Pinto', '157', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('309', 'Rua Dr António de Abreu Freire', '2', '2', '3860', '251', 'Estarreja');
INSERT INTO `Morada` VALUES ('310', 'Rua Padre Donaciano Abreu Freire', '10', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('311', 'Travessa do Falcão', '8', null, '3865', '004', 'Canelas');
INSERT INTO `Morada` VALUES ('312', 'Rua Padre José Possidónio Henriques', '20', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('313', 'Rua Santo António-Madalena', '135', null, '4405', '784', 'vila Nova de Gaia');
INSERT INTO `Morada` VALUES ('314', 'Rua General Themudo Barata', '26', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('315', 'Rua dos Passadouros', '49', null, '3870', '028', 'Bunheiro');
INSERT INTO `Morada` VALUES ('316', 'Rua da Bandulha', '34', null, '3865', '001', 'Canelas');
INSERT INTO `Morada` VALUES ('317', 'Rua Padre Garrido', '18', null, '3860', '385', 'Estarreja');
INSERT INTO `Morada` VALUES ('318', 'Travessa Santo António Veiros', '14', null, '3860', '648', 'Estarreja');
INSERT INTO `Morada` VALUES ('319', 'Rua Prof  Cecília Oliveira - Póvoa de baixo', '20', null, '3860', '269', 'Estarreja');
INSERT INTO `Morada` VALUES ('320', 'Rua Tomás Figueiredo', '14', '', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('321', 'Rua Padre José Possidónio Henriques', '20', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('322', 'Rua Nossa Senhora das Areias', '87', null, '3800', '901', 'São Jacinto');
INSERT INTO `Morada` VALUES ('323', 'Rua da Brejinha', '20', null, '3860', '296', 'Estarreja');
INSERT INTO `Morada` VALUES ('324', 'Rua Nova - Urbanização Porto Riba - Fracção F - Soutelo- Branca', '1', null, '3850', '587', 'Albergaria a Velha');
INSERT INTO `Morada` VALUES ('325', 'Rua Desembargador Correia Teles', '310', '2', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('326', 'Rua Direira', '3', null, '3865', '022', 'Canelas');
INSERT INTO `Morada` VALUES ('327', 'Rua das Tílias', '17', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('328', 'Rua Conde Ferreira', '65', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('329', 'Lugar das Arrotas-Pardelhas', '31', null, '3870', '193', 'Murtosa');
INSERT INTO `Morada` VALUES ('330', 'Rua Maria de Lurdes Breu', '61', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('331', 'Largo do Matinho', '14', null, '3865', '105', 'Fermelã - Estarreja ');
INSERT INTO `Morada` VALUES ('332', 'Urbanização da Póvoa de Baixo', '223', null, '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('333', 'Rua Marques Rodrigues', '17', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('334', 'Rua Mártires da Pátria - Veiros', '5', null, '3860', '636', 'Estarreja');
INSERT INTO `Morada` VALUES ('335', 'Avenida 25 de Abril - Ed. Pais Pinto ', '77', '4', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('336', 'Rua António Maria Silva e Pinho - Pardilhó', '121', null, '3860', '431', 'Pardilhó');
INSERT INTO `Morada` VALUES ('337', 'Rua D. Francisco Nunes Teixeira', '31', null, '3860', '289', 'Estarreja');
INSERT INTO `Morada` VALUES ('338', 'Rua de Macau - Sargaçal ', '116', '1', '3880', '644', 'Válega');
INSERT INTO `Morada` VALUES ('339', 'Rua Dr Agostinho L.P. Valente', '25', null, '3860', '436', 'Pardilhó');
INSERT INTO `Morada` VALUES ('340', 'Rua Professor Dr Egas Moniz', '10', '1', '3860', '078', 'Avanca');
INSERT INTO `Morada` VALUES ('341', 'Rua da Estrada', '176', null, '3870', '195', 'Murtosa');
INSERT INTO `Morada` VALUES ('342', 'Rua Marques Rodrigues', '52', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('343', 'Rua Dr António Maria - Feital - Loureiro', '271', null, '3720', '055', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('344', 'Rua dos Tarolas', '7', null, '3860', '715', 'Pardilhó');
INSERT INTO `Morada` VALUES ('345', 'Rua das Barreira', '1', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('346', 'Rua D. Dinis', '58', null, '3870', '162', 'Murtosa');
INSERT INTO `Morada` VALUES ('347', 'Rua da Raia Seca - fundo do pinheiro', '78', null, '3720', '475', 'Pinheiro da Bemposta');
INSERT INTO `Morada` VALUES ('348', 'Av. 12 de Julho', '4', '1', '3870', '391', 'Torreira');
INSERT INTO `Morada` VALUES ('349', 'Av. 25 de Abril', '55', '4º esq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('350', 'Rua da Feira Santo Amaro', '25', null, '3860', '318', 'Estarreja');
INSERT INTO `Morada` VALUES ('351', 'Rua da Rigueirinha', '35', null, '3870', '268', 'Murtosa');
INSERT INTO `Morada` VALUES ('352', 'Edíficio Flamingo-Bloco B-RC Direito-Estrada de São Filipe', '1', null, '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('353', 'Rua Germano Cruz', '19', null, '3870', '288', 'Monte - Murtosa');
INSERT INTO `Morada` VALUES ('354', 'Urb. Torreirinha', '19', null, '3870', '366', 'Torreira');
INSERT INTO `Morada` VALUES ('355', 'Rua Bairro São Filipe - Póvoa de Cima', '1', null, '3860', '292', 'Estarreja');
INSERT INTO `Morada` VALUES ('356', 'Rua Desembargador Oliveira Pinto', '12', '0', '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('357', 'Urbanização da Póvoa de Baixo', '228', null, '3860', '350', 'Estarreja');
INSERT INTO `Morada` VALUES ('358', 'Rua do Areal - Ed. Areal', '5', '1', '3870', '406', 'Torreira');
INSERT INTO `Morada` VALUES ('359', 'Rua Jornal de Estarreja', '43', '1', '3860', '365', 'Estarreja');
INSERT INTO `Morada` VALUES ('360', 'Rua do Falcão', '170', null, '3860', '160', 'Avanca');
INSERT INTO `Morada` VALUES ('361', 'Rua Cidade Porto Novo - Urb. Póvoa de baixo', '215', null, '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('362', 'Rua Visconde Valdemouro', '23', '3', '3860', '389', 'Estarreja');
INSERT INTO `Morada` VALUES ('363', 'Rua Barreiro de Cima', '17', null, '3860', '207', 'Estarreja');
INSERT INTO `Morada` VALUES ('364', 'Rua Quinta Velha', '548', '1', '3860', '299', 'Estarreja');
INSERT INTO `Morada` VALUES ('365', 'Estrada Nacional 327-Quintas do Norte', '467', null, '3870', '303', 'Torreira');
INSERT INTO `Morada` VALUES ('366', 'Av. 25 de Abril', '53', '3', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('367', 'Beco do Outeiro Alto', '12', null, '2870', '027', 'Bunheiro');
INSERT INTO `Morada` VALUES ('368', 'Rua Fonte dos batizados', '16', null, '3860', '223', 'Estarreja');
INSERT INTO `Morada` VALUES ('369', 'Rua Tomé', '17', null, '3865', '288', 'Salreu');
INSERT INTO `Morada` VALUES ('370', 'Rua General Themudo Barata', '15', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('371', 'Arrotinha - Edif Antão', '9', null, '3860', '210', 'Estarreja');
INSERT INTO `Morada` VALUES ('372', 'Travessa Dr António Duarte de Oliveira', '6', null, '3860', '051', 'Avanca');
INSERT INTO `Morada` VALUES ('373', 'Rua Padre Donaciano Abreu Freire', '43', '4', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('374', 'Teixugueira', '222', '2ºD', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('375', 'Rua da Saudade', '54', null, '3870', '159', 'Murtosa');
INSERT INTO `Morada` VALUES ('376', 'Rua Luis de Camões', '42', '2', '3830', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('377', 'Rua Conselheiro José Luciano de Castro', '144', '2º', '3860', '358', 'Estarreja');
INSERT INTO `Morada` VALUES ('378', 'Rua do Professor Primario', '4', null, '3860', '260', 'Estarreja');
INSERT INTO `Morada` VALUES ('379', 'Rua Padre António Maria Pinho', '202', '2ºesq', '3860', '383', 'Estarreja');
INSERT INTO `Morada` VALUES ('380', 'Rua Tomás de Figueiredo', '95', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('381', 'Rua de Bertufe', '53', null, '3880', '569', 'Válega');
INSERT INTO `Morada` VALUES ('382', 'Rua do Lavrador', '8', null, '3860', '215', 'Estarreja');
INSERT INTO `Morada` VALUES ('383', 'Rua do Mato', '6', null, '3865', '255', 'Salreu');
INSERT INTO `Morada` VALUES ('384', 'Rua das Chouninhas', '166', null, '3860', '093', 'Avanca');
INSERT INTO `Morada` VALUES ('385', 'Tv. Fonte de S. Martinho', '3', null, '3865', '329', 'Salreu');
INSERT INTO `Morada` VALUES ('386', 'Urb. Povoa de Baixo - Rua das Tilias', '105', null, '3860', '348', 'Estarreja');
INSERT INTO `Morada` VALUES ('387', 'Rua de Salreu', '22', null, '3865', '286', 'Salreu');
INSERT INTO `Morada` VALUES ('388', 'Rua Padre Donaciano de Abreu Freire', '12', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('389', 'Largo do Matinho', '14', null, '3865', '105', 'Fermelã');
INSERT INTO `Morada` VALUES ('390', 'Travessa Canto do Esteiro', '5', null, '3860', '270', 'Estarreja');
INSERT INTO `Morada` VALUES ('391', 'rua padre donaciano abreu freire', '10', '3', '3860', '284', 'Estarreja');
INSERT INTO `Morada` VALUES ('392', 'rua de teste', '123', null, '1122', '221', 'Estarreja');
INSERT INTO `Morada` VALUES ('393', 'Rua da Galiza, Lote 3', '17', '2', '3720', '125', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('394', 'Travessa do Bairro S. Filipe, - Póvoa de Cima', '8', null, '3860', '295', 'Estarreja');
INSERT INTO `Morada` VALUES ('395', 'Rua dos Barreiros - Barreiro de Cima', '20', null, '3860', '216', 'Estarreja');
INSERT INTO `Morada` VALUES ('396', 'Rua Dr. João Carlos Vaz Cunha', '73', null, '3870', '355', 'Torreira');
INSERT INTO `Morada` VALUES ('397', 'Rua Póvoa de Baixo', '30', null, '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('452', 'Estrada Nacional 109', '76', 'R/C', '3865', '011', 'Canelas');
INSERT INTO `Morada` VALUES ('453', 'Rua General Themudo Barata', '12', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('454', 'Rua do infantado', '28', null, '3860', '360', 'Estarreja');
INSERT INTO `Morada` VALUES ('455', 'Rua Marques Rodrigues - Quinta Costeira', '27', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('456', 'Rua de Trás', '194', null, '3860', '361', 'Estarreja');
INSERT INTO `Morada` VALUES ('457', 'Rua João Augusto Sousa Fernandes', '70', null, '3860', '601', 'Veiros');
INSERT INTO `Morada` VALUES ('458', 'Rua Tomaz de Figueiredo - Bloco 226 - R/C A', '43', null, '3860', '261', 'Estarreja');
INSERT INTO `Morada` VALUES ('459', 'Rua Dr Manuel Andrade', '45', null, '3865', '033', 'Canelas');
INSERT INTO `Morada` VALUES ('460', 'Largo 5 de Outubro', '23', '3', '3880', '062', 'Ovar');
INSERT INTO `Morada` VALUES ('461', 'Largo 5 de Outubro', '23', '3', '3880', '062', 'Ovar');
INSERT INTO `Morada` VALUES ('462', 'Av. Visconde Salreu', '9', null, '3860', '254', 'Salreu');
INSERT INTO `Morada` VALUES ('463', 'Rua D. Manuel - Conjunto Altamira', '85', '2ºDD', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('464', 'Rua do Serrano - Deveza Santiais', '4', null, '3860', '245', 'Estarreja');
INSERT INTO `Morada` VALUES ('465', 'Rua 15 de Maio ', '705', null, '3880', '503', 'Valega');
INSERT INTO `Morada` VALUES ('466', 'Rua da Ribeirinha', '35', null, '3870', '268', 'Murtosa');
INSERT INTO `Morada` VALUES ('467', 'Travessa da Escola Primária', '12', null, '3860', '314', 'Estarreja');
INSERT INTO `Morada` VALUES ('468', 'Av 25 de Abril', '65', '3ºesq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('469', 'Rua Padre Donaciano Abreu Freire', '12', '5ºesq', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('470', 'Rua Padre Donaciano Abreu Freire', '12', '5', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('471', 'Rua General Themudo Barata', '12', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('472', 'Rua Picoto sul - Canelas', '14', null, '3865', '032', 'Estarreja');
INSERT INTO `Morada` VALUES ('473', 'Rua do Mercado - Pardelhas', '15', null, '3870', '101', 'Murtosa');
INSERT INTO `Morada` VALUES ('474', 'Rua da Póvoa de Baixo', '34', null, '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('475', 'Rua do Outeiro, Beduído', '27', null, '3860', '230', 'Estarreja');
INSERT INTO `Morada` VALUES ('476', 'Rua São Geraldo', '60', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('477', 'Travessa Santo António', '18', null, '3860', '648', 'Veiros');
INSERT INTO `Morada` VALUES ('478', 'RuaTomas Figueiredo - Bloco 228 - R/c A', '0', '0', '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('479', 'Travessa Outeiro Coval', '171717', null, '3860', '258', 'Estarreja');
INSERT INTO `Morada` VALUES ('480', 'Rua de S. Tiago', '27', '1', '3860', '301', 'Estarreja');
INSERT INTO `Morada` VALUES ('481', 'Travessa Ferreira de Castro', '1', null, '3870', '099', 'Murtosa');
INSERT INTO `Morada` VALUES ('482', 'Rua Zeferino Pereira -  Damonde de Baixo', '79', null, '3720', '567', 'Travanca OAZ');
INSERT INTO `Morada` VALUES ('483', 'Rua S. Joaquim - Santiais', '17', null, '3860', '312', 'Estarreja');
INSERT INTO `Morada` VALUES ('484', 'Rua dos Catrazanas - Monte', '17', null, '3870', '105', 'Murtosa');
INSERT INTO `Morada` VALUES ('485', 'Rua da Ribeira', '25', null, '3880', '507', 'Valega');
INSERT INTO `Morada` VALUES ('486', 'Rua dos Margidos,Quintas do Norte', '13', null, '3870', '303', 'Torreira');
INSERT INTO `Morada` VALUES ('487', 'Rua do Serrado', '0', null, '3720', '000', 'Loureiro');
INSERT INTO `Morada` VALUES ('488', 'Rua dos Engenhos', '502', null, '3880', '682', 'Válega');
INSERT INTO `Morada` VALUES ('489', 'Rua de Bertufe', '24', '', '3880', '569', 'Válega');
INSERT INTO `Morada` VALUES ('490', 'Rua São Geraldo', '67', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('491', 'Rua do Areal', '15', '1º Dt.', '3870', '420', 'Torreira');
INSERT INTO `Morada` VALUES ('492', 'Rua do Areal', '15', '1', '3870', '420', 'Torreira');
INSERT INTO `Morada` VALUES ('493', 'Rua Dr António de Abreu Freire', '2', '2', '3860', '251', 'Estarreja');
INSERT INTO `Morada` VALUES ('494', 'Travessa do Crasto - Santo Amaro', '3', null, '3860', '323', 'Estarreja');
INSERT INTO `Morada` VALUES ('495', 'Rua Nossa Senhora das Areias', '87', null, '3800', '901', 'São Jacinto');
INSERT INTO `Morada` VALUES ('496', 'Rua Padre Donaciano Abreu Freire', '12', '1', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('497', 'Rua Prof  Cecília Oliveira - Póvoa de baixo', '20', null, '3860', '269', 'Estarreja');
INSERT INTO `Morada` VALUES ('498', 'Travessa Santo António Veiros', '14', null, '3860', '648', 'Estarreja');
INSERT INTO `Morada` VALUES ('499', 'Rua Desembargador Oliveira Pinto', '157', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('500', 'Rua da Corredoura', '25', null, '3800', '132', 'Fermelã');
INSERT INTO `Morada` VALUES ('501', 'Rua do Rato', '143', null, '3870', '870', 'Monte - Murtosa');
INSERT INTO `Morada` VALUES ('502', 'Rua Tomás Figueiredo', '14', '', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('503', 'Rua dos Passadouros', '49', null, '3870', '028', 'Bunheiro');
INSERT INTO `Morada` VALUES ('504', 'Rua Padre Donaciano Abreu Freire', '10', '2', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('505', 'Rua Padre José  Possidonio Henriques', '12', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('506', 'Travessa do Falcão', '8', null, '3865', '004', 'Canelas');
INSERT INTO `Morada` VALUES ('507', 'Rua da Feiteira - Povoa de Baixo', '12', null, '3860', '263', 'Estarreja');
INSERT INTO `Morada` VALUES ('508', 'Rua da Bandulha', '34', null, '3865', '001', 'Canelas');
INSERT INTO `Morada` VALUES ('509', 'Rua General Themudo Barata', '26', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('510', 'Rua Padre Donaciano Abreu Freire', '10', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('511', 'Rua Fundação Benjamim Dias Costa', '11', null, '3860', '153', 'Avanca');
INSERT INTO `Morada` VALUES ('512', 'Rua Dr Joaquim Rodrigues da Silva', '17', null, '3865', '219', 'Salreu');
INSERT INTO `Morada` VALUES ('513', 'Rua Padre José Possidónio Henriques', '20', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('514', 'Rua Padre José Possidónio Henriques', '20', null, '3860', '593', 'Veiros');
INSERT INTO `Morada` VALUES ('515', 'Rua Manuel José Dias, 35', '35', null, '3870', '031', 'Bunheiro');
INSERT INTO `Morada` VALUES ('516', 'Rua Manuel José Dias, 35', '35', null, '3870', '031', 'Bunheiro');
INSERT INTO `Morada` VALUES ('517', 'Rua do Fertal', '39', null, '3870', '021', 'Bunheiro');
INSERT INTO `Morada` VALUES ('518', 'Rua do Fertal', '39', null, '3870', '021', 'Bunheiro');
INSERT INTO `Morada` VALUES ('519', 'Rua do Fertal', '39', null, '3870', '021', 'Bunheiro');
INSERT INTO `Morada` VALUES ('520', 'Rua do Fertal', '39', null, '3870', '021', 'Bunheiro');
INSERT INTO `Morada` VALUES ('521', 'Rua da cabine', '4', null, '3870', '140', 'Murtosa');
INSERT INTO `Morada` VALUES ('522', 'Rua da cabine', '4', null, '3870', '140', 'Murtosa');
INSERT INTO `Morada` VALUES ('523', 'Beco das Barreiras', '6', '1', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('524', 'Beco das Barreiras', '6', '1', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('525', 'Beco das Barreiras', '6', '1', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('526', 'Beco das Barreiras', '6', '1', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('527', 'Rua Padre Donaciano Abreu Freire', '43', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('528', 'Rua Padre Donaciano Abreu Freire', '43', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('529', 'Rua do Professor Primário', '15', '1', '3860', '260', 'Estarreja');
INSERT INTO `Morada` VALUES ('530', 'Rua do Professor Primário', '15', '1', '3860', '260', 'Estarreja');
INSERT INTO `Morada` VALUES ('531', 'Rua Joaquim Bastos - Madail', '461', null, '3720', '116', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('532', 'Rua Joaquim Bastos - Madail', '461', null, '3720', '116', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('533', 'Rua Agostinho Leite', '51', null, '3860', '357', 'Estarreja');
INSERT INTO `Morada` VALUES ('534', 'Rua Agostinho Leite', '51', null, '3860', '357', 'Estarreja');
INSERT INTO `Morada` VALUES ('535', 'Av. 25 de Abril - Ed. Palácio - Bl. C', '10', '0', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('536', 'Av. 25 de Abril - Ed. Palácio - Bl. C', '10', '0', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('537', 'Rua Fonte dos Luendros - casa 8', '4', null, '3850', '587', 'Soutelo');
INSERT INTO `Morada` VALUES ('538', 'Rua Fonte dos Luendros - casa 8', '4', null, '3850', '587', 'Soutelo');
INSERT INTO `Morada` VALUES ('539', 'Rua Prof. António Ferreira Pitarma', '0', null, '3860', '443', 'Pardilhó');
INSERT INTO `Morada` VALUES ('540', 'Rua Prof. António Ferreira Pitarma', '0', null, '3860', '443', 'Pardilhó');
INSERT INTO `Morada` VALUES ('541', 'Rua Desembargador Correia Teles', '310', '2', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('542', 'Rua Desembargador Correia Teles', '310', '2', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('543', 'Rua Conselheiro José Luciano de Castro', '144', '2º', '3860', '358', 'Estarreja');
INSERT INTO `Morada` VALUES ('544', 'Rua do Professor Primario', '4', null, '3860', '260', 'Estarreja');
INSERT INTO `Morada` VALUES ('545', 'Rua Tomás de Figueiredo', '95', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('546', 'Tv. Fonte de S. Martinho', '3', null, '3865', '329', 'Salreu');
INSERT INTO `Morada` VALUES ('547', 'Travessa Canto do Esteiro', '5', null, '3860', '270', 'Estarreja');
INSERT INTO `Morada` VALUES ('548', 'Rua do Lavrador', '8', null, '3860', '215', 'Estarreja');
INSERT INTO `Morada` VALUES ('549', 'Rua da Saudade', '54', null, '3870', '159', 'Murtosa');
INSERT INTO `Morada` VALUES ('550', 'Rua Desembargador Correia Teles', '1', '2º', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('551', 'Rua de Bertufe', '53', null, '3880', '569', 'Válega');
INSERT INTO `Morada` VALUES ('552', 'Rua Padre Donaciano de Abreu Freire', '12', '3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('553', 'Urb. Povoa de Baixo - Rua das Tilias', '105', null, '3860', '348', 'Estarreja');
INSERT INTO `Morada` VALUES ('554', 'Rua de Salreu', '22', null, '3865', '286', 'Salreu');
INSERT INTO `Morada` VALUES ('555', 'Rua Domingos José da Costa', '38', null, '3720', '284', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('556', 'Rua Domingos José da Costa', '38', null, '3720', '284', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('557', 'Largo do Matinho', '14', null, '3865', '105', 'Fermelã');
INSERT INTO `Morada` VALUES ('558', 'Rua Padre António Maria Pinho', '202', '2ºesq', '3860', '383', 'Estarreja');
INSERT INTO `Morada` VALUES ('559', 'Rua das Chouninhas', '166', null, '3860', '093', 'Avanca');
INSERT INTO `Morada` VALUES ('560', 'Rua do Mato', '6', null, '3865', '255', 'Salreu');
INSERT INTO `Morada` VALUES ('561', 'Teixugueira', '222', '2ºD', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('562', 'Rua de Pintim', '760', null, '3880', '511', 'Válega');
INSERT INTO `Morada` VALUES ('563', 'Rua de Pintim', '760', null, '3880', '511', 'Válega');
INSERT INTO `Morada` VALUES ('564', 'Rua Maria Lurdes Abreu', '1', null, '3865', '865', 'Salreu');
INSERT INTO `Morada` VALUES ('565', 'Torreira', '0', null, '3870', '000', 'Torreira');
INSERT INTO `Morada` VALUES ('566', 'Travessa do Outeiro', '1', null, '3860', '264', 'Estarreja');
INSERT INTO `Morada` VALUES ('567', 'Rua Associação Cultural de Salreu', '25', null, '3865', '279', 'Salreu');
INSERT INTO `Morada` VALUES ('568', 'Rua 15 de Maio', '933', null, '3880', '503', 'Válega');
INSERT INTO `Morada` VALUES ('569', 'Rua Ribeiro da Ladeira', '7', null, '3865', '214', 'Salreu');
INSERT INTO `Morada` VALUES ('570', 'Rua Arrais João Faustino', '15', null, '3870', '332', 'Torreira');
INSERT INTO `Morada` VALUES ('571', 'Rua Dr Albino dos Reis', '570', '1º And', '3720', '067', 'Loureiro');
INSERT INTO `Morada` VALUES ('572', 'Rua da Teixeira', '27', null, '3865', '016', 'Canelas');
INSERT INTO `Morada` VALUES ('573', 'Rua de S. Martinho', '34', null, '3865', '271', 'Salreu');
INSERT INTO `Morada` VALUES ('574', 'Rua da Igreja', '13', null, '3800', '901', 'S. Jacinto');
INSERT INTO `Morada` VALUES ('575', 'Rua da Estrada', '173', '0', '3870', '065', 'Murtosa');
INSERT INTO `Morada` VALUES ('576', 'Rua Dr Barbosa Magalhães', '19', null, '3870', '212', 'Murtosa');
INSERT INTO `Morada` VALUES ('577', 'Avenida 25 de Abril - Ed Palácio-Bloco C', '10', '1', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('578', 'Rua da Formiga - Moradia C', '8', null, '3850', '571', 'Branca');
INSERT INTO `Morada` VALUES ('579', 'Beco do Salgueiro', '10', null, '3860', '512', 'Pardilhó');
INSERT INTO `Morada` VALUES ('580', 'Rua António Vieira Pinto', '31', null, '3870', '127', 'Monte-Murtosa');
INSERT INTO `Morada` VALUES ('581', 'Rua D. Manuel l', '0', '7', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('582', 'Rua da Imprensa', '68', null, '3860', '496', 'Pardilhó');
INSERT INTO `Morada` VALUES ('583', 'Rua do Arieiro', '7', null, '3865', '203', 'Salreu');
INSERT INTO `Morada` VALUES ('584', 'Rua Maurício de Almeida - Urb. Póvoa de Baixo', '117', null, '3860', '349', 'Estarreja');
INSERT INTO `Morada` VALUES ('585', 'Rua Desembargador Oliveira Pinto', '2', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('586', 'Quinta do Valdujo', '0', null, '3865', '240', 'Salreu');
INSERT INTO `Morada` VALUES ('587', 'Rua Dr. Joaquim Simões', '230', '3', '3860', '339', 'Estarreja');
INSERT INTO `Morada` VALUES ('588', 'Rua Dr. Tavares da Silva', '1', null, '3860', '377', 'Estarreja');
INSERT INTO `Morada` VALUES ('589', 'Rua Dr  Manuel Andrade', '139', '1ºC', '3860', '372', 'Estarreja');
INSERT INTO `Morada` VALUES ('590', 'Av 12 de Julho', '4', null, '3870', '391', 'Torreira');
INSERT INTO `Morada` VALUES ('591', 'Rua Sidonio Pais', '21', null, '3870', '177', 'Murtosa');
INSERT INTO `Morada` VALUES ('592', 'Rua Adou de Cima', '47', null, '3865', '202', 'Salreu');
INSERT INTO `Morada` VALUES ('593', 'Rua Luis de Camões', '56', '1', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('594', 'Rua Desembargador Oliveira Pinto', '29', null, '3865', '273', 'Salreu');
INSERT INTO `Morada` VALUES ('595', 'Rua do Chão-Velho', '17', null, '3870', '145', 'Murtosa');
INSERT INTO `Morada` VALUES ('596', 'Rua Desembargador Oliveira Pinto', '24', null, '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('597', 'Rua José Maria da Silva Garganta', '5', null, '3860', '663', 'Veiros');
INSERT INTO `Morada` VALUES ('598', 'Rua da Balsa', '44', null, '3865', '211', 'Salreu');
INSERT INTO `Morada` VALUES ('599', 'Rua do norte - Rochico', '69', null, '3865', '110', 'Fermelã');
INSERT INTO `Morada` VALUES ('600', 'Rua da Raia Seca - fundo do pinheiro', '78', null, '3720', '475', 'Pinheiro da Bemposta');
INSERT INTO `Morada` VALUES ('601', 'Rua das Barreira', '1', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('602', 'Rua Professor Abílio Ramos, Nº32', '32', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('603', 'Rua Professor Abílio Ramos, Nº32', '32', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('604', 'Rua Professor Abílio Ramos, Nº32', '32', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('605', 'Rua Professor Abílio Ramos, Nº32', '32', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('606', 'Rua da Feira Santo Amaro', '25', null, '3860', '318', 'Estarreja');
INSERT INTO `Morada` VALUES ('607', 'Av. 25 de Abril', '55', '4º esq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('608', 'Edíficio Flamingo-Bloco B-RC Direito-Estrada de São Filipe', '1', null, '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('609', 'Rua das Covas', '32', null, '3860', '715', 'Pardilhó');
INSERT INTO `Morada` VALUES ('610', 'Rua da Rigueirinha', '35', null, '3870', '268', 'Murtosa');
INSERT INTO `Morada` VALUES ('611', 'Rua D. Dinis', '58', null, '3870', '162', 'Murtosa');
INSERT INTO `Morada` VALUES ('612', 'Rua de Timor', '151', '5', '3880', '180', 'Ovar');
INSERT INTO `Morada` VALUES ('613', 'EN 327', '309', null, '3870', '304', 'Torreira');
INSERT INTO `Morada` VALUES ('614', 'EN 327', '309', null, '3870', '304', 'Torreira');
INSERT INTO `Morada` VALUES ('615', 'Urbanização da Torreirinha', '48', null, '3870', '366', 'Torreira');
INSERT INTO `Morada` VALUES ('616', 'Urbanização da Torreirinha', '48', null, '3870', '366', 'Torreira');
INSERT INTO `Morada` VALUES ('617', 'Av. 12 de Julho', '4', '1', '3870', '391', 'Torreira');
INSERT INTO `Morada` VALUES ('618', 'Areosa do Norte', '17', null, '3860', '204', 'Estarreja');
INSERT INTO `Morada` VALUES ('619', 'Areosa do Norte', '17', null, '3860', '204', 'Estarreja');
INSERT INTO `Morada` VALUES ('620', 'Rua das Tílias', '104', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('621', 'Rua das Tílias', '104', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('622', 'Rua Marques Rodrigues', '52', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('623', 'Urb. Torreirinha', '19', null, '3870', '366', 'Torreira');
INSERT INTO `Morada` VALUES ('624', 'Rua da Quinta Velha', '548', '3', '3860', '299', 'Estarreja');
INSERT INTO `Morada` VALUES ('625', 'Rua da Quinta Velha', '548', '3', '3860', '299', 'Estarreja');
INSERT INTO `Morada` VALUES ('626', 'Rua Padre Joaquim Domingues da Silva', '6', null, '3865', '031', 'Canelas-Estarreja');
INSERT INTO `Morada` VALUES ('627', 'Rua Padre Joaquim Domingues da Silva', '6', null, '3865', '031', 'Canelas-Estarreja');
INSERT INTO `Morada` VALUES ('628', 'Rua da Estrada', '176', null, '3870', '195', 'Murtosa');
INSERT INTO `Morada` VALUES ('629', 'Rua Dr António Maria - Feital - Loureiro', '271', null, '3720', '055', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('630', 'Praça Jaime Arneixo - Ap I', null, '1', '3870', '224', 'Murtosa');
INSERT INTO `Morada` VALUES ('631', 'Praça Jaime Arneixo - Ap I', null, '1', '3870', '224', 'Murtosa');
INSERT INTO `Morada` VALUES ('632', 'Travessa da Boavista, norte', '1', null, '3865', '315', 'Salreu');
INSERT INTO `Morada` VALUES ('633', 'Travessa da Boavista, norte', '1', null, '3865', '315', 'Salreu');
INSERT INTO `Morada` VALUES ('634', 'Rua Major Ferreira', '42', null, '3860', '000', 'Estarreja');
INSERT INTO `Morada` VALUES ('635', 'Rua Major Ferreira', '42', null, '3860', '000', 'Estarreja');
INSERT INTO `Morada` VALUES ('636', 'Rua Santo António', '25', null, '3850', '483', 'Angeja');
INSERT INTO `Morada` VALUES ('637', 'Rua do Serrano - Deveza Santiais', '4', null, '3860', '245', 'Estarreja');
INSERT INTO `Morada` VALUES ('638', 'Av. Visconde Salreu', '9', null, '3860', '254', 'Salreu');
INSERT INTO `Morada` VALUES ('639', 'Rua General Themudo Barata', '12', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('640', 'Rua General Themudo Barata', '12', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('641', 'Rua Canto do Esteiro - Povoa de Baixo', '24', null, '3860', '262', 'Estarreja');
INSERT INTO `Morada` VALUES ('642', 'Rua Canto do Esteiro - Povoa de Baixo', '24', null, '3860', '262', 'Estarreja');
INSERT INTO `Morada` VALUES ('643', 'Rua 15 de Maio ', '705', null, '3880', '503', 'Valega');
INSERT INTO `Morada` VALUES ('644', 'Rua Dr Manuel Andrade', '45', null, '3865', '033', 'Canelas');
INSERT INTO `Morada` VALUES ('645', 'Travessa do Bairro S. Filipe - Póvoa de Cima', '8', null, '3860', '295', 'Estarreja');
INSERT INTO `Morada` VALUES ('646', 'Rua da Boavista - Macieira - Loureiro', '731', null, '3720', '060', 'Loureiro - OAZ');
INSERT INTO `Morada` VALUES ('647', 'Rua da Boavista - Macieira - Loureiro', '731', null, '3720', '060', 'Loureiro - OAZ');
INSERT INTO `Morada` VALUES ('648', 'Rua do Meio - Povoa de Cima ', '16', null, '3860', '294', 'Estarreja');
INSERT INTO `Morada` VALUES ('649', 'Rua do Meio - Povoa de Cima ', '16', null, '3860', '294', 'Estarreja');
INSERT INTO `Morada` VALUES ('650', 'Rua do Mercado - Pardelhas', '15', null, '3870', '101', 'Murtosa');
INSERT INTO `Morada` VALUES ('651', 'Rua dos Barreiros - Barreiro de Cima', '20', null, '3860', '216', 'Estarreja');
INSERT INTO `Morada` VALUES ('652', 'Rua São Geraldo', '60', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('653', 'Rua da Ribeirinha', '35', null, '3870', '268', 'Murtosa');
INSERT INTO `Morada` VALUES ('654', 'Rua Dr Manuel Ferreira Silva', '5', null, '3860', '860', 'Estarreja');
INSERT INTO `Morada` VALUES ('655', 'Rua Dr Manuel Ferreira Silva', '5', null, '3860', '860', 'Estarreja');
INSERT INTO `Morada` VALUES ('656', 'Rua da Boavista,  Salreu', '27', null, '3865', '215', 'Salreu');
INSERT INTO `Morada` VALUES ('657', 'Rua da Boavista,  Salreu', '27', null, '3865', '215', 'Salreu');
INSERT INTO `Morada` VALUES ('658', 'Rua Professor Dr Egas Moniz', '10', '1', '3860', '078', 'Avanca');
INSERT INTO `Morada` VALUES ('659', 'Avenida 25 de Abril - Ed. Pais Pinto ', '77', '4', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('660', 'Largo do Matinho', '14', null, '3865', '105', 'Fermelã - Estarreja ');
INSERT INTO `Morada` VALUES ('661', 'Rua Nova - Urbanização Porto Riba - Fracção F - Soutelo- Branca', '1', null, '3850', '587', 'Albergaria a Velha');
INSERT INTO `Morada` VALUES ('662', 'Rua Desembargador Correia Teles', '310', '2', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('663', 'Rua Marques Rodrigues', '17', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('664', 'Rua Direira', '3', null, '3865', '022', 'Canelas');
INSERT INTO `Morada` VALUES ('665', 'Rua Cidade Porto Novo', '216', null, '3860', '242', 'Estarreja');
INSERT INTO `Morada` VALUES ('666', 'Rua Cidade Porto Novo', '216', null, '3860', '242', 'Estarreja');
INSERT INTO `Morada` VALUES ('667', 'Rua Dr Agostinho L.P. Valente', '25', null, '3860', '436', 'Pardilhó');
INSERT INTO `Morada` VALUES ('668', 'Rua das Tílias', '17', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('669', 'Lugar das Arrotas-Pardelhas', '31', null, '3870', '193', 'Murtosa');
INSERT INTO `Morada` VALUES ('670', 'Rua Maria de Lurdes Breu', '61', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('671', 'Rua António Maria Silva e Pinho - Pardilhó', '121', null, '3860', '431', 'Pardilhó');
INSERT INTO `Morada` VALUES ('672', 'Rua Mártires da Pátria - Veiros', '5', null, '3860', '636', 'Estarreja');
INSERT INTO `Morada` VALUES ('673', 'Rua de Macau - Sargaçal ', '116', '1', '3880', '644', 'Válega');
INSERT INTO `Morada` VALUES ('674', 'Rua D. Francisco Nunes Teixeira', '31', null, '3860', '289', 'Estarreja');
INSERT INTO `Morada` VALUES ('675', 'Rua da Brejinha', '20', null, '3860', '296', 'Estarreja');
INSERT INTO `Morada` VALUES ('676', 'Urbanização da Póvoa de Baixo', '223', null, '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('677', 'Rua Conde Ferreira', '65', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('678', 'Rua das Tílias - Urbanização da Póvoa de Baixo', '1', null, '3860', '345', 'Estarreja');
INSERT INTO `Morada` VALUES ('679', 'Rua General Themudo Barata', '15', null, '3860', '404', 'Estarreja');
INSERT INTO `Morada` VALUES ('680', 'Beco do Outeiro Alto', '12', null, '2870', '027', 'Bunheiro');
INSERT INTO `Morada` VALUES ('681', 'Rua Fonte dos batizados', '16', null, '3860', '223', 'Estarreja');
INSERT INTO `Morada` VALUES ('682', 'Rua Tomé', '17', null, '3865', '288', 'Salreu');
INSERT INTO `Morada` VALUES ('683', 'Av. 25 de Abril', '53', '3', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('684', 'Rua do Barreiro de Além - Santiais', '23', null, '3860', '311', 'Estarreja');
INSERT INTO `Morada` VALUES ('685', 'Rua do Barreiro de Além - Santiais', '23', null, '3860', '311', 'Estarreja');
INSERT INTO `Morada` VALUES ('686', 'Urbanização Quinta dos Leites', '99', null, '3870', '319', 'Torreira');
INSERT INTO `Morada` VALUES ('687', 'Urbanização Quinta dos Leites', '99', null, '3870', '319', 'Torreira');
INSERT INTO `Morada` VALUES ('688', 'Estrada Nacional 327-Quintas do Norte', '467', null, '3870', '303', 'Torreira');
INSERT INTO `Morada` VALUES ('689', 'Rua 13 de Setembro  - Póvoa de Baixo', '35', null, '3860', '274', 'Estarreja');
INSERT INTO `Morada` VALUES ('690', 'Rua 13 de Setembro  - Póvoa de Baixo', '35', null, '3860', '274', 'Estarreja');
INSERT INTO `Morada` VALUES ('691', 'Rua Padre Donaciano Abreu Freire', '43', '4', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('692', 'Travessa Dr António Duarte de Oliveira', '6', null, '3860', '051', 'Avanca');
INSERT INTO `Morada` VALUES ('693', 'Rua Lagoa de Assões, Bloco 2', '0', '0', '3880', '723', 'Ovar');
INSERT INTO `Morada` VALUES ('694', 'Rua Lagoa de Assões, Bloco 2', '0', '0', '3880', '723', 'Ovar');
INSERT INTO `Morada` VALUES ('695', 'Rua Desembargador Oliveira Pinto', '12', '0', '3860', '363', 'Estarreja');
INSERT INTO `Morada` VALUES ('696', 'Urbanização da Póvoa de Baixo', '228', null, '3860', '350', 'Estarreja');
INSERT INTO `Morada` VALUES ('697', 'Rua do Areal - Ed. Areal', '5', '1', '3870', '406', 'Torreira');
INSERT INTO `Morada` VALUES ('698', 'Rua da Ribeira', '25', null, '3880', '507', 'Valega');
INSERT INTO `Morada` VALUES ('699', 'RuaTomas Figueiredo - Bloco 228 - R/c A', '0', '0', '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('700', 'Rua do Outeiro, Beduído', '27', null, '3860', '230', 'Estarreja');
INSERT INTO `Morada` VALUES ('701', 'Rua dos Margidos,Quintas do Norte', '13', null, '3870', '303', 'Torreira');
INSERT INTO `Morada` VALUES ('702', 'Rua do Serrado', '0', null, '3720', '000', 'Loureiro');
INSERT INTO `Morada` VALUES ('703', '', '0', null, '', '', '');
INSERT INTO `Morada` VALUES ('704', '', '0', null, '', '', '');
INSERT INTO `Morada` VALUES ('705', 'Rua Marques Rodrigues - Quinta Costeira', '27', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('706', '', '0', null, '', '', 'Esmoriz');
INSERT INTO `Morada` VALUES ('707', 'Av 25 de Abril', '65', '3ºesq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('708', 'Rua Padre Donaciano Abreu Freire', '12', '5ºesq', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('709', 'Rua das Quintas Lote 5', '0', null, '', '', '');
INSERT INTO `Morada` VALUES ('710', 'Travessa da Escola Primária', '12', null, '3860', '314', 'Estarreja');
INSERT INTO `Morada` VALUES ('711', 'Rua de Trás', '194', null, '3860', '361', 'Estarreja');
INSERT INTO `Morada` VALUES ('712', 'Rua D. Manuel - Conjunto Altamira - 2ºDD', '85', '2', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('713', 'Rua da Galiza, Lote 3', '17', '3', '3720', '125', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('714', 'Rua Areosa do Sul', '28', null, '3860', '205', 'Estarreja');
INSERT INTO `Morada` VALUES ('715', 'Rua Areosa do Sul', '28', null, '3860', '205', 'Estarreja');
INSERT INTO `Morada` VALUES ('716', 'Rua do infantado', '28', null, '3860', '360', 'Estarreja');
INSERT INTO `Morada` VALUES ('717', 'Travessa Santo António', '18', null, '3860', '648', 'Veiros');
INSERT INTO `Morada` VALUES ('718', 'Rua Padre Eloy de Pinho', '8', '1', '3880', '255', 'Ovar');
INSERT INTO `Morada` VALUES ('719', 'Rua das Olas', '2', null, '3860', '632', 'Veiros');
INSERT INTO `Morada` VALUES ('720', 'Rua das Olas', '2', null, '3860', '632', 'Veiros');
INSERT INTO `Morada` VALUES ('721', 'Rua João Augusto Sousa Fernandes', '70', null, '3860', '601', 'Veiros');
INSERT INTO `Morada` VALUES ('722', 'Rua Póvoa de Baixo', '30', null, '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('723', 'Rua da Póvoa de Baixo', '34', null, '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('724', 'Rua São Geraldo', '67', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('725', 'Travessa Ferreira de Castro', '1', null, '3870', '099', 'Murtosa');
INSERT INTO `Morada` VALUES ('726', 'Rua Zeferino Pereira -  Damonde de Baixo', '79', null, '3720', '567', 'Travanca OAZ');
INSERT INTO `Morada` VALUES ('727', 'Rua Padre Donaciano Abreu Freire - Ed. Lusíadas II', '10', null, '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('728', 'Rua Padre Donaciano Abreu Freire - Ed. Lusíadas II', '10', null, '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('729', 'Rua da Arribada', '200', null, '3860', '092', 'Avanca');
INSERT INTO `Morada` VALUES ('730', 'Rua da Arribada', '200', null, '3860', '092', 'Avanca');
INSERT INTO `Morada` VALUES ('731', 'Rua dos Salvadores da Nathalie', '10', null, '3870', '410', 'Torreira');
INSERT INTO `Morada` VALUES ('732', 'Rua dos Salvadores da Nathalie', '10', null, '3870', '410', 'Torreira');
INSERT INTO `Morada` VALUES ('733', 'Rua Agro de Meios', '10', null, '3860', '586', 'Veiros');
INSERT INTO `Morada` VALUES ('734', 'Rua Agro de Meios', '10', null, '3860', '586', 'Veiros');
INSERT INTO `Morada` VALUES ('735', 'Rua Manuel José da Silva, Edificio Altamira', '27', '1', '3720', '307', 'Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('736', 'Rua Manuel José da Silva, Edificio Altamira', '27', '1', '3720', '307', 'Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('737', 'Rua Dr Manuel Andrade', '45', null, '3865', '033', 'Canelas');
INSERT INTO `Morada` VALUES ('738', 'Rua Dr Manuel Andrade', '45', null, '3865', '033', 'Canelas');
INSERT INTO `Morada` VALUES ('739', 'Rua das Mestras', '40', null, '3870', '032', 'Bunheiro');
INSERT INTO `Morada` VALUES ('740', 'Rua das Mestras', '40', null, '3870', '032', 'Bunheiro');
INSERT INTO `Morada` VALUES ('741', 'Rua Aceiro', '2', null, '3860', '227', 'Estarreja');
INSERT INTO `Morada` VALUES ('742', 'Rua Aceiro', '2', null, '3860', '227', 'Estarreja');
INSERT INTO `Morada` VALUES ('743', 'Rua Aceiro', '2', null, '3860', '227', 'Estarreja');
INSERT INTO `Morada` VALUES ('744', 'Rua Aceiro', '2', null, '3860', '227', 'Estarreja');
INSERT INTO `Morada` VALUES ('745', 'Rua Padre Alves Garrido', '0', null, '3860', '088', 'Avanca');
INSERT INTO `Morada` VALUES ('746', 'Rua Padre Alves Garrido', '0', null, '3860', '088', 'Avanca');
INSERT INTO `Morada` VALUES ('747', 'Travessa de Santa Luzia ', '10', null, '3860', '661', 'Veiros');
INSERT INTO `Morada` VALUES ('748', 'Travessa de Santa Luzia ', '10', null, '3860', '661', 'Veiros');
INSERT INTO `Morada` VALUES ('749', 'Travessa Drº António Madureira, Vivenda', '7', null, '3860', '249', 'Estarreja');
INSERT INTO `Morada` VALUES ('750', 'Travessa Drº António Madureira, Vivenda', '7', null, '3860', '249', 'Estarreja');
INSERT INTO `Morada` VALUES ('751', 'Travessa da Rua Nova', '26', null, '3860', '731', 'Pardilhó');
INSERT INTO `Morada` VALUES ('752', 'Bairro da Teixugueira', '222', '2', '3860', '860', 'Estarreja');
INSERT INTO `Morada` VALUES ('753', 'Bairro da Teixugueira', '222', '2', '3860', '860', 'Estarreja');
INSERT INTO `Morada` VALUES ('754', 'Rua Areia do Gonde', '73', null, '3860', '064', 'Avanca');
INSERT INTO `Morada` VALUES ('755', 'Rua Areia do Gonde', '73', null, '3860', '064', 'Avanca');
INSERT INTO `Morada` VALUES ('756', 'Rua Padre Salvador Terra', '277', null, '3860', '015', 'Avanca');
INSERT INTO `Morada` VALUES ('757', 'Rua Padre Salvador Terra', '277', null, '3860', '015', 'Avanca');
INSERT INTO `Morada` VALUES ('758', 'Rua São Geraldo', '60', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('759', 'Rua São Geraldo', '60', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('760', 'Rua São Geraldo', '60', null, '3860', '664', 'Veiros');
INSERT INTO `Morada` VALUES ('761', 'Beco do Feiro', '2', null, '3865', '307', 'Salreu');
INSERT INTO `Morada` VALUES ('762', 'Beco do Feiro', '2', null, '3865', '307', 'Salreu');
INSERT INTO `Morada` VALUES ('763', 'Beco do Feiro', '2', null, '3865', '307', 'Salreu');
INSERT INTO `Morada` VALUES ('764', 'Travessa Santa Mafalda', '5', null, '3870', '259', 'Murtosa');
INSERT INTO `Morada` VALUES ('765', 'Travessa Santa Mafalda', '5', null, '3870', '259', 'Murtosa');
INSERT INTO `Morada` VALUES ('766', 'Travessa Santa Mafalda', '5', null, '3870', '259', 'Murtosa');
INSERT INTO `Morada` VALUES ('767', 'Rua Luís de Camões', '66', '3ºesq', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('768', 'Rua Luís de Camões', '66', '3ºesq', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('769', 'Rua Luís de Camões', '66', '3ºesq', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('770', 'Rua Dr Jaime Ferreira da Silva', '201', null, '3860', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('771', 'Rua Dr Jaime Ferreira da Silva', '201', null, '3860', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('772', 'Rua Dr Jaime Ferreira da Silva', '201', null, '3860', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('773', 'Rua Terra do Monte', '0', null, '3865', '120', 'Fermelã');
INSERT INTO `Morada` VALUES ('774', 'Rua Terra do Monte', '0', null, '3865', '120', 'Fermelã');
INSERT INTO `Morada` VALUES ('775', 'Rua Delfim de Almeida', '198', null, '3880', '578', 'Válega');
INSERT INTO `Morada` VALUES ('776', 'Rua Delfim de Almeida', '198', null, '3880', '578', 'Válega');
INSERT INTO `Morada` VALUES ('777', 'Rua Delfim de Almeida', '198', null, '3880', '578', 'Válega');
INSERT INTO `Morada` VALUES ('778', 'Rua do Rato', '182', 'F - E', '3720', '051', 'Loureiro');
INSERT INTO `Morada` VALUES ('779', 'Rua do Rato', '182', 'Fr - E', '3720', '051', 'Loureiro');
INSERT INTO `Morada` VALUES ('780', 'Rua do Rato', '182', 'F - E', '3720', '051', 'Loureiro');
INSERT INTO `Morada` VALUES ('781', 'Rua do Meio-Póvoa de Cima', '1', null, '3860', '294', 'Estarreja');
INSERT INTO `Morada` VALUES ('782', 'Rua do Meio', '1', null, '3860', '294', 'Póvoa de Cima');
INSERT INTO `Morada` VALUES ('783', 'Rua do Meio', '1', null, '3860', '294', 'Póvoa de Cima');
INSERT INTO `Morada` VALUES ('784', 'Rua Visconde Salreu', '8', null, '3865', '248', 'Salreu');
INSERT INTO `Morada` VALUES ('785', 'Rua Visconde Salreu', '8', null, '3865', '248', 'Salreu');
INSERT INTO `Morada` VALUES ('786', 'Rua Visconde Salreu', '8', null, '3865', '248', 'Salreu');
INSERT INTO `Morada` VALUES ('787', 'Rua João Augusto Sousa Fernandes', '70', null, '3860', '601', 'veiros');
INSERT INTO `Morada` VALUES ('788', 'Rua João Augusto Sousa Fernandes', '70', null, '3860', '601', 'veiros');
INSERT INTO `Morada` VALUES ('789', 'Rua João Augusto Sousa Fernandes', '70', null, '3860', '601', 'veiros');
INSERT INTO `Morada` VALUES ('790', 'Av. 25 de Abril', '43', '3ºesq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('791', 'Av. 25 de Abril', '43', '3ºesq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('792', 'Av. 25 de Abril', '43', '3ºesq', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('793', 'Rua Francisco Barbado', '26', null, '3860', '290', 'Estarreja');
INSERT INTO `Morada` VALUES ('794', 'Rua Francisco Barbado', '26', null, '3860', '290', 'Estarreja');
INSERT INTO `Morada` VALUES ('795', 'Rua Francisco Barbado', '26', null, '3860', '290', 'Estarreja');
INSERT INTO `Morada` VALUES ('796', 'Rua Barreiro do Meio', '19', null, '3860', '221', 'Estarreja');
INSERT INTO `Morada` VALUES ('797', 'Rua Barreiro do Meio', '19', null, '3860', '221', 'Estarreja');
INSERT INTO `Morada` VALUES ('798', 'Rua Barreiro do Meio', '19', null, '3860', '221', 'Estarreja');
INSERT INTO `Morada` VALUES ('799', 'Rua Dr Guilherme Souto', '81', null, '3860', '369', 'Estarreja');
INSERT INTO `Morada` VALUES ('800', 'Rua Dr Guilherme Souto', '81', null, '3860', '369', 'Estarreja');
INSERT INTO `Morada` VALUES ('801', 'Rua Dr Guilherme Souto', '81', null, '3860', '369', 'Estarreja');
INSERT INTO `Morada` VALUES ('802', 'Rua Família Lopes Rodrigues', '55', null, '3880', '545', 'Válega');
INSERT INTO `Morada` VALUES ('803', 'Rua Família Lopes Rodrigues', '55', null, '3880', '545', 'Válega');
INSERT INTO `Morada` VALUES ('804', 'Rua Família Lopes Rodrigues', '55', null, '3880', '545', 'Válega');
INSERT INTO `Morada` VALUES ('805', 'Rua Santo António', '24', null, '3860', '645', 'Veiros');
INSERT INTO `Morada` VALUES ('806', 'Rua Santo António', '24', null, '3860', '645', 'Veiros');
INSERT INTO `Morada` VALUES ('807', 'Rua Santo António', '24', null, '3860', '645', 'Veiros');
INSERT INTO `Morada` VALUES ('808', 'Urbanização da Teixugueira', '224', '1ºD', '3860', '335', 'Estarreja');
INSERT INTO `Morada` VALUES ('809', 'Urbanização da Teixugueira', '224', '1ºD', '3860', '335', 'Estarreja');
INSERT INTO `Morada` VALUES ('810', 'Urbanização da Teixugueira', '224', '1ºD', '3860', '335', 'Estarreja');
INSERT INTO `Morada` VALUES ('811', 'Avenida São Mateus', '42', null, '3870', '059', 'Bunheiro - Murtosa');
INSERT INTO `Morada` VALUES ('812', 'Avenida São Mateus', '42', null, '3870', '059', 'Bunheiro - Murtosa');
INSERT INTO `Morada` VALUES ('813', 'Avenida São Mateus', '42', null, '3870', '059', 'Bunheiro - Murtosa');
INSERT INTO `Morada` VALUES ('814', 'Rua Agostinho Leite', '51', null, '3860', '357', 'Estarreja');
INSERT INTO `Morada` VALUES ('815', 'Rua Agostinho Leite', '51', null, '3860', '357', 'Estarreja');
INSERT INTO `Morada` VALUES ('816', 'Rua Agostinho Leite', '51', null, '3860', '357', 'Estarreja');
INSERT INTO `Morada` VALUES ('817', 'Rua Terra do Monte', '0', null, '3865', '120', 'Murtosa');
INSERT INTO `Morada` VALUES ('818', 'Rua do Vale Grande', '3', null, '3865', '268', 'Salreu');
INSERT INTO `Morada` VALUES ('819', 'Rua do Vale Grande', '3', null, '3865', '268', 'Salreu');
INSERT INTO `Morada` VALUES ('820', 'Rua do Vale Grande', '3', null, '3865', '268', 'Salreu');
INSERT INTO `Morada` VALUES ('821', 'Rua Visconde Valdemouro', '23', '4ºdt', '3860', '389', 'Estarreja');
INSERT INTO `Morada` VALUES ('822', 'Rua Visconde Valdemouro', '23', '4ºdt', '3860', '389', 'Estarreja');
INSERT INTO `Morada` VALUES ('823', 'Rua Visconde Valdemouro', '23', '4ºdt', '3860', '389', 'Estarreja');
INSERT INTO `Morada` VALUES ('824', 'Rua S. Simão', '74', null, '3870', '043', 'Bunheiro');
INSERT INTO `Morada` VALUES ('825', 'Rua S. Simão', '74', null, '3870', '043', 'Bunheiro');
INSERT INTO `Morada` VALUES ('826', 'Rua S. Simão', '74', null, '3870', '043', 'Bunheiro');
INSERT INTO `Morada` VALUES ('827', 'padre donaciano', '2', null, '3860', '000', 'estarreja');
INSERT INTO `Morada` VALUES ('828', 'qualquer rua', '0', null, '0000', '000', 'Localidade qq');
INSERT INTO `Morada` VALUES ('829', 'Avenida da Régua', '30', 'ºdrt', '3880', '001', 'Ovar');
INSERT INTO `Morada` VALUES ('830', 'Rua Brito Mesquita - Urbanização da Póvoa de Baixo', '55', null, '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('831', 'Urbanização da Póvoa de Baixo', '211', null, '3860', '342', 'Estarreja');
INSERT INTO `Morada` VALUES ('832', 'Rua Santo António', '2', null, '4520', '616', 'S. João de Ver');
INSERT INTO `Morada` VALUES ('833', 'Travessa Américo', '12', null, '3860', '313', 'Estarreja');
INSERT INTO `Morada` VALUES ('834', 'Avenida S. Pedro de Vila Chã', '1', null, '3850', '107', 'Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('835', 'Rua da Mata', '32', null, '3860', '458', 'Pardilhó');
INSERT INTO `Morada` VALUES ('836', 'Rua da Mata', '32', null, '3860', '458', 'Pardilhó');
INSERT INTO `Morada` VALUES ('837', 'Rua da Mata', '32', null, '3860', '458', 'Pardilhó');
INSERT INTO `Morada` VALUES ('838', 'Rua 9 de Abril', '46', null, '3870', '155', 'Murtosa');
INSERT INTO `Morada` VALUES ('839', 'Rua 9 de Abril', '46', null, '3870', '155', 'Murtosa');
INSERT INTO `Morada` VALUES ('840', 'Rua 9 de Abril', '46', null, '3870', '155', 'Murtosa');
INSERT INTO `Morada` VALUES ('841', 'Rua da Junta de Freguesia', '18', null, '3870', '289', 'Murtosa');
INSERT INTO `Morada` VALUES ('842', 'Rua da Junta de Freguesia', '18', null, '3870', '289', 'Murtosa');
INSERT INTO `Morada` VALUES ('843', 'Rua da Junta de Freguesia', '18', null, '3870', '289', 'Murtosa');
INSERT INTO `Morada` VALUES ('844', 'Rua Professor Ruela Ramos', '0', null, '3870', '057', 'Murtosa');
INSERT INTO `Morada` VALUES ('845', 'Rua Professor Ruela Ramos', '0', null, '3870', '057', 'Murtosa');
INSERT INTO `Morada` VALUES ('846', 'Rua Professor Ruela Ramos', '0', null, '3870', '057', 'Murtosa');
INSERT INTO `Morada` VALUES ('847', 'Rua 15 de Maio', '988', null, '3880', '503', 'Válega');
INSERT INTO `Morada` VALUES ('848', 'Rua 15 de Maio', '988', null, '3880', '503', 'Válega');
INSERT INTO `Morada` VALUES ('849', 'Rua 15 de Maio', '988', null, '3880', '503', 'Válega');
INSERT INTO `Morada` VALUES ('850', 'Rua da Carreira', '13', null, '3770', '031', 'Mamarrosa');
INSERT INTO `Morada` VALUES ('851', 'Rua Dr tavares da Silva', '0', null, '3860', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('852', 'Rua Parque Desportivo', '901', null, '3730', '628', 'Vila Cova de Perrinho');
INSERT INTO `Morada` VALUES ('853', 'Rua José Luís Bastos', '23', null, '4520', '235', 'Vila Nova - feira');
INSERT INTO `Morada` VALUES ('854', 'Rua do Seixo', '201', null, '3880', '897', 'S. Vicente de Pereira');
INSERT INTO `Morada` VALUES ('855', 'Rua Professor Francisco Corujo', '0', null, '3830', '523', 'Gafanha');
INSERT INTO `Morada` VALUES ('856', 'Rua Alvares Cabral', '107', '1ºesq', '3880', '361', 'Ovar');
INSERT INTO `Morada` VALUES ('857', 'Bairro Piscatorio', '79', null, '4500', '212', 'Silvalde');
INSERT INTO `Morada` VALUES ('858', 'Rua da Murteira', '1475', null, '3885', '102', 'Arada');
INSERT INTO `Morada` VALUES ('859', 'Rua da relva', '6', 'A', '3720', '567', 'Travanca');
INSERT INTO `Morada` VALUES ('860', 'Rua da Brejinha', '34', null, '3860', '296', 'Estarreja');
INSERT INTO `Morada` VALUES ('861', 'Rua Nova Nogueira do Cravo', '0', null, '3700', '797', 'Nogueira do Cravo');
INSERT INTO `Morada` VALUES ('862', 'Rua Escola do Seixo', '543', null, '3880', '587', 'Murtosa');
INSERT INTO `Morada` VALUES ('863', 'Rua Escola do Seixo', '543', null, '3880', '587', 'Murtosa');
INSERT INTO `Morada` VALUES ('864', 'Estrada de S. Filipe', '2', '2ºesq', '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('865', 'Estrada de S. Filipe', '2', '2ºesq', '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('866', 'Estrada de S. Filipe', '2', '2ºesq', '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('867', 'Rua de Santiais', '74', 'R/C', '3860', '307', 'Estarreja');
INSERT INTO `Morada` VALUES ('868', 'Rua de Santiais', '74', 'R/C', '3860', '307', 'Estarreja');
INSERT INTO `Morada` VALUES ('869', 'Rua de Santiais', '74', 'R/C', '3860', '307', 'Estarreja');
INSERT INTO `Morada` VALUES ('870', 'Rua do Murtório', '24', null, '3865', '293', 'Salreu');
INSERT INTO `Morada` VALUES ('871', 'Rua do Murtório', '24', null, '3865', '293', 'Salreu');
INSERT INTO `Morada` VALUES ('872', 'Rua do Murtório', '24', null, '3865', '293', 'Salreu');
INSERT INTO `Morada` VALUES ('873', 'Rua da Cova da Onça', '217', null, '3880', '541', 'Válega');
INSERT INTO `Morada` VALUES ('874', 'Rua da Cova da Onça', '217', null, '3880', '541', 'Válega');
INSERT INTO `Morada` VALUES ('875', 'Rua da Cova da Onça', '217', null, '3880', '541', 'Válega');
INSERT INTO `Morada` VALUES ('876', 'Rua Maria de Lurdes Breu', '68', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('877', 'Rua Maria de Lurdes Breu', '68', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('878', 'Avenida Força Aérea Portuguesa', '35', '3ºesq', '3800', '357', 'Aveiro');
INSERT INTO `Morada` VALUES ('879', 'Rua da Corga', '15', null, '3865', '131', 'Canelas');
INSERT INTO `Morada` VALUES ('880', 'Rua da Corga', '15', null, '3865', '131', 'Canelas');
INSERT INTO `Morada` VALUES ('881', 'Rua da Corga', '15', null, '3865', '131', 'Canelas');
INSERT INTO `Morada` VALUES ('882', 'Rua dos Carvalhos', '0', null, '3880', '605', 'Válega');
INSERT INTO `Morada` VALUES ('883', 'Rua dos Carvalhos', '0', null, '3880', '605', 'Válega');
INSERT INTO `Morada` VALUES ('884', 'Rua dos Carvalhos', '0', null, '3880', '605', 'Válega');
INSERT INTO `Morada` VALUES ('885', 'Rua 25 e Abril', '4', null, '3870', '151', 'Estarreja');
INSERT INTO `Morada` VALUES ('886', 'Rua 25 e Abril', '4', null, '3870', '151', 'Estarreja');
INSERT INTO `Morada` VALUES ('887', 'Rua 25 e Abril', '4', null, '3870', '151', 'Estarreja');
INSERT INTO `Morada` VALUES ('888', 'Rua da Balsa', '54', null, '3865', '211', 'Salreu');
INSERT INTO `Morada` VALUES ('889', 'Rua da Balsa', '54', null, '3865', '211', 'Salreu');
INSERT INTO `Morada` VALUES ('890', 'Rua da Balsa', '54', null, '3865', '211', 'Salreu');
INSERT INTO `Morada` VALUES ('891', 'Avenida 12 de Julho', '4', null, '3870', '391', 'Torreia');
INSERT INTO `Morada` VALUES ('892', 'Rua D. Manuel I', '2', '1ºdrt', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('893', 'Rua D. Manuel I', '2', '1ºdrt', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('894', 'Rua D. Manuel I', '2', '1ºdrt', '3860', '366', 'Estarreja');
INSERT INTO `Morada` VALUES ('895', 'Rua Egas Moniz', '741', null, '3860', '378', 'Estarreja');
INSERT INTO `Morada` VALUES ('896', 'Rua Egas Moniz', '741', null, '3860', '378', 'Estarreja');
INSERT INTO `Morada` VALUES ('897', 'Rua Egas Moniz', '741', null, '3860', '378', 'Estarreja');
INSERT INTO `Morada` VALUES ('898', 'Rua das Barreiras', '10', null, '3860', '371', 'Estarreja');
INSERT INTO `Morada` VALUES ('899', 'Rua das Barreiras', '10', null, '3860', '371', 'Estarreja');
INSERT INTO `Morada` VALUES ('900', 'Rua das Barreiras', '10', null, '3860', '371', 'Estarreja');
INSERT INTO `Morada` VALUES ('901', 'Rua Bairro de S. Filipe', '31', '1ºesq', '3860', '292', 'Estarreja');
INSERT INTO `Morada` VALUES ('902', 'Rua Bairro de S. Filipe', '31', '1ºesq', '3860', '292', 'Estarreja');
INSERT INTO `Morada` VALUES ('903', 'Rua Bairro de S. Filipe', '31', '1ºesq', '3860', '292', 'Estarreja');
INSERT INTO `Morada` VALUES ('904', 'Travessa do Feiro', '8', null, '3860', '242', 'Salreu');
INSERT INTO `Morada` VALUES ('905', 'Travessa do Feiro', '8', null, '3860', '242', 'Salreu');
INSERT INTO `Morada` VALUES ('906', 'Travessa do Feiro', '8', null, '3860', '242', 'Salreu');
INSERT INTO `Morada` VALUES ('907', 'Rua das Cavadas', '11', null, '3865', '018', 'Canelas');
INSERT INTO `Morada` VALUES ('908', 'Rua das Cavadas', '11', null, '3865', '018', 'Canelas');
INSERT INTO `Morada` VALUES ('909', 'Rua das Cavadas', '11', null, '3865', '018', 'Canelas');
INSERT INTO `Morada` VALUES ('910', 'Rua Luís de Camões', '44', '1ºdrt', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('911', 'Rua Luís de Camões', '44', '1ºdrt', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('912', 'Rua Luís de Camões', '44', '1ºdrt', '3860', '381', 'Estarreja');
INSERT INTO `Morada` VALUES ('913', 'Rua Adou de Baixo - Salreu', '3', null, '3865', '201', 'Estarreja');
INSERT INTO `Morada` VALUES ('914', 'Rua de São Tiago', '27', null, '3860', '301', 'Estarreja');
INSERT INTO `Morada` VALUES ('915', 'Rua Adou de Baixo - Salreu', '3', null, '3865', '201', 'Estarreja');
INSERT INTO `Morada` VALUES ('916', 'urbanização Lopes da Cunha - Qt do Sul', '38', null, '3870', '304', 'Torreira');
INSERT INTO `Morada` VALUES ('917', 'urbanização Lopes da Cunha - Qt do Sul', '38', null, '3870', '304', 'Torreira');
INSERT INTO `Morada` VALUES ('918', 'urbanização Lopes da Cunha - Qt do Sul', '38', null, '3870', '304', 'Torreira');
INSERT INTO `Morada` VALUES ('919', 'Rua Dr Manuel de Andrade', '45', null, '3860', '372', 'Estarreja');
INSERT INTO `Morada` VALUES ('920', 'Rua Dr Manuel de Andrade', '45', null, '3860', '372', 'Estarreja');
INSERT INTO `Morada` VALUES ('921', 'Rua Dr Manuel de Andrade', '45', null, '3860', '372', 'Estarreja');
INSERT INTO `Morada` VALUES ('922', 'Rua do Sul - Roxico', '108', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('923', 'Rua do Sul - Roxico', '108', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('924', 'Rua do Sul - Roxico', '108', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('925', 'Rua do Sul - Roxico', '108', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('926', 'Rua do Sul - Roxico', '108', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('927', 'Rua do Sul - Roxico', '108', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('928', 'Rua da Breija - Povoa de cima', '36', null, '3860', '293', 'Estarreja');
INSERT INTO `Morada` VALUES ('929', 'Rua da Breija - Povoa de cima', '36', null, '3860', '293', 'Estarreja');
INSERT INTO `Morada` VALUES ('930', 'Rua da Breija - Povoa de cima', '36', null, '3860', '293', 'Estarreja');
INSERT INTO `Morada` VALUES ('931', 'Estrada Nacional 109', '35', 'r/c', '3865', '011', 'Estarreja');
INSERT INTO `Morada` VALUES ('932', 'Estrada Nacional 109', '35', 'r/c', '3865', '011', 'Estarreja');
INSERT INTO `Morada` VALUES ('933', 'Estrada Nacional 109', '35', 'r/c', '3865', '011', 'Estarreja');
INSERT INTO `Morada` VALUES ('934', 'Rua Pedro Calado', '4', null, '3865', '285', 'Salreu');
INSERT INTO `Morada` VALUES ('935', 'Rua Pedro Calado', '4', null, '3865', '285', 'Salreu');
INSERT INTO `Morada` VALUES ('936', 'Rua Pedro Calado', '4', null, '3865', '285', 'Salreu');
INSERT INTO `Morada` VALUES ('937', 'Rua Tomás de Figueiredo', '6', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('938', 'Rua Tomás de Figueiredo', '6', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('939', 'Rua Tomás de Figueiredo', '6', null, '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('940', 'Rua Dr Alberto Vidal', '103', '2ºdrt', '3860', '368', 'Estarreja');
INSERT INTO `Morada` VALUES ('941', 'Rua Dr Alberto Vidal', '103', '2ºdrt', '3860', '368', 'Estarreja');
INSERT INTO `Morada` VALUES ('942', 'Rua Dr Alberto Vidal', '103', '2ºdrt', '3860', '368', 'Estarreja');
INSERT INTO `Morada` VALUES ('943', 'Rua de Egas Moniz', '525', 'A', '3860', '378', 'Estarreja');
INSERT INTO `Morada` VALUES ('944', 'Rua de Egas Moniz', '525', 'A', '3860', '378', 'Estarreja');
INSERT INTO `Morada` VALUES ('945', 'Rua de Egas Moniz', '525', 'A', '3860', '378', 'Estarreja');
INSERT INTO `Morada` VALUES ('946', 'Rua Dr Jaime Ferreira da Silva', '199', null, '3860', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('947', 'Rua Dr Jaime Ferreira da Silva', '199', null, '3860', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('948', 'Rua Dr Jaime Ferreira da Silva', '199', null, '3860', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('949', 'Rua Condes de Estarreja', '238', '2L', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('950', 'Rua Condes de Estarreja', '238', '2L', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('951', 'Rua Condes de Estarreja', '238', '2L', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('952', 'Rua da Fontinha', '150', null, '3860', '248', 'Estarreja');
INSERT INTO `Morada` VALUES ('953', 'Rua da Fontinha', '150', null, '3860', '248', 'Estarreja');
INSERT INTO `Morada` VALUES ('954', 'Rua da Fontinha', '150', null, '3860', '248', 'Estarreja');
INSERT INTO `Morada` VALUES ('955', 'Rua da Fontinha', '150', null, '3860', '248', 'Estarreja');
INSERT INTO `Morada` VALUES ('956', 'Rua da Fontinha', '150', null, '3860', '248', 'Estarreja');
INSERT INTO `Morada` VALUES ('957', 'Rua da Fontinha', '150', null, '3860', '248', 'Estarreja');
INSERT INTO `Morada` VALUES ('958', 'Rua Dr António Tavares Afonso e Cunha', '45', null, '3860', '279', 'Estarreja');
INSERT INTO `Morada` VALUES ('959', 'Rua Dr António Tavares Afonso e Cunha', '45', null, '3860', '279', 'Estarreja');
INSERT INTO `Morada` VALUES ('960', 'Rua Dr António Tavares Afonso e Cunha', '45', null, '3860', '279', 'Estarreja');
INSERT INTO `Morada` VALUES ('961', 'Rua Professor Abílio Ramos', '86', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('962', 'Rua Professor Abílio Ramos', '86', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('963', 'Rua Professor Abílio Ramos', '86', null, '3870', '063', 'Bunheiro');
INSERT INTO `Morada` VALUES ('964', 'Rua Desembargador Correia Teles Bloco 198', '198', '5ºesq', '3860', '352', 'Esatarreja');
INSERT INTO `Morada` VALUES ('965', 'Rua Desembargador Correia Teles Bloco 198', '198', '5ºesq', '3860', '352', 'Esatarreja');
INSERT INTO `Morada` VALUES ('966', 'Rua da Cruz', '9', null, '3850', '000', 'Albergaria a Velha');
INSERT INTO `Morada` VALUES ('967', 'Travessa do Canto Esteiro', '11', null, '3860', '270', 'Estarreja');
INSERT INTO `Morada` VALUES ('968', 'Travessa do Canto Esteiro', '11', null, '3860', '270', 'Estarreja');
INSERT INTO `Morada` VALUES ('969', 'Travessa do Canto Esteiro', '11', null, '3860', '270', 'Estarreja');
INSERT INTO `Morada` VALUES ('970', 'Avenida 25 de Abril', '77', '1ºdrt', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('971', 'Avenida 25 de Abril', '77', '1ºdrt', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('972', 'Avenida 25 de Abril', '77', '1ºdrt', '3860', '352', 'Estarreja');
INSERT INTO `Morada` VALUES ('973', 'Rua Desembargador Correia Teles', '198', '2ºesq', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('974', 'Rua Desembargador Correia Teles', '198', '2ºesq', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('975', 'Rua Desembargador Correia Teles', '198', '2ºesq', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('976', 'Rua Largo da Água Levada', '0', null, '3860', '001', 'Avanca');
INSERT INTO `Morada` VALUES ('977', 'Travessa da Junqueira de Cima', '74', '3ºDto', '4405', '873', 'Porto');
INSERT INTO `Morada` VALUES ('978', 'Rua Dr Tavares da Silva', '0', null, '3860', '277', 'Estarreja');
INSERT INTO `Morada` VALUES ('979', 'Rua Dr Tavares da Silva', '0', null, '3860', '270', 'Estarreja');
INSERT INTO `Morada` VALUES ('980', 'Rua Dr Tavares da Silva', '0', null, '3860', '377', 'Estarreja');
INSERT INTO `Morada` VALUES ('981', 'Rua Dr Tavares da Silva', '0', null, '3860', '378', 'Estarreja');
INSERT INTO `Morada` VALUES ('982', 'Rua Ribeiras do Castér', '56', null, '4520', '256', 'Estarreja');
INSERT INTO `Morada` VALUES ('983', 'Rua Nova - Nogueira do Cravo', '0', null, '3700', '797', 'Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('984', 'Rua do Relva - Damonde de Baixos', '6', 'A', '3720', '567', 'Travanca');
INSERT INTO `Morada` VALUES ('985', 'Rua da Brejinha', '34', null, '3860', '296', 'Estarreja');
INSERT INTO `Morada` VALUES ('986', 'Rua da Murteira - Arada Ovar', '1475', null, '3885', '102', 'Arada');
INSERT INTO `Morada` VALUES ('987', 'Rua Professor Francisco Corujo', '0', null, '3830', '523', 'Ilhavo');
INSERT INTO `Morada` VALUES ('988', 'Rua do Seixo', '201', null, '3880', '897', 'S. Vicente');
INSERT INTO `Morada` VALUES ('989', 'Bairro Piscatório', '79', null, '4500', '212', 'Silvalde');
INSERT INTO `Morada` VALUES ('990', 'Rua José Luís Bastos - Vila Nova', '23', null, '4520', '235', 'Santa Maria da Feira');
INSERT INTO `Morada` VALUES ('991', 'Rua Parque Desportivo - Vila Cova de Perrinho', '401', null, '3730', '628', 'Vale de Cambra');
INSERT INTO `Morada` VALUES ('992', 'Rua da Caneira', '13', null, '3770', '031', 'Mamarrosa');
INSERT INTO `Morada` VALUES ('993', 'Rua Santo António', '2', null, '4520', '616', 'S. João de Cer');
INSERT INTO `Morada` VALUES ('994', 'Urbanização Jardins da Ria', '0', null, '3870', '301', 'Torreira');
INSERT INTO `Morada` VALUES ('995', 'Urbanização Jardins da Ria', '0', null, '3870', '301', 'Torreira');
INSERT INTO `Morada` VALUES ('996', 'Rua António Cruz Barbosa', '5', '2º', '3870', '327', 'Torreira');
INSERT INTO `Morada` VALUES ('997', 'Rua Eduarda Lapa', '73', null, '3860', '348', 'Veiros-Beduido');
INSERT INTO `Morada` VALUES ('998', 'Rua Eduarda Lapa', '73', null, '3860', '348', 'Veiros-Beduido');
INSERT INTO `Morada` VALUES ('999', 'Rua Eduarda Lapa', '73', null, '3860', '348', 'Veiros-Beduido');
INSERT INTO `Morada` VALUES ('1000', 'Beco do Pardal', '5', null, '3860', '456', 'Pardilhó');
INSERT INTO `Morada` VALUES ('1001', 'Beco do Pardal', '5', null, '3860', '456', 'Pardilhó');
INSERT INTO `Morada` VALUES ('1002', 'Beco do Pardal', '5', null, '3860', '456', 'Pardilhó');
INSERT INTO `Morada` VALUES ('1003', 'Rua D. Agro', '17', null, '3870', '112', 'Murtosa');
INSERT INTO `Morada` VALUES ('1004', 'Rua D. Agro', '17', null, '3870', '112', 'Murtosa');
INSERT INTO `Morada` VALUES ('1005', 'Rua D. Agro', '17', null, '3870', '112', 'Murtosa');
INSERT INTO `Morada` VALUES ('1006', 'Rua Padre Donaciano Abreu Freire', '12', 'bloco3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('1007', 'Rua Padre Donaciano Abreu Freire', '12', 'bloco3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('1008', 'Rua Padre Donaciano Abreu Freire', '12', 'bloco3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('1009', 'Rua Padre Donaciano Abreu freire', '12', 'blobo3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('1010', 'Rua Padre Donaciano Abreu freire', '12', 'blobo3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('1011', 'Rua Padre Donaciano Abreu freire', '12', 'blobo3', '3860', '384', 'Estarreja');
INSERT INTO `Morada` VALUES ('1012', 'Rua das Cavadas', '11', null, '3865', '018', 'Canelas');
INSERT INTO `Morada` VALUES ('1013', 'Rua São Joaquim', '0', null, '3860', '317', 'Santiais-Estarreja');
INSERT INTO `Morada` VALUES ('1014', 'Rua Casal de Matos', '532', null, '4520', '305', 'Fornos');
INSERT INTO `Morada` VALUES ('1015', 'Porto Corro - S. Martinho da Gandra', '0', null, '3720', '545', 'Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('1016', 'Rua Val´de Água', '0', null, '3720', '479', 'Pinheiro da Bemposta');
INSERT INTO `Morada` VALUES ('1017', 'Rua Agostinho Leite', '51', null, '3860', '357', 'Estarreja');
INSERT INTO `Morada` VALUES ('1018', 'Rua António Cruz Barbosa', '70', '3ºfren', '3870', '327', 'Torreira');
INSERT INTO `Morada` VALUES ('1019', 'Rua António Cruz Barbosa', '70', '3ºfren', '3870', '327', 'Torreira');
INSERT INTO `Morada` VALUES ('1020', 'Rua António Cruz Barbosa', '70', '3ºfren', '3870', '327', 'Torreira');
INSERT INTO `Morada` VALUES ('1021', 'Rua Canedo D´Além', '123', null, '3860', '432', 'Pardilhó');
INSERT INTO `Morada` VALUES ('1022', 'Travessa Principe Perfeito', '30', '', '3830', '741', 'Gafanha da Nazaré');
INSERT INTO `Morada` VALUES ('1023', 'Rua Canedo D´Além', '123', '', '3860', '432', 'Pardilhó');
INSERT INTO `Morada` VALUES ('1024', 'Rua Lagoa de Assões', '0', 'Bloco2', '3880', '723', 'Ovar');
INSERT INTO `Morada` VALUES ('1025', 'Rua Lagoa de Assões', '0', 'Bloco2', '3880', '723', 'Ovar');
INSERT INTO `Morada` VALUES ('1026', 'Rua Associação Desportiva Ovarense', '0', null, '3880', '723', 'Ovar');
INSERT INTO `Morada` VALUES ('1027', 'Rua das Pontinhas', '17', null, '3860', '467', 'Pardilhó');
INSERT INTO `Morada` VALUES ('1028', 'Rua das Pontinhas', '17', null, '3860', '467', 'Pardilhó');
INSERT INTO `Morada` VALUES ('1029', 'Rua de Santa Marinha', '17', 'r/resq', '3860', '333', 'Avanca');
INSERT INTO `Morada` VALUES ('1030', 'Rua de La Riche - urb Povoa de Baixo', '139', null, '3860', '347', 'Estarreja');
INSERT INTO `Morada` VALUES ('1031', 'Rua de La Riche - urb Povoa de Baixo', '139', null, '3860', '347', 'Estarreja');
INSERT INTO `Morada` VALUES ('1032', 'Rua das Areias - lote 23', '1', '3', '3870', '342', 'Torreira');
INSERT INTO `Morada` VALUES ('1033', 'Rua Padre Adrego', '48', null, '4500', '461', 'Espinho');
INSERT INTO `Morada` VALUES ('1034', 'Rua do Monte', '41', null, '4520', '205', 's. M. Feira');
INSERT INTO `Morada` VALUES ('1035', 'Rua 9 de Abril', '31', null, '3870', '155', 'Pardelhas');
INSERT INTO `Morada` VALUES ('1036', 'Rua Desembargador Correia Teles', '291', 'D', '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('1037', 'Rua Dentazes', '411', '', '3700', '735', 'Milherós');
INSERT INTO `Morada` VALUES ('1038', 'Rua Alvares Cabral', '82', null, '3870', '126', 'Murtosa');
INSERT INTO `Morada` VALUES ('1039', 'Rua Dr João Salema', '73', null, '4550', '122', 'Castelo de Paiva');
INSERT INTO `Morada` VALUES ('1040', 'Rua do Sol', '246', null, '3700', '246', 'Romariz');
INSERT INTO `Morada` VALUES ('1041', 'Rua dos castanheiros', '407', null, '3885', '553', 'Esmoriz');
INSERT INTO `Morada` VALUES ('1042', 'Av. Cidade de Luanda', '31', '7ºC', '1800', '096', 'Lisboa');
INSERT INTO `Morada` VALUES ('1043', 'Travessa da sabreira', '29', null, '4535', '323', 'Paços de Brandão');
INSERT INTO `Morada` VALUES ('1044', 'Rua Desembargador Correia Teles', '85', null, '3860', '362', 'Estarreja');
INSERT INTO `Morada` VALUES ('1045', 'Rua Aido de Baixo', '284', null, '3720', '451', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('1046', 'Tijolo - Bairros', '0', null, '4550', '006', 'Castelo de Paiva');
INSERT INTO `Morada` VALUES ('1047', 'Rua Padre Manuel Garrido', '75', null, '3860', '088', 'Avanca');
INSERT INTO `Morada` VALUES ('1048', 'Av. do Emigrante', '35', null, '3800', '153', 'Murtosa');
INSERT INTO `Morada` VALUES ('1049', 'Rua Zeferino Pereira', '79', null, '3720', '567', 'Oliveira de Azeméis');
INSERT INTO `Morada` VALUES ('1050', 'Rua Padre Donaciano de Abreu Freire', '43', '4-dt', '3860', '252', 'Estarreja');
INSERT INTO `Morada` VALUES ('1051', 'Estrada Nacional 327', '467', null, '3870', '303', 'Torreira');
INSERT INTO `Morada` VALUES ('1052', 'Rua do Baixinho', '44', null, '3720', '467', 'Oliveira de Azemeis');
INSERT INTO `Morada` VALUES ('1053', 'Rua do Carreiro', '7', null, '3850', '578', 'Branca');
INSERT INTO `Morada` VALUES ('1054', 'Rua Fonte dos Batizados', '16', null, '3860', '223', 'Estarreja');
INSERT INTO `Morada` VALUES ('1055', 'Rua das Cabeças', '4', null, '3860', '607', 'Veiros');
INSERT INTO `Morada` VALUES ('1056', 'Rua Padre Manuel Ruela', '17', null, '3870', '050', 'Bunheiro');
INSERT INTO `Morada` VALUES ('1057', 'Rua Fundação Benjamim Dias Costa', '11', '3º', '3860', '153', 'Avanca');
INSERT INTO `Morada` VALUES ('1058', 'Rua Fundação Benjamim Dias Costa', '11', '3º', '3860', '153', 'Avanca');
INSERT INTO `Morada` VALUES ('1059', 'Rua Al Berto', '6', '1ºesq', '2790', '239', 'Carnaxide');
INSERT INTO `Morada` VALUES ('1060', 'Travessa do Farol', '0', null, '3880', '216', 'Ovar');
INSERT INTO `Morada` VALUES ('1061', 'Travessa do Farol', '0', null, '3880', '216', 'Ovar');
INSERT INTO `Morada` VALUES ('1062', 'Travessa do Farol', '0', null, '3880', '216', 'Ovar');
INSERT INTO `Morada` VALUES ('1063', 'Rua Marques Rodrigues', '21', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('1064', 'Rua Marques Rodrigues', '21', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('1065', 'Rua Marques Rodrigues', '21', null, '3860', '297', 'Estarreja');
INSERT INTO `Morada` VALUES ('1066', 'Rua ACDM', '5', null, '3870', '271', 'Murtosa');
INSERT INTO `Morada` VALUES ('1067', 'Rua ACDM', '5', null, '3870', '271', 'Murtosa');
INSERT INTO `Morada` VALUES ('1068', 'Rua ACDM', '5', null, '3870', '271', 'Murtosa');
INSERT INTO `Morada` VALUES ('1069', 'Rua Dr Guilherme Souto', '0', null, '3860', '369', 'Estarreja');
INSERT INTO `Morada` VALUES ('1070', 'rua Areosa do Norte', '17', null, '3860', '204', 'Estarreja');
INSERT INTO `Morada` VALUES ('1071', 'rua Areosa do Norte', '17', null, '3860', '204', 'Estarreja');
INSERT INTO `Morada` VALUES ('1072', '', '0', null, '', '', '');
INSERT INTO `Morada` VALUES ('1073', 'Rua da Igreja', '120', null, '3870', '590', 'Bunheiro');
INSERT INTO `Morada` VALUES ('1074', 'Rua da Igreja', '120', null, '3870', '590', 'Bunheiro');
INSERT INTO `Morada` VALUES ('1075', 'Rua da Igreja', '120', null, '3870', '590', 'Bunheiro');
INSERT INTO `Morada` VALUES ('1076', 'Av. Emigrante', '35', null, '3870', '153', 'Murtosa');
INSERT INTO `Morada` VALUES ('1077', 'Av. Emigrante', '35', null, '3870', '153', 'Murtosa');
INSERT INTO `Morada` VALUES ('1078', 'Av. Emigrante', '35', null, '3870', '153', 'Murtosa');
INSERT INTO `Morada` VALUES ('1079', 'Rua Manuel Bernardino Carvalho', '302', '2ºesq', '3880', '793', 'S. João de Ovar');
INSERT INTO `Morada` VALUES ('1080', 'Rua Manuel Bernardino Carvalho', '302', '2ºesq', '3880', '793', 'S. João de Ovar');
INSERT INTO `Morada` VALUES ('1081', 'Rua Manuel Bernardino Carvalho', '302', '2ºesq', '3880', '793', 'S. João de Ovar');
INSERT INTO `Morada` VALUES ('1082', 'Rua da Quinta Baixa', '15', null, '3860', '387', 'Estarreja');
INSERT INTO `Morada` VALUES ('1083', 'Rua da Quinta Baixa', '15', null, '3860', '387', 'Estarreja');
INSERT INTO `Morada` VALUES ('1084', 'Rua da Quinta Baixa', '15', null, '3860', '387', 'Estarreja');
INSERT INTO `Morada` VALUES ('1085', 'Rua da Sertela', '0', null, '3870', '321', 'Torreira');
INSERT INTO `Morada` VALUES ('1086', 'Rua da Sertela', '0', null, '3870', '321', 'Torreira');
INSERT INTO `Morada` VALUES ('1087', 'Rua João Augusto de Sousa Fernandes', '21', null, '3860', '601', 'Veiros');
INSERT INTO `Morada` VALUES ('1088', 'Rua João Augusto de Sousa Fernandes', '21', null, '3860', '601', 'Veiros');
INSERT INTO `Morada` VALUES ('1089', 'Rua João Augusto de Sousa Fernandes', '21', null, '3860', '601', 'Veiros');
INSERT INTO `Morada` VALUES ('1090', 'Rua Augusto Ramos', '234', 'HN', '3860', '336', 'Estarreja');
INSERT INTO `Morada` VALUES ('1091', 'Rua Augusto Ramos', '234', 'HN', '3860', '336', 'Estarreja');
INSERT INTO `Morada` VALUES ('1092', 'Rua Augusto Ramos', '234', 'HN', '3860', '336', 'Estarreja');
INSERT INTO `Morada` VALUES ('1093', 'Travessa Mato Sul', '9', null, '3865', '256', 'Salreu');
INSERT INTO `Morada` VALUES ('1094', 'Travessa Mato Sul', '9', null, '3865', '256', 'Salreu');
INSERT INTO `Morada` VALUES ('1095', 'Travessa Mato Sul', '9', null, '3865', '256', 'Salreu');
INSERT INTO `Morada` VALUES ('1096', 'Rua António Vieira Pinto', '31', null, '3870', '127', 'Murtosa');
INSERT INTO `Morada` VALUES ('1097', 'Rua António Vieira Pinto', '31', null, '3870', '127', 'Murtosa');
INSERT INTO `Morada` VALUES ('1098', 'Rua António Vieira Pinto', '31', null, '3870', '127', 'Murtosa');
INSERT INTO `Morada` VALUES ('1099', 'Estrada São Filipe', '0', '', '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('1100', 'Estrada São Filipe', '0', '', '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('1101', 'Estrada São Filipe', '0', '', '3860', '276', 'Estarreja');
INSERT INTO `Morada` VALUES ('1102', 'Rua Maria de Lurdes Breu', '42', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('1103', 'Rua Maria de Lurdes Breu', '42', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('1104', 'Rua Maria de Lurdes Breu', '42', null, '3865', '229', 'Salreu');
INSERT INTO `Morada` VALUES ('1105', 'Rua do Ervedal', '936', null, '3720', '072', 'Loureiro');
INSERT INTO `Morada` VALUES ('1106', 'Rua do Ervedal', '936', null, '3720', '072', 'Loureiro');
INSERT INTO `Morada` VALUES ('1107', 'Rua do Ervedal', '936', null, '3720', '072', 'Loureiro');
INSERT INTO `Morada` VALUES ('1108', 'Rua do Sul - Roxico', '50', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('1109', 'Rua do Sul - Roxico', '50', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('1110', 'Rua do Sul - Roxico', '50', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('1111', 'Rua do Sul', '45', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('1112', 'Rua do Sul', '45', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('1113', 'Rua do Sul', '45', null, '3865', '112', 'Fermelã');
INSERT INTO `Morada` VALUES ('1114', 'Rua Joaquim Nicolau', '52', null, '3860', '038', 'Avanca');
INSERT INTO `Morada` VALUES ('1115', 'Rua Joaquim Nicolau', '52', null, '3860', '038', 'Avanca');
INSERT INTO `Morada` VALUES ('1116', 'Rua Joaquim Nicolau', '52', null, '3860', '038', 'Avanca');
INSERT INTO `Morada` VALUES ('1117', 'Travessa do Brejo', '10', null, '3865', '126', 'Fermelã');
INSERT INTO `Morada` VALUES ('1118', 'Travessa do Brejo', '10', null, '3865', '126', 'Fermelã');
INSERT INTO `Morada` VALUES ('1119', 'Travessa do Brejo', '10', null, '3865', '126', 'Fermelã');
INSERT INTO `Morada` VALUES ('1120', 'Rua Professor Firmino Aresta', '15', null, '3870', '356', 'Torreira');
INSERT INTO `Morada` VALUES ('1121', 'Rua Professor Firmino Aresta', '15', null, '3870', '356', 'Torreira');
INSERT INTO `Morada` VALUES ('1122', 'Rua Professor Firmino Aresta', '15', null, '3870', '356', 'Torreira');
INSERT INTO `Morada` VALUES ('1123', 'Rua Dr Pereira de Melo', '389', '1ºdt', '3860', '375', 'Estarreja');
INSERT INTO `Morada` VALUES ('1124', 'Rua Dr Pereira de Melo', '389', '1ºdt', '3860', '375', 'Estarreja');
INSERT INTO `Morada` VALUES ('1125', 'Rua Dr Pereira de Melo', '389', '1ºdt', '3860', '375', 'Estarreja');
INSERT INTO `Morada` VALUES ('1126', 'Rua do Cabeço de Cima', '8', null, '3865', '005', 'Canelas');
INSERT INTO `Morada` VALUES ('1127', 'Rua do Cabeço de Cima', '8', null, '3865', '005', 'Canelas');
INSERT INTO `Morada` VALUES ('1128', 'Rua do Cabeço de Cima', '8', null, '3865', '005', 'Canelas');
INSERT INTO `Morada` VALUES ('1129', 'Rua Dr Alberto Vidal, 131', '0', null, '3860', '368', 'Estarreja');
INSERT INTO `Morada` VALUES ('1130', 'Rua Dr Alberto Vidal, 131', '0', null, '3860', '368', 'Estarreja');
INSERT INTO `Morada` VALUES ('1131', 'Rua Dr Alberto Vidal, 131', '0', null, '3860', '368', 'Estarreja');
INSERT INTO `Morada` VALUES ('1132', 'Rua Dr António de Abreu Freire, 26', '0', null, '3860', '021', 'Avanca');
INSERT INTO `Morada` VALUES ('1133', 'Rua Dr António de Abreu Freire, 26', '0', null, '3860', '021', 'Avanca');
INSERT INTO `Morada` VALUES ('1134', 'Rua Dr António de Abreu Freire, 26', '0', null, '3860', '021', 'Avanca');
INSERT INTO `Morada` VALUES ('1135', 'Rua Santo António, 3 - Veiros', '0', null, '3860', '645', 'Estarreja');
INSERT INTO `Morada` VALUES ('1136', 'Rua Santo António, 3 - Veiros', '0', null, '3860', '645', 'Estarreja');
INSERT INTO `Morada` VALUES ('1137', 'Rua Santo António, 3 - Veiros', '0', null, '3860', '645', 'Estarreja');
INSERT INTO `Morada` VALUES ('1138', 'Rua São Martinho, 34', '0', null, '3865', '271', 'Salreu');
INSERT INTO `Morada` VALUES ('1139', 'Rua Almeida Eça, 13', null, null, '3860', '257', 'Estarreja');
INSERT INTO `Morada` VALUES ('1140', 'Rua do Roxico-vivenda Martins', '2', null, '3865', '111', 'Estarreja');
INSERT INTO `Morada` VALUES ('1141', 'Rua do Roxico-vivenda Martins', '2', null, '3865', '111', 'Estarreja');
INSERT INTO `Morada` VALUES ('1142', 'Rua do Roxico-vivenda Martins', '2', null, '3865', '111', 'Estarreja');
INSERT INTO `Morada` VALUES ('1143', 'Rua Guerra Junqueiro', '25', null, '3870', '133', 'Murtosa');
INSERT INTO `Morada` VALUES ('1144', 'Rua Guerra Junqueiro', '25', null, '3870', '133', 'Murtosa');
INSERT INTO `Morada` VALUES ('1145', 'Rua Guerra Junqueiro', '25', null, '3870', '133', 'Murtosa');
INSERT INTO `Morada` VALUES ('1146', 'Rua Conde Ferreira', '213', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('1147', 'Rua Conde Ferreira', '213', null, '3860', '259', 'Estarreja');
INSERT INTO `Morada` VALUES ('1148', 'Rua de Traz', '238', 'r-c', '3860', '361', 'Estarreja');
INSERT INTO `Morada` VALUES ('1149', 'Rua de Traz', '238', 'r-c', '3860', '361', 'Estarreja');
INSERT INTO `Morada` VALUES ('1150', 'Rua da Devesa', '50', null, '3860', '244', 'Estarreja');
INSERT INTO `Morada` VALUES ('1151', 'Rua da Devesa', '50', null, '3860', '244', 'Estarreja');
INSERT INTO `Morada` VALUES ('1152', 'Rua da Devesa', '50', null, '3860', '244', 'Estarreja');
INSERT INTO `Morada` VALUES ('1153', 'Rua Dr António Tavares Afonso e Cunha', '38', 'lote', '3860', '279', 'Estarreja');
INSERT INTO `Morada` VALUES ('1154', 'Rua Dr António Tavares Afonso e Cunha', '38', 'lote', '3860', '279', 'Estarreja');
INSERT INTO `Morada` VALUES ('1155', 'Rua Álvares Cabral', '21', null, '3870', '126', 'Murtosa');
INSERT INTO `Morada` VALUES ('1156', 'Rua Álvares Cabral', '21', null, '3870', '126', 'Murtosa');
INSERT INTO `Morada` VALUES ('1157', 'Rua Álvares Cabral', '21', null, '3870', '126', 'Murtosa');
INSERT INTO `Morada` VALUES ('1158', 'Rua de São Martinho', '34', null, '3865', '271', 'Salreu');
INSERT INTO `Morada` VALUES ('1159', 'Rua de São Martinho', '34', null, '3865', '271', 'Salreu');
INSERT INTO `Morada` VALUES ('1160', 'Rua de São Martinho', '34', null, '3865', '271', 'Salreu');
INSERT INTO `Morada` VALUES ('1161', 'Rua Padre Garrido', '8', null, '3860', '385', 'Estarreja');
INSERT INTO `Morada` VALUES ('1162', 'Rua Padre Garrido', '8', null, '3860', '385', 'Estarreja');
INSERT INTO `Morada` VALUES ('1163', 'Rua Padre Garrido', '8', null, '3860', '385', 'Estarreja');
INSERT INTO `Morada` VALUES ('1164', 'Travessa Dr António Madureira', '5', '', '3860', '249', 'Estarreja');
INSERT INTO `Morada` VALUES ('1165', 'Travessa Dr António Madureira', '5', '', '3860', '249', 'Estarreja');
INSERT INTO `Morada` VALUES ('1166', 'Travessa Dr António Madureira', '5', '', '3860', '249', 'Estarreja');
INSERT INTO `Morada` VALUES ('1167', 'Rua Póvoa de Baixo', '62', 'r-c B', '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('1168', 'Rua Póvoa de Baixo', '62', 'r-c B', '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('1169', 'Rua Póvoa de Baixo', '62', 'r-c B', '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('1170', 'Rua dos Plátanos-Santo Amaro', '22', null, '3860', '322', 'Estarreja');
INSERT INTO `Morada` VALUES ('1171', 'Rua dos Plátanos-Santo Amaro', '22', null, '3860', '322', 'Estarreja');
INSERT INTO `Morada` VALUES ('1172', 'Rua Miguel Valente Almeida-Veiros', '3', null, '3860', '643', 'Estarreja');
INSERT INTO `Morada` VALUES ('1173', 'Travessa do Outeiro', '1', '', '3860', '236', 'Estarreja');
INSERT INTO `Morada` VALUES ('1174', 'Travessa do Outeiro', '1', '', '3860', '236', 'Estarreja');
INSERT INTO `Morada` VALUES ('1175', 'Rua Condes de Estarreja', '238', '3d', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('1176', 'Rua Condes de Estarreja', '238', '3d', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('1177', 'Rua Condes de Estarreja', '238', '3d', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('1178', 'Rua Condes de Estarreja', '238', '3d', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('1179', 'Rua Condes de Estarreja', '238', '3d', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('1180', 'Rua Condes de Estarreja', '238', '3d', '3860', '676', 'Estarreja');
INSERT INTO `Morada` VALUES ('1181', 'Rua Póvoa de Baixo', '66', '1º drt', '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('1182', 'Rua Póvoa de Baixo', '66', '1º drt', '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('1183', 'Rua Póvoa de Baixo', '66', '1º drt', '3860', '386', 'Estarreja');
INSERT INTO `Morada` VALUES ('1184', 'Rua Manuel Porrão', '27', null, '3870', '291', 'Murtosa');
INSERT INTO `Morada` VALUES ('1185', 'Rua Manuel Porrão', '27', null, '3870', '291', 'Murtosa');
INSERT INTO `Morada` VALUES ('1186', 'Rua Manuel Porrão', '27', null, '3870', '291', 'Murtosa');
INSERT INTO `Morada` VALUES ('1187', 'Rua das Barreiras', '12', '2ºdrt', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('1188', 'Rua das Barreiras', '12', '2ºdrt', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('1189', 'Rua das Barreiras', '12', '2ºdrt', '3860', '341', 'Estarreja');
INSERT INTO `Morada` VALUES ('1190', 'Rua Santa Barbara', '46', null, '3860', '226', 'Estarreja');
INSERT INTO `Morada` VALUES ('1191', 'Rua Santa Barbara', '46', null, '3860', '226', 'Estarreja');
INSERT INTO `Morada` VALUES ('1192', 'Rua Santa Barbara', '46', null, '3860', '226', 'Estarreja');

-- ----------------------------
-- Table structure for Pagamento
-- ----------------------------
DROP TABLE IF EXISTS `Pagamento`;
CREATE TABLE `Pagamento` (
  `ID_Pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Valor` int(11) DEFAULT NULL,
  `ValorPosLimite` int(11) DEFAULT NULL,
  `DataLimite` date NOT NULL,
  `Benificio` int(11) NOT NULL,
  `DescricaoBenificio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `REF_ModoPagamento` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_Pagamento`),
  KEY `IDX_BCEEC9B5A01C030B` (`REF_ModoPagamento`),
  CONSTRAINT `FK_BCEEC9B5A01C030B` FOREIGN KEY (`REF_ModoPagamento`) REFERENCES `ModoPagamento` (`ID_Modo_Pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Pagamento
-- ----------------------------
INSERT INTO `Pagamento` VALUES ('12', 'pagamento completo', '200', '0', '2017-07-31', '1', 'Vale 10 €', '10');
INSERT INTO `Pagamento` VALUES ('13', '1º Pagameno', '100', '0', '2017-07-31', '1', 'Vale 5€ Loja Amarela', '11');
INSERT INTO `Pagamento` VALUES ('14', '2º Pagamento', '100', '0', '2017-12-31', '1', 'Vale 5 € - Loja Amarela', '11');
INSERT INTO `Pagamento` VALUES ('15', '1º Pagamento', '100', '0', '2017-07-31', '0', '', '12');
INSERT INTO `Pagamento` VALUES ('16', '2º Pagamento', '50', '0', '2017-12-31', '0', '', '12');
INSERT INTO `Pagamento` VALUES ('17', '3º Pagamento', '50', '0', '2018-03-31', '0', '', '12');
INSERT INTO `Pagamento` VALUES ('18', '1º Pagamento', '230', '0', '2017-09-30', '0', 'Vale 10€ - Loja Amarela', '13');
INSERT INTO `Pagamento` VALUES ('19', '1º Pagamento', '115', '0', '2017-09-30', '1', 'Vale 5€ - Loja Amarela', '14');
INSERT INTO `Pagamento` VALUES ('20', '2º Pagamento', '115', '0', '2017-12-31', '1', 'Vale 5€ - Loja Amarela', '14');
INSERT INTO `Pagamento` VALUES ('21', '1º Pagamento', '110', '0', '2017-09-30', '0', '', '15');
INSERT INTO `Pagamento` VALUES ('22', '2º Pagamento', '60', '0', '2017-12-31', '0', '', '15');
INSERT INTO `Pagamento` VALUES ('23', '3º Pagamento', '60', '0', '2018-03-31', '0', '', '15');

-- ----------------------------
-- Table structure for PagamentoEntidade
-- ----------------------------
DROP TABLE IF EXISTS `PagamentoEntidade`;
CREATE TABLE `PagamentoEntidade` (
  `pago` tinyint(1) NOT NULL,
  `REF_ModoPagamentoEntidade` int(11) NOT NULL,
  `REF_Pagamento` int(11) NOT NULL,
  `Valor` int(11) DEFAULT NULL,
  `ValorPosLimite` int(11) DEFAULT NULL,
  `DataLimite` date NOT NULL,
  `Benificio` int(11) NOT NULL,
  `DescricaoBenificio` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Descricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`REF_ModoPagamentoEntidade`,`REF_Pagamento`),
  KEY `IDX_24B519F872EEDF39` (`REF_ModoPagamentoEntidade`),
  KEY `IDX_24B519F8E267D72A` (`REF_Pagamento`),
  CONSTRAINT `FK_24B519F872EEDF39` FOREIGN KEY (`REF_ModoPagamentoEntidade`) REFERENCES `ModoPagamentoEntidade` (`ID_Modo_Pagamento_Entidade`),
  CONSTRAINT `FK_24B519F8E267D72A` FOREIGN KEY (`REF_Pagamento`) REFERENCES `Pagamento` (`ID_Pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of PagamentoEntidade
-- ----------------------------
INSERT INTO `PagamentoEntidade` VALUES ('1', '1', '12', '200', '0', '2017-07-31', '1', 'Vale 10 €', 'pagamento completo');

-- ----------------------------
-- Table structure for Posicao
-- ----------------------------
DROP TABLE IF EXISTS `Posicao`;
CREATE TABLE `Posicao` (
  `ID_Posicao` int(11) NOT NULL AUTO_INCREMENT,
  `Posicao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Posicao`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Posicao
-- ----------------------------
INSERT INTO `Posicao` VALUES ('1', 'Guarda-Redes');
INSERT INTO `Posicao` VALUES ('2', 'Defesa');
INSERT INTO `Posicao` VALUES ('3', 'Médio');
INSERT INTO `Posicao` VALUES ('4', 'Avançado');

-- ----------------------------
-- Table structure for Tamanho
-- ----------------------------
DROP TABLE IF EXISTS `Tamanho`;
CREATE TABLE `Tamanho` (
  `ID_Tamanho` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Tamanho`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Tamanho
-- ----------------------------
INSERT INTO `Tamanho` VALUES ('1', 'XS');
INSERT INTO `Tamanho` VALUES ('2', 'S');
INSERT INTO `Tamanho` VALUES ('3', 'M');
INSERT INTO `Tamanho` VALUES ('4', 'L');
INSERT INTO `Tamanho` VALUES ('5', 'XL');
INSERT INTO `Tamanho` VALUES ('6', '4');
INSERT INTO `Tamanho` VALUES ('7', '6');
INSERT INTO `Tamanho` VALUES ('8', '8');
INSERT INTO `Tamanho` VALUES ('9', '10');
INSERT INTO `Tamanho` VALUES ('10', '12');
INSERT INTO `Tamanho` VALUES ('11', '14');

-- ----------------------------
-- Table structure for TipoDocumento
-- ----------------------------
DROP TABLE IF EXISTS `TipoDocumento`;
CREATE TABLE `TipoDocumento` (
  `ID_tipodocumento` int(11) NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID_tipodocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of TipoDocumento
-- ----------------------------
INSERT INTO `TipoDocumento` VALUES ('4', 'CC');
INSERT INTO `TipoDocumento` VALUES ('5', 'NIF');
INSERT INTO `TipoDocumento` VALUES ('6', 'Exame Médico');

-- ----------------------------
-- Table structure for TipoEntidade
-- ----------------------------
DROP TABLE IF EXISTS `TipoEntidade`;
CREATE TABLE `TipoEntidade` (
  `ID_tipoentidade` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_tipoentidade`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of TipoEntidade
-- ----------------------------
INSERT INTO `TipoEntidade` VALUES ('1', 'Atleta');
INSERT INTO `TipoEntidade` VALUES ('2', 'Treinador');
INSERT INTO `TipoEntidade` VALUES ('3', 'Diretor');
INSERT INTO `TipoEntidade` VALUES ('4', 'Outro Staff');
INSERT INTO `TipoEntidade` VALUES ('5', 'Tutor');

-- ----------------------------
-- Table structure for TipoEvento
-- ----------------------------
DROP TABLE IF EXISTS `TipoEvento`;
CREATE TABLE `TipoEvento` (
  `ID_Evento` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_Evento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of TipoEvento
-- ----------------------------
INSERT INTO `TipoEvento` VALUES ('1', 'Golo');
INSERT INTO `TipoEvento` VALUES ('2', 'Cartão Vermelho');
INSERT INTO `TipoEvento` VALUES ('3', 'Cartão Amarelo');
INSERT INTO `TipoEvento` VALUES ('4', 'Entrada de Jogador');
INSERT INTO `TipoEvento` VALUES ('5', 'Saída de Jogador');

-- ----------------------------
-- Table structure for TipoREL
-- ----------------------------
DROP TABLE IF EXISTS `TipoREL`;
CREATE TABLE `TipoREL` (
  `ID_tiporel` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_tiporel`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of TipoREL
-- ----------------------------
INSERT INTO `TipoREL` VALUES ('1', 'Pai');
INSERT INTO `TipoREL` VALUES ('2', 'Mãe');
INSERT INTO `TipoREL` VALUES ('3', 'Avô');
INSERT INTO `TipoREL` VALUES ('4', 'Avó');
INSERT INTO `TipoREL` VALUES ('5', 'Irmão');
INSERT INTO `TipoREL` VALUES ('6', 'Irmã');
INSERT INTO `TipoREL` VALUES ('7', 'Tio');
INSERT INTO `TipoREL` VALUES ('8', 'Tia');
INSERT INTO `TipoREL` VALUES ('9', 'Outro');

-- ----------------------------
-- Table structure for TipoUtilizador
-- ----------------------------
DROP TABLE IF EXISTS `TipoUtilizador`;
CREATE TABLE `TipoUtilizador` (
  `ID_tipoU` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Role` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ID_tipoU`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of TipoUtilizador
-- ----------------------------
INSERT INTO `TipoUtilizador` VALUES ('1', 'Administrador', 'ROLE_ADMIN');
INSERT INTO `TipoUtilizador` VALUES ('2', 'Utilizador', 'ROLE_USER');

-- ----------------------------
-- Table structure for Utilizador
-- ----------------------------
DROP TABLE IF EXISTS `Utilizador`;
CREATE TABLE `Utilizador` (
  `ID_utilizador` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `ID_tipoU` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID_utilizador`),
  UNIQUE KEY `UNIQ_9EF918BC26535370` (`Email`),
  KEY `IDX_9EF918BCF985A922` (`ID_tipoU`),
  CONSTRAINT `FK_9EF918BCF985A922` FOREIGN KEY (`ID_tipoU`) REFERENCES `TipoUtilizador` (`ID_tipoU`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of Utilizador
-- ----------------------------
INSERT INTO `Utilizador` VALUES ('1', 'Administrador', 'anscosta@gmail.com', '123456', '1');
INSERT INTO `Utilizador` VALUES ('5', 'Francisco Oliveira', 'foliveira@digitalmente.net', 'quatropoint2013', '1');
INSERT INTO `Utilizador` VALUES ('6', 'Jorge Lopes', 'jl.guiomar@gmail.com', '2Liga15#', '1');
INSERT INTO `Utilizador` VALUES ('7', 'Marketing CDE', 'marketing@cdestarreja.pt', '2Liga15#', '1');
INSERT INTO `Utilizador` VALUES ('8', 'Pedro Carvalho Oliveira', 'pedroco06@gmail.com', 'rrsfcfaso', '1');
INSERT INTO `Utilizador` VALUES ('9', 'Sandro Botte', 'formacao@cdestarreja.pt', 'CDE1819$', '1');
INSERT INTO `Utilizador` VALUES ('10', 'Jorge faria', 'cdestarreja@gmail.com', 'HPLE1851w', '2');
INSERT INTO `Utilizador` VALUES ('11', 'Marco Dias', 'marcopdias@gmail.com', 'fcporto1893', '2');
INSERT INTO `Utilizador` VALUES ('12', 'Filipe Matos', 'filipematos@cdestarreja.pt', '64w3XFq^kW', '1');

-- ----------------------------
-- View structure for VIEW_Atletas
-- ----------------------------
DROP VIEW IF EXISTS `VIEW_Atletas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `VIEW_Atletas` AS select `e`.`ID_Entidade` AS `ID_Entidade`,`e`.`Nome` AS `Nome`,`e`.`CC` AS `CC`,`e`.`NIF` AS `NIF`,`e`.`Telf` AS `Telf`,`e`.`Telm` AS `Telm`,`e`.`Habilitacoes` AS `Habilitacoes`,`e`.`DataNasc` AS `DataNasc`,`e`.`Email` AS `Email`,`e`.`Naturalidade` AS `Naturalidade`,`e`.`GSanguineo` AS `GSanguineo`,`e`.`Doencas` AS `Doencas`,`m`.`Rua` AS `Rua`,`m`.`Numero` AS `Numero`,`m`.`Andar` AS `Andar`,`m`.`CodPostal4` AS `CodPostal4`,`m`.`CodPostal3` AS `CodPostal3`,`m`.`Localidade` AS `Localidade`,`e`.`REF_Equipamento` AS `REF_Equipamento`,`e`.`REF_Inscricao` AS `REF_Inscricao`,`e`.`REF_Posicao` AS `REF_Posicao`,`em`.`ID_Modalidade` AS `ID_Modalidade`,`e`.`REF_TipoEnt` AS `REF_TipoEnt` from ((`Entidade` `e` left join `Morada` `m` on((`m`.`ID_Morada` = `e`.`REF_Morada`))) left join `Entidade_Modalidade` `em` on((`e`.`ID_Entidade` = `em`.`ID_Entidade`))) where ((`e`.`REF_TipoEnt` = 1) and (`em`.`ID_Modalidade` = 1) and (`e`.`Estado` = 1)) ;

-- ----------------------------
-- View structure for VIEW_Escalao_Entidade
-- ----------------------------
DROP VIEW IF EXISTS `VIEW_Escalao_Entidade`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `VIEW_Escalao_Entidade` AS select `Epoca`.`ID_epoca` AS `ID_epoca`,`esc`.`ID_Escalao` AS `ID_Escalao`,`esc`.`Nome` AS `escalao`,`esc`.`DataInicial` AS `DataInicial`,`esc`.`DataFinal` AS `DataFinal`,`e`.`DataNasc` AS `DataNascEntidade`,`e`.`ID_Entidade` AS `ID_Entidade` from ((`Escalao` `esc` left join `Epoca` on((`Epoca`.`ID_epoca` = `esc`.`REF_Epoca`))) left join `Entidade` `e` on((`e`.`DataNasc` between `esc`.`DataInicial` and `esc`.`DataFinal`))) ;

-- ----------------------------
-- View structure for VIEW_Tutores_Entidades
-- ----------------------------
DROP VIEW IF EXISTS `VIEW_Tutores_Entidades`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `VIEW_Tutores_Entidades` AS select `e1`.`ID_Entidade` AS `entidadeOrigem`,`e2`.`ID_Entidade` AS `entidadeAssociada`,`e2`.`Nome` AS `Nome`,`e2`.`Profissao` AS `Profissao`,`e2`.`CC` AS `CC`,`e2`.`NIF` AS `NIF`,`e2`.`DataNasc` AS `DataNasc`,`e2`.`Email` AS `Email`,`e2`.`Habilitacoes` AS `Habilitacoes`,`e2`.`Telf` AS `Telf`,`e2`.`Telm` AS `Telm`,`m`.`Rua` AS `Rua`,`m`.`Numero` AS `Numero`,`m`.`Andar` AS `Andar`,`m`.`CodPostal4` AS `CodPostal4`,`m`.`CodPostal3` AS `CodPostal3`,`m`.`Localidade` AS `Localidade`,`trel`.`Nome` AS `TipoTutor` from ((((`EntidadeREL` `erel` left join `Entidade` `e1` on((`e1`.`ID_Entidade` = `erel`.`ID_Entidade`))) left join `Entidade` `e2` on((`e2`.`ID_Entidade` = `erel`.`ID_EntidadeAssoc`))) left join `TipoREL` `trel` on((`trel`.`ID_tiporel` = `erel`.`ID_EntidadeAssocTipo`))) left join `Morada` `m` on((`m`.`ID_Morada` = `e2`.`REF_Morada`))) group by `e2`.`ID_Entidade` order by `e1`.`ID_Entidade` ;
SET FOREIGN_KEY_CHECKS=1;
