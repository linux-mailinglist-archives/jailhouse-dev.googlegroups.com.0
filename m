Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBNHGXKAAMGQEAJOEVCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0370C30249C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:58 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id k7sf15105ljj.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576117; cv=pass;
        d=google.com; s=arc-20160816;
        b=W6EbzS4AueJQ684eLQ8U2jM83+CRjIPUPYulOJAmwbD7gItzy5RR/xWe7UuPs9bNIL
         DrcoAM42Dmz0FwMZv2pKdsdWe092kFRjTWXOgOhxJSET5x7E8JK+2heMdVcXZqiap4OA
         CXz1bxImzYetIGlmhTmV92/8qfJUtXy7tow2MtigbIRhmQORO7lbm0DF8P74qGosCymc
         RMvNGT/KwWX9orAfzoVGmyyTT8X47huc4tiN66XqfRaY+1ZHvTt+hI9CLaf7TOi0L/n8
         RYf4KGSumYrMMT33pDO4WW/0toKlWy08k+EpWIxQGRK19HwWReu1THHhQiDR6YNvUQF3
         H5yQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=5B1aoA3q/xs+2xKEDVF7cM21+JLs9biyGaHPg77z8ck=;
        b=nnvAZWjf+9vNNwF60fx2DfKWedp8fGLg2JpJIx/MVhlYrXeuOSmv/wC3bsc3Abnghp
         SEbi4INx0dOGVOBExUQGhfud56WKD8QMEsxoDDPs/HjV/p+Lb8r90yglcwN8eG/UINyS
         U2t0hRw7tDNDKgOM0qR5O3/9o4R6kDcQF9UrzwOr9fWVP1RyRs6Tc1fXI8nGgaFc4ARy
         5k5hY+FNIYS4H/WC3d5+Nf8PvPhpB6fwigvdAVD0a+do1jUlEQW6QBWuvGHDx45HY+L1
         GnZt0wnUrUMeCy3MhY2WLkAK+WvMQf2B7kBH63RhMXEkkBhpSzgow/1gUG7JlEzJ2Isj
         fuPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rh8zGTXl;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5B1aoA3q/xs+2xKEDVF7cM21+JLs9biyGaHPg77z8ck=;
        b=h4vycD6GZddpqxE8HUr3BIpU893i0ZwFPUR2HxpLAdZcIVQ5Ziaqrs9a7Nt9uNVfve
         jj5JOG7iYTBgo0pEc0pWN6z1zvXAsPen/fvyzZ+Kfo/J1hRIJMygJsoCqdvFa00AO2DI
         l+CY2L36SScyI/rQ7hnN4ZNVGsj2vdAOQjU6hz+ZsP6wXcA7s6Y1AMAiaxgZndFrarEa
         vFd69RHcYkIIJsfMH1c9qRH4LHDP5Cu0MPqYIh25FDRKwP8kTPfFVzydyOEWGXtXKm4/
         afV3wXV0fWlMPtpsN3pKcD3+ez6lX70jFTRoweYw5sA75cMRi9j/Y+bq2uS8FvFJlHK/
         ejjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5B1aoA3q/xs+2xKEDVF7cM21+JLs9biyGaHPg77z8ck=;
        b=uWKng1rsxWKwSgDU6uQNVHa3gcsP6slRZNLvNppi8XWjP2XuWiDSGwdwf2DI1k9kcf
         7jifCLc0o01lGUbWlqv+vEUmnKioGNmzUYPnKDpkqUjFLrPhLDt3z6Cft7Hb2QIKLAdi
         bNJprv29jTKS10OSFNdfvMzmK+zgw0xjV6biDRsf4b0LSndjx4uKr5324WbhT720mp2m
         r8ww1UUNUwwUnsQK+uPTq8q8i1HAxbKUkakFNy57rnZOuJbmM2jtkY0dApTMlVfJ9hJQ
         BPXt6SjiD7Erks6ggAW0jg+zHtcUOQwz3oKN0zsyz/Yrdld9IqWwRiNBZ+cHr61DJy7Z
         NwSw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531tToiOQl+4OZlrh9S40fX9Vp2KJcqvLOasNOX7L+OI0w1ZV9Gm
	j5d7n6X2CN9DSVW/FS/fX58=
X-Google-Smtp-Source: ABdhPJzeWNQwqNchOpwd2HX1JiL64MJ15pDDp0PzsENNRpR4saeCIWre9IKBQU3ambaqnnkQ6Fkc3Q==
X-Received: by 2002:a19:d83:: with SMTP id 125mr91852lfn.651.1611576117548;
        Mon, 25 Jan 2021 04:01:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6145:: with SMTP id m5ls48619lfk.2.gmail; Mon, 25 Jan
 2021 04:01:56 -0800 (PST)
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr127259lfc.354.1611576116256;
        Mon, 25 Jan 2021 04:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576116; cv=none;
        d=google.com; s=arc-20160816;
        b=kyMPGJaztw3k0oBsbpF3bX5YDczabjrge/dZrDj7mCYCZ0ifnY4QLp9zVA8lBPbgTT
         lxovq2TIv6DQcbky0QszTMD8yZeWGX9cKu8BrUlfWsGvvrFkPBUd61+oDNgO4hkncIUt
         iQ8izqeBP+dx/ZwhmczDo8sfXAbDTiXzT3hQojfkz//8YwAPNfSFHZA2qqQaJnQbhW4V
         oxMosrYro/YhbS60uB7cBQIJfR2rDj6aBHnMan1qd5P+72a2cjXhiIyNN2kQL/dp0l7i
         ycWfYqEjamTky041osKQZR7TWa7W2xOhT4KASbZDUdzyUlR1r4sVYAGMd2+Nqsu/ahgT
         MDjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oApa6TpkPCFoV4qx0MJ59T9zPWQd60hBUGEvHmo9fPk=;
        b=VcKx7boHGlthKEpJl7ucPpl/9MWOAJeLMFsdD3m3AuYuAUOcC6MYRSxOfPCg+C5nNg
         QFnHfSDPvSmEoitjTa9Zomh27LdXOt12qL8InbdEntc53GLR7ldJRDHkKFKmpP1QPDJ7
         nRdFuE2DfSrh/IvY5tuG5oFsEiN3rqQcKDrGK9iWCwf3F4sNMkMU7INcVoTN11ilS6qN
         ohB1shCK02mWTb1R5qanB1iYZ43iiZo0lIVZso24wt2Ku55lY0guoOKoWJQSoR4Xl+9v
         urh6Rz+Fn2nr/qun/C8nOj1wBOFwiXrhsUpWT1KHDk1O7CA6YxbmQHWIeTE0zGmcJuSl
         GVXw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=rh8zGTXl;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id z4si875546lfr.7.2021.01.25.04.01.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:56 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT4M5PyDzydg;
	Mon, 25 Jan 2021 13:01:55 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id frpllyfVit6v; Mon, 25 Jan 2021 13:01:55 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4M0tdXzydb;
	Mon, 25 Jan 2021 13:01:55 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 20/23] coloring: extract get_bit_range() logic and remove offset dependency
