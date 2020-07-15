Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXPGXX4AKGQEEC77CPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DF2216EC
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:34 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id t7sf1335750lfl.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848094; cv=pass;
        d=google.com; s=arc-20160816;
        b=MpytmH+7cUbpLWxP86tnexQnCa7pBTNe3N/EC5MViKDamy61NEUIMaZlJkBnPRo9LJ
         t0bORI9fdm78moJXfJqaZYzfXDBv8IPdj+RoswaIibZ9N1qqCJpxpr5hLRpsL8zgnKZu
         2kRZyZid3l7D1k3SnA7+vUfLvTmsEbb3/8OljBAoDfs/TlQs2+ma2BC97uXLwuQd6ahO
         wh6qEqlxdLn0OJUWJGRfl87WXmPjPx7RqQFT1V3NFCyvy5fevjxi8uL1NocYXl+bUxUG
         Sybk8DZG5VQhzwUn3lqWFUeoKA0SzeEgJtSuqtrIEXNQi081SOGwW7y53XCJmkGtuYvu
         fKPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=KvTQk+fj+N0N+RHDzo+8P08zh7yMd801X5HdB0S+us8=;
        b=H2RuJ2N+RnltjRML58FFvjejuN9DKdIdPjl/dWOKZT50XUHYs3XeOWyEpArkguggqe
         bUulVyBpa1Hcm+JQInoKLSlsBBhTm5fF/rNA8FvXTm3R8MpS3MbEAsadfb/Z3LY1YZUT
         0CsHThUJNGusOf/zx3GnGaj+9M4pkeNqVATmPraZCf63RqFSbZ7fetg95h0S4ouxvj3q
         9WD0kxbAmBcmZsJ01146sAQeFFH1fOzpS+1CvTJpKs8cBrUKbpeQO/0KFAQuSkBXdnlk
         ne5HK75Lw2VDW9fEIoO27ad8BasqpkL1/4TV9ccs/yLoG69rp84pkgZ34iwn/E4v8vrf
         ROig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="NE3n/9k4";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KvTQk+fj+N0N+RHDzo+8P08zh7yMd801X5HdB0S+us8=;
        b=mWo4EqQSgquWmCOdxmK6qmjbDhkn1c6oC2VtCchJ3TjH1BRhSKwPUfeql/QwX0+4kk
         M2fmx2luGoQ8CRSXIDblHyhr+crq3IRKcbvPQ2Aeye4ZLUwDnhMWRf5VvOQYXPV/mdPM
         IUGFWjmSgXfsNlKNq3wCqeyou3myCr9snmwfdfIDsKnxg3h7zIYYVwj9Z8/yZu5dwrhH
         d0j8fqc8EjNOL219RLvQx8vsF8I3d1lmYgAgjKIwRp915maxhK/Rdu+QOdwY/rudzaGv
         JZhvRqREBVJUa5UAZ0VLJLy+Eb32DZxwB/3dkm8WufJGafWIUyeavLIM+O0WMLm/HUJh
         4MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KvTQk+fj+N0N+RHDzo+8P08zh7yMd801X5HdB0S+us8=;
        b=fdgxvC/R6bl4yLZW7RYH2K2whuLsjs/4iUMu8GbAhHo1Ar4JMfXZGCq7HS/FkR0fuP
         32fLreWDn148o0gONzyX4BQXsSfmo/awtI8UyJF4TEA2LidbnQVZ2GxOi+lg094mEh1t
         Do5WuxaANuUz2K5aOhzVIwwIP418FozdObxVzFBoIPsqF5fac+mlMrWOesRwL0kSCVyg
         5XpiuMaGeCFKtoqEC2L1fUXmPRrPKsQpqH3ImqCZJKt+B8rWspvxkaC7MDZLjCk5FRfg
         81OgYroTjBe42qF3i9LyTbY3eNQ2DDHLIfVw6g5ZOMBeyl3EjbTZ5AnT+7FbnxCTdw3t
         mNoQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533WJMhFSyrYMfGY5BXKwo0AA83GaWsECJ5XWB2bQbRwZWkSVCz1
	Z7oyvyRtDQe1YESAaLz+bjg=
X-Google-Smtp-Source: ABdhPJxqqol1utX5qg0JnAVKVi+LGAvV9CXNajKgLgBBVFOOjtnqANSNTobDl4Kdjta/t33CPcmWYA==
X-Received: by 2002:ac2:5691:: with SMTP id 17mr458724lfr.209.1594848093892;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e33:: with SMTP id o19ls162094lfg.1.gmail; Wed, 15 Jul
 2020 14:21:33 -0700 (PDT)
