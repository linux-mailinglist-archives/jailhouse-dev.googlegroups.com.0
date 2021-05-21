Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS44T2CQMGQE77QYJQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B9B38C519
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:41:15 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id c13-20020a5d6ccd0000b029010ec741b84bsf9257041wrc.23
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:41:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593675; cv=pass;
        d=google.com; s=arc-20160816;
        b=CET7wg3/QKr3UNUQn80izIatet2s2+mlztPRR2BwTEIlP/3wKV5As7sQIK/0PeXjmc
         7BEjpPAB71EtSPgjhH0ieZIS8B5BPvLWvluA8kXtgqtqT1uj5QfWI4rGMc8D7OVnZo8u
         IGCmgvrQsF3lmYVZ7NFn1DcFc3Oq6BseBNPTFSOoDrbrIyZflk9AoaSmk9VRTjiDe9MJ
         Iyyb/sBEy8bPEizIsV2/klJIlZlmWE+LumIL/GD59MsaVCn79kd5boFGxC7t8qrUvAZJ
         fx6YmOBK+4WqB2SEuZLkQ+huy/nhtr6bC+zWFZMgh0wsLNGXgUYYqMS9HxpZUsFEhUGt
         8y9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=3F7/HgjDzJ/ICaSsS/RzBO9rd6K67sTPwK2G79Ss0kA=;
        b=aJ9wkP0Hegw+8wvEPqxuh7C1dvGiApwOt8JtsS5XmJvC9CFwyoO5XS3Z+80YtyRQ6x
         ovqv60VqxTl2GxVMsEsEzI2EONcXqbFmTUlVibgEXs9E5YaCPnsM3NMpJxQzOvhTNBAT
         R3Pdpze8v1wtomOPgy0cKVtBzdclKM8MyGinNQPOL+gLS+L8GR5yPWaMibJjabQ9esRh
         2CQhI8BCI+TI44bGNJMj3nzRnPvLKcu/ArUsexYbcBhqaNWUljkkxF+x7Ihyo3I4GsIe
         YXFVGJos2xaW/JCbC/wzWEJoOvJbLwpevwnDW//HhN+rr9K8cxZXsHSSuCZOinr5XyZf
         LL+Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3F7/HgjDzJ/ICaSsS/RzBO9rd6K67sTPwK2G79Ss0kA=;
        b=HL+mJa2r8Z6S3UjeTEhXmvwCLTyoy3x/Pn8OXXl8zyl9jQsd6vFHo1fTeV9+vIxSHH
         qiVGKZpCKdP/xmb0f3K0yHQq7rt+v8v5XSQfYdSmsnLgrOtDijHpIIYT7ykgHfjXiy76
         7amhGOYz7bEx7MAVVy6XN7iJ4PJVXubPqtviOQVq2P/5hHaQDrB1QvingJoTyfCJ8sG1
         o23/cWlaMgkzg8edneeOiZtM49l3/Iw8ewUWoFGqt59X6a1mJSLuXxZPv6+Q+uKJ3i1z
         lmmSgIrrAteFRwcON0X5iW1zOkaCUN9/YYQ17SMYJZkw3hVvgGoRe0reZtDKK4GtKD+u
         crPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3F7/HgjDzJ/ICaSsS/RzBO9rd6K67sTPwK2G79Ss0kA=;
        b=J8sluq8nOchsvbiv4EZTz0IWDBgVrx3LdCKOpWFUNpJ9LUPcUQncAanLCCwO3zBYLZ
         cO1ZssDI8QiruEP0axy0ocfvxOq9SkOr0U5dMdXkGTvUz5P1m/opLIOxFw932N8PcVhr
         9sVfHmLOwgd420iln91KGWKgX1QTkuOx3OpETq8Ix4s2X1fR77epGRS1TbQ/NfkLvPeh
         XPhWBQ8UMiyDsMvfW/xXWVJvcIf7h+5VQO6cTXsXbLEzkuipQMav7WF7c64BqLdsrZE2
         F4FnNbPyz4uPJm1HSP3rDAREfnsvX2Piy/a7Wi2UFxddcUuwyJIm3voKnWYxLA0FbPGZ
         O1IA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533t+e38bG6T56y4hsZS8ANLMHX08hxzlpF/P8LtHyZmUWsWjqxW
	bG0y9yniUthqXEZ5qGMX5pI=
X-Google-Smtp-Source: ABdhPJx4MnNYmgJel6jP8PgyAanjm+INod2V7vF58MbzeliugGzz0gwu61xQUa4+qbPTeW7dOfJlUA==
X-Received: by 2002:adf:b31e:: with SMTP id j30mr8978706wrd.74.1621593675516;
        Fri, 21 May 2021 03:41:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9d89:: with SMTP id g131ls2838617wme.2.gmail; Fri, 21
 May 2021 03:41:14 -0700 (PDT)
X-Received: by 2002:a05:600c:3544:: with SMTP id i4mr1625546wmq.112.1621593674527;
        Fri, 21 May 2021 03:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593674; cv=none;
        d=google.com; s=arc-20160816;
        b=iW/zBgEELyEWV0ERqW2Spj9/EL5/uu93k9GGH4bAn9peCOkArDT+u7dCc86hcTvDWo
         QwMQ3bk/M6jqWFAqC7hAJovc++xQwGawtKA2P31kPovpQHq07D7hUduu5uiU0lqxQPwb
         bP6HA1Lk9DmFq6JWM6kBK2cQC/aU+07HpheNHyE5TL6i4QfJApDIB2ZnIyhP9eiiyVpF
         lEPwaOyNm3OYKXGQamPZaH3IzXtxPTfozqjoU+hX2GKFWzyp6pAy3nxhz+OX/Hi6bZvN
         hWMujP44vM/Hx+qtBbavQ7O9iZ6+VlaBbDoSyUc1RGIHt9ZGW0ebmgJE5KD5ACHZ/1ms
         xvTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=InQQ3chDmIBUizu7rlE7rdwqOMwz5g/pj+Pr1BXOVjw=;
        b=dGO6wV57zxqHyEIiOHnE4OVVy/Nz5EfmvayY2NG6b4H1vbpSREk7guEgldZTJLIOOo
         JpEViiJaZETsjdR4zY49coWtLByGWq75eCskLrJDwWNZj+F5+3Ee+6a6VjyLvsdcEigR
         h4u8KFwqPSb5O2l0IVsD/rvwDEkESIeglv2pINgJdFA3WGir3S1mmwaBfNwNw/7w1NV2
         nMHU04cN5btBOm16/+Um+dJoQzmTaToTaWtq5QQhp3uIRnleI/FE7U9dWTrzvd7vNhjk
         gQOeSPsZcQWBcbQZLl8D9RPH51JQBIWZQRjgC3TGCMT8dzARcPAPbv3pVp4jKlvVATBJ
         ipvg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id d11si561294wmb.0.2021.05.21.03.41.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAfEGV006705
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:41:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcC032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:36 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 07/22] Hook up QEMU ARM support
Date: Fri, 21 May 2021 12:37:19 +0200
Message-Id: <9690a1e3f8e0f41717274bb46d0458885cf1b48f.1621593454.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9690a1e3f8e0f41717274bb46d0458885cf1b48f.1621593454.git.jan.kiszka%40siemens.com.
