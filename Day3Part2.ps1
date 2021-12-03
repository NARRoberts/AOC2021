$datastart = Get-Content .\Day3Input.txt

$data = $datastart

$size = $data[0].Length

$it = 0

$newdata = [System.Collections.ArrayList]::new()

while ($it -le $size)
{
    if ($data.Count -eq 1)
    {
        break
    }
    $ones = 0
    $zeros = 0
    foreach($item in $data)
    {
        if ($item[$it] -eq '0')
        {
            $zeros++
        }
        else
        {
            $ones++
        }
    }

    if ($ones -ge $zeros)
    {
        $need = "1"
    }
    else
    {
        $need = "0"
    }
    foreach ($item in $data)
    {
        if ($item[$it] -eq $need)
        {
            $newdata.Add($item)
        }
    }

    $data = $newdata.Clone()
    $newdata.Clear()

    $it++
}

$Oxigen = $data[0]

$data = $datastart
$it = 0

$newdata = [System.Collections.ArrayList]::new()

while ($it -le $size)
{
    if ($data.Count -eq 1)
    {
        break
    }
    $ones = 0
    $zeros = 0
    foreach($item in $data)
    {
        if ($item[$it] -eq '0')
        {
            $zeros++
        }
        else
        {
            $ones++
        }
    }

    if ($ones -ge $zeros)
    {
        $need = "0"
    }
    else
    {
        $need = "1"
    }
    foreach ($item in $data)
    {
        if ($item[$it] -eq $need)
        {
            $newdata.Add($item)
        }
    }

    $data = $newdata.Clone()
    $newdata.Clear()

    $it++
}

$CO2 = $data[0]

$OxigenNum = [convert]::ToInt32($Oxigen,2)
$CO2Num = [convert]::ToInt32($CO2,2)

$OxigenNum
$CO2Num
($OxigenNum * $CO2Num)
