LoC Counting Scripts
==================
This is a collection of shell scripts that demonstrate how to count lines of code from repositories and/or local directories.  These scripts can be used to **estimate** LoC counts that would be produced by a Sonar analysis of these projects, without having to implement this analysis.

* [Installation](#installation)
* [General usage](#general-usage)
* [Contributions and Feedbacks](#Contributions-and-feedbacks)

Installation
------------

Requirements:

* bash version 4+
* [Git](https://git-scm.com/)
* [curl](https://curl.haxx.se)
* [jq](https://stedolan.github.io/jq/)
* [cloc](https://github.com/AlDanial/cloc)
* [gh](https://cli.github.com/)

General usage
-------------

Most scripts will produce two reports of LoC by language (.lang) and by repository (.file).

[github.com](https://github.com):

Counts lines of code from a GitHub.com organization.  Requires to pass username, [personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) and the organization.  The token must have repo scope.

```
<github_com.sh> myuser 1234567890abcdefgh myGitHubDotComOrg
```

[bitbucket.org](https://bitbucket.org):

Counts lines of code from a Bitbucket.org organization. Requires to pass username, [app password](https://support.atlassian.com/bitbucket-cloud/docs/app-passwords/) and the workspace slug.  The token must have Repositories > Read permissions.

```
<bitbucket_org.sh> myuser 1234567890abcdefgh myBBWorkspace
```

[Azure DevOps Services](https://dev.azure.com):

Counts lines of code from a Azure DevOps Services organization. Requires to pass [personal access token](https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops) and the organization.  The token must have Code > Read permissions.

```
<azure_devops_services.sh> 1234567890abcdefgh myADOOrg
```

[Gitlab.com](https://gitlab.com):

Counts lines of code from a GitLab.com Group. Requires to pass [personal access token](https://docs.gitlab.com/ee/user/profile/personal_access_tokens.html) and the group.  The token must have read_api and read_repository scopes.

```
<gitlab_com.sh> 1234567890abcdefgh myGitLabGroup
```

Local Filesystem:

Counts lines of code from a local directory or file.  This script only produces the LoC by language (.lang)

```
<filesystem.sh> PathToDirectoryorFile
```

Contributions and feedbacks
-------------
Contributions and feedbacks are welcome, as PRs or issues directly with this repository, or through your established Sonar communication channel.
