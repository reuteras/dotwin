# Install Powershell modules
Install-Module -Name Terminal-Icons -Repository PSGallery
Install-Module PSReadLine
Install-Module posh-git
Install-Module DockerCompletion

# Winget
winget install Git.Git
winget install GnuWin32.Grep
winget install GnuWin32.Make
winget install JanDeDobbeleer.OhMyPosh -s winget
winget install Notepad++.Notepad++
winget install vim.vim
winget install Microsoft.VisualStudioCode
