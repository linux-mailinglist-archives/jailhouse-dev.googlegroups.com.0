Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBRWKST5AKGQECEXE2YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4ED251B3E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:47 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id p184sf1021119wmp.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367047; cv=pass;
        d=google.com; s=arc-20160816;
        b=xBLNjSM5f1Uga/br8QAgHUCO0ePdg3j3xt/Fsjf4NYdEtBu94aHZr0BDFZ+8H4AWYk
         yVBTH++cEk/IHakOjM48ukp2JvWmZf0xVtSXGlrDCBx+Zgqlzj8CR8ISwo9HCdGQbMgr
         8QV9TOld2Rcwt3tQaK42AEK8nK00sAKqHqR4qKCPZ9LvlbWnz6uyT6nhQOVqNE12Wg2a
         34QkxldIxDLslSOk27yOXKViGsYZfWun0Ual2YOoodSSsy5bhFqAXidrqxQsqSgj0XK0
         GVkipYZkCzAo2XDNJfAOTnBjKSqgZtiGpqkz5GAfMmTnlXCeS5burIecVGSl/Cez1pnr
         mXXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=W7Yf6jo00Hgp/lciEg3nBbSJXZRLtdcySDNFKkenbos=;
        b=gG2lIpzSfWXOB1qOSPcR+MiftjQnnlS8WDeneGEuVADAAj1CYwxXinbs4Mc9xMpOfh
         bpJkHZAWwUlvqLM+FSwj21+UFExbYIOPlIx7sK3dCuJkqnkTKi0t8sv39CPgNXx4eH8a
         FNWuhHW7FDK1U3q5i4YMsWHoCr84ugb/aP88bqw7uWmRFL1pPoOhHkImahj50Nv/lvCB
         xYp5d7mZqNkkSMybZKC6r//bWsLYBltKjNaQnzCz43/uPvV1M2fthL6Nags/YswU8Qhv
         giortaK/CKSATRPMpr8pf/f81TnF99Wr8cj3nTTLRBCMXRvWSL5Jfx+9q3iFdrAtqfxi
         FOSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=EtG6h9n7;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W7Yf6jo00Hgp/lciEg3nBbSJXZRLtdcySDNFKkenbos=;
        b=S4k2ncDhbihIASSg91n02sal6FkKn7FR5ShDLh8LIyCpOdNLU91OO8utEibTpOBNIb
         Mjz457+EWKAg+5gcumhQpJZjjx/hGjbpUlZczYsz/kgASOI0nWm0iOGedSXplHSE2Kfv
         VSuRlIrsBpj+sC7MGJHZ6OHgODAmdJzGKIlpgHmb4OlDoYFDIcZcpRieDFrL2IOCY5sR
         ROjFIaTI8nElG1x8NV6F8QslRmr+//SX62F3DK8p5Kg/HdxB0sk47JdsH8jKnyOnHrG0
         ClGRNZNp7adbGDRhUOU6+ZZaofyNGBKgi1JjPMsxBpaOcTe75HGtv2onTSkLn9GR64M3
         +m3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W7Yf6jo00Hgp/lciEg3nBbSJXZRLtdcySDNFKkenbos=;
        b=sk+xMNFOAPkhTu7qGH9x1Viia9guIKsdLh3FqzKw2EreWb/6NiH3p6emFY1f9X/DYs
         8gC6Y7x2TA/3GEM2XIr8PlmSEg2u90CNVlCKKvR4MmTUujOoQ6KHU/TCJC2W0+HDUF+j
         J6qypEBeH7hqL82LfaQxtxpXwc+f6XDJElBOK5lVE2633xmTZY5btpmkLQ5JKtGT3WbS
         gFbxMcKvM7Zl9/vT1zcgLEEvFwWvcGcNnFyTmq6xPFRadvk0DrmgBuoYH3Mc3j2wS3oG
         8Qn24bwq8Z4ESmzNmtEjSD+rckqpsKDIk/s/hWY1iGZk3gp1K39K/TUYEn92YrhPnfi4
         OYvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532qWjjNWIKEuPNh72GuOgxiuORJQSXTL31lJZfKgMpzm65iKebJ
	5XjsHyLEKYDjVis4R5xS1JM=
X-Google-Smtp-Source: ABdhPJy98G1fmOayF8v1INax8mhJvgv/H4IkPZrpfVHtyYeijIXa2MUoHt3/ELCDnD3rZEQA9QIVsg==
X-Received: by 2002:a5d:46ce:: with SMTP id g14mr11708468wrs.188.1598367047032;
        Tue, 25 Aug 2020 07:50:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6592:: with SMTP id q18ls3202511wru.0.gmail; Tue, 25 Aug
 2020 07:50:46 -0700 (PDT)
