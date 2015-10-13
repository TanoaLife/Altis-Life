@echo off
SET ProjectHome=%~dp0..\

start "arma3" /min /high "F:\SteamLibrary\SteamApps\common\Arma 3\arma3server.exe" -port=2302 "-config=Config\cfg\serverConfig.cfg" "-profiles=Config\log" "-cfg=Config\cfg\server_network.cfg" -name=AltisLife "-mod=@ExtDB;@LifeServer;" -world=empty -nosplash -noSound -noPause -enableHT -malloc=system -autoinit
exit
