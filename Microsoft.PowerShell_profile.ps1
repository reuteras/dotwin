# Autosuggestions
if (-not(Get-Module -ListAvailable PSReadLine)) {
    Import-Module PSReadLine
}

# History
Set-PSReadLineOption -PredictionSource History

# https://techcommunity.microsoft.com/t5/itops-talk-blog/autocomplete-in-powershell/ba-p/2604524
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Use Vi keybindings
Set-PSReadLineOption -EditMode Vi

# Other options:
# Set-PSReadLineOption -PredictionViewStyle ListView

# Add icons to dir and ls.
if (-not(Get-Module -ListAvailable Terminal-Icons)) {
    Import-Module -Name Terminal-Icons
}

# Init oh-my-posh and set theme
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\powerlevel10k_rainbow.omp.json" | Invoke-Expression

# Use posh-git: https://github.com/dahlbyk/posh-git
if (-not(Get-Module -ListAvailable posh-git)) {
    Import-Module posh-git
}

# For easier usage of Docker
if (-not(Get-Module -ListAvailable DockerCompletion)) {
    Import-Module DockerCompletion
}

# Use git to diff to files
function Diff-TwoFiles ($file1, $file2) {
    git diff $file1 $file2
}
Set-Alias gdiff Diff-Twofiles

# Function to start a Jupyter notebook
function notebook () {
	docker run --name notebook --rm -p 8888:8888 -e JUPYTER_ENABLE_LAB=no -v C:\Users\reuteras\Documents\Jupyter\work\:/home/jovyan/work -v C:\Users\reuteras\Documents\Jupyter\.jupyter:/home/jovyan/.jupyter reuteras/container-notebook
}

# Make Windows be more like Linux :)
Set-Alias less more
Set-Alias apt winget
