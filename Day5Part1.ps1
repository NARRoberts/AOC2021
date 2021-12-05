$rawinput = Get-Content .\Day5Input.txt

function SplitLineInput
{

Param(
    [Parameter(Mandatory = $true)]
    [string]$RawLine
    )

    $Line = [System.Collections.ArrayList]::new()
    $t = $RawLine.Split(' ')
    $Line.Add($t[0].Split(',')) | Out-Null
    $Line.Add($t[2].Split(',')) | Out-Null

    return $Line
}

function DumpGrid
{
    for ($y = 0; $y -lt 10; $y++)
    {
        $line = ""
        for ($x = 0; $x -lt 10; $x++)
        {
            if ($grid[$x][$y] -eq 0)
            {
                $line += "."
            }
            else
            {
                $line += [Convert]::ToString($grid[$x][$y])
            }
        }
        $line
    }

}


#Build Grid - I hate powershell arrays

$Grid = [System.Collections.ArrayList]::new()
$Line = [System.Collections.ArrayList]::new()

for ($i = 0; $i -lt 1000; $i++) { $Line.Add([int32]0) | Out-Null }

for ($i = 0; $i -lt 1000; $i++) { $Grid.Add($Line.Clone()) | Out-Null }

#$Grid.Count


foreach ($_ in $rawinput)
{
    $Line = SplitLineInput $_

    #Check horizontal
    if ($Line[0][0] -eq $Line[1][0])
    {
        $from = [Math]::Min($Line[0][1],$Line[1][1])
        $to = [Math]::Max($Line[0][1],$Line[1][1])

        for ([int32]$i = $from; $i -le $to; $i++)
        {
            $Grid[$Line[0][0]][$i] += 1
        }

    }
    elseif ($Line[0][1] -eq $Line[1][1])  #Check vertical
    {
        $from = [Math]::Min($Line[0][0],$Line[1][0])
        $to = [Math]::Max($Line[0][0],$Line[1][0])

        for ([int32]$i = $from; $i -le $to; $i++)
        {
            $Grid[$i][$Line[0][1]] += 1
        }
    }
}

#Find -gt 1
$count = 0
for ($y = 0; $y -lt 1000; $y++)
{
    for ($x = 0; $x -lt 1000; $x++)
    {
        if ($Grid[$y][$x] -gt 1)
        {
            $count++
        }
    }
}

$count
DumpGrid