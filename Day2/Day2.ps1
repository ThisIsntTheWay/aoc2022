$puzzleInput = Get-Content .\input

$moveList = @{
    "Rock" = @{
        "Name" = "Rock"
        "Strength" = "Scissors"
        "Weakness" = "Paper"
        "Points" = 1
    }
    "Paper" = @{
        "Name" = "Paper"
        "Strength" = "Rock"
        "Weakness" = "Scissors"
        "Points" = 2
    }
    "Scissors" = @{
        "Name" = "Scissors"
        "Strength" = "Paper"
        "Weakness" = "Rock"
        "Points" = 3
    }
}

$moveSet = @{
    "A" = $moveList.Rock
    "X" = $moveList.Rock
    "B" = $moveList.Paper
    "Y" = $moveList.Paper
    "C" = $moveList.Scissors
    "Z" = $moveList.Scissors
}

function Get-Result ($proposal, $opponent, [switch]$RealMoveNames) {
    if ($RealMoveNames.IsPresent) {
        # Loss
        if ($moveList.$proposal.Weakness -eq $opponent) {
            return 0
        }

        # Draw
        if ($moveList.$proposal -eq $moveList.$opponent) {
            return 1
        }

        # Win
        if ($moveList.$proposal.Strength -eq $opponent) {
            return 2
        }
    } else {
        # Loss
        if ($moveSet.$proposal.Weakness -eq $moveSet.$opponent.Name) {
            return 0
        }
    
        # Draw
        if ($moveSet.$proposal -eq $moveSet.$opponent) {
            return 1
        }
    
        # Win
        if ($moveSet.$proposal.Strength -eq $moveSet.$opponent.Name) {
            return 2
        }
    }
}

# Part one
$points = 0
$puzzleInput | % {
    # Get moves
    $opponent = $_.split(" ")[0]
    $proposal = $_.split(" ")[1]

    # Define outcome
    $result = Get-Result $proposal $opponent

    $points += ($result * 3) + $moveSet.$proposal.Points
}

$points

# Part two
function Get-Proposal ($opponent, $outcome) {
    switch ($outcome) {
        # Lose
        "X" {
            return $moveSet.$opponent.Strength
        }

        # Draw
        "Y" {
            return $moveSet.$opponent.Name
        }

        # Win
        "Z" {
            return $moveSet.$opponent.Weakness
        }
    }
}

$points = 0
$puzzleInput | % {
    $opponent = $_.split(" ")[0]
    $outcome = $_.split(" ")[1]

    $proposal = Get-Proposal $opponent $outcome

    $result = Get-Result $proposal $moveSet.$opponent.Name -RealMoveNames
    $points += ($result * 3) + $moveList.$proposal.Points
}

$points