Return-Path: <jailhouse-dev+bncBCCMB6PY3AEBBH5WSLUQKGQEO2SD6ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 280686373A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 15:48:17 +0200 (CEST)
Received: by mail-pg1-x537.google.com with SMTP id o16sf12708262pgk.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2019 06:48:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562680096; cv=pass;
        d=google.com; s=arc-20160816;
        b=GBE3I3uwjW+GwXp6+TmNY2h1NHTqEmaMQXMIltpNlZD+/7V6usP/trwfPT6U2T6mjh
         FQaoipEgnHCl6tbXyek3YaGQhsNZ6HQHA3BpG/sGCyYDgjLQRlad1eIrSzUp31HfDEds
         Sl22sEjMx7hqlM+bfFW70VmpP04qtBCloFKb0dNgOT2u8tMnitcY0FPPO/ntwGmrDaA6
         I4OkBkjKXszbUgFSBkKRKOaotojpNi1T2TlEtFbJFJ/MgdwL/2pwHunROTRDgejkRL3Z
         6iLhGT2f82nv1vA5hQVY7moiOzH0krbpgLl0YCtv5Gd2fkSxDXLwV/nKg8hofwD4sSf2
         Ybxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=/w0ePXNkns4J9pjBUYvxW7t4yAhM5ayEE6bh2nmF3fM=;
        b=iR8G6CUTB05y/54ffBp+FaF8NMEUQX9R1TvDyuKuHeNNfGVgJvHtsiYXpQCpA+fo1D
         eYR4pJRmVAwVJDXJGArrR/CeTnNSrYzjgAx8c42MjvdEKiwM3I0Z9yEQJdWJzLizU940
         vQ90dho58ZgRNpCSypPUyfUE2ewIfM/yugL10bVgw5e3JknByxWu4A8O47jdvXi8a0b1
         9v9Q3Y/Zx8EjH0qwrerPcbjRyPFljPcbLyQrR4jJOtMr4DyzC1DhVdvv86qFzV7k+RCq
         ZUV18g4yWWH/qC+d6mQ+hXjptxSl9SOlw4RNN6R+s5bTAGZMRnV+nZPv5Le31ShI6jfE
         kj5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cjw8BVGs;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=/w0ePXNkns4J9pjBUYvxW7t4yAhM5ayEE6bh2nmF3fM=;
        b=XgPQDhHgb2fa/Wg1+HLI+LW3xKuCKhqA3T2SD9B12JZ/arvoEk39w0r1kOGrukQPfE
         QZyOdgst2dohI3kq+8r0R4WqY9xEpR4DoWrMEglR2dBfX5o3u68pky9nz9EiVeFbKTjl
         8tg2BYfAQMKhgSnitqQWBWhjMQuUJ7r8NEnKu8bOIG4q6+OBEYmcK1GrVbzg80IxKxWA
         DXBZj392Vs0n9K98wM32ecxvoxOWlLXlnWh2fLKSpFIWCW90HLMZGmMMzdb/BdhnZSBY
         YImSZEMJRoVPd60bt+rmt8M0g3bnPDnWAZdYs+54FHFKc5UF4U4aW6FtVuZogMNBw3/C
         iOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/w0ePXNkns4J9pjBUYvxW7t4yAhM5ayEE6bh2nmF3fM=;
        b=HxLKPLjsCrYyEwyZEj4MGWbKRXjzD47BWdzB9ogYiyccWvqgxUm3ff99oHUOFdPXuH
         hcsdhfG/iltPfAyda5kXatPUFJE4eehaJ1BIr2YEM5eKut+T8RAwD2gP1TeQPwYTpP2B
         dww5XVVsCYKQ5G8xAYyb3gWwV+3WY49lYABYdXIfRM1AjGeKsV48U+kMPXeE4GwqwaDl
         V3+ijoWFqaQ7FmeDgLk6p0dQr4ArG6Ha+pCz6yJiKwCMANPBe2eyA19ZMjzCx/G+m8uQ
         y8pIh0wcJV+fDlIGabx2t/AIWVaKRCgwwEvvNwC0SrAbfQzFtCh+k0HQ4EvG9UUF/PkP
         q76w==
