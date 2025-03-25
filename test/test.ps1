Import-Module $PSScriptRoot\..\Invoke-Process.psm1

$projects = @(
    "$PSScriptRoot/Noctilocus.Test/"
)

$cmd = "dotnet", "test"
$arguments = "-c", "Release"

foreach ($project in $projects) {
    $expression = ($cmd + $project + $arguments + $args) -join " ";
    Write-Host "$ $expression"
    Invoke-Process $expression
}
