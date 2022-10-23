#!/bin/bash
set -euo pipefail

DOCS_VERSION=$1
OUTPUT_DIR="./gitops-partnerportal/docs"

# Build new version directory
mkdocs build -f mkdocs-partnerportal.yaml --site-dir "$OUTPUT_DIR/$DOCS_VERSION"

# Set up base redirects
cat <<EOF > $OUTPUT_DIR/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Redirecting</title>
  <noscript>
    <meta http-equiv="refresh" content="1; url=latest/" />
  </noscript>
  <script>
    window.location.replace("latest/" + window.location.hash);
  </script>
</head>
<body>
  Redirecting to <a href="latest/">latest/</a>...
</body>
</html>
EOF

cat <<EOF > $OUTPUT_DIR/404.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Redirecting</title>
  <noscript>
    <meta http-equiv="refresh" content="1; url=latest/404.html" />
  </noscript>
  <script>
    window.location.replace("latest/404.html" + window.location.hash);
  </script>
</head>
<body>
  Redirecting to <a href="latest/404.html">latest/404.html</a>...
</body>
</html>
EOF

# Set up latest redirects
mkdir -p $OUTPUT_DIR/latest
cat <<EOF > $OUTPUT_DIR/latest/index.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Redirecting</title>
  <noscript>
    <meta http-equiv="refresh" content="1; url=../$DOCS_VERSION/" />
  </noscript>
  <script>
    window.location.replace("../$DOCS_VERSION/" + window.location.hash);
  </script>
</head>
<body>
  Redirecting to <a href="../$DOCS_VERSION/">../$DOCS_VERSION/</a>...
</body>
</html>
EOF

cat <<EOF > $OUTPUT_DIR/latest/404.html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Redirecting</title>
  <noscript>
    <meta http-equiv="refresh" content="1; url=../$DOCS_VERSION/404.html" />
  </noscript>
  <script>
    window.location.replace("../$DOCS_VERSION/404.html" + window.location.hash);
  </script>
</head>
<body>
  Redirecting to <a href="../$DOCS_VERSION/404.html">../$DOCS_VERSION/404.html</a>...
</body>
</html>
EOF

