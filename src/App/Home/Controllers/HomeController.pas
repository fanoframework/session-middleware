(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit HomeController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano,
    WithSessionController;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /home
     *
     * See Routes/Home/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    THomeController = class(TWithSessionController)
    private
        fIntroducedView : IView;
        fUnintroducedView : IView;
    public
        constructor create(
            const sessMgr : IReadOnlySessionManager;
            const aIntroducedView : IView;
            const aUnintroducedView : IView
        );
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

    constructor THomeController.create(
        const sessMgr : IReadOnlySessionManager;
        const aIntroducedView : IView;
        const aUnintroducedView : IView
    );
    begin
        inherited create(sessMgr);
        fIntroducedView := aIntroducedView;
        fUnintroducedView := aUnintroducedView;
    end;

    function THomeController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var sess : ISession;
        params : IViewParameters;
    begin
        sess := fSessionMgr[request];
        params := TViewParameters.create();

        if sess.has('username') then
        begin
            params['username'] := sess['username'];
            result := fIntroducedView.render(params, response);
        end else
        begin
            result := fUnintroducedView.render(params, response);
        end;
    end;

end.
