library gebe_discord;


uses
  WinApi.Windows,
  WinApi.WinSock2,
  WinApi.Messages,
  System.SysUtils,
  System.Classes;

{$R *.res}


type
  TAnsiCharEx16 = array [0..16] of AnsiChar;


type
 PItemTuningEx = ^TItemTuningEx;
  TItemTuningEx = packed record
    se_item_idx : integer;
    se_item_val : integer;
    item_date : integer;
    char_id : integer;
    mt_item_gr : integer;
    mt_index_0 : integer;
    mt_index_1 : integer;
    mt_index_2 : integer;
    mt_value_0 : integer;
    mt_value_1 : integer;
    mt_value_2 : integer;
    item_id : integer;
  end;

type
  TPetBreedDataSlot = packed record
    item_food : integer;
    item_io : integer;
  end;

type
TPetBreedData = packed record
  p_active : integer;
  p_pet_id : integer;
  p_pet_io : integer;
  p_pet_ioo : integer;
  p_itemfood : array [0..4] of TPetBreedDataSlot;
  p_time : Cardinal;
  p_pet_sn : UInt64;
end;
TPetBreedDataArray = packed array[0..(High(Integer) div SizeOf(TPetBreedData))-1] of TPetBreedData;
PPetBreedData = ^TPetBreedDataArray;

type
TSlotCashItemType = packed record
  item_it : integer;
  item_io : integer;
  item_ioo : integer;
end;
TSlotCashItemTypeArray = packed array[0..(High(Integer) div SizeOf(TSlotCashItemType))-1] of TSlotCashItemType;
PSlotCashItemType = ^TSlotCashItemTypeArray;

type
TStoneCharData = packed record
  st_grub : integer;
  st_count : integer;
  st_value : array [0..1] of array [0..11] of integer;
  st_reset : array [0..1] of integer;
end;
TStoneCharDataArray = packed array[0..(High(Integer) div SizeOf(TStoneCharData))-1] of TStoneCharData;
PStoneCharData = ^TStoneCharDataArray;

type
TCharExtSocket = packed record
  socket : integer;
  socket_tmp : integer;
  index : integer;
  socket_enable : Boolean;
  Protocol : TWsaProtocolInfoA;
  item_last_delay : Integer;
  main_recv_buff : Integer;
end;


TDataPC = packed record
  strength : integer;
  intelligence : integer;
  dexterity : integer;
  constitution : integer;
  mentality : integer;
  sense : integer;
  levelup_point : integer;
  skillup_point : integer;
  expert_skillup_point : integer;
  regen_map : integer;
  regen_x : integer;
  regen_y : integer;
  level : integer;
  job : integer;
  sex : integer;
  exp : Int64;
  money : Int64;
  fame : integer;
  chaos_pt : integer;
  gw_score_t : integer;
  gw_score_w : integer;
  ct : array [0..7] of TSlotCashItemType;
  cs : array [0..7] of Int64;
  buff_d : array [0..14] of array [0..3] of integer;
  dead_map_num : integer;
  dead_x : integer;
  dead_y : integer;
  hair_style : integer;
  face_style : integer;
  pvppoint : integer;
  visual_state : integer;
  t_chaos : integer;
  t_killmons : integer;
  t_vending : integer;
  t_cpower : integer;
  t_reborn : integer;
  t_npc_buy : UInt64;
  t_gpoint : integer;
  t_death_ex : integer;
  t_exp_ex : UInt64;
  t_hwid : Cardinal;
  t_online : integer;
end;
PDataPC = ^TDataPC;




