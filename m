Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBGNGSSEQMGQE7E6CSBA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E8D3F61D6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 17:41:14 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id z26-20020a0565120c1a00b003cf39d5ed62sf6273393lfu.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 08:41:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1629819674; cv=pass;
        d=google.com; s=arc-20160816;
        b=NkdvIJ7vvKjkCLKNeNljpAZ9nHfiN6R0trFKV14LJf42HRtB88aVLcnbpnXKHvY89J
         tlH4vGPIYiqyQOBzqA83AbTYCrT2zl8DsCsBSaXFVNvfPrdnUhOA9bVoy272M5SNCuGA
         MrGdqJzqnWwjE5gImTab+KdEFjCqIRcnbXZMK0aOveufXi7qr/YB6A9lC+Hq9CFgjRo0
         K7zVtB1skJsf5mleAa+mCzNm9kP8jOYmmCsj7KXee5PsbUd5zBmJ/dv+1EuItLZo5P5W
         2swaLWpyGOjcqUiUCXLDkrWHPhDLP+a7DGSTA3EjEqU0Z/Rx4pVpYR5QQpksydVffl1R
         1N2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=I+jinsQl0YZ17gbwd81Qp9NYwxo8UYtUKFsO8yyqE38=;
        b=NUbC13qdVpo32g6h3tMI7gBBj/qlp5gnjN/igXk+/1LW97DxrT4KYj28ymGQT6k6fb
         Sgl+m4E9WcUv2CgX7KcuAhzg6CuQusaAJF/8ljb4f25jKwFLnhu29ks6gAP7tBk9/5xf
         ehvA++liNDZr3UnywkzTr+UH+PCYIcmO+vboIm65ylZH4fpNXWkcm0tyHcjUl74cw/QU
         Wr1zqBqKZCCdWfzS0HTNoFRkxjSR06j0Rf5dBCozS7CHGXzXrQrgJB9dlzXrGdgtsEgw
         Kt7O4WKdbj/bhdEbauFn5iEQuHh8ofmx9GNjupZNTPFx7xR1sQJh+egYjVPiMPDwOBxG
         w1nw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I+jinsQl0YZ17gbwd81Qp9NYwxo8UYtUKFsO8yyqE38=;
        b=Tl3Eq2rY/HgHXdGK2TwJb1Womv36mBlpCKQCaB6dL5VoGncupQgs0sJvzGgJl5N/ND
         Dp1pGAoJ7J1eIFygd+0YLetWBT943JBCqit6pow6o3ISk0mcRM4qL925EivFqyjPwWx9
         1aHupdhUf1czXs9ZMlyssyMeqM7T6PqrcA5HSYqwsM+7HsY0ksCMK0NZWhET3cmqnNpK
         v047aDHoT9r045vUlis3bxS9bGboRkvEpX9kv8UKPKZv/GyIiCPEMiDor6k8OdULY/KR
         LKDdaITdBNVrjTDmQbvAtxN1vVSl/iw1ffE1ipGjGaVQEZ89kV0Mo5uUViElzx4/CcjO
         BFFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I+jinsQl0YZ17gbwd81Qp9NYwxo8UYtUKFsO8yyqE38=;
        b=fG40rjqzDCIpfl4IpiaziH/UPXLubGqHiWWxJf1ILcPzpxPAlitXZFo+Ih5EABVEvA
         PbkcsylyRNhq4cdudyER9Qpytix3NYJNaIsYJ50hIKYy2ofo7mdbm/zqjzIOi4oWY/z9
         l7mk1YOq0E/HJtsQ5XxxzifjU/vHQrghkGKZHaoU06YC6jTLd67+3EgrGlHEpXU8Hq6W
         7q/7or2P3MNXUhnkhgr0TBkwXfwMlkKewyWet7+0Vr/QbAPRMh9ChoGgKHG6JJBZg9l6
         0tphc7Ja/6kQRird1yMFmmQ1Wb+bXYGpDOki0XnQZAsbe6upXIFV/pnLcezmTnATnuTd
         8oTg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531gFAejfLShSQrfm2AHxh6Rt5N6DeiuqCmuSAhM7iPOqr+3pTUL
	fEpNwXLX7i1UWVtOTujwjLg=
X-Google-Smtp-Source: ABdhPJwdaZ61ZumJeQkKwaLpB+26bQ1dmm31Z8LtmkA5rxXVIZvmaEP/bNgo7Xw0umtDnHHzZquztw==
X-Received: by 2002:ac2:4f8f:: with SMTP id z15mr28145770lfs.361.1629819674039;
        Tue, 24 Aug 2021 08:41:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:4146:: with SMTP id c6ls730428lfi.2.gmail; Tue, 24 Aug
 2021 08:41:12 -0700 (PDT)
