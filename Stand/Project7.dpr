program Project7;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  PornhubApi.Client,
  PornhubApi.Types.Request,
  System.SysUtils;

procedure Test;
var
  Hub: TPornhubClient;
begin
  Hub := TPornhubClient.Create;
  try
    Hub.getVideos(TgetVideosArgument.Default);
  finally
    Hub.Free;
  end;
end;

begin
  try
    { TODO -oUser -cConsole Main : Insert code here }
    Test;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;

end.
