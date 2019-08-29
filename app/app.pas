(*!------------------------------------------------------------
 * Fano Web Framework Skeleton Application (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano-api
 * @copyright Copyright (c) 2018 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano-api/blob/master/LICENSE (GPL 2.0)
 *------------------------------------------------------------- *)
program app;

uses

    fano,
    myapp;

var
    appInstance : IWebApplication;

begin
    (*!-----------------------------------------------
     * Bootstrap application
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *------------------------------------------------*)
    appInstance := TMyApp.create(
        nil,
        nil,
        TAjaxErrorHandler.create()
    );
    appInstance.run();
end.