X-Received: by 2002:ac2:511a:: with SMTP id q26mr4438226lfb.332.1629819672603;
        Tue, 24 Aug 2021 08:41:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629819672; cv=none;
        d=google.com; s=arc-20160816;
        b=yBR90CstdKolvVs09J5M/1v2307II8Vyff4wQqBTtot9+1e+TdxY9f3afciStbkOp1
         /ePXvD3O2Re3V9J/kJhu+xMRxR3N30XuhQcGYMRvzFzQXrj4L4kzjVNOGm9hFYL+M4MO
         LYKZ0K3DIv46BHtmNVWTNActkP9m7QWTyXo9rJVLdL7IXIJ4CXZIVwT4MYczPtvCEcrF
         T+7TJWAu+uObP34A7cJsxi+LVWm+whq/jUcChkHUpjdahxgb3MA8r23fkwQ062NB1zaS
         vOPEvcATao2ylOA2avz8jvosSJJIjXjjYjijN2sAhXCcrcVCpXTUpbcRvb3gp5VozbGl
         Vg1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=9+rrHeePjkYZZ2yJVSbBAQpkGWkvTAbKUckOEy6UOQk=;
        b=rNDHeue6HdNCmuRp5Knv66/b+q98i6huQD9UdEXILUUlMQ2miTFF3iojpVWd8AC/Pi
         ucN+rdR2/Rp092xH/tBWilMvVdIC37Rlu0W81/tSW0aO8nzLVmw+soCDi+AzM5vU0bR1
         V2TIDAfgejktI2LEOzKn10m7ll6T05QyX3jspnJEV6Wfg/rqXguKT8xw3995Qk9wj3zn
         wYyO/HDWqcEHFuTZfkjF31lJ035ETtcydg0t6//nISHgg0KCI6mGSRvj52F+V4vvpWhT
         NOMsc5QAqScO/NM9X4S2xRWRsijoOcfbDZVyE0UqphBfIUmp6L2STZJFMvUORvEuZpuU
         U3rQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h13si813543lji.2.2021.08.24.08.41.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Aug 2021 08:41:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 17OFfBY1028504
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 24 Aug 2021 17:41:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.75.154])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 17OFfB7i015711
	for <jailhouse-dev@googlegroups.com>; Tue, 24 Aug 2021 17:41:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/2] ci: Migrate to github actions
Date: Tue, 24 Aug 2021 17:41:10 +0200
Message-Id: <722bb780c5cfcd589bd11041b5cecb91ff94d7b4.1629819671.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1629819671.git.jan.kiszka@siemens.com>
References: <cover.1629819671.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

From: Jan Kiszka <jan.kiszka@siemens.com>

Travis is no longer free and insufficiently predictable for OSS, so
migrate our CI to Github Actions. The same, just different: The workflow
language takes time to familiarize, but Coverity integration is actually
even simpler when open-coding (though that might have been true for
Travis already).

What is dropped at this chance is support for coverity_scan-<arch>. This
wasn't used for many years, the combined scan gives enough accuracy.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .github/workflows/main.yaml | 81 +++++++++++++++++++++++++++++++++++++
 .travis.yml                 | 60 ---------------------------
 CONTRIBUTING.md             |  4 +-
 README.md                   |  6 +--
 ci/README.md                | 10 ++---
 ci/build-all-configs.sh     |  5 ---
 ci/coverity-scan-build.sh   | 36 -----------------
 7 files changed, 90 insertions(+), 112 deletions(-)
 create mode 100644 .github/workflows/main.yaml
 delete mode 100644 .travis.yml
 delete mode 100644 ci/coverity-scan-build.sh

