Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTU4T2CQMGQESZ6NVVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6995A38C51E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:41:19 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id c4-20020a05651c0144b02900d41930170esf8659580ljd.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:41:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593679; cv=pass;
        d=google.com; s=arc-20160816;
        b=vXmFksJCELsVwcWzAUqQ8qE3wLb1OyazGct2YCWJSCWJWYix3LPj3izck1NzbrdeB/
         h34O1lxtlLZDuxTBEhi1W7OzycFsW9lQXCpRHFzAgSsh7Q+mhgnpH2XNpltXy15yY8rL
         RnunUsztyIXB9uI7gYtfIew/MFoMY40JkdGw/FK0LAzcUbv0FQN/oKUhId18/Pcjy0iS
         GeEBQjvNHKtJLrQ8pX1QW6CW3RlPLcyx2Qy+RzGPU68GSRjDUMrWysFWVWTkti3eDMCK
         zYUx4JDZh1qTBb4ozrCbQ2sMuNmim1TLMz3rrhjOQOsboVCpaH2skKNqw9TCu2A8VWyn
         1Vpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=kxRlZWutSE8ji7kXoeotQvyM3W4PwJVJoYmpIkF8xsQ=;
        b=zVwnSBzCRZFgFPeKzTBQopafi9ZJ7fo/Rj2EdMFZd8NgDmNVHxwxD57igBHLwJ5KYJ
         be7WH8OrLBH1+YbYUbT9p2VmPe6n/ChtUKZH/uM7gzpW7tbMJRJZJC3g1ceZkigVOe1B
         E1IjltJebWcSMyBqsibQ6mLJq7bR676pNHh1z8orypitCNRWIgkXLNQtNUuR+39YcOzo
         HR82o4bz14S07rtDDLKve2J45Rl5O4l2hQIGUdkrdUkdtIp+VMlX7kU67odKVzBiiHnQ
         aSoQvUTARePSt50+dK39eLac76DOGWx3F6g24ttpt/3rtcWDOWnJpi8BrlX5yND1UQaJ
         bbEQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kxRlZWutSE8ji7kXoeotQvyM3W4PwJVJoYmpIkF8xsQ=;
        b=SfQ8cutwoYILdC/aclkj3GGpt4q0G2HOOAy8DxdtapAnHQ/D06e86vdBiRFHZhFraJ
         BJEtVesh+5MWqk+1Ladx+moofYmw+VLQpJbX9BPRg6yg5F1uMmeY/04fCzGRuXuZt6Ip
         /6jomaaX6YhyNJVpSps8n77xVL2H6MWGjEo2WPJ3tssrC6fq50TUXm09tvuFtjPrRQUh
         jOcDlR6O3090vevslHZTj82Ys/XdLD/wHdVv5ADQe/1dqTC/IcXlLubIWDn+K76DdUs7
         227nkucWRgatnaYaNSj9aYrvsmmhcadQhywP6lnlMr+9o+MLA819Ct0CYxkZPxDewl7H
         1Ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=kxRlZWutSE8ji7kXoeotQvyM3W4PwJVJoYmpIkF8xsQ=;
        b=px25mhqvfsvaoFuK5Wt86iQSuy9OviQ+FEABQBLgKBPy1clPM2Cz87VvwXEiPYYbyO
         anf6sd2tF+tk8fghFlVKK5BcaIrNfHC85H13nf2OddtT7Qckw90Eq/mw3gj9ik5scSO4
         bEyS2dkR9X8vnkYqm/MuKi+3IhzppEflg9ukp50iDTm7Wq7ueAtCcMVy783hMezgVPS3
         eXpQEkAsOYTtU8c1921lunQz728uqe7Rf+JbyWHgVmNSr/HqHv/T9xObbBTXc2zJj1s4
         l64W4aZ8fhIuLrEuhSdJFvrCD86ZR/3wWKj/PrKGFGOxWtAmDjcqV8MeL+EXH9N0cX3V
         ZW7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532OO3oHXeA2RMK5/w9dFNMeg/CysF+vdRhhbHA0qkAHVaXVX9MN
	nmSxjJoBlwbGdghuvnRx7RM=
X-Google-Smtp-Source: ABdhPJz1n26FY/S+EpFnNoKnpea9+TtOi8a3lGVWv0x3UBreQW5o4IIXlgm/pOoy2ERpRvm5O/grnw==
X-Received: by 2002:a05:6512:a89:: with SMTP id m9mr1734291lfu.161.1621593678984;
        Fri, 21 May 2021 03:41:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a371:: with SMTP id i17ls1134677ljn.11.gmail; Fri, 21
 May 2021 03:41:18 -0700 (PDT)
