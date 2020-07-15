Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXPGXX4AKGQEEC77CPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8702216EA
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:34 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id y16sf2613185wrr.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848093; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ag0hP1YKCXf0BtNPj5yW8QhlNwUMQ3RAbgdH1dkVtmHT46NSccXV0JLXAMdUmFJXsH
         uMR3X1ABVGRCzCF7Nhzj4IfMc6RnquzR5c2iSf2AiWGW/4m6bVaMqGq0p0kYPcvBrre7
         W9BuTI3Ulpdey+PtnEaQN4ImGrg6BU+HIQE1DiaPqaW26MA3SpCaCEblWCM5p6RhCTIw
         xQRSAiyDCRrDRSa8uWNbyolJX7enR3SW2KBcs2/luSTPHQ99J726szi29GCNpju/5NOI
         /E6t8orBU44R3qf5DA4W9w0zPahHBd5BxTQyRMjrQF7S5Z0WAYxBx4mV1BZmKDwAknTx
         BmOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ko2roqRP0fdRqjM/yjpKdDotycA7k7Hp/lZIhPpp310=;
        b=0lmrtBPAG1hm5X2pCljL9Cfx208z8q+eyHldHNmnlwxiinPPjt41EVTjsdns772i2O
         L7zbjjc2y+Fa3b8WVKX+g1JIlQ90bG+eW/nkjBBJ7M4LpxQRgfF2wYA0RDqVM1KNujFM
         ZSjl0lSiz5eDodOrcV8Ms7HDh1w5Kk7igJoowdwekrCQwcNgKji8htn7w5iPqD8f+uRN
         beWOjz+t2iQ2uNz4kLW+28Mo5vn8dCYoipyYXfgEnqPaQsVa0D157exniPyE2J6mn5Pw
         rWyO4I/0HD3lZU6eIidEd2y50SXye18Kldp7OydSWVTOSpZHzw4+O9B3yQKIVo4gCkj6
         /L2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZxFnrLES;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ko2roqRP0fdRqjM/yjpKdDotycA7k7Hp/lZIhPpp310=;
        b=U8Zw+2SPh0nGKeUU7zyqu4F5e77r9AeGQdUY6n/JEtww0WBftjPGZIpE9sooE2/l1k
         VisaLWis/VPTe4j2X8SpFBHcA6pjfAwayejE58H9OxNYztvWfzHiCbLvlqNy/uklVWYA
         eG6fKyE6KlDp+MQrHnoKPN6isDtal5nFEvkzCb/HfJJx2bSapqulATGie7fJhpxHTbde
         PxUDpqErYy5Gx2AD1wIuUIeUoMveE4E01+wSoarVbGNHLzUwZattgt8BiBwk7al82ZOt
         uEUi/CRUXzKjpWqX+6UWXMz7+E0g2kbTq+fEPDS5/VWP+z9i6RfPCnD8joLV2dPvfWlS
         /IyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ko2roqRP0fdRqjM/yjpKdDotycA7k7Hp/lZIhPpp310=;
        b=TNe/7xNsglvxzfMv1AuZq6aR8h+jPa4Cy5WOBKdP6Heuc7M3iqp5czOT9Zb7+CMlbs
         /B6YB5Kw6PlHxlOQt3HuqaX3iN9KX5da4pIHvrE9zp8uS8NcGbzhhkBWE7Ok70ZH4/6M
         7RACt2rRhjRQmlp/rAhqqmivvyiSzYzcaJWkxaTeiWAB96bAiVgx7khziLp0M+Qx2Yi1
         xwb4qmI+BZE9NATFEPX5kfjhrn5W6rY3d1VrOLGBe1bZuwzMp5tzs4L/iOu/w2hgCfEU
         QDbAS+taZdteC5Clo+4kj+0DGPJXFhtfdu9TBeXucDZR2x9Ovas4XFgYqNgznYUd0VEv
         +Qfg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533xhMFRDQ/9BMZdnEAmRjkABoLmZZPV5VoK/vbmuvbM92uyeJGW
	l7n8vK6D04Qzl2X+Fqg6SSM=
X-Google-Smtp-Source: ABdhPJxDhHrQphgUwYTIGuuanWs0/MZvp3WNPwmV1o2tMt3nF6GOe8H88M+0/Ogu5rdyfxsd7pL1ZA==
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr1635505wra.118.1594848093747;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ca:: with SMTP id 68ls2931014wrc.2.gmail; Wed, 15 Jul
 2020 14:21:33 -0700 (PDT)
X-Received: by 2002:adf:b1cf:: with SMTP id r15mr1635452wra.118.1594848093115;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848093; cv=none;
        d=google.com; s=arc-20160816;
        b=mr1Aa7/iAbATh5/S7cqUxg2xB/RrN4a4DUWWwjFGr8GVJCVQA7qcZyWllqNjcj4ZPe
         /Gsn4NKB6caxo3PIHoKbSqTwsX7diWaLvAz1/jcLxAzclaA3jWJZG+vXvhRQ5wzOmzFe
         oUeYm6/RA247mVVSRa03IuLwB2InuV0cFf+4Thunbg8sH4j1ehxpN+nRZVmwnztHqYY6
         NqilOJB7muUWcLKawe1ieQE+YBUczQtA0Xm7oxibxMGTVuDBRvokL1ZuB02qIXXpCHhj
         /3LmbdengFPxIglVCIBHIlknbakljUwHxyeE0U2zVjhxN4D9Bp5LgE2LQNd7+dt0dylR
         uAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=h2NOLF8oaI7Ixc037p5BskNY/IzR0OXK+SQcZLUtCwU=;
        b=MM0CXwe0DS9FnXgSA45qHa2ZPmVhtN0+vjsd7hwYReVvZZQwxcLTmxdOAXQ4lg2RGX
         cJp/sVgQvp9DsRWqQEZX2eWEWrvvWyUTKyGkTmdvOi7CwUYfmTAsWGzdMgAse75BNK4S
         jGmOjKHQjY8v60QhV1idPtWGfgyZUwNYUEcqufLgQgKwblFfbHD5LAzb4IU0p01LuiGY
         cKPm9KKjgzuFFdrBSkWrXJitftO82k0IZggIfPURgyQzv6ZAeXwhGByzO+kAVKoEa1KF
         I9nYg4ME2iOlE5oRB31+ritchNxCRAPumaHaJaT+LaSBDhxa6kBJlj/q165Fo5oBoilC
         bo8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZxFnrLES;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id s18si189718wme.2.2020.07.15.14.21.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgc5dnPzy2b
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:32 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:32 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 4/7] pyjailhouse: config_parser: use I/O stream instead slice of bytes
Date: Wed, 15 Jul 2020 23:21:16 +0200
Message-ID: <20200715212119.48052-5-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ZxFnrLES;
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

This enables more flexibility in input types as long as they provide
binary I/O capabilities.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 59 +++++++++++++++++++-----------------
 tools/jailhouse-config-check |  4 +--
 2 files changed, 33 insertions(+), 30 deletions(-)

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
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-5-andrej.utz%40st.oth-regensburg.de.
