@echo off
SET ProjectHome=%~dp0..\

start "arma3" /min /high "F:\SteamLibrary\SteamApps\common\Arma 3\arma3server.exe" -port=2302 "-config=Config\cfg\serverConfig.cfg" "-profiles=Config\log" "-cfg=Config\cfg\server_network.cfg" "-BEPath=Battleye" "-mod=@extDB2;@life_server;" -world=empty -nosplash -noSound -noPause -enableHT -autoinit
exit
