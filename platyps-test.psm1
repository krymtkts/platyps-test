<#

$newMarkdownCommandHelpSplat = @{
    ModuleInfo = Get-Module platyps-test
    OutputFolder = '.'
    HelpVersion = '1.0.0.0'
    WithModulePage = $false
}
New-MarkdownCommandHelp @newMarkdownCommandHelpSplat

Measure-PlatyPSMarkdown -Path ./platyps-test/*.md | Where-Object Filetype -match CommandHelp | Update-MarkdownCommandHelp -Path {$_.FilePath} -NoBackup

Measure-PlatyPSMarkdown -Path ./platyps-test/*.md | Where-Object Filetype -match CommandHelp | Import-MarkdownCommandHelp -Path {$_.FilePath} | Export-MamlCommandHelp -OutputFolder .\Maml


#>
function Test-FunctionForPlatyPS {
    [CmdletBinding()]
    param (
        [Parameter(
            Mandatory,
            Position = 0,
            HelpMessage = 'Value1',
            ValueFromPipeline,
            ValueFromPipelineByPropertyName
        )]
        [string]
        [ValidateNotNullOrEmpty()]
        $Value1,
        [Parameter()]
        [string]
        [ValidateSet('A', 'B', 'C')]
        $Value2
    )
    Write-Output "Hello $Value1 $Value2"
}
