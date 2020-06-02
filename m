Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTV63H3AKGQEOSZA3FA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BD1EBDCF
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:47 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id do21sf371334ejc.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107407; cv=pass;
        d=google.com; s=arc-20160816;
        b=S2AO906z2w7Lp5P5vQtCfV8V498sPRA/yIQ241ALj7l/mLrGa37CtwD0FNc7m+Gi1n
         XFuAw73v7DY1EUd77+KErd1kV2pRTuIErU5ghdbWZ//1zGq4R2BokRLEWy8mLY5OGoEU
         CmMaUFeWj5WbnaDVmzozVbYS023WCKWB0xycowzqZ/c77sSr9KXyWl7gpvsB3YAz2dTo
         7HMQmXJAMvZtbhmPGz1uRglZAP21CH7EnSSCni7VaH9qibTBTC2JyLxQoFkX5S6iqUUX
         +PkLgIPxu5uCCTnwA35z85q4ENVqusbp7e+QBNi4AXVSiA5rdu0MgYOnnzqVinaFaTet
         K4dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=ofmC+8+jgvA4m56pjQs03lrjmJAOod4MwpOfYoGN9aY=;
        b=Gab4FoSPRKHivabNXm/mI7l2x4D5AbGxrs4mgPyPZoyuSzJYFbjdveeqBntZa71i/G
         4t1AIGeWmYiNpYjP/CmxZv7uf/rjuIB/wc7dhsvN02BLIr9bym8nSCbveTFJUDNqd/vJ
         QndI07pUddPdOfayPOCj/KSpIWaV/i1SU0L5WeoyWZfUJSWRDhhPExdkugeyCiZT8cOy
         SAirJVOeHfST0Fbk5kvvcVf6p88uPbHn5/MnOVIWGAT9h2W2Xzpn7Dp/kxWJfcnvQ0Pr
         NJ4T3qPgoskFfTHegSxxvU2ap23lt9LAO2U/YGYWYNo/jtws49ZX4uoiVC4Tz9AGmy5K
         vM9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ofmC+8+jgvA4m56pjQs03lrjmJAOod4MwpOfYoGN9aY=;
        b=pWoD5jiI8visRRiqKDiQkpm7JQNYRuewVBjUfGd0i85J9eUhWNwdBm0xv458/PN3Z3
         q8K2ktWj8ndRnogZ+pl298c6dDOcAZ+5ExdayVT3aKaDijz0pnXKnZa+AmxlxJMcP9Vs
         sGCJeh1a9/Eyu+enDd29b1mJC2bpJw8lPsm6hV709zUdACbWn59fuCg7ZLYfBY6XkYTI
         gaQhxKdqbE9yGmjRlVWhx099At2zRhQ0EB63KFjei8WVd7H7nTPJjH+Vkrge5BJ4aEE1
         iUm6QqG0fTpjkLccdVzfjDao0bUPaDqbrF+88QhFcQbsyPKdqehaBiPdS8bWmiJpInf6
         2ygg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ofmC+8+jgvA4m56pjQs03lrjmJAOod4MwpOfYoGN9aY=;
        b=L754wc0Ln3E8MZJf7NetN36zxDuFHcnk/4teACxKmrSRH4zDK4YX1zBW0GtseNZqLp
         D3x8mRzx9WKRyTQWr2DuRABwOGsxfeS4mDCFd8MWyPL4AMQEbRLx0q2x8jz++00bTdL0
         tikABUo/rLfWGDvgMriIjJKjGVQrUZewJvgfnob1P4iSJQes3CNiZkV4YaUVc3WKJI7h
         h+V1bMamHGLu406ISCwfgCrdmDm0DM7+rK7QGBfpQl62STTJU/MAht2gx6MWbWXYkZHM
         t0RSsbu/T6S05RE50kPGW7sTMO16JawpqnbgAP+2k7YZ/kQBYNAMuXjfCANX6vYqvB4Y
         q4oQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WR+MLdTe+ujeRKtB3+7Tx11Gc2O8QmmTOerxP4H316caPBzIn
	J/HRGJN+3h30gyuHgLYBoCo=
