Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBXV76D6QKGQE3WDTFAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF932C16BC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:26 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id f4sf6249551wru.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:26 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164446; cv=pass;
        d=google.com; s=arc-20160816;
        b=PcLzonSeiXMYaw2FLZ1TfkrljYPscioLGH4ZZtIFmBwlJN4NuKjyY1P81hVpD8QorL
         y0JPmNAO/q3cBZ2TYhCpYHAB6Om90InmqHSGf+9fj/5ia+V1ZlI0Aa/4DlSDAZz+3LlP
         FyO4HbU1N6lNDLp+a6rKHZSNPFMSiRT7T6T3BWnl4bCQvH0FteuKAB6RzpG91rKmkPgk
         FBxLHYlscOox+UjFieBtj4X2AlkK1Rsc/J8D16r7JpSqvMcueJN60fy0kPjfqpL3yXY4
         dX8jvHDFjtqDQJ3LZ38LTO3PFCqqQh4MHEpQYEZOx4MhVK3NfyXwifEZVeh7VcXXSAP1
         Qm5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=2Eg7y2Uy41STofFGMyiJYYMwNOBvy1GXZoHZlHi2ym4=;
        b=a6KRcrbGWXBpSCaluTOv2HxYf35K4/DLhYJWcgUYvjQB+YBL2t6P8hR2e/43i7WItb
         j7mJJxaq2/vzsy0mvPlC7WgAjfPWyZGb/qXP1p88lBFS1Kc7pPiY5WsOVKoXOwevtCzm
         tkoNNdBHTXl0OTFn2ujhvG9ZWTRaZnrzLm/FSXJwlQwg1W5x8wrvbiFg9F8ps1jXLEDR
         4xYIaOQq633OupWZLRYyK8c33FdjD4gMhrdKkuZtE712rl5twgslkE36x6enHTwkBQxg
         IYsUFPMEqT5j7qU+OQcvVJl8sP+oBm8Tg3PLrls1bQzGYq+mIfVafqII0M6zU47XL5gM
         WoNQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ArqQfW91;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2Eg7y2Uy41STofFGMyiJYYMwNOBvy1GXZoHZlHi2ym4=;
        b=FU5vl6gEOGTRS1gPNUzxH9Ul9phw+Q1DSCIPk0fhyFTAoJqn2yqYy7ilFjqDBXO8KY
         KLASCjzuEh8QvT/mtEPOopM90Mqhb2HyhWkrErtmcJhluRCx8t5BQG3E+VbJPv1tHp5z
         7dUVd5JUQSGqSpwGuokKl2vs/+P/FJxfbcKYlOzcgAGmDPAzUk5CeNF8amCd9z3UJDSO
         Ylpy/YJ8/BRSRSJtQyIjQbVEwtMf2rEtcBLdipdZV5MKxqW8W3u7f6Ub9WNQEvHbDKPB
         ODB50haRwbWtF1dW+LTUwScNaWD97VRWISxMDHMatZ1pYeQcUAFvh4H4hZWcbKALrkY/
         ryMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2Eg7y2Uy41STofFGMyiJYYMwNOBvy1GXZoHZlHi2ym4=;
        b=QSnt4mQLVSjLRhf0aCiqO6z5gf3i89yCeT4WSOv7YRKNNlnOhMNs8E0Cka5o0fI+Mh
         gjJpDbL+9S7X9d7QYKuvqdsfmR1+m29Q+EYYWgxAv2Xba8x+r1B00mEePjZecBzzkw12
         Eri+wCAcCA+mYa9lZ5hbYJdh3NqB0iIU3ztjig1W274p1s/RMDlVJ2e6NOIlk5XMfwVU
         OX65a2ecF2PK5HjQns00d1I+t4OYtQO1OqN0ZoD0bjODtHweHx/EnpqXYB2iVvnLaX4B
         IWeTYc24DZH0leFBMamRls6mycKgTNnOAg/VrN9Y5ZPc3HpB/9KSXhefipwj965GSt6w
         AmQA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531/0B1iTweUhIPoxXLiKZltdeRcgdOlc+nw6fPuXKSgqtCNylp5
	7eUayHDz5mP7yzHe8ynEGj0=
