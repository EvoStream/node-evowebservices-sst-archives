@echo off

echo creating installation folder in node_evowebservices-sst\.... 
IF NOT EXIST node_evowebservices MD node_evowebservices-sst

echo changing directory to node_evowebservices-sst\......
CD node_evowebservices-sst

echo getting evowebservices-sst on github...
call npm install --save https://github.com/EvoStream/node-evowebservices-sst/tarball/master

echo changing directory to evowebservices....
cd node_modules\evowebservices-sst

echo starting evowebservices-sst using npm....
call npm start

echo.
echo evowebservices-sst INSTALLED ON %cd%\node_evowebservices\node_modules\evowebservices-sst
echo PRESS ANY KEY TO EXIT. 
echo.
pause >nul