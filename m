Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBHNRVHZAKGQEQUYOM5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564A160E22
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 10:10:54 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id n23sf8616348wra.20
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Feb 2020 01:10:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581930654; cv=pass;
        d=google.com; s=arc-20160816;
        b=tnaKb7syBEx18HJ3e/ho67sAi33kGHSWpiRN6n/Ng/p5OH0NA03dSPmU0ATn/XDpjv
         GQYFOxMaaai9woHtE/cTKDW2nDJTXBpePMwh8fIGj8hI+8mhtb5p1Af80GmRgcawh7vZ
         RUb/lJtq7ytz32JjRtatzyccunp1ag4jcFHM5x6v54jHaN5pdxZMH5qVNjqrjscPbAyU
         mw0Q/rwj6bRjCNrAaGi1BYP5A3jctQYngYty/cYn8VTuDF8u9oRe26zxJiLd0JUC/Dxe
         yr1bdrxmlBLlAhyNqGQAJLGFtClZ7zTuwJYXcdYWKzsqTKbpuDZPoBcCgKivPpbjgU9o
         rl8Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=7MciCnrPw1s13EyWXbnFjsu8YJ+tKrMEkfmGc4HoCzg=;
        b=L4IZ922RVlz2eT8fmWvzkNqKiqdJ1Hq8U/Yj8ZgzU3U7JTxBqjDsftCIRM6GeULBp/
         pc98aL9GXN8IyPhkY8Ou/BbabDdzX7cCSHfCyYPgsQuXWL8kn+AxgnPYhtIfugOoMcmj
         Lku7D7lyeCUc2f1KDQynZ8/rMFjaUtoLlXSyrrFBehm8nSqp1VPJGZE2wtFHG0AKR4lC
         k+1Cm3CgYXzUxJ/b84R5Io0Fz83FnXfWqnXccETG1nXf+PqBlzrjoGAJIGb0q9DsgB+H
         rcMtMEtpR7ElFweAV7SoTucFlGo/pw1bBtNW/iH2xbHVXkylG55Dwtooo7vuJPnPAIJy
         z5SQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7MciCnrPw1s13EyWXbnFjsu8YJ+tKrMEkfmGc4HoCzg=;
        b=l0H7r/qW7zchZEtesPoEH8K1PSQ/8+lnEPTc2r0gyrYXRRBZ7TAxDRy/KVeVSqe91b
         dju013sPnem3m9pom691LoxuwB5DMbnVAVRpQxV5i4O12eq7Da09fbVSRxJmpqB59OZN
         AE0+v0FxYwvfP1TOWVOymVSadx6zSJVck6/+kjgg7u8XVwSdOugdLIf656LJimo/Tfj5
         lDqarF+MUxjH80PXyngxeeBogERPI9XvD7P7za7t+0fQhaYnqiXCqpeXRBoC3HeTYLRo
         k2Lm/P19Zo7P48JubeJPleFu2XF82JM5CaiKIHsoATVh8mV1oP8fixNbGQqBoVuWSAzW
         FSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=7MciCnrPw1s13EyWXbnFjsu8YJ+tKrMEkfmGc4HoCzg=;
        b=uUvfCuVTbxzbSE4ApvfF/WwWSb/wjohT1QTqma8ObhCZGBZQj1/JBTcTghyUXiMds/
         3IiVPSfPxFq40rMKCtcICX0JDrLbXKiJHIQI+SQhKfgKhvv1Su1ROjuHiYUTc1MqwQI/
         QBk/NBMFpruwBYLjfa1GPKYSFpc/Z/8XTpwAuHyjK/Nr9xKf59YstFTvr2cBdBkHB/N9
         Mz4joUYdYwcn7gs6eGy5nhAsPPaLLlfPcET/bgEy0GWbE4dPNHlMTqAjKl9i5faCBnl4
         zym6zNvU5glu8f0EeG95MKDNxx6DpUw+hGl/9I3dmbH9+WwxKHeb9+JYASwNC7DRAv7M
         to7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXraRwwvMpKukZ2e14+gE3hVqeX3RQxvEaFJu6M+Z2C0fgtQ/V4
	0qcfUXzz6XNQGGxBGF2k3xU=
