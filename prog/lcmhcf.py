# Function to compute HCF using the Euclidean algorithm
def compute_hcf(x, y):
    while y:
        x, y = y, x % y
    return x

# Function to compute LCM
def compute_lcm(x, y):
    hcf = compute_hcf(x, y)
    return (x * y) // hcf

# Input from the user
num1 = int(input("Enter the first number: "))
num2 = int(input("Enter the second number: "))

# Calculating HCF and LCM
hcf = compute_hcf(num1, num2)
lcm = compute_lcm(num1, num2)

# Displaying the results
print(f"HCF of {num1} and {num2} is: {hcf}")
print(f"LCM of {num1} and {num2} is: {lcm}")
