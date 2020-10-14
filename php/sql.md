# sql
## sql
~~~sql
-- 新增資料表
CREATE TABLE table_name (column_name column_type);

-- 插入
INSERT INTO table_name ( field1, field2,...fieldN ) VALUES ( value1, value2,...valueN );

-- 選擇
SELECT column_name,column_name FROM table_name [WHERE Clause] [LIMIT N]
select * from table_name;

-- 更新
UPDATE table_name SET field1=new-value1, field2=new-value2

-- 刪除
DELETE FROM table_name [WHERE Clause]

-- 選擇特定內容
-- 搜尋(abcd，abce等)
SELECT * FROM table WHERE memo LIKE 'abc%'
-- 刪除
DELETE FROM table WHERE memo LIKE 'abc%'
~~~
## php_sql
插入
~~~php
$sql  =  "SELECT  FROM  WHERE ";
$q    =  $this->db->query($sql);
if($q->num_rows() > 0){
  $r = $q->first_row('array');
}
~~~
選擇
~~~php
$sql  =  "INSERT INTO  (col1,col2) VALUES (?,?)";
$q    =  $this->db->query($sql,array('',''));
if($this->db->affected_rows()>0)
{
  //$this->db->insert_id();
}
~~~
更新
~~~php
$sql  =  "UPDATE  SET col1=?,col2=? WHERE ";
$q    =  $this->db->query($sql,array('',''));
if($this->db->affected_rows()>0)
{
  //
}
~~~
刪除
~~~php
$sql  =  "DELETE FROM  WHERE ";
$q    =  $this->db->query($sql);
if($this->db->affected_rows()>0)
{

}
~~~
