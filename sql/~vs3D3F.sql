select * from dbo.gmis_module where modulecode>=1391 and moduleurl<>''  order by modulecode desc

select  * from gmis_relation  where year_2010>=1470   order by id desc
select * from gmis_field order by FieldCode desc

--select * from gmis_module where moduleurl like 'h%'
--select * from gmis_module where modulecode in (1392,1359,1366)
--truncate table gmis_relation
--delete from gmis_field where fieldcode='62191'

--declare @MID INT;
--select @MID=1394;
--INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,
--    fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital,IsPrimaryKey,issearch)
--    VALUES ('fld_'+CAST(@MID AS varchar)+'_60','\u9884\u755917',@MID,10,8,60,'0','YL17','0',0,'0','1','0',0,'0','0',1);
--INSERT INTO gmis_relation (name, url, year_2007, year_2009, year_2010) Values ('G101 工业企业基本情况表_主表', 'g101','','',1396);
--update gmis_module set moduleindex='0.015003004' where modulecode=1484
--select * from gmis_module where moduleurl like 'g105%'
--delete from gmis_field where modulecode=1407
--delete from gmis_Module where modulecode=1407
--delete from gmis_relation where year_2010=1407