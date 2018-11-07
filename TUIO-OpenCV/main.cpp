#include <iostream>
#include <iomanip>
#include <math.h>
#include <string.h>
#include <stdlib.h>
#include <opencv2/opencv.hpp>
#include <../Modulos/TopTUIO/topTUIO.h>

using namespace cv;
using namespace std;
#include<stdio.h>


class SimpleSimulator {

public:
    SimpleSimulator(const char *host, int port);
    ~SimpleSimulator() {
        delete tuioServer;
    }
    void run();
    TuioServer *tuioServer;
    TuioCursor *cursor;
    double xc;
    double yc;
    float a,b,c,d,e,f,g,h;
    vector<Point2f> pts;
    std::list<TuioCursor*> stickyCursorList;
    std::list<TuioCursor*> stickylist;
    void processxy(double x,double y);
    void cursorclean();
    void cursoradd(double x,double y);
    void cursorupdate(TuioCursor *curse,double x,double y);
    void cursorremove(TuioCursor *curse);

private:
    float uvalue(float x,float y);
    float vvalue(float x,float y);
    bool running;

    TuioTime currentTime;

};

SimpleSimulator::SimpleSimulator(const char* host, int port)
{
    tuioServer = new TuioServer();
    cv::Point2f outPoints[4];
}
float SimpleSimulator::uvalue(float x,float y)
{
    return (((a*x)+(b*y)+c)/((g*x)+(h*y)+1));
}
float SimpleSimulator::vvalue(float x,float y)
{
    return (((d*x)+(e*y)+f)/((g*x)+(h*y)+1));
}

void SimpleSimulator::run()
{
    vector<vector<cv::Point> > contours;
    vector<Vec4i> hierarchy;
    VideoCapture cap = VideoCapture(0);
    Mat frame;
    double ratiox,ratioy;

    while (1){
        //Captura
        cap.read(frame);
        ratiox=(double)1/frame.cols;
        ratioy=(double)1/frame.rows;
//        cout<<"["<<ratiox<<", "<<ratioy<<"]"<<endl;
        //Preprocessamento
        Mat image,binary;
        cv::cvtColor(frame, image,CV_BGR2GRAY);
        GaussianBlur( image, image, Size( 5, 5 ), 0, 0 );
        threshold(image,binary,100,255,CV_THRESH_BINARY);
        //Coleta de blobs
        //Classificação de blobs mais relevantes
        //Mostra os resultados e espera a entrada do usuario para encerrar o loop
        imshow("Teste",frame);
        if(waitKey(15) == 27)
            break;
        //loop para cada blob
        findContours( binary, contours, hierarchy,CV_RETR_CCOMP, CV_CHAIN_APPROX_SIMPLE );

        for( int i = 0; i < contours.size(); i++ )
        {
            if(cv::contourArea(contours[i]) > 100 && cv::contourArea(contours[i]) < 10000)
            {
                Moments mu = moments( contours[i], false );
                Point2f p = Point2f( mu.m10/mu.m00 , mu.m01/mu.m00 );

                cout<<"["<<p.x * ratiox<<", "<<p.y * ratioy<<"]"<<endl;

                currentTime = TuioTime::getSessionTime();
                tuioServer->initFrame(currentTime);
                processxy(p.x * ratiox,p.y * ratioy);
                tuioServer->commitFrame();
            }
        }
        cursorclean();
    }
    //Destroi objetos se necessario.
    cap.release();
    destroyAllWindows();
}
void SimpleSimulator::processxy(double x,double y)
{
    float xt,yt;
    float xo,yo;
    xo=(float)x;
    yo=(float)y;
    float difx,dify;
    TuioCursor *cur;
    cur=NULL;
    bool match=false;
    stickylist = tuioServer->getTuioCursors();
    for (std::list<TuioCursor*>::iterator tuioCursor = stickylist.begin(); tuioCursor!=stickylist.end(); tuioCursor++)
    {
        xt=(*tuioCursor)->getX();
        yt=(*tuioCursor)->getY();
        difx=abs(xo-xt);
        dify=abs(yo-yt);
        if((difx<0.05)&&(dify<0.075))
        {
            match=true;
            cur=(*tuioCursor);
            break;
        }
    }
    if(match==true)
    {
        cursorupdate(cur,x,y);
    }
    else
    {
        cursoradd(x,y);
    }
}

void SimpleSimulator::cursoradd(double x, double y)
{
    tuioServer->addTuioCursor((float)x,(float)y);
}
void SimpleSimulator::cursorupdate(TuioCursor *curse, double x, double y)
{
    tuioServer->updateTuioCursor(curse,(float)x,(float)y);
}
void SimpleSimulator::cursorremove(TuioCursor *curse)
{
    currentTime = TuioTime::getSessionTime();
    tuioServer->initFrame(currentTime);
    tuioServer->removeTuioCursor(curse);
    tuioServer->commitFrame();
}
void SimpleSimulator::cursorclean()
{
    long t1=0,t2=0;
    TuioTime t,c;
    c = TuioTime::getSessionTime();
    t2=c.getTotalMilliseconds();
    stickylist = tuioServer->getTuioCursors();
    for (std::list<TuioCursor*>::iterator tuioCursor = stickylist.begin(); tuioCursor!=stickylist.end(); tuioCursor++)
    {
        t=(*tuioCursor)->getTuioTime();
        t1=t.getTotalMilliseconds();
        if((t2-t1)>500)
        {
            cursorremove((*tuioCursor));
        }
    }

}

int main()
{
    SimpleSimulator *app;
    app = new SimpleSimulator("default",0);
    app->run();
    delete(app);
    cout<<"Saindo!"<<endl;
    return 0;
}

