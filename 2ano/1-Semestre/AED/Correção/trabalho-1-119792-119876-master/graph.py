import pandas as pd
import matplotlib.pyplot as plt

# Load the data
data = pd.read_csv('ops_logOpt.csv')  # Replace with your CSV path
basic_data = pd.read_csv('ops_logBasic.csv')  # Replace with your CSV path for the overall line
print(basic_data['Size'])

# Extract specific scenarios
best_case = data[data['Scenario'] == 'best']
worst_case = data[data['Scenario'] == 'worst']
intermediate_cases = data[data['Scenario'] == 'intermediate']

# Calculate average for intermediate cases
intermediate_avg = intermediate_cases.groupby('Size')['ANDOps'].mean().reset_index()

# Plotting
plt.figure(figsize=(10, 6))

# Best case line
plt.plot(best_case['Size'], best_case['ANDOps'], label='Best Case', marker='o', linestyle='-', color='blue')

# Worst case line
plt.plot(worst_case['Size'], worst_case['ANDOps'], label='Worst Case', marker='o', linestyle='-', color='orange')

# Intermediate cases points
plt.scatter(intermediate_cases['Size'], intermediate_cases['ANDOps'], label='Intermediate Cases', color='grey', alpha=0.7)

# Intermediate average line
plt.plot(intermediate_avg['Size'], intermediate_avg['ANDOps'], label='Intermediate Average', linestyle='--', color='green', marker='o')

# Add the single line for all new values
plt.plot(basic_data['Size'], basic_data['ANDOps'], label='ImageANDUncompressed', linestyle='-', color='red', marker='x')

# Customize the plot
plt.title('AND Operations vs. Image Size')
plt.xlabel('Image Size (pixels)')
plt.ylabel('Number of AND Operations (ANDOps)')
plt.legend(loc='upper left')
plt.grid(which='both', linestyle='--', linewidth=0.5)

# Show the plot
plt.tight_layout()
plt.show()
