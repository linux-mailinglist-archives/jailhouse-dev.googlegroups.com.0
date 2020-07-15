Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXPGXX4AKGQEEC77CPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DEC2216E9
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:33 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id l5sf2423398wml.7
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848093; cv=pass;
        d=google.com; s=arc-20160816;
        b=lV5aSxhGPfxJQ6YwKURrdFEr0isj99er2fLY4STL9ST5QjjmmUSxXYyPj2PmeIrczk
         phgRU5BSfWIVerZfjwlZQObKF09IyUzdWarAOkOR1nmObXdvIqpakKGQUlAd0n8Kf7zE
         IkoCDBV2cssJx8Au4Ypgc6leFwPcjTatI98ovqF7f5oN5Btan7aD3AQu3EeOvxJz3rYv
         4Sh1CwIro3zSqEpUQzV4k6/gWQAz2hSawXN4KyeXW/drX7G0GBQNSwBbMoP2tG9hA4qg
         XKC7/Zke02ytHsTfwT+KLq0IaqEUoYKdykLGCpNBDfDeZjI1yblKvz74FBmbI1ShV1bk
         Xd+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LZpPsBTW3zPVNU/Nw9hmRjljrJT/hmKHziwrOKUu1Bo=;
        b=E6a542LXvh3Qsh2dRswpWFv3LzyAR6knAHkAf3wgHwhjkv6msZULPU6V9ONyTrVVJJ
         JjFM2LuH03WPmUJGb24t1LGgvbQvMyAWaN+Wh/lMoQtKZhglIvRvicA2gvFHetAPyhMI
         z5tbbHXZNxZs10SOAd2jOLJ+UaBrCRg0FvocGZ6uHdfyvCiRjTSZT6fWMNbT1LQ5bPGS
         ayMrx02E5qNyn7qtR9+vYbjEQw5mRm2dIhyw5rB4B4MDgJ6n4gafUNaOLQrjLnzhdH5F
         cU7z8kFnNdymBTkg3gIgIefmcgf0/GMVy2jSUjdkt/cZWsEUmKyYl8osZL9CbxgA0u6x
         fKUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ORab9BRS;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LZpPsBTW3zPVNU/Nw9hmRjljrJT/hmKHziwrOKUu1Bo=;
        b=RSBIsQ5iVVOW3h5L3ppJAtSunBP1EjGPMUN6b+ukXW57d72qiLmhcaZMYxmDZf/Dua
         m60/Pe3s82iTOxObUEvf2K7fHioT/56to/54MmOu1GcM7EKBg95J06dkd9P9Q8Rap01v
         d8ToFDs6+orDD2uZk/3Gjajvzuzi/q3wiYYGzCczRF1MqqZvO2iOExxB0+UEK1pjFY+C
         GTuLTVP88hLUEYWXcFl7lW8ejARqK28O0FQTJvqe4WO2jxW2+1Xg3Wdk+/r6yc2DbW5T
         jN4AJQnISui1HyEWOoemc7CooV4G6BwG22n9m5hXkzd39ZupE5krQCnhvsxedo/wgmgE
         O2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LZpPsBTW3zPVNU/Nw9hmRjljrJT/hmKHziwrOKUu1Bo=;
        b=Zk+nly+XJwSH7+mDQr4ODc1f8C2SivzmObtwWkKOk+UROTIx4iDiWljtGCWi2NZHBl
         ZO9zJQj96gzYlORka9YhodteWrn9Ayg3A9FZs/l3hSdo4QFWq05XiFiRa3Mg1VBIPPM2
         hK7aECn9nPSr46msyjjBu+x4AaGWWbBzLIxfOAxJtXtyI9Pg/PzPD75v9oOkMqRbQ9F4
         qFTYIP1gdDpWg7CdD1xc+yizX2E34frIRTdjqQq8FYddDth6Pr3etrP5DXDwjutxVpk0
         PC9FQ6x5adyqh8F28jhE8saAySsmAByqg8qJN1aO9Rj8L9X2RbSZ9Veu/AV5uYjmq4JQ
         l5Gg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53010CgcgeVYvksnJVoTnbbiqW3UafqPx4BTYQ3XIjhNqVNbhtlz
	8/HxByYV/KhGNJSJHKGEbhc=
X-Google-Smtp-Source: ABdhPJwByQT17J19vxXT4yJtEm0w3ZvjDoX6XDmK52i0sEeo5foIH4ZfHDl7299MsYswQ6r1k03hgA==
X-Received: by 2002:a5d:4604:: with SMTP id t4mr1662644wrq.0.1594848093154;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f58d:: with SMTP id f13ls2926648wro.1.gmail; Wed, 15 Jul
 2020 14:21:32 -0700 (PDT)
