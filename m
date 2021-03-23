Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRXF46BAMGQECGT3STI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D15346037
	for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 14:53:11 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id u4sf1459460ljo.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 23 Mar 2021 06:53:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616507590; cv=pass;
        d=google.com; s=arc-20160816;
        b=M3RFNAZ8oW75NSVSXqmJS5tTTdly5Hb96AaogK4JFgto/L9LUP918sfZJQM7NdVoNF
         9XzlS+B0coxk96Yiie7jr1kC4vSyEsoxzeWWHqdrKgpi+ARmhsx5ABXnC6CUYdTDIWrX
         sXVXxvRkVoZREiZ7cC9WfK3kDZtqhZgDbwRym2frI4//77c9XiV5Prbi05Nvp5EhTp0e
         xxRpmPg7iQw3AhMuP636EI/Umx3RcfrIo9IHyfloKWvo4o/K4gDtdWxTkvvegGRLO7sO
         c+a3cAM7UXmpbqVIk7EnlDJU+Q9KCEkq2Rghor73Y6RJuSoNEgzSXFfOHxtQctTTu4Yo
         0khw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=WdCHwYh1cird61ZxuYxJya0WNRE7akbpotuBWxIHOqQ=;
        b=VK4X1LD30T/TnqmLbBLedYGojCIhYcuOOGeDHNmI5sJ4TC1nbop4BykIrv6MmoMUGk
         52qOZLW24EtohHoWGOf6qPFf/i3KnK8ymiT768m/rNWu98sNGykP69fRzBaZ/2Kp61fN
         Ey+hnPL+RglHX3s8ikh6sZ7R2uCWwQYVfnU4DeQFwY/vfdq5mFVj6QiGgUqTr4Sr8KGy
         SQASsya9RjRFpe34YIeWKM4vYLiHSybjJTTA2qwNr2wqVR7oxZQvZYvakPV/IRuwHbBK
         lwt1bp7jtz1G6zMe1CIJqYt2gbHMykXPnEhFXIA6y6TaS7g0bAW1dXjVW+wPz9a7dkJN
         nsGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WdCHwYh1cird61ZxuYxJya0WNRE7akbpotuBWxIHOqQ=;
        b=Gq8z10RgXNu/1vip+MUiuXNUd2RFYRl+u8aYM5sNMmdWGVyOYdk44wDuOTwSPTxdG3
         dV5tku2mtzBaXXRQPIlyddgl4tPjeBePX9zyNfycZ/uzcR2odSvXo9thnPNz4OqD8+wL
         nadc/uGsDKZ63A0m5F5eFC0HMXnaxBSJsgM2c9JBa3Hyf+cguta0vtBY3DMWHtRxkXfi
         gSx1cGsDwxMNTzjlBuEA0/BFeJdExNX+aHrpzIfVVJpTB9MfA5YehgVAfj0SKwfXKVlv
         m0Awyqh6cvcqd1PN3HA8cuXtocxI8UZUE/8qde8bb8NR2Q/vUaxJtLe8CqnAVYB5msPd
         OUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WdCHwYh1cird61ZxuYxJya0WNRE7akbpotuBWxIHOqQ=;
        b=H/IJQw1a0sQYNLee3mkIM14y1AMWC6WvCPbY8+NYt+yyYSMEZQSHwDcx7TbS2RXIY7
         bIsNKx0kGhoWEo+qP0KOmmV+TdTIiiTHjcBVTqFLd4gmL++cxTUdmRJ8BAFrZL2G8W6N
         6mV1OqJWM1mDNgEyVupPpGBsPHCuL6w+bhYTsfKcdH4XJHThXJZYeK6QSD6fS7cq5gSe
         +wl0a4CMYYP3BEH0YA3cu5wJDRrbU7MV6OoGG59o9lKc4qRpXhkalVcgcc2WXKbHEZA6
         D8xhhh2FKcif3iF4yKK8/qF3mSkUsvXOEP+/LnI7pmx8AnfA01JxhmikiO3lNhIrdBDU
         nR3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533UVNYa3d1yL9Ac7dB156R2zwE2Gexr0NdNP+8R5kl3GE22N9UZ
	XQXDUGK/nBoKUwN1f4y7/ig=
X-Google-Smtp-Source: ABdhPJxB28osWHVUB4io4w0HFSac4aq73y13t5FI6Re/3QkvLWRJex1lH8iFHWqMw3FUrZ4vTkh5Jw==
X-Received: by 2002:a2e:9101:: with SMTP id m1mr3254565ljg.378.1616507590697;
        Tue, 23 Mar 2021 06:53:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:2050:: with SMTP id t16ls3175448ljo.4.gmail; Tue,
 23 Mar 2021 06:53:09 -0700 (PDT)
X-Received: by 2002:a2e:5710:: with SMTP id l16mr3151398ljb.228.1616507589457;
        Tue, 23 Mar 2021 06:53:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616507589; cv=none;
        d=google.com; s=arc-20160816;
        b=xK3Wu/BG43OlGzDA9fE4EhU75mfX44Q+vJmjMcobhphEnh2PmO59xuW4QOouk+smi9
         K3tFcFgDdxLePGrVYqw8imTrHsBTyQJBxezEpf7aeFyNuQO/TPWuU9TJDBdvr/1rO88A
         FK0zEJWzdjdAV+z6qUb3yokebk4bz0STviiTGmMDB6oi9lAdwiZo4s1YuIsjtUF62lEs
         Nn7HoYrdafEhsDoay/0AkDg5YsnRtbrNvZWfFO7eHPnXmztDake3R2Ftq9YoVpcKfRii
         7GRBnizY8jsAspV47WzEy8nZPOUAwwyA1yFbjH5/V+pyYdjeCeA1VpbXSHdyPspdz+Gz
         uroA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=+Y9MaWH7hHKfJquXko3Huyo2yY8kip/SNgSYUzL/IBI=;
        b=RdL7XNRH/y9Je9ZxBwkbT9M+PQgkTA+LBAFuSp1tn4V1DJhS0v6pb4n7w6850g+d2y
         UnuuZZlapsMTl6XnU6mdODdK8Vrgn+QR+6zKkwiFxTEnkTOcKm5SXnSKE1U6vkhI3O9W
         g9Js/gLvFHOOPckqFtCgEfzzlLlaXv0S/A9SFUmayStHovfxMHKsBsi0N/2vpD6udbT4
         BMjhsvsYUc/pe6mWspDXl2UxYLlN5N7U940RVOmAO7vhzvL1jgpdPoYVGc0wl6CGU4ba
         OOwtYNd5wykvpNr6UnPC6+WwJhj1whxT/19GCbU7KIiID0LHE5TcaxKJb5SzCHn0N/5W
         bFyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id v26si749333lfo.2.2021.03.23.06.53.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Mar 2021 06:53:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 12NDr8WH004196
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:53:08 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.18.33])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12NDm2Mj029573
	for <jailhouse-dev@googlegroups.com>; Tue, 23 Mar 2021 14:48:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 03/11] Address shellcheck reports
Date: Tue, 23 Mar 2021 14:47:54 +0100
Message-Id: <861534c4bd0ea309f641c6b0687c56c5ef5bb2d2.1616507282.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616507282.git.jan.kiszka@siemens.com>
References: <cover.1616507282.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/861534c4bd0ea309f641c6b0687c56c5ef5bb2d2.1616507282.git.jan.kiszka%40siemens.com.