type
TCharExt = packed record
  s : TCharExtSocket;
  is_new : boolean;
  is_login_char : boolean;
  is_gm_grant : Boolean;
  t_cc_point : Integer;
  t_title : integer;
  t_title_time : integer;
  t_vending_tick : cardinal;
  t_vending_premium : integer;
  t_30_secs : cardinal;
  t_2_secs : cardinal;
  t_uniq_id : integer;
  t_exp_ex_bool : integer;
  t_reward_time : cardinal;
  t_reward_time_last : word;
  t_reward_time_tick : word;
  t_enter_time : cardinal;
  t_confirm_data : cardinal;
  t_blowfish : cardinal;
  t_fishing : boolean;
  t_auto_sc_type  : integer;
  t_auto_hunt  : integer;
  t_auto_hunt_last_m  : integer;
  t_auto_hunt_last_x  : integer;
  t_auto_hunt_last_y  : integer;
  t_auto_hunt_backstep  : integer;
  t_tbf_lvl  : integer;
  t_tbf_val  : integer;
  t_auth_tick  : cardinal;
  t_auth_data  : cardinal;
  t_auth_data_tmp  : Integer;
  t_auth_count  : integer;
  t_auth_banned : integer;
  t_delay_hit : cardinal;
  t_delay_backstep : cardinal;
  t_fish_mode : integer;
  t_fish_tick : cardinal;
  t_fish_item_id : integer;
  t_fish_cashback_count : integer;
  t_skill_last_id: array [0..1] of integer;
  t_skill_last_id_idx: integer;
  t_dungeon_last_warp: integer;
  t_dungeon_map_type : integer;
  t_regen_dungeon : array [0..3] of Integer;
  t_regen_save_dungeon : array [0..3] of Integer;
  t_guild_call : array [0..2] of Integer;
  b_costume_drop : integer;
  b_costume_exp : integer;
  w_remote_tick : cardinal;
  w_remote_warp : integer;
  t_char_id : integer;
  qr_last_tick : cardinal;
  b_last_fame : integer;
  b_last_ddt_f : integer;
  b_last_ddh_f : integer;
  b_my_ddt : integer;
  b_my_ddh : integer;
  b_posh_ddt : integer;
  b_posh_ddh : integer;
  b_dw_ddt_limit : integer;
  b_dw_ddh_limit : integer;
  t_cur_map : integer;
  t_last_packet : integer;
  ss_socket_handler : integer;
  b : array [0..3] of array [0..13] of Integer;
  p_tick_time : Cardinal;
  pet_breed : array [0..3] of TPetBreedData;
  stone_data : array [0..2] of TStoneCharData;
  stone_buff : array [1..12] of Integer;
  tuning_buff : array [1..23] of Integer;
  ct_last_sn : Int64;
  ct_last_dt : TItemTuningEx;
  f_felly_svtunning_i : array [0..19] of Integer;
  f_felly_svtunning : array [0..19] of Int64;
  crt_linked : integer;
  hash_inventory : cardinal;
  hash_status : cardinal;
  hash_invcash : cardinal;
  hash_petbreed : cardinal;
  hash_stone : cardinal;
  c_size : integer;
  n_size : integer;
end;
PCharExt = ^TCharExt;
TCharExtArray = packed array[0..(High(Integer) div SizeOf(TCharExt))-1] of TCharExt;
PCharExtArray = ^TCharExtArray;
     //TWsaProtocolInfoA


type
TPCData = packed record
  tmp : array [0..6075] of byte;
  slot_cash : array [0..79] of TSlotCashItemType;
  slot_cash_serial : array [0..79] of Int64;
  unk1_1 : array [0..79] of byte;
  unk1_2 : array [0..79] of byte;
  inv_it : array [0..204] of TSlotCashItemType;  //2460
  inv_sn : array [0..204] of Int64;
  save : TDataPC;                                               //  1640
  data : TCharExt;
  curent_nick : TAnsiCharEx16;
  tmp_ex : array [0..233] of byte;
end;
TPCDataArray = packed array[0..(High(Integer) div SizeOf(TPCData))-1] of TPCData;
PPCData = ^TPCDataArray;

type
  tm = record
    tm_sec: Integer;
    tm_min: Integer;
    tm_hour: Integer;
    tm_mday: Integer;
    tm_mon: Integer;
    tm_year: Integer;
    tm_wday: Integer;           // Day of week [0-6] (Sunday = 0)
    tm_yday: Integer;
    tm_isdst: Integer;
  end;
  Ptm = ^tm;

function printf(a1 : PansiChar): Integer; cdecl; varargs; external 'MSVCRT.dll';
function snprintf(Dest : PansiChar; Count : size_t; Format : PansiChar): Integer; cdecl; varargs; external 'MSVCRT.dll' name '_snprintf';
function sprintf(Dest : PansiChar; Format : PansiChar): Integer; cdecl; varargs; external 'MSVCRT.dll' name 'sprintf';
procedure memset(Dest: Pointer; Val : Integer; Size : size_t); cdecl; external 'MSVCRT.dll' name 'memset';
procedure memcpy(Dest,Source : Pointer; Size : size_t); cdecl; external 'MSVCRT.dll' name 'memcpy';

