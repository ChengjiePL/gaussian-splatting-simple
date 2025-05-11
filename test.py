from OpenGL.GL import *
from OpenGL.GLUT import *
from OpenGL.GLU import *

glutInit()
glutCreateWindow('OpenGL Test')
print(glGetString(GL_VERSION))

