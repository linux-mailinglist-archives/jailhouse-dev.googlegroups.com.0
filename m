Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXXGXX4AKGQEU5S2LXA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id C82852216ED
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:34 +0200 (CEST)
Received: by mail-lj1-x23a.google.com with SMTP id x2sf586903ljh.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848094; cv=pass;
        d=google.com; s=arc-20160816;
        b=EC5v11Bn7Hy9yrKJKsCzbPugoXQwwUjHuU02/Z7CcGZWxiL+PImcWWR7iq3qLGD280
         PWguOx74NFeQv+FXQRaPkEAnp8ZtZi0oVKWG/QfC1XO7P+1C4MSliZjZ2ntHYxDK6oGF
         8IDuSUC2AeKqdy9yUfzUuQoXY+ftviRwaXFjUawMy4aeWJpgLuV5thMAcqfUDbYOF2cY
         Tj5EInvILZUV+GoY8yGJmj9sMCctKc8z/YsqKQmrfC5Bhp3+4EjvHDciMvCwwiQdwzLM
         oScaRyL5UzxCXXB0rptOphhKrjZHliWldx32JIzpUwGBojIYQ/BJU6BN7iij6ga3TcWa
         8+nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=STsHdDrWqRXLjrrUY3i9sIM3Xb363QxF+MRz9m4xScI=;
        b=LfLExn7xh1RHx9iusZrUewZZDYZRBahXg9aqfwPSiAqWLlnRItuTPhPL7TT6+xdqKO
         4Yb8sIO4GlbLWTE9wEplovLzAaIV0NodKcl0RNMr9nWBT5OQ3wjsEpkDgLLZNB6/Yc8Q
         nteYyOk6XhR/Kj1OlexiGdtwQp6ejOg5VpguV0VRqMWDcYz3/CMlVoiyrAVmu1pcTMaY
         h/cHFiWSEDiU+asdTGw81noxOmdHEA+mHIa8UQT72xLzb+9aXYwSSYiWdn8kvsF+VZ6q
         zzWd9yQOD/jQ7rWGDbUW7Y4i3V1d9NmGnIGMgW78e0JGlf8qNke+EyNw5zstKYsMqx3y
         6h7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=L4hFZY0q;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=STsHdDrWqRXLjrrUY3i9sIM3Xb363QxF+MRz9m4xScI=;
        b=R20WxT+Nwpb8Wb6wOQY6iSnQOj5R2A38VBVwKzCsdiUmspe1E4ibjZLyF8RruMkdLq
         RbaurtHAXkUH7sVjntICOEy/NeSyLawr/sQEHMWc8Z6tlDmLBHGpZtiJzMOPgFfEnfUf
         BsSbaFn8bV8F0D5uBtSk26mV2uoacWr5rByl+5rShMxDnOBQRsQMC0rRV4hTZoLsG6U0
         M5J2J8AQJpQs7BEASHyZevqkACfmw7fVMcuQzrMG6U/vumpduN65gO8L9zvMFOjBsztU
         W8dNZTEtIoK88S0sJJAY45YEJluEZSnpklfuqGxwFi7uIBVkatIIdtTOWHTF1IPAbXK3
         UPmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=STsHdDrWqRXLjrrUY3i9sIM3Xb363QxF+MRz9m4xScI=;
        b=BLne1onuQ2BnILtwe6lNmmNA5RRb3UHGkgcMoKDivIHuw+BR+rNgBn/QJ90xtwqFGq
         HFkocHRL2uqQlZChVp8wN7orINvnTNyD1u8RS7N/KyvJo2S7GlBSvt4wEEM/Co84DVQx
         pPv0gtiyX+EOBc64qxsSg5v48v1LNK9KykI0t6LWVrKlHPx2IIWFOHYuMMRp9tCcS37B
         7TjzsPq/AUunP+4XnLQS7s+tvfaLv8FZD1LZUB62sW8fVBhDcJJCVuUJDmn09zv3lxiF
         k5JX30kZxSaIJXwuhM1GMWp8iJs3MuAtuSzI3+/U/298Z6pn5doqNf41kmU4U5fxlY4B
         3OeA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531WE5CEPGrk5JwYXlO1PpMr2ub07dRiNGQ++4wZOCzEP5dZK3Yt
	nhwfPFJIc5PKE+cz5ii/Ke8=