X-Received: by 2002:adf:fd8b:: with SMTP id d11mr1582598wrr.371.1594848092602;
        Wed, 15 Jul 2020 14:21:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848092; cv=none;
        d=google.com; s=arc-20160816;
        b=XmW7JTnUbXVkOztdcKzUqMuR5zDs7G9G2smg0exZLu11OaUyc8/3OLzNgg1xquvSzo
         kpFc/4I/JVXeHvpNdMkkwDumdfazeLRE/Qya7cOupCcCJpG9REaUrslrbrGtqjKhf9Wv
         qW1eHTALOIrhkBCXuvxcBXVTHPlESA8X1uS4cq2SuqJTgHxNFLB2BUaPCu4kLMZodgIk
         wq3pR1BYUXFjQFW0BDVqODXVxZDZjFrQikJXoZx9dQQ2uv39hh4DZKxJKrfWDoB8LZ1F
         zuVOrymKg7aWK27YMhOiFUB6NDR2Vn+ZYbtK83WpyPEASJHiGGiyQxDRwcI3JwRBaJNr
         k1Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=0Vdajua81iL63/lIEYkyHI/5QB7y6oY540JkTHzHSzU=;
        b=JDzmKppFylZmV8fH2jGOF969IYIb3tPN2r9RQ//s9t55gzxNN696Lzhl4gWTjtimYf
         AaLD4ev4CR+DMBe8SrAeOME/9N9ttmo7Y08oLyrzCvqwz7OTZ531BNuIKnI4vKWxKy+e
         arHNs2cbN70Td+LzhYERKR7Glt3g5TWM+ugr0Qr+TG4vuJy76/e3RVWSF5D0QDb7Uvvt
         pF0adjBlqGFGIVrYp+Zpe3s1dRvbTJ+xZ1MGp/b5Y4QFfc7PJri/rYVbMDqCUl8huh8x
         KpgmJr6nBNoIN3RJXo1cpCdcTTQ84oVJgziIcYROt50Dn179Lb4SKqnsNzHxD4dJyzpR
         1hiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ORab9BRS;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id q12si44698wmj.0.2020.07.15.14.21.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgc26Gnzy3S
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:32 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:32 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 2/7] pyjailhouse: config_parser: move parsing into class methods
Date: Wed, 15 Jul 2020 23:21:14 +0200
Message-ID: <20200715212119.48052-3-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ORab9BRS;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
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

... and use constructor for initialization only. This separation
provides clarity on how to instantiate config components.

This commit also serves as preparation for following one.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 93 +++++++++++++++++++++++++-----------
 tools/jailhouse-config-check |  4 +-
 2 files changed, 66 insertions(+), 31 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 9b828f2a..a6780d61 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -54,11 +54,11 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
 class MemRegion:
     _BIN_FMT = struct.Struct('QQQQ')
 
-    def __init__(self, region_struct):
-        (self.phys_start,
-         self.virt_start,
-         self.size,
-         self.flags) = MemRegion._BIN_FMT.unpack_from(region_struct)
+    def __init__(self):
+        self.phys_start = 0
+        self.virt_start = 0
+        self.size = 0
+        self.flags = 0
 
     def __str__(self):
         return ("  phys_start: 0x%016x\n" % self.phys_start) + \
@@ -66,6 +66,15 @@ class MemRegion:
                ("  size:       0x%016x\n" % self.size) + \
                ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags))
 