X-Google-Smtp-Source: ABdhPJxwR/8QZX+PNG9H4FFu7Xg8EzJ6ZgxGxjDf4PF+RzOvHr3BsYtBfR+SHUWeB6e+v3vIzP01AA==
X-Received: by 2002:a05:6402:2070:: with SMTP id bd16mr556150edb.35.1591107407175;
        Tue, 02 Jun 2020 07:16:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:43c0:: with SMTP id ok24ls7442906ejb.8.gmail; Tue,
 02 Jun 2020 07:16:46 -0700 (PDT)
X-Received: by 2002:a17:906:148b:: with SMTP id x11mr24413786ejc.282.1591107406255;
        Tue, 02 Jun 2020 07:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107406; cv=none;
        d=google.com; s=arc-20160816;
        b=T2L1dDdrP5MMCPEM86+aI5Xdw406QyDMXXpM5OaHKWu54LMAKOn2T3w5oPVAjiz8fO
         +TxAVdwFspMtObLMrLUq28Ug6C1JK4VCjfiiNyfNC6ivIwyFC3GadtgyHC2UNqsGgKxF
         kz4SDT4+9KsZEFuGx7dAL1QWqDwiK9WnQQMXu9s/PBBq545aHX4Sybk47E9h3tEnOZnH
         2129NX8bTTlNl9nm71z9NnFcNCHD6+lZVTSlIqisJKEZI6nUMBflspVFe8y8hJ/KBfir
         AvP3NxpM5/xIM2JuM2Y0gc3PLf714qs5ji+alJeo+jbyM3VpC9R+6qAapyGWy8LXgNw5
         HC/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Waw3Z6jIwmS4hneTb9YQ/2y2zT4/iMqIVE7sBjKmWgU=;
        b=Ht4l3w7Kqi/UxIOd1PCLaq0UwdfA9Dl5A8sl48dIyyd+tBX8IZDvC6OuK8M2XNJG9T
         JJTBYHpNM/6aAioYsyR7K13vo43h9etMhgeEiqM6NSMZI8HipT6+Ebw7LnefoIdoiZAL
         8ofB/Oe+vbxJAddqfVJ08kv2ywpqBPRq9jsclGhKXoixP3ZWPL2Q7WvTNnf4r6cfNevN
         k3rLOs6K3e0XLrBGQ+aTuzvf76NUKcQ7/bACi0MlBXwth12PDiawSu7xsIhKwR/2Hl8J
         dtHs/fonGGeoRi2aWa/QVhStstthTlKZ+aRqFPrSE0+TLn+fYL6+RaDLdJahcADqFffM
         ARKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id bt20si154815edb.2.2020.06.02.07.16.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 052EGj2L014580
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:45 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdD028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:44 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 04/15] pyjailhouse: Factor out cell config parser
Date: Tue,  2 Jun 2020 16:16:27 +0200
Message-Id: <6fbce3c73e1a2d6df85e1496931bb7cbf6155574.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Move the cell configuration parsing classes from jailhouse-cell-linux
into a pyjailhouse module. This will allow reusing the code for the
upcoming config checker.

CellConfig must not terminate the caller anymore but rather raise a
RuntimeError if parsing fails. This can be handled properly by the
caller.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 include/jailhouse/cell-config.h |   2 +-
 pyjailhouse/config_parser.py    | 137 ++++++++++++++++++++++++++++++
 tools/jailhouse-cell-linux      | 146 ++++----------------------------
 3 files changed, 154 insertions(+), 131 deletions(-)
 create mode 100644 pyjailhouse/config_parser.py

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 3dfa4df1..47fc251f 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -48,7 +48,7 @@
 
 /*
  * Incremented on any layout or semantic change of system or cell config.
- * Also update HEADER_REVISION in tools.
+ * Also update formats and HEADER_REVISION in pyjailhouse/config_parser.py.
  */
 #define JAILHOUSE_CONFIG_REVISION	13
 
diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
new file mode 100644
index 00000000..0454c0a7
--- /dev/null
+++ b/pyjailhouse/config_parser.py
@@ -0,0 +1,137 @@
+#
+# Jailhouse, a Linux-based partitioning hypervisor
+#
+# Copyright (c) Siemens AG, 2015-2020
+#
+# Authors:
+#  Jan Kiszka <jan.kiszka@siemens.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.  See
+# the COPYING file in the top-level directory.
+#
+# This script should help to create a basic jailhouse configuration file.
+# It needs to be executed on the target machine, where it will gather
+# information about the system. For more advanced scenarios you will have
+# to change the generated C-code.
+
+from __future__ import print_function
+import struct
+
+# Keep the whole file in sync with include/jailhouse/cell-config.h.
+_CONFIG_REVISION = 13
+
+
+class MemRegion:
+    JAILHOUSE_MEM_READ = 0x0001
+    JAILHOUSE_MEM_WRITE = 0x0002
+    JAILHOUSE_MEM_EXECUTE = 0x0004
+    JAILHOUSE_MEM_DMA = 0x0008
+    JAILHOUSE_MEM_IO = 0x0010
+    JAILHOUSE_MEM_COMM_REGION = 0x0020
+    JAILHOUSE_MEM_ROOTSHARED = 0x0080
+
+    _REGION_FORMAT = 'QQQQ'
+    SIZE = struct.calcsize(_REGION_FORMAT)
+
+    def __init__(self, region_struct):
+        (self.phys_start,
+         self.virt_start,
+         self.size,
+         self.flags) = \
+            struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
+
+    def is_ram(self):
+        return ((self.flags & (MemRegion.JAILHOUSE_MEM_READ |
+                               MemRegion.JAILHOUSE_MEM_WRITE |
+                               MemRegion.JAILHOUSE_MEM_EXECUTE |
+                               MemRegion.JAILHOUSE_MEM_DMA |
+                               MemRegion.JAILHOUSE_MEM_IO |
+                               MemRegion.JAILHOUSE_MEM_COMM_REGION |
+                               MemRegion.JAILHOUSE_MEM_ROOTSHARED)) ==
+                (MemRegion.JAILHOUSE_MEM_READ |
+                 MemRegion.JAILHOUSE_MEM_WRITE |
+                 MemRegion.JAILHOUSE_MEM_EXECUTE |
+                 MemRegion.JAILHOUSE_MEM_DMA))
+
+    def is_comm_region(self):
+        return (self.flags & MemRegion.JAILHOUSE_MEM_COMM_REGION) != 0
+
+
+class CacheRegion:
+    _REGION_FORMAT = 'IIBxH'
+    SIZE = struct.calcsize(_REGION_FORMAT)
+
+
+class Irqchip:
+    _IRQCHIP_FORMAT = 'QIIQQ'
+    SIZE = struct.calcsize(_IRQCHIP_FORMAT)
+
+    def __init__(self, irqchip_struct):
+        (self.address,
+         self.id,
+         self.pin_base,
+         self.pin_bitmap_lo,
+         self.pin_bitmap_hi) = \
+            struct.unpack_from(self._IRQCHIP_FORMAT, irqchip_struct)
+
+    def is_standard(self):
+        return self.address == 0xfec00000
+
+
+class PIORegion:
+    _REGION_FORMAT = 'HH'
+    SIZE = struct.calcsize(_REGION_FORMAT)
+
+    def __init__(self, pio_struct):
+        (self.base, self.length) = struct.unpack_from(self._REGION_FORMAT,
+                                                      pio_struct)
+
+
+class CellConfig:
+    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
+
+    def __init__(self, data):
+        self.data = data
+
+        (signature,
+         revision,
+         name,
+         self.flags,
+         self.cpu_set_size,
+         self.num_memory_regions,
+         self.num_cache_regions,
+         self.num_irqchips,
+         self.num_pio_regions,
+         self.num_pci_devices,
+         self.num_pci_caps,
+         self.num_stream_ids,
+         self.vpci_irq_base,
+         self.cpu_reset_address) = \
+            struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
+        if str(signature.decode()) != 'JHCELL':
+            raise RuntimeError('Not a cell configuration')
+        if revision != _CONFIG_REVISION:
+            raise RuntimeError('Configuration file revision mismatch')
+        self.name = str(name.decode())
+
+        mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
+            self.cpu_set_size
+        self.memory_regions = []
+        for n in range(self.num_memory_regions):
+            self.memory_regions.append(
+                MemRegion(self.data[mem_region_offs:]))
+            mem_region_offs += MemRegion.SIZE
+
+        irqchip_offs = mem_region_offs + \
+            self.num_cache_regions * CacheRegion.SIZE
+        self.irqchips = []
+        for n in range(self.num_irqchips):
+            self.irqchips.append(
+                Irqchip(self.data[irqchip_offs:]))
+            irqchip_offs += Irqchip.SIZE
+
+        pioregion_offs = irqchip_offs
+        self.pio_regions = []
+        for n in range(self.num_pio_regions):
+            self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
+            pioregion_offs += PIORegion.SIZE
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index de09154a..8c07fd0c 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -20,6 +20,7 @@ import sys
 # Imports from directory containing this must be done before the following
 sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
 from pyjailhouse.cell import JailhouseCell
