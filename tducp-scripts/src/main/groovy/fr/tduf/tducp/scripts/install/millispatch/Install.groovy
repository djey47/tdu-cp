package fr.tduf.tducp.scripts.install.millispatch

import fr.tduf.tducp.scripts.common.TDUFRunner
import fr.tduf.tducp.scripts.install.common.PathConstants

void patchDatabase(runner, gameDatabasePath, tducpDatabasePath) {
    println(".Patching database, please wait...")
    def jsonDatabasePath = tducpDatabasePath.resolve("current")
    def jsonPatchesPath = tducpDatabasePath.resolve("patches")
    runner.databaseToolApplyPatchesOnDatabaseBanks(gameDatabasePath, jsonDatabasePath, jsonPatchesPath)

    println()
}
void updateAwesomeMap(runner, banksPath) {
    println(".Updating AwesomeMap, please wait...")
    runner.mappingToolFixMap(banksPath)

    println()
}

def tducpPath = PathConstants.currentPath.resolve("MillisPatch-installer")
def tducpDatabasePath = tducpPath.resolve("database")
def tdufPath = PathConstants.TDUFPath
def banksPath = PathConstants.banksPath
def gameDatabasePath = banksPath.resolve("Database")

def runner = new TDUFRunner(tdufPath)
println(".Initializing, please wait...")
println("(i) TDUF location:  ${runner.tdufPath}")
println("(i) TDUF version: ${runner.tdufVersion}")

println()

println(".Patching game files, please wait...")

println()

patchDatabase(runner, gameDatabasePath, tducpDatabasePath)

updateAwesomeMap(runner, banksPath)

println(".All done!")
