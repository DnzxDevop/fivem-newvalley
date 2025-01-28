@echo off
echo ============================================
echo Abrindo portas para o servidor FiveM...
echo ============================================

:: Porta padrão do FiveM (TCP e UDP)
set FIVEM_PORT=80

:: Porta de escuta adicional do FiveM (se aplicável)
set FIVEM_PORT_ADDITIONAL=8080

echo Abrindo porta %FIVEM_PORT% (TCP e UDP)...
netsh advfirewall firewall add rule name="FiveM_TCP_%FIVEM_PORT%" dir=in action=allow protocol=TCP localport=%FIVEM_PORT%
netsh advfirewall firewall add rule name="FiveM_UDP_%FIVEM_PORT%" dir=in action=allow protocol=UDP localport=%FIVEM_PORT%

echo Abrindo porta %FIVEM_PORT_ADDITIONAL% (TCP e UDP)...
netsh advfirewall firewall add rule name="FiveM_TCP_%FIVEM_PORT_ADDITIONAL%" dir=in action=allow protocol=TCP localport=%FIVEM_PORT_ADDITIONAL%
netsh advfirewall firewall add rule name="FiveM_UDP_%FIVEM_PORT_ADDITIONAL%" dir=in action=allow protocol=UDP localport=%FIVEM_PORT_ADDITIONAL%

echo ============================================
echo Todas as portas foram abertas com sucesso!
echo ============================================
pause
