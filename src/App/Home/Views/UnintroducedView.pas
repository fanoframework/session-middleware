(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit UnintroducedView;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano,
    CoreView;

type

    (*!-----------------------------------------------
     * View instance
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TUnintroducedView = class(TCoreView)
    protected
        function getTemplatePath() : string; override;

    end;

implementation

    function TUnintroducedView.getTemplatePath() : string;
    begin
        result := 'resources/Templates/unintroduced.html';
    end;

end.