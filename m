Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBCWA5P3QKGQE7F3ZIVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB1520EEC2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:47:38 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id t18sf20396064wmj.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:47:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499658; cv=pass;
        d=google.com; s=arc-20160816;
        b=ehFaNN51NtjFBxBX+hnBsttu0A8we1VvqoHuoodCSzZGPMBJYvCrY1teO9fFVGZ/V/
         a/x6HsGn2HdpwkT44ybxd4kMLIYQ/GM07SB+MssREBlc3UwxFTGYOMLD8GimMbhaM+dr
         QiGWNvc3m9kH6TmzniAtzIBMUlV+KG9L8d0BY+yGS91KuL7NKSSatIa+jZP6T+DdhSo0
         f3Q+1JuDNtHD4a7eh/msF0SZSTpZAFCXHl4cEXcZywtkii2v9SzJ2QHjsu43SDGiXcM0
         pbRiae9vhhBvNU2InnupxmIbak9b/XSwK/E9ayXpQch/iL4aubauXLXr3IkDkFsjvIiF
         E0CQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=CDc+KeHu9WXEdlsDUELqNStiu4Oukopt3iTG6nk3LrU=;
        b=BkOZqggJ3cDBPQ8cCxK8xdNflBYVQlX0dEOJfRaeqTG2FsMnnI9UGt/h9EnE2Jx/du
         F9r3u1AodShgdcY8tdAy9vXajkihpUuZMEsMDrmSYYdM8pZwlN9txYYpQHSwkhVLDpxE
         x2VZzduu6GWBp65vFCakkDwrskd/UZuDqDqFjUyyAICvnug9yWA5yFrHcDuIiCvDZTaX
         ZRmnuwy8sWPC3uIRfh4YIAJzzo4QBlUEWnirdd4ojlAVTc1qW/nDe9SCIOVRJOYCSteM
         fcFkeLJS0qFshQUN842Y1goan+KAkoevNjXUjkA6rJqp31qyys7J73a0hbCan6y5oqZ5
         nFMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=WlDCqklx;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CDc+KeHu9WXEdlsDUELqNStiu4Oukopt3iTG6nk3LrU=;
        b=ZVMfCs7tJ6p2aayoZASHoytYmaRQEPI7rjYbu0SnakkOwY5DBMM349W5tzTwdV2ryL
         NTpRbK/TSk7S2z0Dl6OYLAWK8jEQJ+yjDfPY1EqLIUaClG/RIgCIckGbtl5xpiEpTZJs
         qY5owseZq5VxOZrKzcQEikDIeoexELXuA2VImcGDcwIbFqd6FaGkn/zuY7tnAZaAIWe9
         m7a1kfwCiOzI58uMRg0ExGHt71dYbniuKqhVEeeAGGemtGKmCe8bw0LQLJhXdUzY4LJE
         kbEw+ejZ98upIGQHfaDT3bKJPlOuv2QVB0cBc9I1RdNCGZlvnAvKByg1URHna+V3zr7t
         0B1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=CDc+KeHu9WXEdlsDUELqNStiu4Oukopt3iTG6nk3LrU=;
        b=eV67aT9O4WGLIRpl7doYqTutPAd86fVmiWnLuSZYwqATQx53pHsDjHUJwXcpMynOap
         HnyYSI/dEj08vV5o/ujq70OPfGQgPjzEx78dlzH0/32xEhFO4fuCxe57X8rFKZCl5/KT
         7kgeF/W+H2lCHw6L6P7zqiN4ylZekwxUR1XLbRJYpZgJ4Ek638hZAKz8xSquPBmtfOfD
         VUz7tEaq3AaN2or7K55+cpH0Y7NarJkA0DetT5p8i2u0txprp02vn7WSZxtQ7c/DNeyH
         xn0FcrJsZo1s2vDUPnXivHRrnUdzpotTBgLV+gcqGAB2+wiEJiHFKTH45UgVJp7nn5ix
         XVbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318jsMrdaV3exVlkUC/vC7m0Eghe/SQQecqIugDyQH9IZoAbFvq
	k0VZWABIzB6jIaCi0gOnNRo=
