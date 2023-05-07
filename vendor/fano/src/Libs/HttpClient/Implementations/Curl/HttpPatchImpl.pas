{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 - 2022 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit HttpPatchImpl;

interface

{$MODE OBJFPC}
{$H+}

uses

    HttpMethodImpl,
    HttpDeleteClientIntf,
    ResponseStreamIntf,
    SerializeableIntf;

type

    (*!------------------------------------------------
     * class that send HTTP PATCH to server
     *
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-----------------------------------------------*)
    THttpPatch = class(THttpMethod, IHttpPatchClient)
    public

        (*!------------------------------------------------
         * send HTTP PATCH request
         *-----------------------------------------------
         * @param url url to send request
         * @param context object instance related to this message
         * @return response from server
         *-----------------------------------------------*)
        function patch(
            const url : string;
            const data : ISerializeable = nil
        ) : IResponseStream;

    end;

implementation

uses

    libcurl;

    (*!------------------------------------------------
     * send HTTP DELETE request
     *-----------------------------------------------
     * @param url url to send request
     * @param data data related to this request
     * @return current instance
     *-----------------------------------------------*)
    function THttpPatch.patch(
        const url : string;
        const data : ISerializeable = nil
    ) : IResponseStream;
    var params : string;
    begin
        raiseExceptionIfCurlNotInitialized();
        streamInst.reset();
        curl_easy_setopt(hCurl, CURLOPT_URL, [ pchar(url) ]);
        curl_easy_setopt(hCurl, CURLOPT_UPLOAD, [ 1 ]);
        curl_easy_setopt(hCurl, CURLOPT_CUSTOMREQUEST, [ pchar('PATCH') ]);
        params := '';
        if (data <> nil) then
        begin
           params := data.serialize();
        end;
        curl_easy_setopt(hCurl , CURLOPT_READDATA, [ pchar(params) ]);
        executeCurl(hCurl);
        result := streamInst;
    end;

end.
