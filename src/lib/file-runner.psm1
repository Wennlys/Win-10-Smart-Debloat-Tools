Import-Module -DisableNameChecking $PSScriptRoot\..\lib\"show-dialog-window.psm1"
Import-Module -DisableNameChecking $PSScriptRoot\..\lib\"title-templates.psm1"

function Open-PowerShellFilesCollection {
    [CmdletBinding()]
    param (
        [String] $RelativeLocation,
        [Array]  $Scripts,
        [String] $DoneTitle,
        [String] $DoneMessage,
        [Parameter(Mandatory = $false)]
        [Bool]   $OpenFromGUI = $true,
        [Switch] $NoDialog
    )

    Push-Location -Path "$PSScriptRoot\..\..\$RelativeLocation"
    Get-ChildItem -Recurse *.ps*1 | Unblock-File

    ForEach ($FileName in $Scripts) {
        $Private:Counter = Write-TitleCounter -Text "$FileName" -Counter $Counter -MaxLength $Scripts.Length
        If ($OpenFromGUI) {
            Import-Module -DisableNameChecking .\"$FileName" -Force
        }
        Else {
            PowerShell -NoProfile -ExecutionPolicy Bypass -file .\"$FileName"
        }
    }

    Pop-Location

    If (!($NoDialog)) {
        Show-Message -Title "$DoneTitle" -Message "$DoneMessage"
    }
}

function Open-RegFilesCollection {
    [CmdletBinding()]
    param (
        [String] $RelativeLocation,
        [Array]  $Scripts,
        [String] $DoneTitle,
        [String] $DoneMessage,
        [Switch] $NoDialog
    )

    Push-Location -Path "$PSScriptRoot\..\..\$RelativeLocation"

    ForEach ($FileName in $Scripts) {
        $Private:Counter = Write-TitleCounter -Text "$FileName" -Counter $Counter -MaxLength $Scripts.Length
        regedit /s "$FileName"
    }

    Pop-Location

    If (!($NoDialog)) {
        Show-Message -Title "$DoneTitle" -Message "$DoneMessage"
    }
}

<#
Example:
Open-PowerShellFilesCollection -RelativeLocation "src\scripts" -Scripts "script.ps1" -DoneTitle "Title" -DoneMessage "Message" -NoDialog
Open-PowerShellFilesCollection -RelativeLocation "src\scripts" -Scripts @("script1.ps1", "script2.ps1") -DoneTitle "Title" -DoneMessage "Message" -OpenFromGUI $false
Open-RegFilesCollection -RelativeLocation "src\scripts" -Scripts "script.reg" -DoneTitle "Title" -DoneMessage "Message" -NoDialog
Open-RegFilesCollection -RelativeLocation "src\scripts" -Scripts @("script1.reg", "script2.reg") -DoneTitle "Title" -DoneMessage "Message"
#>