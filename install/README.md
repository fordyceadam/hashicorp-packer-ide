# Lab: Packer Install (GitPod)

> [Home](../README.md)

## Installing Packer in GitPod.

> This is the same process as you would complete if you were to install into WSL/WSL2 on your Windows PC or if you are on Mac, in the terminal.

---

## Prerequisites

- VSCode installed
- Gitpod account (Will be prompted to create if it doesn't already exist)

---

## GitPod (Debian Based)

**Using Linux on Ubuntu install method**

- Setup apt key
  ```bash
  curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
  ```
- Add the Repo
  ```bash
  sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
  ```
- Install Packer
  ```bash
  sudo apt-get update && sudo apt-get install packer
  ```
- setup the path
  ```bash
  export PATH=/usr/bin:$PATH

---

## Verify installation

- issue packer command
  ```bash
  packer --version
  ```

---