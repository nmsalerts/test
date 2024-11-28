def factorial(n):  # Recursive function for factorial
    if n == 0 or n == 1:  # Base case
        return 1
    else:
        return n * factorial(n - 1)  # Recursive call

n = int(input("numbers: "))
print(factorial(n))  # Example usage