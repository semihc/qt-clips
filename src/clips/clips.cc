extern "C" {
#include "clips.h"
}

#include <QByteArray>
#include <QDebug>
#include <QCoreApplication>
#include <QMap>
#include <QDir>
#include <QStringList>

using namespace std;



int main(int argc, char** argv)
{
  QCoreApplication qcore(argc, argv);
  // Map of arguments
  QMap<QString, QString> argsMap;

  QRegExp flagre("--(\\S+)=(.*)");
  QStringList args = qcore.arguments();
  foreach(QString flag, args) {
    if(flagre.exactMatch(flag)) {
      QString fkey = flagre.cap(1);
      QString fval = flagre.cap(2);
      argsMap.insert(fkey.toLower(), fval);
    }
  }


   void *theEnv;
   
   theEnv = CreateEnvironment();
   RerouteStdin(theEnv,argc,argv);
   CommandLoop(theEnv);

   /*==================================================================*/
   /* Control does not normally return from the CommandLoop function.  */
   /* However if you are embedding CLIPS, have replaced CommandLoop    */
   /* with your own embedded calls that will return to this point, and */
   /* are running software that helps detect memory leaks, you need to */
   /* add function calls here to deallocate memory still being used by */
   /* CLIPS. If you have a multi-threaded application, no environments */
   /* can be currently executing. If the ALLOW_ENVIRONMENT_GLOBALS     */
   /* flag in setup.h has been set to TRUE (the default value), you    */
   /* call the DeallocateEnvironmentData function which will call      */
   /* DestroyEnvironment for each existing environment and then        */
   /* deallocate the remaining data used to keep track of allocated    */
   /* environments. Otherwise, you must explicitly call                */
   /* DestroyEnvironment for each environment you create.              */
   /*==================================================================*/
   
   /* DeallocateEnvironmentData(); */
   /* DestroyEnvironment(theEnv); */
  
   //int ret = qcore.exec();
   //return ret;
   return 0;
}

