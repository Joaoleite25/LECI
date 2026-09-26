import os
import subprocess

# Define test parameters
sizes = [8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096]  # Sizes of images (NxN)
scenarios = ["best", "worst"]
intermediate_patterns = [
    "vertical_stripes", 
    "horizontal_stripes", 
    "checkerboard_dense", 
    "checkerboard_sparse"
]
output_folder = "pbm_tests"
results_folder = "results"
ops_log = "ops_logBasic.csv"

# Create necessary directories
os.makedirs(output_folder, exist_ok=True)
os.makedirs(results_folder, exist_ok=True)

# Utility function to create PBM images
def create_pbm_image(file_path, pattern, size):
    width, height = size, size
    if pattern == "best":
        # Best case: Uniform white and black images
        with open(file_path, "wb") as f:
            f.write(f"P4\n{width} {height}\n".encode())
            f.write(bytes([0x00] * (width // 8) * height))  # All white
    elif pattern == "worst":
        # Worst case: Checkerboard pattern
        with open(file_path, "wb") as f:
            f.write(f"P4\n{width} {height}\n".encode())
            for y in range(height):
                row = bytearray()
                for x in range(width // 8):
                    row.append(0xAA if y % 2 == 0 else 0x55)  # Alternating rows
                f.write(row)
    elif pattern == "vertical_stripes":
        # Intermediate case: Vertical stripes
        with open(file_path, "wb") as f:
            f.write(f"P4\n{width} {height}\n".encode())
            for y in range(height):
                row = bytearray([0xF0 if (y // 5) % 2 == 0 else 0x0F] * (width // 8))
                f.write(row)
    elif pattern == "horizontal_stripes":
        # Intermediate case: Horizontal stripes
        with open(file_path, "wb") as f:
            f.write(f"P4\n{width} {height}\n".encode())
            for y in range(height):
                row_value = 0xFF if (y // 5) % 2 == 0 else 0x00
                row = bytearray([row_value] * (width // 8))
                f.write(row)
    elif pattern == "checkerboard_dense":
        # Intermediate case: Dense checkerboard pattern
        with open(file_path, "wb") as f:
            f.write(f"P4\n{width} {height}\n".encode())
            for y in range(height):
                row = bytearray()
                for x in range(width // 8):
                    row.append(0xAA if y % 2 == 0 else 0x55)
                f.write(row)
    elif pattern == "checkerboard_sparse":
        # Intermediate case: Sparse checkerboard pattern
        with open(file_path, "wb") as f:
            f.write(f"P4\n{width} {height}\n".encode())
            for y in range(height):
                row = bytearray()
                for x in range(width // 8):
                    row.append(0x88 if y % 2 == 0 else 0x22)  # Sparse checkerboard
                f.write(row)
    print(f"Generated {pattern} case: {file_path}")

# Function to run imageBWTool and extract ANDOPs
def run_and_test(scenario, size, pattern=None):
    if pattern:
        scenario_name = f"intermediate_{pattern}"
    else:
        scenario_name = scenario

    input1 = f"{output_folder}/{scenario_name}_input1_{size}.pbm"
    input2 = f"{output_folder}/{scenario_name}_input2_{size}.pbm"
    output = f"{results_folder}/{scenario_name}_output_{size}.pbm"

    # Generate images
    create_pbm_image(input1, pattern if pattern else scenario, size)
    create_pbm_image(input2, pattern if pattern else scenario, size)

    # Run the imageBWTool command
    command = f"./imageBWTool {input1} {input2} and save {output}"
    print(f"Running: {command}")
    process = subprocess.run(command, shell=True, capture_output=True, text=True)

    if process.returncode == 0:
        print(f"Test successful for {scenario_name} case with size {size}")
        # Extract ANDOPs from the output
        for line in process.stdout.splitlines():
            if "AND operations (ANDOP)" in line:  # Replace with the actual message from your program
                and_ops = int(line.split(":")[1].strip())
                return and_ops
    else:
        print(f"Error for {scenario_name} case with size {size}")
        print(process.stderr)
        return None

# Main function to execute tests
def main():
    # Prepare log file
    with open(ops_log, "w") as log_file:
        log_file.write("Scenario,Size,ANDOps\n")

    # Run tests for best and worst cases
    for size in sizes:
        for scenario in scenarios:
            and_ops = run_and_test(scenario, size)
            if and_ops is not None:
                # Log results
                with open(ops_log, "a") as log_file:
                    log_file.write(f"{scenario},{size},{and_ops}\n")

    # Run tests for multiple intermediate cases
    for size in sizes:
        for pattern in intermediate_patterns:
            and_ops = run_and_test("intermediate", size, pattern)
            if and_ops is not None:
                # Log results
                with open(ops_log, "a") as log_file:
                    log_file.write(f"intermediate_{pattern},{size},{and_ops}\n")

if __name__ == "__main__":
    main()
