(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-api
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-api/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)

{-----------------------------------------------
  register application configuration
------------------------------------------------}
container.add(
    'config',
    TJsonFileConfigFactory.create(
        extractFileDir(getCurrentDir()) + '/app/config/config.json'
    )
);

{-----------------------------------------------
  register application file logger
------------------------------------------------}
container.add('logger',
    TFileLoggerFactory.create(
        (container.get('config') as IAppConfiguration).getString('logFile')
    )
);

{-----------------------------------------------
  or to disable logging just use TNullLogger
------------------------------------------------}
//container.add('logger', TNullLoggerFactory.create());