X-Google-Smtp-Source: ABdhPJyujnIYcXs/7qZtPzCyYeg0jeflsC0ffuBhU2E9peo16UANjOM2shOJqMcMpSx6pTTPWm8UiQ==
X-Received: by 2002:a7b:ce14:: with SMTP id m20mr21535234wmc.129.1593499658382;
        Mon, 29 Jun 2020 23:47:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls9739950wru.0.gmail; Mon, 29 Jun
 2020 23:47:37 -0700 (PDT)
X-Received: by 2002:a5d:4687:: with SMTP id u7mr21444819wrq.357.1593499657917;
        Mon, 29 Jun 2020 23:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499657; cv=none;
        d=google.com; s=arc-20160816;
        b=AZGoRg246e5RNDz+sCwHdUt+U583lBhpXlre5GemTGrr6vxJ31ZbU1gdS0vl0BXgF+
         86+p6jNWl0a3GNbiiCrrNdmd9HugRvCDzacrvSgY0QmtK6hxxkBNGqyl7zNtcskDpqYd
         7OULJUd2fZmjW+/3Y5+C7RbVSmgz2m9bgR6s+Hcrav0xRbQX4HFZodCKF6OJAVAkEM6C
         nV+RqdjcobXe6LJFH937EhCM/hUngJfVUvG6WEqaggkLMTRPMGFE6DfCLEIZrpdgBF8r
         Do1mtIC2yKdFIjcJohuyB/DSjkaDMsA9AUEbt364x6oOK7sgjGUKWx1DXjDJEfbwqGlY
         Z7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=PV7tvi0/DQvDVn73YAqdGKJiA5JiZoY1cBAhP5IvAZA=;
        b=Cvpnbts70WgUgzhRK1Jo1KXTDCP5EvWHNhOVIye0hSFnf1B94jPe60K6oey5+u2Dgw
         PJ52WzAhDgI+3SzjyXtP47r6RbCNxDNRNrB/DdVEPlC24f3121ZKe37REBpgf0dmXkN8
         nD1waXmS4DpFqAdv6L3+tQnm4In22/PIlVU90JB+lepCq8dskkU3vZIUVtFkAzRNwFpy
         snN2r5B8UubUlyivpeMIBztF3AwyQTMxhWx0dyD/a9SyRDYo3SoMt2QVgVkG+BTVPW0K
         yEz/Mv4lsAKmOXzrkJVF25nmyo6u9yijcGeo8gt4QHq/IZF34A/Xf7u0vgVavPXPs+7a
         8Zmw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=WlDCqklx;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id o201si109530wme.1.2020.06.29.23.47.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:47:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49ww094gSwzy76
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:47:37 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:47:37 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 09/11] pyjailhouse: config_parser: add missing components
Date: Tue, 30 Jun 2020 08:47:28 +0200
Message-ID: <20200630064730.7210-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=WlDCqklx;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

They may not be used right now but will certainly ease the usage of the
parser API in the future.

Besides I already had written them long ago, so it would be a pity to
withehld them.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 178 ++++++++++++++++++++++++++++++++---
 1 file changed, 166 insertions(+), 12 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 2a0e6ec9..75e22fad 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -190,31 +190,77 @@ class PIORegion(CStruct):
         self.length = 0
 
 
