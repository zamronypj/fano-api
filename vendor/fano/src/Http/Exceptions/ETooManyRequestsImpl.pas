{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 - 2022 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit ETooManyRequestsImpl;

interface

{$MODE OBJFPC}

uses

    EHttpExceptionImpl;

type

    (*!------------------------------------------------
     * Exception that is raised when handle too many requests.
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    ETooManyRequests = class(EHttpException)
    public
        constructor create(
            const aErrorMsg : string;
            const respHeaders : string = ''
        );
        constructor createFmt(
            const aErrorMsg : string;
            const args: array of const;
            const respHeaders : string = ''
        );
    end;

implementation

    constructor ETooManyRequests.create(
        const aErrorMsg : string;
        const respHeaders : string = ''
    );
    begin
        inherited create(429, 'Too Many Requests', aErrorMsg, respHeaders);
    end;

    constructor ETooManyRequests.createFmt(
        const aErrorMsg : string;
        const args: array of const;
        const respHeaders : string = ''
    );
    begin
        inherited createFmt(429, 'Too Many Requests', aErrorMsg, args, respHeaders);
    end;

end.
