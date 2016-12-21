#ifndef _modelInfo2_H
#define _modelInfo2_H
#include "basicplugin.h"

using namespace std;

class ModelInfo2 : public QObject, public BasicPlugin
{
     Q_OBJECT
#if QT_VERSION >= 0x050000
     Q_PLUGIN_METADATA(IID "BasicPlugin")   
#endif
     Q_INTERFACES(BasicPlugin)
     
  


 public:
    int numOfObjects, numPoligons, numVertex, numPoligonsTriangulo;
    void onPluginLoad();
    void onObjectAdd();
    void postFrame() Q_DECL_OVERRIDE;

 private:
    GLuint textureID;
    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;

 };
 
 #endif
 
 
