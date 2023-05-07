unit HlpBlake2BConfig;

{$I ..\..\Include\HashLib.inc}

interface

uses
  HlpIBlake2BConfig,
  HlpHashSize,
  HlpHashLibTypes;

resourcestring
  SInvalidHashSize =
    'BLAKE2B HashSize must be restricted to one of the following [1 .. 64], "%d"';
  SInvalidKeyLength = '"Key" Length Must Not Be Greater Than 64, "%d"';
  SInvalidPersonalisationLength =
    '"Personalisation" Length Must Be Equal To 16, "%d"';
  SInvalidSaltLength = '"Salt" Length Must Be Equal To 16, "%d"';

type

  TBlake2BConfig = class sealed(TInterfacedObject, IBlake2BConfig)

  strict private

  var

    FHashSize: Int32;
    FPersonalisation, FSalt, FKey: THashLibByteArray;

    class function GetDefaultConfig: IBlake2BConfig; static;

    procedure ValidateHashSize(AHashSize: Int32); inline;
    procedure ValidateKeyLength(const AKey: THashLibByteArray); inline;
    procedure ValidatePersonalisationLength(const APersonalisation
      : THashLibByteArray); inline;
    procedure ValidateSaltLength(const ASalt: THashLibByteArray); inline;

    function GetPersonalisation: THashLibByteArray; inline;
    procedure SetPersonalisation(const AValue: THashLibByteArray); inline;

    function GetSalt: THashLibByteArray; inline;
    procedure SetSalt(const AValue: THashLibByteArray); inline;

    function GetKey: THashLibByteArray; inline;
    procedure SetKey(const AValue: THashLibByteArray); inline;

    function GetHashSize: Int32; inline;
    procedure SetHashSize(AValue: Int32); inline;

  public
    constructor Create(AHashSize: THashSize = THashSize.hsHashSize512);
      overload;
    constructor Create(AHashSize: Int32); overload;
    property Personalisation: THashLibByteArray read GetPersonalisation
      write SetPersonalisation;
    property Salt: THashLibByteArray read GetSalt write SetSalt;
    property Key: THashLibByteArray read GetKey write SetKey;
    property HashSize: Int32 read GetHashSize write SetHashSize;

    class property DefaultConfig: IBlake2BConfig read GetDefaultConfig;

    function Clone(): IBlake2BConfig;

  end;

implementation

{ TBlake2BConfig }

class function TBlake2BConfig.GetDefaultConfig: IBlake2BConfig;
begin
  Result := TBlake2BConfig.Create();
end;

procedure TBlake2BConfig.ValidateHashSize(AHashSize: Int32);
begin
  if not((AHashSize) in [1 .. 64]) or (((AHashSize * 8) and 7) <> 0) then
  begin
    raise EArgumentHashLibException.CreateResFmt(@SInvalidHashSize,
      [AHashSize]);
  end;
end;

procedure TBlake2BConfig.ValidateKeyLength(const AKey: THashLibByteArray);
var
  KeyLength: Int32;
begin
  if (AKey <> Nil) then
  begin
    KeyLength := System.Length(AKey);
    if (KeyLength > 64) then
    begin
      raise EArgumentOutOfRangeHashLibException.CreateResFmt(@SInvalidKeyLength,
        [KeyLength]);
    end;
  end;
end;

procedure TBlake2BConfig.ValidatePersonalisationLength(const APersonalisation
  : THashLibByteArray);
var
  PersonalisationLength: Int32;
begin
  if (APersonalisation <> Nil) then
  begin
    PersonalisationLength := System.Length(APersonalisation);
    if (PersonalisationLength <> 16) then
    begin
      raise EArgumentOutOfRangeHashLibException.CreateResFmt
        (@SInvalidPersonalisationLength, [PersonalisationLength]);
    end;
  end;
end;

procedure TBlake2BConfig.ValidateSaltLength(const ASalt: THashLibByteArray);
var
  SaltLength: Int32;
begin
  if (ASalt <> Nil) then
  begin
    SaltLength := System.Length(ASalt);
    if (SaltLength <> 16) then
    begin
      raise EArgumentOutOfRangeHashLibException.CreateResFmt
        (@SInvalidSaltLength, [SaltLength]);
    end;
  end;
end;

function TBlake2BConfig.GetHashSize: Int32;
begin
  Result := FHashSize;
end;

function TBlake2BConfig.GetKey: THashLibByteArray;
begin
  Result := FKey;
end;

function TBlake2BConfig.GetPersonalisation: THashLibByteArray;
begin
  Result := FPersonalisation;
end;

function TBlake2BConfig.GetSalt: THashLibByteArray;
begin
  Result := FSalt;
end;

procedure TBlake2BConfig.SetHashSize(AValue: Int32);
begin
  ValidateHashSize(AValue);
  FHashSize := AValue;
end;

procedure TBlake2BConfig.SetKey(const AValue: THashLibByteArray);
begin
  ValidateKeyLength(AValue);
  FKey := AValue;
end;

procedure TBlake2BConfig.SetPersonalisation(const AValue: THashLibByteArray);
begin
  ValidatePersonalisationLength(AValue);
  FPersonalisation := AValue;
end;

procedure TBlake2BConfig.SetSalt(const AValue: THashLibByteArray);
begin
  ValidateSaltLength(AValue);
  FSalt := AValue;
end;

constructor TBlake2BConfig.Create(AHashSize: THashSize);
var
  LHashSize: Int32;
begin
  Inherited Create();
  LHashSize := Int32(AHashSize);
  ValidateHashSize(LHashSize);
  FHashSize := LHashSize;
end;

constructor TBlake2BConfig.Create(AHashSize: Int32);
begin
  Inherited Create();
  ValidateHashSize(AHashSize);
  FHashSize := AHashSize;
end;

function TBlake2BConfig.Clone(): IBlake2BConfig;
begin
  Result := TBlake2BConfig.Create(FHashSize);
  Result.Key := System.Copy(FKey);
  Result.Personalisation := System.Copy(FPersonalisation);
  Result.Salt := System.Copy(FSalt);
end;

end.
