{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 - 2022 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit JsonContentTypeMiddlewareImpl;

interface

{$MODE OBJFPC}

uses

    RequestIntf,
    ResponseIntf,
    MiddlewareIntf,
    RouteArgsReaderIntf,
    RequestHandlerIntf,
    InjectableObjectImpl;

type

    (*!------------------------------------------------
     * middleware class that make POST PUT request with
     * body of content type json available as request
     * parsed body
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    TJsonContentTypeMiddleware = class(TInjectableObject, IMiddleware)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader;
            const nextMdlwr : IRequestHandler
        ) : IResponse;
    end;

implementation

uses

    JsonRequestImpl;

    function TJsonContentTypeMiddleware.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader;
        const nextMdlwr : IRequestHandler
    ) : IResponse;
    var req : IRequest;
        isJsonRequest : boolean;
        method : string;
    begin
        method := request.method;
        isJsonRequest := ((method = 'POST') or (method = 'PUT') or
            (method = 'PATCH') or (method = 'DELETE')) and
            (request.env.contentType = 'application/json');

        if isJsonRequest then
        begin
            req := TJsonRequest.create(request);
        end else 
        begin
            req := request;
        end;

        result := nextMdlwr.handleRequest(req, response, args);    
    end;
end.
