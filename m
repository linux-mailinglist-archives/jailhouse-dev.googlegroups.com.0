Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMHB42KQMGQEW7KDKDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 282EB55B9F0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:21 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id e5-20020adff345000000b0021b9f00e882sf1187472wrp.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336560; cv=pass;
        d=google.com; s=arc-20160816;
        b=t9UrvsCya5e8PbeK122nZYZfu/xPHs5Pw3gbc2V5HPdvDMmX+X8ULIQrda+lp1DiLx
         e3UhwhZqQtTxeCPrcFFPyh4WnotmwJoxFCoQs49V5BnNQNSUspF+59xHuWYYkM77KShO
         8O3lNtqV4tDje9K9D9lRqspbeqXKjAUx3n8CseZ9HvQAPaeXR1wJHl1CBp8PtCp3nmJ2
         IfynheHSHrG0WRomB4hcWiPOXLsSgXcfFa2amwSZI5Q6v/FjCzXeDDsqpHSaBJCUC3vx
         Pa6F8awJdIqzMg5xEojVTBne+qjbZ0ScVtIhBi/PTWeb+I3A0tC3sXr4WXJzK037ss/B
         5HJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=8mDmAFEAb3TTLZmguxb00EZsMmMfLCSfqwUnq7ZlUco=;
        b=Hn4rp2Bxk7/zqYnVW7xIFAqJtlrdyZR3RTZTL9MbGTfMUrWVIFGW0RfT+aOzco/aWR
         wUQGb/gkwBgMx67H3Z+F0j9ldjONpr4C9tIWQNvZQzdLmj0PmGIAdpMeDUyhJ65rYBgZ
         gLEKb9mTWmv59gN18GBEH8KWyMR4yievKFcUgsRsSm45TD6lMczjjQdd00SgZT9jbuoL
         +G3EedR74gNI3gfEOQGd3a/zsoDkHqjoIOgBynu5vF6hY9LrbX6/MKQl61UutIkFdUtd
         Zdk8CjtXvO7JY0BnpOXnYiqN/cofm2qhCYBNYDGPKk6kVOyNueRrFVU0kdv7nAO737jG
         8uyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="H/nUcWxO";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8mDmAFEAb3TTLZmguxb00EZsMmMfLCSfqwUnq7ZlUco=;
        b=rLK7xH3U8liV0DubM2RWprLA0qtFCwJ6SyrPTUrFd8Du1im3HG9Lq6BbIXXkpZpN6b
         ZipAxjgW14GsI+tsF1XFiEdL3KWU2x9DLQilsXG7DGzVdxv7h4KvXjiLD4yJI0vnTN2P
         0pbwE2sLJRH88pwBwwozDaxPR89YcjLPfbuUc94wgWuJnjHh4Eok9zvSkZ+mHP4Jk3DV
         3/MSR30RGLMJxJlJ+Ve0RysGbzMpqcGEaNVHa46QNrWmqHnonH/+hyp3DrZixxDtp0AA
         V420mcEXZDokYNMN+SCBQAEmIj2XNvMQagGTH1ApDryqaUdvjlIT9CLwmhRPDKNcsuEH
         SqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8mDmAFEAb3TTLZmguxb00EZsMmMfLCSfqwUnq7ZlUco=;
        b=OwFn4HjqPqf3j40+cl+Q0Vrwdig7PT2OyryDrKxz6Z3qZeBAMnLJ5Sxbzb3mplULTW
         qSKQtnPEfxuYpeuIpRpdCkCaJhaZfMPeDKjO6mVZl/5lG2DhLfYp/LFJoGGeeP7cIk55
         pGv36WyTwhh6FLpehvw3paJAIDw+ZjrOUhS4asLY3sfVd0Tm9MNE1C0W9mkkPB+Frz7N
         jv2jude0DZ5EHLrmBJNrFUgu4cwPVivHPzNUXxqTGDIKE4/Lou+uZ1kgM0gX/Mmo9E3c
         wrqS9AZL5NSL93xLJ2C8lIY2DG9FxoTfKhKNjkJHE9D7+B1yA507hDlc/lgTHVKq/o5n
         bSlQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+acMWNsyuyX+fVSXOuGhTepxji5tKDeqhI/MQCzz2VzWzmwzX+
	Grgb+uGTGsVJmbUZnIvsUuU=
X-Google-Smtp-Source: AGRyM1tHiV3t+RrMyp8ADf/37615hFDsZfKdAgG4DEbLWC4Fsa4ajfFbaQrDKCdfe/Mo603ZqzFEAA==
X-Received: by 2002:a7b:cb58:0:b0:39e:f121:f7d4 with SMTP id v24-20020a7bcb58000000b0039ef121f7d4mr14935101wmj.174.1656336560865;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb04:0:b0:21b:b3cc:1640 with SMTP id s4-20020adfeb04000000b0021bb3cc1640ls13083335wrn.1.gmail;
 Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
