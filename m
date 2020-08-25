Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBROKST5AKGQELAZ2NTQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E46C251B3A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:46 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id m7sf5215499wrb.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367046; cv=pass;
        d=google.com; s=arc-20160816;
        b=CeI/XhqyVx9aBaVMBRpHXZezdBtjviZs3eDYrsbWbZ0GFTpotaQNqbtfnDjg3fBweX
         +4HC5fFlQ7lNcXHC89kOq0bU3Ms9igsI091eRgFzOyQiVSepugiGwSlra4GnwLF08Hp2
         4QJLgD+UTIWI+4C7RW6aQUnOHWwv2PMec3HTC3ETQuVUjKv43TgZp308VY3QzoeujVBS
         iOJ0jpQ0LxRtmLyT74xUyF/U2IkpKpX7QaEZU98lK8+JpDEwrETKGprANDvpXc83ODme
         OQPIQ36125hcbtVLNiWA5BriTvmYwl4m7VrlJSmQ0fXGAhEEo225PbKYF9B1Biie9jeH
         xfDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=D9UB7sSfkfOE3QCygpygpTue/AmuYaxemn2Y5I5Qpx8=;
        b=tmvijqRKRsdYUsSBJUtX+3hlQOIBNAcodwm2Y2zQ+K2PIVQQCxkAV3ORM5GXufhCpE
         BZ1WmaeniqDRbSJYkCv+fNayqP8WmKSE5Fzig8DcJ6ucPyPRw41uEigHMPYRn6to+3uv
         UMCsijDrJx48SNgnTgX72P6am7g29aOiEmKkPIA2dZXohmpCKx4OE77eMyR3GtoM28Nn
         uCuquAY/FPQ2oM8aoy0S/TbhAqQDhloGn7R9EleICF4g503OFHSExBTUsOKCVGUqYkX0
         xl0X8xo3aBCMeOnqia8kBWXZon9nGDtEMXRGmb2rX30NhZNwisSyQWvWI3tgL9/IKV7c
         pauw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=mj0drNtE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D9UB7sSfkfOE3QCygpygpTue/AmuYaxemn2Y5I5Qpx8=;
        b=A3/dZNl8F0SKF+WPdMEDaAdfyFPGeg7J+sWMlMwSiqxKl+542D6hFVbl1pQoI4umAd
         OtztybaJ0peXWU30ZwQNch+vgW15EQ97gMJOZH8PLN0FpKtcWPv+MesAv5sfCYVP6Y/4
         alaJDwaougrV4cucuG03EuC1pYPNhgVEOab3XvkQEmpspPI5jw5xHspHWunCwDLNLrnB
         WwBRZGSNyIJrpJ5y2byoDaJEFHldIau87ZLUQqBHbvXUJm620Q6z7t4OUJ/fzhypvpj3
         UWflBA7lER8fl7hUNTiZU/d/EU5P/qgGEsIuLHxEDX4rJoCujWOM66Yfxfkwtt+qdBLK
         Gv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=D9UB7sSfkfOE3QCygpygpTue/AmuYaxemn2Y5I5Qpx8=;
        b=hz9wiVf4UhZW7xTNLAljRv7CBaYjGbokAgIgBnzlkzjvsM9Om991XgTKWgFMVhkGNC
         T4Z3Mq1xKdjMwtATYc24m7ugkEWhuM6gL+FmkGq/UVxi4rteGeJgULAs356FEtlh+67z
         9ezX3sV4/ihA8kDcUIjukW1Nq6Cpzj17s5mnjjHQcz6sA+h+v+klh5S4cQBOz4dD3vc/
         H2cFqJmhgAqQ0ULcNj+A3F+CBrzHet9grixbW5HL39TYCSmLxJ2t2psY4WDtUV32vNQe
         /MEDWi4rOq+GTeJvT649s1xLuFQZmRKsq1Wi84POeEdnEvI4mavPw4jtCS9IN9pINxnv
         1jkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531pxISe1wS/qEkgnyDH+2LIc/frwy7zqoRjghIexkUwyMnCLY0U
	phfknIPW3Mft9tGwvsjYRT0=
