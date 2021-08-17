# Display Pipeline


Import-Module powershell-yaml
$yaml = Get-Content .\pipeline.yaml |ConvertFrom-YAML

#Display Stages and Steps
$stages = $yaml.stages
$steps = $yaml.steps

Write-Host "::::: Workflow :::::"
ForEach ($stage in $stages) {

  Write-Host "+++++ $stage +++++"

  ForEach ($step in $steps.GetEnumerator()) {
    If($step.Value['stage'] -eq $stage){
      Write-Host "-" $step.Key
    }
  }
}
Write-Host " "

# Run Pipeline
ForEach ($stage in $stages) {

  Write-Host "Executing $stage"

  ForEach ($step in $steps.GetEnumerator()) {
    If($step.Value['stage'] -eq $stage){
      Write-Host "Executing " $step.Key
      $res = Start-Process Powershell.exe -Argument "-File .\$stage.ps1 $($step.Key)" -NoNewWindow
      Write-Host $res
    }
  }
}
