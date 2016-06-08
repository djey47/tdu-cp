package fr.tduf.tducp.scripts.install.common

import java.nio.file.Path
import java.nio.file.Paths

class PathConstants {

    static Path getCurrentPath() {
        return Paths.get(".").toAbsolutePath();
    }

    static Path getLibPath() {
        return currentPath.resolve("TDUCP-lib")
    }

    static Path getTDUFPath() {
        return libPath.resolve("tduf")
    }

    static Path getEuroFilesPath() {
        return currentPath.resolve("Euro")
    }

    static Path getBanksPath() {
        return euroFilesPath.resolve("Bnk")
    }

    static Path resolveInstallerFilesPath(Path patchRootPath) {
        return patchRootPath.resolve("files")
    }
}
