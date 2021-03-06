
Import-Module posh-git

function gst { git status }
function gdf { git diff }
function gcmi($msg){
    git commit -m $msg
}
function glg($num_log) {
    if ($num_log -eq $null) {
        $num_log = 10;
    }
    git log --oneline -n $num_log
}

function gcma(){
    git commit -a;
}

function cmkb { cmake --build ./ }

function cdd { cd d: }
function cdc { cd c: }

function gr($key) { 
    grep --color=auto -n -r $key
}

function findn($key) {
    Get-ChildItem -r $key
}
