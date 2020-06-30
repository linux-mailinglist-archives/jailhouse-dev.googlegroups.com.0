Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBC6A5P3QKGQEPRH32NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id DE01320EEC3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:47:39 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id z12sf11312569lfe.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:47:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499659; cv=pass;
        d=google.com; s=arc-20160816;
        b=SW2z9ZpooA3ZqSU6cDle3XqECVBPM1ves9bdESpeE3pq9glpfRwAzq0qnf4yhnHY6K
         c4bigfWMmGaq2dnw/KT1W8vgJT/BnybhlYEenPPCLlFoza6RIFJhjKzXI6c+aumWYWve
         1PbXcB3G4PpPdP5qAkW5sCsunQLZAbPhqMs1SqAdPLVGaKadjDM8UM1lkuWxIQsZGs0M
         c5Wyop/yE+/V4dVyjgd3n6N/chfQmhsIRnwxSUHNsS2X2XgP4ZQi+dMqfC+kFWUDTsAO
         nnOra9ETu8AOWVhOf5G1Df0wDZZAXZXbu2oxy9PlQUFCdAffKfWj56Y4L0hp572/mM6S
         JTmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ER4NA/emvr/D1gA8i3N/8PRRgH9cB/1OB3FZjxJNC20=;
        b=MpLHjAzaa+M1sRQ6l60eamBTcRVILNYx8JwfQKnwMofPZOhDGs/rdCOLGBF8WaeZfK
         53wKeBkmlFgnIJXsnQ7EifoNhFxCeOzTTo6G/wdnKtMmtlz81UaxSDMlU9XvtGFvwJvo
         KCEIA0g+NdOSORxtzASruh7r55oyIz6Qc4emWz69+Efg0Mp7jz3+10QxZWDG4FnwFPQL
         RkuGqAhX8vgkNSTBNX87XakcKm1fCx/CNNE4EGHfA5XDgCP/JyEy5LaBt33LYxYQWjf2
         VQQD/5U0Js9BQmDUUWFf7bF7HbyLEO1jS/y/AO5e2A/HODz7kg+LXeKnK1KaaKGxFWfj
         NlSw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=OjHkPseC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ER4NA/emvr/D1gA8i3N/8PRRgH9cB/1OB3FZjxJNC20=;
        b=WSnKYW5YDo79PrJFPpF3cc1R4CT6+F2dE2ZnKrwoNLjGb160id0cCNR3ZXvY4sP2Qx
         nClvkE334Vl61kzqfZ54B6x78DgjxbSBHKVBXwQTF4QdVhRTwNKOXmuaXVyIg8SSlgJe
         ZhcAeMbZVLkJGhEH6ONVxQCLMrQHAIuNpmT/ZmZDqKd+b5SUUFi4jb1wuutIwxqxjP7j
         Ag80UWQ+vqlwecM+o7Owb7NLmesy7Yh2dCG/IQl0kDVGxQ1jXOd8HQcrZEGO3j8rj+hA
         yeNthXE229EVQFHE3IrokGzlc2rCvJylPM+hWB+F24dr4AT48hlPLEn1FnnjFTHjqPRX
         MAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ER4NA/emvr/D1gA8i3N/8PRRgH9cB/1OB3FZjxJNC20=;
        b=HFK/bUO5jHTZ5uWArZWJPTQfAMFcAps1+2xE/uMpFQMB8d0LDOov0w2qW9cM6rYi4V
         ybqxJk09E4iOZ37AxRZXVQm38uL84RyZ1JW/Sfi4/o9yOUPzAh5UjRgxtCaHlhZICwVk
         vZ6OxYIVgDoGkU+Ye1P/8cOpfWoBN9CwOuMHDCjwt5Wsn3DuCh5iKZ8QyUWWV4HchtID
         QSZG+Kv4hTFXi1Cwte9AE/frRQy90K0+Szrtw16D6bZ49IC6ZfHx6m1vLrSJCwXnKTYM
         q9mDj3cOIsaYqhuJuRNqDhWgAyZ8Gvn1+M0C2lwMRsL7/TJFWsldjKuzJKgmHEGbLq/C
         p0zQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533DXNKTldq6M2iPqQGZTGgXMEMrwqexDO9WDJ7FvNyAL8J6fnpX
	Z5fBj/fpyFhjO8/ETfJa0fY=
