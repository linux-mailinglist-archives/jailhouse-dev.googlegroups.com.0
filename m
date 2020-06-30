Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2N55P3QKGQEFVDYUBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4753A20EEB2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:50 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id o25sf18258147wro.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499370; cv=pass;
        d=google.com; s=arc-20160816;
        b=SnBKO1m6KcbqJfhO9jpdQHWPbTAfXXU1xEF4H68mxSZ1ItMvKb30hFzqMbaQe1D+3c
         5NSwn0J1ISR+/ByEVxAE5c7Htc8BmbBAaSQtdxCB2fY3e/qUZiyHPnxhwGMKifLemBX/
         hV4tSfwgetnkOV2P+JHs1KGwi7HMnN5kZRYabUOHtVHYp8L1/6dmDBz3FPz+SDe7Xn2s
         xUAOe4IlS8d4OmAxdBu6b9aYeJKDjrdoLJRSjWKp8qrawXHzT+k6f5S+P+AUje27XiF6
         Iwqxv98MZh0QFDJ6zhiRaKE6YFozV2ta5OLGOAxxGzn/hepmGQ6etB+9h1Wk6yI18frZ
         clMg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=lAhdzsTk5zriwNwPnXz3oPSubwiAwxZy+DYeasrLjaI=;
        b=Y8rus5IFGeQdwtegHIjf/ne79pxMpbJxA3Pe55oBcpIMpo7bU89WFg1xzDQle9JcDz
         FaNemXUj1fWGpIcYKnH9ff3ayTl3YmeKY6/0ZZaUJ56PlTSfpmZlHwk5gutpkkTS5EBh
         w6cBX/VdAvvJaAu+N9u+LQwSHTYpr53vL9aMkOEKTUn3h1QOTvJlFI0IByHHXlUsnDHO
         eI/k+CEb/aeZBBQ1WgGcbbFYvoOQ1XPZu37fsimx44llB+z0XHfKqMWezRmcLQokz2rE
         Bf9hC5hvU5cRfmGCaE1UGRYa4vme+a7bqI7l9WpQzYDY71RzzEGGcNT8o9lz4Dq9M0Wy
         L+TA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=hhzGZCj0;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lAhdzsTk5zriwNwPnXz3oPSubwiAwxZy+DYeasrLjaI=;
        b=F0wN0S++ETh3tsbKthiqWhpC7+YLMxzRDzw7cosfAPMHZe+dU1edcVkrBoP25BehPy
         O+esdPx/lqnkP5eBI8LHHrEA9CwD9NRkKcRqtr8fsWi/Y8ino7gmEhGpLqWpWD0MqQrn
         75RwsXH3QNkmHyPiqfjBSWsLcXr2FoyQI+EOFYCdmEhC0+MwltWMmjCh2uUCqNTaeWes
         gLu0WLtY05C7lsZiQHFKEfGTrleZ6UyVc6JFH+xQY1z3tDxh82sbrdgoUGCXCkqPXISA
         7HSmgzmTPJyJUi2VCKpCh2iZ8FPDlAtBeurpE3hB95+p6Fdg9MKhbiZgJqpmENpLAN7A
         sB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lAhdzsTk5zriwNwPnXz3oPSubwiAwxZy+DYeasrLjaI=;
        b=i6PO9pq5/ercgLRyZFsV3HQxnCIesdB6VqNQiQTmbGDCrPxTJ7665tTiOtMfPPow86
         5Tm7ncHqRRuBOd/i/d+8yB+tZvUQPxcJFMyLEZw5mygaQRkuHuC4AHpaWKOLITQ5mQJU
         XvGeL/quC9NIcnqN5BXavu+Z81yottmy4YJErQip2gqyBTeIWiPdy/2mbbuRj6wojA1g
         vVtEE98zDzwdg5wSKaeHHpcgsOice7ChYANbBZv2WZLqeQhQQcKAtiC06S5dcKSQ9Tsd
         TsZYH0A7qZIml1qGJracRD11od9A5IPWJ2OPhk1uah3P6LLfKq+S+PfSt3v4bDygxEM/
         vlow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533oCteCJ9oVwd98DpkFS9yuVAP7FzFHdVsAteWUW+lAuu8CRiPf
	XWFKqkHBoepe+SscqLuKqdg=
X-Google-Smtp-Source: ABdhPJyiaL4WT0k99CNib4rloUFH3VBUW9h6VuY4UThdGNIdpOFI36R+QwRlpnjD30Cq5X2bIlUjag==
X-Received: by 2002:adf:aa42:: with SMTP id q2mr21516124wrd.360.1593499369958;
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:2902:: with SMTP id i2ls830930wmd.2.gmail; Mon, 29
 Jun 2020 23:42:49 -0700 (PDT)
