Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4M2T2CQMGQES7B3IGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4467038C510
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:37:38 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id h1-20020a2e9ec10000b02900edf305c2e1sf8664788ljk.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:37:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593457; cv=pass;
        d=google.com; s=arc-20160816;
        b=eUwDUKB/AusL2mlNsJPTn2pPhrL7jeupG2AGpAl8UGnMWtKFvTXoiQZ4Ixy5cqkXMN
         /jeIY/XmnEcY7irybeqHCKMk0a1IveZenfJGUvClY7taOuPomeZQKXyZ1BRRoC+9kC3P
         c1DfPJTp4ouGaa2vlyTSE1dVZzPiQE8/crehvzjZfcGTKEUMjKB+9ZerDp2SrIfOKEYx
         RxPhhZOKpeUpheTeEMfsPm219PClAoFfld11EaALhRHO0xjFMGIofBRqRGmgqQi8L4zA
         vq5+BLSB1HOTQGS29guJdA105KQ0f2VkYLei6g+n8cvOJo7qbrKZCSQJFFV2xejlC2dA
         iiFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=7hnsfjkHe5qRcaWRKiwKN4PY2JbnhbygD/zc0Z4pt2Y=;
        b=bu7RJFnm/HtCH84K15xZSuxPVBT4UXji8Pw8lz4rqKysrwcXOyj4wuxaiW6eMg4PjV
         3eWnf9nkC3Yjz8/8srnL7i+8sZRWnHOhpokshSp/kSqaRYnhWK9iLaO9z6/nAYLAb2/y
         fyNw8PoS69bTkulOO/f/EiLDnkVhhCjWlj8yZtldaCRNLQiTQK1XrCRXx6HXnlHFyMNo
         nhVAKv/zOyLGQLUdxc92aLYNS63rjioCoKPbGS8Sp4/09jJRzcuertBF3+fZrMjhmFPz
         l3NOxApdyZT6ashvZ1m3W5+WxlIj5aJl2hvtPhsswrUyTerHTHb2xamQYwCg9YX7xFT1
         Y4rA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7hnsfjkHe5qRcaWRKiwKN4PY2JbnhbygD/zc0Z4pt2Y=;
        b=HaLJTfZhBOxnTaRqj8Jbx7m9gH5lSZf0AD/gO6H/884AwCa1wVaTKVzsIVPdPYUxO7
         5ElY7qmKwBOQ/FjNRDSmHlTQEFXXa0p1B+Pvw8fUzjmct1bTzMx6DKTbQebIm3H+BxPU
         E9niID3dghdsUTAYXX/ECg7FkF3+cfkNLJ7EuPWRWvbbnbT2atEmG2gc2mwV8mZhmOjX
         CULoWvYSaENZHvJCVqyXqyrCTFvc8Mb34grer8AXud6bkL457ivsKlfmW3hL1fi82hKx
         ob4msjepm3tahvqxEsyqkSleWIn6mbpEinfESQBr0MS5geAQQeBktb6TZ4NpZOWQMt6z
         QAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7hnsfjkHe5qRcaWRKiwKN4PY2JbnhbygD/zc0Z4pt2Y=;
        b=QG+C4eoxPaeHiKeDGfsgL42dqpfu4blsFZISfcmopbHrbeH1OVxFd6j8/l1CPi99am
         YEAEA35e4Ns0hmP1biVJuM7a7ZOaxvPd1gD87JxP7ybt8OcVzNInMBOOhXHpJEQQvyjD
         SU/xHRtEc+lGhjRqpS4Sitm1F+7iRJvN/7AUWxDEY3yBTOu26TBIB6zZnFf3hnLTHUxi
         hVJA4bGDQa1Uf0CYbCboiNTJGjzm2WHRz+YNQu5M0ch+lZQ4OCbsL71SHvDWow9pJrtK
         tub6OF3Y0psfWUNjnFwcsvTK2Pnm5Z1HiRkLfH79aFyFaK38kal+l1acbjmepPHvVVgO
         ha9A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531Y4M20R9cYGkFotwXt+SFAPNUN28B+PHKTneR7lacaqojWrzAQ
	3dkgK0eyPETZd/VrvE2dTwo=
X-Google-Smtp-Source: ABdhPJxsRR6CYCiHEQO7BSrvHm+OKoE3mw3HxL6kx+5OrJStyChFK9GZAnaOC5Zkfv/bEDtxfCCaOw==
X-Received: by 2002:a05:6512:3a4:: with SMTP id v4mr1759384lfp.473.1621593457813;
        Fri, 21 May 2021 03:37:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9219:: with SMTP id k25ls642477ljg.7.gmail; Fri, 21 May
 2021 03:37:36 -0700 (PDT)
