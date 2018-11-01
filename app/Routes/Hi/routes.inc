(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fano.juhara.id)
 *
 * @link      https://github.com/zamronypj/fano-app
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/zamronypj/fano-app/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)
router.get('/', container.get('helloController') as IRouteHandler);
router.post('/hello/{name}', container.get('helloController') as IRouteHandler);
router.get('/hello/{name}', container.get('helloController') as IRouteHandler);
router.get('/hello/{name}/json', container.get('helloJsonController') as IRouteHandler);
