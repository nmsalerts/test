# Function to check even or odd
def check_even_or_odd(num):
    if num % 2 == 0:
        return "Even"
    else:
        return "Odd"

# Input from the user
number = int(input("Enter a number: "))

# Check and display the result
result = check_even_or_odd(number)
print(f"The number {number} is {result}.")