function time64(time : PUint64): Uint64; cdecl; external 'MSVCRT.dll' name '_time64';
function localtime64_s(tm : PTm; time : PUint64): cardinal; cdecl; external 'MSVCRT.dll' name '_localtime64_s';
function strftime(Dest : PansiChar; Count : size_t; Format : PansiChar; tm : PTm): Integer; cdecl; external 'MSVCRT.dll' name 'strftime';
function fputs(Dest : PansiChar; ffile : Pointer): Integer; cdecl; external 'MSVCRT.dll' name 'fputs';
function fopen(path : PansiChar; mode : PansiChar): Pointer; cdecl; external 'MSVCRT.dll' name 'fopen';
function fclose(ffile : Pointer): Integer; cdecl; external 'MSVCRT.dll' name 'fclose';
function fwrite(Dest : PansiChar; ssize : size_t; nnemb : size_t; ffile : Pointer): Integer; cdecl; external 'MSVCRT.dll' name 'fwrite';



procedure local_log_data(path,nick : PansiChar; cur_power,cur_job,cur_level : integer); cdecl;
var
ffile : Pointer;
data_write : array [0..128] of AnsiChar;
begin
  wsprintfA(@data_write[0],PansiChar('%s | %d | %d | %d |'#10),nick,cur_job,cur_level,cur_power);
ffile := fopen(PansiChar(path),PansiChar('a'));
if (ffile <> nil) then
  begin
    fputs(data_write, ffile);
    fclose(ffile);
  end;
end;


function proc_get_data_server(port_server,map_id,min_power : integer; attach : PansiChar):Integer;
var
hwnd_server : HWND;
hwnd_s : array[0..127] of AnsiChar;
time_path_data : array [0..128] of AnsiChar;
hxFile : THandle;
pc : PPCData;
i : integer;
pid : integer;
ttime : Uint64;
ttm : tm;
begin
  wsprintfA(@hwnd_s[0],PansiChar('so_gameserver_%d'),port_server);
  hwnd_server := FindWindowA(@hwnd_s[0],nil);
  if (hwnd_server = 0) then exit(-1);
  if (GetWindowThreadProcessId(hwnd_server,@pid) = 0) then exit(-1);



hxFile := OpenFileMappingW(FILE_MAP_ALL_ACCESS, false, PWideChar(Format('gs_data_%d',[pid])));
if (hxFile <> 0) then
  begin
    pc := MapViewOfFile(hxFile, FILE_MAP_ALL_ACCESS, 0, 0, SizeOf(TPCData)*2048);
    if pc = nil then Exit(-1);
  end else Exit(-1);

  Result := 0;
  time64(@ttime);
  localtime64_s(@ttm,@ttime);
  memset(@time_path_data[0],0,128);
  strftime(time_path_data, 128, PansiChar('.\%Y-%m-%d_%H%M%S.txt'), @ttm);

for i := 1 to 2046 do
begin
 if (pc[i].data.is_login_char and (pc[i].data.t_cur_map = map_id) and (pc[i].save.t_cpower >= min_power)) then
 begin
   local_log_data(@time_path_data[0],pc[i].curent_nick,pc[i].save.t_cpower,pc[i].save.job,pc[i].save.level);
   Inc(Result,1);
 end;
end;

if (Result > 0) then lstrcpyA(attach,@time_path_data[2]);
UnmapViewOfFile(pc);
CloseHandle(hxFile);
end;




function send_packet_data(server_port : integer; packet_id : integer; len : integer; packet_data : PIntegerArray): Boolean;
var
hwnd_server : HWND;
hwnd_s : array[0..127] of AnsiChar;
copyDataStruct : TCopyDataStruct;
Res : NativeUint;
begin
 Result := False;
  wsprintfA(@hwnd_s[0],PansiChar('so_gameserver_%d'),server_port);
  hwnd_server := FindWindowA(@hwnd_s[0],nil);
  if (hwnd_server <> 0) then
  begin
     ZeroMemory(@copyDataStruct,sizeOf(TCopyDataStruct));
     copyDataStruct.dwData := packet_id;
     copyDataStruct.cbData := len;
     copyDataStruct.lpData := packet_data;
     if (SendMessageTimeOutA(hwnd_server,WM_COPYDATA,0,lParam(@copyDataStruct),SMTO_BLOCK,2000,@Res) <> 0) then
     begin
       Result := Res = 1;
     end;
  end;
end;

function StrToInteger(S : string): Integer; cdecl;
begin
  if not TryStrToInt(S,Result) then Result := 0;
end;

function command_query_discord(ch_name : PAnsiChar; command_query : PansiChar; res_text,res_attachment : PansiChar):integer; stdcall;
var
buff_packet : array [0..255] of integer;
Splitter : TArray<string>;
command_len : integer;
begin
Result := 0;
Splitter := string(command_query).Split([' ']);
command_len := Length(Splitter);
command_len := command_len-2;
  if (command_len > 0) then
  begin
    if Splitter[0].Contains('!set_event_exp') then
        begin
          if (command_len = 2) then
          begin
            buff_packet[0] := 1;
            buff_packet[1] := StrToInteger(Splitter[2]);
            buff_packet[2] := StrToInteger(Splitter[3]);
            if (send_packet_data(StrToInteger(Splitter[1]),601012,12,@buff_packet[0])) then
            begin
              wsprintfA(res_text,PansiChar('send (%s) success !'),command_query);
              Result := 1;
            end else
            begin
              wsprintfA(res_text,PansiChar('server %d not available'),StrToInteger(Splitter[1]));
              Result := 1;
            end;
          end else
          begin
            wsprintfA(res_text,PansiChar('(%s) wrong format ! = !set_event_exp 2927 100 60'),command_query);
            Result := 1;
          end;
        end else
    if Splitter[0].Contains('!set_event_drop') then
        begin
          if (command_len = 2) then
          begin
            buff_packet[0] := 2;
            buff_packet[1] := StrToInteger(Splitter[2]);
            buff_packet[2] := StrToInteger(Splitter[3]);
            if (send_packet_data(StrToInteger(Splitter[1]),601012,12,@buff_packet[0])) then
            begin
              wsprintfA(res_text,PansiChar('send (%s) success !'),command_query);
              Result := 1;
            end else
            begin
              wsprintfA(res_text,PansiChar('server %d not available'),StrToInteger(Splitter[1]));
              Result := 1;
            end;
          end else
          begin
            wsprintfA(res_text,PansiChar('(%s) wrong format ! = !set_event_drop 2927 100 60'),command_query);
            Result := 1;
          end;
        end else
    if Splitter[0].Contains('!get_list_nick ') then
        begin
          if (command_len = 2) then
          begin
            buff_packet[0] := proc_get_data_server(StrToInteger(Splitter[1]),StrToInteger(Splitter[2]),StrToInteger(Splitter[3]),res_attachment);
            if (buff_packet[0] > 0) then
            begin
              wsprintfA(res_text,PansiChar('list (%s) success ! %d'),command_query,buff_packet[0]);
              Result := 2;
            end else if (buff_packet[0] = 0) then
            begin
              wsprintfA(res_text,PansiChar('list (%s) success ! %d'),command_query,buff_packet[0]);
              Result := 1;
            end else
            begin
              wsprintfA(res_text,PansiChar('server %d not available %s'),StrToInteger(Splitter[1]),PansiChar(AnsiString(SysErrorMessage(GetLastError()))));
              Result := 1;
            end;
          end else
          begin
            wsprintfA(res_text,PansiChar('(%s) wrong format ! = !get_list_nick 2927 2 100000'),command_query);
            Result := 1;
          end;
        end else
        begin
          lstrcpyA(res_text,command_query);
          Result := 1;
        end;




//    wsprintfA(res_text,'%d',Length(Splitter));
    //MessageBoxA(0,command_query,ch_name,0);
    //lstrcpyA(res_text,command_query);
//    Result := 1;

  end;
end;


procedure start_data(); cdecl;
begin
   printf(#10#9'available command : '#10);
   printf(#9#9'!set_event_drop 2927 100 60'#10 );
   printf(#9#9'!set_event_exp 2927 100 60'#10);
   printf(#9#9'!get_list_nick 2927 2 100000'#10);
end;

exports
  command_query_discord;

begin
DisableThreadLibraryCalls(hInstance);
start_data();
end.