X-Google-Smtp-Source: ABdhPJzE8uicer/ImV+7sfP9x+HiT8RMbCxK9+dKwTvfiBJd7EMrAJmotUI3vc5u6NE7oWfdarmIfg==
X-Received: by 2002:adf:edd0:: with SMTP id v16mr11914205wro.271.1598367046004;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6592:: with SMTP id q18ls3202434wru.0.gmail; Tue, 25 Aug
 2020 07:50:45 -0700 (PDT)
X-Received: by 2002:adf:d849:: with SMTP id k9mr11708660wrl.115.1598367045209;
        Tue, 25 Aug 2020 07:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367045; cv=none;
        d=google.com; s=arc-20160816;
        b=ICHJmT2H+8edMFdTX6quCspZ8ZmIrKlVXd2LllOOdm3+x8Bh8OcuM9NuhXEdy/sQUM
         r5RadCd5Klr5q1WplcjOh0BcC1TJvgJfKM9zIgFbYiT6tPWvDlI9yrHm1zUtVplbdLbi
         2DsLNo+a9yTlx5TSS6v8YYKI+6zfPai9CIJ3OcDTFTSmfrDy1XYfmi9k6E3VR4n/qHc1
         I3uZfehf4Tfut4UNFW6fKz+6CiULU29n4ZezL942HN0IuJbkHYk0tW6knBXexMaugUYU
         WzVJMgzjU5bP3nez7dCR+Z25dGp9Uwq0Im7Rv0ZucuF3tKMtKjx2FEOc8arNofwjPkpI
         Wf4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=T6WHDq4CAw03dHoLNuW3eDxhzHB91JfRZ/g9i4NftTo=;
        b=YdREBGZK8C/wx9Gagh0jGl4GuH7t90emSbFOdBOrA2Wre4GczMYTNu109B0W1DrRA0
         Se+llt4kWP1koaAWgG9hrSqVupLHRgc3vBrpXEXurR+JHDM1x0anBR5istSFBzsi9JOF
         rRUppDxEZ4I4VrQhdQE0IzzMCy05sPeXW5SzDfz9WYAg4z+A1eIK8dOFmSiMeL3uFwoT
         7X3s/F9cqHSCtlVidNm0dZuCBPKL3Abs88+za+jtVnnYGw6UlVwOkm4mTEkitySoet1M
         Mk6FXKIlYp4Sfz7aZvzsUdbF6t7M4iOA6lxjmizB+WZ2LHmVEQxrihXmvSeug3Rl6fd/
         j62g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=mj0drNtE;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id w127si131478wmg.1.2020.08.25.07.50.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3m5xxYzxvQ
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:44 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:44 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 2/7] pyjailhouse: config_parser: move parsing into class methods
Date: Tue, 25 Aug 2020 16:50:27 +0200
Message-ID: <20200825145032.115837-3-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=mj0drNtE;
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

... and use constructor for initialization only. This separation
provides clarity on how to instantiate config components.

This commit also serves as preparation for following one.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 93 +++++++++++++++++++++++++-----------
 tools/jailhouse-cell-linux   |  2 +-
 tools/jailhouse-config-check |  4 +-
 3 files changed, 67 insertions(+), 32 deletions(-)

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
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index 4178d4e0..aab82a5e 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -720,7 +720,7 @@ except IOError as e:
 arch = resolve_arch(args.arch)
 
 try:
-    config = config_parser.CellConfig(args.config.read())
+    config = config_parser.CellConfig.parse(args.config.read())
 except RuntimeError as e:
     print(str(e) + ": " + args.config.name, file=sys.stderr)
     exit(1)
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
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-3-andrej.utz%40st.oth-regensburg.de.
