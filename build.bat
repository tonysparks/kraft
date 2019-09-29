@echo off
set LITAC_PATH=C:\Users\antho\eclipse-workspace\litac\lib
set BUILD_CMD=clang.exe -m32 -o %%output%% %%input%% -D_CRT_SECURE_NO_WARNINGS -I../include -L../lib -lMSVCRT -llibcmt -lopengl32 -lgdi32 -lwinmm -lkernel32 -luser32 -lshell32 -lglfw3 -lcglm.lib
litac.exe -run -lib "%LITAC_PATH%" -buildCmd "%BUILD_CMD%" -outputDir "./bin" -output "kraft" "./src/main.lita"