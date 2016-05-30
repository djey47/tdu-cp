package fr.tduf.tducp.scripts.install

import fr.tduf.tducp.scripts.common.ExistingFileFilter
import fr.tduf.tducp.scripts.common.TDUFRunner
import groovy.transform.Field
import org.apache.commons.io.FileUtils

import java.nio.file.Paths

@Field startPath = Paths.get(".").toAbsolutePath()
@Field tducpPath = startPath.resolve("TDUCP-2.00A-installer")
@Field tdufPath = tducpPath.resolve("tduf")
@Field tdufVersion = tdufPath.resolve("tools").resolve("lib").resolve("version.info").text
@Field tdufLibPath = tdufPath.resolve("lib").resolve("tduf-${tdufVersion}.jar")
@Field tdumtCliBinaryPath = tdufPath.resolve("tools").resolve("tdumt-cli").resolve("tdumt-cli.exe")
@Field tdumtCliExe = tdumtCliBinaryPath.toString()

def banksPath = startPath.resolve("Euro").resolve("Bnk")
def installerFilesPath = tducpPath.resolve("files")
def installerFilesPatchesPath = installerFilesPath.resolve("patches")

println(".Initializing, please wait...")
println("(i) TDUF location: $tdufPath")
println("(i) TDUF version: $tdufVersion")

println()

println(".Patching game files, please wait...")

def logoPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\FrontEnd\\LOG_IN\\.2db\\fla_0013"

println("*1-Menu HI*")
def hiBankPath = banksPath.resolve("FrontEnd").resolve("HiRes").resolve("LOG_IN.bnk")
def hiLogoFilePath = installerFilesPatchesPath.resolve("textures-high").resolve("fla_0013.2db")
bankReplace(hiBankPath, logoPackedPath, hiLogoFilePath)

println("*2-Menu LO*")
def lowBankPath = banksPath.resolve("FrontEnd").resolve("LowRes").resolve("LOG_IN.bnk")
def lowLogoFilePath = installerFilesPatchesPath.resolve("textures-low").resolve("fla_0013.2db")
bankReplace(lowBankPath, logoPackedPath, lowLogoFilePath)

println("*3-Brand logos*")
def logoBankPath = banksPath.resolve("FrontEnd").resolve("AllRes").resolve("LogoTexturePage.bnk")
def logoBatchFilePath = installerFilesPatchesPath.resolve("banksReplace_LOGO_TEX.json")
bankBatchReplace(logoBankPath, logoBatchFilePath, installerFilesPatchesPath)

def libraryPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\Level\\Hawaii\\Common\\Library\\.3DD\\Library"
def libFilePath = installerFilesPatchesPath.resolve("Library.3DD")

println("*4-Patch HD Level Data HI*")
def hiCommonBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorld.bnk")
bankReplace(hiCommonBankPath, libraryPackedPath, libFilePath)

println("*5-Patch HD Level Data LO*")
def lowCommonBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorldDiv2.bnk")
bankReplace(lowCommonBankPath, libraryPackedPath, libFilePath)

println()

println(".Copying new game files, please wait...")
def sourcePath = installerFilesPath.resolve("Euro")
def targetPath = startPath.resolve("Euro")
FileUtils.copyDirectory(sourcePath.toFile(), targetPath.toFile(), ExistingFileFilter.nonExistingAtTarget(sourcePath, targetPath))

println()

println(".Patching database, please wait...")
def gameDatabasePath = banksPath.resolve("Database")
def jsonDatabasePath = tducpPath.resolve("database").resolve("current")
def jsonPatchesPath = tducpPath.resolve("database").resolve("patches")
databaseToolUnpackAll(gameDatabasePath, jsonDatabasePath)
databaseToolApplyPatches(jsonDatabasePath, jsonPatchesPath)
databaseToolRepackAll(jsonDatabasePath, gameDatabasePath)

println()

println(".Cleaning, please wait...")
// TODO

println()

println(".Updating AwesomeMap, please wait...")
mappingToolFixMap(banksPath)

println()

println(".All done!")

// TODO stop on execute error (binary not found)
// TODO get stderr http://stackoverflow.com/questions/159148/groovy-executing-shell-commands

void bankReplace(bankPath, packedPath, filePath) {
    def cmd = "${TDUFRunner.dotNetInterpreter} \"$tdumtCliExe\" BANK-R \"$bankPath\" $packedPath \"$filePath\""
    println(cmd)
    cmd.execute()
}

void bankBatchReplace(bankPath, batchFilePath, sourceFilePath) {
    def cmd = "${TDUFRunner.dotNetInterpreter} \"$tdumtCliExe\" BANK-RX \"$bankPath\" \"$batchFilePath\""
    println(cmd)
    cmd.execute([], sourceFilePath.toFile())
}

void mappingToolFixMap(banksPath) {
    def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.MappingTool fix-missing -b \"$banksPath\""
//    println(cmd)
    cmd.execute()
}

void databaseToolUnpackAll(databasePath, jsonDatabasePath) {
    def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool unpack-all -d \"$databasePath\" -j \"$jsonDatabasePath\""
//    println(cmd)
    cmd.execute()
}

void databaseToolApplyPatches(jsonDatabasePath, patchesPath) {
    def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool apply-patches -j \"$jsonDatabasePath\" -p \"$patchesPath\""
//    println(cmd)
    cmd.execute()
}

void databaseToolRepackAll(jsonDatabasePath, databasePath) {
    def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool repack-all -j \"$jsonDatabasePath\" -o \"$databasePath\""
//    println(cmd)
    cmd.execute()
}
