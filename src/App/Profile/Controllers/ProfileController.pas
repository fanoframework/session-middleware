(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ProfileController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano,
    WithSessionController;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /hello
     *
     * See Routes/Hello/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TProfileController = class(TWithSessionController)
    private
        fView : IView;
    public
        constructor create(const sessMgr : IReadOnlySessionManager; const aView : IView);
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    constructor TProfileController.create(const sessMgr : IReadOnlySessionManager; const aView : IView);
    begin
        inherited create(sessMgr);
        fView := aView;
    end;

    function TProfileController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var sess : ISession;
        params : IViewParameters;
    begin
        sess := fSessionMgr[request];
        params := TViewParameters.create();
        params['username'] := sess['username'];
        result := fView.render(params, response);
    end;

end.
