insert into DM_ALUNO2018_01_ESPM (select * from DM_ALUNO2018_01 where CO_IES like "1327" or CO_IES like "636" OR CO_IES like "944");
insert into DM_ALUNO2018_02_ESPM (select * from DM_ALUNO2018_02 where IDCarga in (select IDCarga from DM_ALUNO2018_01_ESPM));
insert into DM_ALUNO2018_03_ESPM (select * from DM_ALUNO2018_03 where IDCarga in (select IDCarga from DM_ALUNO2018_01_ESPM));
insert into DM_ALUNO2018_04_ESPM (select * from DM_ALUNO2018_04 where IDCarga in (select IDCarga from DM_ALUNO2018_01_ESPM));
insert into DM_ALUNO2018_05_ESPM (select * from DM_ALUNO2018_05 where IDCarga in (select IDCarga from DM_ALUNO2018_01_ESPM));

insert into DM_LOCAL_OFERTA2018_ESPM (select * from DM_LOCAL_OFERTA2018 where CO_IES like "1327" or CO_IES like "636" OR CO_IES like "944");
insert into DM_DOCENTE2018_ESPM (select * from DM_DOCENTE2018 where CO_IES like "1327" or CO_IES like "636" OR CO_IES like "944");
insert into DM_CURSO2018_ESPM (select * from DM_CURSO2018 where CO_IES like "1327" or CO_IES like "636" OR CO_IES like "944");
insert into DM_IES2018_ESPM (select *  from DM_IES2018 where CO_IES like "1327" or CO_IES like "636" OR CO_IES like "944");

select * from DM_ALUNO2018_01_ESPM;
select * from DM_ALUNO2018_02_ESPM;
select * from DM_ALUNO2018_03_ESPM;
select * from DM_ALUNO2018_04_ESPM;
select * from DM_ALUNO2018_05_ESPM;
select * from DM_LOCAL_OFERTA2018_ESPM;
select * from DM_DOCENTE2018_ESPM;
select * from DM_IES2018_ESPM;
select * from DM_CURSO2018_ESPM;




