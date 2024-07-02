#habilita e ativa o plano de energia 'Desempenho máximo'
#powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61
#powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61

#exclui arquivos temporários e limpa a lixeira
Remove-Item 'C:\Users\ADMINI~1\AppData\Local\Temp\*' -Recurse -Force
Remove-Item 'C:\Windows\Temp\*' -Recurse -Force
Remove-Item 'C:\Windows\Prefetch\*' -Recurse -Force

#limpa e verifica integridade do disco
cleanmgr.exe /verylowdisk /c
CHKDSK /C
sfc /scannow

#otimiza internet
ipconfig /release
ipconfig /renew
ipconfig /flushdns
nbtstat -rr
netsh int ip reset /all
netsh winsock reset

#atualiza softwares instalados
winget upgrade
winget upgrade --all

#repara erros de imagem do windows
DISM /Online /Cleanup-image /Scanhealth
DISM /Online /Cleanup-image /Checkhealth
DISM /Online /Cleanup-image /Restorehealth

#reinicia a máquina
Restart-Computer