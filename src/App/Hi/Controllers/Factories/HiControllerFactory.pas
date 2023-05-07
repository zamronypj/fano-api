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
    begin
        result := THiController.create(container.get('logger') as ILogger);
    end;

end.
