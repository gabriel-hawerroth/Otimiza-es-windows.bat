//habilita e ativa o plano de energia 'Desempenho máximo'
powershell -Command "powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61"
powershell -Command "powercfg -setactive e9a42b02-d5df-448d-aa00-03f14749eb61"


//exclui arquivos temporários e limpa a lixeira
powershell -Command "Remove-Item 'C:\Users\ADMINI~1\AppData\Local\Temp\*' -Recurse -Force"
powershell -Command "Remove-Item 'C:\Windows\Temp\*' -Recurse -Force"
powershell -Command "Remove-Item 'C:\Windows\Prefetch\*' -Recurse -Force"
rd /s /q C:\$Recycle.bin

//limpa e verifica integridade do disco
powershell -Command "cleanmgr.exe /verylowdisk /c"
powershell -Command "CHKDSK /C"
powershell -Command "sfc /scannow"

//otimiza internet
powershell -Command "ipconfig /release"
powershell -Command "ipconfig /renew"
powershell -Command "ipconfig /flushdns"
powershell -Command "nbtstat -rr"
powershell -Command "netsh int ip reset /all"
powershell -Command "netsh winsock reset"

//atualiza softwares instalados
powershell -Command "winget upgrade"
powershell -Command "winget upgrade --all"

//repara erros de imagem do windows
powershell -Command "DISM /Online /Cleanup-image /Scanhealth"
powershell -Command "DISM /Online /Cleanup-image /Checkhealth"
powershell -Command "DISM /Online /Cleanup-image /Restorehealth"

powershell -Command "Restart-Computer"