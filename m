Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGUXYH6AKGQENUAHRCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5337B294F27
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:20 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 76sf1769482ljf.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292060; cv=pass;
        d=google.com; s=arc-20160816;
        b=pFsVksh5bSI58uCuLRwvudfpGB956Ld5qyX3OT45Pnd5AO1O3uckfM6NzOfluCS3sD
         tNH3ABQE/WkLeons8/6DG4ydEt9nNnsywC6SnxyypEqK+xs2Tp1QetxCvYqNkKGLgdhy
         FOIQkkY2sgHbz9jPK1Pz30bDq7jibI6bEwOLyIzBpjSTQuDRvnfzx6j/WCxiW1/OXiI3
         uCxQ4Du+FWf9+qhkUXehzhmMV05f1Lg7UX58suR4RKoCwAFBdyAsu/yv+UckLUQvFpV7
         nTzEr4Uz7IQLWiAj+2Y2TtF4Jfh9YpE5GUh1pNHl8XfB+XEMSE5Nw4LnK1C5P4+O6oj9
         mCoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=/y6uwnY969cNyx8pd4pXhBlRnMaO09dt664+fq4Rmm0=;
        b=qCb58zb0eIjttAO0ZMcGQk1shd9ODg8iQzYysWEJKJo4cy6eiLtnCo2g2YCIBh6h7M
         IiuCXYOJEiTIKWZw6H1XI1LoVKK9I5rYCIs5hADX7eGp9qW34nrqmu7VrDl3SxPWQrL+
         Zp2HNKFq04LWMmhN9KCbuS/HOI0FWTrCfLtxu76JcmcCvZbkaSVmjORSVrK8R3XC2Q0K
         pdt572oqAi54Wwk66FuZ7RMAp5y5umSekhGB4MkvSHzW7lK0a1tyyN8+t+1oSEcTuHIH
         i1y6O89zoqLUb+GQ3OTN27Ghe/Kr1XXn2SA5wCrolIzusrxxDcLghG2ILZUdW5SlvGam
         vHag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=prakNoq7;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/y6uwnY969cNyx8pd4pXhBlRnMaO09dt664+fq4Rmm0=;
        b=Kj2fn0Oa/+nfrB9jPdf6qTgLXy4uVPjzdMW+axnuWiYAZdpxvYB6vgJTvcJmxSQAdk
         jkFWbAbPKlrVZoZFVdtx7wEK73Z8pzJqmpGrKAxuJzSoXYidkNTaHWdND6y57YmHAkbx
         hvWSzzwEG47cu4tuPXLbbvCHzSut1CIXfTuN3sAtafn9EFj8KTtFdNujgz44BRJMjRXb
         wZ51bppOxq7+q+mYI/+infP8obRPnJOhUjTd7rvzDQBtUTkj0smZwQ/FKX/Y3BotI1Nq
         PnsNCXYqyd6Nd5ehsFi+7cwN6bZLcAx9KdYSdRq931JtW7jT/O5VmXYOPi0olylgd+Dm
         YMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/y6uwnY969cNyx8pd4pXhBlRnMaO09dt664+fq4Rmm0=;
        b=oKwlEj5mti3AF7gb4tBvGI1iO0ybbDiYj0b6vw2Q8pbTUut2MyxCsAVyctVbLwbMMG
         KudHKCSGeyxg2dWzszDhoG19CH2FVBJY9G4v7Pg6PvMpmcy8HGmXXDd6I8+IPC2EmQpu
         hTQRKVNBsecX/1Y3hYB6g5SUpK8fpl1eTaYIMcd1XGZH0oOS6oPi/FPHCB3aFM52ZjkW
         VVztVVIHAK6qOPa8Utht+4ee0ijj4ZSnGPYCYAgl0txfzry3BNC9klUmfsJEgn4/IK4Y
         SRTQnXjtGNNSxsjfInfrXiyxomnfp42NYtoXO74DzdPwQHYleKWvOKagKM3ja5vT8Jlc
         56wg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532tjNFUgHCeouZMYglH5aYWZfy2Rvu8kcLcBpuqBrg0QYv7ucXl
	he2YGffR9C1qYwILLtom6lU=
X-Google-Smtp-Source: ABdhPJwLCpMXLP+zwj4b0fBD13yV/uP/M3ORP7dO9BCXMIZsmQedV8UKHpabKfYIGQQjn+7Q5GAvmw==
X-Received: by 2002:a05:651c:553:: with SMTP id q19mr1694079ljp.453.1603292058415;
        Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a86:: with SMTP id p6ls1081610lji.0.gmail; Wed, 21 Oct
 2020 07:54:15 -0700 (PDT)
