:: Jalankan di Command Prompt admin (cmd.exe)
for %%F in (
  "C:\Program Files (x86)\Bandicam\bdcam.exe"
  "C:\Program Files (x86)\Bandicam\bdcam32.bin"
  "C:\Program Files (x86)\Bandicam\bdcam32.dll"
  "C:\Program Files (x86)\Bandicam\bdcam64.dll"
) do (
  netsh advfirewall firewall delete rule name="BLOCK IN  %%~nxF"
  netsh advfirewall firewall delete rule name="BLOCK OUT %%~nxF"

  netsh advfirewall firewall add rule name="BLOCK IN  %%~nxF"  dir=in  action=block program="%%~F"
  netsh advfirewall firewall add rule name="BLOCK OUT %%~nxF" dir=out action=block program="%%~F"
)
echo Selesai.
