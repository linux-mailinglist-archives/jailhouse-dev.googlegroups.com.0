Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBKPGXKAAMGQE7ZUQWVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C02302493
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:45 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id r5sf3203641wrx.18
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576105; cv=pass;
        d=google.com; s=arc-20160816;
        b=Si0De/5Bz4QehHgiqTUEFkXHssjyoJKmPsi8tFSD0Eh2ML4Hl9NOnJzdTwndKLydXo
         DI9XFRWk8+Qeq4pzfRab8C7vbONk5FU6TJ032455L27RabLyYK4Sthw7KtHfh8XFntH7
         mzP6CjVEvGhYhguZRnDk3jtFHM3K+kMNCdwxQBLUMyZ1cBWlwR02RmQMfzydteQGoQva
         48PiC2IEggShUnEOZucMOe7aJHZxF0QP2KySThke3PG1kqspEl8RfA+wVo2AkpRcwSDf
         NOuf7YbBQhPJDpVabC/iu0jr5nl+4VLFBDRFOBM+8BVhsZXKvOUcTm75pM/QcS6LEkCS
         EjIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=DuNy5V7R8dMUai64u4hx5p5ReWjb9IYSbu0xg4rYDMk=;
        b=p/sU0I9lKNr17m3f7d/e98T/0Vwe92KKEsJiaT2e+Ihhh4/bmxiiFwZ6oOpIK+8b7j
         XdOAPchjJp23qNphqX/LXSamkcVE8rvMsy59Aiykk+Laa4WupcESxFIr5XFmwm6EVc8O
         P04XxFxupPFQy11RmH3L04ikTefqKD8y9iZdCJKmrGNr1pQnUIAgAU+L6YMsUeJZE59H
         5VRgh/cs6riIazeHIFT3+aNl3vAEcEEDDm3X6AJVu5mdZJLhhD7vmLy9Hdz5LLegGuXo
         F9N9POE5W4NGjzt9+Wjl1eMJ+XMFDlef6xWvZSnOKzoWhJvrdY7KyXZGLP2tu8hOmTdd
         gx2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=p+Eyzs6p;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DuNy5V7R8dMUai64u4hx5p5ReWjb9IYSbu0xg4rYDMk=;
        b=mfQjcDQti9Y+qnRuYQ9NAx33QU2NOhwIBkSRXnnyckfLV4wnn5D0zFdFvlIxVkviRm
         fAeyvFN+W8dN//tdybNS9YJ0Ekioailoaq2lJed20e7Amm12CuuOb/AFq24rWi0LTA4W
         QSoxksHfx/8rsIp3XQzNgAHHtLSFolViYRxDBaejysqwF6V/7hUOBzxUZMV4iUMu3xVl
         L1NKK5zGDPEUzY/Fv/CKGU8roPEPAxzAiBi8uwXSrtCtD2Z6tVw8KeihUZ0pcCGnOG08
         ZxFwpxnQfLYX/Jc4mGgn7XvOPhTUQFeV9hR8ks09WMYqsLELRzuNdLUsPj1G2lTctbk4
         Myzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=DuNy5V7R8dMUai64u4hx5p5ReWjb9IYSbu0xg4rYDMk=;
        b=rtXRfA5nxLV6bU8mJ++lm9/CsxdFofv7FPfnlOdUMkndi2wSS3g3SpLDE5gqMlE0DD
         L+BnxTzw94cJ3oB9h44MtUPv6FPtSYMGrnB2+cCfkxT6CZRIqEaY4VRWRIJlyfvNtGXP
         C5hA7OAjV4k/vfa5wBQCotJWHiGxCfeN+DhOvnMLrW45UePEXwMXMOa5lYEo+4gbQaP9
         Vj9+stRTbtZrPX1cSBpXFUnqV6qzOVVqw9Kblu+42wANa86yOpflybdZ7KQjrgICzfzq
         exkpAeNdR4IrUeo36BXMavU4I+lHqExfnsUXsW8Mr5hEh6tZOtGEf1rznqnvFlQs5peq
         6iUA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531uxW8xpojgu+0VmU3Q7//aFXwjO9fuWs+0pZtDPAKRqpmZR3N8
	dZh6ZmWb/Sb4F85XwAtwYAg=
X-Google-Smtp-Source: ABdhPJzuMfL/0mvFgrUJOiWIwUh4iQ65c4JB2xLaSC0FumL27Q6QQNYgzytjcCeI3SWLkNSJEA1g3g==
X-Received: by 2002:a5d:4f82:: with SMTP id d2mr551652wru.87.1611576105712;
        Mon, 25 Jan 2021 04:01:45 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4482:: with SMTP id r124ls6533591wma.1.canary-gmail;
 Mon, 25 Jan 2021 04:01:44 -0800 (PST)
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr6063599wml.115.1611576104920;
        Mon, 25 Jan 2021 04:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576104; cv=none;
        d=google.com; s=arc-20160816;
        b=Pl9rhOFZQbhhqeXjRJqdbBy/y24mvk7C+tDLEAGAEkhqXGIUK/u0qoeXrFoVXaa3W4
         ufet5ApVdg86IDJyi9BLbSh2Nwl46M6MPetKu9d7EWwAuVdEJ/BFk/c/E5EaTs6W8uKS
         v36VA+rPB1C9HatYqOQVJ3OPkXY99bUo1T/SzdKeD/aTuA1PueJgi2eS3ZMHB9IGfhpQ
         gZRrABbRSmMbwMfguPu7f0n4AYTLx3IT2lcdZ3NDGU7AwDUo0oCHrlOwf50f06EOWAZr
         efDuwHM8KHvYqDq0JRx+hJjUYdz0C/Y21sufMHHmi2mM5qEsefBNAvmxfHOcDvWgVXfB
         +Cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=18z9SEaHGd8oXf30gXlCHnMYIFKVxzRztTLYh0/POe4=;
        b=RJiAMBIvKIRRx+kpiTkxge5E609EJjzTI48//DsSM2jAoDRyhsk0q7S610TWN6QDTQ
         OwluHUZAxtTWhwTN1fX4wNYVCHkBx6cZedp/R2iVJJSNSq0bVb2ABcAjNGDlWjw8YLSB
         F6HlumWnvY9GvBF1pl1q2P+yAfSSOydWSD36DvruOoLzYzFy11e9fu7f8FEHBQONGQG7
         fWMnQY3DKSZmo0f6HzYlp2yvAU8u7NWpyFD4B5B0qWlvJX2xmYpuKQI5SuKdc57ITER6
         sVDAcLK3UnVDBqY6HgxLneGSC5Z7migWkzo7MKO1fE0rfxsVPQJPMbspU0ExnP/eB3Vx
         H6PA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=p+Eyzs6p;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id i4si993732wml.0.2021.01.25.04.01.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT485Ds8z107k;
	Mon, 25 Jan 2021 13:01:44 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 072r8LXQrhcx; Mon, 25 Jan 2021 13:01:44 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT480kPNzyjq;
	Mon, 25 Jan 2021 13:01:44 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 12/23] hypervisor: coloring: use assert instead of "BUG"
Date: Mon, 25 Jan 2021 13:00:33 +0100
Message-Id: <20210125120044.56794-13-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=p+Eyzs6p;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-13-andrea.bastoni%40tum.de.