X-Google-Smtp-Source: APXvYqwkXIQy2TauPqbJHY6+FWvu1w4+Z9uYyIxOmBZ550ymiQwJnhwKb9JBOPUdcujHQiKeYy5NaQ==
X-Received: by 2002:a5d:4d04:: with SMTP id z4mr22501104wrt.157.1581930654120;
        Mon, 17 Feb 2020 01:10:54 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d847:: with SMTP id k7ls5202154wrl.0.gmail; Mon, 17 Feb
 2020 01:10:53 -0800 (PST)
X-Received: by 2002:adf:e781:: with SMTP id n1mr22235671wrm.56.1581930653263;
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581930653; cv=none;
        d=google.com; s=arc-20160816;
        b=pBvul8bvRH7W8Yz1xnzN/f3X0L/paOcImCfLP9SstMOV/51AAMnPoKTAY0/PUArqpM
         hXMIQIi+7VQLpz2cydIecLAzzOXhHeuHPGizssLfBTajGscryP6Grc9RZtWV44rCcTVl
         5YC3sg5erqEH2YlGozgTTMdjV16g6TNynFpdDwzMsfkWGNQVBu6026mLMm3pA260FSRN
         /SIpBpbEDJwKa3zjNbD8efCWbRSYzguYTNZwvbCDnjSHSPy+2eGoen2ZCoxUag52yVed
         AhHhssitW/sLnL4/r2s88bwSobms2UDYzOpJkwiwT4x4kQEChPe1tgqPBqX2kR4gswDe
         Qp6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=5E168Utpp+/z7P8wdc1QrefTR9CZCXii9pGyomgDBos=;
        b=YZTYMaSFjGVgfsJmuWBfsfbdCywp4aaY5k/YWRhDNYlAViv/qw8lrtgccKpsRT8g1R
         9tf1k9u7sMo2tL6mNQRd+3YXSO41iZJ++j9TBikYIfX0HloVPU+I6V4MELZXM68pJs+m
         nxqMDWwXzq9iQ1RPyV9EYIL0uLvrSeLHpPU/lrggmxSHfoMztEbdUD/78mT/QDIWYPEb
         Vw+IVi2UpvddxRb/tPFT5zc7lSx8/RyZPBtkYzSKTIKuSh2yBwOz8974VsmCb9YA5BR4
         28NF/bmQV6MnaUmU6PEn3y9XCh+M0Ln1x5Kie41oVuHh2ELD8/AS5WgouNNjKECbqxl8
         +y7g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q202si314921wme.2.2020.02.17.01.10.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Feb 2020 01:10:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 01H9AqJw005853
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:53 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.42.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01H9Ap3c020534
	for <jailhouse-dev@googlegroups.com>; Mon, 17 Feb 2020 10:10:52 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/6] core: Introduce jailhouse/bitops.h
Date: Mon, 17 Feb 2020 10:10:48 +0100
Message-Id: <1c4c15399f736c49be665ca7af343b90cb448108.1581930651.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1581930651.git.jan.kiszka@siemens.com>
References: <cover.1581930651.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

We will share generic bitops this way.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/bitops.h   | 10 ----------
 hypervisor/arch/arm/mmio.c                 |  2 +-
 hypervisor/arch/arm64/include/asm/bitops.h | 10 ----------
 hypervisor/arch/arm64/mmio.c               |  2 +-
 hypervisor/arch/x86/include/asm/bitops.h   |  7 -------
 hypervisor/include/jailhouse/bitops.h      | 19 +++++++++++++++++++
 hypervisor/include/jailhouse/control.h     |  2 +-
 scripts/header_check                       |  6 ++++++
 8 files changed, 28 insertions(+), 30 deletions(-)
 create mode 100644 hypervisor/include/jailhouse/bitops.h

diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
index 3b5d0a89..fbdcc817 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm/include/asm/bitops.h
@@ -10,13 +10,6 @@
  * the COPYING file in the top-level directory.
  */
 
