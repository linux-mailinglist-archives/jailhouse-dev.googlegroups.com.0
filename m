Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBG4XYH6AKGQEYP2ZNHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 0184B294F2A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:21 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id 202sf1297891lfh.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292060; cv=pass;
        d=google.com; s=arc-20160816;
        b=Dm/xjl5RD/maV0gT0v88rijl9Gxbtwet5byLYc6vQnjWPSzpzlnP+UWPBmWweth8aw
         fkoTa6D1axWOau5COWUYp140Y/yR6Kq6M6sVoR6Jr5skskAFSUAAmmtnQ0cccBBve7Q2
         g9YnNyQByA+Bc9tnBgD2ThYKRM/dbPA9R4h5eJbfVvXqEBnyxcHIf9pOVkmcxY5wGksp
         7nYMHOIMLY07R5H0TAH+sZKhyosBJRaLjyioj06TCMsm9lGx7vYcNoyOv0ld9V4IHUAf
         Tc4sNfs0bAQ3plRRvZe5QjHnYDkmvle6qEYoPDhYDxXOoijmwcMjk3mUsGqIJob5j1XZ
         v3uA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=en276OBE8x0p2NjxtY/tlg+8MB7SfxaQPlvgY/O0r7k=;
        b=tbp8HzlLvj3tlrxmwrbC1qGMOtEdQ2rgSbUKO3FDvJbpAgKWGkjKU2JgWeNOfNSkgu
         fVRMgxoSggEfwjwYTauslD0bfljzEuT/MBFGoFUE218+lAg7BPEB/KtBlsF6hdUAV97B
         dj6bHadj0+8XARaajpko6yGuIQHr57HPaXwxpy3yyUA6dtIwKNIHsBzd8zyva5yXyVWk
         eqGTCFloH7UMt8eoKtXG8ZThkdNCjCWgUrSKWdasQAcwWHvGbGfCAUcc0NXTc9PL0QsM
         OSeV63nx14AG0RpNXKOpn12hwwAo3+OONj/DqQm//bdyV8I6o+sV6knBDtS3kCMi5+TB
         Esdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=PMeDMGD6;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=en276OBE8x0p2NjxtY/tlg+8MB7SfxaQPlvgY/O0r7k=;
        b=HD+U2zhkm8ImxGm34nlfLFEdr3I1fQ8XbzfVzE+3FqEOLBiw3AxQxpSJdiQH7pfaQt
         E3FOa8XZtj4k/TtgWNFwb/OJqagI/l1rTFIE5+fI0WNeG8+xAdMAu2MNCALGtpE6OtVe
         C1niKCceiZU3jVtC5iPELa9W3aSY9Wvo1heRvrkLdaKPQBo+LzkAOdZps/Fvi/Ydqdc2
         718yT2SfTVUoB7A1kOmvW5S2JNEglB//wGZWsF9AjX/J2VYXbUigO9SXt0Ska8PaGvY1
         /uZlcGGtOJ0E4bCuKrk/DPiuuCRfH3GVtXdZP2ofAoDEy7chr/dkuSEEB8MtQji30q5H
         wHnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=en276OBE8x0p2NjxtY/tlg+8MB7SfxaQPlvgY/O0r7k=;
        b=H8C3FTm9nTxuxp8y7kqfgamO0UZlNAOHFm5uEWhmdq/NOggaouTmbHQ/gnN2SItggL
         gEXOIOLV8pKPHGGTFWawYp2ApiBXXHWMVNLEDFTQc7j0FNaW8jmJbG7squnHIFpVHqtW
         mZUedHndyNX1D1PkA7MIOzq2r0H6ahOiktiYFAzRMcWG4C8ZCH9Z/7kfZVmGaMWSzQN1
         j2ST/4MMu5vHk0ub3EIE+WDL7x4ucGgFOuc/KhAKrJx7T2YPktC9lR3+hxUTLoHeJRzS
         sb21wKXf7FWyEfSyaci9WD35P3NUoCRMPOBB1OXejMRf5wx/zOOLKL7lx5zTsdg0jSGq
         UHWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531EgNxVZ1K/DoowYDLzOaV5+opM4AJYDWWW3Ax0wTyw0cLby36/
	me6tQNWVQmR1QstooKYZtG8=
