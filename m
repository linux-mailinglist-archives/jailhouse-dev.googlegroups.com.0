Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBP6D7XUAKGQEYW54WCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3a.google.com (mail-io1-xd3a.google.com [IPv6:2607:f8b0:4864:20::d3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC9B6081B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  5 Jul 2019 16:42:09 +0200 (CEST)
Received: by mail-io1-xd3a.google.com with SMTP id k21sf9994365ioj.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 05 Jul 2019 07:42:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562337728; cv=pass;
        d=google.com; s=arc-20160816;
        b=przfkGimq7uhtIYJXyz/8xfI/fypF1QR4und8voOWGdJGTrrNh7hNFyj3MtJgmy7Wx
         Die28YuWrzIuivUbfOA/T2cuIPu0WKk9e4oLpYntCEz22V8rB4xhuC8yFa8k3XV1jeRv
         8zOol9zCPNUS4vlo+ui7ssRaX8NTwC1vtdSY4mafsAHUAZjJwUbEpwdqe/8f7+aVzE2q
         v8BtJKWo2gTGjZ6aj23WsGEEP3ouoZLUDD8WSbGQfaX8jHkBafvpYC+rFfrV9Xbw1a7+
         TZ1nv6yD/Y0W8jc7J2fEQ+x5JFw657RO4HgDiadY8QFnYMS7gNUCJRjAZG25O3WTcy8s
         55Xg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=LQPo8bpz8TF16MjFDUOoNUZKOknMUWqV+I37rQAeue0=;
        b=ZoPrf4YnH2R09B2pfdiIk+1ZgLbXtPGFrD17YbZu96taJ/4qpbZVC/IQ1TB9PiMh6X
         McY5uX7DrBe1L3n+mV1q0Nd9O1QRvCt+jx1nOZKk3kqrUJrg53Sfz+ZML4dIKA9PbhSZ
         9ttLmHtGQD1KTnr3jeHGZOqN4mkjoqRYCQ2jV2RfJXFeEGz5gllIV/0C1VkEHbsAY9tU
         e5zbav6Lq9B48mu95ROZWX4MBoEGliZMZZHq7FEtL0iZKQ0FpixbdeABoDw9XqrjIw2l
         2meA+HXAORPWsN6qiFvqRlOzENRvNHUo1YPVgB/6e+hqhwLs8a1Uco3JRyhQ5TqB1ZcI
         1lrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mjxjkrl5;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LQPo8bpz8TF16MjFDUOoNUZKOknMUWqV+I37rQAeue0=;
        b=RdiHRF7vTBim4VXcXD1hyTCz6cwsWNYIIR6l6apSzbGzWLHLbhpQXUTwhqR1UFsoE3
         o5/JNPGk9KjCNCNv3XJR0uhDqQPHawbqgVIiXnXVNWPdkcFE0EGB7YxJvy7hxkb9FvGX
         X/CPyhNVpeVsa4gLIhwqjYA7v7JgRkrRYRv9RdI5mFy/R0B7QP7aH7UIOTIyVK8wQdkg
         yTHy8gPVGrCpA3fFvEPUtWmso20TQ62mcKuF48yfQPBM2pGyYjMzZKQzNOTWUaLY0FUE
         ipDk1+4/RXH7icZySj2MvkU98RrHNr0w9T9jRG0aObXzpLsCLESXv+mPxZ6woWlVSB9N
         LJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LQPo8bpz8TF16MjFDUOoNUZKOknMUWqV+I37rQAeue0=;
        b=lM0m9gZGqLKAWTK0BYBm1dL5laF/7Ex0HKvIZ/i1aqQuCG0dUo2lW49HTvO+8WEcAN
         HOHTv77VpDdf45Vn7evIYOtzeT+N1LHKV7pdTwpm3LN0gdkn1MFWsijt60vPBE1hkQEf
         MLt1ZtCeVyz1XR0qnp/MRzJ/mB5+7esb+cj8qipKi9HjEV6sr7ynYVU0kdynJXUIrFBh
         BBmTw22CrufeuT4HIRNx95E25rOXpiCNOa0hLEchGCgQpUXaZbeS8k5ofUNgAX430C9f
         NUSi/5ihNT0xlJATqRHvavlKTWS+dAVJ+LEvpdvm0WmtcrNzbM40Mh2CsB8D8qJ7xMpA
         c3Zw==
X-Gm-Message-State: APjAAAWqOGh0af3Kci7PLBEeHBgLQYnCzL3KX+pwLyUXejpT1Nuzgrpy
	DpmnyH8L3k5kOiesonQ8f/s=
X-Google-Smtp-Source: APXvYqynIxFvPveYgc/YjlFkI+1ErH+JD1/zg1Mwe1Jv+mJvnd9fmOf+EGP1hQAz46J//TcYISTqUA==
X-Received: by 2002:a5d:94d0:: with SMTP id y16mr4261297ior.123.1562337728101;
        Fri, 05 Jul 2019 07:42:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:d018:: with SMTP id x24ls2139439ioa.6.gmail; Fri, 05 Jul
 2019 07:42:07 -0700 (PDT)
X-Received: by 2002:a5e:c744:: with SMTP id g4mr4039457iop.187.1562337727561;
        Fri, 05 Jul 2019 07:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562337727; cv=none;
        d=google.com; s=arc-20160816;
        b=fRvEO4crjY4RE6CdIAL4X9+bpu6LPKMS1S3VcsDK+YFpQA7v43MhLN7hb0xkuSThUp
         8Hrt2R9KFx7UPeWB2t5R5VN6W9SEFKvNhl+Jdl3hxLS6lWGEABo51oCEV+Xgzg8NXXrT
         KpJ+GwEJEw/NrP/AsoN5343/aEAxwg0p08U5YVXt8A66Noe7jSFCCnux5kM3S3h3WsFk
         UVuMBBs5VpE+yWkPQrg0/zn6WseqvEw7PD2tSt5F6jzExjwjTn5xPCgqq4+RhwQ5f/fI
         yBX7/Tw8/vE2AtpqIl5wFQmnjzRQ/OcBE2SnaB33hRwiLo0VDIzHKKb9huXH8WGNo8NB
         y4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9pNt0oVpCVnRJ/deFf1b305SeYA12s3kdvbD9dgasx8=;
        b=smuEGErDrgNBXz3eyj8DMVJVPwnXLLIExtNRyZivu3Tr3NgQ6QShDELsng+K1eptCa
         RWo25v/pgkJRxHD4rIxztRpWNfsYYnebz45eVIG2x8dWL/56BIKZ4FWxkqUkTNs9FupC
         pzlC3yt21QD4qZMSTCZJ6HW04ywryDfC78AnPMs5oCNzl4SnjFhG5nBoyS72Hb3s5Pux
         fTyPF03tw0yBp35jII5voQOs0tgcEOANwXQeC/Rwyzq26iqIMAl4MTt2bBVl7c3SHnlO
         HQLrpdWfN3zSeC59FHwu1w3weTEeK8CYbgNL18s3EBJTXKP5bWsaXo5XnksSPnGyEqZh
         YyLA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mjxjkrl5;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id m190si65461iof.3.2019.07.05.07.42.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 05 Jul 2019 07:42:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg7Pj016591;
	Fri, 5 Jul 2019 09:42:07 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x65Eg7J5107415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 5 Jul 2019 09:42:07 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 5 Jul
 2019 09:42:06 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 5 Jul 2019 09:42:06 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x65Eg1o0067904;
	Fri, 5 Jul 2019 09:42:04 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v2 1/6] iommu: x86: Generalize iommu definition
Date: Fri, 5 Jul 2019 20:12:20 +0530
Message-ID: <20190705144225.7126-2-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190705144225.7126-1-p-yadav1@ti.com>
References: <20190705144225.7126-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=mjxjkrl5;       spf=pass
 (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=p-yadav1@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Pratyush Yadav <p-yadav1@ti.com>
Reply-To: Pratyush Yadav <p-yadav1@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Right now, jailhouse only supports iommu for x86.
Generalize the data structures to support iommus of different types

Assumption is that each jailhouse_system can define iommu
instances of different types. Extend the jailhouse_iommu
to add type info.

Update the x86 config files to reflect updated data the new type field.

[p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
VT-D]

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
---
v2:
- Undo removing iommu_count_units().
- Remove the union from jailhouse_iommu.
- Remove the stray blank in amd_iommu.h
- Revert to using n instead of i in amd_iommu_init().
- Fail in Intel and AMD when any other type of IOMMU is found.
- Remove the accidental Intel configuration check.
- Update cell config template and pyjailhouse

Jan, please take a close look at the template and pyjailhouse update.
I'm not sure if I missed something, or did something wrong.

 configs/x86/f2a88xm-hd3.c       | 1 +
 configs/x86/qemu-x86.c          | 1 +
 hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
 hypervisor/arch/x86/vtd.c       | 2 ++
 include/jailhouse/cell-config.h | 7 +++++++
 pyjailhouse/sysfs_parser.py     | 2 ++
 tools/root-cell-config.c.tmpl   | 1 +
 7 files changed, 18 insertions(+), 5 deletions(-)

diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
index 315d0e29..849c5756 100644
--- a/configs/x86/f2a88xm-hd3.c
+++ b/configs/x86/f2a88xm-hd3.c
@@ -50,6 +50,7 @@ struct {
 				.pm_timer_address = 0x808,
 				.iommu_units = {
 					{
+						.type = JAILHOUSE_IOMMU_AMD,
 						.base = 0xfeb80000,
 						.size = 0x80000,
 						.amd_bdf = 0x02,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index fdfa8915..2df2807a 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -50,6 +50,7 @@ struct {
 				.vtd_interrupt_limit = 256,
 				.iommu_units = {
 					{
+						.type = JAILHOUSE_IOMMU_INTEL,
 						.base = 0xfed90000,
 						.size = 0x1000,
 					},
diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
index 02712571..2fc6d033 100644
--- a/hypervisor/arch/x86/amd_iommu.c
+++ b/hypervisor/arch/x86/amd_iommu.c
@@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
 		    &system_config->platform_info.x86.iommu_units[iommu->idx];
 
 		/* Disable MSI during interrupt reprogramming. */
-		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
+		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
 
 		/*
 		 * Write new MSI capability block, re-enabling interrupts with
@@ -782,14 +782,13 @@ static int amd_iommu_init(void)
 
 	iommu = &system_config->platform_info.x86.iommu_units[0];
 	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
+		if (iommu->type != JAILHOUSE_IOMMU_AMD)
+			return trace_error(-EINVAL);
+
 		entry = &iommu_units[iommu_units_count];
 
 		entry->idx = n;
 
-		/* Protect against accidental VT-d configs. */
-		if (!iommu->amd_bdf)
-			return trace_error(-EINVAL);
-
 		printk("AMD IOMMU @0x%llx/0x%x\n", iommu->base, iommu->size);
 
 		/* Initialize PCI registers and MMIO space */
diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index a43632f5..dc89928f 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -1022,6 +1022,8 @@ static int vtd_init(void)
 
 	for (n = 0; n < units; n++) {
 		unit = &system_config->platform_info.x86.iommu_units[n];
+		if (unit->type != JAILHOUSE_IOMMU_INTEL)
+			return trace_error(-EINVAL);
 
 		reg_base = dmar_reg_base + n * DMAR_MMIO_SIZE;
 
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 5739f332..781aac88 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -196,9 +196,16 @@ struct jailhouse_pci_capability {
 
 #define JAILHOUSE_MAX_IOMMU_UNITS	8
 
+enum jailhouse_iommu_type {
+	JAILHOUSE_IOMMU_AMD,
+	JAILHOUSE_IOMMU_INTEL,
+};
+
 struct jailhouse_iommu {
+	__u32 type;
 	__u64 base;
 	__u32 size;
+
 	__u16 amd_bdf;
 	__u8 amd_base_cap;
 	__u8 amd_msi_cap;
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 3db61980..06f68c87 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -243,6 +243,7 @@ def parse_dmar(pcidevices, ioapics, dmar_regions):
             if size > 0x3000:
                 raise RuntimeError('Unexpectedly large DMAR region.')
             units.append(IOMMUConfig({
+                'type': 'JAILHOUSE_IOMMU_INTEL',
                 'base_addr': base,
                 'mmio_size': size
             }))
@@ -387,6 +388,7 @@ def parse_ivrs(pcidevices, ioapics):
                 mmio_size = 16384
 
             units.append(IOMMUConfig({
+                'type': 'JAILHOUSE_IOMMU_AMD',
                 'base_addr': base_addr,
                 'mmio_size': mmio_size,
                 'amd_bdf': iommu_bdf,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index b6ac8637..9f904e9c 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -90,6 +90,7 @@ struct {
 				.iommu_units = {
 					% for unit in iommu_units:
 					{
+						.type = ${unit.type},
 						.base = ${hex(unit.base_addr)},
 						.size = ${hex(unit.mmio_size)},
 						% if unit.is_amd_iommu:
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190705144225.7126-2-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
