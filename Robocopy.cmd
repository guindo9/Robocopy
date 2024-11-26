@echo off
rem ------------------------------------------------------------------------------
setlocal EnableDelayedExpansion
rem Variables
set contador_carpetas=0
set contador_archivos=0

rem costruccion para copia de archivos
set operadores_archivos=/Y

rem construccion para ver progreso de robocopy
set progreso=*.* /S /E /MT:32 /V
set progreso1=/R:5 /W:10
set operador_progreso=%progreso% /ETA %progreso1%

rem construccion para guardar un archivo log de robocopy
set operador2=/NP /LOG:
set rutadeorigen=%~d0%~p0
rem ------------------------------------------------------------------------------

rem Menus de opciones
:main
mode con:cols=81 lines=23
if defined opcion_apagado (
	color b0
    title Robocopy  "Apagado automatico activado"   %username%   %DATE%   Alvaro.A
) else (
	color 30
    title Robocopy  %username%   %DATE%   Alvaro.A
)
set carpeta_completa=
set contenido_de_carpeta=
echo.
echo       :====================================================================:
echo       :                                                                    :
echo       :-                          Robocopy.exe                            -:
echo       :                                                                    :
echo       :====================================================================:
echo.
echo       :====================================================================:
echo       :                                                                    :
echo       :-  Selecciona (1) para "Copiar carpeta completa"                   -:
echo       :                                                                    :
echo       :====================================================================:
echo       :                                                                    :
echo       :-  Selecciona (2) para "Copiar contenido dentro de una carpeta"    -:
echo       :                                                                    :
echo       :====================================================================:
echo       :                                                                    :
if defined opcion_apagado (
	echo       :-  Selecciona (3^) para "Desactivar apagado automatico"             -:
) else (
    echo       :-  Selecciona (3^) para "Activar apagado automatico"                -:
)
echo       :                                                                    :
echo       :====================================================================:
echo.
choice /C 123 /M "Presiona"
if %errorlevel%==1 set carpeta_completa=1& goto carpet
if %errorlevel%==2 set contenido_de_carpeta=2& goto carpet
if %errorlevel%==3 (if defined opcion_apagado (set opcion_apagado=& goto main) else (set opcion_apagado=2& goto main))

:carpet
mode con:cols=106 lines=30
if defined carpeta_completa (color 09)
if defined contenido_de_carpeta (color 03)
if defined opcion_apagado (color 0b)
set varias_carpetas_progreso=
set varias_carpetas_log=
if defined opcion_apagado (title Robocopy  "Apagado automatico activado"   %username%   %DATE%   Alvaro.A)
cls
echo.
echo          ========================================================================================
echo         /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\ 
echo        /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo       /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo      /  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \
echo     :================================================================================================:
if defined carpeta_completa (echo     :-                                "Copiar carpeta completa"                                     -:)
if defined contenido_de_carpeta (echo     :-                         "Copiar contenido dentro de una carpeta"                             -:)
echo     :================================================================================================:
echo     :                                                                                                :
echo     :- Selecciona (1) para "Copiar una o varias carpetas secuencialmente y ver progreso"            -:
echo     :                                                                                                :
echo     :================================================================================================:
echo     :                                                                                                :
echo     :- Selecciona (2) para "Copiar una o varias carpetas secuencialmente con log de registro"       -:
echo     :                                                                                                :
echo     :================================================================================================:
echo     :                                                                                                :
echo     :- Selecciona (3) para "Regresar al Menu"                                                       -:
echo     :                                                                                                :
echo     :================================================================================================:
echo      \  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /\  /
echo       \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo        \/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
echo         \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/  \/ 
echo          ========================================================================================
echo.
echo.
choice /C 123 /M "Presiona"
if %errorlevel%==1 set varias_carpetas_progreso=2
if %errorlevel%==2 set varias_carpetas_log=2
if %errorlevel%==3 goto main