+class PciDevice(CStruct):
+    __slots__ = 'type', 'iommu', 'domain', 'bdf', 'bar_mask', '_caps_start', \
+                '_caps_num', 'num_msi_vectors', 'msi_bits', \
+                'num_msix_vectors', 'msix_region_size', 'msix_address', \
+                'shmem_regions_start', 'shmem_dev_id', 'shmem_peers', \
+                'shmem_protocol'
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT_BAR_MASK = struct.Struct('6I')
+    _BIN_FMT = struct.Struct('BBHH%usHHBBHHQIBBH' % _BIN_FMT_BAR_MASK.size)
+
+    # constructed fields
+    __slots__ += 'caps',
+
+    TYPE_DEVICE = 1
+    TYPE_BRIDGE = 2
+    TYPE_IVSHMEM = 3
+
+    @classmethod
+    def parse(cls, stream):
+        self = cls.parse_class(cls, stream)
+        self.bar_mask = cls._BIN_FMT_BAR_MASK.unpack_from(self.bar_mask)
+        return self
+
+
+class PciCapability(CStruct):
+    __slots__ = 'id', 'start', 'len', 'flags'
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=HHHH')
+
+
+class Console(CStruct):
+    __slots__ = 'address', 'size', 'type', 'flags', 'divider', 'gate_nr', \
+                'clock_reg'
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=QIHHIIQ')
+
+
 class CellConfig(CStruct):
     # slots with a '_' prefix in name are private
-    __slots__ = 'name', '_flags', 'cpu_set', \
+    __slots__ = 'name', 'flags', 'cpu_set', \
                 'memory_regions', 'cache_regions', 'irqchips', 'pio_regions', \
-                '_pci_devices', '_pci_caps', '_stream_ids', \
+                'pci_devices', '_pci_caps', 'stream_ids', \
                 'vpci_irq_base', 'cpu_reset_address',
     _BIN_FIELD_NUM = len(__slots__)
-    _BIN_FMT = struct.Struct('=32s4xIIIIIIIIIIQ8x32x')
+    _BIN_FMT = struct.Struct('=32s4xIIIIIIIIIIQ8x')
     _BIN_FMT_HDR = struct.Struct('=6sH')
-    _BIN_FMT_CPU = struct.Struct('=Q')
+    _BIN_FMT_CPU = struct.Struct('Q')
+    _BIN_FMT_STREAM_ID = struct.Struct('I')
     _BIN_SIGNATURE = b'JHCELL'
 
+    # constructed fields
+    __slots__ += 'console',
+
     def __init__(self):
         self.name = ""
+        self.flags = 0
         self.cpu_set = set()
         self.memory_regions = []
         self.irqchips = []
         self.pio_regions = []
+        self.pci_devices = []
+        self.stream_ids = []
         self.vpci_irq_base = 0
         self.cpu_reset_address = 0
+        self.console = Console()
 
     @classmethod
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
         self.name = self.name.decode().strip('\0')
+        self.console = Console.parse(stream)
 
         cpu_fmt = cls._BIN_FMT_CPU
         cpu_set_num = int(self.cpu_set / cpu_fmt.size)
@@ -233,30 +279,138 @@ class CellConfig(CStruct):
         self.pio_regions = \
             cls.parse_array(PIORegion, self.pio_regions, stream)
 