X-Gm-Message-State: APjAAAXzUczTtUTc97oekAePZDfgaudFNF6hSIYXITr9wgOusHQ9Qvc6
	l28Q5eJpHMXsrDao9GAM1TQ=
X-Google-Smtp-Source: APXvYqwZcWXUi5JMp4dmRZoOiNbHTHhjW0dPcvIx4YJID+GSmdBqa9uwfG4DMphwU6me9eqc0DQdZQ==
X-Received: by 2002:a17:90a:1b48:: with SMTP id q66mr107812pjq.83.1562680095819;
        Tue, 09 Jul 2019 06:48:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:c015:: with SMTP id h21ls3530565pgg.3.gmail; Tue, 09 Jul
 2019 06:48:15 -0700 (PDT)
X-Received: by 2002:a63:1658:: with SMTP id 24mr31724576pgw.167.1562680095236;
        Tue, 09 Jul 2019 06:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562680095; cv=none;
        d=google.com; s=arc-20160816;
        b=vIunnN3jnfOa3qFCPFreujEgj8Afundjs53djgnAV9SrQK6SWZGCymNplj8A8us0Is
         Zvvydc9usUSQ6xN+WVPzk5Dg/NeYxMWMpq1H/QoMNnf6n3RG3KyNj2TjhicCCtIdAOaM
         HDUy7T2UuLQ948PZU3i7eSAqMRLPoaTmGwLGVEIYRv8fERFRjpxwwhAyNlzX3DFz4qWw
         E5/0LL1OvU2S+Svc2doCLLnQIzc4RCUX3/qhCPZYsE4ZGXfleM0ciWws1opm1QsKJAXW
         0pWNCK27p5JUKj7+bAQhHWDGSbC4ZdGn3GIFC0wqmFrrAN8QfLz0wVUx+SAaB7DKRk7G
         nVEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9pNt0oVpCVnRJ/deFf1b305SeYA12s3kdvbD9dgasx8=;
        b=BP9DiLLLIHO1zGsBkMhd1VoBmsLN4OxG9XBvK3DYk6Tuyt9LUFXj1Qi3rQFfx4BDlW
         3PE66eWwpznf0Y9kU2yza1YfOUIXvQ24JR7n1Jv6y8JkjVnIiLOPEnO1rk3wIIOPboDY
         bLtTTxob0jiEB+I57TQbUVdwQLirKtcWcCiwR7QO3NZzMYyuZ7o9WPnwnvoWkehFsXVI
         yhg6r+vZSi3sDm472W9cCiez7OlyjzmIu5sJTmlpqFsX9DGJFxkG0iWo3XkOx+LL7o8e
         q3qizA9pcCRLNzEL+reF9LZFrC80qPdmpPj4+Rh1Ii0is/42ZoCZb/SIkraRVBkQz8Ok
         xDJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cjw8BVGs;
       spf=pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=p-yadav1@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id v74si641320pgb.2.2019.07.09.06.48.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 06:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of p-yadav1@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x69DmEtj066848;
	Tue, 9 Jul 2019 08:48:14 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x69DmEDK009334
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Jul 2019 08:48:14 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 9 Jul
 2019 08:48:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 9 Jul 2019 08:48:13 -0500
Received: from pratyush-laptop.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x69Dm9P0107982;
	Tue, 9 Jul 2019 08:48:12 -0500
From: "'Pratyush Yadav' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, Jan Kiszka <jan.kiszka@siemens.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        William
 Mills <wmills@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        Pratyush Yadav
	<p-yadav1@ti.com>
Subject: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
Date: Tue, 9 Jul 2019 19:18:31 +0530
Message-ID: <20190709134836.10485-2-p-yadav1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190709134836.10485-1-p-yadav1@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: p-yadav1@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=cjw8BVGs;       spf=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190709134836.10485-2-p-yadav1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
