REM------------------------------------------------------------
REM Fano Web Framework Skeleton Application (https://fano.juhara.id)
REM
REM @link      https://github.com/zamronypj/fano-app
REM @copyright Copyright (c) 2018 Zamrony P. Juhara
REM @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
REM-------------------------------------------------------------

REM------------------------------------------------------
REM Scripts to simulate run CGI app in shell for Windows
REM------------------------------------------------------

SET %CURRDIR%=%cd%

REM change current working dir, to simulate how cgi
REM app executed by web server
cd app\public

IF NOT DEFINED REQUEST_METHOD (SET REQUEST_METHOD="GET")
IF NOT DEFINED REQUEST_URI (SET REQUEST_URI="/")

app.cgi

cd %CURRDIR%
