Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBXETTPZAKGQECPNYUJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF5615E2A7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 17:25:01 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id n17sf3758360wmk.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Feb 2020 08:25:01 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581697501; cv=pass;
        d=google.com; s=arc-20160816;
        b=e/8Zr8o8L8B/50gS9ii4sxXM4gXU+dIXhtOUC06F5aR/4F3YN6JOn9CKATRN7IhxA+
         5FYLmHaQLUCisYJeYOmm6Oa2kNAUDatFEXQNbP3LghbeUIxvWz+sTixasAl/qDNfnqEn
         knFmc33Hw9KXjlZjUv3EXkHI8RHBj7R/CNH75mIZtytPpMYvcf/wN8T6zWFzLNitGOZI
         H7s6nsBCnBw0B6d7ds5nykbdG1qXFOcLJF9prbwtMNTw+KR4aEoTkp2tUgdkHbTiTvRp
         JLOUBkwZiTDy6cVJfZDhdqJKcxm9RCS96te04Tuch89O+9x67fQ2cnxLAladhGAp6aZY
         B8Fg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=/S/L8NEik0QptwpasGlyG/4Yh3iHFYUGN2G0wYTB7+8=;
        b=0Tx457iDlmIZSJL7/Q3iCGXVtJR3748PkvEPZcmvDwIEC34AlnfTCmZOKKjmxA+Fp5
         xJTzK6t5lSJDlJGBiQ1xHBVAcTzQMxcS8fkp17wfzhg74b5b8BmaxO/lXzu7wQByDRKj
         a5XNYYrxfDCwxXQs5GE7quQN+jrY7e6d/B+f7SA5ia4xL/2NsFk5ElhNZ49yn6aPynk5
         vQpVEOkQkIiAN+KQnGdls5rXevxViv1UuB40SpAHM0KpY2ZvD6YH2HzOgcKBxKZqURNn
         gYAjbRSkpejMywvklFaLhpJih2UeGWwJg/vvaz1jyEGosw6R2w1nsFZh7HAnjQSSqoS/
         ehBg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="H//bNwiq";
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/S/L8NEik0QptwpasGlyG/4Yh3iHFYUGN2G0wYTB7+8=;
        b=lC+9vLo/tpkDa45Xyh8Mt0e+pNwNPdnlmz/NqjzQt7mb4RDvPrzfZBZ1eEGIWZoGB8
         TgMXISqEAcqeG0BLey0lMlvTIXJcDQGwQZG8f+HsRD4k9OhpHsNOhTty7iFfB2fEIKlN
         ksVbuilEHj+c6AJ1lOfi7l7qb5K1gpJGaTKBjXpszzRXVko9LO+fySht8ViNW28TN8HT
         OsDqeGJbui0VLpHw+/uWUa2rdeS3nkGgcJVI8AfLJ7GNA6VeHGrMNuZm60ZDFjMzIO+k
         aJHKBSEfpGe8zyiHkpF2El7mwur7h5bns3oOOc70mSay+WxVUbdkAJdjvjSKQXcoMqGy
         0gPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/S/L8NEik0QptwpasGlyG/4Yh3iHFYUGN2G0wYTB7+8=;
        b=WVFYERRkdN4J+3SLzSo+D/UP3jxZyBc52a6div0rOMvxFUa4c0vrjLJloeYZfiAYyq
         d/SC06riJZGfsdKw4dV+jJBcawmDDoN/HNZ9WanN2Aq8dKopDanf/bGq66JhF8Tnk9zv
         0+EGbUQTygps03i6+n3w877N9/RrkEN4qru3H0wL51VTqBJlksJ8uH5M9ud+tih2qdgS
         Osjv25JjHU2hT8M8HzEnsfYloj+vBshPEv4DEZVI5Tmu1zj8EEqhAg5IULzWUxZAMVc7
         bpm13t8RkHUwJw2taPHbtrx4n3n0ulKEMcxTvPXOyWn3O7i27Ah4h/Vs6B3aq7yv4cgO
         DfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/S/L8NEik0QptwpasGlyG/4Yh3iHFYUGN2G0wYTB7+8=;
        b=dsBvlbynoXGJQrTMrpWM7J3dJ0YsBi3kDa5xSEwCS7OqRyT/itzYrEckxPV1DY2vps
         UeiIDZ3mP1/IR9wbwDqi+12ChB7GFtuVM9JyB5JdhidVAHsuxrX20cY3f89LklEAX0Mj
         e2JpqTkYyETd/4cTr1AIGOMGw5WAchU1NMsZgKIuQPMfuytx1k45gW8bOE6ZswNNH9Hy
         iTRPant8UkGfckFVMcLDipzPf+qN9gMaroyXxtBzmdNODWEcvZMiakoPZ24EnM6LP5CZ
         58zOKDkMCJ6JkTQYQREaxUZRV7UNovrxDRP6FJ0xHNH798hqyaHz8pGMY4Y6d7IvGuyQ
         9hnA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVpGzo1VJp+LN2IpZrnpZzGb53c38wELX635xVD1VoAnwqrMLcy
	kgGt7RQOvdFGKK/K3nRw3Sg=
