(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-api
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-api/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)
unit bootstrap;

interface

uses

    fano;

type

    TMyAppServiceProvider = class(TBasicAppServiceProvider)
    protected
        function buildErrorHandler(
            const ctnr : IDependencyContainer;
            const config : IAppConfiguration
        ) : IErrorHandler; override;
    public
        procedure register(const container : IDependencyContainer); override;
    end;

    TMyAppRoutes = class(TRouteBuilder)
    public
        procedure buildRoutes(
            const container : IDependencyContainer;
            const router : IRouter
        ); override;
    end;

implementation

uses

    sysutils,

    {*! -------------------------------
        controllers factory
    ----------------------------------- *}
    HiControllerFactory;

    function TMyAppServiceProvider.buildErrorHandler(
        const ctnr : IDependencyContainer;
        const config : IAppConfiguration
    ) : IErrorHandler;
    begin
        result := TAjaxErrorHandler.create();
    end;

    procedure TMyAppServiceProvider.register(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TMyAppRoutes.buildRoutes(
        const container : IDependencyContainer;
        const router : IRouter
    );
    begin
        {$INCLUDE Routes/Hi/routes.inc}
    end;
end.
