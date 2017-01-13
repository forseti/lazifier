@echo off

if "%LAZIFIER_HOME%"=="" goto error
set JAVA_EXT_DIRS=%LAZIFIER_HOME%/lib

set USER_ARGUMENT=%1

set /a COUNT=0

:_loop
      if ""=="%0" goto _end
      set /a COUNT+=1
      shift
      goto _loop
:_end

java -Djava.ext.dirs=%JAVA_EXT_DIRS% -cp %LAZIFIER_HOME%/conf -Dcontext.location=lazifierContext.xml com.googlecode.lazifier.Main  %*

goto end

:error

echo "Please set LAZIFIER_HOME environment variable... ^^"

:end