:menu3
color 0e
mode con:cols=81 lines=26
set carpeta_una_ruta=
set carpeta_varias_rutas=
set anexar=
echo.
echo      :=====================================================================:
echo      :                                                                     :
echo      :-Selecciona (1) para "Copiar carpetas a una sola ruta de destino"   -:
echo      :                                                                     :
echo      :=====================================================================:
echo      :                                                                     :
echo      :-Selecciona (2) para "Copiar carpetas a diferentes rutas de destino" :
echo      :                                                                     :
echo      :=====================================================================:
echo      :                     "Copiar carpetas a una sola ruta de destino"    :
echo      :-Selecciona (3) para                      y                         -:
echo      :                                  "Anexar archivos"                  :
echo      :=====================================================================:
echo      :                     "Copiar carpetas a diferentes rutas de destino" :
echo      :-Selecciona (4) para                      y                         -:
echo      :                                  "Anexar archivos"                  :
echo      :=====================================================================:
echo      :                                                                     :
echo      :-Selecciona (5) para "Regresar al Menu"                             -:
echo      :                                                                     :
echo      :=====================================================================:
echo.
echo.
choice /C 12345 /M "Presiona"
if %errorlevel%==1 set carpeta_una_ruta=2
if %errorlevel%==2 set carpeta_varias_rutas=2
if %errorlevel%==3 set carpeta_una_ruta=2& set anexar=2
if %errorlevel%==4 set carpeta_varias_rutas=2& set anexar=2
if %errorlevel%==5 goto carpet

:menu_info
for /l %%i in (1, 1, %contador_carpetas%) do (
    set "carpeta_origen[%%i]="
    set "carpeta_destino[%%i]="
    set "filename[%%i]="
)
set contador_carpetas=
set mensaje_ruta=
set carpeta_destino=
set carpeta_origen=
color 03
mode con:cols=150 lines=48
echo ------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
if defined carpeta_completa (echo                                                              "Copiar carpeta completa")
if defined contenido_de_carpeta (echo                                                        "Copiar contenido dentro de una carpeta")
if defined varias_carpetas_progreso (echo                                               "Copiar una o varias carpetas secuencialmente y ver progreso")
if defined varias_carpetas_log (echo                                             "Copiar una o varias carpetas secuencialmente con log de registro")
if defined carpeta_una_ruta (echo                                                      "Copiar carpetas a una sola ruta de destino")
if defined carpeta_varias_rutas (echo                                                     "Copiar carpetas a diferentes rutas de destino")
if defined anexar (echo                                                                  "Anexar archivos")
if defined opcion_apagado (echo                                                            "Apagado automatico activado")
echo.
echo ------------------------------------------------------------------------------------------------------------------------------------------------------
echo.

:inicio
set /p "carpeta_origen=Introduce una carpeta a copiar (o escribe 'fin' para continuar las copias): "

if not defined carpeta_origen (
	color 0c& echo.& echo No se ha agregado la ruta de origen& echo.& pause
	goto menu_info
)

if not "!carpeta_origen!"=="fin" (
	if exist "!carpeta_origen!\." (
		set "carpeta_origen=!carpeta_origen:"=!"
	) else (
	    color 0c& echo.& echo La ruta de origen no es valida o no existe la carpeta.& echo.& pause
		goto menu_info
	)
)

if /i "!carpeta_origen!"=="fin" (
	if defined carpeta_una_ruta (
		echo.& color 0b
		set /p "carpeta_destino=Introduce la carpeta de destino: "& echo.
        if not defined carpeta_destino (
			color 0c& echo.& echo No se ha agregado la ruta de destino& echo.& pause
	    	goto menu_info
		)
		if exist "!carpeta_destino!\." (
			set carpeta_destino=!carpeta_destino:"=!
			for /l %%i in (1, 1, %contador_carpetas%) do (
			    set "carpeta_destino[%%i]=!carpeta_destino!"
			)
		) else (
            color 0c & echo.& echo La ruta de destino no es valida o no existe la carpeta.& echo.& pause
            goto menu_info
		)
	)
) else (
	if defined carpeta_varias_rutas (
	    color 0b
	    set "mensaje_ruta=Introduce la carpeta de destino: "
	    if defined carpeta_destino set "mensaje_ruta=Deseas usar la ruta definida previamente? (Presiona Enter para usarla, de lo contrario, ingresa una nueva ruta): "
	    set /p "carpeta_destino=!mensaje_ruta!"
	    echo.
	    if not defined carpeta_destino (
	        color 0c & echo.& echo No se ha agregado la ruta de destino& echo.& pause
	        goto menu_info
	    )
	    set "carpeta_destino=!carpeta_destino:"=!
	    rem Comprobar si la carpeta existe
		if not exist "!carpeta_destino!\." (
			color 0c & echo.& echo La ruta de destino no es valida o no existe la carpeta.& echo.& pause
			goto menu_info
		)
		color 03
	)
    set "carpeta_destino=!carpeta_destino:"=!"
    set /a contador_carpetas+=1
    rem Extrae solo el nombre de la carpeta sin toda ruta y lo guarda en la variable filename
    for %%f in ("!carpeta_origen!") do set filename=%%~nxf

    set "carpeta_origen[!contador_carpetas!]=!carpeta_origen!"
    set "filename[!contador_carpetas!]=!filename!"
    set "carpeta_destino[!contador_carpetas!]=!carpeta_destino!"
    set carpeta_origen=
    goto inicio
)

