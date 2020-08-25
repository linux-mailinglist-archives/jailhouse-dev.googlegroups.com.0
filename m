Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBRWKST5AKGQECEXE2YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A697251B3F
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:47 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id d8sf3862604lji.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367047; cv=pass;
        d=google.com; s=arc-20160816;
        b=uuXxz/tbtwb5HG/5y3LG4q6GY0Y9dEFUtAAmZk2Em8DS4KC8qIjtXB8svTd7eehf8q
         gxMlfnyGYiyUKYrJ3DMfJVGnoF9Mv//IuZZIhqvgRqCBPWgMunQNe1Y7giSiAAj0+w/c
         VEb256oU4hdFV4qLQ+Yh70TJ+YOuZVLLIsS26jhgHWsco9NMwgY/JXO20QFilLk9NDqA
         YA5kv09UDrNbJIWp3IUfBitngrhRxit2FLDcS2fyJe/7gEQx+GxbufmEBVuQtVoBnXvy
         qBn8TcyuMohEg2cTIunZtQerb2qS2sA3PKM64os2pKislV3T71iUbhxKuTUMO2I/RCRO
         XggA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=nTcLLQetTe14fqsYJQ3RJdkilqpTIspBQsjT1Uahhdc=;
        b=zYBCu+Z/xhVghldiV+PlqwhBFXDMiRNihSvNAzLPxs2wMskoVpgcyN1C+wGJ0+/t67
         9ZFMS9MIjyBXV8tEjGEkLvZgXC4X8P8dr/dGGUNJehD63qvkeiQjAewEob6mdXXPolNv
         ZWncePy4uP1lP0Jephr5c0Hl1qPDxvMNwjV2eI7au3LTBoIU9kt5dlSnRYwcybmw8vdJ
         Y1bt5E3eCyUGnRwhiYdlhg4PEmRXPQvzZ3tQaYhOqBH+bVqh4WvUQ+1EO/tUiDPENuUn
         zm6fFvk4vk7ITOA/vRk9vFXc+UB22zu/95lGVqeagoOfMW9jFbnnA8T0XnzJcwJvHsBz
         IrIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Gklg6w8P;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nTcLLQetTe14fqsYJQ3RJdkilqpTIspBQsjT1Uahhdc=;
        b=jdW8qI1h4KBrqsEzs8ViPCR9GzH/BsoveXiXDSjDatHzjxysRBaDApXQFFop0H7xGb
         MP0Ex34L1JbTKFly9hZQKgscDvHbaEcD7IMWAxI9CG2wF9FFxCF1XOW+nlrf7gS+YyyE
         K3RdHVHQPePiHgChHmQlH+jTGnQCfopKgeywJm5ifSFmxNJlXUhxqoyJXYVjOA2fD1Mg
         IxTRo2b5BnOz6tJF66EzPlja+TyoyTmoE9ot57lB+my39l9vse3SAYt5z8ZDaxEl9oXB
         9azteLDMip0lJHRsBB22V3IiooElIQ5QrVB66PN5P7ZG4DU/CraG55/aKjJNT+oT0gRq
         IRNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nTcLLQetTe14fqsYJQ3RJdkilqpTIspBQsjT1Uahhdc=;
        b=lWMfG13+TXfWIQY1xaKZNke+dCQJOzzIsxOPMVNUSGfQ5goXV1F52M0FWYbgQ64Nu8
         W+zH+z5wVLJEVGzazXGsRT4wI8m1wowtL1+6pfu2u3omzX/CV9y9f6iDabqcHDP+V5NP
         P3s/17AtHXjiuQRLBc/yVQaIP9n4GUnfLqQ80K5Foo9Xhrm0QX4bkC8F7LiAwJVEmlgb
         /9f1ggPfjQQ7u0wAwiEPg7oaH+7/e2IiqeR2Xqs+TPt5Cgk8vEIDvkZl0zDahBGb4Q8P
         aIXCzA2N2lj0dP230fy7FFqor8DWK/G+QzQwPFzzoTt0D/DFr/DF6eTg7cSpGJ35GnGD
         SDvQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533XxtVr4LJ5bo56lEp+oIz/FBMebEEuPUjybuk8UoYiaXkxLvsc
	QqF7aUYNQlepyWJBXSiWPNc=
X-Google-Smtp-Source: ABdhPJyGC5AFd53daQzB04vH0C5r7Z4t4WMI/K3s6ZNOUKVKeOEQje9uMtgvuG8uR8dDbq5Ztgf4KA==
X-Received: by 2002:ac2:58d5:: with SMTP id u21mr5017984lfo.31.1598367047132;
        Tue, 25 Aug 2020 07:50:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9b48:: with SMTP id o8ls2446365ljj.11.gmail; Tue, 25 Aug
 2020 07:50:46 -0700 (PDT)
X-Received: by 2002:a05:651c:1136:: with SMTP id e22mr4961581ljo.422.1598367046136;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367046; cv=none;
        d=google.com; s=arc-20160816;
        b=PF5K9SygNhf4ux/kaLpF6ixYFbXilXN+j9r74nWPWk9dfpPDzOPoMW0iiL6roRBGP9
         KtPxA2qsOJ1KXcK+T3fNMbA0I+jU2vI0pohJW/QF6Me7rhufUa4a0kuXyfTKyVWgf8Ed
         npNicDICk5oWjs6we9B64ryNupfRM/ZPAB5dgpc7kJeA3HYuANIaMgM8taABueWF2Ash
         r1MlG6o/ND3SCstlk4OzuvLOjPGnRFXJgRgYyxLHKF6xWUgmzwEv94yYrF/dCIKXdyv/
         kvbGa+Gf5qhRAvyzzpil6x9s3o/juYbXssKONLqlAH4UgwpcZjTnq//fVdDQsxHm04jX
         Eo3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+I0Gz9LszFvvy5A3u/VUyjNehntANbXu4lY/FkbWThc=;
        b=Udup7czHuW99c/8QF1oQbCpvIhgV91Gux3pJfm8axFBWA/fZ+6JidvqmJ0maiY470a
         MfXlvq0KWCI3LV7OeLvR6Trj9ZSjdvKZ5yVfxQTU2h9s6V+7amh7JydSj0nEl4myI9gL
         Ge16+Qw1yp/kKW5W74h3Smze47nuNV2nOvn1V66apTpktr2dI518VGcy4JIZPWgFvvfD
         NXvpY8rAet7yzv4ucQ62TJWSiUKLZIuFGSLTeXg14uya3pAN5rpQCdElV+8zp4r4c3XY
         uvHO457ZgRQBpc7sBwnEWoYMNC/1sMaweECcr3o4AEwmi8FXaHThmLU/1Bao8BW/FPr8
         rwYw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Gklg6w8P;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id u9si591651ljg.8.2020.08.25.07.50.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3n1LvBzy9K
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:45 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:44 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 3/7] pyjailhouse: config_parser: consolidate binary parsing into CStruct class
Date: Tue, 25 Aug 2020 16:50:28 +0200
Message-ID: <20200825145032.115837-4-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
References: <20200825145032.115837-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Gklg6w8P;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-4-andrej.utz%40st.oth-regensburg.de.