+    @classmethod
+    def parse(cls, data):
+        self = cls()
+        (self.phys_start,
+         self.virt_start,
+         self.size,
+         self.flags) = cls._BIN_FMT.unpack_from(data)
+        return self
+
     def is_ram(self):
         return ((self.flags & (JAILHOUSE_MEM.READ |
                                JAILHOUSE_MEM.WRITE |
@@ -110,12 +119,22 @@ class CacheRegion:
 class Irqchip:
     _BIN_FMT = struct.Struct('QIIQQ')
 
-    def __init__(self, irqchip_struct):
+    def __init__(self):
+        self.address = 0
+        self.id = 0
+        self.pin_base = 0
+        self.pin_bitmap_lo = 0
+        self.pin_bitmap_hi = 0
+
+    @classmethod
+    def parse(cls, data):
+        self = cls()
         (self.address,
          self.id,
          self.pin_base,
          self.pin_bitmap_lo,
-         self.pin_bitmap_hi) = Irqchip._BIN_FMT.unpack_from(irqchip_struct)
+         self.pin_bitmap_hi) = cls._BIN_FMT.unpack_from(data)
+        return self
 
     def is_standard(self):
         return self.address == 0xfec00000
@@ -124,16 +143,31 @@ class Irqchip:
 class PIORegion:
     _BIN_FMT = struct.Struct('HH')
 
-    def __init__(self, pio_struct):
-        (self.base, self.length) = PIORegion._BIN_FMT.unpack_from(pio_struct)
+    def __init__(self):
+        self.base = 0
+        self.length = 0
+
+    @classmethod
+    def parse(cls, data):
+        self = cls()
+        (self.base, self.length) = cls._BIN_FMT.unpack_from(data)
+        return self
 
 
 class CellConfig:
     _BIN_FMT = struct.Struct('=6sH32s4xIIIIIIIIIIQ8x32x')
 
-    def __init__(self, data, root_cell=False):
-        self.data = data
-
+    def __init__(self):
+        self.name = ""
+        self.memory_regions = []
+        self.irqchips = []
+        self.pio_regions = []
+        self.vpci_irq_base = 0
+        self.cpu_reset_address = 0
+
+    @classmethod
+    def parse(cls, data, root_cell=False):
+        self = cls()
         try:
             (signature,
              revision,
@@ -148,8 +182,7 @@ class CellConfig:
              self.num_pci_caps,
              self.num_stream_ids,
              self.vpci_irq_base,
-             self.cpu_reset_address) = \
-                CellConfig._BIN_FMT.unpack_from(self.data)
+             self.cpu_reset_address) = cls._BIN_FMT.unpack_from(data)
             if not root_cell:
                 if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
@@ -157,53 +190,55 @@ class CellConfig:
                     raise RuntimeError('Configuration file revision mismatch')
             self.name = str(name.decode().strip('\0'))
 
-            mem_region_offs = CellConfig._BIN_FMT.size + self.cpu_set_size
-            self.memory_regions = []
+            mem_region_offs = cls._BIN_FMT.size + self.cpu_set_size
             for n in range(self.num_memory_regions):
-                self.memory_regions.append(
-                    MemRegion(self.data[mem_region_offs:]))
+                self.memory_regions.append(MemRegion.parse(data[mem_region_offs:]))
                 mem_region_offs += MemRegion._BIN_FMT.size
 
             irqchip_offs = mem_region_offs + \
                 self.num_cache_regions * CacheRegion._BIN_FMT.size
-            self.irqchips = []
             for n in range(self.num_irqchips):
-                self.irqchips.append(
-                    Irqchip(self.data[irqchip_offs:]))
+                self.irqchips.append(Irqchip.parse(data[irqchip_offs:]))
                 irqchip_offs += Irqchip._BIN_FMT.size
 
             pioregion_offs = irqchip_offs
-            self.pio_regions = []
             for n in range(self.num_pio_regions):
-                self.pio_regions.append(PIORegion(self.data[pioregion_offs:]))
+                self.pio_regions.append(PIORegion.parse(data[pioregion_offs:]))
                 pioregion_offs += PIORegion._BIN_FMT.size
         except struct.error:
             raise RuntimeError('Not a %scell configuration' %
                                ('root ' if root_cell else ''))
 
+        return self
+
 
 class SystemConfig:
     _BIN_FMT = struct.Struct('=6sH4x')
     # ...followed by MemRegion as hypervisor memory
     _BIN_FMT_CONSOLE_AND_PLATFORM = struct.Struct('32x12x224x44x')
 
-    def __init__(self, data):
-        self.data = data
+    def __init__(self):
+        self.hypervisor_memory = MemRegion()
+        self.root_cell = CellConfig()
 
+    @classmethod
+    def parse(cls, data):
+        self = cls()
         try:
-            (signature, revision) = SystemConfig._BIN_FMT.unpack_from(self.data)
+            (signature, revision) = cls._BIN_FMT.unpack_from(data)
 
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
 
-            offs = SystemConfig._BIN_FMT.size
-            self.hypervisor_memory = MemRegion(self.data[offs:])
+            offs = cls._BIN_FMT.size
+            self.hypervisor_memory = MemRegion.parse(data[offs:])
 
             offs += MemRegion._BIN_FMT.size
             offs += SystemConfig._BIN_FMT_CONSOLE_AND_PLATFORM.size
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
 
-        self.root_cell = CellConfig(self.data[offs:], root_cell=True)
+        self.root_cell = CellConfig.parse(data[offs:], root_cell=True)
+        return self
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 12d3dbce..539a640e 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -44,7 +44,7 @@ except IOError as e:
 print("Reading configuration set:")
 
 try:
-    sysconfig = config_parser.SystemConfig(args.syscfg.read())
+    sysconfig = config_parser.SystemConfig.parse(args.syscfg.read())
     root_cell = sysconfig.root_cell
 except RuntimeError as e:
     print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
@@ -55,7 +55,7 @@ print("  Root cell:     %s (%s)" % (root_cell.name, args.syscfg.name))
 non_root_cells = []
 for cfg in args.cellcfgs:
     try:
-        cell = config_parser.CellConfig(cfg.read())
+        cell = config_parser.CellConfig.parse(cfg.read())
     except RuntimeError as e:
         print(str(e) + ": " + cfg.name, file=sys.stderr)
         exit(1)
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-3-andrej.utz%40st.oth-regensburg.de.
