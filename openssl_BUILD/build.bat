REM %~1 is the OpenSSL directory
REM %~2 is the build\$(Platform) (output) dir
REM %~3 is the configuration for OpenSSL
REM %~4 is the build configuration
REM %~5 is the $(OutDir)

cd %~1

nmake clean
perl Configure %~3
nmake

copy /Y "%~1\libssl.lib" "%~5\libssl.lib"
copy /Y "%~1\libcrypto.lib" "%~5\libcrypto.lib"

if "%~4"=="Debug" (
	copy /Y "%~1\*.dll" "%~2\DebugShared"
	copy /Y "%~1\libssl.lib" "%~2\DebugShared\libssl.lib"
	copy /Y "%~1\libcrypto.lib" "%~2\DebugShared\libcrypto.lib"

	copy /Y "%~1\libssl_static.lib" "%~2\DebugStatic\libssl.lib"
	copy /Y "%~1\libcrypto_static.lib" "%~2\DebugStatic\libcrypto.lib"
)

if "%~4"=="Release" (
	copy /Y "%~1\*.dll" "%~2\ReleaseShared"
	copy /Y "%~1\libssl.lib" "%~2\ReleaseShared\libssl.lib"
	copy /Y "%~1\libcrypto.lib" "%~2\ReleaseShared\libcrypto.lib"

	copy /Y "%~1\libssl_static.lib" "%~2\ReleaseStatic\libssl.lib"
	copy /Y "%~1\libcrypto_static.lib" "%~2\ReleaseStatic\libcrypto.lib"
)

if "%~4"=="Debug-RuntimeDependency" (
	copy /Y "%~1\*.dll" "%~2\DebugShared-RuntimeDependency"
	copy /Y "%~1\libssl.lib" "%~2\DebugShared-RuntimeDependency\libssl.lib"
	copy /Y "%~1\libcrypto.lib" "%~2\DebugShared-RuntimeDependency\libcrypto.lib"

	copy /Y "%~1\libssl_static.lib" "%~2\DebugStatic-RuntimeDependency\libssl.lib"
	copy /Y "%~1\libcrypto_static.lib" "%~2\DebugStatic-RuntimeDependency\libcrypto.lib"
)

if "%~4"=="Release-RuntimeDependency" (
	copy /Y "%~1\*.dll" "%~2\ReleaseShared-RuntimeDependency"
	copy /Y "%~1\libssl.lib" "%~2\ReleaseShared-RuntimeDependency\libssl.lib"
	copy /Y "%~1\libcrypto.lib" "%~2\ReleaseShared-RuntimeDependency\libcrypto.lib"

	copy /Y "%~1\libssl_static.lib" "%~2\ReleaseStatic-RuntimeDependency\libssl.lib"
	copy /Y "%~1\libcrypto_static.lib" "%~2\ReleaseStatic-RuntimeDependency\libcrypto.lib"
)


REM for %%a in ("DebugShared" "DebugShared-RuntimeDependency" "ReleaseShared" "ReleaseShared-RuntimeDependency") do ( 
REM    copy /Y "%~1\*.dll" "%~2\%%~a"
REM    copy /Y "%~1\libssl.lib" "%~2\%%~a\libssl.lib"
REM    copy /Y "%~1\libcrypto.lib" "%~2\%%~a\libcrypto.lib"
REM )

REM for %%a in ("DebugStatic" "DebugStatic-RuntimeDependency" "ReleaseStatic" "ReleaseStatic-RuntimeDependency") do ( 
REM    copy /Y "%~1\libssl_static.lib" "%~2\%%~a\libssl.lib"
REM    copy /Y "%~1\libcrypto_static.lib" "%~2\%%~a\libcrypto.lib"
REM )