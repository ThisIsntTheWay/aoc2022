$p = Get-Content .\input

$alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

$score = 0
$p | % {
    $compartments = @(
        ($_.Substring(0, $_.length / 2))
        ($_.Substring($_.length / 2))
    )

    for ($i = 0; $i -lt $compartments[0].length; $i++) {
        $char = $compartments[0][$i]
        if ($compartments[1] -cmatch $char) {
            $score += $alphabet.IndexOf($char) + 1
            break
        }
    }
}

$score