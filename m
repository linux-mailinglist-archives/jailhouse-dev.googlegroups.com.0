Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2N55P3QKGQEFVDYUBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B52D20EEB1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:50 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id g138sf11552203wme.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499370; cv=pass;
        d=google.com; s=arc-20160816;
        b=VjMGYQORJ1ogqwkdvaGMVdPoss9EimV24J9rQp4q5VI0hvjMaBtwXusFdta3+gY4tT
         RUjjK5p2kU8yjof3qeG0sQDM2mWMGmHibWC5PntprAszanB5HGqYyUkOuohWSzgo9AQt
         FoUfMzstRtd/EC+EayLceTkIGMYF8OJAXTWS8m1hORO83OhAqB2gf1qGLDfVgC/fMDVe
         eQY9SrPXk7aPa7sIlAm8EJHx7S2DTm+Ln1/oXOwh67tdy3PDBjapmxFwLBY11MbJiAlU
         55blNxifv7czVI1Bi5qdGzSO45+1tPqk1n2sr1nA3qoFCbxWHNIcLopqyKzXUOlkp0CO
         tdOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=vIKMNLrjublf6Axd2/sQvIuIT/RycO9UMyNSlD+76X4=;
        b=dnB6qM4DhOLUkM8eYXU2Ez2iroSxTblZdG8ukfLnAWqH6Ux8gh8jwBtexoc/rQNlKB
         jO5M8izjjq5QL70nwH4U6mnOxhM2Fy/FhzusmRNWLnDbiGa/ZIT7b51U3rVT1100Gk6p
         EOlONIoZE04xxO+Meui04/9jmz66K+2i9t2nUxzmlQ0rDi9isrZAUhknGZzPfjAgPrlN
         0AhuiXs1mwJNEMSGbAQarDbYZe2/Kt6rbC+E7ztCIBdMh2KquZsUqMeZjV5WJ9g3PsDY
         pRwIepqR+q3esynsuzSmw9QicDQCgvenh739Hel6CrS6+OVE/UO5ipz+l1CeSOSq4dmM
         l81g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Man1dtDd;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vIKMNLrjublf6Axd2/sQvIuIT/RycO9UMyNSlD+76X4=;
        b=cAjxApXbD3MFOPhPxdSR33Kl5kTOrt1WThWN1eK1rnK7QgPOdJyQ2BZL+OT6BXJ0cc
         nAzeiJcNaVbaCvLw+T36x8EYH9hJFY73bxn0eKv2m392PhaOR1XFebO+AjIK8aWcsgsP
         JKpUGr4T+2OIN3VsWEaxWoH9Sokl6qdCRZIVtjO5+foKXWgNe4wDBd17u8b38CtVhfGV
         CZ2hBVOCwqek8r4umLofOyFhD2hWk9/IqWQAOrTOcG36aAn8FYT9f2I0LGiPBMCTZ9WW
         GE41kcz8KtqhlX5ZaIAVIB8M9iM1z3PzuZRh7tIto2pUcypCUBt1NdMCHwhys8Ph/Y/a
         AgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vIKMNLrjublf6Axd2/sQvIuIT/RycO9UMyNSlD+76X4=;
        b=pL722yy1jboGkGJdXPouMa59zSLpntsjAjXRekbBJNSjFrkjZe8xQ6l5WkvZWcqaeH
         HFNcFEg+MdYC2SDpmhxjI0DRAQU2EtIKuIHewVMiN0pFpHg7au0Ngvp2f4Y5JRm1VOO8
         HavrAeUci0paY7cR8qZD0dhkAej4aXc1eB+aWqHGybrE6O3i94s7wGM9Xjmcly0Q2FM0
         1ksUa0+r8xGC+Ns8aWx69xmDhab2NQ9B/BWe8V9BAYQwuTn+XAqrExjkbH9aL74HMp6U
         j6v43z4NCJrA6LLvkifmwIvXjdNVZpHRfw2OD7a/cO1k8DXhZrcUFXA4CBq4NEwSLdpz
         RTjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532NkYplnhUNPtTl3ADR98bWbrQO/i+xQQbbzPwGjGR3QZjBtHXo
	YB45lXUVFzjr43g+iXhAiBE=
