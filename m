Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWMQY76AKGQEL7PCMDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DE829644A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:50 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id r8sf1011863ljp.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389530; cv=pass;
        d=google.com; s=arc-20160816;
        b=RVkMZBZxQ4VUQJRASgLnsgsz5VXyybS2kXfyNa7JzlGINS3RUQbV9R9aQpZ+FwnziJ
         mnw35uNaKYf0IFdqhN65WQj6vCs/b0jZ+biFcpb2vyEYiYi49UHrqNRdOR/U64Yjs4y1
         jZ1QIrQftBpt/LCfKLcDhsaJD3DOZuGq+OYdb33cimosE80nr9tsKMdnSUrP25eyF8ZF
         X2de3LudgBdbgzn8J8eR5lh0J2vXL4JoA1ev0hPkWJAdv2AHoxo5KScBkKuEA4wgy3Ct
         z+5xM2yw3up4CJgGoZWyyC9jcAGm4E89UunUgRcCygklFRmQA1lMj7XI2E3JLiYnzSnf
         9EWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=rCBebrfdYENlNL9ncLRNykHRZp29XqABJJC6syTwjU4=;
        b=dYKcD5Jx39Z886dEimU+sgywA0/su3FiXBt4tvjTxP6EmZ/1QdrQ59SuhrdwgCov/Y
         f5QcCsY5tmprzpw7uWlNUY9C7F2q54VtK0k+GSLryXE5JR1Ay016JENR/aIIyU8UoMgz
         sQXt3el8gqLmjBdn/isApADpiZaxuGww+8Qyn9oPRNclSgAq5f84eufQbKd6+Op6h0mo
         lzCifuxGgnQiGAa4cVcv+jIqozwcMaJMIhlKCXo5IUzzhoHCoMlYS1ZHhOGKr8cOgmP8
         P6aeuZfoTRbOaBCgbv8Ce69wq82h8MgdD2YNYijo0J81BLyAUw1kzAh6jvHp6FXTim7J
         trZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="F/HL+sbW";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rCBebrfdYENlNL9ncLRNykHRZp29XqABJJC6syTwjU4=;
        b=I8jXfyH7fytWCol5JmaoQfWACZzyWpZ+z4PGYcsiR5mBpX5883k10l6HiavzMqDmJA
         VTAKP3AiFHFQvK0ClF/+zF1tOm4duN4yOFjzkzbqCnZoIrUsul2LiHMrRQJfJu28MgRW
         XjUmdVS1gDJqeYSBEt7s6nojDzkg6rWxcKSLIASyIEQwh/o2gq2KfkjRCxSNNfbJ1mqY
         nIfW1fH/nmfDHDeNadY196iJSl28tiRgEmPQUZrz5YIAmIa3h9gWj78eWnivpb2DLNYW
         Ya19kaCah3lKzgv/dA4Zaw9meXn91y7ZQlFrkpP3PNBXMa2RR9EuLar3IzhRHumpQIwX
         jDCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rCBebrfdYENlNL9ncLRNykHRZp29XqABJJC6syTwjU4=;
        b=TYuIlROjzzO7Y4a30vw2AkMx8dkqPdopJRESl8jpp5YDUizw00KY/3VJytCD6HAPSN
         pYRcBiXcoG7O5ISvAtY2blbil2sGxEW5ombVbOI55hySgShroXYb4OJTUcfjMOE7Ra4t
         xEq0d16ZuUK2AZKgX77V10Vh1BtNTOOfZaZn5gDbwPuDeZJPo+6tZRo3jjRbFMzBAgIC
         FD0FPNZC9nivokUk9c1agfCTO0z6vLQPJPovz6KOz0k8votlGYv3T/2tsNNXwBD/HcJa
         JOx2p6l9vNGnDXhrDkEd2TMAKjby+3JMen0NOS1Shy0Ei1EVEaQbaIieZCg9hDS4XoeF
         zTfQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532+mLfRo7V7ON8OtRkBv4isatYXDsmtrDRZqKW/eP6rMcsZCSUw
	SrKpRvKI8rxfY2nP4ieYyok=
X-Google-Smtp-Source: ABdhPJzMl4llg5bnH5T54qG7uthJm4KH3NkQwijZ/gOcTBcKpkJaMrrFxGew6odwbNx4NKbniG4Hcg==
X-Received: by 2002:a2e:2c18:: with SMTP id s24mr1572712ljs.264.1603389530050;
        Thu, 22 Oct 2020 10:58:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9bc1:: with SMTP id w1ls500286ljj.4.gmail; Thu, 22 Oct
 2020 10:58:49 -0700 (PDT)
