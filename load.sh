
p=$(pwd)

service mysqld restart

mysql -uroot -p\!@#tc123 <<!
	SET PASSWORD FOR 'root'@'localhost' = PASSWORD('\!@#tc123');
!

for item in $(ls $p/*.sql)
do
	sqlfile=$(echo $item |  awk -F '/' '{ print $NF}' | awk -F "." '{print $1}')
mysql -uroot -p\!@#tc123 << ! 
	create database if not exists $sqlfile default charset utf8; 
	use $sqlfile; 
	source $item; 
!
done
