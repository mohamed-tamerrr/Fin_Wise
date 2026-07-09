allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

subprojects {
    if (project.name != "app") {
        val applyNamespaceFix: () -> Unit = {
            val androidExtension = project.extensions.findByName("android")
            if (androidExtension != null) {
                val namespaceProperty = androidExtension.javaClass.getMethod("getNamespace")
                val currentNamespace = namespaceProperty.invoke(androidExtension)
                if (currentNamespace == null) {
                    val setNamespace = androidExtension.javaClass.getMethod("setNamespace", String::class.java)
                    setNamespace.invoke(androidExtension, project.group.toString())
                }
            }
        }

        if (project.state.executed) {
            applyNamespaceFix()
        } else {
            afterEvaluate { applyNamespaceFix() }
        }
    }
}