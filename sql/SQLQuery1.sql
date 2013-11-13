select * from dbo.gmis_module where moduleurl='g101'

select * from gmis_mo_1394;

select fieldname, fielddatasrc from gmis_field where modulecode=1394 and fielddatasrc<>''

select * from gmis_field where modulecode=1280 and onedit=0
select * from gmis_field where modulecode=1396
update gmis_field  set onedit=1 where modulecode in
( select b.modulecode  from dbo.gmis_module b where b.modulecode>=1391 and moduleurl<>'')
update gmis_field set onedit=0 where isvital=1

select count(*) from gmis_field where modulecode in
( select b.modulecode  from dbo.gmis_module b where b.modulecode>=1391 and moduleurl<>'')