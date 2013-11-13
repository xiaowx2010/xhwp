--select * from dbo.gmis_module where modulecode>=1390 and moduleurl<>'' order by modulecode desc
select * from gmis_module where moduleurl='g104_sub1'
select * from gmis_module where modulecode='1300'
select * from gmis_field where fieldname='fld_1281_77'
select * from gmis_field where modulecode='1282' and fieldindex>100
select * from gmis_field where modulecode='1398' and caption ='4.受纳水体代码5'


--g103,g109,h102,s405_c,s405_c_sub1,s406_c,s406_c_sub1

--select * from gmis_relation
--select * from gmis_field order by FieldCode desc
--truncate table gmis_relation
--delete from gmis_field where fieldcode='62191'

--declare @MID INT;
--select @MID=1394;
--INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,
--    fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital,IsPrimaryKey,issearch)
--    VALUES ('fld_'+CAST(@MID AS varchar)+'_60','\u9884\u755917',@MID,10,8,60,'0','YL17','0',0,'0','1','0',0,'0','0',1);
--INSERT INTO gmis_relation (name, url, year_2007, year_2009, year_2010) Values ('G101 工业企业基本情况表_主表', 'g101','','',1396);
--update gmis_module set modulename='G101 工业企业基本情况表_主表' where modulecode=1396
--select * from gmis_module where moduleurl like 'g105%'