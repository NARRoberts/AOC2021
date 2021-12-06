$inp = Get-Content  c:\AOC2021\Day6Input.txt

$inp

$tempfish = $inp.Split(',')
$fish = [System.Collections.ArrayList]::new()
foreach($t in $tempfish)
{
    $fish.Add([System.Convert]::ToInt64($t))
}

for ($i = 1; $i -le 256; $i++)
{
    $nf = $fish.Clone()
    $lim = $nf.count
    for ($x = 0; $x -lt $lim; $x++)
    {
        if ($nf[$x] -eq 0)
        {
            $nf.add(8)
            $nf[$x] = 6
        }
        else {
            $nf[$x]--

        }

    }
    $fish.Clear() 
    $fish = $nf.clone() 
    $nf = $null
}

$fish.Count
