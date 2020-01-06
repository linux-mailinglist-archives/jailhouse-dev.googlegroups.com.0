Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN4EZXYAKGQEWM56NHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2F131374
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:39 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id k18sf3790240wrw.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320439; cv=pass;
        d=google.com; s=arc-20160816;
        b=rMAQiADqX1pNYkQP1VKuT2YPe5xLPgULzM0V0FR8IeoVJMD71LEUS8IROS0U5K6VZK
         WPNI99ZT0aQg6bG8dazt9vfxgS7016y8NFJlpriBvV9yB/UKfmivQWC+U+fmmHZBhg3m
         i78jkJqd66xDarrSlWMLRCzXbdJ8knfLg/cRVchzKzu5Yw25XMNP0/Eu7RQrAn5FOY0Y
         qe8q4aEfq6LCRV1yI39TBzTpBJSW8Ca0m493tiRijrDhqyIIJHgecsY32wf2mffL2h5R
         ub6J3iKZJRHM57SSVTRVPOoLhFHxiA8obNYGCLpdh7wsrTA4B0RrYdvJRJMM0vQefqpK
         CI1A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=vx27X4rTuYLSA9hm8mSytEuEAXspDAcG85NX3SC3tP0=;
        b=rUAWo8tnQykprQcBKP38716GUyLbu+kf/zNoFln2M1UPrDIJJMOrYcjUP7529RC0Hq
         y72R543xxe826rGDL794zXPuod1zQQMqjk/VUQLE2AvKukWzULsy75iXJ9LxEua+u4/E
         R7wyPFk8C/SybyJW9kHkhIbeAU6J7rh02Z+DWuLXy/1z9c64eGPkahkm9HhwJpy0FKJ7
         RE1f5DfkbiqAlL/XDe9ishPB8XET3GKu5zju9+or3GJ6kk1YE97pQm19EBT/qRUBxxW8
         KRZzyhYogX4D7fF8hINYX+N/i9jqG459icZoP0af2LyShJy8cbkfLl1mcP/sblfuvqfM
         Am7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vx27X4rTuYLSA9hm8mSytEuEAXspDAcG85NX3SC3tP0=;
        b=XQoNv3sUFjIQsURA9WmECS+Dkg3DiKAxYwMTbEScRounqWjxMhRPIKFjUNWOMSnZVO
         j1/zReMKvkswN3Wn2grfElXwlNbu97ce98sKb1yg7kwfwdjJ9tAcJQeoXd7itfoMBv+/
         2jXTD2gEXm+UZ1DGBSPniVFfGFNPE4fb9NNnQUoRBfs+vldbQBASt+lGG6afkp+g2Yv7
         zUULFxyheQnu8lRuuMO+ed3f+rOblnt6ZqIWwqcAuaDE1x21+vDmNCsliyd1TGk2OKQf
         tot2K6APP6wjJrsQ00AMnyk8CZH0QyFVIBoOmytNfFFT83CjOVbkXkaQc8dr0DjyGfY8
         ++wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=vx27X4rTuYLSA9hm8mSytEuEAXspDAcG85NX3SC3tP0=;
        b=irvFhcprL793ajEXJskYgoocmg4+9615tKX5c32ZbmBJVCQtER9Mc2JgqnXF7UjpAg
         /HD3fN88aU2oj+4yGzjI3hxHy7FW1QoWuxzAvlRIGnL7+aHkNWSubqKAA6Wee/QV2cmw
         jtaPggbUms13Y0sos+/ERew3ScCDbp0YJuPDIzf6nvmNtsCjhOsiosHrlliIDoK8FNh7
         BMVOPMijVFaGLwKUcVKCZFC9iYvUe46HYlUvyYErm30LMvCkFBRAXYwPwdLUxknUB3Fm
         ot9XTx/8Qfe2RB0pWEtCqvSHYJyzVNotBEvO7jzRSRSkrfqnBKY+jIykm5FrXO1gkCYh
         aAqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVjatqI8PviWOjmi0vDL7CJGppIav39FJ7BPNV5WdkItKtaeqKw
	F3NxcKqWO/dOj0vvbjIFy1E=
X-Google-Smtp-Source: APXvYqy2jR/dFxk4bj89IRPNRQjnkdl3SuaAbNXW8KlSR5NN0ngTUYnCs3QfNBgKtrgDFmevMLR/DQ==
X-Received: by 2002:a5d:528e:: with SMTP id c14mr22908762wrv.308.1578320439475;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c76b:: with SMTP id x11ls5375150wmk.3.gmail; Mon, 06 Jan
 2020 06:20:38 -0800 (PST)