X-Google-Smtp-Source: ABdhPJzH9bM5hECvp6YwjAoMyBmgzBsYUrqWeCCXji/uJUt1piPr/1NE1xG30hvKoiELkG2gbGdL1Q==
X-Received: by 2002:a2e:9c51:: with SMTP id t17mr855516ljj.333.1593499659368;
        Mon, 29 Jun 2020 23:47:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c188:: with SMTP id r130ls592406lff.2.gmail; Mon, 29 Jun
 2020 23:47:38 -0700 (PDT)
X-Received: by 2002:ac2:5691:: with SMTP id 17mr11314246lfr.209.1593499658764;
        Mon, 29 Jun 2020 23:47:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499658; cv=none;
        d=google.com; s=arc-20160816;
        b=gLmww3K3/3iRUE0I75Xb3RBa+owHrGLMvc+4JvRma9aTaHodq/I/z4y2zCnbo6jnFa
         wR3306x96FDqDDu/9suLLRBkYir1+9XhsN4o8Rp6AhPuxRCacEn/I4XlQ3hjVuj06DxE
         9GzWdOrZVvSmHOOMyabgSMR0nxpphtyEFHcU0E2zkqZoo8NU7Js07CdmxyDnmfWPek9K
         WAiUrFYhXnx0RmVromSmj+xqe337wji+AA3WGttNEX7T/Tn4c34zLnsfK/er88/zo2aF
         5dlCXuNFP3q93Bk9tvGB2X4JUYTf4ZvpeN4Pa6xVTjZP1TO/X2gWUFp8r/pffrFvsCcc
         gz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=43mkliYSHJDaUL038nFVYs6vTWfHugab6uiYrrhjXB0=;
        b=z9JKeiXz8jfNSqqpVBJO7/orT5A5LqRHBig7PS04kWePfHc/mHqD3mE+I04CgjG+vu
         Wtm2GXp7sw5kWRxCrMDITi8tVA9mwvKCSgzEdyUZCXif10ma6Rt5v2kP4JJQJ6YQa6YW
         bSd0UsoZFrIW91TJn4GgJpekx/FdZKsh5LDs4If14OLeyt3//208DPXEraTvDhOU5Jn/
         rm2X908KT71bA9oJLEx4a+8TzeEV0EAYOofxwhAq5sH6B1fcjwoeAiUhf7bt4sRuoAcD
         ErolW36wpTlneNEKeQv1GZaEnwEj6nyhpZpVE08Sr6LPSUbq0jDCfr8crfienxJAYDMI
         99Sg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=OjHkPseC;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id l6si81658lji.1.2020.06.29.23.47.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49ww0B0xMPzy76
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:47:38 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:47:37 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 11/11] pyjailhouse: rename config_parser to config
Date: Tue, 30 Jun 2020 08:47:30 +0200
Message-ID: <20200630064730.7210-3-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=OjHkPseC;
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

.. since it is able to generate configs now.
Also remove 'Config' suffix from Cell and System class names as the
config module itself declares them as such.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/{config_parser.py => config.py} | 22 ++++++++++-----------
 tools/jailhouse-config-check                |  6 +++---
 2 files changed, 14 insertions(+), 14 deletions(-)
 rename pyjailhouse/{config_parser.py => config.py} (97%)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config.py
similarity index 97%
rename from pyjailhouse/config_parser.py
rename to pyjailhouse/config.py
index eaec4fa2..ff1c676b 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config.py
@@ -251,7 +251,7 @@ class Console(CStruct):
     _BIN_FMT = struct.Struct('=QIHHIIQ')
 
 
