SOURCES += $$PWD/sdk/src/attrmap.cpp \
    $$PWD/sdk/src/backofftimer.cpp \
    $$PWD/sdk/src/base64.cpp \
    $$PWD/sdk/src/command.cpp \
    $$PWD/sdk/src/commands.cpp \
    $$PWD/sdk/src/db.cpp \
    $$PWD/sdk/src/gfx.cpp \
    $$PWD/sdk/src/file.cpp \
    $$PWD/sdk/src/fileattributefetch.cpp \
    $$PWD/sdk/src/filefingerprint.cpp \
    $$PWD/sdk/src/filesystem.cpp \
    $$PWD/sdk/src/http.cpp \
    $$PWD/sdk/src/json.cpp \
    $$PWD/sdk/src/megaclient.cpp \
    $$PWD/sdk/src/node.cpp \
    $$PWD/sdk/src/pubkeyaction.cpp \
    $$PWD/sdk/src/request.cpp \
    $$PWD/sdk/src/serialize64.cpp \
    $$PWD/sdk/src/share.cpp \
    $$PWD/sdk/src/sharenodekeys.cpp \
    $$PWD/sdk/src/sync.cpp \
    $$PWD/sdk/src/transfer.cpp \
    $$PWD/sdk/src/transferslot.cpp \
    $$PWD/sdk/src/treeproc.cpp \
    $$PWD/sdk/src/user.cpp \
    $$PWD/sdk/src/utils.cpp \
    $$PWD/sdk/src/waiterbase.cpp  \
    $$PWD/sdk/src/crypto/cryptopp.cpp  \
    $$PWD/sdk/src/db/sqlite.cpp  \
    $$PWD/sdk/src/gfx/qt.cpp \
    $$PWD/megaapi.cpp \
    $$PWD/qt/QTMegaRequestListener.cpp \
    $$PWD/qt/QTMegaTransferListener.cpp \
    $$PWD/qt/QTMegaListener.cpp \
    $$PWD/MegaProxySettings.cpp

win32 {
SOURCES += $$PWD/sdk/src/win32/net.cpp  \
    $$PWD/sdk/src/win32/fs.cpp  \
    $$PWD/sdk/src/win32/winwaiter.cpp  \
    $$PWD/sdk/win32/megaapiwait.cpp \
    $$PWD/sdk/win32/megaapiwinhttpio.cpp
}

unix:!mac {
SOURCES += $$PWD/sdk/src/posix/net.cpp  \
    $$PWD/sdk/src/posix/fs.cpp  \
    $$PWD/sdk/src/posix/waiter.cpp \
    $$PWD/linux/megaapiwait.cpp \
    $$PWD/linux/megaapiposixhttpio.cpp
}

HEADERS  += $$PWD/sdk/include/mega.h \
	    $$PWD/sdk/include/mega/account.h \
	    $$PWD/sdk/include/mega/attrmap.h \
	    $$PWD/sdk/include/mega/backofftimer.h \
	    $$PWD/sdk/include/mega/base64.h \
	    $$PWD/sdk/include/mega/command.h \
	    $$PWD/sdk/include/mega/console.h \
	    $$PWD/sdk/include/mega/db.h \
	    $$PWD/sdk/include/mega/gfx.h \
	    $$PWD/sdk/include/mega/file.h \
	    $$PWD/sdk/include/mega/fileattributefetch.h \
	    $$PWD/sdk/include/mega/filefingerprint.h \
	    $$PWD/sdk/include/mega/filesystem.h \
	    $$PWD/sdk/include/mega/http.h \
	    $$PWD/sdk/include/mega/json.h \
	    $$PWD/sdk/include/mega/megaapp.h \
	    $$PWD/sdk/include/mega/megaclient.h \
	    $$PWD/sdk/include/mega/node.h \
	    $$PWD/sdk/include/mega/pubkeyaction.h \
	    $$PWD/sdk/include/mega/request.h \
	    $$PWD/sdk/include/mega/serialize64.h \
	    $$PWD/sdk/include/mega/share.h \
	    $$PWD/sdk/include/mega/sharenodekeys.h \
	    $$PWD/sdk/include/mega/sync.h \
	    $$PWD/sdk/include/mega/transfer.h \
	    $$PWD/sdk/include/mega/transferslot.h \
	    $$PWD/sdk/include/mega/treeproc.h \
	    $$PWD/sdk/include/mega/types.h \
	    $$PWD/sdk/include/mega/user.h \
	    $$PWD/sdk/include/mega/utils.h \
	    $$PWD/sdk/include/mega/waiter.h \
	    $$PWD/sdk/include/mega/crypto/cryptopp.h  \
	    $$PWD/sdk/include/mega/db/sqlite.h  \
	    $$PWD/sdk/include/mega/gfx/qt.h \
	    $$PWD/megaapi.h \
	    $$PWD/qt/QTMegaRequestListener.h \
	    $$PWD/qt/QTMegaTransferListener.h \
	    $$PWD/qt/QTMegaListener.h \
	    $$PWD/MegaProxySettings.h

