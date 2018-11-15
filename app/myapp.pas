(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-api
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-api/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)
unit myapp;

interface

uses

    fano;

type

    TMyApp = class(TFanoWebApplication)
    protected
        procedure buildDependencies(const container : IDependencyContainer); override;
        procedure buildRoutes(const container : IDependencyContainer); override;
        function initDispatcher(const container : IDependencyContainer) : IDispatcher; override;
    end;

implementation

uses

    sysutils,

    {*! -------------------------------
        controllers factory
    ----------------------------------- *}
    HiControllerFactory;


    procedure TMyApp.buildDependencies(const container : IDependencyContainer);
    begin
        {$INCLUDE Dependencies/dependencies.inc}
    end;

    procedure TMyApp.buildRoutes(const container : IDependencyContainer);
    var router : IRouter;
    begin
        router := container.get('router') as IRouter;
        try
            {$INCLUDE Routes/Hi/routes.inc}
        finally
            router := nil;
        end;
    end;

    function TMyApp.initDispatcher(const container : IDependencyContainer) : IDispatcher;
    begin
        result := container.get('dispatcher') as IDispatcher;
    end;
end.
