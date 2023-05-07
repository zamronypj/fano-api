{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 - 2022 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit BaseErrorHandlerImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    sysutils,
    ErrorHandlerIntf,
    EnvironmentEnumeratorIntf,
    InjectableObjectImpl;

type

    (*!---------------------------------------------------
     * base custom error handler that user must inherit and
     * provide template to be displayed
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *---------------------------------------------------*)
    TBaseErrorHandler = class abstract (TInjectableObject, IErrorHandler)
    protected
        procedure writeHeaders(const exc : Exception);
    public
        (*!---------------------------------------------------
         * handle exception
         *----------------------------------------------------
         * @param exc exception that is to be handled
         * @param status HTTP error status, default is HTTP error 500
         * @param msg HTTP error message
         *---------------------------------------------------*)
        function handleError(
            const env : ICGIEnvironmentEnumerator;
            const exc : Exception;
            const status : integer = 500;
            const msg : string  = 'Internal Server Error'
        ) : IErrorHandler; virtual; abstract;
    end;

implementation

uses

    EHttpExceptionImpl;

    procedure TBaseErrorHandler.writeHeaders(const exc : Exception);
    var httpExc : EHttpException;
    begin
        if (exc is EHttpException)then
        begin
            httpExc := EHttpException(exc);
            if (httpExc.headers <> '') then
            begin
                //we use write() because we assume headers
                //contains line ending
                write(httpExc.headers);
            end;
        end;
    end;

end.
