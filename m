Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGEXYH6AKGQEK3NREJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B3294F1C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id m14sf1668551wmi.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292056; cv=pass;
        d=google.com; s=arc-20160816;
        b=pLQhDVdiaTVBkFq1YRoDsnR/DlKKhtsMmglOkqN079fJ9jnsffefCHYvlWblhLVGPf
         /s6d/IW+4MbN0pkITE/LnuJpqkkUv1COXLaNGKjkpj85CK7iG3y0fs/gnvNy+TLpc1Cp
         5tFhjAEAi9LpULcyLoV17Fc0oVbrxuxmrKiC+eLa4geDviHYoRTknoMWZprbPKI4glsS
         HDyj1aLfG84i5YAnuSFU/UekS9KwXuIA1k70l1AQGPz4rDm2SHn2MAMxTf4sFIl9xRqT
         w2zUZVPlpGoG+iZAMNRaOGl9RGSgJcrXCn5hQtLWpO6oTc5TEfvFiOj9ONMpyE+0xdta
         0nmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=t7iPIcLQy8r1jcDgSqsiUhz4QqPY2jAHRrCCqInJdpE=;
        b=Zbq8Q5s6lXRdl93IrdYbjeNuMiKwN77Z4KicgKQ1dY8/yY0S5OczPj8bmzRkCGhkd3
         RIkd+DbNGG1tdpsGE3dMneqSChfFLoIIZ3nWWWjuQ6NU80zEeCat7ICElyWhJp4p9PI9
         8TpJYIoDxjqaiil6ocMNxKjAwz2cOZC+rHLQvM2isJbCaIl+AJfD+yq2u1trHwfGW/MA
         gHEorXPqgBFSVGdtsu+6eczv0OFPAXHmOHyb+dsUu6ehYnny0xrt4tlX6oSOXOvP6BXT
         7t8l1yO37KlvbiqLl1XKgo0sLhEj4lQSkt+CbgJwDDW8MNpJsrBV6XNn+gQ//5LkrlZD
         lIhw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=FtUNoUDN;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t7iPIcLQy8r1jcDgSqsiUhz4QqPY2jAHRrCCqInJdpE=;
        b=axdrWfN1WROd1zrk6HY5RaqZq9Myd+i2apFIaXqM1Ch/ZSEtGTgYvlFWv0/AnoO4IX
         wNYctRNIlr/hMndVBGccHC6rluy/O2Ka1fMcPJKVoVWyBpYFebckwntITz/JraCmOaIp
         yCy69LW9vNeheu56Ufo0Va1Wjpey2DSZMrwdBh9vBRGa4sJ7WUDoEPqPT6rnq3CFxvNr
         EsEzIe0mg7HZygFXKf3zaZxmtf2bl5C1jDvJ49qoUw5zLUI/LaJk9incZd+OOav2G6wv
         NdLhfUi1C1WeXNnrM7hmPURnpv/tc6sN4HqC2PkwGeBdoLUwGkUMGVwm56VIBksc0iNG
         ayyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=t7iPIcLQy8r1jcDgSqsiUhz4QqPY2jAHRrCCqInJdpE=;
        b=SnuqWp6FdTpptf5phSL4r1+4ktXJRJ1/aKZwN5YtDVkfW5KNoFeCGYQ8Lt+RCwDnZz
         orapC7ENpuwqOGL88spLh2FAZVQ/HUb2Cg5bClaRvRLmkFaN3/tvBVveCmiSKk5d3sKG
         LAIbrss4sigA/iBYngblqvDXeFAzQ18f8CglgAtD76/QBhha+tIn5fkK199U8rh4hSFJ
         Wn64KfsC4/IhgNhXwa/VXA53dzYa3ZLOrU1kZrqs0x3r9nxoXAoCuf1/9WAmIF4UuyrB
         Kr5gmYt0MTqiirQbZJFZkLmKjeTNSYrRiwEsvL9WPbqPs634MsTR/lKkqCxzoG7GByeu
         +xiw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531r9xBCqwbVyRu5PeayuPKwR1sRzr2Odt/v/X8mefz3bgNQ8Ict
	y07jjRFNKXl0+Ht2s4mik+M=
X-Google-Smtp-Source: ABdhPJyH2cURo+Qbbnrbo/+qjrUKs6FC7PCg/DXxjYnP+5xOfJsPZycqf0wVW3mubXdNFVbjNE2ufw==
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr4012609wmb.180.1603292056558;
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4ac3:: with SMTP id y3ls36585wrs.2.gmail; Wed, 21 Oct
 2020 07:54:15 -0700 (PDT)
