# A function to create a number of random content files with a random name and predefined size.

function new-testfolders {
    param([string]$target,[int]$filesize,[int]$num_files)
    # New-Item -ItemType Directory -Path $Folder
    $filesize = $filesize * 1048576

    # Create a series of $num_files files
    for ($x=0; $x -lt $num_files; $x++) {
        # Let’s create a completely random filename
        $filename1="$($target)\"
        $filename2=-join ((65..90) + (97..122) | Get-Random -Count 20 | % {[char]$_})
        $filename3="$((Get-Random 1000).tostring()).bin"
        $filename=$filename1+$filename2+$filename3

        #write-output $filename
        #write-output $filename2
        #write-output $filename3
        $out = new-object byte[] $filesize; (new-object Random).NextBytes($out); [IO.File]::WriteAllBytes($filename, $out)
        $percentage=($x / $num_files) * 100
        Write-Progress -Activity "Creation in Progress" -Status "$percentage% Complete:" -PercentComplete $percentage;

        # Now we’ll create the file with some content
        #Add-Content -Value ‘Just a simple demo file’ -Path $filename
        }
    }

new-testfolders 'c:\users\rjohnson\documents\test' 1 1000