+        self.pci_devices = cls.parse_array(PciDevice, self.pci_devices, stream)
+        pci_caps = cls.parse_array(PciCapability, self._pci_caps, stream)
+        for pci_dev in self.pci_devices:
+            start = pci_dev._caps_start
+            end = start + pci_dev._caps_num
+            pci_dev.caps = pci_caps[start:end]
+
+        sid_fmt = cls._BIN_FMT_STREAM_ID
+        sid_num = self.stream_ids
+        self.stream_ids = []
+        for i in range(sid_num):
+            self.stream_ids += [sid_fmt.unpack_from(stream.read(sid_fmt.size))]
+
+        return self
+
+
+class IommuAmd(CStruct):
+    __slots__ = 'bdf', 'base_cap', 'msi_cap', 'features'
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=HBBI')
+
+
+class IommuPvu(CStruct):
+    __slots__ = 'tlb_base', 'tlb_size'
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=QI')
+
+
+class Iommu(CStruct):
+    __slots__ = 'type', 'base', 'size',
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=IQI')
+
+    # constructed fields
+    __slots__ += 'subtype',
+
+    _MAX_UNITS = 8
+
+    TYPE_AMD = 1
+    TYPE_INTEL = 2
+    TYPE_SMMUV3 = 3
+    TYPE_PVU = 4
+
+    @classmethod
+    def parse(cls, stream):
+        self = cls.parse_class(cls, stream)
+        sub_cls = None
+        if self.type == cls.TYPE_AMD:
+            sub_cls = IommuAmd
+        elif self.type == cls.TYPE_PVU:
+            sub_cls = IommuPvu
+
+        if sub_cls:
+            self.subtype = sub_cls.parse(stream)
+
+        # skip rest of the C union, if needed
+        skip = max(IommuAmd._BIN_FMT.size, IommuPvu._BIN_FMT.size) \
+            - (sub_cls._BIN_FMT.size if sub_cls else 0)
+        stream.seek(skip, io.SEEK_CUR)
+        return self
+
+
+class PlattformInfoArm(CStruct):
+    __slots__ = 'maintenance_irq', 'gic_version', \
+                'gicd_base', 'gicc_base', 'gich_base', 'gicv_base', 'gicr_base',
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=BB2xQQQQQ')
+
+
+class PlattformInfoX86(CStruct):
+    __slots__ = 'pm_timer_address', 'vtd_interrupt_limit', 'apic_mode', \
+                'tsc_khz', 'apic_khz',
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=HIB1xII')
+
+
+class PlattformInfo(CStruct):
+    __slots__ = 'pci_mmconfig_base', 'pci_mmconfig_end_bus', \
+                'pci_is_virtual', 'pci_domain',
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('=QBBH')
+
+    # constructed fields
+    __slots__ += 'iommus', 'arch_info',
+
+    def __init__(self, arch_info_cls=PlattformInfoX86):
+        self.pci_mmconfig_base = 0
+        self.pci_mmconfig_end_bus = 0
+        self.pci_is_virtual = 0
+        self.pci_domain = 0
+        self.iommus = []
+        self.arch_info = arch_info_cls()
+
+    @classmethod
+    def parse(cls, stream, arch_info_cls=PlattformInfoX86):
+        self = cls.parse_class(cls, stream)
+        self.iommus = cls.parse_array(Iommu, Iommu._MAX_UNITS, stream)
+        self.arch_info = arch_info_cls.parse(stream)
+
+        # skip rest of the C union, if needed
+        skip = \
+            max(PlattformInfoArm._BIN_FMT.size, PlattformInfoX86._BIN_FMT.size)\
+            - arch_info_cls._BIN_FMT.size
+        stream.seek(skip, io.SEEK_CUR)
         return self
 
 
 class SystemConfig(CStruct):
-    _BIN_FMT = struct.Struct('=4x')
-    # ...followed by MemRegion as hypervisor memory
-    _BIN_FMT_CONSOLE_AND_PLATFORM = struct.Struct('32x12x224x44x')
+    __slots__ = 'flags',
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT = struct.Struct('I')
     _BIN_SIGNATURE = b'JHSYST'
 
     # constructed fields
-    __slots__ = 'hypervisor_memory', 'root_cell',
+    __slots__ += 'hypervisor_memory', 'debug_console', 'platform_info', \
+                 'root_cell',
 
     def __init__(self):
+        self.flags = 0
         self.hypervisor_memory = MemRegion()
+        self.debug_console = Console()
+        self.platform_info = PlattformInfo()
         self.root_cell = CellConfig()
 
     @classmethod
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
         self.hypervisor_memory = MemRegion.parse(stream)
-
-        offs = cls._BIN_FMT_CONSOLE_AND_PLATFORM.size
-        offs += CellConfig._BIN_FMT_HDR.size # skip header inside rootcell
-        stream.seek(offs, io.SEEK_CUR)
+        self.debug_console = Console.parse(stream)
+        self.platform_info = PlattformInfo.parse(stream)
+        # skip header inside rootcell
+        stream.seek(CellConfig._BIN_FMT_HDR.size, io.SEEK_CUR)
         self.root_cell = CellConfig.parse(stream)
         return self
 
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064730.7210-1-andrej.utz%40st.oth-regensburg.de.
