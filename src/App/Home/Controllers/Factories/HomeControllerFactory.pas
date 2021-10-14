(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit HomeControllerFactory;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano,
    BaseControllerFactory;

type

    (*!-----------------------------------------------
     * Factory for controller THomeController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    THomeControllerFactory = class(TBaseControllerFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    HomeController,
    IntroducedView,
    UnintroducedView;

    function THomeControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var tplParser : ITemplateParser;
        aViewPartial : IViewPartial;
    begin
        //build your controller instance here.
        //container will gives you access to all registered services

        tplParser := buildTemplateParser();
        aViewPartial := buildViewPartial();
        result := THomeController.create(
            container['session.manager'] as IReadOnlySessionManager,
            TIntroducedView.create(tplParser, aViewPartial),
            TUnintroducedView.create(tplParser,aViewPartial)
        );
    end;
end.