if defined anexar (
	call :copias_sultas
)

mode con:cols=150 lines=48
color 03
rem Muestra las carpetas y/o archivos a copiar
rem Carpetas
cls & echo --==================================================================================================================================================--
echo - Se copiaran las siguientes carpetas:
echo.
for /l %%i in (1, 1, %contador_carpetas%) do (
    if defined contenido_de_carpeta (
        echo  [%%i] "!carpeta_origen[%%i]!" - "!carpeta_destino[%%i]!"
	) else (
        echo  [%%i] "!carpeta_origen[%%i]!" - "!carpeta_destino[%%i]!\!filename[%%i]!"
	)
)

rem Archivos
if defined anexar (
	echo.
	echo ------------------------------------------------------------------------------------------------------------------------------------------------------
	echo - Se copiaran los siguientes archivos:
    echo.
    for /l %%i in (1, 1, %contador_archivos%) do (
	    echo  [%%i] "!archivo_origen[%%i]!" - "!archivo_destino[%%i]!"
	)
)
echo.
echo --==================================================================================================================================================--
echo.
pause

if defined varias_carpetas_log (
	if not exist 1.logs (mkdir 1.logs)
	rem Obtener la hora y fecha formateadas
	for /f "tokens=1-4 delims=: " %%a in ('TIME /T') do (
	    set "hora=%%a"
	    set "minutos=%%b"
	    set "periodo1=%%c"
	    set "periodo2=%%d"
	)
	set "periodo=!periodo1!!periodo2!"
	set "periodo=!periodo:.=!"
	set "fecha=%DATE:/=-%"
	set "log=!fecha! !hora!.!minutos!_!periodo!"

	rem Crear el nombre de archivo de registro
	set "log_archivo=%rutadeorigen%1.logs\Archivos_!log!.txt"
)

rem Copia de archivos
if defined anexar (
    for /l %%i in (1, 1, %contador_archivos%) do (
	    copy "!archivo_origen[%%i]!" "!archivo_destino[%%i]!" %operadores_archivos%
	    if defined varias_carpetas_log (
	    	if errorlevel 0 (
	    		echo Copia exitosa: "!archivo_origen[%%i]!" a "!archivo_destino[%%i]!">> "!log_archivo!"
	        ) else (
	            echo Error al copiar: "!archivo_origen[%%i]!" a "!archivo_destino[%%i]!">> "!log_archivo!"
	        )
	    )
	)
)

rem Copia las carpetas con Robocopy.exe
color 0a
for /l %%i in (1, 1, %contador_carpetas%) do (
	set log="%rutadeorigen%1.logs\Carpeta_!filename[%%i]!.txt"
    set operador_log=%progreso% %operador2%!log! %progreso1%
	if defined varias_carpetas_progreso (
		if defined contenido_de_carpeta (
			robocopy.exe "!carpeta_origen[%%i]!" "!carpeta_destino[%%i]!" %operador_progreso%
		) else (
            robocopy.exe "!carpeta_origen[%%i]!" "!carpeta_destino[%%i]!\!filename[%%i]!" %operador_progreso%
		)
    ) else (
    	if defined contenido_de_carpeta (
			robocopy.exe "!carpeta_origen[%%i]!" "!carpeta_destino[%%i]!" !operador_log!
		) else (
            robocopy.exe "!carpeta_origen[%%i]!" "!carpeta_destino[%%i]!\!filename[%%i]!" !operador_log!
		)
    )
)
echo.
echo --=-==============================================================================================================================================-=--
color a0
echo.
echo    "COPIA COMPLETA"
echo.
if defined opcion_apagado (goto apagadoauto)
pause
exit

