# Provide Folder name and create
$Folder=’C:\Users\richardjoh\Documents\Projects\hashmove\testfolder’

# New-Item -ItemType Directory -Path $Folder

# Create a series of 1000 files
for ($x=0;$x -lt 1000; $x++)

{
# Let’s create a completely random filename
$filename1="$($Folder)\"
$filename2=-join ((65..90) + (97..122) | Get-Random -Count 10 | % {[char]$_})
$filename3="$((Get-Random 1000).tostring()).txt"
$filename=$filename1+$filename2+$filename3

write-output $filename
#write-output $filename2
#write-output $filename3

# Now we’ll create the file with some content
Add-Content -Value ‘Just a simple demo file’ -Path $filename

}