X-Google-Smtp-Source: APXvYqxHnrC1CuZagELVPGkl7WVF+IM8oYEs20QiuHaku9D8NqaCG8Q3652BC8Oqap/r0BY7iQD8cA==
X-Received: by 2002:adf:f986:: with SMTP id f6mr5039688wrr.182.1581697501086;
        Fri, 14 Feb 2020 08:25:01 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c0d9:: with SMTP id s25ls987357wmh.0.gmail; Fri, 14 Feb
 2020 08:25:00 -0800 (PST)
X-Received: by 2002:a1c:1d09:: with SMTP id d9mr5689638wmd.91.1581697500405;
        Fri, 14 Feb 2020 08:25:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581697500; cv=none;
        d=google.com; s=arc-20160816;
        b=JPblN/zdGZcBMbJvy9k59TgQHzFIpcDcdA+xtC7JWCX4oozOU2qYzTXFwV0zrDo258
         51zVBrRsfugCtYnm2fcnE6sExjKCPsqwNgdfQiYstkejoerQMRH3naOULd99HoCZwHok
         qTnLafjdOMUtQ+juHi3a4RhmA5ef3NcYIhEKjde4frB7nGm3HsuKXuL/2zpmuQcYBzhg
         6obFL/8cdFsw8HR7wlTuB6asRmr7MOaF+J58LUOobLAs7VJrGV247KvFpPyAUtJBa1TH
         +qcDlgOnV53b5rT21/s/aP9qOSmvDfhnPluc2sHSZpl8ic5wwOSyLImlQ2VIgM+m8XM6
         v+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=Let5ePEEZrwhPXPxJKimSF1qBGR6Z3CtMTyCpLDoy70=;
        b=iYuGQvAJQyP+XMk7WiqSb/+KYlduCOqMv3g96vNnwdY1v9nFIig0NqCMGOToyzT+n7
         xvZEtue+gv5S+cy8RX/bEcL1umk0e2lkKy3Guaw3KnbpCqm3ECfemFhL8otDYJ14CWrP
         PzArFZPJrHQnKEjRKSUFaNogjObvYU9n9ZOIxVGGVRWCOVW0lOxAwYBYHX6Qb6jLlE7C
         GNM6FS4sSnI4goL/xBKSuDKGCtefRm3BpTslCU17RNdurHiL2D95J41QBheTuf8g4Vd6
         vNa5ihaayTUK1RWQ9sJT24j5HiTAc+ZS083yndQCnn0V82s/Hu+g5IUHwupIxbjruqRI
         2KEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="H//bNwiq";
       spf=pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com. [2a00:1450:4864:20::442])
        by gmr-mx.google.com with ESMTPS id d191si163737wmd.2.2020.02.14.08.25.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Feb 2020 08:25:00 -0800 (PST)
Received-SPF: pass (google.com: domain of vijaikumar.kanagarajan@gmail.com designates 2a00:1450:4864:20::442 as permitted sender) client-ip=2a00:1450:4864:20::442;
Received: by mail-wr1-x442.google.com with SMTP id r11so11532604wrq.10
        for <jailhouse-dev@googlegroups.com>; Fri, 14 Feb 2020 08:25:00 -0800 (PST)
X-Received: by 2002:adf:f0c8:: with SMTP id x8mr4851677wro.359.1581697499338;
        Fri, 14 Feb 2020 08:24:59 -0800 (PST)
