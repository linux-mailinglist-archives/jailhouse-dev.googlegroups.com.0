Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHHGXKAAMGQER5L4QTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E5D30248C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:33 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id j133sf5804068wma.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576093; cv=pass;
        d=google.com; s=arc-20160816;
        b=fy95Rj/nNVl5YIVH+Z56vvXGE+Zv189aw8Nuqd9LZ0OR6gJFgsoIcr8U3Pt/lpXr4X
         KCZDZ6WUNC3aZ3LPIuo54nTWtm8PDvVKRNpA1/CbTI3de8PsO9dYVhtXxhYMt3WoikhK
         a/nFHSJ2UNjBmDipgYKB3DnxaqqcipgYoZhL75hyCwcK193KWm1HQhyZTlHKNKwyKkcm
         lkjJhM67kYFcPqLBgVLNZQYCsRdzYbXZ5gRN7IfasBO9bwhIpe6cPpEa7m8nUrOXwBdg
         ulYtRh0skkSEsILBeWHhfESDXg5nuC3/E/buMybbOkWMmN3tH4L++JRaiils/cuvsn/J
         XXQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=blf6B1HYpHuUCrYhtoSRNeYZw0NgpRJrQx4xVmXhT8s=;
        b=WNtGMpbtfd1gQRIHKmt8uiTVRLy8jGotLrvGL3VUNPGmyBMchwd77EqnZCBolLPjkb
         Fpca7qIQIieatQHQLGBngiXMp+8Bd7EAUNvSaENMyK/OYtGeQpsolyCsLkMEa083E9Og
         yJGo1zTcFsF3BOzQWiVQOD3ZMFUJVmDClHXb0DpO101MtTk29qYmhwqwN+RgiZctc27Y
         2VXtZjuPl+iJnyJqnfVF8N/fBfE6PtC6Dq8iPjMIkbtt61cwNHQMAAtTF5gmMHn4xSVY
         HleYwp6bT7yl6PMNOGo/jzIxYvrnWjHiv94wq1yaHuVTkLsUnwMHi9MLSNkVZMzUI/zX
         nvhQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=F7IyEKYY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=blf6B1HYpHuUCrYhtoSRNeYZw0NgpRJrQx4xVmXhT8s=;
        b=COz64e3NpeS/7d5Zj0uFYyQmPTd2SejV2JHTBeCFHfy9v5189+kG27+1SnohD6FDAX
         qYPhRx4vDlV61958PNEY7CuS5+IEiFTALldt8arcpf0/a5WXC367NU/V8WQgv0eoWH8L
         ECedjgQwA/0Olb7+msNmLjeGnqy56WYk2q+sdwPzthE2P5o8+ve6ckkGGNgJg+XUkD27
         LmRaoukGIjXH7DTN/9Gx6DMR0ligbHhmLclr2SyfmtGkm4P5jbuVO2tqXWyEXXl88/WH
         P7F45gPnyRfxf1lWI1boO6UUy5cQ+D/8I9ktXRfGssLycWS/3d/7fgK6GsneMyTuffzp
         2iUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=blf6B1HYpHuUCrYhtoSRNeYZw0NgpRJrQx4xVmXhT8s=;
        b=L0Mqw4N1QjwaVSUZpkZ10pPaFSbplRt7TH+EdsfaQBHc26IVEo82B97n1fQvdl+fpo
         YkFG2SJ2+rUvwQ2KMBMXaF0mGtGQNIBMUZd1Mj4wxaoEu54KZ1n/0X67NUN3uBJ6Q+vz
         QbF+zDNrQS9OqVJfuQ+Ky3y8VRDIlWd9E+NlUPEa0Lxd0+tEoz3VwKJ7KqAicjBuou4T
         uiULgs0zr1ng2EDo4qQwsb0Hym+U+PUzoS8cZ6b+O26CUckbZfr4eSwUmGr1flvmUlIh
         t4I4LeT6+GwKljTQMRgHHOpmmV975QgTKW12ZIAy01T8hrNQtLRwlJn8uKzzZcogZRX/
         /1Ng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532SwiaiWUH8W3ybkKomVBa0iDxqCJP6lQGQVB3XWaxgSw5EscZc
	qc1p7BA/TfQ7ZhGbT/fONN0=
