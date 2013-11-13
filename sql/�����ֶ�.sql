Begin 
INSERT INTO gmis_module 
(modulename,modulestate,modulelevel,moduleuppercode,useactions,listhelp,
	edithelp,viewhelp,moduleposition,moduleurl, moduleindex) VALUES 
('%s',0,4,1393,'1;2;3;4',' ',' ',' ',%s, %s, %s);
SELECT @@IDENTITY AS 'ModuleCode'; DECLARE @MID int; SELECT @MID=@@IDENTITY;
INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,
	fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital,IsPrimaryKey) 
VALUES ('MoCode','自动编号',@MID,2,4,1,'0','','0',0,'0','0','0',0,'1','1');
INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital) VALUES ('CreatorCode','创建者编号',@MID,2,4,2,'0','','0',0,'0','0','0',0,'1');
INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital,IsPrimaryKey) VALUES ('CreateDate','创建时间',@MID,7,8,3,'getdate()','','0',0,'0','0','0',0,'1','1'); 

INSERT INTO gmis_field (fieldname,caption,modulecode,fieldtypecode,datalength,fieldindex,defaultvalue,
	fielddatasrc,oneditlist,editlistcolumnwidth,onedit,fullline,oneditmust,fieldstatus,isvital,IsPrimaryKey,issearch) 
VALUES ('fld'+@MID+%s,'%s',@MID,%s,%s,%s,%s,%s,'0',0,'0','1','0',0,'0','0',1);

INSERT INTO gmis_relation (name, url, year_2007, year_2009, year_2010)
Values (%s, %s,%s,%s,@MID)
End 