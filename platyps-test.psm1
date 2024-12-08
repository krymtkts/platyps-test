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
