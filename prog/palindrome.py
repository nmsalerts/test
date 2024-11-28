def is_palindrome(s):  # Function to check for palindrome
    s = s.lower().replace(" ", "")  # Normalize string (lowercase, remove spaces)
    return s == s[::-1]  # Compare string with its reverse

s = str(input("enter the string:"))

print(is_palindrome(s))  # Example usage
