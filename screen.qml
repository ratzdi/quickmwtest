import QtQuick 2.0

Rectangle {
    gradient: Gradient {
        id: grad
        GradientStop { position: 0; color: "steelblue" }
        GradientStop { position: 1; color: "black" }
    }

    Column {
        Text {
            font.pointSize: 32
            color: "white"
            text: "This is QGuiApplication::screens()[" + screenIdx + "]" +
                "\ngeometry: " + screenGeom + // may be incorrect, see QTBUG-55188
                "\n  available geometry: " + screenAvailGeom +
                "\nvirtual geometry: " + screenVirtGeom +
                "\n  available virtual geometry: " + screenAvailVirtGeom
        }
        Text {
            font.pointSize: 32
            color: "white"
            text: "\nrefresh rate: " + screenRefresh +
                "\nphysical size: " + screenPhysSizeMm + " mm"
        }
        Text {
            font.pointSize: 12
            color: "red"
            text: "  should override with QT_QPA_EGLFS_PHYSICAL_WIDTH and HEIGHT" // but see QTBUG-55188
            visible: screenPhysSizeMm.width == 0 && screenPhysSizeMm.height == 0
        }
    }
}