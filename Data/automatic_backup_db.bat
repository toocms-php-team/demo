@echo off
rem �Զ�����
echo ���ݿ����ڱ���...
rem ��������
rem set Ymd=%date:~,4%%date:~5,2%%date:~8,2%
rem ʱ������  ע������Сʱ��С��10��ʱ�� ��ȡ�ġ�Сʱ��Ϊ �ո�+Сʱ�� ������%time:~1,1%��ȡȥ���ո���ַ� Ҳ��������ķ�ʽ ��ǰ����� 0
rem set his=%time:~0,2%%time:~3,2%%time:~6,2%

rem �����ļ����� ��ʱ�������� С��0��Сʱ��ǰ�����0�ķ���
set h=%time:~0,2%
set h=%h: =0%
set Ymdhis=%date:~0,4%%date:~5,2%%date:~8,2%-%h%%time:~3,2%%time:~6,2%

rem �˺�����˿� д��my.ini�� [mysqldump�±�]
D:\wamp\bin\mysql\mysql5.6.12\bin\mysqldump --default-character-set=utf8 --opt --extended-insert=false -R --hex-blob -x -q wash > D:\wamp\www\wash.toocms-project.com\Data\data\%Ymdhis%.sql
rem ѹ������ ִ��ѹ��
makecab D:\wamp\www\wash.toocms-project.com\Data\data\%Ymdhis%.sql D:\wamp\www\wash.toocms-project.com\Data\data\%Ymdhis%.sql.gz
rem ɾ��ԭ.sql�ļ�
del/f/s/q D:\wamp\www\wash.toocms-project.com\Data\data\%Ymdhis%.sql
@echo on