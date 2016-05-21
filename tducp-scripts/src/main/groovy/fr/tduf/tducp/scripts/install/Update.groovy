package fr.tduf.tducp.scripts.install

import java.nio.file.Paths

//def exitValue = "apt-get update".execute().exitValue()
//def exitValue = "NET FILE 1>NUL 2>NUL".execute().exitValue()

//if(exitValue != 0) {
//    println("Please launch TDUCP-xxxx-install.cmd script.")
//    System.exit(exitValue)
//}

def TDUCP_DIRECTORY="TDUCP-2.00A-installer"

def startPath = Paths.get(".").toAbsolutePath()
def banksPath = startPath.resolve("Euro").resolve("Bnk")
def databasePath = banksPath.resolve("Database")
def tducpPath = startPath.resolve(TDUCP_DIRECTORY)
def jsonDatabasePath = tducpPath.resolve("database").resolve("current")
def installerFilesPath = tducpPath.resolve("files")
def installerFilesPatchesPath = installerFilesPath.resolve("patches")
def tdufPath = tducpPath.resolve("tduf")
def tdufCliPath = tdufPath.resolve("tools").resolve("cli")
def tdumtCliBinaryPath = tdufPath.resolve("tools").resolve("tdumt-cli").resolve("tdumt-cli.exe")


println(".Initializing, please wait...")
def tdufVersion = tdufPath.resolve("tools").resolve("lib").resolve("version.info").text
println("(i) TDUF location: " +  tdufPath)
println("(i) TDUF version: " + tdufVersion)


println(".Patching game files, please wait...")
def logoPackedPath = "D:\\Eden-Prog\\Games\\TestDrive\\Resources\\4Build\\PC\\EURO\\FrontEnd\\LOG_IN\\.2db\\fla_0013"
def tdumtCliExe = tdumtCliBinaryPath.toString()

println("*1-Menu HI*")
def bankFile = banksPath.resolve("FrontEnd").resolve("HiRes").resolve("LOG_IN.bnk").toString()
def logoFilePath = installerFilesPatchesPath.resolve("textures-high").resolve("fla_0013.2db").toString()
"$tdumtCliExe BANK-R $bankFile $logoPackedPath $logoFilePath".execute()

println("*2-Menu LO*")
def lowBankFile = banksPath.resolve("FrontEnd").resolve("LowRes").resolve("LOG_IN.bnk").toString()
def lowLogoFilePath = installerFilesPatchesPath.resolve("textures-low").resolve("fla_0013.2db").toString()
"$tdumtCliExe BANK-R $lowBankFile $logoPackedPath $lowLogoFilePath".execute()



