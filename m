Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWHB66BQMGQEFDW26XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F858364CC4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:06:33 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id x28-20020a056512047cb02901ae692ee37esf1275593lfd.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:06:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866392; cv=pass;
        d=google.com; s=arc-20160816;
        b=iYoRrAJWoLKDt7VI4N+V82vcOkhAF3/CSXOr93gynTjUqguKe/RLryMiKspMGVr+5Q
         J//ZvhI/xb51UkQbGatiyw4YRb+wWN7x14c0Ie6ys7mOxU8WZE0H94M+bZV+XZUiIv8l
         bk2Z/r1BMOMPM0kfUxfyPRKPiftmoStAFmxRVKuN1KhoOj1iLreKIuQmeFgozk5RBVbo
         TT7dRq0EQN9odXEyuR+Wh3i3rsq+1c33xWaRA7zd+gQ8I9J6Bv5tPEns0ZW6LJmiDUdg
         nncqDrdRrrfJmO+LCeVXQdlpyxtV74iD6x/IpJvUzW1+iSiM8WpHswaBNhvYBdKjDx53
         lSKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=aMu1SHF4Yy9OfdkG/GrDCSL0ZxpbBLD/vAipbPU/fWc=;
        b=EB9Wlkjt6P/TgpJqU95psZJ5Ny4G5D0AbAOSojAbg9e1F4EmG7ssbIvPXTOh5ho3yn
         yA3OHaIFPJsPR+9Y8r5KSCGadMKFLQCsvfg/MnMfyncXF6TU57dqaLjML+dwMLLllQV0
         ZZqx+NTw5e0n7UZmgthREcvo2mRe4dujswxM9b49TLBaRhGEpq979Ul8M5jRJ0xRNQ7O
         R5tzIDJfRlZgSpdGbsHZ7aLAHq/zP84c9z7qQHbbC4RAoivDg9rNKFTEx5otzsPfvXZ5
         cdPlPsQfAl1+oCnuWna7a7kE+IXC/6TqfphsYQEYwH1R2Awc5ScNVw6Bpp1BFtREXuTh
         rN4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aMu1SHF4Yy9OfdkG/GrDCSL0ZxpbBLD/vAipbPU/fWc=;
        b=VMOVhiHVw6RcEgYgNyEf7dV3kxw2dkKKvrWUuVz6Qt9aLV0S7W3QBLOcr+eRsnT+Gn
         s3P0JiCIfqTUVSaJ6NiHtUHj/hX5gDL4vXK7WvRY/YJAkX3+x3+E7g3y7safEFc9orW9
         rGdstnkM7OO5KvzOqZabw8wUG2h/lWXaNBjrUFS89DN9jt73HmfBtTEZF6s3txrA9AGT
         wVF/DT1mByNbr2tI7cdYxxDB8ttvZ3xiUCGHbsajXPNqRe2ugUX02SxeY7Cxq3broAF3
         QsKoahgRNTZgHU0LXee5gQcsdiTR/fkdd4fy5UpaG9fWh8D0LD9FPa9zagrLfQ7COYcw
         vZ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aMu1SHF4Yy9OfdkG/GrDCSL0ZxpbBLD/vAipbPU/fWc=;
        b=G8T+zXWfRxjo1Ps8MigO7GvrSwb5q2qukHu9HCE12uNsNlHMacTW6mZzqKXqwCxpQq
         hJBkoRNM4TTlacdHqoQvXj0vpHFCmpmP48wVLnn+H3rBsmaYbYbVI3KjK9RSC0VRUmCz
         tlrS0oAFlOi2YcmJK6cEw4hYaBc6XvWiyiJyM3cGCUiTHABQfwsoFM9G0u7jXFDb11AO
         UH5oJYMwx6aHHQXMWcslIe2h3vTH5tjJ+Fy3cg5xUaGnxeo3P+7wxMwZCzVTTuqnWzha
         89HBmmUbi7ZXxfl6ta1vN26AkBThWDkU8Et9t3+yk0RJfu3Ixl83AZSEqO1/2Sy7aLSy
         LbJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532LSiSWn0J1RG1O4s/Wg1kEs5XCFIFFMDF3cfJ37W3gddqdWz4l
	VX6pbhdZICBuI96EvAR1ICA=
X-Google-Smtp-Source: ABdhPJxuXkuizc86e87hTRT0Wurv9HC1XeENbO34HmEuLU4ghT5PGs0rM2+xbYbyDj1QgsMiGoNDAA==
X-Received: by 2002:a05:6512:3681:: with SMTP id d1mr10602298lfs.495.1618866392720;
        Mon, 19 Apr 2021 14:06:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:c22:: with SMTP id z34ls1624921lfu.2.gmail; Mon, 19
 Apr 2021 14:06:31 -0700 (PDT)
X-Received: by 2002:ac2:43a5:: with SMTP id t5mr13538787lfl.243.1618866391487;
        Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866391; cv=none;
        d=google.com; s=arc-20160816;
        b=CU/XWcdF3PkWfMfmfeZ3P00oRgQ1rh1cO/XVePi9LmE8OmFpgNfP6VU1KAhDmrCplc
         VuS0LH+JAkvI2zKHIwIoaIAuMIRIXrn2N/bBPz2ZoRYMFvhMQJ2XF/CkBtzMsHtmQc6/
         JihqzC6SvsIjRh27WMxOVp6dH9oSSiOTjYabRgEb2CKquKbcFl/apML/o5SPrPoWT4/C
         K00duvr9q+4cF4eWSsNwz6FBLj0iyaafxlCAPpPeokjKjl2ktdxeP48/NoZVQSqPiLEQ
         rPji29gtdXkaghCVJB4cEvnDcsBooRJkY21cBqZ17CxQM0AxLnqLyd3ICL/uN2bdbFeA
         RF1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+Y9MaWH7hHKfJquXko3Huyo2yY8kip/SNgSYUzL/IBI=;
        b=1JzCAfUd3u5seEhduXzgGQbac4e3ZplSJVmWWn6ILG9yy11xuxjPuq4g0aZHwCn4wn
         O9+wVMqQg4xFyBH/3Bh13tb5HRiy9SMzzVcGCKlhCEzg7R58hr+rLJLrlGy+FJTDucc+
         USGIzcR5BOS8XqWJF1py8d65ity7ZlKzUP4EWM0TmuclsQqc+/TbVsh1NRVmjkKqu4qX
         bHsuadvhfZcg9/kzsjBLkdf6VnXP+18XcHuOow3qdv1UBbFEwagit/nwEdNMgDASNG2O
         0bfQ606XDMDyMngOicbIx33sADGFuBJLovvfxz8+h7wlC+urHhxWn/55ITXZtK4U2MPl
         Rnlg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v3si1030194lfp.0.2021.04.19.14.06.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JL6Uds022107
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:30 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6TpW015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:30 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 03/20] Address shellcheck reports
Date: Mon, 19 Apr 2021 23:06:12 +0200
Message-Id: <3bdc60c9c2e3237b9d32ff4af69f3f3964083042.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3bdc60c9c2e3237b9d32ff4af69f3f3964083042.1618866389.git.jan.kiszka%40siemens.com.
