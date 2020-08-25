Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBROKST5AKGQELAZ2NTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B356251B39
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:46 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id k23sf3052796wrd.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367045; cv=pass;
        d=google.com; s=arc-20160816;
        b=TeqeZG4zh4VcNtj0t9ZQ8G+gH3s9RNgTm3ZR9oh7IvXzUbT2BQeqYv4S+t8i9pYi2o
         JtW93P5Ioh8m23HsAGcRALfZzBldWVZUapzUxxHSzyUrBfeg9UZhu6G+Ly4tAuvHWn37
         RZZsUELq5YEbKY77V+OAt/Y8+eclHxR1NVZn27D0jdEc4DBAqGgPM1uCOOSSqJ6sgqt9
         mpvHliuOzsouh2avqe5yxSPAXohnCyUlElG8//PUhiupe26MEcbVxr3b4MeIswh9lIY2
         sBBAfS0W0PcPvZS84YhhYDhbF1J/TL+xqvVsXh2mNn0X0wYMW5vOBrScmd8vdTQPwuMO
         Mk/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=m77EUP8VrfuHzeaPlgAHKlP2WOwFPaKKsrzolzXblog=;
        b=kgGkzSAGmYycUp4GLMO4hOTNRbJHOX8YHZbDgDOclh4XgQeUcZwgylr3ZHUCR3EtoC
         6IMP9TW+gRHmmgg/3dfJvgBkscIjP0ZhpaePBn+Mlotcrff18YQcayoAa9pWguy5jgtR
         c1Op2wpGEyFADzT0EDNHOVsY9M21X+qzWNlEmNgAYPP6R1u984Jek3Hh2f8B2ZW+/Fc8
         wN6eMmzLYoJZkdMiucl1DosTURJ0B5cBUjTtyw5H2x79X2rj19USkchR3Z56QMM0U8XN
         HuaNJ9aIZKKpGpt/TbcGkPBFmnvQ17Ywz/UkXOzBnk9znh1Ftg2pfZ1CHDmtWxp2ceZq
         E47Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=OcN22DNE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m77EUP8VrfuHzeaPlgAHKlP2WOwFPaKKsrzolzXblog=;
        b=TRddwtUxdul+Sq/NtHwEGXy5UxykAMbzPcT0h8f4GhpchrQRX/YN87NlcqC7HMdPhY
         nJ9V1vGRYrLwZcxcQdAxpax9EJNSjIfG5lR6QfPJuqLYoJWSYHA/g0pc43mvmxSiP6n6
         qMOaHCHJRMm9vMXrCzpE+A85dN187wsNpe3WUbUQrP8sgqr5BMvOV2wng+EY5wv38GP/
         KesX5KsDejkxqau1QdZfo4sPvmKJaDAMsserJfBr/5FPZP+62pEvlTgjGZ8sp6iWSlUm
         NLtfw+J/zuD6kgzcavK3hK3gnr/ERRQvyYsa+etVyLBIugbqacfyJjYgqnrCevPDkTkT
         9+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=m77EUP8VrfuHzeaPlgAHKlP2WOwFPaKKsrzolzXblog=;
        b=F0yiAc5UZhUlkJRSfk3Z1YxfU3oBkUR2YauHHm7Rs6nI+qfXcWtBVC97o631eGrMdj
         CpM5z4kOSy6h+nfayykKtfRSSEIIGxt/bG3VhVisk2KhgjliWjQuWfF0ctKnjwqeY7c0
         RwKCSaj2M2xhjmSPrBGAqXb81hBjdZerWQjy6HFeDmaB3WDlMzkZeYcsnxk6LliGZ32/
         h896ACgHJd3DhiFOmLcWviKS/m/9O39o3lWZKkKvsRpZbIXQbGOOymnFqJwJFDENHf2+
         94qoruFsS2FXL/e2IJF+nMmYd6Pwd93gOikIFBxIr9UP5yS9mUkO/XpqTXg7+ziEsvDo
         3lFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zU9zekVdtFWCOr86JTcXUuDQVJ+iUDFoXfZcoamC3xqWcd3oD
	8UqZqxHiPGJS3X3Jmd07bQI=
X-Google-Smtp-Source: ABdhPJxV56GbxcFcDO4/NLTxUA6xiUke7WQtivzM/AGuFKmIsRRpS1OjlccD0rehPA2teKQPOuJ9cg==
X-Received: by 2002:a5d:61d0:: with SMTP id q16mr11676218wrv.217.1598367045816;
        Tue, 25 Aug 2020 07:50:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81c2:: with SMTP id 60ls3185554wra.2.gmail; Tue, 25 Aug
 2020 07:50:44 -0700 (PDT)
X-Received: by 2002:adf:f008:: with SMTP id j8mr5130636wro.148.1598367044894;
        Tue, 25 Aug 2020 07:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367044; cv=none;
        d=google.com; s=arc-20160816;
        b=eeS+RhPTZXO5f1zaiWdRTovk30yLP70PFXCNalXFKAPAzL54S+z6tk2qHJdsahhjjY
         jc/8a7bpDD1tbPgpsDbZqQvrLuRvfJe/D2rpMloYGBCSg6Aq2ZfiVYevnBnEnp8TjTKp
         icK5x0shA72MLd5RXYo/L3m7Za41ximBLJtdB876UGkcYBPjB5+ZP7bam7YpZYyqJJmg
         I4kcThR4sAeeDFszZeXR42dVEzp0oyHiybQWX1BF+mCUpi/tv58OLyT9mKhx1rJMm4S8
         ue1yatR2apYbSaDZfGI1gxRuvf7TZdo9A93sN689wVIRUNcahKGYTDqvJMqSmSQo6sQ2
         wWGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5oR8AH9wRM/BbsQCBrtAf7CyC8F6p9ncA+k/bO0SwBc=;
        b=TDJ0U+3T7plQQ4kz1ntd9ko6AFvOkmD49W7KFhvsNkQsrZyG+xTLDwhQcDTFpUY9zo
         Oo82mwqThYg/oQI220ZU0BjuJV6y2PzI8SwW/uDf1IbEZpwqgDQgDXnK5tquq/xRhz+e
         byaFLeNWOqZpK4n7tjN8oGP1VQ+e2/+1WwYLXg20f/C/pulN46RCFknudbnT+xgdXE7L
         ZgkSk2VjPgchpSPPAsiQPSYHX7C/XvFlaA2sdUoXZ2yB6dxl6FCaxucQQWKToLP7jZjC
         cko3tJx5Uj5BmIXpwhfRlKk3VKazuBVrpCaN8vGz84Qpg1XgLrAY+DHbkvKf6rTROAOC
         Bogg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=OcN22DNE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id p11si24011wrj.5.2020.08.25.07.50.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3m3nB0zy9K
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:44 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:44 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 1/7] pyjailhouse: config_parser: store binary format specification in struct.Struct
Date: Tue, 25 Aug 2020 16:50:26 +0200
Message-ID: <20200825145032.115837-2-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=OcN22DNE;
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
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-2-andrej.utz%40st.oth-regensburg.de.