X-Google-Smtp-Source: ABdhPJwxBap/YIiCA3wB3XWm2U+NJaXYPGYGNehAacFAP7n4QoOhOpFGqcrJSrSiW1huxtxfP6q1uQ==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr641234wmi.159.1611576093128;
        Mon, 25 Jan 2021 04:01:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:4485:: with SMTP id j5ls96458wrq.1.gmail; Mon, 25 Jan
 2021 04:01:32 -0800 (PST)
X-Received: by 2002:a5d:6b89:: with SMTP id n9mr519978wrx.323.1611576092395;
        Mon, 25 Jan 2021 04:01:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576092; cv=none;
        d=google.com; s=arc-20160816;
        b=YftdTq67LHfrpttq/VNGImbaSpy3f7k4sHIlyYi3NHjVFQTlYy9UDnwqH/9pGY6J6K
         3JdgO24vRlKxFGKUx5KHPNzyt+mv+9kRt/dduKr8N211J8WZ3khuBMP3ED+L4zsMc/sf
         z5mLbbmOaCdlz+iLDWn57AkpiSVL6RMS3kANUggIDUxNQmeg/mR9Yg8nS6XhfxZV5t4/
         ERQ1h4piLjW0sULxybeJtW2PcBHW1aRi6hFXewhDdngHjV0M1HF/8SWR+fvETWJ+HZ6W
         VyXHICJ/7+VQOJE9Rsw/M6Xo4FyV8bZrg6lGCtTaIA03oij8jD0rtL9D/Br/jQkD5CbJ
         cRTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=URPIelbH8EWDbrPfFhJZ9I5vHWDttHBBrz5FxEymmPQ=;
        b=jSdJDgykOxX/eN/tFWh+85zNDLRFEYSJERVC4SDNICQkPR31akk4U30wfv9YOrjYpo
         pBjKZuO6yTOYEHWUGn4JfrSoiyHUZjjEMnNEEbZOrRsUS4TCXso5uP5TuMZOKdqlrXJr
         a3sjkVNHU9r8ZGs0Er/ZOyxy1BfoHGP1AHT+Rnv+BjO6ZV4I55RnDESwMPDeJY5C3mVn
         lN+yiWJpngYmO4hUj67siNLgEUfoiuDgrB63qR4uvYIXUi2Ax/Y+pSjv6uWt5V7gzBX3
         lRn4RO1dnOD1RYFJLGOlJp+j7LWD5e6d0FekL4xewm+dgNBKIVBemTfG+18uVeFWuFX1
         LwQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=F7IyEKYY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id i4si993670wml.0.2021.01.25.04.01.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:32 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3w1S69zydj;
	Mon, 25 Jan 2021 13:01:32 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id JtxMenesLPI9; Mon, 25 Jan 2021 13:01:31 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3v2nvTzyd8;
	Mon, 25 Jan 2021 13:01:31 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 04/23] hypervisor configuration: hook autodetection for coloring_way_size
Date: Mon, 25 Jan 2021 13:00:25 +0100
Message-Id: <20210125120044.56794-5-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=F7IyEKYY;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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
 hypervisor/arch/arm64/Kbuild                  |   2 +-
 hypervisor/arch/arm64/cache_layout.c          | 148 ++++++++++++++++++
 .../arch/arm64/include/asm/cache_layout.h     |  19 +++
 hypervisor/arch/arm64/include/asm/coloring.h  |   3 +-
 4 files changed, 170 insertions(+), 2 deletions(-)
 create mode 100644 hypervisor/arch/arm64/cache_layout.c
 create mode 100644 hypervisor/arch/arm64/include/asm/cache_layout.h

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index a5525811..3f5aebcd 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -23,4 +23,4 @@ lib-y :=3D $(common-objs-y)
 lib-y +=3D entry.o setup.o control.o mmio.o paging.o caches.o traps.o
 lib-y +=3D iommu.o smmu-v3.o ti-pvu.o
 lib-y +=3D smmu.o
