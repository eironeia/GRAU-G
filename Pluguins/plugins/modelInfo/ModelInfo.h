#ifndef _modelInfo_H
#define _modelInfo_H
#include "basicplugin.h"

using namespace std;

class ModelInfo : public QObject, public BasicPlugin
{
     Q_OBJECT
#if QT_VERSION >= 0x050000
     Q_PLUGIN_METADATA(IID "BasicPlugin")   
#endif
     Q_INTERFACES(BasicPlugin)

 public:
    void onPluginLoad();
    void onObjectAdd();

 private:
    void printInfo();

 };
 
 #endif
 
 
