Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2555P3QKGQEW7IIPNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 7035720EEB6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 08:42:51 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id p9sf18317072wrx.10
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593499371; cv=pass;
        d=google.com; s=arc-20160816;
        b=0/sXyOLIDxnwV0t5jZvCjyak0RXa5bB/m6ozjknDQqJzNhu/Ohe0t6kFNW2DkYIpPi
         /4kKxnTzgwS2SiE8HSoNhQ/B/hypxS/H0+jZVzctW6bJPN6MKt0o7YBgBZOdWy+F1RiT
         Dx2e2hH9rB3sT6FO15zmud0ao4MJ5VQJEaLggyY3N71ry3Um65QjZY6dfwpsGTOScBdS
         JWnhjV/CFt1Mu2BsB6EDH8HO8rma7vziM8VmPW6Aus9p8yFUS0PWLVOMHp+Kx1JzKq40
         WePZiT7CE0v00TwLBmf7zb3miVwtnJEpLMInfg0J6aXXRxa5+/VzMh9Fd1Y1OPY6I1w4
         4Eyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=z2yxoljn0nkdD90sZOpcGWhP6rMQg1T3iKCwJCqj0PI=;
        b=j+xpiRgIDGiIzzUmrpCPBI9XzfbZDrdxuinyRFynlEMKxfy9DGmi0XMtkqsZbmP9ta
         /IebG9zzHXww7vjL2tI+mBNt7kzzzweMj8BNmjl55EKtA8Z1C858jhqygwaEbNpKmiZY
         ENMwLdVGRIcbEwPkmAPTmM66D7g9kyV27BRlGhTKk9aXfjQFzGDRkSpj2c0m0wfNU4y3
         0zrNzfxRrbnC+QEHJALFeXEAZ0TF6NYkCOuO17sfZIdS35+9005buUEhrvWql6q+VKou
         /RLr66OEbMRMKGnxtPVTEio7MXUjqVJAaAgZJdcbDB5hNOO8o/DYdiG0mEEgCtx2uzkS
         7SdQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ELdVh4jH;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z2yxoljn0nkdD90sZOpcGWhP6rMQg1T3iKCwJCqj0PI=;
        b=ZMPmC5vsELcPscv0GcXx1DTet8wmpeEz9YVVMLSjF3G+mj91D16pYvctPu0hnDF1QT
         jBSG6KVwe2Cl+AigRdRBTu3xEyWk9hnIqMm5d0qPwAQ3EdPPExrWk35tpAsExnPI+zCu
         F2m8nTY0FRAWPlQogfL6/GTYh291d7VC+ERTiXrfSVPFqRIGoKE4hZxeLyyTgTuV/iHs
         g1iKu1ETbIGGZOW3yoQ+cJirYJUn0KtbffCIaFAzvT2voPIKxiTbUp+iVR1p3yuhUleE
         bXmzGLzsbyfIXWl15xERh67d2iBbjtU1T2KPKyOizJXZznTZ1nDTLi8Rj72nxWRGx0fA
         5M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=z2yxoljn0nkdD90sZOpcGWhP6rMQg1T3iKCwJCqj0PI=;
        b=qRZt+hNQFMvEKvLhQ4KWstLE+P4IsuxZ4fGgl1EAO8I+AAiowow/FTrTCIgyuxnerT
         yxoBe8ZfnXWuWBpM/a9pzOlcs2IvFev3S/WJkw0ghwCtEFWov/1s6RAV0FKJQc73LpPL
         oxC9Z53eGCCqzP0V4QB26JoL0mioOm5ngtAxpALjXKSj/W7XtCbfpjH2wCe54uX6y4Eu
         73/qutGDBoUA48o7HGhQApTw+fwbkWNFQjEFIlVgCi7fx1PcZD5CXYnGHiKk/MIFCQBV
         wKwuT0YUQhIE9q8MNJxn0d0GEVTU6YhfSgnP/YBhRkx5ObSNUT6++qD5iG7ueLiSqTc7
         +44Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ZCaEiiyCOp5eFVervfFUOWFdRk7WfeIi6aHL2lCBkckiA64wh
	N91SEyhwk0/umy6Aaj3IdoA=
X-Google-Smtp-Source: ABdhPJxCOQs5IdJSbn28OJGDMUo8yu/XgF3imZVkxTPIFE7GDOlFlsv7SeQl0Xj+cBpkRPfhZDc2CA==
X-Received: by 2002:a1c:32ca:: with SMTP id y193mr21221134wmy.83.1593499371191;
        Mon, 29 Jun 2020 23:42:51 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:aace:: with SMTP id i14ls9730656wrc.3.gmail; Mon, 29 Jun
 2020 23:42:50 -0700 (PDT)
X-Received: by 2002:adf:e4cc:: with SMTP id v12mr21215962wrm.92.1593499370748;
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593499370; cv=none;
        d=google.com; s=arc-20160816;
        b=qdB6jb8KNmkjfPXZ93cQpBJbt06/Zv5bqfA42N1p3P2iUZ21Oq7XMDwYQV7kiWXg6w
         bopRzarq0AE0J7hD26UX4uaoiwusrt3tRcnyVYZ1nU5yZnC4JsYbzTyhIomV+0hYjf1b
         E9sMg/TH5gJ86S7GToHmGDS3rVyozqNsEhvekH7Z3EU7Lw19nGX3VLfo1CQ8pKIcZ8xu
         NfCeNSzCsx0nCevEAW3iB3QRzMJ15Y3nLixu69G6XbNQOB6UCKtP7qTQ3VYtaSFOLDrs
         NrDUHVOEC0tUBbpsWxiLco9qZREiTtrYUZPde+QTuAi4eiVQHpORRvhRndufVJKZN9EM
         skzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=fQEeW7lqjmHO2PpAnaanLJGufk16YD4CwyLBr59YwDs=;
        b=fIzqKgj/Ry5HOyguMSO9vVg13r28HldmD/mGHGXsbfkikS9BeQhd8F02zkFJ6WkyZe
         60jQkIgNRjBw2nPylfauxBuwHVITZqNqaQ1acYJ3iXs+ZXAbjRhCcEFrSriSRkgOM+w3
         aJm0pCoYIuo1M9/b27nB4XoF2ZTA87qOp96TksbxF4Mk/v6yPgFr/tqOBSVrZqyNP4KM
         8kLyCtgqCtZHyLOJR71PD9XUUTo0WwgyONZQQ4QoeSVpfCiEXbSl6S8nKirEFQY37Jh0
         7m3r+jVCMnczgf6UWXbLkTjD2zI4bepHGkipPyVcluWtLJNJ7/LByd5a/ygK1YrucvK1
         +Nmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ELdVh4jH;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id f143si1121782wmf.1.2020.06.29.23.42.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 23:42:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 49wvtf3kKVzy7F
	for <jailhouse-dev@googlegroups.com>; Tue, 30 Jun 2020 08:42:50 +0200 (CEST)
Received: from base.lan (2001:638:a01:8013::138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Tue, 30 Jun
 2020 08:42:50 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 07/11] pyjailhouse: config_parser: consolidate header parsing
Date: Tue, 30 Jun 2020 08:42:27 +0200
Message-ID: <20200630064228.4742-7-andrej.utz@st.oth-regensburg.de>
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
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ELdVh4jH;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200630064228.4742-7-andrej.utz%40st.oth-regensburg.de.
