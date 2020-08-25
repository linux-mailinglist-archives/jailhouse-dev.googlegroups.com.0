Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBRWKST5AKGQECEXE2YI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id B5176251B3C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 16:50:46 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id r14sf828766wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598367046; cv=pass;
        d=google.com; s=arc-20160816;
        b=KXjDchFsrf0CHwJZDH5Lv9hWRCZVHuIcUYZ9FxKomsQxuin3bQ6M5z07/7ItaZf5yt
         g3cXGAl9ADSL290R3HYCu/IwD5KOT2dc7ju3/tiIQkd0PHQcfsMFbfJ0E1WOO1l0kEc6
         XX7gSmJgHqLDXtDKotfbLQcOXPZAo4hOfGbaye76azXd8Cj9tpYBHgIRkAgieWtr+F9r
         +QZcBY7z8fJwOFyPMSX33ml+kzOh+eJaUdyhhVHNxWxA2YOTzbiXJ43mWmgbGK/lWlrI
         AS6RELXTZ65ymRuVQIF7m+eh9YZmmXLeLmIuAZoazeD6rE+zVRPLgjpKPpu9NbfTVdI4
         0GyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=sxHSZwPjJ8P122kH3r+rz9pPlifYqWAXqCL6c9KNj9I=;
        b=K0sJ2/wKWs1Xth6WFs1ac2cnMQVAX6W6O33sNamH2O8727LjMMrDyskkz3FUeuevpS
         gy8iS6OX6Zdqh5ssAcrY72N3bAmhMutz8DA9zGPxDs7ifzk44Jrf/GMNWi8AMWUu+eZH
         GIXL39+dOD/czd5nQsvzgut0s3l+6xWvzvLeaknaqiDu6FqHA1a8OaZpKjfCyBRlpCvo
         N5POfeW6RFjcqCQBh3+E1O/cSJP5xhpKz7ndq7W3RVqLRz1+DVDa8920a7D9i7gU8fsf
         AmAqAL30/jBgJASkh2ekjlNYFken7mZvEYnUFMyP2bvSdgdNzbQ6yoEqdar6smDxWsHb
         qnlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=kbRIJ02S;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sxHSZwPjJ8P122kH3r+rz9pPlifYqWAXqCL6c9KNj9I=;
        b=cT0sf2teGSM/9ZKL1VKFpXzo2S7tBBOrJ8Eb4x4Tj4cy6IrNx8O8WXBGjhf/Qp/vqt
         mtYduocK2RIu0OJmyerb+6zF3L0ZxrK+DfRsg/xy3/WIxffNR+d38ozHqSsg2hKjQMnG
         A8SkBro7JjtkW4lO1JhwOi2V6V3z7iX0ZNuM82Nk3jVlaLTBV/LFjN1bUuahPJ5SmIi2
         4ybXQ6SQLiQeywPbxEAWmhppREAXEwkuODcfUIc5XGt+JE7ZGlVk8JDCGSFHubsAsIXn
         ngPCM5LVJtMm+J0M+2uHj8UKWbMC1+UyjKENUwaPrKTstmvUgGeelgOxAmbNUCf7dLqt
         Dr6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sxHSZwPjJ8P122kH3r+rz9pPlifYqWAXqCL6c9KNj9I=;
        b=rEXLQqSYpGVlneok+KOTJ6CaQeva0TnFpfb/o9zxIdv6++ijAEcFb2aS3i5KGrgiDB
         XBpZpGCUCgtjZPcOZUV029I8tu0t3yY1dwbfJg3x6tNiff+IscmexresAiRKwwHAjQr5
         Nda85vmBTred9E4V518a2JhGkcDGQlWxDiVzqquyBsZrri3/KeuSXC1HPkoouBH7Z/Zf
         G5UgYbL3mmZWPkxI+55tnrOaV3gVgx2VwS7r4QoI2ce5J4pzaNLybSkl/mBbtqDmyuuv
         uOb9f+bfOlQRw0cciY+RewBTGRFpQRNnTElcj6hLLxf2sl2a+/IRfG3tK+B6nYHFuPHa
         E2Hw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327hJ7QtAkskM2WV7o5gGAMxHlUdlhLGlhYwC3wDOBDVLt+hKVW
	dOb15I0COVOpsNdHcfgdUME=
