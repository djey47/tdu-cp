package fr.tduf.tducp.scripts.install.patchhd

import groovy.transform.Field
import org.apache.commons.io.FileUtils

import java.nio.file.Paths

if (args.length == 0) {
    println("Patch HD mode argument not found! ")
    System.exit(1)
}

@Field startPath = Paths.get(".").toAbsolutePath()
@Field patchhdPath = startPath.resolve("TDUCP-PATCHHD-installer")
@Field tdumtCliBinaryPath = patchhdPath.resolve("tduf").resolve("tools").resolve("tdumt-cli").resolve("tdumt-cli.exe")
@Field tdumtCliExe = tdumtCliBinaryPath.toString()

def banksPath = startPath.resolve("Euro").resolve("Bnk")
def installerFilesPath = patchhdPath.resolve("files")

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
bankReplace(hiBankPath, libPackedPath, libFilePath)

println("*2-Patch HD Level Data LO*")
def loBankPath = banksPath.resolve("Level").resolve("Hawai").resolve("CommonWorldDiv2.bnk")
bankReplace(loBankPath, libPackedPath, libFilePath)

println("*3-Patch HD FX.ini*")
def sourcePath = installerFilesPath.resolve(selectedMode).resolve("FX.ini")
def targetPath = banksPath.resolve("FX")
FileUtils.copyFileToDirectory(sourcePath.toFile(), targetPath.toFile())

println()

println(".All done!")

// TODO stop on execute error (binary not found)
// TODO get stderr http://stackoverflow.com/questions/159148/groovy-executing-shell-commands

void bankReplace(bankPath, packedPath, filePath) {
    def cmd = "${getDotNetInterpreter()} \"$tdumtCliExe\" BANK-R \"$bankPath\" $packedPath \"$filePath\""
    println(cmd)
    cmd.execute()
}

static String getDotNetInterpreter() {
    if (System.getProperty("os.name").toUpperCase().contains("WINDOWS")) {
        return ""
    }

    return "mono"
}