diff --git a/.github/workflows/main.yaml b/.github/workflows/main.yaml
new file mode 100644
index 00000000..fbf38841
--- /dev/null
+++ b/.github/workflows/main.yaml
@@ -0,0 +1,81 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2014-2021
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+
+name: CI
+
+on:
+  push:
+  workflow_dispatch:
+    inputs:
+      clear-cache:
+        description: Clear cache
+        required: false
+        default: false
+
+jobs:
+  build:
+    runs-on: ubuntu-20.04
+    steps:
+      - name: Checkout
+        uses: actions/checkout@v2
+      - name: Install dependencies
+        run: |
+          sudo apt-get install --no-install-recommends \
+              python3-mako gcc-arm-linux-gnueabihf libc6-dev-armhf-cross \
+              gcc-aarch64-linux-gnu libc6-dev-arm64-cross
+      - name: Install Coverity
+        if: ${{ github.ref == 'refs/heads/coverity_scan' }}
+        run: |
+          wget https://scan.coverity.com/download/cxx/linux64 \
+              --post-data "token=$COVERITY_TOKEN&project=siemens%2Fjailhouse" \
+              -O coverity_tool.tar.gz
+          tar -xf coverity_tool.tar.gz
+          ln -s cov-analysis-linux64-* cov-analysis-linux64
+      - name: Cache kernel build environment
+        uses: actions/cache@v2
+        id: cache-kernel
+        with:
+          key: kernel-build
+          path: |
+            ci/linux
+            ci/linux-4.13
+      - name: Install kernel build environment
+        if: ${{ github.event.inputs.clear-cache == 'true' || steps.cache-kernel.outputs.cache-hit != 'true' }}
+        run: |
+          cd ci
+          rm -rf linux linux-4.13
+          wget http://www.kiszka.org/downloads/jailhouse-ci/kernel-build.tar.xz
+          tar xJf kernel-build.tar.xz
+      - name: Build
+        if: ${{ github.ref != 'refs/heads/coverity_scan' }}
+        run: |
+          ci/build-all-configs.sh
+      - name: Build for Coverity
+        if: ${{ github.ref == 'refs/heads/coverity_scan' }}
+        run: |
+          export PATH=$PWD/cov-analysis-linux64/bin:$PATH
+          cov-configure --comptype gcc --compiler arm-linux-gnueabihf-gcc --template
+          cov-configure --comptype gcc --compiler aarch64-linux-gnu-gcc --template
+          ci/build-all-configs.sh --cov cov-int
+      - name: Submit Coverity results
+        if: ${{ github.ref == 'refs/heads/coverity_scan' }}
+        run: |
+          tar caf jailhouse-scan.tar.bz2 cov-int
+          curl --form token=$COVERITY_TOKEN \
+            --form email=$COVERITY_EMAIL \
+            --form file=@jailhouse-scan.tar.bz2 \
+            --form version="${{ github.sha }}" \
+            --form description="Jailhouse Coverity Scan" \
+            https://scan.coverity.com/builds?project=siemens%2Fjailhouse
+    env:
+      COVERITY_TOKEN: ${{ secrets.COVERITY_TOKEN }}
+      COVERITY_EMAIL: ${{ secrets.COVERITY_EMAIL }}
diff --git a/.travis.yml b/.travis.yml
deleted file mode 100644
index 2d120561..00000000
--- a/.travis.yml
+++ /dev/null
@@ -1,60 +0,0 @@
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2014-2019
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
-#
-
-language: c
-dist: bionic
-
-compiler:
-  - gcc
-
-addons:
-  apt:
-    packages:
-      - python-mako
-      - gcc-8
-      - gcc-8-arm-linux-gnueabihf
-      - libc6-dev-armhf-cross
-      - gcc-8-aarch64-linux-gnu
-      - libc6-dev-arm64-cross
-  coverity_scan:
-    project:
-      name: "siemens/jailhouse"
-    notification_email: jan.kiszka@siemens.com
-    build_script_url: https://raw.githubusercontent.com/$TRAVIS_REPO_SLUG/$TRAVIS_BRANCH/ci/coverity-scan-build.sh
-    build_command_prepend: "cov-configure --comptype gcc --compiler arm-linux-gnueabihf-gcc --template; cov-configure --comptype gcc --compiler aarch64-linux-gnu-gcc --template"
-    build_command: "unused"
-    branch_pattern: coverity_scan.*
-
-install:
-  - sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 800
-  - sudo update-alternatives --install /usr/bin/aarch64-linux-gnu-gcc aarch64-linux-gnu-gcc /usr/bin/aarch64-linux-gnu-gcc-8 800
-  - sudo update-alternatives --install /usr/bin/arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc /usr/bin/arm-linux-gnueabihf-gcc-8 800
-  # Work around broken certificate of scan.coverity.com
-  - sudo curl -s -L https://entrust.com/root-certificates/entrust_l1k.cer -o /usr/local/share/ca-certificates/entrust_l1k.crt
-  - sudo update-ca-certificates
-  # Install kernel build environment if it's not in the cache
-  - if [ ! -L ci/linux ]; then
-        pushd ci;
-        wget http://www.kiszka.org/downloads/travis-ci/kernel-build.tar.xz;
-        tar xJf kernel-build.tar.xz;
-        popd;
-    fi
-
-cache:
-  directories:
-  - ci/linux
-  - ci/linux-4.13
-
-script:
-  - if [ ${COVERITY_SCAN_BRANCH} != 1 ];
-        then ci/build-all-configs.sh;
-    fi
diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
index dc4d9785..eb644c81 100644
--- a/CONTRIBUTING.md
+++ b/CONTRIBUTING.md
@@ -31,9 +31,9 @@ Contribution Checklist
 
 - test patches sufficiently (obvious, but...) [**required**]
     - no regressions are caused in affected code
-    - seemingly unaffected architectures still build (use Travis CI e.g.)
+    - seemingly unaffected architectures still build (use github actions e.g.)
     - static code analyzer finds no new defects (register a github fork with
-      Travis CI and Coverity for free scanning) [*recommended*]
+      Coverity for free scanning) [*recommended*]
     - python code shall be tested with python 3 [**required**]
     - the world is still spinning
 
