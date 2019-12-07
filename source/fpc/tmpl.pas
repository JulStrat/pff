program tmpl;
{$mode delphi}

uses
  pff;

var
  fs: FATFS;
  fr: FRESULT;

begin
  fr := pf_mount(@fs);
end.
