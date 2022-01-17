module "auto-vpc" {
    source  = "../../"

    name                    = "default"

    // forces for module project to complete and give ID before executing "auto-vpc"
    module_dependency       = "${module.project.id}"
}