diff --git a/README.md b/README.md
index 3029f6a3..f1b0cbe3 100644
--- a/README.md
+++ b/README.md
@@ -61,11 +61,11 @@ Mailing list:
 
 Continuous integration:
 
-  - https://travis-ci.com/siemens/jailhouse
+  - https://github.com/siemens/jailhouse/actions
 
   - Status:
-    - ![](https://travis-ci.com/siemens/jailhouse.svg?branch=master) on master
-    - ![](https://travis-ci.com/siemens/jailhouse.svg?branch=next) on next
+    - ![](https://github.com/siemens/jailhouse/actions/workflows/main.yaml/badge.svg?branch=master) on master
+    - ![](https://github.com/siemens/jailhouse/actions/workflows/main.yaml/badge.svg?branch=next) on next
 
 Static code analysis:
 
diff --git a/ci/README.md b/ci/README.md
index 9fdf8fcf..639ec80e 100644
--- a/ci/README.md
+++ b/ci/README.md
@@ -2,15 +2,13 @@ Jailhouse Continuous Integration Build Environment
 ==================================================
 
 This collects tools and generates the Linux kernel binaries required to build
-Jailhouse in continuous integration environments. Currently, travis-ci.com is
+Jailhouse in continuous integration environments. Currently, GitHub Actions is
 the target environment.
 
 How to use
 ----------
 
-- Prepare an Ubuntu system according to the
-  [travis-ci specifications](http://docs.travis-ci.com/user/ci-environment)
-  or via the [Chef recipes](https://github.com/travis-ci/travis-cookbooks).
+- Prepare an Ubuntu system according to .github/workflows/main.yaml.
 - Run gen-kernel-build.sh on that system.
-- Upload ci/out/kernel-build.tar.xz to the location where Jailhouse's
-  .travis.yml expects it.
+- Upload ci/out/kernel-build.tar.xz to the location where Jailhouse's CI
+  expects it.
diff --git a/ci/build-all-configs.sh b/ci/build-all-configs.sh
index 81898fc1..ef7ae2b7 100755
--- a/ci/build-all-configs.sh
+++ b/ci/build-all-configs.sh
@@ -15,11 +15,6 @@ set -e
 
 CONFIGS="x86 banana-pi amd-seattle"
 
-# only build a specific config if the branch selects it
-if [ ${TRAVIS_BRANCH#coverity_scan-} != ${TRAVIS_BRANCH} ]; then
-	CONFIGS=${TRAVIS_BRANCH#coverity_scan-}
-fi
-
 PREFIX=
 if [ "$1" == "--cov" ]; then
 	export COVERITY_UNSUPPORTED=1
diff --git a/ci/coverity-scan-build.sh b/ci/coverity-scan-build.sh
deleted file mode 100644
index 72e0486d..00000000
--- a/ci/coverity-scan-build.sh
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/bash
-#
-# Jailhouse, a Linux-based partitioning hypervisor
-#
-# Copyright (c) Siemens AG, 2015
-#
-# Authors:
-#  Jan Kiszka <jan.kiszka@siemens.com>
-#
-# This work is licensed under the terms of the GNU GPL, version 2.  See
-# the COPYING file in the top-level directory.
-#
-
-curl -s https://scan.coverity.com/scripts/travisci_build_coverity_scan.sh \
-	-o ci/travisci_build_coverity_scan.sh.orig
-
-# Patch the line that starts the build.
-# We need to control this step via our build script.
-sed 's/^COVERITY_UNSUPPORTED=1 cov-build --dir.*/ci\/build-all-configs.sh --cov \$RESULTS_DIR \$COV_BUILD_OPTIONS/' \
-	ci/travisci_build_coverity_scan.sh.orig > ci/travisci_build_coverity_scan.sh.step1
-
-# Path the branch name into the description.
-sed 's/^  --form description=.*/  --form description="Travis CI build (branch: \$TRAVIS_BRANCH)" \\/' \
-	ci/travisci_build_coverity_scan.sh.step1 > ci/travisci_build_coverity_scan.sh
-
-# Check if the patch applied, bail out if not.
-if diff -q ci/travisci_build_coverity_scan.sh.orig \
-	   ci/travisci_build_coverity_scan.sh.step1 > /dev/null || \
-   diff -q ci/travisci_build_coverity_scan.sh.step1 \
-	   ci/travisci_build_coverity_scan.sh > /dev/null; then
-	echo "Unable to patch Coverity script!"
-	exit 1
-fi
-
-# Run the patched scanner script.
-. ci/travisci_build_coverity_scan.sh
-- 
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/722bb780c5cfcd589bd11041b5cecb91ff94d7b4.1629819671.git.jan.kiszka%40siemens.com.
