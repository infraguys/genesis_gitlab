# Genesis GitLab

This project builds two interdependent virtual machine images:

- **`genesis-gitlab`** – GitLab Server image
- **`genesis-gitlab-runner`** – GitLab Runner image

These images are designed to be used together to provide a self-hosted GitLab instance with configured runners.

## 🛠 Build Requirements

- [Genesis Dev Tools](https://github.com/infraguys/genesis_devtools) must be installed and available in your environment.

## 🚀 Build Instructions

To build the images, run the following command:

```bash
genesis build -i /path/to/your/ssh_pub_key /path/to/your/genesis_gitlab_project
```

Replace `/path/to/your/ssh_pub_key` with the path to your public SSH key, and `/path/to/your/genesis_gitlab_project` with the directory containing this project.

## 📦 Output Images

After a successful build, the following images will be generated in the `output/` directory:

- `output/genesis-gitlab.raw`
- `output/genesis-gitlab-runner.raw`

