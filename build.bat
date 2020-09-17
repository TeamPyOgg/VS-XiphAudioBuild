REM %~1 is the OpenSSL directory
REM %~2 is the build\$(Platform) (output) dir
REM %~3 is the configuration for OpenSSL

cd %~1

nmake clean
perl Configure %~3
nmake

for %%a in ("DebugShared" "DebugShared-RuntimeDependency" "ReleaseShared" "ReleaseShared-RuntimeDependency") do ( 
   copy /Y "%~1\*.dll" "%~2\%%~a"
   copy /Y "%~1\libssl.lib" "%~2\%%~a"
   copy /Y "%~1\libcrypto.lib" "%~2\%%~a"
)

for %%a in ("DebugStatic" "DebugStatic-RuntimeDependency" "ReleaseStatic" "ReleaseStatic-RuntimeDependency") do ( 
   copy /Y "%~1\libssl_static.lib" "%~2\%%~a\libssl.lib"
   copy /Y "%~1\libcrypto_static.lib" "%~2\%%~a\libcrypto.lib"
)