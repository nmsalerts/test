# Recursive function to get nth Fibonacci number
def fibonacci_recursive(n):
    if n <= 1:
        return n
    return fibonacci_recursive(n - 1) + fibonacci_recursive(n - 2)

# Input from the user
n = int(input("Enter the number of terms: "))

# Generate and display the Fibonacci sequence
print("Fibonacci sequence:", [fibonacci_recursive(i) for i in range(n)])