X-Received: by 2002:a2e:b5d8:: with SMTP id g24mr6415420ljn.115.1621593456631;
        Fri, 21 May 2021 03:37:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593456; cv=none;
        d=google.com; s=arc-20160816;
        b=lcn29iidBfwsb9/YOcLwj9vV953WvjGZYwY6efCzC5wpVQJd4u42zXLY44pHpZBeMb
         F86KXq+1i8vzm6IC09ZG3Ph4Y4uofEN96tTq6oAb32AWuFC6hvOg6GDuxtoAjiKxyfTT
         8Ejwd+OARhzWdncoANHHyGBe5WPo1qd6Hp1ZC7qPUuQfkGT7fuwFGv1g9uMpxsBP7LqE
         BvdbZU8MyHE70ggVJ1q8Lq1a2aSt3Nx4T7wD1bq562/D1cqw3/ovKxESUd1bRvMESPCx
         /RpD7Hl3MLOMD/TCnBx8rvDrZGeUp0X9l4IHWB6ENL1c7n4Wj4jFxYa1EnfDhf0d9qyw
         vSpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+Y9MaWH7hHKfJquXko3Huyo2yY8kip/SNgSYUzL/IBI=;
        b=Jn9x74O18I9qK5W2atlVq7OcK6fEzuGwr6xsegh6IAzkdEXjc7SDLweQGbemda9CqS
         hsZCdWcpS4RlL1rnxm35xYXND8XeadC6idv4k8TPsKqGOljlvANM3zKg6xxI9dWtjv58
         VSBMzOj6bdUDuUaoAsmrcgbrHIQaXi4M4pmiHa8t+9zkhR00Y4hJPiWuXt7x2F3lU4QE
         PEbKB+yB9P0a2y1YTDHxJZAXZfHeSBy1y4I51+q50GbHIMP3xlgemtGGuvfKUqHMN1hP
         RNwDhK4iV70OhZz+JFQvV7h47TOI9hJlo6pr66K699Hm/5Qi0Ca3hDvPGeeZAXqxWuRp
         mXgg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o3si283707lfg.7.2021.05.21.03.37.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:37:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAbaKK002683
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:36 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYc8032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:35 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 03/22] Address shellcheck reports
Date: Fri, 21 May 2021 12:37:15 +0200
Message-Id: <f5deeb763c287703ee1a564aac02d663ceeeefbc.1621593454.git.jan.kiszka@siemens.com>
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 build-images.sh      | 33 +++++++++++++++++----------------
 scripts/make_release | 10 +++++-----
 start-qemu.sh        | 18 ++++++++++--------
 3 files changed, 32 insertions(+), 29 deletions(-)

diff --git a/build-images.sh b/build-images.sh
index 772bdbd..7b5d071 100755
--- a/build-images.sh
+++ b/build-images.sh
@@ -12,16 +12,17 @@
 
 usage()
 {
-	echo "Usage: $0 [OPTIONS]"
-	echo -e "\nOptions:"
-	echo -e "--latest\tBuild latest Jailhouse version from next branch."
-	echo -e "--all\t\tBuild all available images (may take hours...)."
-	echo -e "--shell\t\tDrop into a shell to issue bitbake commands" \
-		"manually."
+	printf "%b" "Usage: $0 [OPTIONS]\n"
+	printf "%b" "\nOptions:\n"
+	printf "%b" "--latest\tBuild latest Jailhouse version from next" \
+		    "branch.\n"
+	printf "%b" "--all\t\tBuild all available images (may take hours...).\n"
+	printf "%b" "--shell\t\tDrop into a shell to issue bitbake commands" \
+		    "manually.\n"
 	exit 1
 }
 
-JAILHOUSE_IMAGES=$(dirname $0)
+JAILHOUSE_IMAGES=$(dirname "$0")
 KAS_CONTAINER=${KAS_CONTAINER:-${JAILHOUSE_IMAGES}/kas-container}
 KAS_FILES="${JAILHOUSE_IMAGES}/kas.yml"
 CMD="build"
@@ -38,9 +39,9 @@ while [ $# -gt 0 ]; do
 		;;
 	--all)
 		KAS_TARGET=
-		while read MACHINE DESCRIPTION; do
+		while read -r MACHINE DESCRIPTION; do
 			KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
-		done < ${JAILHOUSE_IMAGES}/images.list
+		done < "${JAILHOUSE_IMAGES}/images.list"
 		shift 1
 		;;
 	--shell)
@@ -58,22 +59,22 @@ if [ -z "${KAS_TARGET}" ]; then
 	IFS="	"
 	MACHINES=
 	NUM_MACHINES=0
-	while read MACHINE DESCRIPTION; do
+	while read -r MACHINE DESCRIPTION; do
 		MACHINES="${MACHINES} ${MACHINE}"
 		NUM_MACHINES=$((NUM_MACHINES + 1))
 		echo " ${NUM_MACHINES}: ${DESCRIPTION}"
