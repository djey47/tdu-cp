package fr.tduf.tducp.scripts.common

import java.nio.file.Path

/**
 * Class to run TDUF tools from command line scripts.
 */
class TDUFRunner {

    // TODO replace with instance fields and methods
    private static tdufLibPath
    private static tdumtCliExe

// TODO stop on execute error (binary not found)
// TODO get stderr http://stackoverflow.com/questions/159148/groovy-executing-shell-commands

    public static void bankReplace(bankPath, packedPath, filePath) {
        def cmd = "${dotNetInterpreter} \"${tdumtCliExe}\" BANK-R \"$bankPath\" $packedPath \"$filePath\""
        runCommandWithResultHandling(cmd)
    }

    public static void bankBatchReplace(bankPath, batchFilePath, sourceFilePath) {
        def cmd = "${dotNetInterpreter} \"$tdumtCliExe\" BANK-RX \"$bankPath\" \"$batchFilePath\""
        runCommandWithResultHandling(cmd, sourceFilePath)
    }

    public static void mappingToolFixMap(banksPath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.MappingTool fix-missing -b \"$banksPath\""
        runCommandWithResultHandling(cmd)
    }

    public static void databaseToolUnpackAll(databasePath, jsonDatabasePath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool unpack-all -d \"$databasePath\" -j \"$jsonDatabasePath\""
        runCommandWithResultHandling(cmd)
    }

    public static void databaseToolApplyPatches(jsonDatabasePath, patchesPath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool apply-patches -j \"$jsonDatabasePath\" -p \"$patchesPath\""
        runCommandWithResultHandling(cmd)
    }

    public static void databaseToolApplyPatchesOnDatabaseBanks(gameDatabasePath, jsonDatabasePath, jsonPatchesPath) {
        databaseToolUnpackAll(gameDatabasePath, jsonDatabasePath)
        databaseToolApplyPatches(jsonDatabasePath, jsonPatchesPath)
        databaseToolRepackAll(jsonDatabasePath, gameDatabasePath)
    }

    public static void databaseToolRepackAll(jsonDatabasePath, databasePath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool repack-all -j \"$jsonDatabasePath\" -o \"$databasePath\""
        runCommandWithResultHandling(cmd)
    }

    private static runCommandWithResultHandling(String cmd, Path startPath=null) {
        println(cmd)

        if (startPath == null) {
            cmd.execute()
        } else {
            cmd.execute([], startPath.toFile())
        }
    }

    private static String getDotNetInterpreter() {
        if (System.getProperty("os.name").toUpperCase().contains("WINDOWS")) {
            return ""
        }

        return "mono"
    }

    public static void setTdumtCliExe(cliExe) {
        tdumtCliExe = cliExe
    }

    public static void setTdufLibPath(libPath) {
        tdufLibPath = libPath
    }
}
