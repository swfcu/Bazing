$file = 'C:\flex\temp\test\dailyaccts.csv'

$CsvInput = Import-Csv -LiteralPath $file
$CsvOutput = New-Object -TypeName "System.Collections.ArrayList"
$Count = 0


foreach ($row in $CsvInput)
{
    if ($row.Account -eq "") {break}
    
     $params = @{
        Type = $row.'Share: Type'
        OpenDate = $row.'Share: Open Date'
        BranchCode = $row.'Account: Branch Code'
        Email = $row.Email
        FirstName = $row.First
        Last = $row.Last
        Zip = $row.Zip
    }
    $count = $count + 1

    $CsvOutput += @($params.Type, $params.OpenDate, $params.BranchCode,
    $params.Email, $params.FirstName, $params.Last, $params.Zip -join',' ) 

   
}  

 Add-Content -Path 'c:\flex\temp\test\newcsv2.csv' -Value $CsvOutput

 #Add-Content -Path 'c:\flex\temp\test\newcsv2.csv' -Value  $($row.'Share: Type' , $row.'Share: Open Date' -join "," )

 