X-Received: by 2002:a2e:90c2:: with SMTP id o2mr6598168ljg.314.1621593677918;
        Fri, 21 May 2021 03:41:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593677; cv=none;
        d=google.com; s=arc-20160816;
        b=xlvd7UsRjTp/BF1SHTZswrcha1VCgsai8fTq9BTh4szOItKkVVufsRRGnT+9IrBGh/
         r2ZYDRfsFW6iZvFh+NrfTCVI+HLUtKyzJbNQN9+VwYq4OmsSNN5ooeJLyYBeklFVxTjf
         IVj0WC8T9sHDqB6Gh1yJnzGwoOxhbVPYEp17jqlmQCHKvfgphOqdWO4AIAkdO4evzAPD
         +rsL/ePDx5vxBJ+ORM9DvvbjyrUcQRxMokZFtrcpyNijhnFxoyjkn6u+8wQoCE/sro+k
         +B5+xZxl8Lhox/Ix3q0J99/g6vz7VDyF4vkBesZr0X3tP1xhCGte9eDiy9BpvIfjTa0J
         7PtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=CpR0Cwqgk50it1o41FwQjuxRMS47LjfdqQtmUdjAMAE=;
        b=VKREunlnSCcTrbHZSYWupaT8acDZDdeLTlL/8GEyElq6SsPxebXHaPlhs+BDpJ9XeK
         8b+GUKkDbpOWvaFyz8vuSZTy2WzJboiUmNWwfPd0oBtqntgU2js51vmyPXTRXfJNIsCk
         xzPu8wpYcDiQBGG5yktgMTW9fO1ZoLA9xUqeFt6emgkNo7yOpsbtQR1BpsvktNjlgoND
         cD13IFuVNfSNBj8a6LaCryoIs2YkePCioS8Itq/zxXujp7uslP94CLutPMW5lqEFOxM0
         gimrdM6i26A3AA1rkeKdqyWq1ktP1jcrmpS+QTeK5CathyOoLhtc52zmIWvttQZ8q5uB
         py1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j7si328881ljc.6.2021.05.21.03.41.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:41:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAfHqO006746
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:41:17 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYc7032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:35 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 02/22] Update to kas 2.4
Date: Fri, 21 May 2021 12:37:14 +0200
Message-Id: <6518d7575fffc47a379dc97c43c4162442f4aa18.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

kas-docker is now kas-container. Use the chance of the update to
embedded kas-container, rather than downloading it on demand which comes
with the risk of running from an older version.

With the update, building on an arm64 host is now possible as well,
though this wasn't tried for jailhouse-images yet.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .gitignore      |   1 -
 .gitlab-ci.yml  |   2 +-
 build-images.sh |  12 +-
 kas-container   | 372 ++++++++++++++++++++++++++++++++++++++++++++++++
 kas.yml         |   4 +-
 opt-latest.yml  |   2 +-
 opt-rt.yml      |   2 +-
 7 files changed, 380 insertions(+), 15 deletions(-)
 create mode 100755 kas-container

diff --git a/.gitignore b/.gitignore
index 43892c0..fe0ae1a 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,4 +1,3 @@
 build/
 isar/
 recipes-core/customizations/local.inc
-kas-docker
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 0c03ee1..52692c6 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,4 +1,4 @@
-image: kasproject/kas-isar:2.2
+image: ghcr.io/siemens/kas/kas-isar:2.4
 
 variables:
   GIT_STRATEGY: clone
diff --git a/build-images.sh b/build-images.sh
index 45f7079..772bdbd 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -22,6 +22,7 @@ usage()
 }
 
 JAILHOUSE_IMAGES=$(dirname $0)
+KAS_CONTAINER=${KAS_CONTAINER:-${JAILHOUSE_IMAGES}/kas-container}
 KAS_FILES="${JAILHOUSE_IMAGES}/kas.yml"
 CMD="build"
 
@@ -96,13 +97,4 @@ if [ -z "${KAS_TARGET}" ]; then
 fi
 export KAS_TARGET
 
