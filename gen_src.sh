#!/bin/sh

#
# Script file for generating sources
#
# Invoke script with:
# ./gen_src.sh [arg]
# where [arg] can be:
# - all: all sources (Python for clients, Python for servers, Markdown for documentation) will be generated
# - client: only Python client code will be generated
# - server: only Python server code will be generated
# - documentation: only Markdown documentation code will be generated
#

#
# Cleanup functions
#

# Cleans client source code
clean_client() {
    rm -rf generated/client/*
}

# Clean server source code
clean_server() {
    rm -rf generated/server/*
}

# Clean documentation source code
clean_documentation() {
    rm -rf generated/documentation/*
}
# Clean all source code
clean_all() {
    $(clean_client)
    $(clean_server)
    $(clean_documentation)
    rm -rf generated
}

#
# Generator functions
#

# Generate client source code
generate_client() {
    openapi-generator generate \
    --input-spec openapi-interfaces/${1}.v1.yaml \
    --generator-name python \
    --config openapi-config/${1}.json \
    --output generated/client/${1}
}

# Generate server source code
generate_server() {
    openapi-generator generate \
    --input-spec openapi-interfaces/${1}.v1.yaml \
    --generator-name python-flask \
    --config openapi-config/${1}.json \
    --output generated/server/${1}
}

# Generate documentation source code
generate_documentation() {
    openapi-generator generate \
    --input-spec openapi-interfaces/${1}.v1.yaml \
    --generator-name markdown \
    --output generated/documentation/${1}
}

# Generate all
generate_all() {
    generate_client $1
    generate_server $1
    generate_documentation $1
}

#
# Validation
#

# Validates API specification
validate_specification() {
    openapi-generator validate \
    --input-spec openapi-interfaces/${1}.v1.yaml
}

# Validates all API specifications
validate_all() {
    validate_specification acmesky
    validate_specification flightcompany
    validate_specification geodistances
    validate_specification paymentprovider
    validate_specification prontogram
    validate_specification travelcompany
}

# Main shell script

if [ $# -eq 0 ]; then
    echo "Usage: ./gen_src.sh [arg]"
    echo "Where [arg] can be:"
    echo "- all: all sources (Python for clients, Python for servers, Markdown for documentation) will be generated"
    echo "- client: only Python client code will be generated"
    echo "- server: only Python server code will be generated"
    echo "- documentation: only Markdown documentation code will be generated"
    echo "- clean: cleans all previously generated source code and generates none"
else
    if [ "$1" == "clean" ]; then
        echo "Cleaning generated source code"
        clean_all
    else
        echo "Validating interface specifications"
        validate_all
    fi
fi

if [ "$1" == "all" ]; then
    echo "Cleaning all previously available source code (if there is)"
    clean_all
    echo "Generating all source code"
    generate_all acmesky
    generate_all flightcompany
    generate_all geodistances
    generate_all paymentprovider
    generate_all prontogram
    generate_all travelcompany
fi

if [ "$1" == "client" ]; then
    echo "Cleaning previously available client source code (if there is)"
    clean_client
    echo "Generating client source code"
    generate_client acmesky
    generate_client flightcompany
    generate_client geodistances
    generate_client paymentprovider
    generate_client prontogram
    generate_client travelcompany
fi

if [ "$1" == "server" ]; then
    echo "Cleaning previously available server source code (if there is)"
    clean_server
    echo "Generating server source code"
    generate_server acmesky
    generate_server flightcompany
    generate_server geodistances
    generate_server paymentprovider
    generate_server prontogram
    generate_server travelcompany
fi

if [ "$1" == "documentation" ]; then
    echo "Cleaning previously available documentation source code (if there is)"
    clean_documentation
    echo "Generating documentation source code"
    generate_documentation acmesky
    generate_documentation flightcompany
    generate_documentation geodistances
    generate_documentation paymentprovider
    generate_documentation prontogram
    generate_documentation travelcompany
fi
