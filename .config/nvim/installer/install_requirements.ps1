# Experimental
if ($IsWindows)
{
  $packages = @{
    python = "python";
    lazygit= "lazygit";
    fd = "fd";
    bat = "bat";
    make = "make";
    rg = "ripgrep";
    nvim = "neovim";
  }

  foreach ($package in $packages)
  {
    if (Get-Command -Name 'scoop' -ErrorAction SilentlyContinue)
    {
      Write-Host "Scoop is already installed." -f White
      scoop bucket add main
      scoop bucket add extras
      scoop install $package.Values
    } else
    {
      Write-Host "Installing Scoop..."
      Set-ExecutionPolicy RemoteSigned -Scope CurrentUser # Optional: Needed to run a remote script the first time
      Invoke-RestMethod get.scoop.sh | Invoke-Expression
      scoop bucket add main
      scoop bucket add extras
      scoop install $package.Values
    }
  }
}