+import pyjailhouse.config_parser as config_parser
 
 libexecdir = None
 
@@ -498,134 +499,6 @@ def resolve_arch(defined_arch=None):
     return arch_class()
 
 
-class MemoryRegion:
-    JAILHOUSE_MEM_READ = 0x0001
-    JAILHOUSE_MEM_WRITE = 0x0002
-    JAILHOUSE_MEM_EXECUTE = 0x0004
-    JAILHOUSE_MEM_DMA = 0x0008
-    JAILHOUSE_MEM_IO = 0x0010
-    JAILHOUSE_MEM_COMM_REGION = 0x0020
-    JAILHOUSE_MEM_ROOTSHARED = 0x0080
-
-    E820_RAM = 1
-    E820_RESERVED = 2
-
-    _REGION_FORMAT = 'QQQQ'
-    SIZE = struct.calcsize(_REGION_FORMAT)
-
-    def __init__(self, region_struct):
-        (self.phys_start,
-         self.virt_start,
-         self.size,
-         self.flags) = \
-            struct.unpack_from(MemoryRegion._REGION_FORMAT, region_struct)
-
-    def is_ram(self):
-        return ((self.flags & (MemoryRegion.JAILHOUSE_MEM_READ |
-                               MemoryRegion.JAILHOUSE_MEM_WRITE |
-                               MemoryRegion.JAILHOUSE_MEM_EXECUTE |
-                               MemoryRegion.JAILHOUSE_MEM_DMA |
-                               MemoryRegion.JAILHOUSE_MEM_IO |
-                               MemoryRegion.JAILHOUSE_MEM_COMM_REGION |
-                               MemoryRegion.JAILHOUSE_MEM_ROOTSHARED)) ==
-                (MemoryRegion.JAILHOUSE_MEM_READ |
-                 MemoryRegion.JAILHOUSE_MEM_WRITE |
-                 MemoryRegion.JAILHOUSE_MEM_EXECUTE |
-                 MemoryRegion.JAILHOUSE_MEM_DMA))
-
-    def is_comm_region(self):
-        return (self.flags & MemoryRegion.JAILHOUSE_MEM_COMM_REGION) != 0
-
-    def as_e820(self):
-        return struct.pack('QQI', self.virt_start, self.size,
-                           MemoryRegion.E820_RAM if self.is_ram() else
-                           MemoryRegion.E820_RESERVED)
-
-
-class CacheRegion:
-    _REGION_FORMAT = 'IIBxH'
-    SIZE = struct.calcsize(_REGION_FORMAT)
-
-
-class Irqchip:
-    _IRQCHIP_FORMAT = 'QIIQQ'
-    SIZE = struct.calcsize(_IRQCHIP_FORMAT)
-
-    def __init__(self, irqchip_struct):
-        (self.address,
-         self.id,
-         self.pin_base,
-         self.pin_bitmap_lo,
-         self.pin_bitmap_hi) = \
-            struct.unpack_from(self._IRQCHIP_FORMAT, irqchip_struct)
-
-    def is_standard(self):
-        return self.address == 0xfec00000
-
-
-class PIORegion:
-    _REGION_FORMAT = 'HH'
-    SIZE = struct.calcsize(_REGION_FORMAT)
-
-    def __init__(self, pio_struct):
-        (self.base, self.length) = struct.unpack_from(self._REGION_FORMAT, \
-                                                      pio_struct)
-
-
-class Config:
-    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
-    _HEADER_REVISION = 13
-
-    def __init__(self, config_file):
-        self.data = config_file.read()
-
-        (signature,
-         revision,
-         name,
-         self.flags,
-         self.cpu_set_size,
-         self.num_memory_regions,
-         self.num_cache_regions,
-         self.num_irqchips,
-         self.num_pio_regions,
-         self.num_pci_devices,
-         self.num_pci_caps,
-         self.num_stream_ids,
-         self.vpci_irq_base,
-         self.cpu_reset_address) = \
-            struct.unpack_from(Config._HEADER_FORMAT, self.data)
-        if str(signature.decode()) != 'JHCELL':
-            print('Not a cell configuration: %s' % config_file.name,
-                  file=sys.stderr)
-            exit(1)
-        if revision != Config._HEADER_REVISION:
-            print('Configuration file revision mismatch', file=sys.stderr)
-            exit(1)
-        self.name = str(name.decode())
-
-        mem_region_offs = struct.calcsize(Config._HEADER_FORMAT) + \
-            self.cpu_set_size
-        self.memory_regions = []
-        for n in range(self.num_memory_regions):
-            self.memory_regions.append(
-                MemoryRegion(self.data[mem_region_offs:]))
-            mem_region_offs += MemoryRegion.SIZE
-
-        irqchip_offs = mem_region_offs + \
-            self.num_cache_regions * CacheRegion.SIZE
-        self.irqchips = []
-        for n in range(self.num_irqchips):
-            self.irqchips.append(
-                Irqchip(self.data[irqchip_offs:]))
-            irqchip_offs += Irqchip.SIZE
-
-        pioregion_offs = irqchip_offs
-        self.pio_regions = []
-        for n in range(self.num_pio_regions):
-            self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
-            pioregion_offs += PIORegion.SIZE
-
-
 # see linux/Documentation/x86/boot.txt
 class X86SetupHeader:
     BASE_OFFSET = 0x1f0
