SET ARMA="F:\SteamLibrary\SteamApps\common\Arma 3\
SET PBO="C:\Program Files (x86)\Bohemia Interactive\Tools\BinPBO Personal Edition\BinPBO.exe"

SET ProjectHome=%~dp0..\

SET ServerFiles=%ProjectHome%extDB-Build\life_server
SET ClientFiles=%ProjectHome%extDB-Build\Altis_Life.Altis
SET ExtDB=%ProjectHome%@extDB\

echo Working in %ProjectHome%


call %PBO% %ServerFiles%
call %PBO% %ClientFiles%

copy %ServerFiles%.pbo %ARMA%@life_server\addons\life_server.pbo"
copy %ExtDB%extdb-conf.ini %ARMA%@ExtDB\extdb-conf.ini"
copy %ExtDB%extdb\db_custom\altis-life-rpg-4.ini %ARMA%@ExtDB\extdb\db_custom\altis-life-rpg-4.ini"

copy %ClientFiles%.pbo %ARMA%\mpmissions\Altis_Life.Altis.pbo"
