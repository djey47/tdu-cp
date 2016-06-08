package fr.tduf.tducp.scripts.install.patchhd

import fr.tduf.tducp.scripts.common.TDUFRunner
import fr.tduf.tducp.scripts.install.common.PathConstants
import org.apache.commons.io.FileUtils

if (args.length == 0) {
    println("Patch HD mode argument not found! ")
    System.exit(1)
}

def patchhdPath = PathConstants.currentPath.resolve("TDUCP-PATCHHD-installer")
def tdufPath = PathConstants.TDUFPath
def banksPath = PathConstants.banksPath
def installerFilesPath = PathConstants.resolveInstallerFilesPath(patchhdPath)

def modes = ["NA", "OFF", "SD", "HD100", "HD300", "HD500", "HDU"]

def modeIndex = args[0].toInteger()
if (modeIndex < 1 || modeIndex > 6) {
    println("Patch HD mode argument is invalid: ${modeIndex}!")
    System.exit(1)
}

def runner = new TDUFRunner(tdufPath)
println(".Initializing, please wait...")
println("(i) TDUF location:  ${runner.tdufPath}")
println("(i) TDUF version: ${runner.tdufVersion}")

println()

def selectedMode = modes[modeIndex]
println(".Setting mode to ${selectedMode}...")
println()

println(".Patching game files, please wait...")

def selectedModePath = installerFilesPath.resolve(selectedMode)

def libPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\Level\\Hawai\\Common\\Library\\.3DD\\Library"
def libFilePath = selectedModePath.resolve("Library.3DD")

println("*1-Patch HD Level Data HI*")
def hiBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorld.bnk")
runner.bankReplace(hiBankPath, libPackedPath, libFilePath)

println("*2-Patch HD Level Data LO*")
def loBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorldDiv2.bnk")
runner.bankReplace(loBankPath, libPackedPath, libFilePath)

println("*3-Patch HD FX.ini*")
def sourcePath = selectedModePath.resolve("FX.ini")
def targetPath = banksPath.resolve("FX")
FileUtils.copyFileToDirectory(sourcePath.toFile(), targetPath.toFile())

println()

println(".All done!")
