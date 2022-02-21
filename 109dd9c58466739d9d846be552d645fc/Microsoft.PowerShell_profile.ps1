
Import-Module posh-git

function gst { git status }
function gdf { git diff }
function glg { git log --oneline}

function cmkb { cmake --build ./ }

function cdd { cd d: }
function cdc { cd c: }

function gr($key) { 
    grep --color=auto -n -r $key
}
