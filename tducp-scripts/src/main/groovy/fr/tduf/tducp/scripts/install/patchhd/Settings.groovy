package fr.tduf.tducp.scripts.install.patchhd

import fr.tduf.tducp.scripts.common.TDUFRunner
import org.apache.commons.io.FileUtils

import java.nio.file.Paths

if (args.length == 0) {
    println("Patch HD mode argument not found! ")
    System.exit(1)
}

def startPath = Paths.get(".").toAbsolutePath()
def patchhdPath = startPath.resolve("TDUCP-PATCHHD-installer")
def banksPath = startPath.resolve("Euro").resolve("Bnk")
def installerFilesPath = patchhdPath.resolve("files")
def runner = new TDUFRunner(
        null,
        patchhdPath.resolve("tduf").resolve("tools").resolve("tdumt-cli").resolve("tdumt-cli.exe").toString()
)

def modes = ["NA", "OFF", "SD", "HD100", "HD300", "HD500", "HDU"]

def modeIndex = args[0].toInteger()
if (modeIndex < 1 || modeIndex > 6) {
    println("Patch HD mode argument is invalid: ${modeIndex}!")
    System.exit(1)
}

def selectedMode = modes[modeIndex]
println(".Setting mode to ${selectedMode}...")
println()

println(".Patching game files, please wait...")

def libPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\Level\\Hawai\\Common\\Library\\.3DD\\Library"
def libFilePath = installerFilesPath.resolve(selectedMode).resolve("Library.3DD")

println("*1-Patch HD Level Data HI*")
def hiBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorld.bnk")
runner.bankReplace(hiBankPath, libPackedPath, libFilePath)

println("*2-Patch HD Level Data LO*")
def loBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorldDiv2.bnk")
runner.bankReplace(loBankPath, libPackedPath, libFilePath)

println("*3-Patch HD FX.ini*")
def sourcePath = installerFilesPath.resolve(selectedMode).resolve("FX.ini")
def targetPath = banksPath.resolve("FX")
FileUtils.copyFileToDirectory(sourcePath.toFile(), targetPath.toFile())

println()

println(".All done!")
