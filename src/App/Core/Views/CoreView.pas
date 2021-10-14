(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit CoreView;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * View instance
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TCoreView = class abstract (TView)
    protected
        fViewPartial : IViewPartial;

        function getTemplatePath() : string; virtual; abstract;
    public
        constructor create(
            const tplParser : ITemplateParser;
            const aViewPartial : IViewPartial
        );

        (*!------------------------------------------------
         * render view
         *------------------------------------------------
         * @param viewParams view parameters
         * @param response response instance
         * @return response
         *-----------------------------------------------*)
        function render(
            const viewParams : IViewParameters;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

    constructor TCoreView.create(
        const tplParser : ITemplateParser;
        const aViewPartial : IViewPartial
    );
    begin
        inherited create(tplParser, readFile('resources/Templates/base.html'));
        fViewPartial := aViewPartial;
    end;

    (*!------------------------------------------------
     * render view
     *------------------------------------------------
     * @param viewParams view parameters
     * @param response response instance
     * @return response
     *-----------------------------------------------*)
    function TCoreView.render(
        const viewParams : IViewParameters;
        const response : IResponse
    ) : IResponse;
    begin
        viewParams['content'] := fViewPartial.partial(getTemplatePath(), viewParams);
        result := inherited render(viewParams, response);
    end;

end.