win32 {
    HEADERS  += $$PWD/sdk/include/mega/win32/meganet.h  \
            $$PWD/sdk/include/mega/win32/megasys.h  \
            $$PWD/sdk/include/mega/win32/megafs.h  \
            $$PWD/sdk/include/mega/win32/megawaiter.h  \
	    $$PWD/win32/megaapiwait.h \
	    $$PWD/win32/megaapiwinhttpio.h

    SOURCES += $$PWD/sqlite3.c
}


unix:!macx {
    HEADERS  += $$PWD/sdk/include/mega/posix/meganet.h  \
            $$PWD/sdk/include/mega/posix/megasys.h  \
            $$PWD/sdk/include/mega/posix/megafs.h  \
            $$PWD/sdk/include/mega/posix/megawaiter.h \
            $$PWD/linux/megaapiwait.h  \
            $$PWD/include/mega/config.h

    INCLUDEPATH += $$PWD/sdk/include
}

DEFINES += USE_SQLITE USE_CRYPTOPP USE_QT
LIBS += -lcryptopp
INCLUDEPATH += $$PWD/include

!release {
    DEFINES += SQLITE_DEBUG
}

INCLUDEPATH += $$PWD
INCLUDEPATH += $$PWD/3rdparty/include

win32 {

    INCLUDEPATH += $$PWD/sdk/include/mega/win32
    INCLUDEPATH += $$PWD/3rdparty/include/cryptopp

    contains(CONFIG, BUILDX64) {
	release {
	    LIBS += -L"$$_PRO_FILE_PWD_/sdk/3rdparty/libs/static_x64"
	}
	else {
	    LIBS += -L"$$_PRO_FILE_PWD_/sdk/3rdparty/libs/staticd_x64"
	}
    }

    !contains(CONFIG, BUILDX64) {
	release {
	    LIBS += -L"$$_PRO_FILE_PWD_/sdk/3rdparty/libs/static"
	}
	else {
	    LIBS += -L"$$_PRO_FILE_PWD_/sdk/3rdparty/libs/staticd"
	}
    }

    LIBS += -lwinhttp -lws2_32 -luser32
}

unix {
   INCLUDEPATH += $$PWD/sdk/include
   INCLUDEPATH += $$PWD/sdk/include/mega/posix
   INCLUDEPATH += /usr/include/cryptopp

   LIBS += -lsqlite3 -lrt

   exists($$PWD/3rdparty/libs/libcurl.a) {
    INCLUDEPATH += $$PWD/3rdparty/include/curl
    LIBS += -L$$PWD/3rdparty/libs/ $$PWD/3rdparty/libs/libcurl.a -lz -lssl -lcrypto -lcares
   }
   else {
    LIBS += -lcurl
   }
}
