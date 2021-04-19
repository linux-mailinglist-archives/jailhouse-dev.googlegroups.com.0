Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBMXD66BQMGQELUELQMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 8577B364CD8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 23:10:10 +0200 (CEST)
Received: by mail-ed1-x540.google.com with SMTP id y10-20020a50f1ca0000b0290382d654f75esf11849435edl.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Apr 2021 14:10:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618866610; cv=pass;
        d=google.com; s=arc-20160816;
        b=sFcOzeWcR9wwf54mhu1FTqtiakyfFgRdV/ztefbPHasvnT3UD8WzN6jgLvVcRQmRBG
         lCk84b1ZMf26acohFbF1hk86Yaye1Ca30ciRPWzzYPVsojcxgcJ8M07vTRb4z3F/5Iru
         jUunmg4bh0FB7JCa8P4jFlK7j8g+ttrAGQTGZ+nDWqfJs9k2x1JKhMONk3TMK6kPeVIP
         5zRctLh1ri2FrzOnO/VC4qRA/OmRKvPMShMprbtMY4kWz0z/iSjdq3sFFa2VEMESvvEM
         pwM0yWE84Jt8Gv13Ql0SP9QgVig7ctAyWtT8GCacA28qyD7RGPPVeJ0qZ6cybhlitnQF
         UtIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=HmBqwaqvz52CKQoxrFesbLzdHicrWOLxH5yIKweWmjM=;
        b=qy6kMaiTkjE3Mw/EsrfWmn9rhm3fffmFecIQc4hFhIbpPyJFisLwOFBaBUn4MR/B2r
         50V1AdbvU5CFB9HAffmUffTnaHyJXsb9H0taEZuD6PkE0/jCEW36iWYLyqqogljDLzgl
         18hmdsmv57FSLz1a3WASaOjLLR9Ln1ZG2YR/f7Cws5p8utcTT+s/ttO+YoilqCWOWYVq
         jJFA6Wl6gqCp3jtTsiBJIR5z8EknIzLhbhzlPgw0Ncm7RbwivSaTt5guwPAYQ/BfiLGy
         V/JJSmO/bcQphfjnFkGDWTvFCPenQHa//PY0JLxUlzuvQxuQOsSiAXoWNts4K9Kj0XOZ
         DX1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HmBqwaqvz52CKQoxrFesbLzdHicrWOLxH5yIKweWmjM=;
        b=G/o21moPSZMvDLyfIZtRStT3mUp7pOvnyv/RAS4UbvNe52YB7ThfF3c7or1anDXgw3
         zQYmlh55QPRfKLDV/hBP1+6r4j5HxA4gFtf+aNvfot2UhRkE975zUU/iJDdzpCvyloOR
         r61v57W8zwonBQ2QxrhVY/Qd9E1iZhZO6YaYo5isIAPvQVRFLoIAzW8b6WXcYUtcensd
         /IGHxwI/ejIe3GGKtVUbb1b4MgxFEK1DAdvadsjOnHgNpwkbc1akBZ7mgVXYMDdJDvpT
         6GXNHmaiDB9l5xLSO4ky4fPgXTuypxWN+Zr2AeYHJugTU/gC6uPdyE9OVrPucsv5oc/c
         jrnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=HmBqwaqvz52CKQoxrFesbLzdHicrWOLxH5yIKweWmjM=;
        b=WaiRV0SlOPHoTW1w/1q7NPYSOkhk3Oyp0Ic/NJzHoigh/7Dt8mcceU1+BL83DP0GyC
         aDoVWscmVYBzFXo5oqA6YuU0lgEemk96pKRn20ZGQIDoXec4iTnD6cS7E08F9oiM5V2O
         Bt0hjXI6gnXANSglGP+lQeqp3OBC03ooiM1smRbGZZ4P1MuB61+FTofYJmtJr/OcVwXH
         S4wX2Wi6FKbVq8KF+vJxI0cSZofpXueFPIxqacHxDB31RLcvrCRy+aIXAkAdE5cciI1M
         vP6NjYkJJo3NguVKTy4eY9HLmp4JzNh5npbR3tUqdjRFSMJPh/H/2Ik9L66TehTU/AME
         NsrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5302q4vpkJxMwZ9rd+rGkYATLO6UAZoJDpS6wLErJXkV9wBslwZH
	A9gNFqRRQDqGU51CJG4rve4=
X-Google-Smtp-Source: ABdhPJz7tKU3rpZARYXNWWwLiORSEIqJCjQW0VbjOhEpackUCuhE77ZBcStSgzdyv3fENTJzhGxKaw==
X-Received: by 2002:aa7:c893:: with SMTP id p19mr20622845eds.256.1618866610335;
        Mon, 19 Apr 2021 14:10:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1901:: with SMTP id a1ls7931116eje.0.gmail; Mon, 19
 Apr 2021 14:10:09 -0700 (PDT)
