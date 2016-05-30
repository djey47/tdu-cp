package fr.tduf.tducp.scripts.install

import fr.tduf.tducp.scripts.common.ExistingFileFilter
import fr.tduf.tducp.scripts.common.TDUFRunner
import org.apache.commons.io.FileUtils

import java.nio.file.Paths

def startPath = Paths.get(".").toAbsolutePath()
def tducpPath = startPath.resolve("TDUCP-2.00A-installer")
def tdufPath = tducpPath.resolve("tduf")
def tdufVersion = tdufPath.resolve("tools").resolve("lib").resolve("version.info").text
def banksPath = startPath.resolve("Euro").resolve("Bnk")
def installerFilesPath = tducpPath.resolve("files")
def installerFilesPatchesPath = installerFilesPath.resolve("patches")
def runner = new TDUFRunner(
        tdufPath.resolve("lib").resolve("tduf-${tdufVersion}.jar"),
        tdufPath.resolve("tools").resolve("tdumt-cli").resolve("tdumt-cli.exe").toString()
)

println(".Initializing, please wait...")
println("(i) TDUF location: $tdufPath")
println("(i) TDUF version: $tdufVersion")

println()

println(".Patching game files, please wait...")

def logoPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\FrontEnd\\LOG_IN\\.2db\\fla_0013"

println("*1-Menu HI*")
def hiBankPath = banksPath.resolve("FrontEnd").resolve("HiRes").resolve("LOG_IN.bnk")
def hiLogoFilePath = installerFilesPatchesPath.resolve("textures-high").resolve("fla_0013.2db")
runner.bankReplace(hiBankPath, logoPackedPath, hiLogoFilePath)

println("*2-Menu LO*")
def lowBankPath = banksPath.resolve("FrontEnd").resolve("LowRes").resolve("LOG_IN.bnk")
def lowLogoFilePath = installerFilesPatchesPath.resolve("textures-low").resolve("fla_0013.2db")
runner.bankReplace(lowBankPath, logoPackedPath, lowLogoFilePath)

println("*3-Brand logos*")
def logoBankPath = banksPath.resolve("FrontEnd").resolve("AllRes").resolve("LogoTexturePage.bnk")
def logoBatchFilePath = installerFilesPatchesPath.resolve("banksReplace_LOGO_TEX.json")
runner.bankBatchReplace(logoBankPath, logoBatchFilePath, installerFilesPatchesPath)

def libraryPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\Level\\Hawai\\Common\\Library\\.3DD\\Library"
def libFilePath = installerFilesPatchesPath.resolve("Library.3DD")

println("*4-Patch HD Level Data HI*")
def hiCommonBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorld.bnk")
runner.bankReplace(hiCommonBankPath, libraryPackedPath, libFilePath)

println("*5-Patch HD Level Data LO*")
def lowCommonBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorldDiv2.bnk")
runner.bankReplace(lowCommonBankPath, libraryPackedPath, libFilePath)

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
runner.databaseToolApplyPatchesOnDatabaseBanks(gameDatabasePath, jsonDatabasePath, jsonPatchesPath)

println()

println(".Updating AwesomeMap, please wait...")
runner.mappingToolFixMap(banksPath)

println()

println(".All done!")
