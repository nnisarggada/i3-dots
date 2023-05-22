# Experimental
if ($IsWindows)
{
  $config = $env:LOCALAPPDATA + "\nvim"

  if (Test-Path -Path $config)
  {
    Write-Output "Removing the configuration..."
    Remove-Item $config -Recurse -Force
    git clone https://github.com/Alexis12119/nvim-config.git $config
  } else
  {
    git clone https://github.com/Alexis12119/nvim-config.git $config
  }
}
