Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB46P3P7QKGQEIXRTDTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc40.google.com (mail-oo1-xc40.google.com [IPv6:2607:f8b0:4864:20::c40])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B812ECE31
	for <lists+jailhouse-dev@lfdr.de>; Thu,  7 Jan 2021 11:52:37 +0100 (CET)
Received: by mail-oo1-xc40.google.com with SMTP id h20sf4041732oop.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 07 Jan 2021 02:52:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610016755; cv=pass;
        d=google.com; s=arc-20160816;
        b=t0Q6KVrr+Uaq2I/L3KHQiRrDNJCZpkTdWPdi0uuB/jzG+9UgglnnHdt5YlDDgcCp6+
         cSfpyP9JwmzYXlrmbcz6j1vW6wwm4bY3KNVnq0UqRmsqgB6JUj4xiAOXIbO9SExJnamU
         UNZywYWxbIZTVVI7f/IbfbgOGlm1/GMH5k2LxBlR4fKtHz9fiH0lb7Rx678b5L7FoFqz
         8D/zWZAIVbXRfuoMgvAqhpL1eMIhZP3pBWmKrfTyX2ipSnDbSuk3YcASeTlP5oEQnfg+
         jQ9EsDHxx3PYiR8qTbxQcTYnMI+pyAUC5tMPAlGS/Tejjj285C/JCCiIf9j8wVJ8fN5X
         RpeA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=/DD3b7zUGdmPgTIuGdJyuV+nHDGx26guqgdjEI0aBOo=;
        b=KjhhknC+GyQy7bLq2Oci75RmPstkteB+pUBUK0NhM1mk/ZliOgaXe9HHXqPBemb7TJ
         2ZlL3AxZis5Vt0UoOv3GmifnU7kiYVxGeRlTGtUklD7SJIX6857+58Ebg6zxA0lHroXg
         7XuABWGpykEBugjs12bXC91glxSDWyhqUQcW4i4fARhS/LFwD9urKRdqZSyP7cu5kvLE
         2q8eqv3as82hBTaM1BBCQsih8F4ECxdjUUMuCPTgO6Sub8m4sEnL4PjX9eLDVTB5kz58
         NEoYFUpXnqZDeaOTwNVdCEVbCDyZTqYe0cKdUOrMwUGkRC1I4MLV2hkC/T8elb3eUztl
         gcSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/DD3b7zUGdmPgTIuGdJyuV+nHDGx26guqgdjEI0aBOo=;
        b=Ib/abJVV4aMEGKOTS/0UpFqakaQ7hbts0BGC1YcqjF9V/cDGnzgoKhlpvAjNnS/RAA
         die6MUAsAKYvTFRdEYuPlcJfuLqyvzsJyDfpsWFAmk9c8qN/7H4XmAd2cPWf/40zUS7Z
         KJeBtvB+OyaKfCZVtFeJjsu+NyrpFTXjAopzcYqRskL5gvs2xJyS9mXtwIyBkyhDeA+M
         Qp2h/1/UmwyNLUDDBJbeLd6p+6MfLiHJbsnK9lf9hrRN8G9S/jrqRMuJqLNRycLfNkgK
         Dod9cDKiCnqQw1EClqjZfkNKeEI97HN5V8a86Ze8j5qpfLUZW9E64Wsrqo8DX4yiBRkn
         Tajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/DD3b7zUGdmPgTIuGdJyuV+nHDGx26guqgdjEI0aBOo=;
        b=gS0zWVU54JmB1s+3FWlTRXYG8i5L6Xt8sABxhS8hBZ2v5C+L9SxvbHgjXlnINtU1fk
         gB9VzvxoZciHHgplLp4AHSO2tg+T+nsb7u0zt0FAB1xCZKLtn+3+ns5z6RnzrrjsRUcB
         GR3O2Czf7YZfp9Hc9kdG5tFpuIAxJ01ZqwagDXyEqGDksvWd+wr+KMXC8th5jJitlJXk
         H0Q4EnxMXDtjsSpZYr87yGXVKNwgHaRZq3JTz7j/iMOHje1GItw/OvMj4Qgxnh7EddIP
         jOnqmtxrO4dO+l6ox4/5tinpL0XOC+WwFyj+vjaLjxvyQwX+OXsh0SpCevrE+A/uAIeX
         PXUQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Ebg6h0GRg0x3BCi0aM0BVkgTRCeuuxvtXO7IT7apfAs7793L/
	XiRJR5WwWiHppqXSQJdxPqw=
