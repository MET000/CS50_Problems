import csv
import sys


def main():

    # Check for command-line usage
    if len(sys.argv) != 3:
        print("Please provide a database and a DNA sequence")
        sys.exit(1)

    # Read database file into a variable
    database_data = []
    strs = []
    with open(sys.argv[1]) as file:
        reader = csv.DictReader(file)
        fields = reader.fieldnames
        for field in fields:
            if field == "name":
                continue
            strs.append(field)

        for row in reader:
            database_data.append(row)

    # Read DNA sequence file into a variable
    sequence = ""
    with open(sys.argv[2]) as seq_file:
        reader_seq = csv.reader(seq_file)
        for row in reader_seq:
            sequence = row[0]

    # Find longest match of each STR in DNA sequence
    longest_strs = {}

    for str in strs:
        longest_strs[str] = longest_match(sequence, str)

    # Check database for matching profiles
    number_strs = len(strs)
    for person in database_data:
        counter = 0
        for j in longest_strs:
            if int(longest_strs[j]) == int(person[j]):
                counter += 1

        if number_strs == counter:
            sys.exit(person["name"])

    print("No match")


def longest_match(sequence, subsequence):
    """Returns length of longest run of subsequence in sequence."""

    # Initialize variables
    longest_run = 0
    subsequence_length = len(subsequence)
    sequence_length = len(sequence)

    # Check each character in sequence for most consecutive runs of subsequence
    for i in range(sequence_length):

        # Initialize count of consecutive runs
        count = 0

        # Check for a subsequence match in a "substring" (a subset of characters) within sequence
        # If a match, move substring to next potential match in sequence
        # Continue moving substring and checking for matches until out of consecutive matches
        while True:

            # Adjust substring start and end
            start = i + count * subsequence_length
            end = start + subsequence_length

            # If there is a match in the substring
            if sequence[start:end] == subsequence:
                count += 1

            # If there is no match in the substring
            else:
                break

        # Update most consecutive matches found
        longest_run = max(longest_run, count)

    # After checking for runs at each character in seqeuence, return longest run found
    return longest_run


main()
