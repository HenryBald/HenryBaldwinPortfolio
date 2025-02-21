import java.util.Scanner;

public class PigLatinConverter
{
    public static void main(String[] args)
    {
        Scanner scanner = new Scanner(System.in);

        // Prompt for user input + welcome message
        System.out.print("Welcome to the Pig Latin Converter!");
        System.out.print("Enter a word: ");
        String userInput = scanner.nextLine();

        // Convert user input to lowercase
        String lowercaseInput = userInput.toLowerCase();

        // Vowel set
        char[] vowels = {'a', 'e', 'i', 'o', 'u'};
        int index = -1;

        // Find the first vowel in the word
        for (int i = 0; i < lowercaseInput.length(); i++) {
            char letter = lowercaseInput.charAt(i);
            for (char vowel : vowels) {
                if (letter == vowel) {
                    index = i;
                    break;
                }
            }
            if (index != -1) {
                break;
            }
        }

        // Convert the word based on Pig Latin rules
        String pigLatinWord;
        if (index == 0) {  // Word starts with a vowel
            pigLatinWord = lowercaseInput + "way";
        } else if (index > 0) {  // Word starts with consonants
            pigLatinWord = lowercaseInput.substring(index) + lowercaseInput.substring(0, index) + "ay";
        } else {  // No vowels found (rare case)
            pigLatinWord = lowercaseInput + "ay";
        }

        // Print the Pig Latin version
        System.out.println("Pig Latin version: " + pigLatinWord);

        scanner.close();
    }
}