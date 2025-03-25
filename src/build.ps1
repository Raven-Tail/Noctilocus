Import-Module $PSScriptRoot\..\Invoke-Process.psm1

$projects = @(
    # "$PSScriptRoot/Noctilocus/"
    "$PSScriptRoot/Noctilocus.SmartFormat/"
)

$cmd = "dotnet", "build"
$arguments = "-c", "Release"

foreach ($project in $projects) {
    $expression = ($cmd + $project + $arguments + $args) -join " ";
    Write-Host "$ $expression"
    Invoke-Process $expression
}
