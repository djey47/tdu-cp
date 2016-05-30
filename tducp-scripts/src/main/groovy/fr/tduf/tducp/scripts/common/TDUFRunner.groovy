package fr.tduf.tducp.scripts.common

/**
 * Class to run TDUF tools from command line scripts.
 */
class TDUFRunner {

    private static tdufLibPath
    private static tdumtCliExe

// TODO stop on execute error (binary not found)
// TODO get stderr http://stackoverflow.com/questions/159148/groovy-executing-shell-commands

    public static void bankReplace(bankPath, packedPath, filePath) {
        def cmd = "${dotNetInterpreter} \"${tdumtCliExe}\" BANK-R \"$bankPath\" $packedPath \"$filePath\""
        println(cmd)
        cmd.execute()
    }

    public static void bankBatchReplace(bankPath, batchFilePath, sourceFilePath) {
        def cmd = "${dotNetInterpreter} \"$tdumtCliExe\" BANK-RX \"$bankPath\" \"$batchFilePath\""
        println(cmd)
        cmd.execute([], sourceFilePath.toFile())
    }

    public static void mappingToolFixMap(banksPath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.MappingTool fix-missing -b \"$banksPath\""
//    println(cmd)
        cmd.execute()
    }

    public static void databaseToolUnpackAll(databasePath, jsonDatabasePath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool unpack-all -d \"$databasePath\" -j \"$jsonDatabasePath\""
//    println(cmd)
        cmd.execute()
    }

    public static void databaseToolApplyPatches(jsonDatabasePath, patchesPath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool apply-patches -j \"$jsonDatabasePath\" -p \"$patchesPath\""
//    println(cmd)
        cmd.execute()
    }

    public static void databaseToolRepackAll(jsonDatabasePath, databasePath) {
        def cmd = "java -cp \"$tdufLibPath\" fr.tduf.cli.tools.DatabaseTool repack-all -j \"$jsonDatabasePath\" -o \"$databasePath\""
//    println(cmd)
        cmd.execute()
    }

    static String getDotNetInterpreter() {
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
