Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2V55P3QKGQECIUOPTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B7920EEB4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:50 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id e15sf20376128wme.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499370; cv=pass;
        d=google.com; s=arc-20160816;
        b=PpD3YtepkRsamHVoGZjgOMjalXK7DIT7y+wHaYNNLooh5CoiaMag6oxq2uYQIl4lyI
         w0vBLUVhRViTipSuu3Tph07rRUKWPWTmMG0DolmoHE0Pfqqet49g6YWHg6gj9VSXoL0o
         3pzSwRUaK82+/g5tAc+tlLEjomrGAL+ZHMblTzrc/ZW5RQ5qcmmYdCzv4n8mY/5xYjLx
         zcK7yqxoH6ZCZySrVhZXY1OJApfXyovTPwnv7An/lz9LlZir5FQdHHLI3573UI+qv3Gs
         j+cvqa0X7ij1CCO921jm3gxQETbMkTT9VeK/6O9WkH1zaGpaYEN2S+xCwQTAp813FFlI
         KwTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=NHyvqguJ01sh7a/yV+6eoil1+QFrVUIBgLAydsoUcuQ=;
        b=RSJRW3ewzSW3tkCh4sJn0aLBTZh3fOzkHqVxQsfuXnrxixYcE3Qqt0EBX6p75lwlm3
         +qjaEO3wfdT7JhABK8imbcRDocbgfmiTVNTIEzvZJElLFXp6ocgc/JUsy43iqpdW1yrv
         NwZrzzStYX+WxklErk7zdvIwmVR00JfStJ5Iq3ssd3s0ms73CUL0kNROrAfU6mRbwOpR
         EKjFAhXIuREOijkXFKVbyhuE0FQcsWmT+NTwqDoRrWbPUuOY9WUYC6TOXYz4qy193DSq
         CDFD6tj/dStAy86NQG8JVBZrEIJ/T0AN/UB2LtaMsjzxH/Xc4OatCPljnZc4LszzboMP
         uETg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=W7lTzzDA;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NHyvqguJ01sh7a/yV+6eoil1+QFrVUIBgLAydsoUcuQ=;
        b=QtmnVqUONk9IHBW7qsOrXMezbHqmOLl2cnAxZy8nir32ThR7bJjbXgw7rhZJXGpDBM
         LAVAvqiZnizX5c+7fERw2vzUCMLbSNQl59ubw/apn2TprG8CxD4U3YhCtNfPdO1MLsDm
         mvTfnygy9IUbVBgC1jl2YvMrjcSHYYzl0gZOje9M9A4QHEMG7uzWXm6O+nKMHpZM3eFB
         LpLtm9zY+nxDKo16UYK/b2UIKLB6I8RXXUE/e9VlUJ9iMWDcHQ8epKGLX1CzDRFDnSbO
         82cHRyyjXWDf4R9O5MN+Lh7KSGpiCf4hbJiEmkNNVJ1XIwfR8WW39qDq8nG+T+yOS0qh
         PkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NHyvqguJ01sh7a/yV+6eoil1+QFrVUIBgLAydsoUcuQ=;
        b=lkpe031jhBFpb1mqmOqL5sjWF8KmDlVVQ0SzzGiRdBNBh99r1VaAMp0p50rSmIicsp
         V9m7WNElhOnNhsiyxwpEyNQC3FwObbf6GVZ+ndSFz83J9vZJqe9QoGkorRVMBeGINotD
         m5SvKI4MCRbLvt+ugxa672S7UR6XTZ+fo7/yOfsOYt8fZaj7qC8LmaKWWW7xuCkopJGi
         SMjYa/rM8oiIaGBmuvNkXKwkf0+k82DBgQzWPcGeD2MWo+fyTtWYnlWUJU60suWkD0rU
         YXS4atKutk1lpGcZj+BipkfeulAo+R7XOUYnBE2qy7YpyH7qKk8mBI2rY15kfqpD6IMj
         CA7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532dM86FOZTWQlmuTUM+bgA1DDPha8OIQvQltK1cet/o3F0u5tDh
	3oOG2fjIYr/xHpr1osvmDgw=
X-Google-Smtp-Source: ABdhPJx0ikvDkCno1UvLT+wA01D73sitcOs5NNLc+TOlGin816uPlBpyB2GEphhLKiHjhmEr68vABw==
X-Received: by 2002:adf:ebd0:: with SMTP id v16mr13464321wrn.241.1593499370529;
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aace:: with SMTP id i14ls9730610wrc.3.gmail; Mon, 29 Jun
 2020 23:42:49 -0700 (PDT)
X-Received: by 2002:adf:ed47:: with SMTP id u7mr21835862wro.201.1593499369894;
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499369; cv=none;
        d=google.com; s=arc-20160816;
        b=htk8kSpMUtw3o/eJjsTo0EzKhOaN/JuxmvMud18TUPZXK/nGeX/sjfWLaAbo/+3BaH
         tzdgOgd7C4hE1dftlOgiktYkYNdhZPmEbUcRMrZeORJxQDnGrQdXOnE7NVKK6666uTJs
         OFPj1Y4djhFzIGF60/m9porrioTtFQnB7o2g7ATyO0XqI/QVQRtbHgUDoVIS94yffYGe
         zTBow+X5BhLbTkXA295W8RCPNHdhDDWuKaTIJ8ecCOSXKjR4FUGOweXS4cyQj2j8LolH
         S+5M3JJ7avBzq7ZvVuMuE3MktvfXS0y+eqdvdwC/uYRNkBK3k3RssxR1JXIzKl5xVdk2
         E7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AdBYnCbPuhfYng2h5bQhTQcZEiH801EI3Ym0A214ENs=;
        b=py0WgQl1krRcfDDCiVIUCx7rWCoTVabvuz/TsUjAu6uIHhhDhqUSZAMGjfN8rioZn8
         R8GBExMU/Jt1btjl+KWR7g4zOqkP5rX8pUVHPioGuRPcfHB9C4sSuW5V6KcM1a9n7iHq
         s8jzTzI2E8Tt+36fAarZYl+DFIGSzHw4o+n+f8joEkRW5thkCSLM96X6egthXKwqMax+
         8nDf2Lz1LfTkFrLAljz94VXPAyi4ZomQiZS4Y4XCXdoUMZ+N85Gf1Mt+zKCpQphzM9FL
         HfVayVw26XRsVvheVKrUBZbmpbIJYSRSiakrgO0oXdqFzSojHaFwTgSIri6QJIfPzYZI
         baow==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=W7lTzzDA;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id f143si1121779wmf.1.2020.06.29.23.42.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 49wvtd4Vqlzy00
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:49 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:49 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 04/11] pyjailhouse: config_parser: use I/O stream instead slice of bytes
Date: Tue, 30 Jun 2020 08:42:24 +0200
Message-ID: <20200630064228.4742-4-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=W7lTzzDA;
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
index 3bb2686a..3f20bc61 100644
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
             self.name = self.name.decode()
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-4-andrej.utz%40st.oth-regensburg.de.
