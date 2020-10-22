Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVMQY76AKGQEZJ57GSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 6848E296447
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:46 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id y83sf716211wmc.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389526; cv=pass;
        d=google.com; s=arc-20160816;
        b=mzVQfqjxv1mBKrY9ggClxL/m0KICVdbdb/GP5AhPoS2wJGx0JpYciaMSqnZ2qtcgaJ
         lFPLG/wCRa1xdotYFCELUY/2oCSviwRrJoxnEHW0u1H5m0ONToOUfn8q3ED/JcGjuu6W
         iz4v28AVKyWsPDrjZ+/sxyeiXCudOqVHPiqWlEQLMHhvWfRLDT1BfVQbxPd+EgIm7Cmv
         z2FIDXWEvwnCN99SMPuhPCsVJ01wfVTjYdzcxADSxeiebGxv85CTBWEhkyb4M0+E+v89
         RxcUVNgm06yty/x+UR//qrtFww/8GDBrXNuMc6mr4PUStgSbr4p/d9xbUtBAVkmy1E4j
         nWwQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=qkZmhBMof++3VuOI3LNZCWUbvk2QVV8hgbr8pcAneEY=;
        b=ue7OalBV7koe6qgrce+gxPewScbOKKupkRAHobrbny1Gdkoma1n5AnG6TSVYZS7YyF
         5w0XdnM5ia4whQe8sQ5Y+PC4HkRIl5K/SZQgOfKxqzVwBapItj0U9kxiSgL2+oD9qInS
         fAo4yEAkELPGJU2SE3JgCysIvTx2jKwXABi0T0u7b24UFk6JccuUjtodtb8bnn4UgOXJ
         kNso/424Qgb9KxoILhxh05pvwwj/T2Uzs3MGF00P2RGQS0xJ2utI0thXHTBZKAHzacAH
         9ly1pHFHHCTIdkU5q50wFyYr2m9MUJt9+IL96a985Z60exXcyOvLWQAALuq3TNyUAjnE
         sYbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=xfw0mzCn;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qkZmhBMof++3VuOI3LNZCWUbvk2QVV8hgbr8pcAneEY=;
        b=SPGE3voO9crWIe3fHbt/zeG3ltMo0sL3WKa+m5wjl0Qn+rZej0MN+V9XS2prARtoxY
         oZ+XQu9cJyJPexicHHW496pbB+KtZ2hKhqxDyodyeWJJ8lVqwX5XB0Q713/CPkjdeTbb
         mwXHUO2wJRL0xb1S8kZp+yIDyBaY4MdGs7Yat9XvgWs/JFvOGgguurbFtPaCdFpL1AS5
         fPVKddCc5QEgtd8kD7KRiVcuRO3aAFezOFPrlnLFNI6u1ZfgZd0c3CeW5QgdISQM+yzr
         62YZlOUIq4IFHfJwT7xcrq53SjOA/kVugxr8tU7XPI99K083P6NOcYfV8uxI92rPCmHs
         N4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qkZmhBMof++3VuOI3LNZCWUbvk2QVV8hgbr8pcAneEY=;
        b=iUS89AKE7mCfYVwleDiIfcD2+v+291JwkX0x3MT2wAVeNIktnWSSGOSQdoiuQRf/g5
         d6gEj5bG4WlmsUOZAXI5yCkH42JcZTB8mvFZewkeDc76M23tk0sRNa9/v983cec9JC9V
         /gNewPbve/tXinI7yUidKob9QeH2IYMH3L4GaeDwj0MI9KLMyFYyu+dQ1vQmAH3tmSIJ
         a8KiwlKizotLvBK3YcqItyvtQgw0XcdLrIneXbiUtq436r8YbfDUSLVqjUWoRIo+6av1
         NdKRCe1Krdbj9EsgqDmHYzd8sbID5WKqIj51rCo6LPtUgKSvhqSot5X6c9TZU4LxWjv2
         BlFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Mp1Z9rqk0VNNRtFCasluBp4+sQN0TNH9N3HtRi0mirZV4x9rF
	KUZt753sNaZnrgwBWwbEz6Y=
