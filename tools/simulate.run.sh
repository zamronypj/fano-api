#------------------------------------------------------------
# Fano Web Framework Skeleton Application (https://fano.juhara.id)
#
# @link      https://github.com/zamronypj/fano-app
# @copyright Copyright (c) 2018 Zamrony P. Juhara
# @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
#-------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to simulate run CGI app in shell for Linux
#------------------------------------------------------

CURRDIR=$PWD

# change current working dir, to simulate how cgi
# app executed by web server
cd app/public

if [ -z "$REQUEST_METHOD" ]; then
    export REQUEST_METHOD="GET"
fi

if [ -z "$REQUEST_URI" ]; then
    export REQUEST_URI="/"
fi

./app.cgi

cd $CURRDIR
