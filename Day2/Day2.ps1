$puzzleInput = Get-Content .\input

<#
    Opponent moves:
    A = Rock
    B = Paper
    C = Scissors

    Proposed moves:
    X = Rock
    Y = Paper
    Z = Scissors

    Points:
    Round lost  = 0
    Round draw  = 3
    Round won   = 6
#>

$moves = @{
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
    "A" = $moves.Rock
    "X" = $moves.Rock
    "B" = $moves.Paper
    "Y" = $moves.Paper
    "C" = $moves.Scissors
    "Z" = $moves.Scissors
}

$movePoints = @{
    Rock = 1
    Paper = 2
    Scissors = 3
}

function EnumerateResult ($proposal, $opponent) {
    # 0 = loss, 1 = draw, 2 = win

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

# Part one
$points = 0
$puzzleInput | % {
    # Get moves
    $opponent = $_.split(" ")[0]
    $proposal = $_.split(" ")[1]
    
    # Write-Host "> $_ ($($moveSet.$opponent.Name) vs $($moveSet.$proposal.Name)) " -f cyan -NoNewline

    # Define outcome
    $result = EnumerateResult $proposal $opponent

    <#
        switch ($result) {
            0 { Write-Host "LOSS" -f red }
            1 { Write-Host "DRAW" -f yellow }
            2 { Write-Host "WIN" -f green }
        }
    #>

    $points += ($result * 3) + $moveSet.$proposal.Points
}

$points

# Part two TODO
function Get-Proposal ($opponent, $outcome) {
    [string]$proposal = ""

    switch ($outcome) {
        # Lose
        "X" {
            
        }

        # Draw
        "Y" {

        }

        # Win
        "Z" {

        }
    }

    return $proposal
}

$puzzleInput | % {
    # Get moves
    $opponent = $_.split(" ")[0]
    $outcome = $_.split(" ")[1]

    $result = EnumerateResult $proposal $opponent
    $points += ($result * 3) + $moveSet.$proposal.Points
}