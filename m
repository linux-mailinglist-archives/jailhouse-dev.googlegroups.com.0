Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBC6A5P3QKGQEPRH32NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 0244220EEC4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:47:40 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id j5sf11350477lfc.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:47:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499659; cv=pass;
        d=google.com; s=arc-20160816;
        b=RqJuGY9JqWCUbi8m6lT0MnF7Cdyz7A0MmfjySDgC2diEvmEfXlniHuS6GPhpT9vSWo
         25baw8hGK1Y7Dmc3dSvmWoN8AMuh+CKZGWoAQR7eE17cpbd+e8Cn5U6QzfX2Dci4nsPI
         y/GcqQRAKOlyTrHQnP0fr3Vi4NKb/p4yd2773ZLiULPQ1VXFVU82aqhAzq5M5OZcIuOf
         LVfQKWZ3OkJxH1aoToT2ryN1hRtElinAQVZT1SlEuogXYSJ/XspF7mtriCZ7yTxnsDc2
         dyHPXJj1FWkshu6+AT9+rrtAZvY7TJKIuHAzecLdT27jy3iWbMy4SCvxoDJxoR6axx+X
         A1fA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=0l1NPQ9Wz1JczkMACDAUYkSDVhx5ooYkDXbELiwnyVU=;
        b=GouXY8B/C+nOEcgS0GeagWrDo+Q57YOQ6daokJd4IL5pfRaF+Hvy39O//mdZovy9Wv
         0gac0+D+fQr9EjuoNelY6ESWyzlrWD65iyzTRpAfqdVt9ZkMr5tqlPocfUpViV0U2Ztr
         hIlNMY3voGC8ohOgGzwC2F/ToxOEctoWHy5oyBSzJFMnazNZt5xGIA3MMYTnh5W+9YLQ
         QfVEVlxQHKHuRKnCfOlD1PHvEYoeqKS7AAEq/PNyz5FjcuyqWLtRYrjY6qSr0CGdslgL
         Kj2tLEEMRmL6VHqcUAtLjSlyfgKfXft53UZ1SgA4qkx60SZkoN9EkXu/GGiUNxarc8xJ
         TFyA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=BiQ60HHq;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0l1NPQ9Wz1JczkMACDAUYkSDVhx5ooYkDXbELiwnyVU=;
        b=ZFwz0YrW4wV2JWgbUEsIOxnFfWoYyZDNS+qgeO4gWEFL6o/RcCYdLb/+EN+QURD4kl
         Xt+jrgJjqHXfRDdQDvauSvT52wzgJoggOR6qf16W95Pkejzn8COLmkMc2q3M9Vj05MaI
         W1dzM+AHmG5VIu3IkebgNKoChP+/dmkXhTIjxgh77vmZfLcPRfCRuArhf2UyJnyR5fX4
         LhXZWdl9RqZLNJXX1ztrAVQU9/Jwg8mepmTlJka/tbVrKWkKdobSNopapbA7EXykne1x
         NJ+AbW1Eo7bpWBE/cdCz3l2UTqQ/yNAq/CsEs+YDmdpfXrrWcgsOpOQh+8ckZzRbnHlO
         Ak1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0l1NPQ9Wz1JczkMACDAUYkSDVhx5ooYkDXbELiwnyVU=;
        b=i1t8ELIoGUjwVi/g9lffFdIHFu1dYazQie6pI2qrZME9FLGRjpybEguWlSSSmBvmCD
         rLcoceuG8rA8BHPx9E2PawtLamF1cLLaWbld3KVI7xMYUqJaUiMYud0nfuzPsBlqMQYC
         r9/vUdbFBGEGzPl/8L94f9ef8+kegoJvI+jCJSDwBzLPbpiZZ1feMrxnhaeLC+/gZUfg
         tssLtfkLi2F9R8Oa93rjmHwLqkd+s/AgCYH8WW1Sw0jzYveQwB7Zt5/9MDtOu7sMSibf
         zIdfN8PU/EPHcU/0tQqFWp3z6Apnze+AzA8uZEvAwiR50yn9aY+LoPVFJOJfHKvtZA32
         apow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530g7ux+b2UB40TEF+smy6+N5bI/2CrGoSIxZjdTFl6BqTTgw34d
	4BoeMhi3In1wMKRzyJQrYNk=
