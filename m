Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2N55P3QKGQEFVDYUBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 524C720EEB3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:50 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id g124sf20431293wmg.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499370; cv=pass;
        d=google.com; s=arc-20160816;
        b=H92yrBPakgi/w0gNhb8ypU8lwWpFtWCW5NCL9UvEKHT/ErbJgkKZOsYXPZc9aeeb8k
         w1GPOlsysJ9ys58Mu4d+YVCasdXZPIqIWiXSINz0OvzSO4dGPY4craqNgf0KSDHsdWgV
         NjPwJMqPQRz3F9RShm5gDs/AtBhmWqvTXn6X/69fZbkzy1J/6GtjhvffMC0OZdwK9B3y
         MiBiPYhtXLlS32jNCBS+QuEAkrDQNs+zUhkRuUQR5WZkOrytYeV62Tb9TyI01h5PIhJm
         5Ho/ELXiymc551MEkmeIQQBTf9GC94pHKw0PDuJuzB+d/82RB3fg5oo4SjFTBvRfrLmY
         kt8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KedSlawQJWnPFZ9LuT/yU4z7dCrvdcJozWAIPinqMEA=;
        b=L3w33djS1MA3eZA0tQ2PyWZp6ZS2fP26V7WOKvYWykE339C+S64peTWkrKK2nk9oy9
         AtdA4fp4ENNqrc+vrjBotDTOWTuafD8yRGYU2vZEzG1LwbkovNOSDKyB96j/+96/fGE6
         KOTMDHLKF5GyvvZbRHaP61v68u5LVYyywvXkK/5NJmOKP6+FMyGBWV9DC/KBxyk4FpIV
         Z8cBAiDNGOwQyRdOw196RR+D4H7OevbvLGt/qrKGi6iZl6/u+jVKFOQdinv4nq090mIQ
         sg4M7vVby3M/wySpvU7qNysHz1Up72A+cqJ3Pl3xashIm7kRW807aalfqaLjn+GeDQte
         CLxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=IjtCrYM3;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KedSlawQJWnPFZ9LuT/yU4z7dCrvdcJozWAIPinqMEA=;
        b=k0Iyg3RVS8JoZes0IbmOE9iG+ggmoeuGPV6cNKAhwaM3Wf7ClUKp1nvfIq/FXPwNMQ
         /OtLR/SrZe+xg4KNmOT0xptKrBBgSCgaotkloqQIX10FQj9OHkk1TLYfNadoTGHljrgU
         qhGo5lQVM5qpxK/9nm7fhtPrxJXNJBl82vHiRTFA6D1a38fYF18TKGJM9G8ALvxdWZGQ
         HGvuDSNRyzhs8D71moCOGWwYNU/1rtOL+44BDpdelm9jF30SlP65kBTp0ER5wFQ7rBo+
         dnpqQK4QJmf8lxD2LjtbadNqDFpQ6JShSWGx21Heed3oFUS16tMzovdvb1W2GmkzRGrV
         YVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KedSlawQJWnPFZ9LuT/yU4z7dCrvdcJozWAIPinqMEA=;
        b=C9BXjcvTRe9a+NuoDWduxBdLrssHWB8KHQ7E0fb7J9/ivdfpeF2gofQsLsnBlY1VKH
         SGI0fN/cFkTMQfiSl6NZeF6m5ZBjNtuHotja0SCQLoRM5lpf5gSSaD/2vDM+Oaqzy9ra
         dyxTjAJVnTw4td14TD+MlDdgO32RmhbJHY+9VWnnd9+UMmK44jtCGKB3W1QAqk9LeBLe
         AUIfUre57YSFOynOGQnD1OOrvX2QtJF3W84Vh07Wn48vRCwsQu7bWZnOnQXKAihGXGuS
         Y0atJoHLuLAUamJmblSVD9ImSfK5dsYDMVRN06RY8bAPBYLBX1Yx3XGewaOUlqwbxeKA
         APcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WM04YEnd35bFe9z71X7MPCWOHtjty3LpNm9+aQgvPgHspsLYS
	YV39ZQYZ9QDsbPQwegoWE9g=