X-Google-Smtp-Source: ABdhPJzO96SN38votQH1dfJ0XoryDVmjngRxfEMvkmuii5Ttwo9yPihYsmJ8jL7IxYHonm3d2eSN/w==
X-Received: by 2002:a05:6000:12c5:: with SMTP id l5mr21872281wrx.219.1593499369885;
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6507:: with SMTP id x7ls9725356wru.0.gmail; Mon, 29 Jun
 2020 23:42:49 -0700 (PDT)
X-Received: by 2002:adf:84e2:: with SMTP id 89mr21220312wrg.139.1593499369276;
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499369; cv=none;
        d=google.com; s=arc-20160816;
        b=BdLJnyVt8jeE/8lW87j1EtJ4S7W8/bO9/D4ODdWcGW3CEY1E3SwQ9mau8Qd273jlyX
         XdQsjiD5gILZTb/MmkGMUP+szlo70aKXHYTzVEywSJKXNi3hKzcQUF87Um5KDu3jL7sz
         IyVmTqs0mugXoC6DYW1J4PxU3YQYV5bnsh4lZn4oM4qjNg19uZ/qs6JwEaHNZoOHUsaP
         E7CPkIruUXvNX20JlwmOQlRqdTsIi4/73d2wQS+H4fRg/CHiVb6eGNlcfZGTKosHhbe/
         3lqCMVK6zO4IIZCKtsA/N/rkKhAq8WZOgGKkl08glYNPT++axvg6Lz1YF8siPqc4+vG9
         9hZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=Asp8TSogiMZA/SCm6h9BxSYPnQetg8/rXici7T2+eIc=;
        b=fENYw68bi3kI6lrHk1WhjJg0BVz11m6jghOTZjrdmA5F4CNqsayBL32s6V2SiIziHw
         ckvIRZKn2drPz7d1KVJs8yJuCoATibBTiAebqMXKOidlm6U/zBhq0hoaXMT+rFPW/g3y
         1HsBAB9cjpnwp25hAABnfYlNDASRboOXLOS/iZ6mKeCRyTmYpdKhhE22s+4U2AT78+Zh
         kOsvrQjJYtzMo5vUpxDDI7AS3PBxYjRfEQrgLM6jFKasYpPYxTlYFTqPr8QgDmqY1+Yn
         b99+sENWpk+my/mp4f6QjoyuRTfEM3P3gRCb24fYk6FfAm7xrkJgWMdlq6yWdEgAumHY
         94Xw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Man1dtDd;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id q12si1243896wmj.0.2020.06.29.23.42.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49wvtc6CVvzy7F
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:48 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:48 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 01/11] pyjailhouse: config_parser: store binary format specification in struct.Struct
Date: Tue, 30 Jun 2020 08:42:21 +0200
Message-ID: <20200630064228.4742-1-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=Man1dtDd;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

Improves its handling in the code and slightly increases the overall
performance as well.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 51 ++++++++++++++----------------------
 1 file changed, 20 insertions(+), 31 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 6b9d9066..b75b9312 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -52,15 +52,13 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
 
 
 class MemRegion:
-    _REGION_FORMAT = 'QQQQ'
-    SIZE = struct.calcsize(_REGION_FORMAT)
+    _BIN_FMT = struct.Struct('QQQQ')
 
     def __init__(self, region_struct):
         (self.phys_start,
          self.virt_start,
          self.size,
-         self.flags) = \
-            struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
+         self.flags) = self._BIN_FMT.unpack_from(region_struct)
 
     def __str__(self):
         return ("  phys_start: 0x%016x\n" % self.phys_start) + \
@@ -106,37 +104,32 @@ class MemRegion:
 
 
 class CacheRegion:
-    _REGION_FORMAT = 'IIBxH'
-    SIZE = struct.calcsize(_REGION_FORMAT)
+    _BIN_FMT = struct.Struct('IIBxH')
 
 
 class Irqchip:
