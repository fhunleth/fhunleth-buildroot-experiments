# Raspberry Pi SDCard Burner

This project creates an SDCard image that can be loaded on a Raspberry Pi
to make it an SDCard burning appliance. It is used at CoderDojoDC to reprogram
Raspberry Pi SDCards when they're corrupt or messed up and we don't want to
spend time repairing them.

It uses an [Adafruit PiTFT HAT](https://www.adafruit.com/products/2315) for
the user interface and a MicroSD card reader (e.g., like [this](https://www.monoprice.com/product?p_id=10068)).

The FAT filesystem contains the image to write. Currently it is hardcoded
to the Dexter Industries' image that we're using.

