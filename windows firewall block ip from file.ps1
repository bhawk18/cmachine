$ProfileType = "any"
$ranges = get-content $file
$linecount = $ranges.count
$textranges = [System.String]::Join(",",$($ranges[0..$($linecount - 1)]))
netsh.exe advfirewall firewall add rule name="Emotet_block" dir=in action=block localip=any remoteip="$textranges" description="$description" profile="$profiletype" interfacetype="$interfacetype"
if (-not $?) { "`nFailed to create '$rulename-#$icount' inbound rule for some reason, continuing anyway..."}
netsh.exe advfirewall firewall add rule name="Emotet_block" dir=out action=block localip=any remoteip="$textranges" description="$description" profile="$profiletype" interfacetype="$interfacetype"
if (-not $?) { "`nFailed to create '$rulename-#$icount' outbound rule for some reason, continuing anyway..."}



