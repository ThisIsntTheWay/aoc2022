using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3 {
    internal class BadgeIdentifier {
        private string alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        private string[] contents;

        public BadgeIdentifier(string[] Contents) {
            this.contents = Contents;
        }

        public int GetBadgeItemTypeResult() {
            List<string> tempList = new List<string>();

            int currentIndex = 0; // + 3 after each processing
            int tempIndex = 0;    // May not exceed 2
            int badgeScore = 0;
            do {
                if (tempIndex <= 2) {
                    // Populate tempList with 3 entries
                    tempList.Add(this.contents[currentIndex + tempIndex]);
                    tempIndex++;
                } else {
                    currentIndex += 3;
                    tempIndex = 0;

                    // Do processing of tempList

                }
            } while (currentIndex < contents.Length);

            return badgeScore;
        }
    }
}
