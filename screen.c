#include "stdio.h"
#include <GL/freeglut.h>
#include <GLFW/glfw3.h>

static void RenderSceneCB()
{
    glClear(GL_COLOR_BUFFER_BIT);
    glutSwapBuffers();
}

static void InitializeGlutCallbacks()
{
    glutDisplayFunc(RenderSceneCB);
}

int main(int argc, char** argv) {
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH);
    glutInitWindowSize(1024, 768);
    glutInitWindowPosition(100, 100);
    glutCreateWindow("Tutorial 01");
    glutDisplayFunc(RenderSceneCB);
    glClearColor(255.0f, 0.0f, 0.0f, 0.0f);
    glutMainLoop();
    glClear(GL_COLOR_BUFFER_BIT);
    glutSwapBuffers();
}
