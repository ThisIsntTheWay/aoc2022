using Day3;

internal class Program {
    private static void Main(string[] args) {
        // Import puzzle
        string[] Puzzle;
        try {
            Puzzle = System.IO.File.ReadAllLines(@"puzzle\input");
        } catch {
            Console.Error.WriteLine("Unable to read the input file.");
            throw;
        }

        // Part one
        int totalScore = 0;
        foreach (string line in Puzzle) {
            Backpack _ = new(line);
            totalScore += _.GetPriorityOfDuplicateItem();
        }

        Console.WriteLine("Total score: " + totalScore);
        Console.WriteLine(" ");

        // Part two
        var b = new BadgeIdentifier(Puzzle);
        b.GetBadgeItemTypeResult();
        Console.WriteLine("DONE");
    }
}