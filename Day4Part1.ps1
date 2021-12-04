function Check-Board
{

Param(
    [Parameter(Mandatory = $true)]
    [System.Collections.ArrayList]$Board
    )

    $won = $false

    for ($i = 0 ; $i -lt 5 ; $i++)
    {
        $sumX = 0
        for ($j = 0; $j -lt 5; $j++)
        {
            $sumX += $board[$i][$j]
        }
        if ($sumX -eq -5)
        {
            $won = $true
            break
        }
    }

    if (-not $won)
    {
        for ($i = 0 ; $i -lt 5 ; $i++)
        {
            $sumX = 0
            for ($j = 0; $j -lt 5; $j++)
            {
                $sumX += $board[$j][$i]
            }
            if ($sumX -eq -5)
            {
                $won = $true
                break
            }
        }
    }

    return $won
}

function Mark-Board
{

Param(
    [Parameter(Mandatory = $true)]
    [System.Collections.ArrayList]$Board,

    [Parameter(Mandatory = $true)]
    [Int32] $ball
    )

    for ($i = 0 ; $i -lt 5 ; $i++)
    {
        $sumX = 0
        $sumY = 0
        for ($j = 0; $j -lt 5; $j++)
        {
            if ($Board[$i][$j] -eq $ball)
            {
                $Board[$i][$j] = -1
            }
        }
    }
}


function Get-BoardValue
{

Param(
    [Parameter(Mandatory = $true)]
    [System.Collections.ArrayList]$Board
    )

    $total = 0
    for ($i = 0 ; $i -lt 5 ; $i++)
    {
        for ($j = 0; $j -lt 5; $j++)
        {
            if ($Board[$i][$j] -ne -1)
            {
                $total += $Board[$i][$j]
            }
        }
    }
    return $total
}






$input = Get-Content .\Day4Input.txt

$numbers = $input[0].Split(',')

$boardcount = ($input.Count -1 ) / 6
$boards = [System.Collections.ArrayList]::new()
$idx = 0

while ($idx -lt $boardcount)
{
    $thisboard = [System.Collections.ArrayList]::new()
    $lp = 2 + ($idx * 6)
    #("lp: " + $lp)
    $lidx = 0
    while ($lidx -lt 5)
    {
        if ($input[$lp + $lidx][0] -eq ' ')
        {
            $input[$lp + $lidx] = $input[$lp + $lidx].Substring(1)
        }
        $input[$lp + $lidx] = $input[$lp + $lidx].Replace('  ', ' ') 
        $line = $input[$lp + $lidx].Split(' ')
        #("Line val: " + $line)
        #("Line pos: " + ($lp + $lidx))
        $thisboard.Add($line)
        $lidx += 1
    }
    $boards.Add($thisboard)

    $idx += 1
}

<#
Get-BoardValue $boards[0]
Check-Board $boards[0]
Mark-Board $boards[0] -Ball 22
Get-BoardValue $boards[0]

#>

$wehavegotawinner = $false
$winningvalue = 0
foreach ($num in $numbers)
{
    for($board = 0; $board -lt $boards.Count; $board++)
    {
        Mark-Board $boards[$board] $num
        $res = Check-Board $boards[$board]
        if ($res)
        {
            ("We have a winner: Board # " + $board)
            $wehavegotawinner = $true
            $winningvalue = Get-BoardValue $boards[$board]
            $winningvalue *= $num
            break
        }
    }
    if ($wehavegotawinner)
    {
        break
    }

}

$winningvalue