X-Received: by 2002:a19:7014:: with SMTP id h20mr443559lfc.49.1594848093033;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848093; cv=none;
        d=google.com; s=arc-20160816;
        b=Mh5pJAoamlNBnLDpR9mU7Z+U6EkQG+pCne2sAnSiR1KzEhWax1NRpKVW2pPlUXrjh4
         TCyAAm5xKsI4aPAHdUekaUyd4bZXusuaJ4EZFb8mXuOh9ySeqtV6HDJ50NK4+n2u/F1A
         LjxIieyoMOXB5sXbHFdhyhRjawB+pWFQV1LmZwAEalX8/mdPtCaKCC6/8d7ibLBWeSqa
         9oXaMs779VUml3TKU5o74yNnSdZvsM4tKacQHkrfPHhiDx9ZA2+coDaJvTKoSKB3NFP+
         TXnXE5bEkVy/QM5SGDloWIWq6oumG2+RbW4/h8DEp9DOcJLvKMa6T0LYKTH5zi5Wsqd2
         5hJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=6Uo65FOFs4I7oYVToLWQzo5C74kVoslsdZqvOGPwGcE=;
        b=hFP2DiGL80mmYtDY15/o4c6r2tqQWAhMe0FR6urqL5f/zrhY31BlhWCsM22UucEGtO
         ovOKoDHNvrQRY4TdiJ88LT91dN5/qVsrRAxvFK9DuC9ul8B2hB9UMvAGfMT8YYVfV6m5
         AP3MARPu3XW4zE7m23TRrAt4ok0ETy5ZQ9Zc3P/BQi9fG4AX5r/69TBaGy2FGuEDGuhY
         ngpDLlZkNz+xnrCA6Or1Z/ZU6swBJWq/nmNxpVXEfwr60kWl+Kr5NheSmMqXVtvjcPAS
         9I+iO2TTQztCW9tUNehNHVc8MSSVpYJbeTbIVSxiys2Qa5XHggHbudmeaaiNCFu/IjZi
         YCEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="NE3n/9k4";
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id r21si154273ljp.0.2020.07.15.14.21.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgc0s69zxxc
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:32 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:31 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 1/7] pyjailhouse: config_parser: store binary format specification in struct.Struct
Date: Wed, 15 Jul 2020 23:21:13 +0200
Message-ID: <20200715212119.48052-2-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b="NE3n/9k4";
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

Improves its handling in the code and slightly increases the overall
performance as well.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 50 +++++++++++++++---------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 47350c6f..9b828f2a 100644
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
+         self.flags) = MemRegion._BIN_FMT.unpack_from(region_struct)
 
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
+         self.pin_bitmap_hi) = Irqchip._BIN_FMT.unpack_from(irqchip_struct)
 
     def is_standard(self):
         return self.address == 0xfec00000
 
 
 class PIORegion:
-    _REGION_FORMAT = 'HH'
-    SIZE = struct.calcsize(_REGION_FORMAT)
+    _BIN_FMT = struct.Struct('HH')
 
     def __init__(self, pio_struct):
-        (self.base, self.length) = struct.unpack_from(self._REGION_FORMAT,
-                                                      pio_struct)
+        (self.base, self.length) = PIORegion._BIN_FMT.unpack_from(pio_struct)
 
 
 class CellConfig:
-    _HEADER_FORMAT = '=6sH32s4xIIIIIIIIIIQ8x32x'
+    _BIN_FMT = struct.Struct('=6sH32s4xIIIIIIIIIIQ8x32x')
 
     def __init__(self, data, root_cell=False):
         self.data = data
@@ -156,7 +149,7 @@ class CellConfig:
              self.num_stream_ids,
              self.vpci_irq_base,
              self.cpu_reset_address) = \
-                struct.unpack_from(CellConfig._HEADER_FORMAT, self.data)
+                CellConfig._BIN_FMT.unpack_from(self.data)
             if not root_cell:
                 if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
@@ -164,55 +157,52 @@ class CellConfig:
                     raise RuntimeError('Configuration file revision mismatch')
             self.name = str(name.decode().strip('\0'))
 
-            mem_region_offs = struct.calcsize(CellConfig._HEADER_FORMAT) + \
-                self.cpu_set_size
+            mem_region_offs = CellConfig._BIN_FMT.size + self.cpu_set_size
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
+            (signature, revision) = SystemConfig._BIN_FMT.unpack_from(self.data)
 
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
 
-            offs = struct.calcsize(SystemConfig._HEADER_FORMAT)
+            offs = SystemConfig._BIN_FMT.size
             self.hypervisor_memory = MemRegion(self.data[offs:])
 
-            offs += struct.calcsize(MemRegion._REGION_FORMAT)
-            offs += struct.calcsize(SystemConfig._CONSOLE_AND_PLATFORM_FORMAT)
+            offs += MemRegion._BIN_FMT.size
+            offs += SystemConfig._BIN_FMT_CONSOLE_AND_PLATFORM.size
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
 
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-2-andrej.utz%40st.oth-regensburg.de.