X-Google-Smtp-Source: ABdhPJzCHuI8DGd+kgMTe/b6Oq0tWdTIOdmT+f1UuZAsUvJUiJHg+aNvdM2nTNt2aetxPR6kWEe24Q==
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr1514679ljc.52.1603292059533;
        Wed, 21 Oct 2020 07:54:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:594:: with SMTP id 142ls1078331ljf.9.gmail; Wed, 21 Oct
 2020 07:54:16 -0700 (PDT)
X-Received: by 2002:a2e:b60e:: with SMTP id r14mr1658174ljn.77.1603292056909;
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292056; cv=none;
        d=google.com; s=arc-20160816;
        b=h4TYVPAPAU+XDj3mKbOQIrg/2TKFGoWdaxrh0xM92Xm+9IKZEJe1fg3XNUMUm/4oG1
         474jRHvDLd/2lMeYg5ePiP5LfiQNZ5V4qTyZlXpJTnDhzg7ZT+cES7oIIkGS7PEZ3gcU
         nQlkAtlKM+tUnqaevkmqiR3RXBoDkXm6i0kyQbdS2YuYvScJokYZBrRCUGgTZ6HStVlK
         odKSZaMD6cUwJfsMNgpwTNR4mFYIrVgNEbt+E912lmX0V/Np75HbOwlx/rwhKXuXOT21
         xukz+qfbREEz+wDUkL7ZZzIJyIJOk/fFkC2aKLTJoJbW4Dfs9KKlrqkxtgVHnsiifqUD
         HykA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=y/02nzAtYzzlM2Mb9fDEFvxzHs0vZsxRJYjNcCAN9pE=;
        b=ZdMQpcX+yAub1eS5BRL4j/XUQCHtJgIpUoFCrVXgDKDuJbje2xlKqknxOXecoOBCJ/
         0spmAoVb8NgJ9NvZvPAuXzxzMgJ5AArF0On/+AbM/iVyaPhL/kUNceCd/yzcyTWt38lA
         ugjk2N9KjmzlXm9qrOXlEVZrKiLPmwSV1L2Uam0aVi51e1ndHegr10LN+MS+XDqh2Gi6
         a0jRsKijHVvVRpGMyOCkbc4Qa+2Gw7L5YMmgcaA3j+kp3+jeiFOnyMgxqJ8bXCClOFZm
         aTvS4/1Zx1viQ5u8nYewWRBwaBKeGC1LJwh8nnl9fxW6Fm2jd/D4B9k9SZvP3CvjmDC1
         G+Fw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=PMeDMGD6;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id h4si73788ljl.1.2020.10.21.07.54.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRX33nVzyX2
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
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
	with LMTP id pnMmiYx9_lU0 for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:16 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRW5ldbzyWy
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:15 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 09/26] hypervisor, arm-common, arm64: keep compiler happy about unused parameters.
Date: Wed, 21 Oct 2020 16:53:47 +0200
Message-Id: <20201021145404.100463-10-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=PMeDMGD6;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/paging.c          | 2 ++
 hypervisor/arch/arm-common/uart-imx-lpuart.c | 1 +
 hypervisor/arch/arm-common/uart-imx.c        | 1 +
 hypervisor/arch/arm-common/uart-mvebu.c      | 1 +
 hypervisor/arch/arm-common/uart-xuartps.c    | 1 +
 hypervisor/arch/arm64/mmio.c                 | 2 ++
 hypervisor/arch/arm64/traps.c                | 1 +
 hypervisor/include/jailhouse/unit.h          | 2 +-
 hypervisor/paging.c                          | 4 ++++
 hypervisor/pci.c                             | 6 ++++++
 hypervisor/printk.c                          | 2 +-
 11 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/paging.c b/hypervisor/arch/arm-common/paging.c
