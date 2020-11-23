Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUV76D6QKGQEG4GLMXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CD32C16B4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:15 +0100 (CET)
Received: by mail-lf1-x13a.google.com with SMTP id k29sf5069416lfj.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164435; cv=pass;
        d=google.com; s=arc-20160816;
        b=rf9PFNh9kIvQJEUcUE4I+o40HmIbAySP50Nu+JxyG+D36KprQ04Eet9L6YabML3Q3F
         RsVXdIbUxFfPhAvFjOMImTMcGpFNSQk6U+DOANAxFszkaGNL98tcV4aWRal8Jhuw5K6w
         EMzBtCP+S+itITmJ3VgZxfjyZJezjf09sFizPxFHr3LWzV4rVXklfPnMWGv+5vc3De4z
         N+giIJryKL+zeqA5vroyGXtjKSikiSfMBmqhmQ2GxZ+bvIfB2e111WIqgegynAbQsMOp
         TfXbMff/qYhfy0LZ/zRT5I36W8zZcNaHBrtxRFRjIEpGTsjA8AW3I9BsGcnocqeFePRb
         KiXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:sender:dkim-signature;
        bh=48VKGQSgpl76EilVSpLz9KY18xpEBE4qf2l2s3oYc8w=;
        b=PJVclR2usoU9e+hDKJ1coW2YWHA+GftDW21aXpN+cqgF/hLSRd9Gt8/0EJeSN0alXd
         uWra0YxJ1zEL6lObCSjxlDl9ESPTn+1ovEOVilDP0+fbZoZqrg0yEvbCgtilfPaXEiyI
         lYH0LunSRWZ2f/UYw2OheqBtAe903oZxQz+oF/6ghAdzLi7v7Lo2GJYuY9k2zqAZEv3F
         LALHZ+ZOjT7AUTmIFG0bz2DjOWapJ6XWmF47hgH3EaIZDy/5UpJURp5umnl8e1L9Uz/j
         GBc2lA1hg5O55yu6lhtzfsr15CTxS/sTvU2IUthJIHM+B7Ms2v8eWw00GJUOchu4Fv39
         AoPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=S8QHtBpe;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=48VKGQSgpl76EilVSpLz9KY18xpEBE4qf2l2s3oYc8w=;
        b=D2EJQGUbc80nqMWsX9AIAxPODmMUY3FUl7xfVXA53q+bdT1M3CGD9+zgUbhDv9N31J
         zdZBjT/y16k8+J31P317E9iotngfpCK12+X/sHCV5oliZsf3JxyiI3LfMtJc4hIar7g+
         MAi+ljlRXdY4bwz7eXcCwbhuTe6lhYeKEmEqiJzVMWdDzhvPJh0uWKcXD3BHfozry7Es
         HMIe43WpP1J1T3a9VcF8TZ3M6M9BHiZxEeCVfcalJkXd4TgSwVw4k/PvSVC4TNM0yq0o
         9OeT+PzweyT3sm00vOXfi9kMcIU2bI6fEq7NBHb1pxYwVMNJu81bC+iKMGjzJvFWAFpS
         GK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=48VKGQSgpl76EilVSpLz9KY18xpEBE4qf2l2s3oYc8w=;
        b=GjF56pPfMNB8Uu3kRKYtgWRHDWaqo1SD2h4nRtAW2Q6bxCYd6dxtPGR8kRymcqmKPz
         6UN4yR+wydSC1lKUQ2Rh6r0fDSvmqlrqNMiPX1jwtWK8rALqYPmXYfwIA13rzVccw6yd
         Lgf3ine0OLNSm7N3RQazj9ObS/F9WsDjSplJot+gEjYxJdWfbCTqiYbi3P2eqG16AgVO
         bxGp1M8zintWU11Ep3c5ECOWVGitgN4f8UKzsCaCMBNN86RP/OqSZeJZpS87+rBJq60f
         e0IEkZqewE65pA6a5YrCLyY+eRPF6bi2Vlb7JNnSO/v6VNZZZdgX0SQrF1PiBcRLysVC
         c77w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530x7CAUxq9mGw9HFR/KQbwYbWJEoS/HvVWr+L6L58+pAgj6P0Hs
	juEh7X9ki1Mda6tzFKH6JII=
X-Google-Smtp-Source: ABdhPJzhbbaSo/pMw0WB/u8yGz1y72ndHb2JpKIs+QlydzcjznqLpOndUbJRzzpPHv7Sk9ZGeUwcBg==
X-Received: by 2002:a2e:6a0f:: with SMTP id f15mr499430ljc.375.1606164435314;
        Mon, 23 Nov 2020 12:47:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9895:: with SMTP id b21ls616213ljj.6.gmail; Mon, 23 Nov
 2020 12:47:14 -0800 (PST)
X-Received: by 2002:a2e:8811:: with SMTP id x17mr513142ljh.37.1606164434000;
        Mon, 23 Nov 2020 12:47:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164433; cv=none;
        d=google.com; s=arc-20160816;
        b=FSk7KjG1OL1uTGTpNJf2GSZuAvFWBjg/oW6RVkIY+9EbOYxP/RzgUkYc+aPN6Zb+pV
         tyO1Xcduec43qbqO9azs8tfKxpmsp/dPzAKl+6JzTZ5b7UrDBgYfXhhG/1m5UNooSUmb
         oPreuMX0+LoqeZQDxI7QzAkHto+tXypFdljTBrvECap51aCDe6G81iY3ERG5PymeWWjj
         TmpxoHj/W+AJ8oXHDkZZ341prwaoL7iwHcaMYyrtqi8mHEB8GGkwCMRwxSsR9/2wzKjF
         qcYH9Qt/enO1I1ksAu+AWb6CSpg1J+34PguX3lG4HUaM2btNKdkolPW2OqJb49Z4A/su
         JopA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=URPIelbH8EWDbrPfFhJZ9I5vHWDttHBBrz5FxEymmPQ=;
        b=F6hpdHlm/nBIdQXjuTqN1v8g80FCQSfOZHVZDUykbiMWaa/CEjkvnMU4D+4/GkDT5b
         63esdR3YasSPLEczH/MlrHANfJqxNO19iropuVsPcTlDR5TjRIqomh6cDxMT075wTJWI
         DSBniut9RMx74Bzn6zfgwfzHFoCo58ZtTtARQpdMgj1oyI+ULNv8lF48CahR/mtCn2gu
         4xbXJtKuY8zqqsAWaK2k/9MQmduICPdL+69DaeHBweYJxPH6OlXoJNmULaEGpQ/+LzZ4
         KGUBWdMA+HsawKyZc73ij3EQoNDjnECF1vFX24rsT+3kZnUNlzuot9t/IrXDcHczVgAz
         Gb8Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=S8QHtBpe;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id t18si592312lfr.1.2020.11.23.12.47.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:13 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CfzjY3TQWzyTl;
	Mon, 23 Nov 2020 21:47:13 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
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
	LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id U4Z4Y-GVODGL; Mon, 23 Nov 2020 21:47:13 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CfzjX5MbRzyTj;
	Mon, 23 Nov 2020 21:47:12 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 04/14] hypervisor configuration: hook autodetection for coloring_way_size
Date: Mon, 23 Nov 2020 21:46:03 +0100
Message-Id: <20201123204613.252563-5-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=S8QHtBpe;       spf=pass
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
jailhouse-dev/20201123204613.252563-5-andrea.bastoni%40tum.de.
