(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)

{-----------------------------------------------
  register application configuration
------------------------------------------------}
container.add(
    'config',
    TJsonFileConfigFactory.create(
        extractFileDir(getCurrentDir()) + '/config/config.json'
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
  register application simple router instance
  which does not support middleware
------------------------------------------------}
container.add('router', TSimpleRouteCollectionFactory.create());

{-----------------------------------------------
  setup application request dispatcher
------------------------------------------------}
container.add(
    'dispatcher',
    TSimpleDispatcherFactory.create(
        container.get('router') as IRouteMatcher
    )
);