X-Received: by 2002:a05:651c:1af:: with SMTP id c15mr1733448ljn.446.1603292055725;
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292055; cv=none;
        d=google.com; s=arc-20160816;
        b=h7+WAeqhfwglo1V/qTlAb1k5ERJTl42qD/mxdUTlQJksubar9xfcNv01FCvdEuG++E
         pFOxYp6DEuobfZR7f1tH1aOboN5NyXrmp4A2jXqRkDMqRGjlIMzuW0V6J2KO2XGeRoEa
         cVXKiUEfkWLhgum4h+DszQQbXCiKSn72EutldAJo0P2VCsB2eLMxNd7lRyRjBbkzIS8V
         JmYXjsqjDuMlwqi/rSE8wvb3OU9/NlDMeRkGJbfY0+OYxNAkAgjLu/9yTjBYg5ojEHiJ
         ffPk/q7Jw5Uil9LEEX1q1biU3SM3+WfxUabpyh5XCTu4GURilsOcwP+q+NoAsNNitN1B
         QUsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=LeNHD1p5TF+EpMcRxGcex6wOyHh+R9r9fRijRbJU2WI=;
        b=DXNkE7x71moTGb6aG9y6wVGCa1Sh+1Iu+1InSIgg5+RdbJ0zP/UwrlQ/qgSkDGrNkO
         Jp/C/bXwi0OMFBZ0CrfdDS5kQ3yd1YWfyaDLIlJkNwiBA3G+uGpAe0LerdzE2wqW8aFq
         34aPGAOLeeGcLG+u+fzFLE2p+pJu7yBUb3rsIDoHxDlNzyhXqsqNT2J71gYNJPl8cRw0
         z68wyT3PprpK6jHfhEsUsBFiNQUyyh5nNSeZXaZLGWxDSkwLKhDJnZYF+t1+q+kcrl1O
         J6YWSCywJeCw2mpRfjJFKxSsw6hdgf1ZWCVFNzhGse3Sp80TaJ15YyF4EIh+Hr3LVF1O
         +fZA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=prakNoq7;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id a16si76888lfr.5.2020.10.21.07.54.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRW1RdHzyWs
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
	with LMTP id pvQZNo23hStG for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRV4s44zySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:14 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 05/26] arm-common: fix old-style defs, sign-comparison warnings
Date: Wed, 21 Oct 2020 16:53:43 +0200
Message-Id: <20201021145404.100463-6-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=prakNoq7;       spf=pass
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

And keep compiler happy about unused parameters.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/gic-v2.c  | 12 +++++++-----
 hypervisor/arch/arm-common/gic-v3.c  |  9 +++++----
 hypervisor/arch/arm-common/irqchip.c |  4 ++--
 hypervisor/arch/arm-common/paging.c  |  6 +++---
 hypervisor/arch/arm-common/pci.c     | 13 +++++++++++++
 5 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index c5ad0607..77e23860 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -77,7 +77,8 @@ static void gicv2_clear_pending_irqs(void)
 	mmio_write32(gich_base + GICH_APR, 0);
 }
 
-static void gicv2_cpu_reset(struct per_cpu *cpu_data)
+static void gicv2_cpu_reset(
+	struct per_cpu *cpu_data __attribute__((unused)))
 {
 	unsigned int mnt_irq = system_config->platform_info.arm.maintenance_irq;
 
@@ -277,7 +278,7 @@ static void gicv2_send_sgi(struct sgi *sgi)
 
 static int gicv2_inject_irq(u16 irq_id, u16 sender)
 {
-	int i;
+	unsigned int i;
 	int first_free = -1;
 	u32 lr;
 	unsigned long elsr[2];
@@ -377,8 +378,9 @@ static void gicv2_inject_phys_irq(u16 irq_id)
 	}
 }
 
-static enum mmio_result gicv2_handle_irq_route(struct mmio_access *mmio,
-					       unsigned int irq)
+static enum mmio_result gicv2_handle_irq_route(
+	struct mmio_access *mmio __attribute__((unused)),
+	unsigned int irq __attribute__((unused)))
 {
 	/* doesn't exist in v2 - ignore access */
 	return MMIO_HANDLED;
@@ -495,7 +497,7 @@ static int gicv2_get_cpu_target(unsigned int cpu_id)
 	return gicv2_target_cpu_map[cpu_id];
 }
 
-static u64 gicv2_get_cluster_target(unsigned int cpu_id)
+static u64 gicv2_get_cluster_target(unsigned int cpu_id __attribute__((unused)))
 {
 	return 0;
 }
