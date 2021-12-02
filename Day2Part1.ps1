$data = Get-Content .\Day2Input.txt

$parsed = @()

foreach ($line in $data)
{
    $new = $line.Split(" ")
    $parsed += [pscustomobject]@{Action=$new[0];Value=$new[1]}
}

$Pos = 0
$Depth = 0

foreach ($move in $parsed)
{
    if ($move.Action -eq "forward")
    {
        $Pos += $move.Value
    }
    elseif ($move.Action -eq "down")
    {
        $Depth += $move.Value
    }
    else
    {
        $Depth -= $move.Value
    }
}

$Pos
$Depth
($Pos * $Depth)
