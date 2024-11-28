<# 
too install, run:

install-Module PSReadLine -Scope CurrentUser -Force
install-Module posh-git -Scope CurrentUser -Force
install-Module ... -Scope CurrentUser -Force
#>

Import-Module posh-git
Import-Module PSReadLine

# theme
# Import-Module oh-my-posh
# Set-Theme Agnoster

# this is too slow
# Import-Module VSSetup
# Import-Module Pscx
# Import-VisualStudioVars

function glg($num_log) {
    if ($num_log -eq $null) {
        $num_log = 10;
    }
    git log --oneline -n $num_log
}

function gds(){
    git diff --staged $args
}

function amend(){
    git commit --amend
}

function conaninse {conan install .. -o example=True}

function cmakeE {cmake .. -DBUILD_EXAMPLE=1}

function make {
    if (Get-Command "cl" -errorAction SilentlyContinue) {
    }else{
        Import-VisualStudioVars;
    }
    cmake --build ./ 
}

function cdd { cd d: }
function cdc { cd c: }

function gr($key) { 
    grep --color=auto -n -r $key
}

function findn($key) {
    Get-ChildItem -r $key
}

$zlua_path = Join-Path $HOME "z.lua"
$zlua_url = "https://raw.githubusercontent.com/skywind3000/z.lua/master/z.lua"
if (!(Test-Path($zlua_path)))
{
    Invoke-WebRequest $zlua_url -OutFile $zlua_path
}

Invoke-Expression (& { (lua $zlua_path --init powershell) -join "`n" })

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -Colors @{ InlinePrediction = '#2a6b3f'}
Set-PSReadLineOption -HistorySearchCursorMovesToEnd

Set-PSReadLineKeyHandler -Chord "Ctrl+p" -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Chord "Ctrl+n" -Function HistorySearchForward
Set-PSReadLineKeyHandler -Chord "Ctrl+e" -Function ForwardChar
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord

$PSDefaultParameterValues['Out-File:Encoding'] = 'utf8'
