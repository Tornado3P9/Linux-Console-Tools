#!/usr/bin/env bash

# prüfen, ob mindestens 1 Argument übergeben wurde
if [ $# -lt 1 ]; then
    echo "Fehler: mindestens 1 Argument erforderlich." >&2
    echo "Aufruf: $0 ARGUMENT [WEITERE_ARGUMENTE...]" >&2
    exit 1
fi

# hier kannst du sicher sein: es gibt mindestens $1
echo "Erstes Argument: $1"
echo "Alle Argumente: $@"

# Beispiel: alle Argumente in einer Schleife
for arg in "$@"; do
    echo "Argument: $arg"
done