-    _IRQCHIP_FORMAT = 'QIIQQ'
-    SIZE = struct.calcsize(_IRQCHIP_FORMAT)
+    _BIN_FMT = struct.Struct('QIIQQ')
 
     def __init__(self, irqchip_struct):
         (self.address,
          self.id,
          self.pin_base,
          self.pin_bitmap_lo,
-         self.pin_bitmap_hi) = \
-            struct.unpack_from(self._IRQCHIP_FORMAT, irqchip_struct)
+         self.pin_bitmap_hi) = self._BIN_FMT.unpack_from(irqchip_struct)
 
     def is_standard(self):
         return self.address == 0xfec00000
 
 
 class PIORegion:
-    _REGION_FORMAT = 'HH'
-    SIZE = struct.calcsize(_REGION_FORMAT)
+    _BIN_FMT = struct.Struct('HH')
 
     def __init__(self, pio_struct):
-        (self.base, self.length) = struct.unpack_from(self._REGION_FORMAT,
-                                                      pio_struct)
+        (self.base, self.length) = self._BIN_FMT.unpack_from(pio_struct)
 
 
 class CellConfig:
-    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
+    _BIN_FMT = struct.Struct('=6sH32s4xIIIIIIIIIIQ8x32x')
 
     def __init__(self, data, root_cell=False):
         self.data = data
@@ -155,8 +148,7 @@ class CellConfig:
              self.num_pci_caps,
              self.num_stream_ids,
              self.vpci_irq_base,
-             self.cpu_reset_address) = \
-                struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
+             self.cpu_reset_address) = self._BIN_FMT.unpack_from(self.data)
             if not root_cell:
                 if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
@@ -164,55 +156,52 @@ class CellConfig:
                     raise RuntimeError('Configuration file revision mismatch')
             self.name = str(name.decode())
 
-            mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
-                self.cpu_set_size
+            mem_region_offs = self._BIN_FMT.size + self.cpu_set_size
             self.memory_regions = []
             for n in range(self.num_memory_regions):
                 self.memory_regions.append(
                     MemRegion(self.data[mem_region_offs:]))
-                mem_region_offs += MemRegion.SIZE
+                mem_region_offs += MemRegion._BIN_FMT.size
 
             irqchip_offs = mem_region_offs + \
-                self.num_cache_regions * CacheRegion.SIZE
+                self.num_cache_regions * CacheRegion._BIN_FMT.size
             self.irqchips = []
             for n in range(self.num_irqchips):
                 self.irqchips.append(
                     Irqchip(self.data[irqchip_offs:]))
-                irqchip_offs += Irqchip.SIZE
+                irqchip_offs += Irqchip._BIN_FMT.size
 
             pioregion_offs = irqchip_offs
             self.pio_regions = []
             for n in range(self.num_pio_regions):
                 self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
-                pioregion_offs += PIORegion.SIZE
+                pioregion_offs += PIORegion._BIN_FMT.size
         except struct.error:
             raise RuntimeError('Not a %scell configuration' %
                                ('root ' if root_cell else ''))
 
 
 class SystemConfig:
-    _HEADER_FORMAT = '=6sH4x'
+    _BIN_FMT = struct.Struct('=6sH4x')
     # ...followed by MemRegion as hypervisor memory
-    _CONSOLE_AND_PLATFORM_FORMAT = '32x12x224x44x'
+    _BIN_FMT_CONSOLE_AND_PLATFORM = struct.Struct('32x12x224x44x')
 
     def __init__(self, data):
         self.data = data
 
         try:
-            (signature,
-             revision) = \
-                struct.unpack_from(SystemConfig._HEADER_FORMAT, self.data)
+            (signature, revision) = self._BIN_FMT.unpack_from(self.data)
 
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
 
-            offs = struct.calcsize(SystemConfig._HEADER_FORMAT)
+            offs = self._BIN_FMT.size
             self.hypervisor_memory = MemRegion(self.data[offs:])
 
-            offs += struct.calcsize(MemRegion._REGION_FORMAT)
-            offs += struct.calcsize(SystemConfig._CONSOLE_AND_PLATFORM_FORMAT)
+            offs += MemRegion._BIN_FMT.size
+            offs += self._BIN_FMT_CONSOLE_AND_PLATFORM.size
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
 
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-1-andrej.utz%40st.oth-regensburg.de.