diff --git a/hypervisor/arch/arm-common/gic-v3.c b/hypervisor/arch/arm-common/gic-v3.c
index 949c4598..40baaf6b 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -527,9 +527,9 @@ static void gicv3_eoi_irq(u32 irq_id, bool deactivate)
 		arm_write_sysreg(ICC_DIR_EL1, irq_id);
 }
 
-static int gicv3_inject_irq(u16 irq_id, u16 sender)
+static int gicv3_inject_irq(u16 irq_id, u16 sender __attribute__((unused)))
 {
-	int i;
+	unsigned int i;
 	int free_lr = -1;
 	u32 elsr;
 	u64 lr;
@@ -642,8 +642,9 @@ static void gicv3_inject_phys_irq(u16 irq_id)
 	}
 }
 
-static enum mmio_result gicv3_handle_irq_target(struct mmio_access *mmio,
-						unsigned int irq)
+static enum mmio_result gicv3_handle_irq_target(
+	struct mmio_access *mmio __attribute__((unused)),
+	unsigned int irq __attribute__((unused)))
 {
 	/* ignore writes, we are in affinity routing mode */
 	return MMIO_HANDLED;
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index eb9ac40f..91b12b8f 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -131,7 +131,7 @@ void gic_handle_sgir_write(struct sgi *sgi)
 		}
 }
 
-static enum mmio_result gic_handle_dist_access(void *arg,
+static enum mmio_result gic_handle_dist_access(void *arg __attribute__((unused)),
 					       struct mmio_access *mmio)
 {
 	unsigned long reg = mmio->address;
@@ -516,7 +516,7 @@ void irqchip_config_commit(struct cell *cell_added_removed)
 	}
 }
 
-static unsigned int irqchip_mmio_count_regions(struct cell *cell)
+static unsigned int irqchip_mmio_count_regions(struct cell *cell __attribute__((unused)))
 {
 	unsigned int regions = 1; /* GICD */
 
diff --git a/hypervisor/arch/arm-common/paging.c b/hypervisor/arch/arm-common/paging.c
index be1f7da8..54b86e7d 100644
--- a/hypervisor/arch/arm-common/paging.c
+++ b/hypervisor/arch/arm-common/paging.c
@@ -14,7 +14,7 @@
 
 unsigned int cpu_parange = 0;
 
-static bool arm_entry_valid(pt_entry_t entry, unsigned long flags)
+static bool arm_entry_valid( pt_entry_t entry, unsigned long flags)
 {
 	// FIXME: validate flags!
 	return *entry & 1;
@@ -137,7 +137,7 @@ static unsigned long arm_get_l3_phys(pt_entry_t pte, unsigned long virt)
 		.clear_entry = arm_clear_entry,		\
 		.page_table_empty = arm_page_table_empty,
 
-const static struct paging arm_paging[] = {
+static const struct paging arm_paging[] = {
 #if MAX_PAGE_TABLE_LEVELS > 3
 	{
 		ARM_PAGING_COMMON
@@ -183,7 +183,7 @@ const static struct paging arm_paging[] = {
 	}
 };
 
-const static struct paging arm_s2_paging_alt[] = {
+static const struct paging arm_s2_paging_alt[] = {
 	{
 		ARM_PAGING_COMMON
 		.get_entry = arm_get_l1_alt_entry,
diff --git a/hypervisor/arch/arm-common/pci.c b/hypervisor/arch/arm-common/pci.c
index 8daccee5..8bec1275 100644
--- a/hypervisor/arch/arm-common/pci.c
+++ b/hypervisor/arch/arm-common/pci.c
@@ -15,26 +15,39 @@
 
 u32 arch_pci_read_config(u16 bdf, u16 address, unsigned int size)
 {
+	(void)bdf;
+	(void)address;
+	(void)size;
 	return -1;
 }
 
 void arch_pci_write_config(u16 bdf, u16 address, u32 value, unsigned int size)
 {
+	(void)bdf;
+	(void)address;
+	(void)value;
+	(void)size;
 }
 
 int arch_pci_add_physical_device(struct cell *cell, struct pci_device *device)
 {
+	(void)cell;
+	(void)device;
 	return 0;
 }
 
 void arch_pci_remove_physical_device(struct pci_device *device)
 {
+	(void)device;
 }
 
 void arch_pci_set_suppress_msi(struct pci_device *device,
 			       const struct jailhouse_pci_capability *cap,
 			       bool suppress)
 {
+	(void)device;
+	(void)cap;
+	(void)suppress;
 }
 
 int arch_pci_update_msi(struct pci_device *device,
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-6-andrea.bastoni%40tum.de.