-#ifndef _JAILHOUSE_ASM_BITOPS_H
-#define _JAILHOUSE_ASM_BITOPS_H
-
-#include <jailhouse/types.h>
-
-#ifndef __ASSEMBLY__
-
 #define BITOPT_ALIGN(bits, addr)				\
 	do {							\
 		(addr) = (unsigned long *)((u32)(addr) & ~0x3)	\
@@ -120,6 +113,3 @@ static inline unsigned long ffzl(unsigned long word)
 {
 	return ffsl(~word);
 }
-
-#endif /* !__ASSEMBLY__ */
-#endif /* !_JAILHOUSE_ASM_BITOPS_H */
diff --git a/hypervisor/arch/arm/mmio.c b/hypervisor/arch/arm/mmio.c
index fcc7fdf2..1c492b43 100644
--- a/hypervisor/arch/arm/mmio.c
+++ b/hypervisor/arch/arm/mmio.c
@@ -10,10 +10,10 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/bitops.h>
 #include <jailhouse/mmio.h>
 #include <jailhouse/pci.h>
 #include <jailhouse/printk.h>
-#include <asm/bitops.h>
 #include <jailhouse/percpu.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
diff --git a/hypervisor/arch/arm64/include/asm/bitops.h b/hypervisor/arch/arm64/include/asm/bitops.h
index aad70f29..df99402d 100644
--- a/hypervisor/arch/arm64/include/asm/bitops.h
+++ b/hypervisor/arch/arm64/include/asm/bitops.h
@@ -11,13 +11,6 @@
  * the COPYING file in the top-level directory.
  */
 
-#ifndef _JAILHOUSE_ASM_BITOPS_H
-#define _JAILHOUSE_ASM_BITOPS_H
-
-#include <jailhouse/types.h>
-
-#ifndef __ASSEMBLY__
-
 #define BITOPT_ALIGN(bits, addr)				\
 	do {							\
 		(addr) = (unsigned long *)((u64)(addr) & ~0x7)	\
@@ -123,6 +116,3 @@ static inline unsigned long ffzl(unsigned long word)
 {
 	return ffsl(~word);
 }
-
-#endif /* !__ASSEMBLY__ */
-#endif /* !_JAILHOUSE_ASM_BITOPS_H */
diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio.c
index e6933716..7fbfef75 100644
--- a/hypervisor/arch/arm64/mmio.c
+++ b/hypervisor/arch/arm64/mmio.c
@@ -14,10 +14,10 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/bitops.h>
 #include <jailhouse/entry.h>
 #include <jailhouse/mmio.h>
 #include <jailhouse/printk.h>
-#include <asm/bitops.h>
 #include <jailhouse/percpu.h>
 #include <asm/sysregs.h>
 #include <asm/traps.h>
diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor/arch/x86/include/asm/bitops.h
index 1f07db47..66fc91ab 100644
--- a/hypervisor/arch/x86/include/asm/bitops.h
+++ b/hypervisor/arch/x86/include/asm/bitops.h
@@ -15,11 +15,6 @@
  * Copyright (c) Linux kernel developers, 2013
  */
 
-#ifndef _JAILHOUSE_ASM_BITOPS_H
-#define _JAILHOUSE_ASM_BITOPS_H
-
-#include <jailhouse/types.h>
-
 #if __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 1)
 /* Technically wrong, but this avoids compilation errors on some gcc
    versions. */
@@ -109,5 +104,3 @@ static inline unsigned long ffsl(unsigned long word)
 		: "rm" (word));
 	return word;
 }
-
-#endif /* !_JAILHOUSE_ASM_BITOPS_H */
diff --git a/hypervisor/include/jailhouse/bitops.h b/hypervisor/include/jailhouse/bitops.h
new file mode 100644
index 00000000..426e51f1
--- /dev/null
+++ b/hypervisor/include/jailhouse/bitops.h
@@ -0,0 +1,19 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#ifndef _JAILHOUSE_BITOPS_H
+#define _JAILHOUSE_BITOPS_H
+
+#include <jailhouse/types.h>
+#include <asm/bitops.h>
+
+#endif /* !_JAILHOUSE_BITOPS_H */
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 72518f6a..e50beed7 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -10,7 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
-#include <asm/bitops.h>
+#include <jailhouse/bitops.h>
 #include <jailhouse/percpu.h>
 #include <jailhouse/cell.h>
 #include <jailhouse/cell-config.h>
diff --git a/scripts/header_check b/scripts/header_check
index 2fa6e45f..6487378b 100755
--- a/scripts/header_check
+++ b/scripts/header_check
@@ -42,6 +42,12 @@ test_compile()
 		prepend="#define __ASSEMBLY__
 			 #include <jailhouse/types.h>"
 		;;
+	bitops.h)
+		if [ "$1" == "asm" ]; then
+			# must be included by jailhouse/bitops.h only
+			return
+		fi
+		;;
 	ivshmem.h)
 		if [ "$1" == "asm" ]; then
 			# must be included by jailhouse/ivshmem.h only
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1c4c15399f736c49be665ca7af343b90cb448108.1581930651.git.jan.kiszka%40siemens.com.
