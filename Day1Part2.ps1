$data = Get-Content .\Day1Input.txt

$end = $data.Count - 2


$current = $data[0] + $data[1] + $data[2]

$Result = 0

$idx = 1

while ($idx -lt $end)
{
    $this = $data[$idx] + $data[$idx+1] + $data[$idx + 2]
    if ($this -gt $current)
    {
        $Result++
    }
    $current = $this
    $idx++
}


$Result