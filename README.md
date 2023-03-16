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

    - getdate REPO TAG   get last create or modification timestamp

    Example:

    List all repos
        /$ ./docker_reg_tool https://registry.my.domain list

    List tags for one repo
        /$ ./docker_reg_tool https://registry.my.domain list some-repo

    Delete tag for a repo
        /$ ./docker_reg_tool https://registry.my.domain delete some-repo some-tag

    Get last create or modification timestamp for repo tag
        /$ ./docker_reg_tool https://registry.my.domain getdate some-repo some-tag

```

## Credentials

...are sniffed out of ~/.docker/config.json. So you need to do `docker login...` before you can use this tool.

They can also be set with the `BASIC_AUTH` environment variable.
    
    BASIC_AUTH=user:pass ./docker_reg_tool ...

Only been tested on Basic auth.

## Insecure Registry

Set the `INSECURE_REGISTRY` to true;

    INSECURE_REGISTRY=true ./docker_reg_tool ...
    
## Registry Settings

In order for this to work, the registry needs to be running with
If docker image:
```  
REGISTRY_STORAGE_DELETE_ENABLED="true"
```
Or in the config file:
```
storage:
  delete:
    enabled: true
```

Also, the size will not decrease until the garbage collector runs. 
You can trigger it manually with:
```
docker exec registry bin/registry garbage-collect -m=true /etc/docker/registry/config.yml
```

## Debugging

Set the `TRACE` environment variable to true to turn on `set -x`

    TRACE=true ./docker_reg_tool ...

## Docker Image

See https://hub.docker.com/r/byrnedo/reg-tool/




