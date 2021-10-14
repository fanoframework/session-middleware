(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ProfileControllerFactory;

interface

{$MODE OBJFPC}
{$H+}

uses
    fano,
    BaseControllerFactory;

type

    (*!-----------------------------------------------
     * Factory for controller TProfileController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TProfileControllerFactory = class(TBaseControllerFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,
    ProfileController,
    ProfileView;

    function TProfileControllerFactory.build(const container : IDependencyContainer) : IDependency;
    begin
        //build your controller instance here.
        //container will gives you access to all registered services

        result := TProfileController.create(
            container['session.manager'] as IReadOnlySessionManager,
            TProfileView.create(buildTemplateParser(), buildViewPartial())
        );
    end;
end.
