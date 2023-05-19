Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUF5T6RQMGQEOQRIRDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E49F70A0C2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:49 +0200 (CEST)
Received: by mail-lf1-x140.google.com with SMTP id 2adb3069b0e04-4f3b3108857sf279887e87.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528849; cv=pass;
        d=google.com; s=arc-20160816;
        b=sfP/fyVTPaPXKXNHMnxa1ctDUwwiucd6vuwmsBdB0DLTXf/pZsF3w/V212ALxZmA7p
         XsMBDfzvNsIzcss3mcxEXzCa2pCxCMwpPRCv1kecRV+Ai+IlJa6LhB3b+yaIZ5/4wbdm
         cQ/uSZhlUOoR9k4zbcHh/S34aqE9g0vQiZAmDICQJmKm2rzjjvc/eAbJHvQNKXyfLGUv
         /isQPzECwtLRyjFVVbE8/Z/WAHgdWIvJpwauLeBp04QaGreCicMZVs/hHOCl5pbakVDi
         wpV1d6GQLdhAi9mfv8flVr4jQd+N+cc8YWT1LG+0xcErpPKX5QlceRKk4LzK9qt9Lh9i
         a9Ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=XScB1xF5HL+qizh0D8Ej/RyEQoy7y8lCPHYtBI5vcVs=;
        b=XDrVekPRCWIRLdV7FCaodWD36Xa5hwaOkqhUVh5aflUqrBqi3eAtrRsDrSv5/zqtFO
         9DK+AuAUiLqgc/DSBkOCDUAYHHcUevmknLADcLT9Ins0SLSxkstWRstGgyebYNHpQ8aB
         SwuSbUzav5a/6D0xdlW3bBhPH14Ml8kXGiPAvw3x7OdD1m8t3i2eVGA1f4onsXVCVzQS
         x0f4sINf2H45BZbtp74yr+WvH+w95zy5slYoMqSAEtQJS8pf12UlKMtlTiSXo0L+mNgX
         YWxlzrWbOFUOL1nXGFrktYS+SaW9hJx1BZWcxMh34lIx2cMJFCkh5IKmghDgewaRcOmA
         q6cA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528849; x=1687120849;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XScB1xF5HL+qizh0D8Ej/RyEQoy7y8lCPHYtBI5vcVs=;
        b=jVjOP2PjkIOz59iDY72en27ogeUqgQbQLvUCvIr6uL9Q3SvHoPEql+L0qj7BkyjP6X
         EQU3jPvTG5d8BF6dTiuBbtnZEqjRaDuv3gpfMYaXy/bNlD2mC771DFXSII4GKqObYM79
         NJYrEypMIaNKcg2k7RrrONQ8MACj3uWnkSb5Kala56WvNz39w4oSXkOVIScF+Xcf3MRA
         u1cGmQNVphco1XBpLmnFf9gdjwapkltSI/A0R3m1RVjgdMlUiH68CiTlkxOsOi4/XQGK
         e5BL0l68gDXU5/boO090T5xhtWoP0/m0l2meLZojtKihw7zORx/7+wKpOs92+kUrcJET
         6dtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528849; x=1687120849;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XScB1xF5HL+qizh0D8Ej/RyEQoy7y8lCPHYtBI5vcVs=;
        b=GAW7HEta2+3VpbKqIOxys6kWRoRtZNLC4hPo90F7CZLBRJl2cBLaYY/vOEmrCCza1s
         q+qf+Qxcqk8DIpMvrskAVEV1kQB3BFZG7CNTxdNgQxXYylw2EbpsS5d0nOfMkbzV5Gn+
         wS1CBbYt2l4tIJMDD/M+RlPKRoQBPsltJoUla2VzYIamd4Elyb8JKgduB12CSKsIEtGj
         jNcpc4jLiUSYG85lUKwkskIcY88KsNAtc5L+07/Wo7MAAI7LDZ5bdzKGW8+JmRgwc7/q
         /6cmM4JgBIs/DDY+rHecJsIItuEY6N4DqDfoafafxMt4KHbqGwp8lSXucWLXvU1+Cnzz
         Mwkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyErOmulyB1RSPkWSyA+LoANuF+N8doYibRsu0x2xT28KOJhTsC
	Pr1dSTdvgF2vvsYCM4l2Xws=
X-Google-Smtp-Source: ACHHUZ6EwNV44nQSAawxT8qYmBd7uTajs4RWx35I3qjWvgliFC1FA3o/TOS6OsHtjJsaPRvTciVZvg==
X-Received: by 2002:ac2:5545:0:b0:4f3:98f0:9568 with SMTP id l5-20020ac25545000000b004f398f09568mr891260lfk.0.1684528848850;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5bca:0:b0:4ec:b233:723c with SMTP id u10-20020ac25bca000000b004ecb233723cls1542788lfn.1.-pod-prod-09-eu;
 Fri, 19 May 2023 13:40:47 -0700 (PDT)