X-Received: by 2002:adf:f8c7:: with SMTP id f7mr11860534wrq.117.1598367046425;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367046; cv=none;
        d=google.com; s=arc-20160816;
        b=gz2/CDO6hS451HYaEht0QwFVCY8LV8usWbhaVeO1RHzFDgnAB8K3CvhAZXOoHJ4ZxB
         ALoZiHVeYizVcjTJptcQsWk4tYM0bfCr4FBrw91KtUAmYQu/xvgbtRyUVjm3sdWRfYWA
         ZXOhowiYPtnfAsirZEV6fP5HNsuSUEeFirTiCqSBA83Y2DCjNVwvMFDCojYRIepugyod
         T6nXSoOtF6S0vr60I1iSdwNhA5ShQ0bViL3LNw2uCEp110LILKj4D06Gr0MQ02TO0sy7
         O0YCtadFz2RJJqtmx7ob71s8TpeHewokiyllpFKRVsSjKXl0ooHA50L/Gy2ncwLFR3Ck
         kmxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=a58HI3w5VvCS8LvO91J4rCN1qX7/l6TgxpmVurO5yYM=;
        b=G1ufAXN4RI0pSnTmBb6A4HaK5bVQqxRlictp1pyRJ8Ca+otEFWZKgt/Q5H62wYff+r
         n/UUH6mJzuyvO+KgDS1aZqo2JiE75S/4/OpiD1IrXRqc6untY6BDGXgi7YAYJckNfb5j
         Rwk28BFTgrk4ALPg5dfpAYSR3Loqcrtd5iKW20p2vmkiupd1FMxd0ii8ewDS+wGp69oK
         7Mf+t9ajqK43RoDfeM/syhRRwA39/8/XgERUmOYEKSCBaAEfE8l6CnrsSZ8CitH0814A
         xCplMb8IR2Z5hmR/LRuDW5Mk3/qAJ/8O1Mtmwl2f4GtLK2SIHhCvxCBPqEh+9cO3s+9E
         XHbg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=EtG6h9n7;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id n6si106772wrq.1.2020.08.25.07.50.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3p0jVKzxsR
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:46 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:45 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 6/7] pyjailhouse: config_parser: consolidate header parsing
Date: Tue, 25 Aug 2020 16:50:31 +0200
Message-ID: <20200825145032.115837-7-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=EtG6h9n7;
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

This also enables probing for a configuration type.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 99 +++++++++++++++++++-----------------
 tools/jailhouse-cell-linux   |  2 +-
 tools/jailhouse-config-check |  5 +-
 3 files changed, 57 insertions(+), 49 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index a45aa7d7..2b47d9b6 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -197,8 +197,9 @@ class CellConfig(CStruct):
                 '_pci_devices', '_pci_caps', '_stream_ids', \
                 'vpci_irq_base', 'cpu_reset_address',
     _BIN_FIELD_NUM = len(__slots__)
-    _BIN_FMT_HDR = struct.Struct('=6sH')
     _BIN_FMT = struct.Struct('=32s4xIIIIIIIIIIQ8x32x')
+    _BIN_FMT_HDR = struct.Struct('=6sH')
+    _BIN_SIGNATURE = b'JHCELL'
 
     def __init__(self):
         self.name = ""
@@ -209,38 +210,27 @@ class CellConfig(CStruct):
         self.cpu_reset_address = 0
 
     @classmethod
-    def parse(cls, stream, root_cell=False):
-        try:
-            if not root_cell:
-                (signature, revision) = cls._BIN_FMT_HDR.unpack_from(
-                        stream.read(cls._BIN_FMT_HDR.size))
-                if signature != b'JHCELL':
-                    raise RuntimeError('Not a cell configuration')
-                if revision != _CONFIG_REVISION:
-                    raise RuntimeError('Configuration file revision mismatch')
-
-            self = cls.parse_class(cls, stream)
-            self.name = self.name.decode().strip('\0')
-            stream.seek(self._cpu_sets, io.SEEK_CUR) # skip CPU set
-
-            self.memory_regions = \
-                cls.parse_array(MemRegion, self.memory_regions, stream)
-            self.cache_regions = \
-                cls.parse_array(CacheRegion, self.cache_regions, stream)
-            self.irqchips = cls.parse_array(Irqchip, self.irqchips, stream)
-            self.pio_regions = \
-                cls.parse_array(PIORegion, self.pio_regions, stream)
-
-            return self
-        except struct.error:
-            raise RuntimeError('Not a %scell configuration' %
-                               ('root ' if root_cell else ''))
+    def parse(cls, stream):
+        self = cls.parse_class(cls, stream)
+        self.name = self.name.decode().strip('\0')
+        stream.seek(self._cpu_sets, io.SEEK_CUR) # skip CPU set
+
+        self.memory_regions = \
+            cls.parse_array(MemRegion, self.memory_regions, stream)
+        self.cache_regions = \
+            cls.parse_array(CacheRegion, self.cache_regions, stream)
+        self.irqchips = cls.parse_array(Irqchip, self.irqchips, stream)
+        self.pio_regions = \
+            cls.parse_array(PIORegion, self.pio_regions, stream)
+
+        return self
 
 
 class SystemConfig(CStruct):
     _BIN_FMT = struct.Struct('=4x')
     # ...followed by MemRegion as hypervisor memory
     _BIN_FMT_CONSOLE_AND_PLATFORM = struct.Struct('32x12x224x44x')