X-Received: by 2002:adf:fd4c:0:b0:21b:8735:d5ad with SMTP id h12-20020adffd4c000000b0021b8735d5admr12843402wrs.538.1656336559421;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336559; cv=none;
        d=google.com; s=arc-20160816;
        b=fVwvfFY57uaIHISpWaYytVZWJv7UEYcqC4gQMSf3FWHgvvkGbjzyGl7mhlN6HMF5MJ
         I+8mZfSXH7kMhOkzFVsG2d82KnD1ZYL/kGZHYXK1C3nh5Yu2QfqalIUzH+gSQpwUTsg1
         wjwhFSDt4GyvVpz8jOT6QjHCJ/x2FgyjKXHp/CE7zfAnJnbqJGJVLi9hgxhQve6SzY3o
         Xvi6/iQAP/aUWl8rpX5FEvteeIC4K6oWYLtR0qvq8pgo3ER2NcdPjVoXI0uBWcJHayww
         8NHu73dastAj2mcDRKCwaMGZfrT5dHBv8RegPOgwAuiAhGJv7dYTsJV7akhOdyfQkLYL
         lbXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GLW86F5YOo6U+6ndvlK8bPG6eJp+dKheAp904IYi+vY=;
        b=EAxibyz/qYr2E0w7FZSVWGj6DkHh+w0h1jAAf6SpgUCVGCZLw0GMnX6Iurltlj7TCR
         IeAzxRMNSaS4kD6wkdULLofOLw6xwNbHrKbIN0Y4XvUEAQ7E4+SCe83Nvyu7RNx5GwtP
         qUL7om//5pGO+cszBoQubzx6MUgmUhoFD52op1o2Oaz/5T1IKgH+t+CeShc1CfiMTKg7
         sYns6YQ2N8vipB4m4jA7JH1l6r7jplGCkX+YCLSJemzQGGPEvZDk3rRivy5TlcLensJy
         f6i0Laa1B5jVqh5E5zbgx5Fhoag+XzukXiz3Cw3QulU3YeK2aDunlGZat9PWsR1Qw3Jl
         yj/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="H/nUcWxO";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id w8-20020a5d5448000000b0021b892cde48si357513wrv.8.2022.06.27.06.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV70y6Zzy6w;
	Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:18 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 14/42] core: riscv: implement library routines
Date: Mon, 27 Jun 2022 15:28:37 +0200
Message-ID: <20220627132905.4338-15-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="H/nUcWxO";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

On RISC-V, the logical CPU ID should be the same as Linux's ID. A
logical CPU ID is mapped to a HART, the physical ID (phys_id).

All communication with the SBI interface require specification of
physical HART IDs.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/control.c |  7 -------
 hypervisor/arch/riscv/lib.c     | 25 +++++++++++++++++++++----
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/hypervisor/arch/riscv/control.c b/hypervisor/arch/riscv/control.c
index ab0bb449..b848994b 100644
--- a/hypervisor/arch/riscv/control.c
+++ b/hypervisor/arch/riscv/control.c
@@ -69,10 +69,3 @@ void arch_park_cpu(unsigned int cpu_id)
 void arch_send_event(struct public_per_cpu *target_data)
 {
 }
-
-// Likely misplaced
-#include <jailhouse/processor.h>
-unsigned int cpu_by_phys_processor_id(u64 phys_id)
-{
-	return -1;
-}
diff --git a/hypervisor/arch/riscv/lib.c b/hypervisor/arch/riscv/lib.c
index 5fe45bc7..2ea1d5b6 100644
--- a/hypervisor/arch/riscv/lib.c
+++ b/hypervisor/arch/riscv/lib.c
@@ -1,19 +1,36 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
 
+#include <jailhouse/control.h>
+#include <jailhouse/printk.h>
 #include <jailhouse/processor.h>
+#include <jailhouse/percpu.h>
 
-// Check if it be moved elsewhere
 unsigned long phys_processor_id(void)
 {
-	return 0;
+	return this_cpu_public()->phys_id;
+}
+
+unsigned int cpu_by_phys_processor_id(u64 phys)
+{
+	const struct jailhouse_cpu *map = jailhouse_cell_cpus(root_cell.config);
+	unsigned int num_cpus = root_cell.config->num_cpus;
+	unsigned int cpu;
+
+	for (cpu = 0; cpu < num_cpus; cpu++, map++)
+		if (map->phys_id == phys)
+			return cpu;
+
+	/* this should never happen */
+	panic_printk("FATAL: unknown HART ID %llu\n", phys);
+	panic_stop();
 }
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-15-ralf.ramsauer%40oth-regensburg.de.