X-Received: by 2002:a05:6512:408:b0:4ec:9e63:6144 with SMTP id u8-20020a056512040800b004ec9e636144mr1222278lfk.42.1684528846989;
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528846; cv=none;
        d=google.com; s=arc-20160816;
        b=aicFTCbU7uWaikw7ry2wcBdLMOHq/U43yk4Uwugtz/IChdmg12RO7Is9hDcFzJoBDK
         3vJkvFJYYPgb8R3SITYNuNUbTvMlJRLSCFHh5Mv4outBUB0m8kB5113B2CtaisEp07wE
         5dzSF0la6TbgMP9UeRFaOR9eCzNd51EOTqot+Kk7Cxc/4eccCq4z3IeWdEwL6Wh6EKoL
         4b/gXz1MM2o8T39fwB5VAH5tk71+y8CLhnvYHE/wsBomkphGPXQVehXLe1dz8b9OPnz7
         GSqzNS6qkzLPMAoazyxWxCny4cTSANRgCAxK4JmvsmFt0Mccr/wxxhWEAsqVbDzP80kJ
         J0eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+1niXHwbIkcFfkJi7cFjlb9xvXPkUyJqMYI5JluHlsY=;
        b=JrjrFgBF9v24H+uzISR5syMKu03+rPtMG7M6kVy2cVn1ObahaKY7T3WaxKBbE4IPAo
         Isk8u/JwttgfExshWCOG8iVjbj0t9+SCFKexnhqqr9J6KC7z8mSgkRuSRGFt+TZYafhl
         RuVovK7Ya5x5L49NEJzXNjHu/zO4/tLsIjTj6x3kuFODbLrvUhprAiKQcAY5NpDOmnYO
         1YdNE8qf21gAjG+unD0LqDn7qTD0W7mEjEr23jtWNV4IFkk7n5KScTnU3H85tKuHwJHj
         5YBvbJv6+gdewwx05/QrobWAjst8K7Q3H2TvR86eXjG4nzxLB+spb8JY6Xyw8Di/vNe1
         j6HA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id u19-20020a05651c141300b002a77f4969bdsi332547lje.5.2023.05.19.13.40.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdV1PZnzxpl;
	Fri, 19 May 2023 22:40:46 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 15/73] tools: Convert to new CPU configuration format
Date: Fri, 19 May 2023 22:39:35 +0200
Message-Id: <20230519204033.643200-16-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This updates the config and sysfs parser as well as the config generator
to the new format.

For generating x86 configs, we are parsing /proc/cpuinfo for the initial
APIC ID and use that - in Linux order - to fill out the config template.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py  | 24 ++++++++++++++----------
 pyjailhouse/sysfs_parser.py   | 20 ++++++++++++++++++--
 tools/jailhouse-config-create | 14 +++-----------
 tools/root-cell-config.c.tmpl | 15 +++++++--------
 4 files changed, 42 insertions(+), 31 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index be0c749e..0fe30de9 100644
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
-_CONFIG_REVISION = 14
+_CONFIG_REVISION = 15
 JAILHOUSE_X86 = 0
 JAILHOUSE_ARM = 1
 JAILHOUSE_ARM64 = 2
@@ -119,6 +119,14 @@ class MemRegion:
             self.virt_address_in_region(region.virt_start)
 
 
+class Cpu:
+    _CPU_FORMAT = 'QI4x'
+    SIZE = struct.calcsize(_CPU_FORMAT)
+
+    def __init__(self, cpu_struct):
+        self.phys_id = struct.unpack_from(self._CPU_FORMAT, cpu_struct)
+
+
 class CacheRegion:
     _REGION_FORMAT = 'IIBxH'
     SIZE = struct.calcsize(_REGION_FORMAT)
@@ -161,7 +169,7 @@ class CellConfig:
              revision,
              name,
              self.flags,
-             self.cpu_set_size,
+             self.num_cpus,
              self.num_memory_regions,
              self.num_cache_regions,
              self.num_irqchips,
@@ -181,15 +189,11 @@ class CellConfig:
             self.arch = convert_arch(self.arch)
 
             cpu_set_offs = struct.calcsize(CellConfig._HEADER_FORMAT)
-            mask_array = struct.unpack_from('%dB' % self.cpu_set_size,
-                                            self.data[cpu_set_offs:])
             self.cpus = set()
-            for n in range(self.cpu_set_size):
-                for bit in range(8):
-                    if mask_array[n] & (1 << bit) != 0:
-                        self.cpus.add(n * 8 + bit)
+            for n in range(self.num_cpus):
+                self.cpus.add(Cpu(self.data[cpu_set_offs:]).phys_id)
 
-            mem_region_offs = cpu_set_offs + self.cpu_set_size
+            mem_region_offs = cpu_set_offs + self.num_cpus * Cpu.SIZE
             self.memory_regions = []
             for n in range(self.num_memory_regions):
                 self.memory_regions.append(
diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 35c59744..540f0248 100644
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
@@ -636,6 +635,18 @@ def parse_ivrs(pcidevices, ioapics):
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
@@ -647,6 +658,11 @@ def get_cpu_vendor():
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-16-ralf.ramsauer%40oth-regensburg.de.
