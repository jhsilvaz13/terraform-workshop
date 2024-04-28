terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = var.github_token
}

resource "github_repository" "example" {
  name = "terraform-workshop"
  description = "This is my Github repository"
  visibility = "public"
  auto_init = true
}

resource "github_branch" "development" {
  repository = github_repository.example.name
  branch = "development"
}

resource "github_branch" "feature-1" {
  repository = github_repository.example.name
  branch = "feature-1"
}

resource "github_branch" "feature-2" {
  repository = github_repository.example.name
  branch = "feature-2"
}

resource "github_branch" "terraform-config"{
  repository = github_repository.example.name
  branch = "terraform-config"
}