X-Received: by 2002:a1c:dc08:: with SMTP id t8mr36117083wmg.139.1578320438829;
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320438; cv=none;
        d=google.com; s=arc-20160816;
        b=VCjI5/4vVzRy6XPhUfMldX89lMnE1/EKYwbRMHbXXpzd9AQRewTKGJRXj1uFmCq0YX
         RISnuafZ4nx2ss6h2q9r1Hx68ORLZOriDPb/tdxM8Runulju5NMt08/P0T3utpjk3qmL
         XLNtew/qj+7B4VFqBqo/uB0twt2hK0OdOY+OLHG+DJU3sUdqhopaA1F+aTw+xQmBC/K+
         AwwgsyN7Lx9mr4KR9iyU7wZilnwSLCU7Fk/k46d+OzOT4/GxxdzqpZ5y6PZx490knTtR
         MHSiLRzKYVuQnaNd2XYr8k+xZrwcQL5Shaf6qyUNHY81S246CFnuBzUSTUfqUPjWVcIP
         R0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=swlFz2Xam6WM6PY83B7idXzZleRdbxqR3+hioUyQVwI=;
        b=Xl5sh6+iTwauEck9P91Oq8ttdu5BnGtsYaJJgdoR4jrOIyl5t1/FxcSuRs96k/6EpK
         Y+0rm5ZIRnRsWpnrDvbYNiBjzALNp8+8rQZFg49CjvwAtXtix+VafYTGFvILYvHlfYf6
         S6jZyx2FEue6/KsblE+yigCHpI7riCuujEN9G6jtiJMobNu1MyuQE4tccO4/7BAV+QDM
         kEQbT9O6fPb6OAzlwcaXAT1jrFFem4zk/PQgPuXIB5oeNVKbOx6OLozrLkKiqVAyHSix
         KN6hk0p8FFbhfTTcBYVVEJu48rw4jnpPvTnSfWwzn45mLD8erIEcuspoeS92nT0mJNCf
         z0aw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s139si717346wme.2.2020.01.06.06.20.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKcw1016633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjG008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 08/19] arm-common: Provide vpci_irq_base via Comm Region
Date: Mon,  6 Jan 2020 15:20:24 +0100
Message-Id: <8607243c30ace3c194d56ae9b3f0273cced0bf1b.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Allows bare-metal inmates to find the base SPI number of its virtual PCI
host controller.

Increment the ABI revision to conclude this change as well as the
previously generalized vpci_irq_base field.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c              | 1 +
 include/arch/arm-common/asm/jailhouse_hypercall.h | 3 ++-
 include/jailhouse/hypercall.h                     | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 106ffad4..10885f9d 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -168,6 +168,7 @@ void arch_cell_reset(struct cell *cell)
 	comm_region->gicd_base = system_config->platform_info.arm.gicd_base;
 	comm_region->gicc_base = system_config->platform_info.arm.gicc_base;
 	comm_region->gicr_base = system_config->platform_info.arm.gicr_base;
+	comm_region->vpci_irq_base = cell->config->vpci_irq_base;
 
 	/*
 	 * All CPUs but the first are initially suspended.  The first CPU
diff --git a/include/arch/arm-common/asm/jailhouse_hypercall.h b/include/arch/arm-common/asm/jailhouse_hypercall.h
index a4fb1360..83cec97b 100644
--- a/include/arch/arm-common/asm/jailhouse_hypercall.h
+++ b/include/arch/arm-common/asm/jailhouse_hypercall.h
@@ -40,4 +40,5 @@
 	__u8 gic_version;			\
 	__u64 gicd_base;			\
 	__u64 gicc_base;			\
-	__u64 gicr_base;
+	__u64 gicr_base;			\
+	__u32 vpci_irq_base;
diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
index 4fae9481..20eea801 100644
--- a/include/jailhouse/hypercall.h
+++ b/include/jailhouse/hypercall.h
@@ -102,7 +102,7 @@
 #define JAILHOUSE_COMM_HAS_DBG_PUTC_ACTIVE(flags) \
 	!!((flags) & JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE)
 
-#define COMM_REGION_ABI_REVISION		1
+#define COMM_REGION_ABI_REVISION		2
 #define COMM_REGION_MAGIC			"JHCOMM"
 
 #define COMM_REGION_GENERIC_HEADER					\
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8607243c30ace3c194d56ae9b3f0273cced0bf1b.1578320435.git.jan.kiszka%40siemens.com.
