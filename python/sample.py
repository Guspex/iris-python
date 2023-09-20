import numpy as np
import pandas as pd

def hello():
    return "world"

def meanage(filename):
    # Read data
    dataset = pd.read_csv(filename,";")

    # Set passenger ages to a NumPy array
    mean = dataset['ANNUAL']
    #print(mean)

    # Use numpy to calculate the mean age of passengers
    mean_age = np.nanmean(mean)

    #print(mean_age)

    return str(mean_age)