-	done < ${JAILHOUSE_IMAGES}/images.list
+	done < "${JAILHOUSE_IMAGES}/images.list"
 	echo " 0: all (may take hours...)"
 	echo ""
 
-	echo -n "Select images to build (space-separated index list): "
-	read SELECTION
+	printf "Select images to build (space-separated index list): "
+	read -r SELECTION
 	[ -z "${SELECTION}" ] && exit 0
 
 	IFS=" "
 	KAS_TARGET=
 	for IDX in ${SELECTION}; do
-		if [ ${IDX} -eq 0 ] 2>/dev/null; then
+		if [ "${IDX}" -eq 0 ] 2>/dev/null; then
 			KAS_TARGET=
 			for MACHINE in ${MACHINES}; do
 				KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
@@ -83,7 +84,7 @@ if [ -z "${KAS_TARGET}" ]; then
 
 		N=1
 		for MACHINE in ${MACHINES}; do
-			if [ ${N} -eq ${IDX} ] 2>/dev/null; then
+			if [ ${N} -eq "${IDX}" ] 2>/dev/null; then
 				KAS_TARGET="${KAS_TARGET} mc:${MACHINE}-jailhouse-demo:demo-image"
 				break
 			fi
@@ -97,4 +98,4 @@ if [ -z "${KAS_TARGET}" ]; then
 fi
 export KAS_TARGET
 
-${KAS_CONTAINER} ${CMD} ${KAS_FILES}
+${KAS_CONTAINER} ${CMD} "${KAS_FILES}"
diff --git a/scripts/make_release b/scripts/make_release
index dfa2048..e1927ca 100755
--- a/scripts/make_release
+++ b/scripts/make_release
@@ -26,17 +26,17 @@ if [ ! -d .git ]; then
 	exit 1
 fi
 
-if [ -n "`git status -s -uno`" ]; then
+if [ -n "$(git status -s -uno)" ]; then
 	echo "Working directory is dirty!"
 	exit 1
 fi
 
-echo -e "Tag commit\n\n    `git log -1 --oneline`"
-echo -e "\nof branch\n\n    `git branch | sed -n 's/^\* //p'`"
+echo -e "Tag commit\n\n    $(git log -1 --oneline)"
+echo -e "\nof branch\n\n    $(git branch | sed -n 's/^\* //p')"
 echo -ne "\nas $name? (y/N) "
-read answer
+read -r answer
 if [ "$answer" != "y" ]; then
 	exit 1
 fi
 
-git tag -as $name -m "Release $name"
+git tag -as "$name" -m "Release $name"
diff --git a/start-qemu.sh b/start-qemu.sh
index 1472b99..65385a7 100755
--- a/start-qemu.sh
+++ b/start-qemu.sh
@@ -12,9 +12,9 @@
 
 usage()
 {
-	echo "Usage: $0 ARCHITECTURE [QEMU_OPTIONS]"
-	echo -e "\nSet QEMU_PATH environment variable to use a locally " \
-		"built QEMU version"
+	printf "%b" "Usage: $0 ARCHITECTURE [QEMU_OPTIONS]\n"
+	printf "%b" "\nSet QEMU_PATH environment variable to use a locally " \
+		    "built QEMU version\n"
 	exit 1
 }
 
@@ -64,13 +64,15 @@ case "$1" in
 		;;
 esac
 
-IMAGE_PREFIX="$(dirname $0)/build/tmp/deploy/images/qemu-${DISTRO_ARCH}/demo-image-jailhouse-demo-qemu-${DISTRO_ARCH}"
-IMAGE_FILE=$(ls ${IMAGE_PREFIX}.ext4.img)
+IMAGE_PREFIX="$(dirname "$0")/build/tmp/deploy/images/qemu-${DISTRO_ARCH}/demo-image-jailhouse-demo-qemu-${DISTRO_ARCH}"
+IMAGE_FILE=$(ls "${IMAGE_PREFIX}.ext4.img")
 
 shift 1
 
-${QEMU_PATH}${QEMU} \
-	-drive file=${IMAGE_FILE},discard=unmap,if=none,id=disk,format=raw \
+# SC2086: Double quote to prevent globbing and word splitting.
+# shellcheck disable=2086
+"${QEMU_PATH}${QEMU}" \
+	-drive file="${IMAGE_FILE}",discard=unmap,if=none,id=disk,format=raw \
 	-m 1G -serial mon:stdio -netdev user,id=net \
 	-kernel "${IMAGE_PREFIX}-${KERNEL_SUFFIX}" -append "${KERNEL_CMDLINE}" \
-	-initrd ${IMAGE_PREFIX}-initrd.img ${QEMU_EXTRA_ARGS} "$@"
+	-initrd "${IMAGE_PREFIX}-initrd.img" ${QEMU_EXTRA_ARGS} "$@"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f5deeb763c287703ee1a564aac02d663ceeeefbc.1621593454.git.jan.kiszka%40siemens.com.
