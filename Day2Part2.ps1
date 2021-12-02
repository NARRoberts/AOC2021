$data = Get-Content .\Day2Input.txt

$parsed = @()

foreach ($line in $data)
{
    $new = $line.Split(" ")
    $parsed += [pscustomobject]@{Action=$new[0];Value=$new[1]}
}

$Pos = 0
$Depth = 0
$Aim = 0

foreach ($move in $parsed)
{
    if ($move.Action -eq "forward")
    {
        $Pos += $move.Value
        $Depth += $Aim * $move.Value
    }
    elseif ($move.Action -eq "down")
    {
        $Aim += $move.Value
    }
    else
    {
        $Aim -= $move.Value
    }
}

$Pos
$Depth
($Pos * $Depth)
