class_name InputCheckerScript

## For stuff like QCF, DP, QCB, etc. etc.
## How many frames you can still hold the last direction input of a 
## motion input and still makes it register when pressing the attack
## e.g. holding forward for 30 frames after QCF and then LP will 
## still do fireball.
##  This is in frames
const MOTION_INPUT_BUFFER_WINDOW : float = 30
const DASH_TAP_WINDOW : float = 12