X-Received: by 2002:adf:e741:: with SMTP id c1mr5505187wrn.16.1603292055664;
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292055; cv=none;
        d=google.com; s=arc-20160816;
        b=c4Xd9eROYst7XaaJIRBb9IcKlofrwUpr1C1si9dRPMkxr8g4vg94WyOi/ZG7u6Gonh
         6xqtfN1afUgc3H0m9UIwabtDQxtC7vj8XbmWw3kcvpXlKai6tfxaBqBcaISBqM3IF3au
         H8uJ77OZ4BhxPS9ZmGHk954SemRUKCvQ9M5s6wv1/nLz6tcOGuQ56zo7KYXdUCUipq0c
         2NWaP5etydoFLiw7IPmRSq93HkdkozmyhPbS7GH0JtI9Oq5v7t3b+nihHUhs0MrFmvgS
         jdif0GlA6ioksMWw+DgpijtxC4oxwAfAd/+nJUOw1E7kCYlPbl3d/sMRLdKytBEPN6o+
         AosA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=c/VQEAF+ydCHi86ioTTEkN6r/3N+me2jIxsSbHpQQkE=;
        b=fucxn9Bz5hEJmlMf5L/fC+LyXCVsf7+e4xFUTl5P4BuaZR3tOa1WhO+XCOWfbxC4e5
         aZ7WFOnf9Ge/IjUSpM3p6DceEESfBlKDXQI+x7teucMxNLmzsfVSKmlX12jBw32spbDP
         d1lSgson/Z1uRzvyA0/6aQC7UUmmfo7WbwCznJnptuxA1GLksTirecwkQbpxpY+VWoG2
         8sWyRR/NzdxMGlkafTmbVQPuztsuF9VdHBqcj69n9+agscwtMcLGWKnmDLfBMYF7LSbg
         pHZpfNC+2q6R+4ZaSgvoyh4di3UEmfbOKO4uaeYgdhvzRIznrO/FOpaD+rTg+cQ0ndaH
         VL1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=FtUNoUDN;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id w6si94170wmk.2.2020.10.21.07.54.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRW3QtTzyWy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id mXsNnKjfhd34 for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRV6vHdzyVy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 06/26] hypervisor: provide dedicated declaration for __page_pool and __text_start in globals.h
Date: Wed, 21 Oct 2020 16:53:44 +0200
Message-Id: <20201021145404.100463-7-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=FtUNoUDN;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

__page_pool and __text_start are global vars, but there is no
centralized declaratoin for them. Wredundant-decls complains in multiple
places.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/globals.h | 21 +++++++++++++++++++++
 hypervisor/include/jailhouse/percpu.h  |  3 +--
 hypervisor/paging.c                    |  3 +--
 hypervisor/setup.c                     |  3 +--
 4 files changed, 24 insertions(+), 6 deletions(-)
 create mode 100644 hypervisor/include/jailhouse/globals.h

diff --git a/hypervisor/include/jailhouse/globals.h b/hypervisor/include/jailhouse/globals.h
new file mode 100644
index 00000000..b4be2315
--- /dev/null
+++ b/hypervisor/include/jailhouse/globals.h
@@ -0,0 +1,21 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) Siemens AG, 2013-2020
+ *
+ * Authors:
+ *  Jan Kiszka <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef _JAILHOUSE_GLOBALS_H
+#define _JAILHOUSE_GLOBALS_H
+
+#include <jailhouse/types.h>
+
+/** Global page pool and code */
+extern u8 __page_pool[];
+extern u8 __text_start[];
+
+#endif
diff --git a/hypervisor/include/jailhouse/percpu.h b/hypervisor/include/jailhouse/percpu.h
index 344ed65f..7ff5d6bb 100644
--- a/hypervisor/include/jailhouse/percpu.h
+++ b/hypervisor/include/jailhouse/percpu.h
@@ -19,6 +19,7 @@
  * The per-CPU subsystem provides a CPU-local state structure and accessors.
  */
 
+#include <jailhouse/globals.h>
 #include <jailhouse/cell.h>
 #include <asm/percpu.h>
 
@@ -132,8 +133,6 @@ static inline struct cell *this_cell(void)
  */
 static inline struct per_cpu *per_cpu(unsigned int cpu)
 {
-	extern u8 __page_pool[];
-
 	return (struct per_cpu *)(__page_pool + cpu * sizeof(struct per_cpu));
 }
 
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 876f1521..93622d9e 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -10,6 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/globals.h>
 #include <jailhouse/paging.h>
 #include <jailhouse/printk.h>
 #include <jailhouse/string.h>
@@ -21,8 +22,6 @@
 
 #define PAGE_SCRUB_ON_FREE	0x1
 
-extern u8 __page_pool[];
-
 /**
  * Offset between virtual and physical hypervisor addresses.
  *
diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 9f651aec..5db00051 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -10,6 +10,7 @@
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/globals.h>
 #include <jailhouse/processor.h>
 #include <jailhouse/printk.h>
 #include <jailhouse/entry.h>
@@ -22,8 +23,6 @@
 #include <generated/version.h>
 #include <asm/spinlock.h>
 
-extern u8 __text_start[], __page_pool[];
-
 static const __attribute__((aligned(PAGE_SIZE))) u8 empty_page[PAGE_SIZE];
 
 static spinlock_t init_lock;
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-7-andrea.bastoni%40tum.de.
