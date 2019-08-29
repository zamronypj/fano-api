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
  register middleware list for each routes that
  does nothing,
  need to be use factory so each route will have
  different middleware list
------------------------------------------------}
container.factory('routeMiddlewares', TNullMiddlewareCollectionAwareFactory.create());

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
