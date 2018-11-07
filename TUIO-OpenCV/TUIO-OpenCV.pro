QT += core
QT -= gui

CONFIG += c++11

TARGET = console
CONFIG += console
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp\
    ../Modulos/TopTUIO/topTUIO.cpp \
    ../Modulos/TopTUIO/FlashSender.cpp \
    ../Modulos/TopTUIO/OneEuroFilter.cpp \
    ../Modulos/TopTUIO/OscReceiver.cpp \
    ../Modulos/TopTUIO/TcpReceiver.cpp \
    ../Modulos/TopTUIO/TcpSender.cpp \
    ../Modulos/TopTUIO/TuioBlob.cpp \
    ../Modulos/TopTUIO/TuioClient.cpp \
    ../Modulos/TopTUIO/TuioContainer.cpp \
    ../Modulos/TopTUIO/TuioCursor.cpp \
    ../Modulos/TopTUIO/TuioDispatcher.cpp \
    ../Modulos/TopTUIO/TuioManager.cpp \
    ../Modulos/TopTUIO/TuioObject.cpp \
    ../Modulos/TopTUIO/TuioPoint.cpp \
    ../Modulos/TopTUIO/TuioServer.cpp \
    ../Modulos/TopTUIO/TuioTime.cpp \
    ../Modulos/TopTUIO/UdpReceiver.cpp \
    ../Modulos/TopTUIO/UdpSender.cpp \
    ../Modulos/TopTUIO/WebSockSender.cpp \
    ../Modulos/TopTUIO/ip/IpEndpointName.cpp \
    ../Modulos/TopTUIO/NetworkingUtils.cpp \
    ../Modulos/TopTUIO/UdpSocket.cpp \
    ../Modulos/TopTUIO/osc/OscOutboundPacketStream.cpp \
    ../Modulos/TopTUIO/osc/OscPrintReceivedElements.cpp \
    ../Modulos/TopTUIO/osc/OscReceivedElements.cpp \
    ../Modulos/TopTUIO/osc/OscTypes.cpp


win32:INCLUDEPATH += $(OPENCV_PATH)\install\include

win32:LIBS += $(OPENCV_PATH)\bin\libopencv_calib3d320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_core320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_features2d320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_flann320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_highgui320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_imgcodecs320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_imgproc320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_ml320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_objdetect320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_photo320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_shape320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_stitching320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_superres320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_video320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_videoio320.dll
win32:LIBS += $(OPENCV_PATH)\bin\libopencv_videostab320.dll
win32:LIBS += $(OPENCV_PATH)\bin\opencv_ffmpeg320.dll
win32:LIBS += -lws2_32
win32:LIBS += -lwinmm

HEADERS  += ../Modulos/TopTUIO/topTUIO.h \
    ../Modulos/TopTUIO/FlashSender.h \
    ../Modulos/TopTUIO/LibExport.h \
    ../Modulos/TopTUIO/OneEuroFilter.h \
    ../Modulos/TopTUIO/OscReceiver.h \
    ../Modulos/TopTUIO/OscSender.h \
    ../Modulos/TopTUIO/TcpReceiver.h \
    ../Modulos/TopTUIO/TcpSender.h \
    ../Modulos/TopTUIO/TuioBlob.h \
    ../Modulos/TopTUIO/TuioClient.h \
    ../Modulos/TopTUIO/TuioContainer.h \
    ../Modulos/TopTUIO/TuioCursor.h \
    ../Modulos/TopTUIO/TuioDispatcher.h \
    ../Modulos/TopTUIO/TuioListener.h \
    ../Modulos/TopTUIO/TuioManager.h \
    ../Modulos/TopTUIO/TuioObject.h \
    ../Modulos/TopTUIO/TuioPoint.h \
    ../Modulos/TopTUIO/TuioServer.h \
    ../Modulos/TopTUIO/TuioTime.h \
    ../Modulos/TopTUIO/UdpReceiver.h \
    ../Modulos/TopTUIO/UdpSender.h \
    ../Modulos/TopTUIO/WebSockSender.h \
    ../Modulos/TopTUIO/ip/IpEndpointName.h \
    ../Modulos/TopTUIO/ip/NetworkingUtils.h \
    ../Modulos/TopTUIO/ip/PacketListener.h \
    ../Modulos/TopTUIO/ip/TimerListener.h \
    ../Modulos/TopTUIO/ip/UdpSocket.h \
    ../Modulos/TopTUIO/osc/MessageMappingOscPacketListener.h \
    ../Modulos/TopTUIO/osc/OscException.h \
    ../Modulos/TopTUIO/osc/OscHostEndianness.h \
    ../Modulos/TopTUIO/osc/OscOutboundPacketStream.h \
    ../Modulos/TopTUIO/osc/OscPacketListener.h \
    ../Modulos/TopTUIO/osc/OscPrintReceivedElements.h \
    ../Modulos/TopTUIO/osc/OscReceivedElements.h \
    ../Modulos/TopTUIO/osc/OscTypes.h
