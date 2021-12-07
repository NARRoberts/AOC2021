$input = Get-Content .\Day7Input.txt
$data = $input.Split(',')

$dl = $data.Count

$results = [System.Collections.Generic.SortedSet[Int64]]::new()

for ($i = 0; $i -lt $dl; $i++)
{
    [int64]$res = 0
    for ($j = 0; $j -lt $dl; $j++)
    {
        #Part 1
        #$res += [Math]::Abs($data[$i] - $data[$j])

        #Part 2
        $temp = [Math]::Abs($data[$i] - $data[$j])
        $res += ($temp*($temp+1))/2

    }
    $results.Add($res) | Out-Null
}

$results.Min

