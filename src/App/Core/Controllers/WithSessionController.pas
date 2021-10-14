(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit WithSessionController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * base controller that has access to session
     *
     * See Routes/Introduce/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TWithSessionController = class(TAbstractController)
    protected
        fSessionMgr : IReadOnlySessionManager;
    public
        constructor create(const sessMgr : IReadOnlySessionManager);
    end;

implementation

    constructor TWithSessionController.create(const sessMgr : IReadOnlySessionManager);
    begin
        fSessionMgr := sessMgr;
    end;

end.
