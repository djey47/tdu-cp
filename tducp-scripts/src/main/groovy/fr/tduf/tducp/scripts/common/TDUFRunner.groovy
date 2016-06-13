package fr.tduf.tducp.scripts.common

import java.nio.file.Path

/**
 * Class to run TDUF tools from command line scripts.
 */
class TDUFRunner {

    private final tdufPath
    private final tdufVersion
    private final tdufLibPath
    private final tdumtCliExe

    public TDUFRunner(tdufPath) {
        def tdufToolsPath = tdufPath.resolve("tools")
        def tdufLibParentPath = tdufToolsPath.resolve("lib")

        this.tdufPath = tdufPath
        this.tdufVersion = tdufLibParentPath.resolve("version.info").text
        this.tdufLibPath = tdufLibParentPath.resolve("tduf-${tdufVersion}.jar")
        this.tdumtCliExe = tdufToolsPath.resolve("tdumt-cli").resolve("tdumt-cli.exe").toString()
    }

    public void bankReplace(bankPath, packedPath, filePath) {
        def cmd = "$dotNetInterpreter \"$tdumtCliExe\" BANK-R \"$bankPath\" $packedPath \"$filePath\""
        runCommandWithResultHandling(cmd)
    }

    public void bankBatchReplace(bankPath, batchFilePath, sourceFilePath) {
        def cmd = "$dotNetInterpreter \"$tdumtCliExe\" BANK-RX \"$bankPath\" \"$batchFilePath\""
        runCommandWithResultHandling(cmd, sourceFilePath)
    }

    public void mappingToolFixMap(banksPath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.MappingTool fix-missing -b \"$banksPath\""
        runCommandWithResultHandling(cmd)
    }

    public void databaseToolUnpackAll(databasePath, jsonDatabasePath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool unpack-all -d \"$databasePath\" -j \"$jsonDatabasePath\""
        // TDUF need to be run in own directory to access tdumt cli binary
        runCommandWithResultHandling(cmd, tdufPath)
    }

    public void databaseToolApplyPatches(jsonDatabasePath, patchesPath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool apply-patches -j \"$jsonDatabasePath\" -o \"$jsonDatabasePath\" -p \"$patchesPath\""
        runCommandWithResultHandling(cmd)
    }

    public void databaseToolApplyPatchesOnDatabaseBanks(gameDatabasePath, jsonDatabasePath, jsonPatchesPath) {
        databaseToolUnpackAll(gameDatabasePath, jsonDatabasePath)
        databaseToolApplyPatches(jsonDatabasePath, jsonPatchesPath)
        databaseToolRepackAll(jsonDatabasePath, gameDatabasePath)
    }

    public void databaseToolRepackAll(jsonDatabasePath, databasePath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool repack-all -j \"$jsonDatabasePath\" -o \"$databasePath\""
        runCommandWithResultHandling(cmd, tdufPath)
    }

    private static runCommandWithResultHandling(String cmd, Path startPath=null) {
        def process
        if (startPath == null) {
            process = cmd.execute()
        } else {
            process = cmd.execute([], startPath.toFile())
        }

        def ob = new StringBuffer()
        def eb = new StringBuffer()
        process.waitForProcessOutput(ob, eb)

        println("[CMD] ${cmd}")
        println("[CODE] ${process.exitValue()}")
        println("[INFO] ${ob.toString()}")
        println("[ERROR] ${eb.toString()}")

        if (process.exitValue()) {
            System.exit(1)
        }
    }

    private static String getDotNetInterpreter() {
        if (System.getProperty("os.name").toUpperCase().contains("WINDOWS")) {
            return ""
        }

        return "mono"
    }

    def getTdufPath() {
        return tdufPath
    }

    def getTdufLibPath() {
        return tdufLibPath
    }

    def getTdufVersion() {
        return tdufVersion
    }

    def getTdumtCliExe() {
        return tdumtCliExe
    }
}
