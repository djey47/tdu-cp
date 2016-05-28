package fr.tduf.tducp.scripts.common

import java.nio.file.Path

/**
 * Provides various file filters based upon existence of files
 */
class ExistingFileFilter implements FileFilter {

    Path sourcePath
    Path targetPath
    boolean ignoreExisting

    /**
     * @return a filter keeping all directories, and only files which exist at target location
     */
    static ExistingFileFilter existingAtTarget(sourcePath, targetPath) {
        return new ExistingFileFilter(sourcePath, targetPath, false)
    }

    /**
     * @return a filter keeping all directories, and only files which do not exist at target location
     */
    static ExistingFileFilter nonExistingAtTarget(sourcePath, targetPath) {
        return new ExistingFileFilter(sourcePath, targetPath, true)
    }

    private ExistingFileFilter(sourcePath, targetPath, ignoreExisting) {
        this.sourcePath = sourcePath
        this.targetPath = targetPath
        this.ignoreExisting = ignoreExisting
    }

    @Override
    boolean accept(File pathname) {
        if (pathname.directory) {
            return true;
        }

        def relativeFilePath = sourcePath.relativize(pathname.toPath())
        def targetFilePath = targetPath.resolve(relativeFilePath)

        return !targetFilePath.toFile().exists() && ignoreExisting || targetFilePath.toFile().exists() && !ignoreExisting
    }
}
