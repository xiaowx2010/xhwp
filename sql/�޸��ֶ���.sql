drop table #g_1280
drop table #g_1396
select * from gmis_field where modulecode='1283'
select * from gmis_field where modulecode='1399'
--select fieldname from gmis_field where modulecode='1398' group by fieldname having count(*)>1
--select fieldindex from gmis_field where modulecode='1398' group by fieldindex having count(*)>1
--update gmis_field set fieldname='fld_1398_56', caption='Ô¤Áô02' where MODULECODE=1398 and fieldDatasrc='YL02'
--update gmis_field set fieldname='fld_1398_56' where fieldcode = 62521

select *  into #g_1280 from gmis_field  where modulecode='1283'
select *  into #g_1396 from gmis_field  where modulecode='1399'

select * from #g_1396 where caption not in(select caption from #g_1280)
select * from #g_1280 where caption not in(select caption from #g_1396)



begin transaction begin

	update gmis_field set fieldindex=g2.fieldindex, fieldname=replace(g2.fieldname, '1283', '1399')
	from gmis_field g3
		inner join #g_1280 g2
			on g2.caption = g3.caption 
	where g3.modulecode='1399'
end

select g1.fieldname,g2.fieldname,g1.fieldindex,g2.fieldindex,g1.caption,g2.caption from gmis_field g1
	inner join #g_1280 g2
		on g2.caption = g1.caption
where g1.modulecode='1399'
select fieldname from gmis_field where modulecode='1399' group by fieldname having count(*)>1 order by fieldname

--commit

--rollback