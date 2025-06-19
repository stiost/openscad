from sympy import symbols, Eq, solve, N

# Given values
a = 531.2
b = 377.4
c = 622.3
d = 60

# Define symbols
x, y = symbols('x y')

# Equations based on distances
eq1 = Eq(x**2 + y**2, c**2)
eq2 = Eq((x - a)**2 + (y - b)**2, d**2)

# Solve
solutions = solve((eq1, eq2), (x, y))
solutions_numerical = [(N(sol[0]), N(sol[1])) for sol in solutions]

# Print results
for sol in solutions_numerical:
    print(f"D = ({sol[0]:.4f}, {sol[1]:.4f})")