Date: Mon, 25 Jan 2021 13:00:41 +0100
Message-Id: <20210125120044.56794-21-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=rh8zGTXl;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
 hypervisor/arch/arm64/coloring.c | 40 +--------------------------
 include/jailhouse/coloring.h     | 46 ++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 39 deletions(-)
 create mode 100644 include/jailhouse/coloring.h

diff --git a/hypervisor/arch/arm64/coloring.c b/hypervisor/arch/arm64/coloring.c
index ff3b5a78..c066ae24 100644
--- a/hypervisor/arch/arm64/coloring.c
+++ b/hypervisor/arch/arm64/coloring.c
@@ -21,6 +21,7 @@
 #include <jailhouse/cell.h>
 #include <jailhouse/mmio.h>
 #include <jailhouse/assert.h>
+#include <jailhouse/coloring.h>
 #include <asm/control.h>
 #include <asm/coloring.h>
 
@@ -54,21 +55,11 @@ static inline int coloring_mem_destroy(struct cell *cell,
 
 static inline int coloring_mem_start(struct jailhouse_memory *mr)
 {
-	assert(mr->flags & JAILHOUSE_MEM_LOADABLE);
-
-	/* Match the address specified during load */
-	mr->virt_start += coloring_root_map_offset;
-
 	return arch_unmap_memory_region(&root_cell, mr);
 }
 
 static inline int coloring_mem_load(struct jailhouse_memory *mr)
 {
-	assert(mr->flags & JAILHOUSE_MEM_LOADABLE);
-
-	/* Fix addr to match the driver's IPA ioremap */
-	mr->virt_start += coloring_root_map_offset;
-
 	/* Create an ad-hoc mapping just to load this image */
 	return arch_map_memory_region(&root_cell, mr);
 }
@@ -104,35 +95,6 @@ static int dispatch_op(struct cell *cell, struct jailhouse_memory *mr,
 	return 0;
 }
 
-/**
- *  Get range of contiguous bits in a bitmask.
- *
- *  The function returns:
- *  - bitmask without the extracted bit range.
- *  - low: original bit position of range start.
- *  - size: size of the range
- *
- *  The function assumes bitmask is not 0.
- */
-static inline void get_bit_range(
-	u64 *bitmask,
-	unsigned int *low,
-	unsigned int *size)
-{
-	unsigned int _range;
-
-	//col_print("mask: 0x%lx ", *bitmask);
-
-	*low = ffsl(*bitmask);
-	_range = *bitmask >> *low;
-	*bitmask = _range & (_range + 1UL);
-
-	_range = _range ^ *bitmask;
-	*size = msbl(_range) + 1;
-
-	//col_print("range: 0x%x, low: %u, size %u\n", _range, *low, *size);
-}
-
 int color_cell_op(struct cell *cell,
 		  const struct jailhouse_memory *col_mem,
 		  unsigned int op, unsigned int flags)
diff --git a/include/jailhouse/coloring.h b/include/jailhouse/coloring.h
new file mode 100644
index 00000000..3def05d9
--- /dev/null
+++ b/include/jailhouse/coloring.h
@@ -0,0 +1,46 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See the
+ * COPYING file in the top-level directory.
+ */
+
+/** MSB/LSB function names differs between Jailhouse and Linux */
+#ifdef LINUX_VERSION_CODE
+/* NOTE: use [0-63] variants */
+#define _lsb(x)	__ffs(x)
+#define _msb(x)	__fls(x)
+#else
+#define _lsb(x)	ffsl(x)
+#define _msb(x)	msbl(x)
+#endif
+
+/**
+ *  Get range of contiguous bits in a bitmask.
+ *
+ *  The function returns:
+ *  - bitmask without the extracted bit range.
+ *  - low: original bit position of range start.
+ *  - size: size of the range
+ *
+ *  The function assumes bitmask is not 0.
+ */
+static inline void get_bit_range(
+	u64 *bitmask,
+	unsigned int *low,
+	unsigned int *size)
+{
+	unsigned int _range;
+
+	*low = _lsb(*bitmask);
+	_range = *bitmask >> *low;
+	*bitmask = _range & (_range + 1UL);
+
+	_range = _range ^ *bitmask;
+	*size = _msb(_range) + 1;
+}
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-21-andrea.bastoni%40tum.de.