X-Google-Smtp-Source: ABdhPJx0/FNiOBw3XG+FveTwb/VBDjv0EaVegIjjEcNiz284nsQL0c25yC4xNEIAI8ZI4ZiCbNhlww==
X-Received: by 2002:a9d:27ea:: with SMTP id c97mr5962205otb.173.1610016755638;
        Thu, 07 Jan 2021 02:52:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:aad2:: with SMTP id t201ls1730524oie.1.gmail; Thu, 07
 Jan 2021 02:52:35 -0800 (PST)
X-Received: by 2002:a05:6808:650:: with SMTP id z16mr938557oih.50.1610016755045;
        Thu, 07 Jan 2021 02:52:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610016755; cv=none;
        d=google.com; s=arc-20160816;
        b=kioDuJ7cg2Ac6W581+b2oLGrSCgy4mkQKwDDI4KHkEiTBklOdIgGXs7WbnPHcZX9b2
         KwOs6xkYVM2IvKRJMTwtfhe98siiKH54xOoWzRp99Px+jpUEk+PCexvzSFknmg+W0RPe
         ECj3ISLAJygTXXEnvErMRvEhEHiCSr0ZmZ+rc+t6SZnWCIZEUo8cXxNme1euVKphlfh8
         4jvCkj30+1PZG1XQWPXS2oNkUzlJWVrr+BpSC8P01r4e3NIDYXiEr+aRzlmaR1Iw3ht1
         A95PWqeCs/xbKNxksqvBb57ln7IowK2uFQoM2ndly46J1e7KY91LaLaQSniPPx6Qpala
         6GPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=qixrq4xptE9VyZeIapYod3Lju1pjrzhWlJZB5js+jRI=;
        b=RBIFTkuBnY2QCGisOML194JbJt4lS2Ayta4+K6Ida2Y15boqntiuAC+z0BGD3nBe2H
         yjUZhKxpEh3dM0ftrNrAggGMfRjKsrCT/onrzRgHD4ydrMI9yTNJ5bReW2dVF8SrmX8w
         2kj6MmCYM+GKlybgRYhe6hLME87mXqwmNidTUu3h7hLlREnOyPR/OZVcfEXyHqujmdlo
         xLP5v1B3cO1tA3WgwavQZ2lL+rSeifNwsBbkeQvFANfH2ulGa0rsFCyxTuod8FVsyhhJ
         jszHF2xkiwZPc7Zf8ZV0sll47yHsM7YrwBzHxAHuimWbDGCN3BRtyfSIQ93kT/FuFDDK
         NM5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id s126si385297ooa.0.2021.01.07.02.52.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Jan 2021 02:52:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 107AqXX9010716
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:33 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.120])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 107AqWd8019377
	for <jailhouse-dev@googlegroups.com>; Thu, 7 Jan 2021 11:52:32 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 1/3] pyjailhouse: config_parser: Enhance parsing of system config
Date: Thu,  7 Jan 2021 11:52:30 +0100
Message-Id: <e1e43c088f907c8ce740e046a2d5c573c44eb590.1610016752.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1610016752.git.jan.kiszka@siemens.com>
References: <cover.1610016752.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Parse PCI, IOMMU and architecture-specific resources. This will be used
by the config checker.

The SystemConfig constructor gains an additional argument, the target
architecture, which is not yet used by the config checker, thus left as
None.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/config_parser.py | 89 ++++++++++++++++++++++++++++++++++--
 tools/jailhouse-config-check |  2 +-
 2 files changed, 85 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 47350c6f..cad761a5 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -190,29 +190,108 @@ class CellConfig:
                                ('root ' if root_cell else ''))
 
 
