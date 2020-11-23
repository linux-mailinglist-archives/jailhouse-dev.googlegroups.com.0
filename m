Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBXV76D6QKGQE3WDTFAQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF932C16BD
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:27 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id 64sf6565021lfk.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164446; cv=pass;
        d=google.com; s=arc-20160816;
        b=A0kcT76tQwOBqpFdyMrMrKud63KPht5KxCkFM9cRVkkwqu7JMdyasWnz+sBzh2OCIQ
         +6QVUswgx/QzTBJe8KmlKTmohcJgo3ZDQeP93XnNkYgq+TwR2ujhinR12VdFwW5+/02O
         g2gkFIn6edcW9Hbgm/qgwZyImwFO7IhFb+jhRYUH1OTabEku1FsNtSxy/mVgwHZzOCNT
         mNuLsPVRxVM0mAyJCM8H5Xnh2yGx1UmqEsXL2+DTfCeigFyRSNXtIgPQWU2EF/jFMWIu
         CYacdmF4FVbBCoVaCMC28Tk8x7b6UeyadWY0W1jjttHlWFiWd4V+F8RbMS4nTlNQZM3A
         SA0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=7XJmN5CXJui+scQMj2emR66imEgBShAxSxmLPRJvPWM=;
        b=d3/x/IEasVgpKih01c5yx9Gp8ozlG01nO6kZUOZuaSLDSUyqUzmXIIiqruMWMbhY4i
         IEEaV0ybruGr6U9enwaQ49RkAJTqt36ErPvKgKkqvqvt7NcGKMI6QA8g+3Hduwy0iPf5
         3rk73aXQnEzPO1E6XRjz8LZLNHUzP8YwMckprASaimLOsxOo1oDAeoRBR6dzDSkZxkrB
         Bu/m/Wb6Z55vGnzl5MW4yurLKrWhnSZbN8xEeTWz+BrZiWBH7M2msDfuUHuFdFYDM/9W
         pO7BY4nH946iBggTXUkx9u2QVabyZNLDajN/doIukhbpYDtD0XBfb/QoAV1w+KHGIiSv
         v15g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bZuK5xdf;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7XJmN5CXJui+scQMj2emR66imEgBShAxSxmLPRJvPWM=;
        b=fxbqUUNyKXPpLzHlp97RaUVXGmvP732JSF/6I9dzW+MuPT+dhk+FiBYkgPfI5Td670
         +h0FEqyDX5DhOFAlmRMfepv8kf+Msv4oNIe3Yp4eDxFKBWtpaS9xrfvKrTpg1bsVho+E
         KgsBrd/osPrE7LCvRf/2k6G3EMw8S/sYk93rEgQhNw6w5XOv1rM1y/oU79xnCKdIv7p7
         1kwgmkLqxipSNRGO2isQjkSOjGY+LAIe3t3h6YhvpHbSyVx+aht4+GNI+Tqt+4RmxVD4
         bs+ggw3rgatrQlhkuZkTZYbqDERRDJyv4ghrebnDmE5GRPdYxKSHycbVNFQlLB0ogQ09
         8XCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7XJmN5CXJui+scQMj2emR66imEgBShAxSxmLPRJvPWM=;
        b=oGZnbhxTSaKc3ZWe65RI0p/yLGm0BWgu1VVbhxjUkvxHxHiJq3AdHAP1yHWyBMq2Zv
         2DEbBOxNI5WW3LDiH4+Tf0mRtw8xH/b8uHPjlZtET12mvMafFAu1RWUKLmTMZntPiv73
         cCMZq6FMB8cnQaygFBAzB+iu3uXe8bt/DHbNSDRvWxbeEhSnDg6sWcuGtXVWWivgUrfC
         f7DSBp6B24l6+C22dv3tGEZyXC/zzcPCuZAUS+saByC3Ms2r5HKhUDKyxpZiOTiiXFz+
         L8RevgXqo++J+tXiIPvGcvxNGTNJCBvC96PfxVY1Exl1zrX+Y3A14BJYuzIhvBYWj7/G
         GtLA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530AKWetWuWcx4l2XUqabc2FX31Lumg+GmKk4b0zq7oDKTL2fjSC
	7ITbaUj/bzpuce5f/BN1cZo=
X-Google-Smtp-Source: ABdhPJwn47nVKiEmgMrnEzTLs/Ejiol6M8Q05o5AqUIcZPpiG8DMeUV70GFPVm3slCfpHtrT4wYTEA==
X-Received: by 2002:a2e:9811:: with SMTP id a17mr516035ljj.164.1606164446779;
        Mon, 23 Nov 2020 12:47:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58ed:: with SMTP id v13ls2614266lfo.2.gmail; Mon, 23 Nov
 2020 12:47:25 -0800 (PST)