X-Google-Smtp-Source: ABdhPJxfuuxK9tnKyeebv23KY2fnb7bHzm+l2Gyutq0dACJx4Xc1Ou8AdaGp69Ssy+Tvn4u/fwnDmQ==
X-Received: by 2002:a5d:688c:: with SMTP id h12mr4171966wru.92.1603389526123;
        Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls477782wrc.1.gmail; Thu, 22 Oct
 2020 10:58:45 -0700 (PDT)
X-Received: by 2002:adf:e80f:: with SMTP id o15mr4066920wrm.308.1603389525264;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389525; cv=none;
        d=google.com; s=arc-20160816;
        b=CVkkrT3wSvvKIuW8jajBQQuZljIKNn9vEXV3vNIF95+oeHMppHl3iXromDX+6564xb
         P6+YahL5AQsZkUlWBX4WwAoCJJaw+q0ZZm1ucJAM8q/OZwA6kDactgBVSWCN3dYhAbqQ
         O594lvdMzN0RMKWugt8kC7owWmp88Q/2Jj/1oMXoh2cJSDflbC0hNfA3oxgN2TuZzSHC
         lWJecIldbswHn6Cwf7t6uNAyHvRESRn/Bk4hk8kltQPrW2I+nVX2DxPB1IPTDH/HGA5u
         lQ2Rq2grBAaORxYjeqFQfMe4hHehQmQviDYoseh9/dhUREP6WWnAiv2i84DIprzHgWFj
         VJMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=4CDVsn2aen2HiA85TifJPTENpBc8UgTt0xmkH+ZFo68=;
        b=TkJTchEUKdqPbWSYYSbr9sk8ilL68CrH+4wdjZPyV4uIpIgknt8JlvugyiNOCLj9xU
         5Xlg42imggkF68piojTmhXQsIidwDFc3r0u5EGPIPGURSusX6621mzUcFLofNw6Pcy2i
         cIydkNq/r6nkXNqw2eM2DDE5VP4CJugHr/njRFg7KHoZXKhNkPaSy9eeOB58Kfsr2nhF
         V2y8wwUGBbq7eRXQH+FgzLxTl/ZXpzq7pNtP5hkyjQI7NYfrOSkLWnHW8SaN4KMhJRn2
         3qgB+8QyDsfLUitkZtN53My5GCxh71Bl7cn3Pq3U2pyYisXjW+0g/3V0I7AFXsnxnXDC
         lfQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=xfw0mzCn;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id k3si65191wrl.5.2020.10.22.10.58.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTx0glNzyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:45 +0200 (CEST)
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
	with LMTP id 5glsxcTiVZGQ for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTw4L3LzyXb
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 28/33] hypervisor: -Wunused-parameter: keep compiler happy
Date: Thu, 22 Oct 2020 19:58:20 +0200
Message-Id: <20201022175826.199614-29-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=xfw0mzCn;       spf=pass
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
 hypervisor/control.c                | 2 ++
 hypervisor/include/jailhouse/unit.h | 2 +-
 hypervisor/paging.c                 | 4 ++++
 hypervisor/pci.c                    | 6 ++++++
 hypervisor/printk.c                 | 2 +-
 5 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 0078ef19..81b7614f 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -884,6 +884,8 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
 
 static long hypervisor_get_info(struct per_cpu *cpu_data, unsigned long type)
 {
+	(void)cpu_data;
+
 	switch (type) {
 	case JAILHOUSE_INFO_MEM_POOL_SIZE:
 		return mem_pool.pages;
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
index 75d5da59..0573cfd2 100644
--- a/hypervisor/paging.c
+++ b/hypervisor/paging.c
@@ -55,6 +55,8 @@ struct paging_structures parking_pt;
  */
 unsigned long paging_get_phys_invalid(pt_entry_t pte, unsigned long virt)
 {
+	(void)pte;
+	(void)virt;
 	return INVALID_PHYS_ADDR;
 }
 
@@ -507,6 +509,8 @@ void *paging_map_device(unsigned long phys, unsigned long size)
  */
 void paging_unmap_device(unsigned long phys, void *virt, unsigned long size)
 {
+	(void)phys;
+
 	/* Cannot fail if paired with paging_map_device. */
 	paging_destroy(&hv_paging_structs, (unsigned long)virt, size,
 		       PAGING_NON_COHERENT);
diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index fe85ae2f..79b6f920 100644
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
index a32ff8c4..6f149f0f 100644
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-29-andrea.bastoni%40tum.de.
