Start-Sleep -Seconds 5  # Espera o Ngrok subir

try {
    $response = Invoke-RestMethod http://127.0.0.1:4040/api/tunnels
    $url = $response.tunnels[0].public_url

    Write-Host "URL do Ngrok: $url" -ForegroundColor Green

    $htmlPath = "C:\Users\User\Documents\GitHub\BodasFlower\index.html"

    $html = Get-Content $htmlPath -Raw

    $html = $html -replace 'fetch\("https:\/\/.*?\/send-location"', "fetch(`"$url/send-location`""

    Set-Content -Path $htmlPath -Value $html -NoNewline

    Write-Host "index.html atualizado com a nova URL!" -ForegroundColor Cyan
}
catch {
    Write-Host "Erro ao atualizar o index.html:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    pause
}
# Caminho para o executável do GitHub Desktop
$githubDesktop = "$Env:LOCALAPPDATA\GitHubDesktop\GitHubDesktop.exe"

# Caminho do repositório local
$repoPath = "C:\Users\User\Documents\GitHub\BodasFlower"

# Mensagem padrão de commit
$commitMessage = "Atualiza index.html com nova URL do Ngrok"

# Abre o GitHub Desktop apontando pro repositório
Start-Process -FilePath $githubDesktop -ArgumentList "--repository $repoPath", "--message `"$commitMessage`"", "--wait"