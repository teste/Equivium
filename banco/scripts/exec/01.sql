CREATE TABLE REALIZA_ANAGRAMA(
	RAN_CODIGO       BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY,
	RAN_PARTICIPANTE BIGINT NOT NULL,
	RAN_PESQUISADOR  BIGINT NOT NULL,
	RAN_DATA DATE    DEFAULT CURRENT_DATE NOT NULL 
)

CREATE TABLE ITENS_REALIZA_ANAGRAMA(
	IAN_CODIGO           BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY,
	IAN_REALIZA          BIGINT NOT NULL,
	IAN_ANAGRAMA         BIGINT NOT NULL,
	IAN_ANA_INSTANCIA    INT DEFAULT 0  NOT NULL,
	IAN_MODELO           BIGINT NOT NULL,
	IAN_MODELO_TIPO      CHAR(1) NOT NULL,
	IAN_RESULTADO        VARCHAR(10) NOT NULL,
	IAN_TENTATIVA        INT NOT NULL,
	IAN_TEMPO            BIGINT NOT NULL,
	IAN_ORDEM_EXEC       INT DEFAULT 0  NOT NULL
)
DROP TABLE SESSAO_ANAGRAMA        IF EXISTS;
DROP TABLE SESSOES_ANAGRAMA        IF EXISTS;

CREATE TABLE SESSAO_ANAGRAMA(
	SES_ANA_SESSAO 		BIGINT NOT NULL,
	SES_ANA_ANAGRAMA   	BIGINT NOT NULL
)

CREATE TABLE SESSOES_ANAGRAMA(
	SAN_CODIGO BIGINT GENERATED BY DEFAULT AS IDENTITY (START WITH 1, INCREMENT BY 1) PRIMARY KEY,
	SAN_NOME   VARCHAR(50) NOT NULL,
	SAN_SIGLA  CHAR(4) NOT NULL,
	SAN_REFORCO_FIM  BIGINT NULL
)

--ALTER TABLE SESSOES         	 ADD  FOREIGN KEY(SES_REFORCO_FIM) 			REFERENCES REFORCOS (REF_CODIGO)       ON UPDATE CASCADE ON DELETE NO ACTION ;
ALTER TABLE SESSOES_ANAGRAMA     ADD  FOREIGN KEY(SES_ANA_ANAGRAMA) 		REFERENCES REFORCOS (REF_CODIGO)       ON UPDATE CASCADE ON DELETE NO ACTION ;

ALTER TABLE SESSAO_ANAGRAMA      ADD  FOREIGN KEY(SES_ANA_SESSAO) 	        REFERENCES SESSOES (SES_CODIGO)        ON UPDATE CASCADE ON DELETE CASCADE ;
ALTER TABLE SESSAO_ANAGRAMA      ADD  FOREIGN KEY(SES_ANA_FASE) 	        REFERENCES ANAGRAMAS (ANA_CODIGO)       ON UPDATE CASCADE ON DELETE CASCADE ;