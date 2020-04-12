unit PornhubApi.Types.Request;

interface

uses
  CloudAPI.Attributes,
  CloudAPI.Enum,
  CloudAPI.Types;

type

  /// <summary>
  /// A simple method for testing your bot's auth token.
  /// Requires no parameters.
  /// Returns basic information about the bot in form of a User object.
  /// </summary>
  [caName('getVideos')]
  [caParameterType(TcaParameterType.QueryString)]
  TgetVideosArgument = record
  public
    [caName('order')]
    [caDefaultValueString('mr')]
    Order: string;
    [caName('filter')]
    [caDefaultValueString('')]
    Filter: string;
    [caName('limit')]
    [caDefaultValueInt64(16)]
    Limit: Int64;
    [caName('offset')]
    [caDefaultValueInt64(0)]
    Offset: Int64;
    class function Default: TgetVideosArgument; static;
  end;

implementation

{ TgetVideosArgument }

class function TgetVideosArgument.Default: TgetVideosArgument;
begin
  Result.Order := 'mr';
  Result.Filter := '';
  Result.Limit := 16;
  Result.Offset := 0;
end;

end.
