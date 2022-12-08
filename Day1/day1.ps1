$puzzle = Get-Content .\input

# Part one
$results = @()
$thisResult = 0

$puzzleFilter = $puzzle.split("`n")
$puzzleFilter | % {
    if ([string]::IsNullOrEmpty($_)) {
        # new block begins
        $results += $thisResult
        $thisResult = 0
    } else {
        # still on the same block
        $thisResult += [int]$_
    }
}

($results | sort -desc)[0]

# Part two - Calories of top three elves
$topCalories = 0
($results | sort -desc)[0..2] | % {
    $topCalories += $_   
}

$topCalories