X-Google-Smtp-Source: ABdhPJyWLs+K5QtL1b4eeYT8mQ4sPDaUs6Wk0dTcmwNmiWWQD2+NR2zlYyplJNQkxbHaqDd5+yo6Uw==
X-Received: by 2002:a05:600c:2183:: with SMTP id e3mr1957716wme.49.1598367046400;
        Tue, 25 Aug 2020 07:50:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:81c2:: with SMTP id 60ls3185611wra.2.gmail; Tue, 25 Aug
 2020 07:50:45 -0700 (PDT)
X-Received: by 2002:adf:e710:: with SMTP id c16mr11825031wrm.152.1598367045759;
        Tue, 25 Aug 2020 07:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598367045; cv=none;
        d=google.com; s=arc-20160816;
        b=hrYwDl19jhZKfNY3IwthDmLq59MLYF1qfxY2yTsJhN6Xt42sz7vLs8T4PU2NVWM7D7
         ZW5Nwq3CgxqifcWrHndkTHuawEaJpsVSF3W+akkHQ7dOLhFDxThzauDydjivZqlRKmTC
         M6F1ffs3zsov1BcqM8oVbRA0bV1dPZv/FIiAHnGT0JvBFxTYgrPIz0HS913PW48148hV
         v9IP2JeZ3JsUZXjETheqLUuaZ6OI0B2zOQAIXpBQPLvPTfLe1d46udjiRQpXDa7OZS+y
         tHLDLdB5uPTaztVYMFkUOeC+5uy7741VYydo3zsLc4ZrRA2F/eERM5cc/mNBSGU+UzHn
         TMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ozY0V4DzqfVdoKa2p9ErpK/UuhTBxCoSnvzLa/LTIk8=;
        b=yL4pE6YmtSUoH7X02Lwrxjo5+viWjVZDCo3zYRPZqBDRwxV2JApx5+3F/8Eju3gOXo
         NR7puOv+geZ4v5dF9SRBZcSd8fe+1Bs00HG3tH9PiUKHWo2AeVSOsNRl3B/Fw3BECQAB
         Mv2MSRPllar5fl/7yX7D8u9qkVfi6pQ4+c/vMpUMy7BYNm5JQ6tRyPkkLWeTO/KOKwcO
         EmMBbhP/gb/sWNCHYv7lRoLKcyr1ayC3vqsLfj9YK6EssHd0+IleETsej8BwERqbjW1g
         16xe/+miT6WO0SQ9KNlsmpNHFOMZh00lRPEjl6LbqqAs39NUmS1vjP8NT3cZBorTr+xI
         Mw/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=kbRIJ02S;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id w6si143249wmk.2.2020.08.25.07.50.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2020 07:50:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4BbX3n3NMRzxsR
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 16:50:45 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 16:50:45 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 4/7] pyjailhouse: config_parser: use I/O stream instead slice of bytes
Date: Tue, 25 Aug 2020 16:50:29 +0200
Message-ID: <20200825145032.115837-5-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=kbRIJ02S;
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

This enables more flexibility in input types as long as they provide
binary I/O capabilities.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 59 +++++++++++++++++++-----------------
 tools/jailhouse-cell-linux   |  2 +-
 tools/jailhouse-config-check |  4 +--
 3 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 961d3062..6ab769ff 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -16,6 +16,7 @@
 
 from __future__ import print_function
 import struct
+import io
 
 from .extendedenum import ExtendedEnum
 
@@ -39,29 +40,30 @@ class CStruct:
         return attrs
 
     @classmethod
-    def parse(cls, data):
-        obj, data = cls.parse_class(cls, data)
-        return obj, data
+    def parse(cls, stream):
+        obj = cls.parse_class(cls, stream)
+        return obj
 
     @staticmethod
-    def parse_class(cls, data):
+    def parse_class(cls, stream):
+        fmt = cls._BIN_FMT
+        data_tuple = fmt.unpack_from(stream.read(fmt.size))
         obj = cls()
         slots = obj._slots()
         if len(slots) > 0:
-            data_tuple = cls._BIN_FMT.unpack_from(data)
             for assigment in zip(slots, data_tuple):
                 setattr(obj, *assigment)
 
-        return obj, data[cls._BIN_FMT.size:]
+        return obj
 
     @staticmethod
-    def parse_array(cls, num, data):
+    def parse_array(cls, num, stream):
         array = []
         for i in range(num):
-            obj, data = cls.parse(data)
+            obj = cls.parse(stream)
             array += [obj]
 
-        return array, data
+        return array
 
 
 def flag_str(enum_class, value, separator=' | '):
@@ -197,28 +199,27 @@ class CellConfig(CStruct):
         self.cpu_reset_address = 0
 
     @classmethod
-    def parse(cls, data, root_cell=False):
+    def parse(cls, stream, root_cell=False):
         try:
             if not root_cell:
