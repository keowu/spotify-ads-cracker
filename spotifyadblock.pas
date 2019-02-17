program spotifyadblock;
uses
Classes, SysUtils, crt, Graph, MMSystem, ShellAPI;    //units

Function DeleteFileWithUndo(sFileName : string ) : boolean;    //função pronta e padrão para deletar um arquivo usando pascal
var
fos : TSHFileOpStruct;
Begin
FillChar( fos, SizeOf( fos ), 0 );
With fos do
  begin
  wFunc := FO_DELETE;
  pFrom := PChar( sFileName );
  fFlags := FOF_ALLOWUNDO
  or FOF_NOCONFIRMATION
  or FOF_SILENT;
  end;
Result := ( 0 = ShFileOperation( fos ) );
end;

procedure programawindows;
var  arq: TextFile; // declarando a variável "arq" do tipo arquivo texto
    i: integer;
    spotify : array[1..18] of String;
begin

  DeleteFile('C:\Windows\System32\drivers\etc\hosts');  //1º metodo para apagar o arquivo
  DeleteFileWithUndo('C:\Windows\System32\drivers\etc\hosts'); //2º metodo caso o primeiro não tenha funcionado

  //define os dados do arquivo hosts
 spotify[1] := '# Copyright (c) 1993-2006 Microsoft Corp.';
 spotify[2] := '# Copyright (c) Spotify Aviso: spotify dados pegos atraves do LiveTcpUdpWatch e não esta infringindo nenhuma lei';
 spotify[3] := '# Este é um arquivo HOSTS de exemplo usado pelo Microsoft TCP / IP para Windows.';
 spotify[4] := '#';
 spotify[5] := '#inicio do spotify ads block';
 spotify[6] := '0.0.0.0 pubads.g.doubleclick.net';
 spotify[7] := '0.0.0.0 securepubads.g.doubleclick.net';
 spotify[8] := '0.0.0.0 http://www.googletagservices.com';
 spotify[9] := '0.0.0.0 gads.pubmatic.com';
 spotify[10] := '0.0.0.0 ads.pubmatic.com';
 spotify[11] := '0.0.0.0 spclient.wg.spotify.com';
 spotify[12] := '#fim do spotify crack';

  try
{ Associa a variável do programa "arq" ao arquivo externo no caso o "hosts"
          na unidade de disco "c/windows/system32/drivers/etc/hosts" }
    AssignFile(arq, 'C:\Windows\System32\drivers\etc\hosts');  //aqui seta a localidade do arquivo hosts
    Rewrite(arq); { [  ] Cria o arquivo texto "hosts" na unidade de disco "c/windows/system32/drivers/etc/hosts" }

    Writeln(arq, '#novo hosts'); { [ 8 ] Grava uma linha no arquivo de aviso}
    for i:=1 to 12 do
    begin
{ [ 8 ] Grava uma linha da tabuada no arquivo }
      Writeln(arq, spotify[i]);
    end;
    Writeln(arq, '#fim do crack do spotify'); { [ 8 ] Grava uma linha final no arquivo fora do laço }

    CloseFile(arq); { [ 8 ] Fecha o arquivo texto "hosts". }
  except
  end;
end;

procedure musica;
begin
   SndPlaySound('.\bg\bg.wav', SND_ASYNC + SND_LOOP);      //musica
end;

procedure menuzinho;
var
op: integer;
begin
     textcolor(red);
     writeln('--------------------------------------');
     writeln('| * Aviso antes de prosseguir caso   |');
     writeln('| seu sistema seja windows execute   |');
     writeln('| como administrador !               |');
     writeln('|                                    |');
     writeln('| Selecione seu sistema operacional: |');
     writeln('| 1- Windows                         |');
     writeln('| 2- linux(breve)                    |');
     writeln('| 3- Creditos                        |');
     writeln('--------------------------------------');
     readln(op);
     if (op = 1) then
     begin
        clrscr;
        musica;
        programawindows;
        delay(8000);
        writeln('Terminado pode fechar esse programa');
        writeln('Para surtir efeitos recomendo reiniciar seu pc !');
     end
     else if (op = 2) then
     begin
        writeln('Desculpe em desenvolvimento !!')
     end
     else if (op = 3) then
     begin
        writeln('Desenvolvido por @keowu com <3 e um pouco de codigo');
        writeln('Github: www.github.com/keowu');
        writeln('No desenvolvimento foi utilizado o programa:       ');
        writeln('http://nirsoft.net/utils/live_tcp_udp_watch.html   - Live Tcp Udp Watch');
        writeln('https://www.lazarus-ide.org - Lazarus');
     end
     else
     begin
          writeln('Opção Não reconhecida tente denovo !');
     end;
 end;

begin
  menuzinho;
  readln;
end.

