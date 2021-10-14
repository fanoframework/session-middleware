(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit BaseControllerFactory;

interface

{$MODE OBJFPC}
{$H+}

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller THomeController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TBaseControllerFactory = class(TFactory, IDependencyFactory)
    protected
        function buildTemplateParser() : ITemplateParser;
        function buildViewPartial() : IViewPartial;
    public
    end;

implementation

uses

    sysutils;

    function TBaseControllerFactory.buildTemplateParser() : ITemplateParser;
    begin
        result := TTemplateParser.create(TRegex.create(), '{{', '}}');
    end;

    function TBaseControllerFactory.buildViewPartial() : IViewPartial;
    var fReader : IFileReader;
    begin
        fReader :=TStringFileReader.create();
        result := TViewPartial.create(buildTemplateParser(), fReader);
    end;

end.