-                (signature, revision) = cls._BIN_FMT_HDR.unpack_from(data)
+                (signature, revision) = cls._BIN_FMT_HDR.unpack_from(
+                        stream.read(cls._BIN_FMT_HDR.size))
                 if signature != b'JHCELL':
                     raise RuntimeError('Not a cell configuration')
                 if revision != _CONFIG_REVISION:
                     raise RuntimeError('Configuration file revision mismatch')
-                data = data[cls._BIN_FMT_HDR.size:]
 
-            self, data = cls.parse_class(cls, data)
+            self = cls.parse_class(cls, stream)
             self.name = self.name.decode().strip('\0')
-            data = data[self._cpu_sets:] # skip CPU set
+            stream.seek(self._cpu_sets, io.SEEK_CUR) # skip CPU set
 
-            self.memory_regions, data = \
-                cls.parse_array(MemRegion, self.memory_regions, data)
-            self.cache_regions, data = \
-                cls.parse_array(CacheRegion, self.cache_regions, data)
-            self.irqchips, data = \
-                cls.parse_array(Irqchip, self.irqchips, data)
-            self.pio_regions, data = \
-                cls.parse_array(PIORegion, self.pio_regions, data)
+            self.memory_regions = \
+                cls.parse_array(MemRegion, self.memory_regions, stream)
+            self.cache_regions = \
+                cls.parse_array(CacheRegion, self.cache_regions, stream)
+            self.irqchips = cls.parse_array(Irqchip, self.irqchips, stream)
+            self.pio_regions = \
+                cls.parse_array(PIORegion, self.pio_regions, stream)
 
             return self
         except struct.error:
@@ -239,21 +240,23 @@ class SystemConfig(CStruct):
         self.root_cell = CellConfig()
 
     @classmethod
-    def parse(cls, data):
+    def parse(cls, stream):
         try:
             hdr_fmt = CellConfig._BIN_FMT_HDR
-            (signature, revision) = hdr_fmt.unpack_from(data)
+            (signature, revision) = \
+                hdr_fmt.unpack_from(stream.read(hdr_fmt.size))
             if signature != b'JHSYST':
                 raise RuntimeError('Not a root cell configuration')
             if revision != _CONFIG_REVISION:
                 raise RuntimeError('Configuration file revision mismatch')
 
-            self, data = cls.parse_class(cls, data[hdr_fmt.size:])
-            self.hypervisor_memory, data = MemRegion.parse(data)
+            self = cls.parse_class(cls, stream)
+            self.hypervisor_memory = MemRegion.parse(stream)
 
             offs = cls._BIN_FMT_CONSOLE_AND_PLATFORM.size
-            offs += CellConfig._BIN_FMT_HDR.size # skip header inside rootcell
-            self.root_cell = CellConfig.parse(data[offs:], root_cell=True)
+            offs += hdr_fmt.size # skip header inside rootcell
+            stream.seek(offs, io.SEEK_CUR)
+            self.root_cell = CellConfig.parse(stream, True)
             return self
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
index aab82a5e..e3debf0d 100755
--- a/tools/jailhouse-cell-linux
+++ b/tools/jailhouse-cell-linux
@@ -720,7 +720,7 @@ except IOError as e:
 arch = resolve_arch(args.arch)
 
 try:
-    config = config_parser.CellConfig.parse(args.config.read())
+    config = config_parser.CellConfig.parse(args.config)
 except RuntimeError as e:
     print(str(e) + ": " + args.config.name, file=sys.stderr)
     exit(1)
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index 539a640e..642e4fab 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -44,7 +44,7 @@ except IOError as e:
 print("Reading configuration set:")
 
 try:
-    sysconfig = config_parser.SystemConfig.parse(args.syscfg.read())
+    sysconfig = config_parser.SystemConfig.parse(args.syscfg)
     root_cell = sysconfig.root_cell
 except RuntimeError as e:
     print(str(e) + ": " + args.syscfg.name, file=sys.stderr)
@@ -55,7 +55,7 @@ print("  Root cell:     %s (%s)" % (root_cell.name, args.syscfg.name))
 non_root_cells = []
 for cfg in args.cellcfgs:
     try:
-        cell = config_parser.CellConfig.parse(cfg.read())
+        cell = config_parser.CellConfig.parse(cfg)
     except RuntimeError as e:
         print(str(e) + ": " + cfg.name, file=sys.stderr)
         exit(1)
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200825145032.115837-5-andrej.utz%40st.oth-regensburg.de.
