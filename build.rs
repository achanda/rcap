use std::process::Command;

const LINUX_CAP_FILE: &'static str = "/usr/include/linux/capability.h";

fn main() {
    if cfg!(not(target_os = "linux")) {
        panic!("Platform not supported");
    };

    Command::new("./build.sh")
        .arg(LINUX_CAP_FILE)
        .output().unwrap_or_else(|e| {
                panic!("failed to execute process: {}", e)
    });
}