-lib-y +=3D coloring.o
+lib-y +=3D coloring.o cache_layout.o
diff --git a/hypervisor/arch/arm64/cache_layout.c b/hypervisor/arch/arm64/c=
ache_layout.c
new file mode 100644
index 00000000..0f28a440
--- /dev/null
+++ b/hypervisor/arch/arm64/cache_layout.c
@@ -0,0 +1,148 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
+ * Copyright (C) Boston University, 2020
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Renato Mancuso (BU) <rmancuso@bu.edu>
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * Autodetection of the cache geometry.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+
+#include <jailhouse/printk.h>
+#include <jailhouse/utils.h>
+#include <jailhouse/paging.h>
+#include <asm/cache_layout.h>
+#include <asm/sysregs.h>
+
+#define verb_print(fmt, ...)			\
+	printk("[COL] " fmt, ##__VA_ARGS__)
+
+#define MAX_CACHE_LEVEL		7
+
+#define CLIDR_CTYPE(reg, n)	GET_FIELD((reg), 3*(n)+2, 3*(n))
+#define CLIDR_ICB(reg)		GET_FIELD((reg), 32, 30)
+
+enum clidr_ctype {
+	CLIDR_CTYPE_NOCACHE,
+	CLIDR_CTYPE_IONLY,
+	CLIDR_CTYPE_DONLY,
+	CLIDR_CTYPE_IDSPLIT,
+	CLIDR_CTYPE_UNIFIED,
+};
+
+#define CSSELR_LEVEL(reg)	SET_FIELD((reg), 3, 1)
+#define CSSELR_IND		0x1
+
+/* Assume ARM v8.0, v8.1, v8.2 */
+#define CCSIDR_LINE_SIZE(reg)	GET_FIELD((reg), 2, 0)
+#define CCSIDR_ASSOC(reg)	GET_FIELD((reg), 12, 3)
+#define CCSIDR_NUM_SETS(reg)	GET_FIELD((reg), 27, 13)
+
+const char * cache_types[] =3D {"Not present", "Instr. Only", "Data Only",=
 "I+D Split", "Unified"};
+
+typedef struct cache {
+	/* Total size of the cache in bytes */
+	u64 size;
+	/* Size of a single way in bytes */
+	u64 line_size;
+	/* Size of each cache line in bytes */
+	u64 way_size;
+	/* Associativity */
+	u32 assoc;
+	/* Max number of colors supported by this cache */
+	u64 colors;
+	/* Which level is this cache at */
+	int level;
+} cache_t;
+
+/** Autodetect cache(s) geometry.
+ *  Return the size of a way or 0 if no cache was detected.
+ */
+u64 arm_cache_layout_detect(void)
+{
+	/* First, parse CLIDR_EL1 to understand how many levels are
+	 * present in the system. */
+	u64 reg, geom;
+	unsigned int max_cache_level;
+
+	unsigned int n;
+	cache_t cache;
+	u64 type, assoc, ls, sets;
+
+	arm_read_sysreg(clidr_el1, reg);
+
+	max_cache_level =3D CLIDR_ICB(reg);
+	if (max_cache_level =3D=3D 0) {
+		max_cache_level =3D MAX_CACHE_LEVEL;
+		verb_print("\tUsing default max cache levels\n");
+	}
+	verb_print("\tmax cache level =3D %u\n", max_cache_level);
+
+	cache.way_size =3D 0;
+	cache.level =3D -1;
+
+	for (n =3D 0; n < max_cache_level; ++n) {
+		type =3D CLIDR_CTYPE(reg, n);
+		verb_print("\tL%d Cache Type: %s\n", n + 1, cache_types[type]);
+
+		if (type =3D=3D CLIDR_CTYPE_NOCACHE)
+			continue;
+
+		/* Fetch additional info about this cache level */
+		arm_write_sysreg(csselr_el1, CSSELR_LEVEL(n));
+		arm_read_sysreg(ccsidr_el1, geom);
+
+		/* Parse info about this level */
+		ls =3D 1 << (4 + CCSIDR_LINE_SIZE(geom));
+		assoc =3D CCSIDR_ASSOC(geom) + 1;
+		sets =3D CCSIDR_NUM_SETS(geom) + 1;
+
+		verb_print("\t\tTotal size: %lld\n", ls * assoc * sets);
+		verb_print("\t\tLine size: %lld\n", ls);
+		verb_print("\t\tAssoc.: %lld\n", assoc);
+		verb_print("\t\tNum. sets: %lld\n", sets);
+
+		if (type =3D=3D CLIDR_CTYPE_IDSPLIT) {
+			arm_write_sysreg(csselr_el1, (CSSELR_LEVEL(n) | CSSELR_IND));
+			arm_read_sysreg(ccsidr_el1, geom);
+
+			ls =3D 1 << (4 + CCSIDR_LINE_SIZE(geom));
+			assoc =3D CCSIDR_ASSOC(geom) + 1;
+			sets =3D CCSIDR_NUM_SETS(geom) + 1;
+
+			verb_print("\t\tTotal size (I): %lld\n", ls * assoc * sets);
+			verb_print("\t\tLine size (I): %lld\n", ls);
+			verb_print("\t\tAssoc. (I): %lld\n", assoc);
+			verb_print("\t\tNum. sets (I): %lld\n", sets);
+
+		}
+
+		/* Perform coloring at the last unified cache level */
+		if (type =3D=3D CLIDR_CTYPE_UNIFIED) {
+			cache.level =3D n + 1;
+
+			cache.size =3D ls * assoc * sets;
+			cache.line_size =3D ls;
+			cache.way_size =3D ls * sets;
+			cache.assoc =3D assoc;
+			cache.colors =3D sets / (PAGE_SIZE / ls);
+
+			/* Compute the max. number of colors */
+			verb_print("\t\tNum. colors: %lld\n", cache.colors);
+		}
+
+	}
+
+	verb_print("\tNOTE: L%d Cache selected for coloring.\n", cache.level);
+
+	return cache.way_size;
+}
+
diff --git a/hypervisor/arch/arm64/include/asm/cache_layout.h b/hypervisor/=
arch/arm64/include/asm/cache_layout.h
new file mode 100644
index 00000000..959388f5
--- /dev/null
+++ b/hypervisor/arch/arm64/include/asm/cache_layout.h
@@ -0,0 +1,19 @@
+/*
+ * Jailhouse Cache Coloring Support
+ *
+ * Copyright (C) Universit=C3=A0 di Modena e Reggio Emilia, 2018
+ * Copyright (C) Boston University, 2020
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Luca Miccio <lucmiccio@gmail.com>
+ *  Renato Mancuso (BU) <rmancuso@bu.edu>
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See t=
he
+ * COPYING file in the top-level directory.
+ */
+/** Autodetect cache(s) geometry.
+ *  Return the size of a way or 0 if no cache was detected.
+ */
+extern u64 arm_cache_layout_detect(void);
diff --git a/hypervisor/arch/arm64/include/asm/coloring.h b/hypervisor/arch=
/arm64/include/asm/coloring.h
index 44c1ca38..61def877 100644
--- a/hypervisor/arch/arm64/include/asm/coloring.h
+++ b/hypervisor/arch/arm64/include/asm/coloring.h
@@ -17,6 +17,7 @@
 #define _JAILHOUSE_COLORING_H
=20
 #include <jailhouse/cell.h>
+#include <asm/cache_layout.h>
=20
 #define col_print(fmt, ...)			\
 	printk("[COL] " fmt, ##__VA_ARGS__)
@@ -59,7 +60,7 @@ static inline void arm_color_dcache_flush_memory_region(
  */
 static inline void arm_color_init(void)
 {
-	return;
+	coloring_way_size =3D arm_cache_layout_detect();
 }
=20
 /* ------------------------- COLORING API --------------------------------=
-- */
--=20
2.29.2

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20210125120044.56794-5-andrea.bastoni%40tum.de.
