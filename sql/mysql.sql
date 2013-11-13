SELECT *,table_comment,table_name,table_rows FROM information_schema.tables
WHERE table_schema = DATABASE() and table_name like 'g%';
#('g201','g203','g203_1','g204','g204_1','g205','g206','g207','g208','g112','g113','g114','g115','g116','g107_sub2','g109_sub1','g109_sub2','h102_2','h103_2','h104_2','h105_2','h106_2','h107_2','h201_1','h201_2','h202','h306','h402','h403','j502','j502_1','j502_2','j502_3','j502_2_sub1','j502_3_sub1','j503','j503_1','j503_2','j503_3','j503_2_sub1','j503_3_sub1','j504','j504_1','j504_2','j504_3','j504_2_sub1','j504_3_sub1','n301','n301_c','n302_1','n302_1_c','n301_c_sub1','n302_1_sub1','n302_2','n302_2_sub1','n302_2_c','n303','s405','s405_c','s405_c_sub1','s406','s406_c','s406_c_sub1');


#select * from g202;