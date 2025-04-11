Start-Sleep -Seconds 5  # Espera o Ngrok iniciar

try {
    $response = Invoke-RestMethod http://127.0.0.1:4040/api/tunnels
    $url = $response.tunnels[0].public_url

    Write-Host "🔗 Ngrok URL encontrada: $url" -ForegroundColor Green

    # Caminho para salvar o arquivo
    $outputPath = "C:\Users\User\Documents\GitHub\BodasFlower\ngrok_url.txt"
    Set-Content -Path $outputPath -Value $url
    Write-Host "📁 URL salva em: $outputPath"

    # (Opcional) Abrir a URL no navegador
    Start-Process $url
}
catch {
    Write-Host "❌ Erro ao obter a URL do Ngrok:" -ForegroundColor Red
    Write-Host $_.Exception.Message -ForegroundColor Red
    pause  # Mantém o terminal aberto em caso de erro
}