:apagadoauto
shutdown -s -t 35
color c0
echo.
echo   "30 Segundos para cancelar apagado automatico"
echo. 
choice /T 33 /C 12 /D 2 /N /M "Presiona 1 para cancelar apagado automatico"
if %errorlevel%==1 goto apagar
if %errorlevel%==2 goto salir

:apagar
color a0
echo.
shutdown /a
echo APAGADO AUTOMATICO CANCELADO
pause
exit

:salir
exit


:copias_sultas
color 0e
mode con:cols=80 lines=18
echo.
echo      :=====================================================================:
echo      :                                                                     :
echo      :-                  "Copia de archivos especificos"                  -:
echo      :                                                                     :
echo      :=====================================================================:
echo      :                                                                     :
echo      :-Selecciona (1) para "Copiar archivos a una sola ruta de destino"   -:
echo      :                                                                     :
echo      :=====================================================================:
echo      :                                                                     :
echo      :-Selecciona (2) para "Copiar archivos a diferentes rutas de destino" :
echo      :                                                                     :
echo      :=====================================================================:
echo.
echo.
choice /C 12 /M "Presiona"
if %errorlevel%==1 set archivo_ruta=2
if %errorlevel%==2 set archivo_rutas=2

cls
:copias_info
for /l %%i in (1, 1, %contador_archivos%) do (
    set "archivo_origen[%%i]="
    set "archivo_destino[%%i]="
)
set contador_archivos=
set archivo_origen=
set archivo_destino=
color 03
mode con:cols=150 lines=48
echo ------------------------------------------------------------------------------------------------------------------------------------------------------
echo.
if defined archivo_ruta (echo                                                       "Copiar archivos a una ruta de destino")
if defined archivo_rutas (echo                                                    "Copiar archivos a diferentes rutas de destino")
if defined opcion_apagado (echo                                                            "Apagado automatico activado")
echo.
echo ------------------------------------------------------------------------------------------------------------------------------------------------------
echo.

:inicio_archivos
set /p "archivo_origen=Introduce un archivo a copiar (o escribe 'fin' para continuar las copias): "
if not defined archivo_origen (
	color 0c
	echo.
    echo No se ha agregado un archivo de origen
    echo.
    pause
    goto copias_info
)

if not "!archivo_origen!"=="fin" (
	if exist "!archivo_origen!" (
		set "archivo_origen=!archivo_origen:"=!"
	) else (
	    color 0c& echo.& echo El archivo de origen no es valido o no existe.& echo.& pause
		goto copias_info
	)
)

if /i "!archivo_origen!"=="fin" (
	if defined archivo_ruta (
		echo.& color 0b
		set /p "archivo_destino=Introduce la carpeta de destino: "& echo.
        if not defined archivo_destino (
			color 0c
			echo.
		    echo No se ha agregado la ruta de destino
		    echo.
		    pause
		    goto copias_info
		)
	    if exist "!archivo_destino!\." (
	    	set archivo_destino=!archivo_destino:"=!
			for /l %%i in (1, 1, %contador_archivos%) do (
			    set "archivo_destino[%%i]=!archivo_destino!"
			)
		) else (
            color 0c & echo.& echo La ruta de destino no es valida o no existe la carpeta.& echo.& pause
            goto copias_info
		)
	)
) else (
	if defined archivo_rutas (
		color 0b
		set /p "archivo_destino=Introduce la carpeta de destino: "& echo.
		if not defined archivo_destino (
			color 0c
			echo.
		    echo No se ha agregado la ruta de destino
		    echo.
		    pause
		    goto copias_info
		)
	    if exist "!archivo_destino!\." (
	    	set archivo_destino=!archivo_destino:"=!
			color 03
		) else (
            color 0c & echo.& echo La ruta de destino no es valida o no existe la carpeta.& echo.& pause
            goto copias_info
		)
	)
	set "archivo_destino=!archivo_destino:"=!"
    set /a contador_archivos+=1

    set "archivo_origen[!contador_archivos!]=!archivo_origen!"
    set "archivo_destino[!contador_archivos!]=!archivo_destino!"
    set archivo_origen=
    set archivo_destino=
    goto inicio_archivos
)
