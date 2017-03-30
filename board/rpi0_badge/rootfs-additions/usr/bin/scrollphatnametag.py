#!/usr/bin/env python

import scrollphat
import time

scrollphat.set_brightness(10)
scrollphat.set_rotate(scrollphat.ROTATE_180)
scrollphat.write_string("My name is Alexa aka Cannibalistic Avocado. ")

while True:
    scrollphat.scroll()
    time.sleep(.1)