X-Google-Smtp-Source: ABdhPJylFX73AdLZPGPwR7uVEDxdbXzu/AOESia4J2q/3bi4aG8gXBKHIv8ksm4QGv7zTtV3RqKEyA==
X-Received: by 2002:a2e:91ca:: with SMTP id u10mr499846ljg.101.1594848094298;
        Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls760503lfk.3.gmail; Wed, 15 Jul
 2020 14:21:33 -0700 (PDT)
X-Received: by 2002:ac2:5a50:: with SMTP id r16mr479609lfn.170.1594848093604;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848093; cv=none;
        d=google.com; s=arc-20160816;
        b=Ba+BH0YdBdPpfsSxhXCTnTswRZMjDp/BS/n+SwHJZd+k4svEOglGENoGyaeuwnc/KE
         /H1Rv579vMWMQ0Q1MVxfWNyDQr3anFUuhSTJnslf9EuJuDYeLRbtaqSdVqDSKLsBCLZq
         jyN01VBYc0914RjlrpMbtQYh3uV7KYkcWggwcWlsZsBOTevbqB7sG7zg2RdZwUeGL3Gc
         HIZGq26xRLYuAliHM6EBjz/YYrBsF7FCTgHFVFIjXP8a/ABOH5X17keyrJh+iQAFHzuD
         raj5UlkbJkK0tOZ7xJEnsUOPDbR8wT4fC/ZnpEPvZsPhdCmGUHvHctk55mTfqMkFszSn
         tkRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=eSdA/8epKpktDATdtEIuU6E9M76txuyicDWTOnMpjjU=;
        b=ES0h5uBL1EySfGmXFdAuZL/SCdXd47gFFbQqSm5KtXD0/5nAuvJmznbyABFik1blSj
         Tu2TM1LMixJYbyEjXQIeutBRFy8NgsQuzGANL8MdFOq+LSaVIgFEQ39KObhxJ8k4WASU
         KltGUTRPLTnsLas/K2Wh+SjycyPikPKqVavD80NcWo6/Urc84WT3aZMitUUzac3rYRSn
         BCXEIm1FaYxxyxH4uJlGtFA1VJa9C/HvHpfYO9K5r03uV+PMKUx/DGa/ADZsGcStHWHB
         kU96IQr1SQcj7mlzF8nrvaXG36s8FQC39tnL+BnbZZ1kBUL3Q0f7yGHtzNjfTgsFvZEm
         DPog==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=L4hFZY0q;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id y2si200033lfe.2.2020.07.15.14.21.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgc49bRzxym
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:32 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:32 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 3/7] pyjailhouse: config_parser: consolidate binary parsing into CStruct class
Date: Wed, 15 Jul 2020 23:21:15 +0200
Message-ID: <20200715212119.48052-4-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
References: <20200715212119.48052-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=L4hFZY0q;
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

The class slots define component fields in a more grounded way.
This greatly simplifies definition of parseable compoments.

The first `__slots__` tuple in each class defines a constant list of
fields and also the corresponding binary ones in the C struct.
`_BIN_FIELD_NUM` ensures that subsequent slot additions are ignored by
CStruct as they must be constructed by the owning class itself.

For complex parsing the class method `parse` needs to be overridden,
see `CellConfig`.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 169 +++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 77 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index a6780d61..961d3062 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -23,6 +23,47 @@ from .extendedenum import ExtendedEnum
 _CONFIG_REVISION = 13
 
 