@@ -707,6 +580,14 @@ def get_kernel_compression_method(payload_magic):
         return 'unknown'
 
 
+def mem_region_as_e820(mem):
+    E820_RAM = 1
+    E820_RESERVED = 2
+
+    return struct.pack('QQI', mem.virt_start, mem.size,
+                       E820_RAM if mem.is_ram() else E820_RESERVED)
+
+
 # see linux/Documentation/x86/zero-page.txt
 class X86ZeroPage:
     def __init__(self, kernel_image, initrd, kernel_decomp_factor, config):
@@ -770,7 +651,7 @@ class X86ZeroPage:
             bytearray(0x2d0 - X86SetupHeader.BASE_OFFSET -
                       self.setup_header.size)
         for region in self.e820_entries:
-            data += region.as_e820()
+            data += mem_region_as_e820(region)
         return data + bytearray(0x1000 - len(data))
 
 
@@ -835,7 +716,12 @@ except IOError as e:
     exit(1)
 
 arch = resolve_arch(args.arch)
-config = Config(args.config)
+
+try:
+    config = config_parser.CellConfig(args.config.read())
+except RuntimeError as e:
+    print(str(e) + ": " + args.config.name, file=sys.stderr)
+    exit(1)
 
 arch.setup(args, config)
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/6fbce3c73e1a2d6df85e1496931bb7cbf6155574.1591107398.git.jan.kiszka%40siemens.com.
