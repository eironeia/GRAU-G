#include "modelInfo.h"
#include "glwidget.h"
#include <cmath>
#include <assert.h>


void ModelInfo::onPluginLoad() {
  
  
  
}
void ModelInfo::onObjectAdd() {
  int numOfObjects = scene()->objects().size();
  int numPoligons = 0; //faces
  int numVertex = 0;
  int numPoligonsTriangulo = 0;
  
  
  
  for (int i = 0; i < numOfObjects; ++i) {
    Object &object = scene()->objects()[i];
    int poligonsSize = object.faces().size();
    numPoligons += poligonsSize;
    for (int j = 0; j < poligonsSize; ++j) {
      int verticesSize = object.faces()[j].numVertices();
      numVertex += verticesSize;
     if (verticesSize  == 3) numPoligonsTriangulo += 1;
    } 
  }
  
  int percentatgeTriangles = numPoligonsTriangulo/numPoligons * 100;
  
  cout << "Numero de objetos: " << numOfObjects << endl;
  cout << "Numero de Poligonos: " << numPoligons << endl;
  cout << "Numero de Vertices: " << numVertex << endl;
  cout << "Numero de Percentatge triangles: " << percentatgeTriangles << endl;
}

void ModelInfo::printInfo() {

  
}

#if QT_VERSION < 0x050000
    Q_EXPORT_PLUGIN2(modelInfo, ModelInfo)   // plugin name, plugin class
#endif



