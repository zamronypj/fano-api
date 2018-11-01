REM------------------------------------------------------------
REM Fano Web Framework Skeleton Application (https://fano.juhara.id)
REM
REM @link      https://github.com/zamronypj/fano-app
REM @copyright Copyright (c) 2018 Zamrony P. Juhara
REM @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
REM-------------------------------------------------------------
REM!/bin/bash

REM------------------------------------------------------
REM Scripts to delete all compiled unit files
REM------------------------------------------------------

FOR /R bin\unit %i IN (*) DO IF NOT %i == README.md del %i
