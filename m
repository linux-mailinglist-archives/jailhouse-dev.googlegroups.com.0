Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBA6242KQMGQE6LRRJYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 9537655B9BE
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:40 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id m7-20020adfa3c7000000b0021b94088ba2sf1186621wrb.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335620; cv=pass;
        d=google.com; s=arc-20160816;
        b=rsXBtbMpH3vO53zf13zcEGXAPpUcQiNgh51HSvByhSqBaW4lqWFgzBDCHzTiMk23Na
         bdjoiB6XBEdsZXfqgXH2t0R5Q1TRvynuFN0EK00V4vLvVoWq72XimZjuR1hRHVeBflVF
         dapplGbWjUifclJxyJ0H1xgv08AyumUat9+BA0QlbqoeL6+uTRp1V8knp13tr9usulAp
         4JhexHQDJvhg5Il3SF2SGF9MGynLB7eSmbfOIHeynXfIdQQjCDGla0XCoYn+eFAUshUy
         r+JoQ/PVoT2E3GOkUHVfLusCtMFFRiA/YF4cgQzK/lJvMVytHI4D0rUck3JR43+sKWEV
         1BIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=r9uzXi1vMVT7NPjNKeD32i+9klNc0af59AlKM78afVc=;
        b=iV9pCeGpoZhDExkf4U23mBCPK8SyBgYEy1YeoJU7ZiTL2+elewwNAnUt/oA02Q+bU+
         GXEqjswIxDhmEQu8J4oIYU6YHBost+JNmvTCIa3urz6AZ7wPrvl8HcOdsDkoJcNoUpIG
         qBeGu4UcYgx2sNF2GsiObDnM1Om5HT/n2MNhb7VwyYkkNqumqx35pmzPep2hDom2rzAA
         XNWFmibKnlMJbxmnNXCp1dEq7RwJ1YEsPkvKZWx1S68aQ9rK6+wu0muhlyp/4E0ux+/F
         9LKaqT1DlqEWxpOaxI0PZm6QemGpRQVUg9IuJwZ6NDaE560bJ19xwZ6WZ0Y0KNwYwBgS
         gBAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QkEGTgSz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r9uzXi1vMVT7NPjNKeD32i+9klNc0af59AlKM78afVc=;
        b=Q7MtVJC1EGs2XmjG4Pwkv0IxvN90FCwwhDlp9d0+vsba7aQSIgK5wiHwVgetZgvfN/
         w0Urc5gAME+4HwNOCe1cnAzkrD6kS/ev2IefQ9FCWbOOeUbqI2yPONJvhkI40NfVl4k/
         gjy/OLm4m0ICVnl7xCnkPnXvPnexFAB7k4Pf9RBMpeE+Z6UgEZDWFIpOvZaivgzgTX4c
         M8Hb/ne/3/RAwtYxCiAPnOfu+LrVFp87pPqLpNg2QNmDlXhR7eAHt+967Gh6LntwPf+e
         3+Nr/g1e97J51DzfmJmZUXrWUOllnT+q0Dl5DwK7jCDny1XW8+XKIJRkCMoYu2sfJiEE
         VNQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r9uzXi1vMVT7NPjNKeD32i+9klNc0af59AlKM78afVc=;
        b=qWetT9IYrfGoZHB0qYXSM3R9ydY4ILSAhoXSXjNN5vfINnSZ5wMMmnbhbTCctLkNXv
         02qMEt74AOPv+dMaVzmU+ehd/m44ti7OESzGlK8fSKDHnRS7pDsTSFaFt/NtuYzIf228
         F8agvZs/P3C8ZN0yeDQ+NelOLYGjdYPGRxs4SUDTRZlsA2g7HHL9gtRpoIW7NGSnyKjl
         8DPkkI6Nv5vuSYz86H4QrBfBI/YBXwxk8DCheoXnI52bJNSKQVlMLyd3OptRFgnhpUdL
         zq6KcVdVTe1cOd+VPidL10KYtC4rVmHnyxQ0CtA4g1VcPj9U+BmOdyh1b1Pz156btWuv
         XK2A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora8ux4jt1B43YwR3MR5p1UoZF+Ook8Gsm3HRnBCs0I+6591638ED
	t0a4aEcmfzCYZsVvMq/vNOs=
X-Google-Smtp-Source: AGRyM1u2MtXM0AIh4WfaHiQkwJo+HXqHz+8NFrvfBHxuiFPsCVDeHD/NHVd2nf81BPOpDj3asMcbsA==
X-Received: by 2002:a5d:588f:0:b0:21b:ba06:4d46 with SMTP id n15-20020a5d588f000000b0021bba064d46mr13167811wrf.58.1656335620278;
        Mon, 27 Jun 2022 06:13:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1887:b0:218:5c3b:1a23 with SMTP id
 a7-20020a056000188700b002185c3b1a23ls5718611wri.0.gmail; Mon, 27 Jun 2022
 06:13:38 -0700 (PDT)
