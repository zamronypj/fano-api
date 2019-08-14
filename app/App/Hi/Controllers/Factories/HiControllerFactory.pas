unit HiControllerFactory;

interface

uses

    fano;

type

    THiControllerFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    HiController;

    function THiControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        try
            result := THiController.create(
                routeMiddlewares,
                container.get('logger') as ILogger
            );
        finally
            routeMiddlewares := nil;
        end;
    end;

end.
