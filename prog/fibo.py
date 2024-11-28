def fibonacci(n):  # Function to generate Fibonacci sequence
    fib_sequence = [0, 1]  # Initial two numbers
    for i in range(2, n):  # Start from index 2 up to n
        fib_sequence.append(fib_sequence[-1] + fib_sequence[-2])  # Add last two numbers
    return fib_sequence[:n]  # Return the sequence up to 'n' terms

n = int(input("Enter the Number:"))
print(fibonacci(n))  # Example usage
