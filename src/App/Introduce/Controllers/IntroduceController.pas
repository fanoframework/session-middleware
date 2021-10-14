(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit IntroduceController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano,
    WithSessionController;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /introduce
     *
     * See Routes/Introduce/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TIntroduceController = class(TWithSessionController)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    function TIntroduceController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var sess : ISession;
    begin
        sess := fSessionMgr[request];
        sess['username'] := request.getParam('name');
        result := TRedirectResponse.create(response.headers(), '/');
    end;

end.
