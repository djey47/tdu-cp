package fr.tduf.tducp.scripts.install.common

import fr.tduf.tducp.scripts.common.TDUFRunner

/**
 * Applies patches onto cameras.bin file
 */
class CameraPatcher {

    private final TDUFRunner runner

    CameraPatcher(runner) {
        this.runner = runner
    }

    /**
     * Applies patch instructions from cameras.txt (tducp distrib) to cameras.bin (game db)
     * @param tducpDatabasePath : TDUCP distrib directory with database files
     * @param gameDatabasePath  : TDU game database directory
     */
    void patchCameras(tducpDatabasePath, gameDatabasePath) {
        def camerasPath = gameDatabasePath.resolve("cameras.bin")
        def tducpCameraPatchesPath = tducpDatabasePath.resolve("cameras.txt")
        def file = tducpCameraPatchesPath.toFile()
        def line

        println("Reading contents of ${file.absolutePath}")
        file.withReader { reader ->
            while ((line = reader.readLine()) != null) {
                def(sourceId, targetId) = line.tokenize(';')
                println ("$sourceId => $targetId")
                runner.cameraToolCopySet(camerasPath, sourceId, targetId)
            }
        }
    }
}
