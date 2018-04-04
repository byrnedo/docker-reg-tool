# Docker Registry Tool

Small bash script to do repetitive things with docker registry > 2.1 ( I think, whichever version supports delete by manifest)


## Dependencies

[Jq](https://stedolan.github.io/jq/)

```
Usage: 

    ./docker_reg_tool REGISTRY_BASE_URL ACTION [OPTIONS..]
    
    Actions:

    - list               list repos

    - list REPO          list tags for repo

    - delete REPO TAG    delete tag for repo

    Example:

    List all repos
        /$ ./docker_reg_tool [-v] https://registry.my.domain list

    List tags for one repo
        /$ ./docker_reg_tool [-v] https://registry.my.domain list some-repo

    Delete tag for a repo
        /$ ./docker_reg_tool https://registry.my.domain delete some-repo

```

## Credentials

...are sniffed out of ~/.docker/config.json. So you need to do `docker login...` before you can use this tool.

Only been tested on Basic auth.