X-Received: by 2002:a05:6000:983:b0:21b:90e1:220c with SMTP id by3-20020a056000098300b0021b90e1220cmr11953313wrb.232.1656335618778;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335618; cv=none;
        d=google.com; s=arc-20160816;
        b=xq1JAlUBX5l4e4E+bT3ligp+fDI66OqasH5UPa1vXiEuSImNO9/TMByr85cmnjkYps
         tdpwrxDV7slU2CVoIyN+Ih0sy3Rx4i6Iqgi8QOkLIbk5fqZwpHUJ3+AwCQUn+nyPG+vt
         cPvgq9HvJDGRETtNoPLHgb6Bi/2phqf0aUCxftOnrx/QTS4HRI7+r+8Pcsh8jCUltC7C
         CE+sYoPyjzfBz+0Aw7ocIET1/T2qoU07lryPDwsRf/CepVl5ZNyReS4dNy3/4Ee40wAM
         rKjwWTDP8FGaQXc4D4k134ZvqPZ2zZpjHmL7cheotQSCXXooZbU0F8MinpDBc0Dw4Lkf
         0ICw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=yyEYvjzV4wp5BdXas1S4JOxVAUQJJiOHblt5KysYceg=;
        b=rcFevkgMJOhZitiu8U7/6PYdKCsRuaQzR1fM4qCiuUxaV4Tf0HxcdgrPK0janVNyz1
         laPhvDsZqYah+j+LBxu+S12iQ/AItZFTP7kIEtzH7FHfV/3trM8Qthkj/eKdO5IbDDHP
         h+82R/fBZiUvCiVoxamb0ie/L8RqDlqVW2k2GXI378QopbYjlnSkSES6DwJ1i19+WQA9
         ZLRA44LSQF51UfxpsP/z1twaWUGwd/oj+gYp8pcIl/PDh89t9KlsQ0qnYayK49861wvr
         m8VB6fEt+EAjSCL0txICzp17DCJAlqpNnB4bTleKOgPX1I6vH0eGOOu5EqBgSVGXAX+9
         EOqA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QkEGTgSz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id w15-20020adff9cf000000b0021b95bcfb2asi409492wrr.0.2022.06.27.06.13.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWp823QspzxxZ;
	Mon, 27 Jun 2022 15:13:38 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:38 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 15/20] tools: Convert to new CPU configuration format
Date: Mon, 27 Jun 2022 15:13:24 +0200
Message-ID: <20220627131329.3659-16-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=QkEGTgSz;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This updates the config and sysfs parser as well as the config generator
to the new format.

For generating x86 configs, we are parsing /proc/cpuinfo for the initial
APIC ID and use that - in Linux order - to fill out the config template.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py  | 13 +++++++++----
 pyjailhouse/sysfs_parser.py   | 20 ++++++++++++++++++--
 tools/jailhouse-config-create | 14 +++-----------
 tools/root-cell-config.c.tmpl | 15 +++++++--------
 4 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 7a7f48a3..fc2158e1 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2015-2020
+# Copyright (c) Siemens AG, 2015-2022
 #
 # Authors:
 #  Jan Kiszka <jan.kiszka@siemens.com>
@@ -19,7 +19,7 @@ import struct
 from .extendedenum import ExtendedEnum
 
 # Keep the whole file in sync with include/jailhouse/cell-config.h.
-_CONFIG_REVISION = 13
+_CONFIG_REVISION = 14
 
 
 def flag_str(enum_class, value, separator=' | '):
@@ -104,6 +104,11 @@ class MemRegion:
             self.virt_address_in_region(region.virt_start)
 
 
+class Cpu:
+    _REGION_FORMAT = 'QI4x'
+    SIZE = struct.calcsize(_REGION_FORMAT)
+
+
 class CacheRegion:
     _REGION_FORMAT = 'IIBxH'
     SIZE = struct.calcsize(_REGION_FORMAT)
@@ -145,7 +150,7 @@ class CellConfig:
              revision,
              name,
              self.flags,
-             self.cpu_set_size,
+             self.num_cpus,
              self.num_memory_regions,
              self.num_cache_regions,
              self.num_irqchips,
@@ -164,7 +169,7 @@ class CellConfig:
             self.name = str(name.decode().strip('\0'))
 
             mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
