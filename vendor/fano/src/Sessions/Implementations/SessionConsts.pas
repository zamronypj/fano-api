{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 - 2022 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit SessionConsts;

interface

{$MODE OBJFPC}
{$H+}

const

    FANO_COOKIE_NAME = 'FANOSESSID';

    //default name for db session table and columns
    DEFAULT_SESS_TABLE_NAME = 'fano_sessions';
    DEFAULT_SESS_ID_COLUMN = 'id';
    DEFAULT_DATA_COLUMN = 'data';
    DEFAULT_EXPIRED_AT_COLUMN = 'expired_at';

    DEFAULT_SESS_DIR = '/tmp/';
    DEFAULT_SESS_PREFIX = '';

resourcestring

    rsSessionExpired = 'Session is expired. Id : %s';
    rsSessionInvalid = 'Session is invalid';
    rsEmptyCookieName = 'Cookie name cannot be empty';

implementation

end.