+class CStruct:
+    def _slots(self):
+        attrs = []
+        all_attr = [getattr(cls, '__slots__', ())
+                    for cls in type(self).__mro__]
+        for cls in all_attr:
+            num = getattr(self, '_BIN_FIELD_NUM', 0)
+            if len(cls) < num:
+                continue
+
+            for i in range(num):
+                attrs += [cls[i]]
+
+        return attrs
+
+    @classmethod
+    def parse(cls, data):
+        obj, data = cls.parse_class(cls, data)
+        return obj, data
+
+    @staticmethod
+    def parse_class(cls, data):
+        obj = cls()
+        slots = obj._slots()
+        if len(slots) > 0:
+            data_tuple = cls._BIN_FMT.unpack_from(data)
+            for assigment in zip(slots, data_tuple):
+                setattr(obj, *assigment)
+
+        return obj, data[cls._BIN_FMT.size:]
+
+    @staticmethod
+    def parse_array(cls, num, data):
+        array = []
+        for i in range(num):
+            obj, data = cls.parse(data)
+            array += [obj]
+
+        return array, data
+
+
 def flag_str(enum_class, value, separator=' | '):
     flags = []
     while value:
@@ -51,7 +92,9 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
     }
 
 
-class MemRegion:
+class MemRegion(CStruct):
+    __slots__ = 'phys_start', 'virt_start', 'size', 'flags',
+    _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('QQQQ')
 
     def __init__(self):
@@ -66,15 +109,6 @@ class MemRegion:
                ("  size:       0x%016x\n" % self.size) + \
                ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags))
 
