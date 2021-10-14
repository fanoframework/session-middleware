(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit ProfileView;

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
    TProfileView = class(TCoreView)
    protected
        function getTemplatePath() : string; override;
    end;

implementation

    function TProfileView.getTemplatePath() : string;
    begin
        result := 'resources/Templates/profile.html';
    end;


end.