X-Google-Smtp-Source: ABdhPJzGowKsMFl8lL9zRrL4VvBT8z1yQtEqSeT/6G1ugQgEDMd/EZ4h9hTmhLAIBPEV6vwJNOjesg==
X-Received: by 2002:adf:e6cf:: with SMTP id y15mr1551130wrm.403.1606164446334;
        Mon, 23 Nov 2020 12:47:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:c689:: with SMTP id j9ls9057534wrg.0.gmail; Mon, 23 Nov
 2020 12:47:25 -0800 (PST)
X-Received: by 2002:a5d:45d0:: with SMTP id b16mr915434wrs.350.1606164445433;
        Mon, 23 Nov 2020 12:47:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164445; cv=none;
        d=google.com; s=arc-20160816;
        b=sy7UoCryza9LYxbfy+1GuSEb0uuxkQBeP38WhAJw69IYaGksLix1kIkyRenLGpmYO+
         G0CrfeFBrTc/H0CBgAQ/3IMVnbb/Rg2w9e1xKLYuoSGyUsTUEKyLtncFkLOatYS0DuqW
         k/0ocSfNFJS/YHpl8OD9qOf6dxR7FtAlIW6ViHuVvdzTU8md49Wf8mQVw9NsQfIZH4Nb
         vP5Lmsf6cOS+zsf+D+xwYlYDYmyBjP7fvfIqQQBik5qmfipmGWyKNv2NVaNGWB8HjS4+
         RWKMZKs/U0hy28rccnxhmvcMLhJryFvzANACkEktIVOYddtxO/uvzpUltHGWW2YkpY/a
         XMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=mgnswXP6UGjZeDJmAwS2TizAGSjdA/omzuYi4fmFklU=;
        b=z0wm5ZqmjvTfVGxOnFVuEjtDy9DjVAG2w1VPV1dL1kHC9MYI8IrNW4zJHw9yx5V1IX
         oW97+lnwDQwLOXpQslKP0QJ3/WFKJ4b8goIQyG7kyXEBn/eMajU0hTi5dKGXMaZTaIox
         VYAqpMU0FP15YnQ02TP9KhdJut3GF/xX1Y5hXTzYfWXq2mLS+mWKZLG0C3rGHu3n+c9u
         1bLem8SS0ik1caO1TVF4HSvI6q1ZkA15ig8JiW3xYajYFBCy9qlZIZroomvEoZcnb6xY
         cYhGPVnzwloQIIlmRghw86aB9fdpP1pUj793VyvAUYmUADjxNvNawQWI/TtEh7FJzt/q
         AwRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ArqQfW91;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id c20si18750wmd.2.2020.11.23.12.47.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:25 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cfzjn162bzyTc;
	Mon, 23 Nov 2020 21:47:25 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id NL2ixona5GpB; Mon, 23 Nov 2020 21:47:24 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjl6zrszyT6;
	Mon, 23 Nov 2020 21:47:23 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 11/14] hypervisor: provide implementation for __assert_fail() and group panic-related functions
Date: Mon, 23 Nov 2020 21:46:10 +0100
Message-Id: <20201123204613.252563-12-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ArqQfW91;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Implement all "panic-related" functions in a dedicated file, provide
__assert_fail() and adapt includes.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile                    |  2 +-
 hypervisor/arch/arm-common/control.c   |  1 +
 hypervisor/arch/arm/control.c          |  1 +
 hypervisor/arch/arm/traps.c            |  1 +
 hypervisor/arch/arm64/control.c        |  1 +
 hypervisor/arch/arm64/traps.c          |  1 +
 hypervisor/arch/x86/amd_iommu.c        |  1 +
 hypervisor/arch/x86/control.c          |  1 +
 hypervisor/arch/x86/efifb.c            |  1 +
 hypervisor/arch/x86/ioapic.c           |  1 +
 hypervisor/arch/x86/svm.c              |  1 +
 hypervisor/arch/x86/vmx.c              |  1 +
 hypervisor/control.c                   | 55 ----------------
 hypervisor/include/jailhouse/control.h | 25 --------
 hypervisor/include/jailhouse/panic.h   | 40 ++++++++++++
 hypervisor/include/jailhouse/printk.h  |  4 ++
 hypervisor/panic.c                     | 86 ++++++++++++++++++++++++++
 hypervisor/pci.c                       |  1 +
 hypervisor/printk.c                    |  1 +
 hypervisor/uart.c                      |  1 +
 20 files changed, 145 insertions(+), 81 deletions(-)
 create mode 100644 hypervisor/include/jailhouse/panic.h
 create mode 100644 hypervisor/panic.c

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 3807e608..c4965014 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -42,7 +42,7 @@ KBUILD_CFLAGS += -include $(INC_CONFIG_H)
 endif
 
 CORE_OBJECTS = setup.o printk.o paging.o control.o lib.o mmio.o pci.o ivshmem.o
