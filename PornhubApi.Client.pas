unit PornhubApi.Client;

interface

uses
  CloudAPI.Client.Sync,
  PornhubApi.Types.Request,
  PornhubApi.Types.Response;

type
  TPornhubClient = class
  private
    FCloud: TCloudApiClient;
    FAppKey: string;
    FUUID: string;
  protected
    function InternalExecute<TArgument: record; TResult>(AArgument: TArgument): TResult;
  public
    function getVideos(GetVideosArgument: TgetVideosArgument): TphVideoList;
    constructor Create;
    destructor Destroy; override;
    property AppKey: string read FAppKey write FAppKey;
    property UUID: string read FUUID write FUUID;
  end;

implementation

uses
  CloudAPI.Enum,
  CloudAPI.Parameter,
  CloudAPI.Request,
  CloudAPI.Response,
  CloudAPI.RequestArgument;

constructor TPornhubClient.Create;
begin
// https://api.pornhub.com/android/getVideos?appKey=&uuid=&order=mr&filter=&limit=16&offset=0
  inherited Create;
  FAppKey := '72d2512a43364263e9d94f0f73';
  FUUID := 'ff4e06222b6a7eb6';
  FCloud := TCloudApiClient.Create;
  FCloud.BaseUrl := 'https://api.pornhub.com/android';
  FCloud.DefaultParams.Add(TcaParameter.Create('appKey', AppKey, '', TcaParameterType.QueryString, True));
  FCloud.DefaultParams.Add(TcaParameter.Create('uuid', FUUID, '', TcaParameterType.QueryString, True));
end;

destructor TPornhubClient.Destroy;
begin
  FCloud.Free;
  inherited Destroy;
end;

function TPornhubClient.getVideos(GetVideosArgument: TgetVideosArgument): TphVideoList;
begin
  Result := InternalExecute<TgetVideosArgument, TphVideoList>(GetVideosArgument);
end;

function TPornhubClient.InternalExecute<TArgument, TResult>(AArgument: TArgument): TResult;
var
  LReq: IcaRequest;
begin
  LReq := TcaRequestArgument.ObjToRequest<TArgument>(AArgument);
  Result := FCloud.Execute<TResult>(LReq).Data;
end;

end.
