def is_armstrong(num):  # Function to check Armstrong number
    digits = [int(d) for d in str(num)]  # Convert number to a list of digits
    return sum(d**len(digits) for d in digits) == num  # Sum of each digit raised to the power of 'n'


num = int(input("Enter the Number:"))

print(is_armstrong(num))  # Example usage
