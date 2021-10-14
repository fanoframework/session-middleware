(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit UnintroduceController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano,
    WithSessionController;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /unintroduce
     *
     * See Routes/Unintroduce/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TUnintroduceController = class(TWithSessionController)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    function TUnintroduceController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var sess : ISession;
    begin
        sess := fSessionMgr[request];
        sess.delete('username');
        result := TRedirectResponse.create(response.headers(), '/');
    end;

end.