X-Google-Smtp-Source: ABdhPJxirYNi0QIGjv/tH+xXtrJ1s4uunKBpNSjX9xsU/A12v2Ol5+1Cm7dPaf1HIDGeiTi7fycyCg==
X-Received: by 2002:a7b:c381:: with SMTP id s1mr21105768wmj.25.1593499370048;
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls9725372wru.0.gmail; Mon, 29 Jun
 2020 23:42:49 -0700 (PDT)
X-Received: by 2002:a5d:55cf:: with SMTP id i15mr22151698wrw.204.1593499369660;
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499369; cv=none;
        d=google.com; s=arc-20160816;
        b=09/AYG/Cj5WySS0QUeUjfihAIkbYb+6vieOCIzsTw4b9BuN3tgcpqZTS/0rs61OpAz
         1toLNzQI6TUw66/ZZapheFFO+xu7LK+yczEXSatqrXvlQUxPDVqYpyBESqfqOV13+EAn
         b7GQ50mmC1PmAVK1zy1JkJrddfG/DDTUux3RpQ+M8wh11oxt8umrlOUOKteVRtsiz5+L
         TjuTNwqYQwaI5iCmWaNxYJgYXGb6yt14fBrwJjcNlc5giAYkIzF1FG6M0968f8/hbDvW
         IhqDH6JZetyZ8iOP5Vz6671KwXh0KcQCN2pR/fjHk4Ic99L39TlGp3AQWEQNkWPoxJvW
         V6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=89VWUUfBZz/13XpglGR6g9oDVP0Kk8BEmAHB2kySlA0=;
        b=KLmb+Heb+JUqFXSIAygdxaCmAont3Y0I86nDdl9OAaJzXSPvk0VjCB1x+Qb5j3Y6/j
         M9eiGRMAykLoviik/HBs83kv5ZeuQrzHodohsW/SRL6MiHplvTKB2pMnESR7v091vCoc
         KCwkxiwxRcmnHeQbwWvZqDWSv0QZ/MuQ6qOiMr4uO7HcpuwDaKRiT3w9vG60TeFYg5Db
         CF7q+Arr60KVh1WGSmDXP59yXIFVMe0YbLYaTaQO0L2iMEEhT+pwW5MilmrEFbvGO8Pm
         IZlHJhyD0c9Xk7+gkVVQ3UGfjAEtOJsZyjKavvdknuShwzBNCOM5q+H2DznSiwdqFm9W
         NU7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=IjtCrYM3;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id o201si109022wme.1.2020.06.29.23.42.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49wvtd2l1Xzy7F
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:49 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:49 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 03/11] pyjailhouse: config_parser: consolidate binary parsing into CStruct class
Date: Tue, 30 Jun 2020 08:42:23 +0200
Message-ID: <20200630064228.4742-3-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
References: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=IjtCrYM3;
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

For complex parsing the class method `parse` needs to be overriden, see
`CellConfig`.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 169 +++++++++++++++++++----------------
 1 file changed, 92 insertions(+), 77 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index e4ad2077..3bb2686a 100644
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
-        (self.base, self.length) = self._BIN_FMT.unpack_from(data)
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
-             self.cpu_reset_address) = self._BIN_FMT.unpack_from(data)
             if not root_cell:
+                (signature, revision) = cls._BIN_FMT_HDR.unpack_from(data)
                 if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
-            self.name = str(name.decode())
-
-            mem_region_offs = self._BIN_FMT.size + self.cpu_set_size
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
+            self.name = self.name.decode()
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
-            (signature, revision) = self._BIN_FMT.unpack_from(data)
-
+            hdr_fmt = CellConfig._BIN_FMT_HDR
+            (signature, revision) = hdr_fmt.unpack_from(data)
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
 
-            offs = self._BIN_FMT.size
-            self.hypervisor_memory = MemRegion.parse(data[offs:])
+            self, data = cls.parse_class(cls, data[hdr_fmt.size:])
+            self.hypervisor_memory, data = MemRegion.parse(data)
 
-            offs += MemRegion._BIN_FMT.size
-            offs += self._BIN_FMT_CONSOLE_AND_PLATFORM.size
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-3-andrej.utz%40st.oth-regensburg.de.
