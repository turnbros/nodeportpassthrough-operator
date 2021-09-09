# We can start the operator by starting the bundle image.
# This is going to bootstrap the controller image
operator-sdk run bundle ghcr.io/turnbros/nodeportpassthrough-operator/operator-bundle:v0.0.3
