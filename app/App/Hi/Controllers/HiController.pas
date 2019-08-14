(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-api
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-api/blob/master/LICENSE (GPL 3.0)
 *------------------------------------------------------------- *)
unit HiController;

interface

uses

    fano,
    fpjson;

type

    THiController = class(TRouteHandler, IDependency)
    private
        logger : ILogger;
    public
        constructor create(
            const aMiddlewares : IMiddlewareCollectionAware;
            const loggerInst : ILogger
        );
        destructor destroy(); override;
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    constructor THiController.create(
        const aMiddlewares : IMiddlewareCollectionAware;
        const loggerInst : ILogger
    );
    begin
        inherited create(aMiddlewares);
        logger := loggerInst;
    end;

    destructor THiController.destroy();
    begin
        inherited destroy();
        logger := nil;
    end;

    function THiController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var jsonObj : TJSONObject;
    begin
        jsonObj := TJSONObject.create();
        try
            jsonObj.add('Hello', 'Joko Widowo');
            result := TJsonResponse.create(response.headers(), jsonObj.asJson);
            logger.info('handle rest api request');
        finally
            jsonObj.free();
        end;
    end;

end.
