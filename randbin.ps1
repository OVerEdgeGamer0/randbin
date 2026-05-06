param(
    [Parameter(Mandatory)]
    [int] $Size,
    [Parameter(Mandatory)]
    [string] $Output
)

# OpenSSL でランダム HEX を生成
$hex = openssl rand -hex $Size

# PowerShell 5.x 互換の HEX → バイト変換
$bytes = for ($i = 0; $i -lt $hex.Length; $i += 2) {
    [Convert]::ToByte($hex.Substring($i, 2), 16)
}

[IO.File]::WriteAllBytes($Output, $bytes)

Write-Host "Generated $Size bytes $Output"