X-Received: by 2002:a1c:49d7:: with SMTP id w206mr18265228wma.181.1593499369347;
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499369; cv=none;
        d=google.com; s=arc-20160816;
        b=ieP3nbvTaYntq/+vZ2+wI61P95h/tLJdlY6UlUHnvb9RhAy3jjXFOsWQiO1XNkzck7
         OTOUPfWgd18XSQS/EVkgKeVxXyMHdaCp9row6b4WMjljbJH4SvbnCHsbyltyHOb6fnGh
         ELGOBcMGnKfLOU22C4BHP1Qo/wGI8pf6aKMpQhTXNvhJ3LplilxOk3OfGJyY3AzcXfal
         dQ6IyN/JuZGDa45Q8ioDxOPK7GG+Q6rKIxHr8LWoEm8O95ZmipMgSRiZUSu/UyiQTorM
         k16w6Ji1O0BYH4/oslTcQ+TFwLUB4SgIoICjiC6fFs4rT8yMt2QMTGzgJ+7zCqTGO6Qy
         cfsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+djPP7FIf4jCZd2e9gqXePyEdp9sFrxy2H2cYD7Z0Nk=;
        b=QI+R/ewD2/qt+2rOhhM/U1snmK9vYQSHQg0Q8/bMKsDOyIUN1PLKiUsPD5xdB623VH
         armW+Jpjyv+cpvFANgbIcXCcEM4Z8MhNgCJrwqYcCg1p1p/dAcsWc/zfpJR6npJw4wTb
         ZiaMJDjIIdd8alYGkjQHf8rfZeCxnpmrPsA7Wr9Z4YCHpdI9UlQpYM9aPz04t1bai5fR
         NBrfEJUr4NP3tYhZptRH1EkntWU8MDT7olWYCNjB9YHIgsKw0bGzNvCTPaX5O+VIM3uj
         v/e1hrUgGKxq0sY6iPc2c9gQqMQ6H3Oe+9MsKBPviEsmEAzFjz6hnu0e8K29k39kzZk9
         CQJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=hhzGZCj0;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id q12si1243899wmj.0.2020.06.29.23.42.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49wvtd0g3Rzy00
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:49 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:48 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 02/11] pyjailhouse: config_parser: move parsing into class methods
Date: Tue, 30 Jun 2020 08:42:22 +0200
Message-ID: <20200630064228.4742-2-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=hhzGZCj0;
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

... and use constructor for initialization only. This separation
provides clarity on how to instantiate config components.

This commit also serves as preparation for following one.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 88 +++++++++++++++++++++++++-----------
 tools/jailhouse-config-check |  4 +-
 2 files changed, 64 insertions(+), 28 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index b75b9312..e4ad2077 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -54,11 +54,11 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
 class MemRegion:
     _BIN_FMT = struct.Struct('QQQQ')
 
-    def __init__(self, region_struct):
-        (self.phys_start,
-         self.virt_start,
-         self.size,
-         self.flags) = self._BIN_FMT.unpack_from(region_struct)
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
-         self.pin_bitmap_hi) = self._BIN_FMT.unpack_from(irqchip_struct)
+         self.pin_bitmap_hi) = cls._BIN_FMT.unpack_from(data)
+        return self
 
     def is_standard(self):
         return self.address == 0xfec00000
@@ -124,16 +143,31 @@ class Irqchip:
 class PIORegion:
     _BIN_FMT = struct.Struct('HH')
 
-    def __init__(self, pio_struct):
-        (self.base, self.length) = self._BIN_FMT.unpack_from(pio_struct)
+    def __init__(self):
+        self.base = 0
+        self.length = 0
+
+    @classmethod
+    def parse(cls, data):
+        self = cls()
+        (self.base, self.length) = self._BIN_FMT.unpack_from(data)
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
@@ -148,7 +182,7 @@ class CellConfig:
              self.num_pci_caps,
              self.num_stream_ids,
              self.vpci_irq_base,
-             self.cpu_reset_address) = self._BIN_FMT.unpack_from(self.data)
+             self.cpu_reset_address) = self._BIN_FMT.unpack_from(data)
             if not root_cell:
                 if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
@@ -157,40 +191,41 @@ class CellConfig:
             self.name = str(name.decode())
 
             mem_region_offs = self._BIN_FMT.size + self.cpu_set_size
-            self.memory_regions = []
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
-            (signature, revision) = self._BIN_FMT.unpack_from(self.data)
+            (signature, revision) = self._BIN_FMT.unpack_from(data)
 
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
@@ -198,11 +233,12 @@ class SystemConfig:
                 raise RuntimeError('Configuration file revision mismatch')
 
             offs = self._BIN_FMT.size
-            self.hypervisor_memory = MemRegion(self.data[offs:])
+            self.hypervisor_memory = MemRegion.parse(data[offs:])
 
             offs += MemRegion._BIN_FMT.size
             offs += self._BIN_FMT_CONSOLE_AND_PLATFORM.size
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-2-andrej.utz%40st.oth-regensburg.de.