-                self.cpu_set_size
+                self.num_cpus * Cpu.SIZE
             self.memory_regions = []
             for n in range(self.num_memory_regions):
                 self.memory_regions.append(
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 7f19fb57..d708d213 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -1,7 +1,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2014-2017
+# Copyright (c) Siemens AG, 2014-2022
 # Copyright (c) Valentine Sinitsyn, 2014-2015
 #
 # Authors:
@@ -48,7 +48,6 @@ inputs['files'].add('/proc/cmdline')
 inputs['files'].add('/proc/ioports')
 inputs['files'].add('/sys/bus/pci/devices/*/config')
 inputs['files'].add('/sys/bus/pci/devices/*/resource')
-inputs['files'].add('/sys/devices/system/cpu/cpu*/uevent')
 inputs['files'].add('/sys/firmware/acpi/tables/APIC')
 inputs['files'].add('/sys/firmware/acpi/tables/MCFG')
 # optional files
@@ -635,6 +634,18 @@ def parse_ivrs(pcidevices, ioapics):
         return units, regions
 
 
+def parse_cpus():
+    cpus = []
+    with input_open('/proc/cpuinfo') as f:
+        for line in f:
+            if not line.strip():
+                continue
+            key, value = line.split(':')
+            if key.strip() == 'initial apicid':
+                cpus.append(CPU(int(value)))
+    return cpus
+
+
 def get_cpu_vendor():
     with open(root_dir + '/proc/cpuinfo') as f:
         for line in f:
@@ -646,6 +657,11 @@ def get_cpu_vendor():
     raise RuntimeError('Broken %s/proc/cpuinfo' % root_dir)
 
 
+class CPU:
+    def __init__(self, phys_id):
+        self.phys_id = phys_id
+
+
 class PCIBARs:
     IORESOURCE_IO = 0x00000100
     IORESOURCE_MEM = 0x00000200
diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
index c2cd5952..bf2589bd 100755
--- a/tools/jailhouse-config-create
+++ b/tools/jailhouse-config-create
@@ -2,7 +2,7 @@
 #
 # Jailhouse, a Linux-based partitioning hypervisor
 #
-# Copyright (c) Siemens AG, 2014-2017
+# Copyright (c) Siemens AG, 2014-2022
 # Copyright (c) Valentine Sinitsyn, 2014-2015
 #
 # Authors:
@@ -153,14 +153,6 @@ def alloc_mem(regions, size):
     raise RuntimeError('failed to allocate memory')
 
 
-def count_cpus():
-    list = sysfs_parser.input_listdir('/sys/devices/system/cpu', ['cpu*/uevent'])
-    count = 0
-    for f in list:
-        if re.match(r'cpu[0-9]+', f):
-            count += 1
-    return count
-
 class MMConfig:
     def __init__(self, base, end_bus):
         self.base = base
@@ -252,10 +244,10 @@ product = [
     input_readline('/sys/class/dmi/id/sys_vendor', True).rstrip(),
     input_readline('/sys/class/dmi/id/product_name', True).rstrip(),
 ]
-cpu_count = count_cpus()
 mmconfig = MMConfig.parse()
 
 # Query devices
+cpus = sysfs_parser.parse_cpus()
 pci_devices = sysfs_parser.parse_pcidevices()
 (mem_regions, dmar_regions) = sysfs_parser.parse_iomem(pci_devices)
 (port_regions, pm_timer_base) = sysfs_parser.parse_ioports()
@@ -312,6 +304,7 @@ mem_regions.append(sysfs_parser.MemRegion(ourmem[0] + hvmem[1],
                                           'JAILHOUSE Inmate Memory'))
 
 kwargs = {
+    'cpus': cpus,
     'mem_regions': mem_regions,
     'port_regions': port_regions,
     'ourmem': ourmem,
@@ -320,7 +313,6 @@ kwargs = {
     'product': product,
     'pcidevices': pci_devices,
     'pcicaps': pci_caps,
-    'cpucount': cpu_count,
     'irqchips': ioapics,
     'pm_timer_base': pm_timer_base,
     'vtd_interrupt_limit': vtd_interrupt_limit,
diff --git a/tools/root-cell-config.c.tmpl b/tools/root-cell-config.c.tmpl
index c28fcfa4..8f133757 100644
--- a/tools/root-cell-config.c.tmpl
+++ b/tools/root-cell-config.c.tmpl
@@ -1,7 +1,7 @@
 /*
  * Jailhouse, a Linux-based partitioning hypervisor
  *
- * Copyright (c) Siemens AG, 2014-2017
+ * Copyright (c) Siemens AG, 2014-2022
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -44,7 +44,7 @@
 
 struct {
 	struct jailhouse_system header;
-	__u64 cpus[${int((cpucount + 63) / 64)}];
+	struct jailhouse_cpu cpus[${len(cpus)}];
 	struct jailhouse_memory mem_regions[${len(mem_regions)}];
 	struct jailhouse_irqchip irqchips[${len(irqchips)}];
 	struct jailhouse_pio pio_regions[${len([1 for r in port_regions if r.permit])}];
@@ -107,7 +107,7 @@ struct {
 		},
 		.root_cell = {
 			.name = "RootCell",
-			.cpu_set_size = sizeof(config.cpus),
+			.num_cpus = ARRAY_SIZE(config.cpus),
 			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
 			.num_irqchips = ARRAY_SIZE(config.irqchips),
 			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
@@ -117,12 +117,11 @@ struct {
 	},
 
 	.cpus = {
-		% for n in range(int(cpucount / 64)):
-		0xffffffffffffffff,
+		% for c in cpus:
+		{
+			.phys_id = ${c.phys_id},
+		},
 		% endfor
-		% if (cpucount % 64):
-		${'0x%016x,' % ((1 << (cpucount % 64)) - 1)}
-		% endif
 	},
 
 	.mem_regions = {
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-16-ralf.ramsauer%40oth-regensburg.de.
