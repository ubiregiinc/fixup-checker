#!/bin/bash
docker run -ti -v $(pwd):/go/src/fixup-checker golang bash -c "cd src/fixup-checker && go build"
