# Function to generate Fibonacci sequence up to n terms
def fibonacci_iterative(n):
    fib_sequence = []
    a, b = 0, 1
    for _ in range(n):
        fib_sequence.append(a)
        a, b = b, a + b
    return fib_sequence

# Input from the user
n = int(input("Enter the number of terms: "))

# Generate and display the Fibonacci sequence
print("Fibonacci sequence:", fibonacci_iterative(n))