X-Received: by 2002:a2e:9dd1:: with SMTP id x17mr1338441ljj.219.1603389529055;
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389529; cv=none;
        d=google.com; s=arc-20160816;
        b=J2kO9b0vKe/z/sul7vSZShOAss/fkfbJZruB3jBjNkx9qjDNWHeolJxfmBwbvIxJwb
         YFl7FhseJsMlUJPvd49/VR59WYgSctFbcRS30G09otKcvTPfXoXKxAX2Ag5P8BFwIo/d
         5YtbB+Ar+aQPNLPN3BseNBXi6SFpN6v8l+fA6VursSw11DzOhDef7uwdpgo2wqvD2/TH
         WJSki+b6zX1uOvlTfdzbdUbGNSG8MTNas0gBV98Tg78ZS//BRL2KGF5d2cwhMNg0PcXn
         GhN5BBqkzvZ2FmFkoIKMyyWjlcCx9VD5DddIrzO1qpMgl/C0FQ0Coh3VayOVjR0bwGgf
         5ATw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=jtoIg18aewbWrIUBjuUBtVn3Q9uxN2YkendcJUZOu9A=;
        b=hlyEwVmjyXbOm3CB9gO42LaIHEfB4hMLm5W+3nlZRQ24+RNnwLNFvSkHIF/habhPnz
         otkeNB6rLEoUECrNA+0QD8KvUGJO92ki3caLttu1gysId9pAPuHjx15yCv8Y1hS7nnaN
         MXlOIFs2KM87KSYIUBjtSTJm9opEjVYk/zm1ZAOZXzCEFrgwRPNH3ElYm6FEgnPeLVjS
         lAmDc0z8aiXg3Xbifj9pnUfFSAzviX8cG2+IeZ71Gl/XVvvpgS01cYbCJU0SzHzZ36v3
         sE7oTdX5+qol5IN4HlTdpg/ReZsj2o88gcyJag3yLVoPDFA8dRci0JUkowoffT/GwGNF
         AvaA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="F/HL+sbW";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id o4si107898lfn.12.2020.10.22.10.58.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFV03zn0zyZw
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
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
	with LMTP id a7ZDrWY647ze for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:48 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTz745KzyZs
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:47 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 30/33] arm-common: -Wunused-parameter: keep compiler happy
Date: Thu, 22 Oct 2020 19:58:22 +0200
Message-Id: <20201022175826.199614-31-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="F/HL+sbW";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
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
 hypervisor/arch/arm-common/gic-v2.c          | 10 ++++++----
 hypervisor/arch/arm-common/gic-v3.c          |  7 ++++---
 hypervisor/arch/arm-common/irqchip.c         |  4 ++--
 hypervisor/arch/arm-common/paging.c          |  4 +++-
 hypervisor/arch/arm-common/pci.c             | 13 +++++++++++++
 hypervisor/arch/arm-common/uart-imx-lpuart.c |  1 +
 hypervisor/arch/arm-common/uart-imx.c        |  1 +
 hypervisor/arch/arm-common/uart-mvebu.c      |  1 +
 hypervisor/arch/arm-common/uart-xuartps.c    |  1 +
 9 files changed, 32 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 6ca8cb0c..77e23860 100644
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
index 152b07e4..40baaf6b 100644
--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -527,7 +527,7 @@ static void gicv3_eoi_irq(u32 irq_id, bool deactivate)
 		arm_write_sysreg(ICC_DIR_EL1, irq_id);
 }
 
-static int gicv3_inject_irq(u16 irq_id, u16 sender)
+static int gicv3_inject_irq(u16 irq_id, u16 sender __attribute__((unused)))
 {
 	unsigned int i;
 	int free_lr = -1;
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
index e2bc374b..b05ca508 100644
--- a/hypervisor/arch/arm-common/paging.c
+++ b/hypervisor/arch/arm-common/paging.c
@@ -14,9 +14,11 @@
 
 unsigned int cpu_parange = 0;
 
-static bool arm_entry_valid(pt_entry_t entry, unsigned long flags)
+static bool arm_entry_valid( pt_entry_t entry, unsigned long flags)
 {
 	// FIXME: validate flags!
+	(void)flags;
+
 	return *entry & 1;
 }
 
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
diff --git a/hypervisor/arch/arm-common/uart-imx-lpuart.c b/hypervisor/arch/arm-common/uart-imx-lpuart.c
index 29943de7..fdab7bd4 100644
--- a/hypervisor/arch/arm-common/uart-imx-lpuart.c
+++ b/hypervisor/arch/arm-common/uart-imx-lpuart.c
@@ -19,6 +19,7 @@
 
 static void uart_init(struct uart_chip *chip)
 {
+	(void)chip;
 }
 
 static bool uart_is_busy(struct uart_chip *chip)
diff --git a/hypervisor/arch/arm-common/uart-imx.c b/hypervisor/arch/arm-common/uart-imx.c
index 849f8fca..18d16817 100644
--- a/hypervisor/arch/arm-common/uart-imx.c
+++ b/hypervisor/arch/arm-common/uart-imx.c
@@ -20,6 +20,7 @@
 static void uart_init(struct uart_chip *chip)
 {
 	/* Initialization currently done by Linux */
+	(void)chip;
 }
 
 static bool uart_is_busy(struct uart_chip *chip)
diff --git a/hypervisor/arch/arm-common/uart-mvebu.c b/hypervisor/arch/arm-common/uart-mvebu.c
index 9602ea2c..9f520e76 100644
--- a/hypervisor/arch/arm-common/uart-mvebu.c
+++ b/hypervisor/arch/arm-common/uart-mvebu.c
@@ -19,6 +19,7 @@
 
 static void uart_init(struct uart_chip *chip)
 {
+	(void)chip;
 }
 
 static bool uart_is_busy(struct uart_chip *chip)
diff --git a/hypervisor/arch/arm-common/uart-xuartps.c b/hypervisor/arch/arm-common/uart-xuartps.c
index 66c55472..84d900b1 100644
--- a/hypervisor/arch/arm-common/uart-xuartps.c
+++ b/hypervisor/arch/arm-common/uart-xuartps.c
@@ -19,6 +19,7 @@
 
 static void uart_init(struct uart_chip *chip)
 {
+	(void)chip;
 }
 
 static bool uart_is_busy(struct uart_chip *chip)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-31-andrea.bastoni%40tum.de.
