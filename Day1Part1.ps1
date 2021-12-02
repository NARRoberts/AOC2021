$data = Get-Content .\Day1Input.txt

$Depth = $data[0]

$Result = 0

foreach($Val in $data)
{
    if ($Val -gt $Depth)
    {
        $Result++
    }
    $Depth = $Val
}

$Result