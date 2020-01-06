Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBN4EZXYAKGQEWM56NHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 17246131376
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:40 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id a19sf8143099ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320439; cv=pass;
        d=google.com; s=arc-20160816;
        b=JY3YL/fijstCLsO//9wwjHf53ixfIQoF+1RfA2tL0GHVI9KxSNTaIZ6sP2zDHqa2gN
         0lV40oqFjwH8ePSZzTnPjCsepZ8BmH5ykkLgCEIf0vZUxhEpSReX466/znUQY3zIsQic
         u31gSA9kRKDSJMMAyY+CTHRLNJXmXPjQJUyzzPJbWv4NV+80ppKEu6YBzJnUzAwtjFnC
         hCTqbAmqDArJZaJJ3Eqz5Yqf48XV6yfbbKYSMlpqA1j44BisH2eToAaPngcignR2SDZ0
         /fCCQpOywNT2e/kNnKTciU68C00QOEL5jOlgQifKrPs3wzTfT8w6zfXuOXS8Fen/TMLM
         lv0Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=WtgfrVnPJOC3DQdv6EgqaR/oOIjyieJyNSNu5tgQ3To=;
        b=HopejqxBtLKRY7KF9x6wq0MB3jewKKrHoRCy3LCiBn4vzAMveC759ZBm6/cOPbZKjv
         YI3Ti16U72U3SdeGOQBwJPXXNuZv35SHjAe2QG259/pFqHZPCHQF86HOy8cmk48FWIvk
         OjWVA7QSHgYZ6yGoX6ec1yijZOrHdW3cr/LAs5lH9AtbYVKNsDsv2TNQgRlTbLpVsRHE
         3U7ux09yJM+C+J9pK3V5U4SEsLvUX9+aomofFLY+JgGwNYCtXOHgfr6sTjQbh1PHSdQs
         4YNvTRtohF3AkIQ0dsaGmvRz+Bq1R+vCTSC5RG9lQik+ARVSrgz6hcSsA1EQj9g1VQ44
         KS4w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WtgfrVnPJOC3DQdv6EgqaR/oOIjyieJyNSNu5tgQ3To=;
        b=A3oAWanvSWgKZ02kixwDApqiaeu7PXtQuo553gMjoyg/oiU9AyzNHiYKGn0bqhCZDz
         xPn/v08OjWfrm2LczNIhTS4sF46xtqKXeephOZLbS5tqItUgHhJNx4w300daotko+uhe
         yAmPF6ujQeaMg7VXqDgZ8t2r/q1RCszG2dMA7ljzvJDEMhTDMebvZE7lEo3O8QASEei4
         cuaPnhuxZ+O9qhQwvmyPPCwZnnDqjNrGk/M+oNNRh2Qb29uE9ATVz+3r0osfNm0zeHY2
         dvGai1/8K7WNBSBSw6W3/OOFPX5+Pw2LuPTtmInJypnJu57scpeCuW9ZhXJcmC/Rh9kC
         I2rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=WtgfrVnPJOC3DQdv6EgqaR/oOIjyieJyNSNu5tgQ3To=;
        b=dZxamug/jEc7sN7okxgVGvZxY7M88mV/ovS+pNJX843EPk7OiCJuaEB0TjmwNu10PC
         6+V/RoTfe1IowOnkgrMn8oOmi1Fc9COQ3PPy1pqc1r7Pjlasu1xNFyCz7yiYIkYApgS7
         IYUeVclL4hBWWDlserPUGgymy4/UmCBEHbVnm1eAqzDlYm1NkhJKf8DG6C3snefOyYlW
         Y2KKDxiQuvJaxg7eV71x1FJMBRQfW3aEmP784y5W80cjw3658QC1FSf94/5E2GHp27dM
         o4itE5MXXPfU/2XxBKAPhXCzu4khEJodIqhzPN8KsBx/hTJcBmXYUu2PnD8CexUzL9/p
         yEaA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUyZhIW/aG+PvnZS+Rrn7Uq/gHBbnFIyjXj9Utf3UyZYOVq5iqb
	av5uBLxbwgCakLyeVT6lwao=
X-Google-Smtp-Source: APXvYqzYoSnxFsnPzEKDVJ764l746aKMOlGDMzgAiH2ZWxVpuETo9j2j0h6FAe6lUzZdcbtKrnCKyQ==
X-Received: by 2002:a2e:b044:: with SMTP id d4mr51910559ljl.158.1578320439702;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c85:: with SMTP id x5ls5244157lji.0.gmail; Mon, 06 Jan
 2020 06:20:39 -0800 (PST)
