package fr.tduf.tducp.scripts.install

import fr.tduf.tducp.scripts.common.ExistingFileFilter
import fr.tduf.tducp.scripts.common.TDUFRunner
import fr.tduf.tducp.scripts.install.common.PathConstants
import org.apache.commons.io.FileUtils

void patchCameras(runner, tducpDatabasePath, gameDatabasePath) {
    println(".Patching cameras, please wait...")
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

    println()
}
void patchMenuFiles(runner, banksPath, installerFilesPatchesPath) {
    def logoPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\FrontEnd\\LOG_IN\\.2db\\fla_0013"

    println("*1-Menu HI*")
    def hiBankPath = banksPath.resolve("FrontEnd").resolve("HiRes").resolve("LOG_IN.bnk")
    def hiLogoFilePath = installerFilesPatchesPath.resolve("textures-high").resolve("fla_0013.2db")
    runner.bankReplace(hiBankPath, logoPackedPath, hiLogoFilePath)

    println()

    println("*2-Menu LO*")
    def lowBankPath = banksPath.resolve("FrontEnd").resolve("LowRes").resolve("LOG_IN.bnk")
    def lowLogoFilePath = installerFilesPatchesPath.resolve("textures-low").resolve("fla_0013.2db")
    runner.bankReplace(lowBankPath, logoPackedPath, lowLogoFilePath)

    println()
}
void patchBrandLogos(runner, banksPath, installerFilesPatchesPath) {
    println("*3-Brand logos*")
    def logoBankPath = banksPath.resolve("FrontEnd").resolve("AllRes").resolve("LogoTexturePage.bnk")
    def logoBatchFilePath = installerFilesPatchesPath.resolve("banksReplace_LOGO_TEX.json")
    runner.bankBatchReplace(logoBankPath, logoBatchFilePath, installerFilesPatchesPath)

    println()

}
void patchLevelDataForPatchHD(runner, banksPath, installerFilesPatchesPath) {
    def libraryPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\Level\\Hawai\\Common\\Library\\.3DD\\Library"
    def libFilePath = installerFilesPatchesPath.resolve("Library.3DD")

    println("*4-Patch HD Level Data HI*")
    def hiCommonBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorld.bnk")
    runner.bankReplace(hiCommonBankPath, libraryPackedPath, libFilePath)

    println()

    println("*5-Patch HD Level Data LO*")
    def lowCommonBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorldDiv2.bnk")
    runner.bankReplace(lowCommonBankPath, libraryPackedPath, libFilePath)

    println()
}
void patchDatabase(runner, gameDatabasePath, tducpDatabasePath) {
    println(".Patching database, please wait...")
    def jsonDatabasePath = tducpDatabasePath.resolve("current")
    def jsonPatchesPath = tducpDatabasePath.resolve("patches")
    runner.databaseToolApplyPatchesOnDatabaseBanks(gameDatabasePath, jsonDatabasePath, jsonPatchesPath)

    println()
}
void copyNewGameFiles(installerFilesPath) {
    println(".Copying new game files, please wait...")
    def sourcePath = installerFilesPath.resolve("Euro")
    def targetPath = PathConstants.euroFilesPath

    FileUtils.copyDirectory(sourcePath.toFile(), targetPath.toFile(), ExistingFileFilter.nonExistingAtTarget(sourcePath, targetPath))

    println()
}
void updateAwesomeMap(runner, banksPath) {
    println(".Updating AwesomeMap, please wait...")
    runner.mappingToolFixMap(banksPath)

    println()
}

def tducpPath = PathConstants.currentPath.resolve("TDUCP-2.00A-installer")
def tducpDatabasePath = tducpPath.resolve("database")
def tdufPath = PathConstants.TDUFPath
def banksPath = PathConstants.banksPath
def gameDatabasePath = banksPath.resolve("Database")
def installerFilesPath = PathConstants.resolveInstallerFilesPath(tducpPath)
def installerFilesPatchesPath = installerFilesPath.resolve("patches")

def runner = new TDUFRunner(tdufPath)
println(".Initializing, please wait...")
println("(i) TDUF location:  ${runner.tdufPath}")
println("(i) TDUF version: ${runner.tdufVersion}")

println()

println(".Patching game files, please wait...")

println()

patchMenuFiles(runner, banksPath, installerFilesPatchesPath)

patchBrandLogos(runner, banksPath, installerFilesPatchesPath)

patchLevelDataForPatchHD(runner, banksPath, installerFilesPatchesPath)

copyNewGameFiles(installerFilesPath)

patchDatabase(runner, gameDatabasePath, tducpDatabasePath)

patchCameras(runner, tducpDatabasePath, gameDatabasePath)

updateAwesomeMap(runner, banksPath)

println(".All done!")
