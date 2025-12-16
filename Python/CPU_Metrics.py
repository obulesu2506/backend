import psutil
#Get CPU Usage
cpu_usage = psutil.cpu_percent(interval=1)
print(f"CPU Usage: {cpu_usage}%")

#Memory Usage
mem_usage = psutil.virtual_memory()
print(f"Memory Usage: {memory.percent}%")