X-Received: by 2002:a17:906:36da:: with SMTP id b26mr6176971ejc.8.1618866609381;
        Mon, 19 Apr 2021 14:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618866609; cv=none;
        d=google.com; s=arc-20160816;
        b=VKOBwh2mo5fLhkACBOojSXOsc/eIiCgjWfTmgGMpAHDsgcp+4vq1bCxYCHRi1p9BDg
         /jXADALfy9juGzmCkMAv/1I45DLHh7Wjk0iYS4Y1P8wmPr5h7vD7qs/5Ob2TVu2R5AOm
         IHwllzVyC0mW6X954+u5N+8itm5KdUwdMX6F5MDl+uMevsQBHU5117Nf2uh9fuiGKTTl
         ngkkrwHoWLYnKscfaNFpL3HMBOlFfsYhUzQrBTFxQ2AbggfagTEBzp2+gcxdAIoCRsx7
         dCrROC92JoCmv8Gu8QQLcG7+Bj6VuRgcdI3pcWp1tzg+0z5EZ9re1RLwq6rCaOgmDPGi
         17Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=InQQ3chDmIBUizu7rlE7rdwqOMwz5g/pj+Pr1BXOVjw=;
        b=XdiUDkDTNnw3qzz+qw7KPygYdbM0qH9DX++S5pkO2gS5fZUYobgMUebe3cTYsTaKAm
         1htBtqSXbG1Wzd0XkZ+/mKg4a5QjVffyTG+FFOb9Mq2pQXELq1+gael4125FjVs2Mu01
         YcqQFC4468NU7IhLQGtqfFTPNkjMJXYZDDb7qfWvGsyvNmFMZ0B9TuB1GvRsLmBoqWlD
         E2F0UQoeQXgxorGhLnESlALqryuIAv4ZX/A+tDmBOw9r2VdIV88Up28QCmwCfUyy4YKV
         YS664nY0iTqRO5GMgmVOQ4YcHNa38qeWbCs6krt3wRnNfQokP381rpXzrBGwfD/3zdIL
         Uowg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id r21si1170125ejo.0.2021.04.19.14.10.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Apr 2021 14:10:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 13JLA9uP027187
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:10:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.116])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 13JL6Tpa015242
	for <jailhouse-dev@googlegroups.com>; Mon, 19 Apr 2021 23:06:31 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v2 07/20] Hook up QEMU ARM support
Date: Mon, 19 Apr 2021 23:06:16 +0200
Message-Id: <be2c3ee8093a779b4674be2419a630f3d9e77c61.1618866389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1618866389.git.jan.kiszka@siemens.com>
References: <cover.1618866389.git.jan.kiszka@siemens.com>
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

One of the reasons to limit building to --latest: config files and a
number of fixes were not present in last release 0.12 and would require
significant backporting.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 conf/machine/qemu-arm.conf                    | 14 ++++++++++++++
 conf/multiconfig/qemu-arm-jailhouse-demo.conf | 14 ++++++++++++++
 images.list                                   |  1 +
 start-qemu.sh                                 | 15 +++++++++++++++
 4 files changed, 44 insertions(+)
 create mode 100644 conf/machine/qemu-arm.conf
 create mode 100644 conf/multiconfig/qemu-arm-jailhouse-demo.conf

diff --git a/conf/machine/qemu-arm.conf b/conf/machine/qemu-arm.conf
new file mode 100644
index 0000000..7bfe8c9
--- /dev/null
+++ b/conf/machine/qemu-arm.conf
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+require qemu-machine.inc
+
+DISTRO_ARCH = "armhf"
diff --git a/conf/multiconfig/qemu-arm-jailhouse-demo.conf b/conf/multiconfig/qemu-arm-jailhouse-demo.conf
new file mode 100644
index 0000000..fd642bc
--- /dev/null
+++ b/conf/multiconfig/qemu-arm-jailhouse-demo.conf
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+MACHINE = "qemu-arm"
+
+DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index 4e52648..4e500fd 100644
--- a/images.list
+++ b/images.list
@@ -1,4 +1,5 @@
 qemu-amd64	QEMU/KVM Intel-x86 virtual target
+qemu-arm	QEMU ARM virtual target
 qemu-arm64	QEMU ARM64 virtual target
 orangepi-zero	Orange Pi Zero (256 MB edition)
 nuc6cay		Intel NUC (NUC6CAY, 8 GB RAM)
diff --git a/start-qemu.sh b/start-qemu.sh
index 65385a7..7e95ec8 100755
--- a/start-qemu.sh
+++ b/start-qemu.sh
@@ -55,6 +55,21 @@ case "$1" in
 		KERNEL_CMDLINE=" \
 			root=/dev/vda mem=768M"
 		;;
+	arm)
+		DISTRO_ARCH=arm
+		QEMU=qemu-system-arm
+		QEMU_EXTRA_ARGS=" \
+			-cpu cortex-a15 \
+			-smp 8 \
+			-machine virt,virtualization=on,highmem=off \
+			-device virtio-serial-device \
+			-device virtconsole,chardev=con -chardev vc,id=con \
+			-device virtio-blk-device,drive=disk \
+			-device virtio-net-device,netdev=net"
+		KERNEL_SUFFIX=vmlinuz
+		KERNEL_CMDLINE=" \
+			root=/dev/vda mem=768M vmalloc=768M"
+		;;
 	""|--help)
 		usage
 		;;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/be2c3ee8093a779b4674be2419a630f3d9e77c61.1618866389.git.jan.kiszka%40siemens.com.