-if [ -z ${KAS_DOCKER} ]; then
-	KAS_DOCKER=./kas-docker
-	if [ ! -e ${KAS_DOCKER} ]; then
-		wget -q --show-progress -O ${KAS_DOCKER} \
-		     https://raw.githubusercontent.com/siemens/kas/2.2/kas-docker
-		chmod a+x ${KAS_DOCKER}
-	fi
-fi
-
-${KAS_DOCKER} --isar ${CMD} ${KAS_FILES}
+${KAS_CONTAINER} ${CMD} ${KAS_FILES}
diff --git a/kas-container b/kas-container
new file mode 100755
index 0000000..b149c1c
--- /dev/null
+++ b/kas-container
@@ -0,0 +1,372 @@
+#!/bin/sh
+#
+# kas - setup tool for bitbake based projects
+#
+# Copyright (c) Siemens AG, 2018-2021
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# Permission is hereby granted, free of charge, to any person obtaining a copy
+# of this software and associated documentation files (the "Software"), to deal
+# in the Software without restriction, including without limitation the rights
+# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+# copies of the Software, and to permit persons to whom the Software is
+# furnished to do so, subject to the following conditions:
+#
+# The above copyright notice and this permission notice shall be
+# included in all copies or substantial portions of the Software.
+#
+# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
+# SOFTWARE.
+
+set -e
+
+usage()
+{
+	printf "%b" "Usage: $0 [OPTIONS] { build | shell } [KASOPTIONS] KASFILE\n"
+	printf "%b" "       $0 [OPTIONS] clean\n"
+	printf "%b" "\nPositional arguments:\n"
+	printf "%b" "build\t\t\tCheck out repositories and build target.\n"
+	printf "%b" "shell\t\t\tRun a shell in the build environment.\n"
+	printf "%b" "clean\t\t\tClean build artifacts, keep downloads.\n"
+	printf "%b" "\nOptional arguments:\n"
+	printf "%b" "--isar\t\t\tUse kas-isar container to build Isar image.\n"
+	printf "%b" "--with-loop-dev		Pass a loop device to the " \
+		    "container. Only required if\n"
+	printf "%b" "\t\t\tloop-mounting is used by recipes.\n"
+	printf "%b" "--runtime-args\t\tAdditional arguments to pass to the " \
+			"container runtime\n"
+	printf "%b" "\t\t\tfor running the build.\n"
+	printf "%b" "--docker-args\t\tSame as --runtime-args (deprecated).\n"
+	printf "%b" "-d\t\t\tPrint debug output.\n"
+	printf "%b" "-v\t\t\tSame as -d (deprecated).\n"
+	printf "%b" "--ssh-dir\t\tDirectory containing SSH configurations.\n"
+	printf "%b" "\t\t\tAvoid \$HOME/.ssh unless you fully trust the " \
+		    "container.\n"
+	printf "%b" "--aws-dir\t\tDirectory containing AWScli configuration.\n"
+	printf "%b" "--no-proxy-from-env\tDo not inherit proxy settings from " \
+		    "environment.\n"
+	printf "%b" "\n"
+	printf "%b" "You can force the use of podman over docker using " \
+		    "KAS_CONTAINER_ENGINE=podman.\n"
+	exit 1
+}
+
+trace()
+{
+	[ -n "${KAS_VERBOSE}" ] && echo "+ $*"
+	"$@"
+}
+
+enable_isar_mode() {
+	KAS_CONTAINER_IMAGE_NAME_DEFAULT="kas-isar"
+	KAS_ISAR_ARGS="--privileged"
+
+	if [ "${KAS_CONTAINER_ENGINE}" = "podman" ]; then
+		# sudo is needed for a privileged podman container
+		KAS_CONTAINER_COMMAND="sudo ${KAS_CONTAINER_COMMAND}"
+		KAS_ISAR_ARGS="${KAS_ISAR_ARGS} --pid=host"
+	fi
+}
+
+KAS_IMAGE_VERSION_DEFAULT="2.4"
+KAS_CONTAINER_IMAGE_PATH_DEFAULT="ghcr.io/siemens/kas"
+KAS_CONTAINER_IMAGE_NAME_DEFAULT="kas"
+
+set_container_image_var() {
+	KAS_IMAGE_VERSION="${KAS_IMAGE_VERSION:-${KAS_IMAGE_VERSION_DEFAULT}}"
+	KAS_CONTAINER_IMAGE_NAME="${KAS_CONTAINER_IMAGE_NAME:-${KAS_CONTAINER_IMAGE_NAME_DEFAULT}}"
+	KAS_CONTAINER_IMAGE_PATH="${KAS_CONTAINER_IMAGE_PATH:-${KAS_CONTAINER_IMAGE_PATH_DEFAULT}}"
+	KAS_CONTAINER_IMAGE="${KAS_CONTAINER_IMAGE_PATH}/${KAS_CONTAINER_IMAGE_NAME}:${KAS_IMAGE_VERSION}"
+}
+
+if [ -n "${KAS_WORK_DIR}" ]; then
+	KAS_WORK_DIR=$(readlink -f "${KAS_WORK_DIR}")
+else
+	KAS_WORK_DIR="$(pwd)"
+fi
+
+KAS_CONTAINER_ENGINE="${KAS_CONTAINER_ENGINE:-${KAS_DOCKER_ENGINE}}"
+if [ -z "${KAS_CONTAINER_ENGINE}" ]; then
+	# Try to auto-detect a container engine
+	if command -v docker >/dev/null; then
+		KAS_CONTAINER_ENGINE=docker
+	elif command -v podman >/dev/null; then
+		KAS_CONTAINER_ENGINE=podman
+	else
+		echo "$0: no container engine found, need docker or podman" >&2
+		exit 1
+	fi
+fi
+
+case "${KAS_CONTAINER_ENGINE}" in
+docker)
+	KAS_CONTAINER_COMMAND="docker"
+	;;
+podman)
+	KAS_CONTAINER_COMMAND="podman"
+	KAS_RUNTIME_ARGS="--userns=keep-id --security-opt label=disable"
+	;;
+*)
+	echo "$0: unknown container engine '${KAS_CONTAINER_ENGINE}'" >&2
+	exit 1
+	;;
+esac
+
+# parse kas-container options
+while [ $# -gt 0 ]; do
+	case "$1" in
+	--isar)
+		enable_isar_mode
+		shift 1
+		;;
+	--with-loop-dev)
+		if ! KAS_LOOP_DEV=$(/sbin/losetup -f 2>/dev/null); then
+			if [ "$(id -u)" -eq 0 ]; then
+				echo "Error: loop device not available!"
+				exit 1
+			fi
+			sudo_command="/sbin/losetup -f"
+			sudo_message="[sudo] enter password to setup loop"
+			sudo_message="$sudo_message devices by calling"
+			sudo_message="$sudo_message '$sudo_command': "
+			# SC2086: Double quote to prevent globbing and word splitting.
+			# shellcheck disable=2086
+			if ! KAS_LOOP_DEV=$(sudo -p "$sudo_message" $sudo_command \
+				2>/dev/null); then
+				echo "Error: loop device setup unsuccessful!"
+				echo "try calling '$sudo_command' with root" \
+					"permissions manually."
+				exit 1
+			fi
+		fi
+		KAS_WITH_LOOP_DEV="--device ${KAS_LOOP_DEV}"
+		shift 1
+		;;
+	--runtime-args|--docker-args)
+		[ $# -gt 0 ] || usage
+		KAS_RUNTIME_ARGS="${KAS_RUNTIME_ARGS} $2"
+		shift 2
+		;;
+	--ssh-dir)
+		[ $# -gt 2 ] || usage
+		KAS_SSH_DIR="$2"
+		shift 2
+		;;
+	--aws-dir)
+		[ $# -gt 2 ] || usage
+		KAS_AWS_DIR="$2"
+		shift 2
+		;;
+	--no-proxy-from-env)
+		KAS_NO_PROXY_FROM_ENV=1
+		shift 1
+		;;
+	-v | -d)
+		KAS_VERBOSE=1
+		KAS_OPTIONS_DIRECT="${KAS_OPTIONS_DIRECT} -d"
+		shift 1
+		;;
+	--*)
+		usage
+		;;
+	clean)
+		[ $# -eq 1 ] || usage
+		KAS_CLEAN_DIR=build/tmp
+		if [ -n "${KAS_ISAR_ARGS}" ]; then
+			set_container_image_var
+			# SC2086: Double quote to prevent globbing and word splitting.
+			# shellcheck disable=2086
+			trace ${KAS_CONTAINER_COMMAND} run -v "${KAS_WORK_DIR}":/work:rw \
+					 --workdir=/work --rm ${KAS_ISAR_ARGS} \
+					 ${KAS_CONTAINER_IMAGE} \
+					 sudo rm -rf ${KAS_CLEAN_DIR}
+		else
+			trace rm -rf "${KAS_WORK_DIR}/${KAS_CLEAN_DIR}"
+		fi
+		exit 0
+		;;
+	build|shell)
+		KAS_CMD=$1
+		shift 1
+		break
+		;;
+	*)
+		usage
+		;;
+	esac
+done
+
+[ -n "${KAS_CMD}" ] || usage
+
+KAS_EXTRA_BITBAKE_ARGS=0
+
+# parse kas sub-command (build or shell) options
+while [ $# -gt 0 ] && [ $KAS_EXTRA_BITBAKE_ARGS -eq 0 ]; do
+	case "$1" in
+	-h|--help)
+		set_container_image_var
+		# SC2086: Double quote to prevent globbing and word splitting.
+		# shellcheck disable=2086
+		trace ${KAS_CONTAINER_COMMAND} run ${KAS_CONTAINER_IMAGE} ${KAS_CMD} --help
+		exit 0
+		;;
+	--skip|--target|--task)
+		KAS_OPTIONS="${KAS_OPTIONS} $1 $2"
+		shift 2
+		;;
+	-c|--cmd|--command)
+		KAS_BITBAKE_C_OPTION_ARGS="$2"
+		shift 2
+		;;
+	--)
+		KAS_EXTRA_BITBAKE_ARGS=$#
+		;;
+	-*)
+		KAS_OPTIONS="${KAS_OPTIONS} $1"
+		shift 1
+		;;
+	*)
+		KAS_FILES=
+		# SC2086: Double quote to prevent globbing and word splitting.
+		# shellcheck disable=2086
+		for FILE in $(IFS=':'; echo $1); do
+			if ! KAS_REAL_FILE="$(realpath -qe "$FILE")"; then
+				echo "Error: configuration file '${FILE}' not found"
+				exit 1
+			fi
+			if [ -z "${KAS_FILES}" ]; then
+				KAS_FIRST_FILE="${KAS_REAL_FILE}"
+				KAS_FILES="${KAS_REAL_FILE}"
+			else
+				KAS_FILES="${KAS_FILES}:${KAS_REAL_FILE}"
+			fi
+		done
+		shift 1
+		;;
+	esac
+done
+
+[ -n "${KAS_FIRST_FILE}" ] || usage
+
+BUILD_SYSTEM=$(grep -e "^build_system: " "${KAS_FIRST_FILE}" 2>/dev/null | sed 's/build_system:[ ]\+//')
+if [ "${BUILD_SYSTEM}" = "isar" ]; then
+	enable_isar_mode
+fi
+
+set_container_image_var
+
+KAS_FILE_DIR="$(dirname "${KAS_FIRST_FILE}")"
+
+KAS_REPO_DIR=$(git -C "${KAS_FILE_DIR}" rev-parse --show-toplevel 2>/dev/null) \
+	|| KAS_REPO_DIR=$(hg --cwd "${KAS_FILE_DIR}" root 2>/dev/null) \
+	|| KAS_REPO_DIR=${KAS_FILE_DIR}
+
+KAS_FILES=/repo/"$(echo "${KAS_FILES}" | sed 's|'"${KAS_REPO_DIR}"'/||g;s|:|:/repo/|g')"
+
+trace mkdir -p "${KAS_WORK_DIR}"
+
+if [ "$(id -u)" -eq 0 ] && [ "${KAS_ALLOW_ROOT}" != "yes" ] ; then
+	echo "Error: Running as root - may break certain recipes."
+	echo "Better give a regular user docker access. Set" \
+	     "KAS_ALLOW_ROOT=yes to override."
+	exit 1
+fi
+
+set -- "$@" -v "${KAS_REPO_DIR}":/repo:ro \
+	-v "${KAS_WORK_DIR}":/work:rw --workdir=/work \
+	-e USER_ID="$(id -u)" -e GROUP_ID="$(id -g)" --rm
+
+if [ -n "${KAS_SSH_DIR}" ] ; then
+	if [ ! -d "${KAS_SSH_DIR}" ]; then
+		echo "Passed KAS_SSH_DIR '${KAS_SSH_DIR}' is not a directory"
+		exit 1
+	fi
+	set -- "$@" -v "$(readlink -f "${KAS_SSH_DIR}")":/etc/skel/.ssh:ro
+fi
+
+if [ -n "${KAS_AWS_DIR}" ] ; then
+	if [ ! -d "${KAS_AWS_DIR}" ]; then
+		echo "Passed KAS_AWS_DIR '${KAS_AWS_DIR}' is not a directory"
+		exit 1
+	fi
+	set -- "$@" -v "$(readlink -f "${KAS_AWS_DIR}")":/etc/skel/.aws:ro \
+		-e AWS_CONFIG_FILE="${AWS_CONFIG_FILE:-/etc/skel/.aws/config}" \
+		-e AWS_SHARED_CREDENTIALS_FILE="${AWS_SHARED_CREDENTIALS_FILE:-/etc/skel/.aws/credentials}"
+fi
+
+if [ -t 1 ]; then
+	set -- "$@" -t -i
+fi
+
+if [ -n "${DL_DIR}" ]; then
+	trace mkdir -p "${DL_DIR}"
+	set -- "$@" \
+		-v "$(readlink -f "${DL_DIR}")":/downloads:rw \
+		-e DL_DIR=/downloads
+fi
+
+if [ -n "${SSTATE_DIR}" ]; then
+	trace mkdir -p "${SSTATE_DIR}"
+	set -- "$@" \
+		-v "$(readlink -f "${SSTATE_DIR}")":/sstate:rw \
+		-e SSTATE_DIR=/sstate
+fi
+
+if [ -n "${KAS_REPO_REF_DIR}" ]; then
+	set -- "$@" \
+		-v "$(readlink -f "${KAS_REPO_REF_DIR}")":/repo-ref:ro \
+		-e KAS_REPO_REF_DIR="${KAS_REPO_REF_DIR}"
+fi
+
+for var in TERM KAS_DISTRO KAS_MACHINE KAS_TARGET KAS_TASK \
+           KAS_PREMIRRORS; do
+	if [ -n "$(eval echo \$${var})" ]; then
+		set -- "$@" -e "${var}=$(eval echo \"\$${var}\")"
+	fi
+done
+
+# propagate only supported SHELL settings
+case "$SHELL" in
+/bin/sh|/bin/bash|/bin/dash)
+	set -- "$@" -e "SHELL=$SHELL"
+	;;
+*)
+	set -- "$@" -e "SHELL=/bin/bash"
+	;;
+esac
+
+if [ -z "${KAS_NO_PROXY_FROM_ENV+x}" ]; then
+	for var in http_proxy https_proxy ftp_proxy no_proxy NO_PROXY; do
+		if [ -n "$(eval echo \$${var})" ]; then
+			set -- "$@" -e "${var}=$(eval echo \$${var})"
+		fi
+	done
+fi
+
+# SC2086: Double quote to prevent globbing and word splitting.
+# shellcheck disable=2086
+set -- "$@" ${KAS_ISAR_ARGS} ${KAS_WITH_LOOP_DEV} ${KAS_RUNTIME_ARGS} \
+    ${KAS_CONTAINER_IMAGE} ${KAS_OPTIONS_DIRECT} ${KAS_CMD} ${KAS_OPTIONS}
+if [ -n "${KAS_BITBAKE_C_OPTION_ARGS}" ]; then
+	set -- "$@" -c "${KAS_BITBAKE_C_OPTION_ARGS}"
+fi
+# SC2086: Double quote to prevent globbing and word splitting.
+# shellcheck disable=2086
+set -- "$@" ${KAS_FILES}
+
+# rotate any extra bitbake args from the front to the end of the argument list
+while [ $KAS_EXTRA_BITBAKE_ARGS -gt 0 ]; do
+	arg="$1"
+	shift 1
+	set -- "$@" "$arg"
+	KAS_EXTRA_BITBAKE_ARGS=$((KAS_EXTRA_BITBAKE_ARGS - 1))
+done
+
+trace ${KAS_CONTAINER_COMMAND} run "$@"
diff --git a/kas.yml b/kas.yml
index 8982373..697205e 100644
--- a/kas.yml
+++ b/kas.yml
@@ -10,7 +10,9 @@
 #
 
 header:
-  version: 8
+  version: 10
+
+build_system: isar
 
 machine: qemu-amd64
 distro: jailhouse-demo
diff --git a/opt-latest.yml b/opt-latest.yml
index 3c4d9aa..3e15942 100644
--- a/opt-latest.yml
+++ b/opt-latest.yml
@@ -10,7 +10,7 @@
 #
 
 header:
-  version: 8
+  version: 10
 
 local_conf_header:
   latest: |
diff --git a/opt-rt.yml b/opt-rt.yml
index 79a0d58..4ad2b23 100644
--- a/opt-rt.yml
+++ b/opt-rt.yml
@@ -10,7 +10,7 @@
 #
 
 header:
-  version: 8
+  version: 10
 
 local_conf_header:
   preempt-rt: |
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6518d7575fffc47a379dc97c43c4162442f4aa18.1621593454.git.jan.kiszka%40siemens.com.
