Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBBXPGXX4AKGQEEC77CPQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD52216EF
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 23:21:35 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id s16sf2625564wrv.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jul 2020 14:21:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1594848095; cv=pass;
        d=google.com; s=arc-20160816;
        b=dI3c+WT2R/wgTBKSqkVf9OJTktXgZibd8FaORmwqSI9Cc0xZ1cYFRG2QiOZYMOXZbY
         aJM+Ift4lU5Ga0o7LqY9Jc/uUPys+Fe8mqtsjLi73JADtQcb/DrLKkj4B5t16hdLaYDL
         9oqk1eDN3PHDj9tndv2QEeCn2wRsJnGvBr8Jh7f8ZLenB4OJgfOg89ymiw8qibPui8yk
         y07YyUYhTzOXuZ4X8Lod0+QoIatLiRC3CNSga6/HQATlmuUWYkQd9svishxKRL6nZTFp
         2GH/3Nw9eSiX+5RHcWIAH7du+8wwRl0R98UhI7Xwsw7lbAL/fxMvTXmB66r0d4tOZixH
         9yTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dZefB0FwaJLsLvrPJs4fDuI6rq8huBGqm1tWmgRnUw8=;
        b=yCRrWLTtZ6xxh8+C0sZEyagy5l2QOdyIx0g7rSOB5Ft1aNr61AquKvwWFgUJetiIoP
         tzJVFKpBIzh0HdFu5D0KqGtexEuGdMy+RtwUXIBU6R8FkTt3NZ1ankHovv34xiZvBeS+
         7rhjAx6PBqI5Tt+tWgAxHt5oMokiANaqTGI9vISWOmZumgPMeeu1v7m1H9nTgX0rFqOk
         WQYHfLljahOmGLleDxM0yMLBXn1t+naG59QAcoNy/UXjMe6+Z83Wj8uBpBXdQO+7dUTj
         UX0JWrs4MNa5mHlgQ1NFGbkMoQO3/uMwPnVBgx1oSFX5+IhvNYhaAMypAMFm2FTOlzx7
         UUrg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PYrl0Mst;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dZefB0FwaJLsLvrPJs4fDuI6rq8huBGqm1tWmgRnUw8=;
        b=mBLS4PE2mYRtD0/1llPyY427V2T6ctjDbwF02M00S/L0veAvFvX/b/rhib4w0dlNVh
         HqRtj6TqqNBJqvlJjN/wbO1ug2cjLolCfqhREygi4K5ndIbmgcV5BBYoNg8jEFJ+GOIy
         +xR9GB20f4nRsG48w0s+iRAYxvJwzoelDyP771oYtGVWPF1vWJmOEXbwR+t5iDtDHCTJ
         L2tvgAWAaVuxp4t1dcfG2LjpJe7697E7O5kuNB2YRw2Gk6lCPCI4XrlrLCKcF78ARwGx
         K7aGA1cjILntC6GUOWwHOLsI0b/6uaK6zh39u9/W6Kveo3RqV66RymT+MZ3E0y7aKl8z
         aNaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dZefB0FwaJLsLvrPJs4fDuI6rq8huBGqm1tWmgRnUw8=;
        b=DB9NtXm3miWZTzJ0GA5KD/imOtQIcDtxeGhorCHYBZ9y1wp/R98xaKJyZ8IJsrxEmp
         f8zm7mIQK99jMWALoe90KcOMtvcoDGHjogKjjKeqrnH1yUwybehidotXhS4vfTUTiA2l
         KZrvsFOi+lb5UCQdA2dqOAR9ngV3GsbtvQHM+pxM3l8Hdls5EHOkLTz5GD/THYWFLi5Z
         uSKey65+era7L3qR81YdSKiJfE+5SgvebeS40rV9P4TgJgyRMxFmyVOeMV2uveWqqdCV
         x6/6QQ33KrSQbFelvWPYUDdv2+b6Qcqib1FuZpoekKffavcZFzGrumt4SJ22mt1gy9k+
         UG9g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5305IreARwIeRVM/nXDhTlKfvqgfE63YlyL3R5mhDli1B1JZK8SL
	3Z8cWeFdFFV1sLFkZuCF/Yc=
X-Google-Smtp-Source: ABdhPJyMDX9B8Akvp2VEUb1CJwRX8ov4RveOtQ9vIB2FSZfzOg74XnrlrFvm0qt2SzE6+HcYZnKydw==
X-Received: by 2002:a5d:498f:: with SMTP id r15mr1578892wrq.175.1594848095001;
        Wed, 15 Jul 2020 14:21:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:f58d:: with SMTP id f13ls2926698wro.1.gmail; Wed, 15 Jul
 2020 14:21:33 -0700 (PDT)
X-Received: by 2002:adf:ee0b:: with SMTP id y11mr1581198wrn.360.1594848093598;
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594848093; cv=none;
        d=google.com; s=arc-20160816;
        b=fYv5Ih3AUkD0DFyhg+3hAE3grCsjUO8BhUehzWOrb15+viaf2Doc3+vesBJPpUpMuO
         vQOnvWTAbdXNynmFNYEMPaBn3Trs/fYBtBS5g+oB1+X7PB+B7beIi1N6Kivt9fB+0tpe
         F/TlP8wDJxeVpoeSpxSWx953SsVpGUdSOut8QzlI7NFoFCNovn7YMC4jM+H7dikRzZtY
         nNPTk1VjRx7KGESN4a1Xw/xmVr7ky3WAPU2xQwNjUZPDy1ArpbCcM7ry/BbU0sG08sep
         ScIh0efYWyDQFCgONoLBV7CLAwIZ/uCQYWDJQ32I+gacKgubKI4x+5lun+sc828n9A5r
         YcEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fQEeW7lqjmHO2PpAnaanLJGufk16YD4CwyLBr59YwDs=;
        b=NJmxHX05qUYDdhG0qNC790W7mUTVXwp+wgmTMN7Jyu6mlCwd7jDFlafdWN9DVzCpIb
         QE6w3a419ZrM5adUp9hd9e0ote+FDn9evxS70eENua9npVIfD/jlWQ5OjKdlgYsgToWp
         NHz4sSH4pBbvOfILLfNCU/9M9ihO+9So95sAaWRxb0rxwawlwUOl0nFxqhBPno5cwrd5
         7qvzs9EL942MRu/MPjlVDG/nQih8QpnhcqFYc7atZTT2JoGxbSJZv4LVoEP0dB3+mrME
         jBOSldclRSZQ3XSYIuNkpWx2f1RYqAdFc5D3W+1tPcNm8yqyAOnxjDjegWcCopBBicQn
         PHrA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PYrl0Mst;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id l4si199087wrw.2.2020.07.15.14.21.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2020 14:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4B6Vgd1ywpzy2b
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jul 2020 23:21:33 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Wed, 15 Jul
 2020 23:21:33 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 6/7] pyjailhouse: config_parser: consolidate header parsing
Date: Wed, 15 Jul 2020 23:21:18 +0200
Message-ID: <20200715212119.48052-7-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=PYrl0Mst;
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

This also enables probing for a configuration type.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/config_parser.py | 99 +++++++++++++++++++-----------------
 tools/jailhouse-config-check |  5 +-
 2 files changed, 56 insertions(+), 48 deletions(-)

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
2.27.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200715212119.48052-7-andrej.utz%40st.oth-regensburg.de.