X-Google-Smtp-Source: ABdhPJzZ5d5j3O2SHGDVeGDW/uJttCLVPC+Hlhwby9sDUVGz0ROGxZKH+QBu+gjE8r6FAZPG5oq2TQ==
X-Received: by 2002:a19:8497:: with SMTP id g145mr11140324lfd.73.1593499659507;
        Mon, 29 Jun 2020 23:47:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7102:: with SMTP id m2ls2014733ljc.6.gmail; Mon, 29 Jun
 2020 23:47:38 -0700 (PDT)
X-Received: by 2002:a2e:9bd2:: with SMTP id w18mr4551379ljj.200.1593499658628;
        Mon, 29 Jun 2020 23:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499658; cv=none;
        d=google.com; s=arc-20160816;
        b=aPHACLqcU0GhTlCGWGSQJikZs2OcR5s5/dGsJTf1UYt53JM4Oak2tdM4Ef3EgYP7nr
         8j9G+cPBq3Mh5OpKMZwgt0CTXFI4yhSeBdzgeL/x+sv+olhiAUSlk/OIEFx+Z9FAn2cM
         vb7Fu5RiaipJTK/SffwC9vpmncrceMk4tsytaRvSlgZe+Xxhn6/ChM9qe8VqOvVmmjDI
         nkV5Cg22iCJpa1wfXU9LWegnoavc3AG6hyvJIsaIYhnZnkJ6haSBkMStAj/nQy7WnloQ
         YPbMMuPH7B+hrAxKUyfDv/batQNxTXUq6TFefXQ5+tQr1Mq7pUx8iuf0nfI8mKJbQ9+P
         m3BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=jEliu5oCZFM+612iVpHZeDoWwpoDpHVb542G4y1D2lk=;
        b=BWvo3iU5d2am5IMfcdPQQ7FZjnzz9lW53yOoTTXVIuFBU3D99J6yVoAXmF5gvJoX3C
         E1hkro92tRGeMwmBZa1rDnz0Y2bW4Lg7tPRLjp5Zn9HyqDDjVhr+k/tyNh6sGr3svd1e
         hQiN+bu8Ht0TAYHUq0itAT8KMSTt+XKYMxs7VEeEKJqxmECBp9NXsLmIoBEriXvaPzk9
         38eqaZk/CXCz36d2uCVqonRQod/CNvVY7Nm5CK5EzFHMB/XXnis9EzGwhoFw/AZorWMT
         Xlfrkgd3MdDfu3LRYFBW5UsnzMvrFhLGLfVEwT4un54MPjin/6VN1KVh8xOYOeTzOo8u
         aPgA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=BiQ60HHq;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id a15si128764lfb.3.2020.06.29.23.47.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49ww0961Rhzy00
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:47:37 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:47:37 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 10/11] pyjailhouse: config_parser: add ability to serialize C structs
Date: Tue, 30 Jun 2020 08:47:29 +0200
Message-ID: <20200630064730.7210-2-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630064730.7210-1-andrej.utz@st.oth-regensburg.de>
References: <20200630064730.7210-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=BiQ60HHq;
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

This enables to create Jailhouse configurations without relying on a C
compiler.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 124 +++++++++++++++++++++++++++++++++--
 1 file changed, 118 insertions(+), 6 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 75e22fad..eaec4fa2 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -15,8 +15,9 @@
 # to change the generated C-code.
 
 from __future__ import print_function
-import struct
+import copy
 import io
