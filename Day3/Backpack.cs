using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Day3
{
    internal class Backpack {
        private string alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
        private char duplicateItem;
        private List<string> compartments;

        public List<string> Compartments { get { return compartments; } }

        public Backpack(string Contents) {
            this.compartments = new List<string>();

            // Compartments are evenly split at half
            string comp1 = Contents.Substring(0, Contents.Length / 2);
            string comp2 = Contents.Substring(Contents.Length / 2);

            this.compartments.Add(comp1);
            this.compartments.Add(comp2);
        }

        private void identifyDuplicateItem() {
            char[] compA = this.compartments[0].ToCharArray();
            foreach (char c in compA) {
                if (this.compartments[1].Contains(char.ToString(c))) {
                    this.duplicateItem = c;
                }
            }
        }

        public int GetPriorityOfDuplicateItem() {
            this.identifyDuplicateItem();
            return alphabet.IndexOf(this.duplicateItem) + 1;
        }
    }
}
