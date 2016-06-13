package fr.tduf.tducp.scripts.common

import java.nio.file.Files
import java.nio.file.StandardOpenOption

import static java.util.Collections.singletonList

class TDUFRunnerTest extends GroovyTestCase {

    void testConstructor_shouldSetPathsAccordingly() {
        // GIVEN
        def tdufPath = Files.createTempDirectory("tducp-tests")
        def libParentPath = Files.createDirectories(tdufPath.resolve("tools").resolve("lib"))
        def versionFilePath = libParentPath.resolve("version.info")
        Files.write(versionFilePath, singletonList("1.6.0"), StandardOpenOption.CREATE)

        // WHEN
        TDUFRunner actualRunner = new TDUFRunner(tdufPath)

        // THEN
        assert actualRunner.tdufPath.equals(tdufPath)
        assert actualRunner.tdufVersion.startsWith("1.6.0")
        assert actualRunner.tdufLibPath.toString().startsWith("${libParentPath}/tduf-1.6.0")
        assert actualRunner.tdumtCliExe.compareTo("${tdufPath}/tools/tdumt-cli/tdumt-cli.exe") == 0
    }
}
