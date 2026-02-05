Esse .bat libera o executável do PDV no Windows Defender e no Firewall.

Exclusão no Windows Defender
powershell -Command "Add-MpPreference -ExclusionProcess 'C:\pdv\pdvvnb.exe'"


📌 Isso diz pro Defender:

“Não escaneia, não bloqueia e não interfere nesse executável”

✔️ Resolve:

PDV não abre

QR Code não aparece

Executável some

Lentidão absurda

❌ Não resolve:

Rede ruim

IP errado

DNS errado

Rota quebrada

Regras de Firewall
netsh advfirewall firewall add rule name="ShowQR" dir=in action=allow program="C:\pdv\pdvvnb.exe"
netsh advfirewall firewall add rule name="ShowQR" dir=out action=allow program="C:\pdv\pdvvnb.exe"


📌 Libera:

Entrada e saída de rede

Comunicação com AF / servidor / SEFAZ

⚠️ Se a conexão estiver zoada, isso não adianta nada.

🎯 Conclusão do BAT 2

✔️ Necessário em muitos ambientes
❌ Não substitui teste de rede
❌ Não garante comunicação funcional

script .bat

@echo off
:: Adiciona o aplicativo C:\pdv\pdvvnb.exe na exclusão do Windows Defender
echo Adicionando C:\pdv\pdvvnb.exe na excecao do Windows Defender...
powershell -Command "Add-MpPreference -ExclusionProcess 'C:\pdv\pdvvnb.exe'"

:: Adiciona regra no Firewall do Windows para permitir C:\pdv\pdvvnb.exe
echo Adicionando regra no Firewall do Windows...
netsh advfirewall firewall add rule name="ShowQR" dir=in action=allow program="C:\pdv\pdvvnb.exe" enable=yes
netsh advfirewall firewall add rule name="ShowQR" dir=out action=allow program="C:\pdv\pdvvnb.exe" enable=yes

echo Operacao concluida.
pause
