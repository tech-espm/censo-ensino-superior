 -- Criação das dimensões do DW
 
 -- DIM_CURSO
 
insert into censoDW.DIM_CURSO (
		co_curso,
		co_cine_rotulo, 
        NO_CURSO, 
        TP_SITUACAO, 
        TP_MODALIDADE_ENSINO, 
        TP_GRAU_ACADEMICO, 
        IN_GRATUITO,
		NU_CARGA_HORARIA, 
        IN_INTEGRAL, 
        IN_MATUTINO, 
        IN_VESPERTINO, 
        IN_NOTURNO) 
 (SELECT C.CO_CURSO,
		C.CO_CINE_ROTULO, 
	    C.NO_CURSO, 
        C.TP_SITUACAO, 
		C.TP_MODALIDADE_ENSINO, 
        C.TP_GRAU_ACADEMICO, 
        C.IN_GRATUITO,
		C.NU_CARGA_HORARIA, 
        C.IN_INTEGRAL,
        C.IN_MATUTINO, 
        C.IN_VESPERTINO, 
        C.IN_NOTURNO 
FROM DM_CURSO2018 C);

-- DIM_INSTITUICAO

insert into censoDW.DIM_INSTITUICAO (
		CO_IES,
        TP_CATEGORIA_ADMINISTRATIVA,
        TP_ORGANIZACAO_ACADEMICA)
(select I.CO_IES,
		I.TP_CATEGORIA_ADMINISTRATIVA,
        I.TP_ORGANIZACAO_ACADEMICA
from DM_IES2018 I);

-- DIM_REGIAO
delete from censoDW.DIM_REGIAO;

insert into censoDW.DIM_REGIAO (
		CO_LOCAL_OFERTA,
		CO_UF,
		CO_MUNICIPIO,
        NO_LOCAL_OFERTA)
(select R.CO_LOCAL_OFERTA, 
		R.CO_UF,
        R.CO_MUNICIPIO,
        R.NO_LOCAL_OFERTA
        FROM DM_LOCAL_OFERTA2018 R);
        
-- FATO_PERFIL_ALUNO
insert into censoDW.FATO_PERFIL_ALUNO 
		(ID_ALUNO, 
		cd_curso, 
		cd_regiao, 
		cd_instituicao, 
		cd_tempo, 
		TP_SEXO, 
		NU_ANO_NASCIMENTO, 
		TP_COR_RACA,
		CO_PAIS_ORIGEM, 
		IN_FINANCIAMENTO_ESTUDANTIL, 
		TP_ESCOLA_CONCLUSAO_ENSINO_MEDIO)
select  aluno.ID_ALUNO,
        curso.CO_CURSO,
        localc.CO_LOCAL_OFERTA,
        ies.CO_IES,
        ies.NU_ANO_CENSO, 
        aluno.TP_SEXO,
        aluno.NU_ANO_NASCIMENTO,
        aluno.TP_COR_RACA,
        aluno3.CO_PAIS_ORIGEM,
        aluno4.IN_FINANCIAMENTO_ESTUDANTIL,
		aluno2.TP_ESCOLA_CONCLUSAO_ENS_MEDIO
from DM_ALUNO2018_01 aluno 
inner join DM_CURSO2018 curso on (aluno.CO_CURSO = curso.CO_CURSO)
inner join DM_LOCAL_OFERTA2018 localc on (curso.CO_LOCAL_OFERTA = localc.CO_LOCAL_OFERTA)
inner join DM_IES2018 ies on (aluno.CO_IES = ies.CO_IES)
inner join DM_ALUNO2018_03 aluno3 on (aluno.IDCarga = aluno3.IDCarga)
inner join DM_ALUNO2018_04 aluno4 on (aluno.IDCarga = aluno4.IDCarga)
inner join DM_ALUNO2018_02 aluno2 on (aluno.IDCarga = aluno2.IDCarga);

-- FATO_ANALISE_IES

insert into censoDW.FATO_ANALISE_IES 
		(cd_regiao, 
		cd_instituicao,
        ano,
		QT_INSCRITO_TOTAL, 
		QT_VAGA_TOTAL)
select  localc.CO_LOCAL_OFERTA,
        ies.CO_IES,
        ies.NU_ANO_CENSO, 
        curso.QT_INSCRITO_TOTAL,
		curso.QT_VAGA_TOTAL
from DM_LOCAL_OFERTA2018 localc
inner join DM_IES2018 ies on (localc.CO_IES = ies.CO_IES)
inner join DM_CURSO2018 curso on (ies.CO_IES = curso.CO_IES);

-- FATO_ANALISE_CURSO

insert into censoDW.FATO_ANALISE_CURSO
		(cd_regiao, 
		cd_curso,
        ano,
		QT_MATRICULA_TOTAL)
select  localc.CO_LOCAL_OFERTA,
        curso.CO_CURSO,
        curso.NU_ANO_CENSO, 
        curso.QT_MATRICULA_TOTAL
from DM_LOCAL_OFERTA2018 localc
inner join DM_CURSO2018 curso on (localc.CO_LOCAL_OFERTA=curso.CO_LOCAL_OFERTA);