-CORE_OBJECTS += uart.o uart-8250.o
+CORE_OBJECTS += uart.o uart-8250.o panic.o
 
 ifdef CONFIG_JAILHOUSE_GCOV
 CORE_OBJECTS += gcov.o
diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index ea6d6534..9df76549 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -14,6 +14,7 @@
 
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <asm/control.h>
 #include <asm/psci.h>
 #include <asm/iommu.h>
diff --git a/hypervisor/arch/arm/control.c b/hypervisor/arch/arm/control.c
index cd68dd9a..b76858d3 100644
--- a/hypervisor/arch/arm/control.c
+++ b/hypervisor/arch/arm/control.c
@@ -14,6 +14,7 @@
 
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/string.h>
 #include <asm/control.h>
 #include <asm/irqchip.h>
diff --git a/hypervisor/arch/arm/traps.c b/hypervisor/arch/arm/traps.c
index 10b3fdbf..80951259 100644
--- a/hypervisor/arch/arm/traps.c
+++ b/hypervisor/arch/arm/traps.c
@@ -16,6 +16,7 @@
 
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <asm/control.h>
 #include <asm/gic.h>
 #include <asm/psci.h>
diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 3cb5c3f8..f1e8a636 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -12,6 +12,7 @@
 
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/string.h>
 #include <asm/control.h>
 #include <asm/irqchip.h>
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index a9086c79..d22375d6 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -13,6 +13,7 @@
 
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <asm/control.h>
 #include <asm/entry.h>
 #include <asm/gic.h>
diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 40ec4e20..eb8ef248 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -21,6 +21,7 @@
 #include <jailhouse/mmio.h>
 #include <jailhouse/pci.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/string.h>
 #include <jailhouse/unit.h>
 #include <asm/amd_iommu.h>
diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 2bc47a6a..056c3f62 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -12,6 +12,7 @@
 
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/processor.h>
 #include <asm/apic.h>
 #include <asm/cat.h>
diff --git a/hypervisor/arch/x86/efifb.c b/hypervisor/arch/x86/efifb.c
index 372cf790..5f56f0cc 100644
--- a/hypervisor/arch/x86/efifb.c
+++ b/hypervisor/arch/x86/efifb.c
@@ -13,6 +13,7 @@
 #include <jailhouse/control.h>
 #include <jailhouse/processor.h>
 #include <jailhouse/string.h>
+#include <jailhouse/panic.h>
 #include <asm/efifb.h>
 
 #define EFIFB_MAX_WIDTH		1920
diff --git a/hypervisor/arch/x86/ioapic.c b/hypervisor/arch/x86/ioapic.c
index 65ac00f2..25321c8a 100644
--- a/hypervisor/arch/x86/ioapic.c
+++ b/hypervisor/arch/x86/ioapic.c
@@ -13,6 +13,7 @@
 #include <jailhouse/control.h>
 #include <jailhouse/mmio.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/string.h>
 #include <jailhouse/unit.h>
 #include <asm/apic.h>
diff --git a/hypervisor/arch/x86/svm.c b/hypervisor/arch/x86/svm.c
index 9b1664a5..35132a5e 100644
--- a/hypervisor/arch/x86/svm.c
+++ b/hypervisor/arch/x86/svm.c
@@ -20,6 +20,7 @@
 #include <jailhouse/control.h>
 #include <jailhouse/paging.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/processor.h>
 #include <jailhouse/string.h>
 #include <jailhouse/utils.h>
diff --git a/hypervisor/arch/x86/vmx.c b/hypervisor/arch/x86/vmx.c
index bf25d00d..f679bcb1 100644
--- a/hypervisor/arch/x86/vmx.c
+++ b/hypervisor/arch/x86/vmx.c
@@ -16,6 +16,7 @@
 #include <jailhouse/paging.h>
 #include <jailhouse/processor.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/string.h>
 #include <jailhouse/control.h>
 #include <jailhouse/hypercall.h>