+class JAILHOUSE_IOMMU(ExtendedEnum, int):
+    _ids = {
+        'UNUSED':     0,
+        'AMD':        1,
+        'INTEL':      2,
+        'SMMUV3':     3,
+        'TIPVU':      4,
+        'ARM_MMU500': 5,
+    }
+
+
+class IOMMU:
+    _IOMMU_HEADER_FORMAT = '=IQI'
+    _IOMMU_AMD_FORMAT = '=HBBI2x'
+    _IOMMU_TIPVU_FORMAT = '=QI'
+    _IOMMU_OTHER_FORMAT = '12x'
+    SIZE = struct.calcsize(_IOMMU_HEADER_FORMAT + _IOMMU_OTHER_FORMAT)
+
+    def __init__(self, iommu_struct):
+        (self.type,
+         self.base,
+         self.size) = \
+            struct.unpack_from(self._IOMMU_HEADER_FORMAT, iommu_struct)
+
+        offs = struct.calcsize(self._IOMMU_HEADER_FORMAT)
+        if self.type == JAILHOUSE_IOMMU.AMD:
+            (self.amd_bdf,
+             self.amd_base_cap,
+             self.amd_msi_cap,
+             self.amd_features) = \
+                struct.unpack_from(self._IOMMU_AMD_FORMAT, iommu_struct[offs:])
+        elif self.type == JAILHOUSE_IOMMU.TIPVU:
+            (self.tipvu_tlb_base,
+             self.tipvu_tlb_size) = \
+                struct.unpack_from(self._IOMMU_TIPVU_FORMAT,
+                                   iommu_struct[offs:])
+        elif not self.type in (JAILHOUSE_IOMMU.UNUSED,
+                               JAILHOUSE_IOMMU.INTEL,
+                               JAILHOUSE_IOMMU.SMMUV3,
+                               JAILHOUSE_IOMMU.ARM_MMU500):
+            raise RuntimeError('Unknown IOMMU type: %d' % self.type)
+
+
 class SystemConfig:
     _HEADER_FORMAT = '=6sH4x'
     # ...followed by MemRegion as hypervisor memory
-    _CONSOLE_AND_PLATFORM_FORMAT = '32x12x224x44x'
+    _CONSOLE_FORMAT = '32x'
+    _PCI_FORMAT = '=QBBH'
+    _NUM_IOMMUS = 8
+    _ARCH_ARM_FORMAT = '=BB2xQQQQQ'
+    _ARCH_X86_FORMAT = '=HBxIII28x'
 
-    def __init__(self, data):
+    def __init__(self, data, arch):
         self.data = data
 
         try:
             (signature,
              revision) = \
-                struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
+                struct.unpack_from(self._HEADER_FORMAT, self.data)
 
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
 
-            offs = struct.calcsize(SystemConfig._HEADER_FORMAT)
+            offs = struct.calcsize(self._HEADER_FORMAT)
             self.hypervisor_memory = MemRegion(self.data[offs:])
 
             offs += struct.calcsize(MemRegion._REGION_FORMAT)
-            offs += struct.calcsize(SystemConfig._CONSOLE_AND_PLATFORM_FORMAT)
+            offs += struct.calcsize(self._CONSOLE_FORMAT)
+            (self.pci_mmconfig_base,
+             self.pci_mmconfig_end_bus,
+             self.pci_is_virtual,
+             self.pci_domain) = \
+                 struct.unpack_from(self._PCI_FORMAT, self.data[offs:])
+
+            offs += struct.calcsize(self._PCI_FORMAT)
+            self.iommus = []
+            for n in range(self._NUM_IOMMUS):
+                iommu = IOMMU(self.data[offs:])
+                if iommu.type != JAILHOUSE_IOMMU.UNUSED:
+                    self.iommus.append(iommu)
+                offs += IOMMU.SIZE
+
+            if arch in ('arm', 'arm64'):
+                (self.arm_maintenance_irq,
+                 self.arm_gic_version,
+                 self.arm_gicd_base,
+                 self.arm_gicc_base,
+                 self.arm_gich_base,
+                 self.arm_gicv_base,
+                 self.arm_gicr_base) = \
+                     struct.unpack_from(self._ARCH_ARM_FORMAT, self.data[offs:])
+            elif arch == 'x86':
+                (self.x86_pm_timer_address,
+                 self.x86_apic_mode,
+                 self.x86_vtd_interrupt_limit,
+                 self.x86_tsc_khz,
+                 self.x86_apic_khz) = \
+                     struct.unpack_from(self._ARCH_X86_FORMAT, self.data[offs:])
+
+            offs += struct.calcsize(self._ARCH_ARM_FORMAT)
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
 
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 12d3dbce..59e8199e 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -44,7 +44,7 @@ except IOError as e:
 print("Reading configuration set:")
 
 try:
-    sysconfig = config_parser.SystemConfig(args.syscfg.read())
+    sysconfig = config_parser.SystemConfig(args.syscfg.read(), None)
     root_cell = sysconfig.root_cell
 except RuntimeError as e:
     print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e1e43c088f907c8ce740e046a2d5c573c44eb590.1610016752.git.jan.kiszka%40siemens.com.