-    @classmethod
-    def parse(cls, data):
-        self = cls()
-        (self.phys_start,
-         self.virt_start,
-         self.size,
-         self.flags) = cls._BIN_FMT.unpack_from(data)
-        return self
-
     def is_ram(self):
         return ((self.flags & (JAILHOUSE_MEM.READ |
                                JAILHOUSE_MEM.WRITE |
@@ -112,11 +146,15 @@ class MemRegion:
             self.virt_address_in_region(region.virt_start)
 
 
-class CacheRegion:
+class CacheRegion(CStruct):
+    __slots__ = 'start', 'size', 'type', 'flags',
+    _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('IIBxH')
 
 
-class Irqchip:
+class Irqchip(CStruct):
+    __slots__ = 'address', 'id', 'pin_base', 'pin_bitmap_lo', 'pin_bitmap_hi',
+    _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('QIIQQ')
 
     def __init__(self):
@@ -126,36 +164,29 @@ class Irqchip:
         self.pin_bitmap_lo = 0
         self.pin_bitmap_hi = 0
 
-    @classmethod
-    def parse(cls, data):
-        self = cls()
-        (self.address,
-         self.id,
-         self.pin_base,
-         self.pin_bitmap_lo,
-         self.pin_bitmap_hi) = cls._BIN_FMT.unpack_from(data)
-        return self
-
     def is_standard(self):
         return self.address == 0xfec00000
 
 
-class PIORegion:
+class PIORegion(CStruct):
+    __slots__ = 'base', 'length',
+    _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('HH')
 
     def __init__(self):
         self.base = 0
         self.length = 0
 
-    @classmethod
-    def parse(cls, data):
-        self = cls()
-        (self.base, self.length) = cls._BIN_FMT.unpack_from(data)
-        return self
-
 
-class CellConfig:
-    _BIN_FMT = struct.Struct('=6sH32s4xIIIIIIIIIIQ8x32x')
+class CellConfig(CStruct):
+    # slots with a '_' prefix in name are private
+    __slots__ = 'name', '_flags', '_cpu_sets', \
+                'memory_regions', 'cache_regions', 'irqchips', 'pio_regions', \
+                '_pci_devices', '_pci_caps', '_stream_ids', \
+                'vpci_irq_base', 'cpu_reset_address',
+    _BIN_FIELD_NUM = len(__slots__)
+    _BIN_FMT_HDR = struct.Struct('=6sH')
+    _BIN_FMT = struct.Struct('=32s4xIIIIIIIIIIQ8x32x')
 
     def __init__(self):
         self.name = ""
@@ -167,78 +198,62 @@ class CellConfig:
 
     @classmethod
     def parse(cls, data, root_cell=False):
-        self = cls()
         try:
-            (signature,
-             revision,
-             name,
-             self.flags,
-             self.cpu_set_size,
-             self.num_memory_regions,
-             self.num_cache_regions,
-             self.num_irqchips,
-             self.num_pio_regions,
-             self.num_pci_devices,
-             self.num_pci_caps,
-             self.num_stream_ids,
-             self.vpci_irq_base,
-             self.cpu_reset_address) = cls._BIN_FMT.unpack_from(data)
             if not root_cell:
+                (signature, revision) = cls._BIN_FMT_HDR.unpack_from(data)
                 if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
-            self.name = str(name.decode().strip('\0'))
-
-            mem_region_offs = cls._BIN_FMT.size + self.cpu_set_size
-            for n in range(self.num_memory_regions):
-                self.memory_regions.append(MemRegion.parse(data[mem_region_offs:]))
-                mem_region_offs += MemRegion._BIN_FMT.size
-
-            irqchip_offs = mem_region_offs + \
-                self.num_cache_regions * CacheRegion._BIN_FMT.size
-            for n in range(self.num_irqchips):
-                self.irqchips.append(Irqchip.parse(data[irqchip_offs:]))
-                irqchip_offs += Irqchip._BIN_FMT.size
-
-            pioregion_offs = irqchip_offs
-            for n in range(self.num_pio_regions):
-                self.pio_regions.append(PIORegion.parse(data[pioregion_offs:]))
-                pioregion_offs += PIORegion._BIN_FMT.size
+                data = data[cls._BIN_FMT_HDR.size:]
+
+            self, data = cls.parse_class(cls, data)
+            self.name = self.name.decode().strip('\0')
+            data = data[self._cpu_sets:] # skip CPU set
+
+            self.memory_regions, data = \
+                cls.parse_array(MemRegion, self.memory_regions, data)
+            self.cache_regions, data = \
+                cls.parse_array(CacheRegion, self.cache_regions, data)
+            self.irqchips, data = \
+                cls.parse_array(Irqchip, self.irqchips, data)
+            self.pio_regions, data = \
+                cls.parse_array(PIORegion, self.pio_regions, data)
+
+            return self
         except struct.error:
             raise RuntimeError('Not a %scell configuration' %
                                ('root ' if root_cell else ''))
 
-        return self
-
 
-class SystemConfig:
-    _BIN_FMT = struct.Struct('=6sH4x')
+class SystemConfig(CStruct):
+    _BIN_FMT = struct.Struct('=4x')
     # ...followed by MemRegion as hypervisor memory
     _BIN_FMT_CONSOLE_AND_PLATFORM = struct.Struct('32x12x224x44x')
 
+    # constructed fields
+    __slots__ = 'hypervisor_memory', 'root_cell',
+
     def __init__(self):
         self.hypervisor_memory = MemRegion()
         self.root_cell = CellConfig()
 
     @classmethod
     def parse(cls, data):
-        self = cls()
         try:
-            (signature, revision) = cls._BIN_FMT.unpack_from(data)
-
+            hdr_fmt = CellConfig._BIN_FMT_HDR
+            (signature, revision) = hdr_fmt.unpack_from(data)
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
 
-            offs = cls._BIN_FMT.size
-            self.hypervisor_memory = MemRegion.parse(data[offs:])
+            self, data = cls.parse_class(cls, data[hdr_fmt.size:])
+            self.hypervisor_memory, data = MemRegion.parse(data)
 
-            offs += MemRegion._BIN_FMT.size
-            offs += SystemConfig._BIN_FMT_CONSOLE_AND_PLATFORM.size
+            offs = cls._BIN_FMT_CONSOLE_AND_PLATFORM.size
+            offs += CellConfig._BIN_FMT_HDR.size # skip header inside rootcell
+            self.root_cell = CellConfig.parse(data[offs:], root_cell=True)
+            return self
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
-
-        self.root_cell = CellConfig.parse(data[offs:], root_cell=True)
-        return self
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-4-andrej.utz%40st.oth-regensburg.de.