+    _BIN_SIGNATURE = b'JHSYST'
 
     # constructed fields
     __slots__ = 'hypervisor_memory', 'root_cell',
@@ -251,22 +241,39 @@ class SystemConfig(CStruct):
 
     @classmethod
     def parse(cls, stream):
-        try:
-            hdr_fmt = CellConfig._BIN_FMT_HDR
-            (signature, revision) = \
-                hdr_fmt.unpack_from(stream.read(hdr_fmt.size))
-            if signature != b'JHSYST':
-                raise RuntimeError('Not a root cell configuration')
-            if revision != _CONFIG_REVISION:
-                raise RuntimeError('Configuration file revision mismatch')
-
-            self = cls.parse_class(cls, stream)
-            self.hypervisor_memory = MemRegion.parse(stream)
-
-            offs = cls._BIN_FMT_CONSOLE_AND_PLATFORM.size
-            offs += hdr_fmt.size # skip header inside rootcell
-            stream.seek(offs, io.SEEK_CUR)
-            self.root_cell = CellConfig.parse(stream, True)
-            return self
-        except struct.error:
-            raise RuntimeError('Not a root cell configuration')
+        self = cls.parse_class(cls, stream)
+        self.hypervisor_memory = MemRegion.parse(stream)
+
+        offs = cls._BIN_FMT_CONSOLE_AND_PLATFORM.size
+        offs += CellConfig._BIN_FMT_HDR.size # skip header inside rootcell
+        stream.seek(offs, io.SEEK_CUR)
+        self.root_cell = CellConfig.parse(stream)
+        return self
+
+
+def parse(stream, config_expect=None):
+    fmt = CellConfig._BIN_FMT_HDR
+
+    try:
+        (signature, revision) = fmt.unpack_from(stream.read(fmt.size))
+    except struct.error:
+        raise RuntimeError('Not a Jailhouse configuration')
+
+    if config_expect == None:
+        # Try probing
+        if signature == CellConfig._BIN_SIGNATURE:
+            config_expect = CellConfig
+        elif signature == SystemConfig._BIN_SIGNATURE:
+            config_expect = SystemConfig
+        else:
+            raise RuntimeError('Not a Jailhouse configuration')
+    elif config_expect._BIN_SIGNATURE != signature:
+        raise RuntimeError("Not a '%s' configuration" % config_expect.__name__)
+
+    if revision != _CONFIG_REVISION:
+        raise RuntimeError('Configuration file revision mismatch')
+
+    try:
+        return config_expect.parse(stream)
+    except struct.error:
+        raise RuntimeError('Configuration unreadable')
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index e3debf0d..a149b9ff 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -720,7 +720,7 @@ except IOError as e:
 arch = resolve_arch(args.arch)
 
 try:
-    config = config_parser.CellConfig.parse(args.config)
+    config = config_parser.parse(args.config, config_parser.CellConfig)
 except RuntimeError as e:
     print(str(e) + ": " + args.config.name, file=sys.stderr)
     exit(1)
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 642e4fab..380f4a77 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -44,18 +44,19 @@ except IOError as e:
 print("Reading configuration set:")
 
 try:
-    sysconfig = config_parser.SystemConfig.parse(args.syscfg)
+    sysconfig = config_parser.parse(args.syscfg, config_parser.SystemConfig)
     root_cell = sysconfig.root_cell
 except RuntimeError as e:
     print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
     exit(1)
+
 cells = [root_cell]
 print("  Root cell:     %s (%s)" % (root_cell.name, args.syscfg.name))
 
 non_root_cells = []
 for cfg in args.cellcfgs:
     try:
-        cell = config_parser.CellConfig.parse(cfg)
+        cell = config_parser.parse(cfg, config_parser.CellConfig)
     except RuntimeError as e:
         print(str(e) + ": " + cfg.name, file=sys.stderr)
         exit(1)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-7-andrej.utz%40st.oth-regensburg.de.
