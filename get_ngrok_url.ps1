Start-Sleep -Seconds 5  # espera o ngrok iniciar

try {
    $response = Invoke-RestMethod http://127.0.0.1:4040/api/tunnels
    $url = $response.tunnels[0].public_url

    Write-Host "🔗 Ngrok URL: $url"

    # Exemplo: salvar a URL em um arquivo
    Set-Content -Path "C:\Windows\System32\backscan\ngrok_url.txt" -Value $url

    # (Opcional) Abrir o navegador com essa URL
    # Start-Process $url
}
catch {
    Write-Host "⚠️ Não foi possível capturar a URL do Ngrok"
}
