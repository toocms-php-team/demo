@echo off
echo ���ݿ����ڻ�ԭ...
rem ��ѹ������ ��ѹ�� .sql�ļ�
expand D:\wamp\www\base.toocms-project.com\Data\data\{{file}}.sql.gz D:\wamp\www\base.toocms-project.com\Data\data\{{file}}.sql

rem �˺�����˿� д��my.ini��
D:\wamp\bin\mysql\mysql5.6.12\bin\mysql base < D:\wamp\www\base.toocms-project.com\Data\data\{{file}}.sql

rem ɾ��.sql�ļ�
del/f/s/q D:\wamp\www\base.toocms-project.com\Data\data\{{file}}.sql
@echo on