index 54b86e7d..b05ca508 100644
--- a/hypervisor/arch/arm-common/paging.c
+++ b/hypervisor/arch/arm-common/paging.c
@@ -17,6 +17,8 @@ unsigned int cpu_parange = 0;
 static bool arm_entry_valid( pt_entry_t entry, unsigned long flags)
 {
 	// FIXME: validate flags!
+	(void)flags;
+
 	return *entry & 1;
 }
 
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
diff --git a/hypervisor/arch/arm64/mmio.c b/hypervisor/arch/arm64/mmio.c
index 7fbfef75..2f9bdd80 100644
--- a/hypervisor/arch/arm64/mmio.c
+++ b/hypervisor/arch/arm64/mmio.c
@@ -35,6 +35,8 @@ static inline unsigned long sign_extend(unsigned long val, unsigned int size)
 
 static void arch_inject_dabt(struct trap_context *ctx, unsigned long addr)
 {
+	(void)ctx;
+	(void)addr;
 	int err __attribute__((unused)) = trace_error(-EINVAL);
 	while (1);
 }
diff --git a/hypervisor/arch/arm64/traps.c b/hypervisor/arch/arm64/traps.c
index 26a58f4d..b2c21e7c 100644
--- a/hypervisor/arch/arm64/traps.c
+++ b/hypervisor/arch/arm64/traps.c
@@ -72,6 +72,7 @@ static enum trap_return handle_sysreg(struct trap_context *ctx)
 static enum trap_return handle_iabt(struct trap_context *ctx)
 {
 	unsigned long hpfar, hdfar;
+	(void)ctx;
 
 	arm_read_sysreg(HPFAR_EL2, hpfar);
 	arm_read_sysreg(FAR_EL2, hdfar);
diff --git a/hypervisor/include/jailhouse/unit.h b/hypervisor/include/jailhouse/unit.h
index 40e1cbfe..39dfc056 100644
--- a/hypervisor/include/jailhouse/unit.h
+++ b/hypervisor/include/jailhouse/unit.h
@@ -38,7 +38,7 @@ struct unit {
 	static void __name##_shutdown(void) { }
 
 #define DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(__name)			\
-	static unsigned int __name##_mmio_count_regions(struct cell *cell) \
+	static unsigned int __name##_mmio_count_regions(struct cell *cell __attribute__((unused))) \
 	{ return 0; }
 
 extern struct unit __unit_array_start[0], __unit_array_end[0];
diff --git a/hypervisor/paging.c b/hypervisor/paging.c
index 93622d9e..1f1d8e10 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -56,6 +56,8 @@ struct paging_structures parking_pt;
  */
 unsigned long paging_get_phys_invalid(pt_entry_t pte, unsigned long virt)
 {
+	(void)pte;
+	(void)virt;
 	return INVALID_PHYS_ADDR;
 }
 
@@ -508,6 +510,8 @@ void *paging_map_device(unsigned long phys, unsigned long size)
  */
 void paging_unmap_device(unsigned long phys, void *virt, unsigned long size)
 {
+	(void)phys;
+
 	/* Cannot fail if paired with paging_map_device. */
 	paging_destroy(&hv_paging_structs, (unsigned long)virt, size,
 		       PAGING_NON_COHERENT);
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 9274a0b1..553c8588 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -205,6 +205,8 @@ pci_find_capability(struct pci_device *device, u16 address)
 enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
 				      unsigned int size, u32 *value)
 {
+	(void)size;
+
 	const struct jailhouse_pci_capability *cap;
 	unsigned int bar_no, cap_offs;
 
@@ -253,6 +255,8 @@ enum pci_access pci_cfg_read_moderate(struct pci_device *device, u16 address,
 static int pci_update_msix(struct pci_device *device,
 			   const struct jailhouse_pci_capability *cap)
 {
+	(void)cap;
+
 	unsigned int n;
 	int result;
 
@@ -404,6 +408,8 @@ invalid_access:
 static enum mmio_result pci_mmconfig_access_handler(void *arg,
 						    struct mmio_access *mmio)
 {
+	(void)arg;
+
 	u32 reg_addr = mmio->address & 0xfff;
 	u16 bdf = mmio->address >> 12;
 	struct pci_device *device;
diff --git a/hypervisor/printk.c b/hypervisor/printk.c
index c9e22b29..64207591 100644
--- a/hypervisor/printk.c
+++ b/hypervisor/printk.c
@@ -46,7 +46,7 @@ static void console_write(const char *msg)
 	console.busy = false;
 }
 
-static void dbg_write_stub(const char *msg)
+static void dbg_write_stub(const char *msg __attribute__((unused)))
 {
 }
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-10-andrea.bastoni%40tum.de.
