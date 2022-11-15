##!/usr/bin/env bash

devnamespace=sample-namespace

NAMESPACE=${1:-$devnamespace}

#echo $NAMESPACE

oc project default

oc process -f project.yaml -p namespace=$NAMESPACE | oc apply -f -

oc project $NAMESPACE

for i in {1..3}
do
 oc process -f simpletemplate-example.yaml -p count=${i} -p namespace=$NAMESPACE | oc apply -f -
done

watch oc get pods