X-Received: by 2002:a2e:96da:: with SMTP id d26mr59376208ljj.6.1578320439091;
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320439; cv=none;
        d=google.com; s=arc-20160816;
        b=k8sNRi+/tKV61/3AQ38rDcb3eoA27IUvaLDb1qb0Si/nh/0xaP/bAM5HWW5dnsPCIy
         begotGORVJnkIqGw8FloFcJrmNa5zO+s4RcW6LByByHjWlNF/FbkEyBjXcf81fGyOvo6
         A+bUKriy6sBne2wAjI6/oFHebx2KSlvwvfM8X7j3UHlcb6BDezETGzBKy+2YbgIR7BKO
         QJga4XMiXdDp4cJlbLImfw6Tv1JDVaTSKAbq5ziNlsPWOKy5ZTTPnkLMRnczz9YfXRuD
         xhTbbdiEm3XgO++ho1XsnMUCtUGSkdZfRSP5cb42oDBW9XJlrPsgCf7+vU7VKuiCfwdC
         /ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=ynEou8Sfuh1+So4w4MKixrVa79wjiu6UXkb6pdS21Fc=;
        b=GF56DezhBSnjyS4NrUCsKazan0bTnsGQq4Sp2TcE+te/Chxr3mQUyU3cksHm6jI4KX
         42w5q5VeTNmyOJ5U8jo0DClt7p0+kUBVr2WDyQid5UwuX/O3dLy2hfAZPM1smAjDatww
         RD3/NX0wj07ZLws13PB6nNSGO1EAP8q9XLC89rfGNqewoW4Enz01DblokKqG6bzVTzbz
         k2jF4YduRjwxAS8cAdyhR20SwpE9G4anpXnXC2nrbjPNYakNRqOnMMrBxYr55n4zBRkW
         JB8NUfIDJ/8TQfotAKRVC9lrOGBpMGMz8Lm5S1VZvvVwpirvCDv5LEQivG1uYq1UtX35
         AbSA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u5si2919359lfm.0.2020.01.06.06.20.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:39 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006EKcbo025687
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjF008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:38 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 07/19] core: Provide pci_mmconfig_base via Comm Region on all archs
Date: Mon,  6 Jan 2020 15:20:23 +0100
Message-Id: <856047f215d285e6a02ce2e13bb3e237a513cc67.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

This will simplify PCI support in bare-metal ARM inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/control.c              | 2 --
 hypervisor/control.c                       | 2 ++
 include/arch/x86/asm/jailhouse_hypercall.h | 2 --
 include/jailhouse/hypercall.h              | 6 ++++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index 11e5aabd..4f667d43 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -96,8 +96,6 @@ void arch_cell_reset(struct cell *cell)
 
 	comm_region->pm_timer_address =
 		system_config->platform_info.x86.pm_timer_address;
-	comm_region->pci_mmconfig_base =
-		system_config->platform_info.pci_mmconfig_base;
 	/* comm_region, and hence num_cpus, is zero-initialised */
 	for_each_cpu(cpu, cell->cpu_set)
 		comm_region->num_cpus++;
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 16f2cc13..a0a7532c 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -655,6 +655,8 @@ static int cell_start(struct per_cpu *cpu_data, unsigned long id)
 	if (CELL_FLAGS_VIRTUAL_CONSOLE_ACTIVE(cell->config->flags))
 		comm_region->flags |= JAILHOUSE_COMM_FLAG_DBG_PUTC_ACTIVE;
 	comm_region->console = cell->config->console;
+	comm_region->pci_mmconfig_base =
+		system_config->platform_info.pci_mmconfig_base;
 
 	pci_cell_reset(cell);
 	arch_cell_reset(cell);
diff --git a/include/arch/x86/asm/jailhouse_hypercall.h b/include/arch/x86/asm/jailhouse_hypercall.h
index 9e72b277..4872fc32 100644
--- a/include/arch/x86/asm/jailhouse_hypercall.h
+++ b/include/arch/x86/asm/jailhouse_hypercall.h
@@ -99,8 +99,6 @@ extern bool jailhouse_use_vmcall;
 struct jailhouse_comm_region {
 	COMM_REGION_GENERIC_HEADER;
 
-	/** Base address of PCI memory mapped config (x86-specific). */
-	__u64 pci_mmconfig_base;
 	/** I/O port address of the PM timer (x86-specific). */
 	__u16 pm_timer_address;
 	/** Number of CPUs available to the cell (x86-specific). */
diff --git a/include/jailhouse/hypercall.h b/include/jailhouse/hypercall.h
index 329f6e2e..4fae9481 100644
--- a/include/jailhouse/hypercall.h
+++ b/include/jailhouse/hypercall.h
@@ -118,8 +118,10 @@
 	volatile __u32 reply_from_cell;					\
 	/** Holds information special flags */				\
 	volatile __u32 flags;						\
-	/** Debug console that may be accessed by the inmate */		\
-	struct jailhouse_console console;
+	/** Debug console that may be accessed by the inmate. */	\
+	struct jailhouse_console console;				\
+	/** Base address of PCI memory mapped config. */		\
+	__u64 pci_mmconfig_base;
 
 #include <asm/jailhouse_hypercall.h>
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/856047f215d285e6a02ce2e13bb3e237a513cc67.1578320435.git.jan.kiszka%40siemens.com.
