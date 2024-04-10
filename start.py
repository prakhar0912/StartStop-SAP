import subprocess

output = subprocess.check_output(
    "pbrun -u {}adm -h {} SHELL".format("q37", "pepldr03113.pi.pvt"),
    shell=True,
)
outputFile = subprocess.check_output("whoami", shell=True)
print(outputFile)