-class CellConfig(CStruct):
+class Cell(CStruct):
     # slots with a '_' prefix in name are private
     __slots__ = 'name', 'flags', 'cpu_set', \
                 'memory_regions', 'cache_regions', 'irqchips', 'pio_regions', \
@@ -488,7 +488,7 @@ class PlattformInfo(CStruct):
         return self
 
 
-class SystemConfig(CStruct):
+class System(CStruct):
     __slots__ = 'flags',
     _BIN_FIELD_NUM = len(__slots__)
     _BIN_FMT = struct.Struct('I')
@@ -503,10 +503,10 @@ class SystemConfig(CStruct):
         self.hypervisor_memory = MemRegion()
         self.debug_console = Console()
         self.platform_info = PlattformInfo()
-        self.root_cell = CellConfig()
+        self.root_cell = Cell()
 
     def save(self, stream):
-        hdr_fmt = CellConfig._BIN_FMT_HDR
+        hdr_fmt = Cell._BIN_FMT_HDR
         stream.write(hdr_fmt.pack(self._BIN_SIGNATURE, _CONFIG_REVISION))
         super(self.__class__, self).save(stream)
         self.hypervisor_memory.save(stream)
@@ -522,13 +522,13 @@ class SystemConfig(CStruct):
         self.debug_console = Console.parse(stream)
         self.platform_info = PlattformInfo.parse(stream)
         # skip header inside rootcell
-        stream.seek(CellConfig._BIN_FMT_HDR.size, io.SEEK_CUR)
-        self.root_cell = CellConfig.parse(stream)
+        stream.seek(Cell._BIN_FMT_HDR.size, io.SEEK_CUR)
+        self.root_cell = Cell.parse(stream)
         return self
 
 
 def parse(stream, config_expect=None):
-    fmt = CellConfig._BIN_FMT_HDR
+    fmt = Cell._BIN_FMT_HDR
 
     try:
         (signature, revision) = fmt.unpack_from(stream.read(fmt.size))
@@ -537,10 +537,10 @@ def parse(stream, config_expect=None):
 
     if config_expect == None:
         # Try probing
-        if signature == CellConfig._BIN_SIGNATURE:
-            config_expect = CellConfig
-        elif signature == SystemConfig._BIN_SIGNATURE:
-            config_expect = SystemConfig
+        if signature == Cell._BIN_SIGNATURE:
+            config_expect = Cell
+        elif signature == System._BIN_SIGNATURE:
+            config_expect = System
         else:
             raise RuntimeError('Not a Jailhouse configuration')
     elif config_expect._BIN_SIGNATURE != signature:
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 224c5fb5..9f767cb8 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -22,7 +22,7 @@ import sys
 
 # Imports from directory containing this must be done before the following
 sys.path[0] = os.path.dirname(os.path.abspath(__file__)) + "/.."
-import pyjailhouse.config_parser as config_parser
+import pyjailhouse.config as config
 
 # pretend to be part of the jailhouse tool
 sys.argv[0] = sys.argv[0].replace('-', ' ')
@@ -44,7 +44,7 @@ except IOError as e:
 print("Reading configuration set:")
 
 try:
-    sysconfig = config_parser.parse(args.syscfg, config_parser.SystemConfig)
+    sysconfig = config.parse(args.syscfg, config.System)
     root_cell = sysconfig.root_cell
 except RuntimeError as e:
     print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
@@ -56,7 +56,7 @@ print("  Root cell:     %s (%s)" % (root_cell.name, args.syscfg.name))
 non_root_cells = []
 for cfg in args.cellcfgs:
     try:
-        cell = config_parser.parse(cfg, config_parser.CellConfig)
+        cell = config.parse(cfg, config.Cell)
     except RuntimeError as e:
         print(str(e) + ": " + cfg.name, file=sys.stderr)
         exit(1)
-- 
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064730.7210-3-andrej.utz%40st.oth-regensburg.de.