X-Received: by 2002:a19:7f48:: with SMTP id a69mr402630lfd.379.1606164445881;
        Mon, 23 Nov 2020 12:47:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164445; cv=none;
        d=google.com; s=arc-20160816;
        b=BQj8uenGRPjTRPytGLIpGwJt2me8t1wAVpzHjmha9WsSK4L8+0yXpa5vZ2WeTRAHPv
         JzzIlir0zVuN7UTvuiShkbZ+13KDvL7fifHO7ZoFFYrC8qbXQ/m2IcfPZ8zRAjeToqWN
         cZDva4ZPH+7lwxgVRyifTyugfUIpJyWC39SqbvulVPPbDNCkX9tQCBAHBLRcZMXAw+JK
         RlXke+ugu/K5GDrjQW1T8gZ9sxzi6rAl9gk0RryYlXI75UqlVh9f4JSqffa739eRSpSd
         svBhD0i7EV9Ecs9vD4JK2f7azSBNvHJKqm0eu/cTo08oHTXYBJfKmARW1e1gCbZFLzQR
         B8fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=18z9SEaHGd8oXf30gXlCHnMYIFKVxzRztTLYh0/POe4=;
        b=otftxVZmGLQ7qDWGWltVLmVNeYj7dgb3q2W+FIVsVDCnlEV0Up24C0NWW8OvBRBLW7
         X6p08kExjWUALKK5a8apY1WsaL3MgoDc06GoOqwt/lRUeV5VKla7U02qj6XPrSJ3YOhR
         rp5wS+3ghBEqmpAw8wiw+ETHOZper42UKwc3Cgemv/jA5GlFLHgYVekN7IAiGYegD+yt
         /R992JUbDl8hOFCB5OL/1tJB/AEqyhRqPlZ74TQSabiCRypp0vRZGCM7IQpd4srQePxj
         9V0VircLvt+hIAbnd70fMMy3GJxIpsWDA73PHwjAMdGZvgtSRJf511+IuksFS1TsDD7L
         9DFg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=bZuK5xdf;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id t18si592338lfr.1.2020.11.23.12.47.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:25 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4Cfzjn2mPjzyT6;
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
	with LMTP id Ht3cjZKJksVb; Mon, 23 Nov 2020 21:47:25 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjm4z53zyTs;
	Mon, 23 Nov 2020 21:47:24 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 12/14] hypervisor: coloring: use assert instead of "BUG"
Date: Mon, 23 Nov 2020 21:46:11 +0100
Message-Id: <20201123204613.252563-13-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=bZuK5xdf;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm64/coloring.c             | 17 ++++++-----------
 hypervisor/arch/arm64/include/asm/coloring.h | 16 ++++++----------
 2 files changed, 12 insertions(+), 21 deletions(-)

diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
index 3748c3f0..ea59e292 100644
--- a/hypervisor/arch/arm64/coloring.c
+++ b/hypervisor/arch/arm64/coloring.c
@@ -20,6 +20,7 @@
 #include <jailhouse/unit.h>
 #include <jailhouse/cell.h>
 #include <jailhouse/mmio.h>
+#include <jailhouse/assert.h>
 #include <asm/control.h>
 #include <asm/coloring.h>
 
@@ -37,9 +38,7 @@ static inline int coloring_mem_destroy(struct cell *cell,
 	int err = 0;
 
 	/* Coloring was not created for subpages */
-	if (JAILHOUSE_MEMORY_IS_SUBPAGE(mr)) {
-		BUG();
-	}
+	assert(!JAILHOUSE_MEMORY_IS_SUBPAGE(mr));
 
 	err = arch_unmap_memory_region(cell, mr);
 	if (err)
@@ -55,9 +54,7 @@ static inline int coloring_mem_destroy(struct cell *cell,
 
 static inline int coloring_mem_start(struct jailhouse_memory *mr)
 {
-	if (!(mr->flags & JAILHOUSE_MEM_LOADABLE)) {
-		BUG();
-	}
+	assert(mr->flags & JAILHOUSE_MEM_LOADABLE);
 
 	/* Match the address specified during load */
 	mr->virt_start += coloring_root_map_offset;
@@ -67,9 +64,7 @@ static inline int coloring_mem_start(struct jailhouse_memory *mr)
 
 static inline int coloring_mem_load(struct jailhouse_memory *mr)
 {
-	if (!(mr->flags & JAILHOUSE_MEM_LOADABLE)) {
-		BUG();
-	}
+	assert(mr->flags & JAILHOUSE_MEM_LOADABLE);
 
 	/* Fix addr to match the driver's IPA ioremap */
 	mr->virt_start += coloring_root_map_offset;
@@ -102,8 +97,8 @@ static int dispatch_op(struct cell *cell, struct jailhouse_memory *mr,
 		return 0;
 	}
 
-	/* shouldn't get here */
-	BUG();
+	/* Shouldn't get here */
+	assert(0);
 
 	/* keep compiler happy */
 	return 0;
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch/arm64/include/asm/coloring.h
index 7d0ebaa9..b01f605e 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -20,6 +20,7 @@
 #include <jailhouse/cell-config.h>
 #include <jailhouse/utils.h>
 #include <jailhouse/control.h>
+#include <jailhouse/assert.h>
 #include <asm/cache_layout.h>
 
 #define col_print(fmt, ...)			\
@@ -83,18 +84,13 @@ static inline void arch_color_unmap_memory_region(
 		struct cell *cell,
 		const struct jailhouse_memory *mr)
 {
-	int err;
+	int err __attribute__((unused));
 
-	if (coloring_way_size == 0) {
-		/* TODO: add assert() for debugging jailhouse? */
-		/* must have mapped before */
-		BUG();
-	}
+	/* must have mapped before */
+	assert(coloring_way_size != 0);
 
 	err = color_cell_op(cell, mr, COL_OP_DESTROY, 0);
-	if (err) {
-		BUG();
-	}
+	assert(err == 0);
 }
 
 static inline int arch_color_map_memory_region(
@@ -105,7 +101,7 @@ static inline int arch_color_map_memory_region(
 		return -ENODEV;
 	}
 
-	// assert(!JAILHOUSE_MEMORY_IS_SUBPAGE(mr));
+	assert(!JAILHOUSE_MEMORY_IS_SUBPAGE(mr));
 
 	return color_cell_op(cell, mr, COL_OP_CREATE, 0);
 }
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-13-andrea.bastoni%40tum.de.