Received: from oxygen.mgc.mentorg.com (nat-sch.mentorg.com. [139.181.36.34])
        by smtp.gmail.com with ESMTPSA id s22sm7721336wmh.4.2020.02.14.08.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 08:24:58 -0800 (PST)
From: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Subject: [PATCH v2 4/4] Enable pine64-plus support
Date: Fri, 14 Feb 2020 21:54:40 +0530
Message-Id: <20200214162440.27509-4-vijaikumar.kanagarajan@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
References: <276d18e9-3f9b-4b93-8f5b-7223a4bea0f5@googlegroups.com>
 <20200214162440.27509-1-vijaikumar.kanagarajan@gmail.com>
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="H//bNwiq";       spf=pass
 (google.com: domain of vijaikumar.kanagarajan@gmail.com designates
 2a00:1450:4864:20::442 as permitted sender) smtp.mailfrom=vijaikumar.kanagarajan@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

- Add the necessary machine, multiconfig and wks file.
- Add entry in images list.
- Add info in README.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
---
 README.md                                     |  6 ++++++
 conf/machine/pine64-plus.conf                 | 19 +++++++++++++++++++
 .../pine64-plus-jailhouse-demo.conf           | 14 ++++++++++++++
 images.list                                   |  1 +
 wic/pine64-plus.wks                           | 16 ++++++++++++++++
 5 files changed, 56 insertions(+)
 create mode 100644 conf/machine/pine64-plus.conf
 create mode 100644 conf/multiconfig/pine64-plus-jailhouse-demo.conf
 create mode 100644 wic/pine64-plus.wks

diff --git a/README.md b/README.md
index 8841513..99d9f0d 100644
--- a/README.md
+++ b/README.md
@@ -115,6 +115,12 @@ is support. You can boot the board directly from the generated SD card image.
 The mini UART on the GPIO header (pin 6/8/10: Ground/TXD/RXD) is used as serial
 console.
 
+## Pine64+
+
+The [Pine64+](https://www.pine64.org/devices/single-board-computers/pine-a64/)
+with Allwinner A64 is supported with its 2GB edition. You can boot the board
+directly from the generated SD card image. UART0 available via EXP 10 connector
+(pin 7/8/9: TXD/RXD/GND) is used as serial console. For details refer [here](https://linux-sunxi.org/Pine64#Serial_port_.2F_UART).
 
 Community Resources
 -------------------
diff --git a/conf/machine/pine64-plus.conf b/conf/machine/pine64-plus.conf
new file mode 100644
index 0000000..0949ab4
--- /dev/null
+++ b/conf/machine/pine64-plus.conf
@@ -0,0 +1,19 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+DISTRO_ARCH = "arm64"
+
+IMAGE_TYPE = "wic-img"
+IMAGER_INSTALL += "u-boot-pine64-plus"
+IMAGER_BUILD_DEPS += "u-boot-pine64-plus"
+PREFERRED_PROVIDER_u-boot-pine64-plus = "u-boot-pine64-plus"
+
+IMAGE_INSTALL += "u-boot-script"
diff --git a/conf/multiconfig/pine64-plus-jailhouse-demo.conf b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
new file mode 100644
index 0000000..5e66c94
--- /dev/null
+++ b/conf/multiconfig/pine64-plus-jailhouse-demo.conf
@@ -0,0 +1,14 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+#
+#
+MACHINE = "pine64-plus"
+
+DISTRO = "jailhouse-demo"
diff --git a/images.list b/images.list
index 26a802d..b794d85 100644
--- a/images.list
+++ b/images.list
@@ -7,3 +7,4 @@ macchiatobin	Marvell MACCHIATObin
 hikey620	LeMaker HiKey (Kirin 620 SoC, 2 GB edition)
 ultra96		Avnet Ultra96
 rpi4		Raspberry Pi 4 (1 GB edition)
+pine64-plus	Pine64+ (Allwinner A64, 2GB edition)
diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
new file mode 100644
index 0000000..aacca04
--- /dev/null
+++ b/wic/pine64-plus.wks
@@ -0,0 +1,16 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Vijai Kumar K, 2020
+#
+# Authors:
+#  Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
+#
+# SPDX-License-Identifier: MIT
+#
+
+part u-boot --source rawcopy --sourceparams "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table --align 8
+
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024
+
+bootloader --append "rootwait mem=1792M"
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200214162440.27509-4-vijaikumar.kanagarajan%40gmail.com.
