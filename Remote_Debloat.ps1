# Define the folder and file path
$folderPath = "$HOME\tempDebloat"
$file = "$folderPath\debloat.ps1" 
$file2 = "$folderPath\Appslist.txt" 

# Check if the folder exists
if (-not (Test-Path $folderPath)) {
    # Create the folder if it doesn't exist
    New-Item -Path $folderPath -ItemType Directory
}

Invoke-WebRequest -Uri https://raw.githubusercontent.com/mondogenerate/Scriptladdy/main/Win11Debloat.ps1 -OutFile $file -UseBasicParsing 
Invoke-WebRequest -Uri https://raw.githubusercontent.com/mondogenerate/Scriptladdy/main/Appslist.txt -OutFile $file2 -UseBasicParsing 


ls $folderPath


powershell -ep bypass $file -RemoveApps -Silent

Start-Sleep 30

if(test-path $folderPath){ Remove-Item $folderPath -Force }