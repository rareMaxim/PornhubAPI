unit PornhubApi.Types.Response;

interface

uses
  CloudAPI.Json.Converters,
  System.Json.Serializers,
  System.Json.Converters,
  System.Generics.Collections;

type
  TphVideoListItem = class
  private
    [JsonName('id')]
    FID: Int64;
    [JsonName('vkey')]
    Fvkey: string;
    [JsonName('title')]
    FTitle: string;
    [JsonName('duration')]
    FDuration: Integer;
    [JsonName('rating')]
    FRating: Byte;
    [JsonName('viewCount')]
    FViewCount: Integer;
    [JsonConverter(TJsonUnixTimeConverter)]
    [JsonName('approvedOn')]
    FApprovedOn: TDateTime;
    [JsonName('urlThumbnail')]
    FUrlThumbnail: string;
    [JsonName('urlThumbnail16x9')]
    FUrlThumbnail16x9: string;
    [JsonName('hd')]
    FHD: Boolean;
    [JsonName('webm')]
    FWebm: string;
    [JsonName('premium')]
    FPremium: Boolean;
    [JsonName('vr')]
    FVR: Boolean;
    [JsonName('canSeeVideo')]
    FCanSeeVideo: Boolean;
    [JsonName('isPrivate')]
    FIsPrivate: Boolean;
    [JsonName('isVerified')]
    FIsVerified: Boolean;
    [JsonName('isPaidVideo')]
    FIsPaidVideo: Boolean;
    [JsonName('isAvailable')]
    FIsAvailable: Boolean;
    [JsonName('commentsCount')]
    FCommentsCount: Integer;
  public
    property ID: Int64 read FID write FID;
    property vkey: string read Fvkey write Fvkey;
    property Title: string read FTitle write FTitle;
    property Duration: Integer read FDuration write FDuration;
    property Rating: Byte read FRating write FRating;
    property ViewCount: Integer read FViewCount write FViewCount;
    property ApprovedOn: TDateTime read FApprovedOn write FApprovedOn;
    property UrlThumbnail: string read FUrlThumbnail write FUrlThumbnail;
    property UrlThumbnail16x9: string read FUrlThumbnail16x9 write FUrlThumbnail16x9;
    property HD: Boolean read FHD write FHD;
    property Webm: string read FWebm write FWebm;
    property Premium: Boolean read FPremium write FPremium;
    property VR: Boolean read FVR write FVR;
    property CanSeeVideo: Boolean read FCanSeeVideo write FCanSeeVideo;
    property IsPrivate: Boolean read FIsPrivate write FIsPrivate;
    property IsVerified: Boolean read FIsVerified write FIsVerified;
    property IsPaidVideo: Boolean read FIsPaidVideo write FIsPaidVideo;
    property IsAvailable: Boolean read FIsAvailable write FIsAvailable;
    property CommentsCount: Integer read FCommentsCount write FCommentsCount;
  end;

  TphList = class
  private
    [JsonName('count')]
    FCount: Integer;
  public
    property Count: Integer read FCount write FCount;
  end;

  TJsonVideoItemListConverter = class(TJsonListConverter<TphVideoListItem>);

  TphVideoList = class(TphList)
  private
    [JsonConverter(TJsonVideoItemListConverter)]
    [JsonName('videos')]
    FVideos: TObjectList<TphVideoListItem>;
  public
    constructor Create;
    destructor Destroy; override;
    property Videos: TObjectList<TphVideoListItem> read FVideos write FVideos;
  end;

implementation

{ TphVideoList }

constructor TphVideoList.Create;
begin
  inherited Create;
  FVideos := TObjectList<TphVideoListItem>.Create;
end;

destructor TphVideoList.Destroy;
begin
  FVideos.Free;
  inherited Destroy;
end;

end.