+import struct
 
 from .extendedenum import ExtendedEnum
 
@@ -39,6 +40,19 @@ class CStruct:
 
         return attrs
 
+    def save(self, stream):
+        values = tuple()
+        for field in self._slots():
+            value = getattr(self, field, 0)
+            values = values + (value,)
+
+        stream.write(self._BIN_FMT.pack(*values))
+
+    @staticmethod
+    def save_array(itr, stream):
+        for obj in itr:
+            obj.save(stream)
+
     @classmethod
     def parse(cls, stream):
         obj = cls.parse_class(cls, stream)
@@ -172,6 +186,10 @@ class Irqchip(CStruct):
     def is_standard(self):
         return self.address == 0xfec00000
 
+    def save(self, stream):
+        super(self.__class__, self).save(stream)
+        stream.write(self._BIN_FMT_PIN_MAP.pack(*self.pin_bitmap))
+
     @classmethod
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
@@ -207,6 +225,12 @@ class PciDevice(CStruct):
     TYPE_BRIDGE = 2
     TYPE_IVSHMEM = 3
 
+    def save(self, stream):
+        temp = copy.copy(self)
+        temp.bar_mask = self._BIN_FMT_BAR_MASK.pack(*self.bar_mask)
+        temp._caps_num = len(self.caps)
+        return super(self.__class__, temp).save(stream)
+
     @classmethod
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
@@ -256,6 +280,62 @@ class CellConfig(CStruct):
         self.cpu_reset_address = 0
         self.console = Console()
 
+    def save(self, stream, is_rootcell=False):
+        # Flatten and deduplicate PCI capabilities
+        pci_caps = []
+        for idx,dev in enumerate(self.pci_devices):
+            if not dev.caps:
+                continue
+
+            duplicate = False
+            # look for duplicate capability patterns
+            for dev_prev in self.pci_devices[:idx]:
+                if dev_prev.caps == dev.caps:
+                    dev._caps_start = dev_prev._caps_start
+                    duplicate = True
+                    break
+
+            if not duplicate:
+                dev._caps_start = len(pci_caps)
+                pci_caps += dev.caps
+
+        # Convert CPU set to bit array
+        cpu_bits_cap = self._BIN_FMT_CPU.size * 8
+        cpu_sets = [0]
+        for cpu in self.cpu_set:
+            if cpu >= cpu_bits_cap:
+                cpu_sets += [0]
+            cpu_sets[-1] |= 1 << (cpu % cpu_bits_cap)
+        cpu_sets.reverse() #
+
+        temp = copy.copy(self)
+        temp.name = self.name.encode()
+        temp.cpu_set = int(len(cpu_sets) * self._BIN_FMT_CPU.size)
+        temp.memory_regions = len(self.memory_regions)
+        temp.cache_regions = len(self.cache_regions)
+        temp.irqchips = len(self.irqchips)
+        temp.pio_regions = len(self.pio_regions)
+        temp.pci_devices = len(self.pci_devices)
+        temp.pci_caps = len(pci_caps)
+        temp.stream_ids = len(self.stream_ids)
+
+        if not is_rootcell:
+            stream.write(self._BIN_FMT_HDR.pack(self._BIN_SIGNATURE, \
+                                                _CONFIG_REVISION))
+
+        super(self.__class__, temp).save(stream)
+        self.console.save(stream)
+        for cpu_set in cpu_sets:
+            stream.write(self._BIN_FMT_CPU.pack(cpu_set))
+        self.save_array(self.memory_regions, stream)
+        self.save_array(self.cache_regions, stream)
+        self.save_array(self.irqchips, stream)
+        self.save_array(self.pio_regions, stream)
+        self.save_array(self.pci_devices, stream)
+        self.save_array(pci_caps, stream)
+        for sid in self.stream_ids:
+            stream.write(self._BIN_FMT_STREAM_ID.pack(sid))
+
     @classmethod
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
@@ -311,6 +391,7 @@ class Iommu(CStruct):
     __slots__ = 'type', 'base', 'size',
     _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('=IQI')
