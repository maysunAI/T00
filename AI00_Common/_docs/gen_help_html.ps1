# gen_help_html.ps1 — T00_HELP.html generator

Add-Type -AssemblyName System.Web

$helpDir = "F:\T00\AI00_Common\_docs\help"
$outFile = "F:\T00\AI00_Common\_docs\T00_HELP.html"
$nl = [System.Environment]::NewLine

function H($tag, $content) { return "<$tag>" + $content + "</$tag>" }
function Enc($t) { return [System.Web.HttpUtility]::HtmlEncode($t) }

function InlineFmt($text) {
    $t = $text
    $t = [regex]::Replace($t, '`([^`]+)`', '<code>$1</code>')
    $t = [regex]::Replace($t, '\*\*([^*]+)\*\*', '<strong>$1</strong>')
    $t = [regex]::Replace($t, '\*([^*]+)\*', '<em>$1</em>')
    # H*.md 链接 → 内部导航
    $t = [regex]::Replace($t, '\[([^\]]+)\]\((H\d+[^)]*?)\.md\)', {
        param($m)
        $label = $m.Groups[1].Value
        $target = $m.Groups[2].Value
        '<a href="#" class="hlink" onclick="showSec(''' + $target + ''');return false">' + $label + '</a>'
    })
    # 其他链接正常处理
    $t = [regex]::Replace($t, '\[([^\]]+)\]\(([^)]+)\)', '<a href="$2" target="_blank">$1</a>')
    # 裸露的 H\d+ 引用（如「参见 H05」「见 H32」）→ 内部链接
    $t = [regex]::Replace($t, '\b(H\d{2})(?=[^_\w]|$)', {
        param($m)
        $hnum = $m.Groups[1].Value
        '<a href="#" class="hlink" onclick="showSec(''' + $hnum + ''');return false">' + $hnum + '</a>'
    })
    return $t
}

function BuildTable($rows) {
    if ($rows.Count -lt 2) { return "" }
    $out = "<table>"
    $isHeader = $true
    foreach ($row in $rows) {
        if ($row -match '^\|[-| :]+\|') { $isHeader = $false; continue }
        $cells = ($row.Trim().Trim('|')) -split '\|'
        if ($isHeader) {
            $out += "<thead><tr>"
            foreach ($c in $cells) { $out += "<th>" + (InlineFmt $c.Trim()) + "</th>" }
            $out += "</tr></thead><tbody>"
            $isHeader = $false
        } else {
            $out += "<tr>"
            foreach ($c in $cells) { $out += "<td>" + (InlineFmt $c.Trim()) + "</td>" }
            $out += "</tr>"
        }
    }
    $out += "</tbody></table>"
    return $out
}

function MdToHtml($md) {
    $lines = $md -split "`r?`n"
    $out = ""
    $inCode = $false
    $codeAcc = ""
    $inTable = $false
    $tableRows = [System.Collections.Generic.List[string]]::new()
    $inList = $false

    foreach ($line in $lines) {
        # code fence
        if ($line -match '^```') {
            if ($inCode) {
                $enc = Enc($codeAcc.TrimEnd())
                $out += "<pre><code>" + $enc + "</code></pre>"
                $codeAcc = ""; $inCode = $false
            } else {
                if ($inList) { $out += "</ul>"; $inList = $false }
                if ($inTable) { $out += BuildTable $tableRows; $tableRows.Clear(); $inTable = $false }
                $inCode = $true
            }
            continue
        }
        if ($inCode) { $codeAcc += $line + "`n"; continue }

        # table
        if ($line -match '^\|') {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $tableRows.Add($line); $inTable = $true; continue
        } elseif ($inTable) {
            $out += BuildTable $tableRows; $tableRows.Clear(); $inTable = $false
        }

        # headings
        if ($line -match '^# (.+)') {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $out += "<h1>" + (InlineFmt $Matches[1]) + "</h1>"; continue
        }
        if ($line -match '^## (.+)') {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $out += "<h2>" + (InlineFmt $Matches[1]) + "</h2>"; continue
        }
        if ($line -match '^### (.+)') {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $out += "<h3>" + (InlineFmt $Matches[1]) + "</h3>"; continue
        }
        if ($line -match '^#### (.+)') {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $out += "<h4>" + (InlineFmt $Matches[1]) + "</h4>"; continue
        }

        # hr
        if ($line -match '^---+$' -or $line -match '^===+$') {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $out += "<hr>"; continue
        }

        # blockquote
        if ($line -match '^> (.*)') {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $out += "<blockquote>" + (InlineFmt $Matches[1]) + "</blockquote>"; continue
        }

        # list
        if ($line -match '^[-*+] (.+)' -or $line -match '^\d+\. (.+)') {
            if (-not $inList) { $out += "<ul>"; $inList = $true }
            $out += "<li>" + (InlineFmt $Matches[1]) + "</li>"; continue
        }

        # blank
        if ($line.Trim() -eq "") {
            if ($inList) { $out += "</ul>"; $inList = $false }
            $out += "<br>"; continue
        }

        # paragraph
        if ($inList) { $out += "</ul>"; $inList = $false }
        $out += "<p>" + (InlineFmt $line) + "</p>"
    }

    if ($inList) { $out += "</ul>" }
    if ($inTable) { $out += BuildTable $tableRows }
    if ($inCode) { $out += "<pre><code>" + (Enc $codeAcc) + "</code></pre>" }
    return $out
}

# Read files
$files = Get-ChildItem $helpDir -Filter "H*.md" | Sort-Object Name
$tocItems = ""
$sections = ""

foreach ($f in $files) {
    $n = $f.BaseName
    $label = $n -replace 'H\d+_','' -replace '_',' '
    $tocItems += "<li><a href='#' onclick=`"showSec('$n');return false`">$n — $label</a></li>"

    $md = Get-Content $f.FullName -Raw -Encoding UTF8
    $body = MdToHtml $md

    $sections += "<section id='sec_$n' class='sec'>"
    $sections += "<div class='sec-hdr'><span>$n</span><a href='#' onclick=`"showHome();return false`">▲ 索引</a></div>"
    $sections += $body
    $sections += "</section>"
}

$css = @'
*{box-sizing:border-box;margin:0;padding:0}
body{font-family:-apple-system,'Hiragino Sans','PingFang SC',sans-serif;font-size:15px;line-height:1.7;background:#f5f5f5;color:#333}
#bar{position:sticky;top:0;background:#1a1a2e;color:#fff;padding:10px 14px;display:flex;align-items:center;gap:10px;z-index:100;box-shadow:0 2px 6px rgba(0,0,0,.3)}
#bar h1{font-size:16px;flex:1;cursor:pointer}
#sb{padding:6px 12px;border-radius:20px;border:none;font-size:14px;width:170px;background:rgba(255,255,255,.15);color:#fff}
#sb::placeholder{color:rgba(255,255,255,.5)}
#sb:focus{outline:none;background:rgba(255,255,255,.25)}
#clr{background:none;border:none;color:rgba(255,255,255,.6);font-size:18px;cursor:pointer;padding:0 2px}
#home{padding:16px}
#home h2{color:#1a1a2e;margin:14px 0 10px;font-size:15px}
#toc{list-style:none;background:#fff;border-radius:10px;overflow:hidden;box-shadow:0 1px 4px rgba(0,0,0,.1)}
#toc li a{display:block;padding:11px 16px;color:#333;text-decoration:none;border-bottom:1px solid #f0f0f0;font-size:14px}
#toc li a:hover{background:#e8f0fe;color:#1a1a2e}
#sr{display:none;padding:16px}
#sr h2{font-size:14px;color:#555;margin-bottom:12px}
.si{background:#fff;border-radius:8px;padding:12px;margin-bottom:10px;cursor:pointer;box-shadow:0 1px 3px rgba(0,0,0,.08)}
.si:hover{background:#e8f0fe}
.si b{color:#1a1a2e;font-size:14px}
.si p{font-size:13px;color:#666;margin-top:4px}
mark{background:#fff176;padding:0 2px;border-radius:2px}
.sec{display:none;padding:16px}
.sec.on{display:block}
.sec-hdr{display:flex;justify-content:space-between;align-items:center;margin-bottom:12px;padding-bottom:8px;border-bottom:2px solid #1a1a2e}
.sec-hdr span{font-weight:700;color:#1a1a2e;font-size:13px}
.sec-hdr a{font-size:13px;color:#666;text-decoration:none}
.sec h1{font-size:19px;color:#1a1a2e;margin:14px 0 6px}
.sec h2{font-size:16px;color:#2c3e50;margin:12px 0 5px;padding-left:8px;border-left:3px solid #4a90d9}
.sec h3{font-size:15px;color:#444;margin:10px 0 4px}
.sec h4{font-size:14px;color:#555;margin:8px 0 3px}
.sec p{margin:5px 0}
.sec ul{margin:5px 0 5px 20px}
.sec li{margin:3px 0}
.sec hr{border:none;border-top:1px solid #e0e0e0;margin:10px 0}
.sec blockquote{background:#fff8e1;border-left:4px solid #ffc107;padding:8px 12px;margin:8px 0;border-radius:0 6px 6px 0;font-size:14px}
.sec pre{background:#1e1e1e;color:#d4d4d4;padding:12px;border-radius:8px;overflow-x:auto;margin:8px 0;font-size:12.5px;line-height:1.5}
.sec code{background:#f0f0f0;padding:1px 5px;border-radius:3px;font-size:13px;font-family:Menlo,Consolas,monospace}
.sec pre code{background:none;padding:0;color:#d4d4d4}
.sec table{width:100%;border-collapse:collapse;margin:8px 0;font-size:13px}
.sec th{background:#1a1a2e;color:#fff;padding:7px;text-align:left}
.sec td{padding:6px 8px;border-bottom:1px solid #e0e0e0}
.sec tr:nth-child(even) td{background:#f9f9f9}
.sec a{color:#4a90d9}
.hlink{color:#1a7fe8;text-decoration:underline dotted;font-weight:500}
.badge{background:#4a90d9;color:#fff;border-radius:12px;padding:2px 8px;font-size:12px;margin-left:6px}
#nores{color:#888;font-size:14px;text-align:center;padding:30px}
'@

$js = @'
const secs={};
document.querySelectorAll('.sec').forEach(e=>{
  secs[e.id]={title:e.id.replace('sec_',''),text:e.innerText};
});
function showHome(){
  document.getElementById('home').style.display='block';
  document.getElementById('sr').style.display='none';
  document.querySelectorAll('.sec').forEach(s=>s.classList.remove('on'));
  document.getElementById('sb').value='';
  window.scrollTo(0,0);
}
function showSec(n){
  document.getElementById('home').style.display='none';
  document.getElementById('sr').style.display='none';
  document.querySelectorAll('.sec').forEach(s=>s.classList.remove('on'));
  // 完整名称 or H编号前缀匹配
  let el=document.getElementById('sec_'+n);
  if(!el){
    const all=document.querySelectorAll('.sec');
    for(const s of all){if(s.id.startsWith('sec_'+n)){el=s;break;}}
  }
  if(el){el.classList.add('on');window.scrollTo(0,0);}
}
function doSearch(q){
  if(!q||q.length<2){showHome();return;}
  document.getElementById('home').style.display='none';
  document.querySelectorAll('.sec').forEach(s=>s.classList.remove('on'));
  const sr=document.getElementById('sr');
  sr.style.display='block';
  const ql=q.toLowerCase();
  let res=[];
  for(const[id,d] of Object.entries(secs)){
    const i=d.text.toLowerCase().indexOf(ql);
    if(i>=0){
      const s=Math.max(0,i-40),e=Math.min(d.text.length,i+80);
      let prev=d.text.slice(s,e).replace(/\n/g,' ').trim();
      const re=new RegExp(q.replace(/[.*+?^${}()|[\]\\]/g,'\\$&'),'gi');
      prev=prev.replace(re,m=>'<mark>'+m+'</mark>');
      res.push({id,title:d.title,prev});
    }
  }
  if(!res.length){sr.innerHTML='<div id="nores">没有找到「'+q+'」相关内容</div>';return;}
  let h='<h2>搜索「'+q+'」<span class="badge">'+res.length+'篇</span></h2>';
  res.forEach(r=>{
    const name=r.id.replace('sec_','');
    h+='<div class="si" onclick="showSec(\''+name+'\')"><b>'+r.title+'</b><p>...'+r.prev+'...</p></div>';
  });
  sr.innerHTML=h;
}
'@

$html = "<!DOCTYPE html><html lang='zh'><head><meta charset='UTF-8'><meta name='viewport' content='width=device-width,initial-scale=1.0'><title>T00 帮助文档</title><style>" + $css + "</style></head><body>"
$html += "<div id='bar'><h1 onclick='showHome()'>📖 T00 Help</h1><input id='sb' type='search' placeholder='搜索帮助内容...' oninput='doSearch(this.value)' autocomplete='off'><button id='clr' onclick='showHome()'>✕</button></div>"
$html += "<div id='home'><h2>帮助文档索引 <span class='badge'>" + $files.Count + "篇</span></h2><ul id='toc'>" + $tocItems + "</ul></div>"
$html += "<div id='sr'></div>"
$html += $sections
$html += "<script>" + $js + "</script></body></html>"

[System.IO.File]::WriteAllText($outFile, $html, [System.Text.Encoding]::UTF8)
$sz = [math]::Round((Get-Item $outFile).Length / 1KB, 1)
Write-Host "OK: $outFile ($sz KB, $($files.Count) files)"
