function New-Commit{
    param(
        [String]$Repo,
        [Int]$Num
    )
    Set-Location $Repo
    foreach ($i in $Num) {
        $FileName = "File$i.txt"
        New-Item -Type File -Name $FileName
        Write-Host "Adding file [$FileName]"
        git add $FileName | Out-Null
        git commit -m "Adding file [$FileName]"
        Remove-Item -Force $FileName
        Write-Host "Removing File [$FileName]"
        git rm $FileName | Out-Null
        git commit -m "Removing file [$FileName]"
    }
    Write-Host "Pushing to Github"
    git push | Out-Null
    Set-Location ~
}