diff --git a/hypervisor/control.c b/hypervisor/control.c
index b99d4380..d6ede805 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -990,58 +990,3 @@ long hypercall(unsigned long code, unsigned long arg1, unsigned long arg2)
 		return -ENOSYS;
 	}
 }
-
-/**
- * Stops the current CPU on panic and prevents any execution on it until the
- * system is rebooted.
- *
- * @note This service should be used when facing an unrecoverable error of the
- * hypervisor.
- *
- * @see panic_park
- */
-void __attribute__((noreturn)) panic_stop(void)
-{
-	struct cell *cell = this_cell();
-
-	panic_printk("Stopping CPU %d (Cell: \"%s\")\n", this_cpu_id(),
-		     cell && cell->config ? cell->config->name : "<UNSET>");
-
-	if (phys_processor_id() == panic_cpu)
-		panic_in_progress = 0;
-
-	arch_panic_stop();
-}
-
-/**
- * Parks the current CPU on panic, allowing to restart it by resetting the
- * cell's CPU state.
- *
- * @note This service should be used when facing an error of a cell CPU, e.g. a
- * cell boundary violation.
- *
- * @see panic_stop
- */
-void panic_park(void)
-{
-	struct cell *cell = this_cell();
-	bool cell_failed = true;
-	unsigned int cpu;
-
-	panic_printk("Parking CPU %d (Cell: \"%s\")\n", this_cpu_id(),
-		     cell->config->name);
-
-	this_cpu_public()->failed = true;
-	for_each_cpu(cpu, cell->cpu_set)
-		if (!public_per_cpu(cpu)->failed) {
-			cell_failed = false;
-			break;
-		}
-	if (cell_failed)
-		cell->comm_page.comm_region.cell_state = JAILHOUSE_CELL_FAILED;
-
-	arch_panic_park();
-
-	if (phys_processor_id() == panic_cpu)
-		panic_in_progress = 0;
-}
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 2ac7e2dd..2d6eb930 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -22,9 +22,6 @@
 
 #define INVALID_CPU_ID			~(0U)
 
-extern volatile unsigned long panic_in_progress;
-extern unsigned long panic_cpu;
-
 /**
  * @defgroup Control Control Subsystem
  *
@@ -131,9 +128,6 @@ long hypercall(unsigned long code, unsigned long arg1, unsigned long arg2);
 
 void shutdown(void);
 
-void __attribute__((noreturn)) panic_stop(void);
-void panic_park(void);
-
 enum failure_mode {ABORT_ON_ERROR, WARN_ON_ERROR};
 /**
  * (Re)Mapping of a cell memory into root cell upon loading and destroy.
@@ -280,25 +274,6 @@ void arch_config_commit(struct cell *cell_added_removed);
  */
 void arch_prepare_shutdown(void);
 
-/**
- * Performs the architecture-specifc steps to stop the current CPU on panic.
- *
- * @note This function never returns.
- *
- * @see panic_stop
- */
-void __attribute__((noreturn)) arch_panic_stop(void);
-
-/**
- * Performs the architecture-specific steps to park the current CPU on panic.
- *
- * @note This function only marks the CPU as parked and then returns to the
- * caller.
- *
- * @see panic_park
- */
-void arch_panic_park(void);
-
 /** @} */
 
 #endif
diff --git a/hypervisor/include/jailhouse/panic.h b/hypervisor/include/jailhouse/panic.h
new file mode 100644
index 00000000..a1df879c
--- /dev/null
+++ b/hypervisor/include/jailhouse/panic.h
@@ -0,0 +1,40 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef _JAILHOUSE_PANIC_H
+#define _JAILHOUSE_PANIC_H
+
+extern volatile unsigned long panic_in_progress;
+extern unsigned long panic_cpu;
+
+void __attribute__((noreturn)) panic_stop(void);
+void panic_park(void);
+
+/**
+ * Performs the architecture-specifc steps to stop the current CPU on panic.
+ *
+ * @note This function never returns.
+ *
+ * @see panic_stop
+ */
+void __attribute__((noreturn)) arch_panic_stop(void);
+
+/**
+ * Performs the architecture-specific steps to park the current CPU on panic.
+ *
+ * @note This function only marks the CPU as parked and then returns to the
+ * caller.
+ *
+ * @see panic_park
+ */
+void arch_panic_park(void);
+
+#endif
diff --git a/hypervisor/include/jailhouse/printk.h b/hypervisor/include/jailhouse/printk.h
index be1e861f..27bedcd0 100644
--- a/hypervisor/include/jailhouse/printk.h
+++ b/hypervisor/include/jailhouse/printk.h
@@ -9,6 +9,8 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#ifndef _JAILHOUSE_PRINTK_H
+#define _JAILHOUSE_PRINTK_H
 
 #include <jailhouse/types.h>
 
