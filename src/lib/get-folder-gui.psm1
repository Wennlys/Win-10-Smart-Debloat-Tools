# Adapted from: https://stackoverflow.com/questions/25690038/how-do-i-properly-use-the-folderbrowserdialog-in-powershell

function Get-Folder() {
    [CmdletBinding()]
    param (
        [String] $Description = "Select a folder",
        [String] $InitialDirectory = "$env:SystemDrive"
    )

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null
    $FolderName = New-Object System.Windows.Forms.FolderBrowserDialog
    $FolderName.Description = $Description
    $FolderName.rootfolder = "MyComputer"
    $FolderName.SelectedPath = $InitialDirectory
    $Response = $FolderName.ShowDialog()

    If ($Response -eq "OK") {
        $Folder += $FolderName.SelectedPath
        Write-Host "Folder Selected: $Folder"
    }
    ElseIf ($Response -eq "Cancel") {
        Write-Host "Aborting..."
        break
    }

    return $Folder
}

<#
Example:
$Folder = Get-Folder -Description "Select a folder where X files are located"
$Folder = Get-Folder -Description "Select a folder where X files are located" -InitialDirectory "C:\Windows\Temp"
#>