﻿
Import-Module posh-git
Import-Module VSSetup
Import-Module Pscx
Import-Module PSReadLine

function gst { git status }

function gd { git diff }

function gcmi($msg){
    git commit -m $msg
}

function glg($num_log) {
    if ($num_log -eq $null) {
        $num_log = 10;
    }
    git log --oneline -n $num_log
}

function gaa(){
    git add --all
}

function gds(){
    git diff --staged
}

function gcma(){
    git commit -a;
}

function amend(){
    git commit --amend
}

function conaninse {conan install .. -o example=True}

function cmakeE {cmake .. -DBUILD_EXAMPLE=1}

function make { cmake --build ./ }

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

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -Colors @{ InlinePrediction = '#875f5f'}


Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