@@ -30,3 +32,5 @@ extern void (*arch_dbg_write)(const char *msg);
 
 extern bool virtual_console;
 extern volatile struct jailhouse_virt_console console;
+
+#endif
diff --git a/hypervisor/panic.c b/hypervisor/panic.c
new file mode 100644
index 00000000..db911d78
--- /dev/null
+++ b/hypervisor/panic.c
@@ -0,0 +1,86 @@
+/*
+ * Jailhouse panic and assert functionalities.
+ *
+ * Copyright (c) Siemens AG, 2013-2016
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+#include <jailhouse/panic.h>
+#include <jailhouse/assert.h>
+#include <jailhouse/printk.h>
+#include <jailhouse/percpu.h>
+#include <jailhouse/control.h>
+#include <jailhouse/processor.h>
+
+/**
+ * Stops the current CPU on panic and prevents any execution on it until the
+ * system is rebooted.
+ *
+ * @note This service should be used when facing an unrecoverable error of the
+ * hypervisor.
+ *
+ * @see panic_park
+ */
+void __attribute__((noreturn)) panic_stop(void)
+{
+	struct cell *cell = this_cell();
+
+	panic_printk("Stopping CPU %d (Cell: \"%s\")\n", this_cpu_id(),
+		     cell && cell->config ? cell->config->name : "<UNSET>");
+
+	if (phys_processor_id() == panic_cpu)
+		panic_in_progress = 0;
+
+	arch_panic_stop();
+}
+
+/**
+ * Parks the current CPU on panic, allowing to restart it by resetting the
+ * cell's CPU state.
+ *
+ * @note This service should be used when facing an error of a cell CPU, e.g. a
+ * cell boundary violation.
+ *
+ * @see panic_stop
+ */
+void panic_park(void)
+{
+	struct cell *cell = this_cell();
+	bool cell_failed = true;
+	unsigned int cpu;
+
+	panic_printk("Parking CPU %d (Cell: \"%s\")\n", this_cpu_id(),
+		     cell->config->name);
+
+	this_cpu_public()->failed = true;
+	for_each_cpu(cpu, cell->cpu_set)
+		if (!public_per_cpu(cpu)->failed) {
+			cell_failed = false;
+			break;
+		}
+	if (cell_failed)
+		cell->comm_page.comm_region.cell_state = JAILHOUSE_CELL_FAILED;
+
+	arch_panic_park();
+
+	if (phys_processor_id() == panic_cpu)
+		panic_in_progress = 0;
+}
+
+#ifdef CONFIG_DEBUG
+/* debug-only runtime assertion */
+void __assert_fail(
+		const char *file,
+		unsigned int line,
+		const char *func,
+		const char *expr)
+{
+	panic_printk("%s:%u: %s assertion '%s' failed.\n",
+		     file, line, func, expr);
+	panic_stop();
+}
+#endif
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 6934c33d..a0f6953c 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -16,6 +16,7 @@
 #include <jailhouse/mmio.h>
 #include <jailhouse/pci.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/string.h>
 #include <jailhouse/unit.h>
 #include <jailhouse/utils.h>
diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index 1b3027ba..d49e0a5c 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -13,6 +13,7 @@
 #include <stdarg.h>
 #include <jailhouse/control.h>
 #include <jailhouse/printk.h>
+#include <jailhouse/panic.h>
 #include <jailhouse/processor.h>
 #include <jailhouse/string.h>
 #include <asm/spinlock.h>
diff --git a/hypervisor/uart.c b/hypervisor/uart.c
index 6980970f..dd49adde 100644
--- a/hypervisor/uart.c
+++ b/hypervisor/uart.c
@@ -16,6 +16,7 @@
 #include <jailhouse/uart.h>
 #include <jailhouse/control.h>
 #include <jailhouse/processor.h>
+#include <jailhouse/panic.h>
 
 struct uart_chip *uart = NULL;
 
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-12-andrea.bastoni%40tum.de.
