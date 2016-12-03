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

        runner.cameraToolBatchCopySets(camerasPath, tducpCameraPatchesPath)
    }
}
