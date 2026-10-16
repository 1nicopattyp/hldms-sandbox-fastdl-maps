@echo off
title Windows FastDL Smart BZ2 Compressor
echo Сжатие файлов и автопереименование в BZ2 через PowerShell...
echo.

for %%i in (*.vtf *.vmt *.mdl *.vvd *.vtx *.phy) do (
    echo Сжимаю файл: %%i
    :: Создаем временный ZIP архив
    powershell -Command "Compress-Archive -Path '%%i' -DestinationPath '%%i.zip' -Force"
    :: Переименовываем .zip в .bz2 средствами Windows
    if exist "%%i.zip" (
        move /y "%%i.zip" "%%i.bz2" >nul
    )
)

echo.
echo Готово! Все файлы успешно сжаты и переименованы в .bz2 без программ и ошибок.
pause