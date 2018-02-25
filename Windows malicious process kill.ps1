$file="C:\Users\testman\Desktop\testrun\BlockList.txt"
$emotethash=Import-Csv $file
$processpath=(Get-Process).Path | select -Unique

$processhash=$processpath| % {
Get-FileHash -Path $_
}


ForEach($ehash in $emotethash)
{
	ForEach($phash in $processhash)
	{

$phash.Hash
$phash.Path

		If($phash.Hash -eq $ehash)
		{
			kill -Name $(Split-Path $phash.Path -Leaf) -Force
            Remove-Item -Path $phash.Path -ErrorAction SilentlyContinue
		}
	}
}
