#!/bin/bash

import cv2
import numpy as np
from tkinter import Tk, Button

def check_image():
    screenshot = cv2.imread('Screenshot.png')
    screenshot2 = cv2.imread('Failed.png')
    screenshot3 = cv2.imread('Quit.png')
    template = cv2.imread('TapScreen.png')
    template2 = cv2.imread('NextQuest.png')
    template3 = cv2.imread('Home.png')
    template4 = cv2.imread('Ok.png')
    result = cv2.matchTemplate(screenshot, template, cv2.TM_CCOEFF_NORMED)
    result2 = cv2.matchTemplate(screenshot, template, cv2.TM_CCOEFF_NORMED)

    threshold = 0.9
    locations = np.where(result >= threshold)

    if len(locations[0]) > 0:
        print(f"Found a match at: {list(zip(*locations[::-1]))}")
    else:
        print("No match found.")

root = Tk()
root.title("Image Checker")

button = Button(root, text="Check Image", command=check_image)
button.pack(pady=20)

root.mainloop()