+    _BIN_PAD_SIZE = max(IommuAmd._BIN_FMT.size, IommuPvu._BIN_FMT.size)
 
     # constructed fields
     __slots__ += 'subtype',
@@ -322,6 +403,21 @@ class Iommu(CStruct):
     TYPE_SMMUV3 = 3
     TYPE_PVU = 4
 
+    def __init__(self, subtype = None):
+        self.type = 0
+        self.base = 0
+        self.size = 0
+        self.subtype = subtype
+
+    def save(self, stream):
+        super(self.__class__, self).save(stream)
+        padding = self._BIN_PAD_SIZE
+        if self.subtype:
+            self.subtype.save(stream)
+            padding -= self.subtype._BIN_FMT.size
+
+        stream.write(bytes(padding))
+
     @classmethod
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
@@ -335,8 +431,7 @@ class Iommu(CStruct):
             self.subtype = sub_cls.parse(stream)
 
         # skip rest of the C union, if needed
-        skip = max(IommuAmd._BIN_FMT.size, IommuPvu._BIN_FMT.size) \
-            - (sub_cls._BIN_FMT.size if sub_cls else 0)
+        skip = cls._BIN_PAD_SIZE - (sub_cls._BIN_FMT.size if sub_cls else 0)
         stream.seek(skip, io.SEEK_CUR)
         return self
 
@@ -360,6 +455,8 @@ class PlattformInfo(CStruct):
                 'pci_is_virtual', 'pci_domain',
     _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('=QBBH')
+    _BIN_PAD_SIZE = max(PlattformInfoArm._BIN_FMT.size, \
+                        PlattformInfoX86._BIN_FMT.size)
 
     # constructed fields
     __slots__ += 'iommus', 'arch_info',
@@ -372,6 +469,13 @@ class PlattformInfo(CStruct):
         self.iommus = []
         self.arch_info = arch_info_cls()
 
+    def save(self, stream):
+        super(self.__class__, self).save(stream)
+        self.save_array(self.iommus, stream)
+        self.arch_info.save(stream)
+        padding = self._BIN_PAD_SIZE - self.arch_info._BIN_FMT.size
+        stream.write(bytes(padding))
+
     @classmethod
     def parse(cls, stream, arch_info_cls=PlattformInfoX86):
         self = cls.parse_class(cls, stream)
@@ -379,9 +483,7 @@ class PlattformInfo(CStruct):
         self.arch_info = arch_info_cls.parse(stream)
 
         # skip rest of the C union, if needed
-        skip = \
-            max(PlattformInfoArm._BIN_FMT.size, PlattformInfoX86._BIN_FMT.size)\
-            - arch_info_cls._BIN_FMT.size
+        skip = cls._BIN_PAD_SIZE - arch_info_cls._BIN_FMT.size
         stream.seek(skip, io.SEEK_CUR)
         return self
 
@@ -403,6 +505,16 @@ class SystemConfig(CStruct):
         self.platform_info = PlattformInfo()
         self.root_cell = CellConfig()
 
+    def save(self, stream):
+        hdr_fmt = CellConfig._BIN_FMT_HDR
+        stream.write(hdr_fmt.pack(self._BIN_SIGNATURE, _CONFIG_REVISION))
+        super(self.__class__, self).save(stream)
+        self.hypervisor_memory.save(stream)
+        self.debug_console.save(stream)
+        self.platform_info.save(stream)
+        stream.write(bytes(hdr_fmt.size)) # place dummy cell header
+        self.root_cell.save(stream, is_rootcell=True)
+
     @classmethod
     def parse(cls, stream):
         self = cls.parse_class(cls, stream)
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064730.7210-2-andrej.utz%40st.oth-regensburg.de.
