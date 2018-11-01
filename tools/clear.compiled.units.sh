#------------------------------------------------------------
# Fano Web Framework Skeleton Application (https://fano.juhara.id)
#
# @link      https://github.com/zamronypj/fano-app
# @copyright Copyright (c) 2018 Zamrony P. Juhara
# @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
#-------------------------------------------------------------
#!/bin/bash

#------------------------------------------------------
# Scripts to delete all compiled unit files
#------------------------------------------------------

find bin/unit ! -name 'README.md' -type f -exec rm -f {} +
