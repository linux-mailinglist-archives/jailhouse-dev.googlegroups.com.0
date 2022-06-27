Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBL7B42KQMGQEBKNRY2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7488B55B9EC
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id l9-20020adfa389000000b0021b8b489336sf1192627wrb.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336560; cv=pass;
        d=google.com; s=arc-20160816;
        b=GY1AhAmE2OnRxKmzagO3O1je4hED6/q8jsljs0Ipz7hDWBfVYiHPvyY1FaA40pdGY0
         9UpS4BEFbmGUQZrFkgLPR8WrUSbgn5JXdRdfPmcrC7Xe9nbv8TDLNhLmTLaH7UpeMqKM
         cnum8tWtXXCNVUBji9uqOpBHQy9MkzvVe62YFCa5NR0IYPGtbT85QrMX2BXylsrrraov
         dKekIxAQ7jH6RbCV9MPfAGb5cF2SfXZdOYD0zXFNKm6CrDRiXYDCtSAd9zivVUczUuVn
         nQkl0AJQ2dz177mfheIUSe8VaJnYla/mPyg8zIGFBQENXfYc9Pj9imXrz0AiQv4dq6b/
         rC9g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ymla0msB0Cs10jwO6uVWQ9GZfgO7Z+L1TXaPwrVQhG8=;
        b=qiE8bMqwYNRnluHeP2QnwK7B7Elq2aHP/gfNEJLoEzcf/p7ZcRk2HY0jr5eIDjWRLA
         JnG3bDZBdQqcNC7BAPP2guzZfLfWlbYdykXXDsj6wV2rvQfdY1xp4IOrch2hFRJsTL7E
         oR0AJI83JUJwV4nZ+0oN9MzvEram7f0pnkzVSb5Aspqzae9rF7VBi5h1qr+ziEUX2bf1
         KcQbSEPmeOqNYJ17SupPQ8UP6l1WOJhpU7F3tSeN+uTSAjwCszXxhS4aV8aCRHGt5GN/
         xRIaoNm9MwkSOnuHO1IBFyZYKXytiKQsV5KQe6STMNdICcRLrk1U7dHLkoIujxeTwAxG
         fxwg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=FOp6kYhV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ymla0msB0Cs10jwO6uVWQ9GZfgO7Z+L1TXaPwrVQhG8=;
        b=V1l8xoqU7/rU/RBK6L3B37yF+Fq8x+BPT4oVs958prHrr+6oYzfk2AGUoi0U/3aYNW
         zFpEn0HVcYeV8piYKVyWDxcPnMZ1c15oEodfc6aZ6B3FQJGIxp9/q1k+G6Ox3tXt9Zsf
         0EyQEbmoT8fpiuSOhf5vZXCef+B3hMpQ1ubvfO3B2oG05JvVzAeyqO7/TqgptYc3T/GD
         G+FpbYNCMUfYBLoUPpLJTYu85G3dof3GT4v/xWph+HUTPk7LUQu9mQFgy0rShdWBTo3p
         WY6NXZ5H9338at1cnygo4XWwoNIhHLKYMGeev6BthGfZS8WDciOVo5gXL1kS0BbmpAJP
         EwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ymla0msB0Cs10jwO6uVWQ9GZfgO7Z+L1TXaPwrVQhG8=;
        b=NpWEeHEVSnZ97tJd+jSRUId1L56MmK04Ldchv+ctnk465ifaVbnqtwoBi/uZV/iwWd
         1e5vlqbxq//5fKI0C/XQHpJgQ/OzSsKnz/UMdMPV4g5NhGa0DOEnEwu63gz201hfK12u
         KrS+gkIYty+1gxDYA8RTBzr1ckG2vAlt61xDAA+TBz536zDL6Jih5NeYapEabF6ufk2c
         ve5bdQhBjKVaOccyudqh5pWsb3mpcPa9uU2g8MwAagdTSneQOX5yk3Hc+BX41KijgyIX
         /X2mi4P3dZ1lIkCyyI6yPpp34CfL/XoPpPN+rtGRJsLRDs7ITtO8A5HrFsIBm38f+KY1
         Afng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+MgKtHhrbNKizrT8C3fXKWv58BO2sW5K35z5yLSduEIW0JRVA0
	EFijFGfwoD+pL2LjP7KUtWs=
X-Google-Smtp-Source: AGRyM1u+aqFGaX1TTGq2lFkgkaIRj8WTI3ugwvWbElKovb5im9NF3MuXOjwOCXHa69SfY0LLeUT1Ig==
X-Received: by 2002:a05:600c:511e:b0:397:60e4:8ceb with SMTP id o30-20020a05600c511e00b0039760e48cebmr20118947wms.204.1656336560058;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:eb04:0:b0:21b:b3cc:1640 with SMTP id s4-20020adfeb04000000b0021bb3cc1640ls13083293wrn.1.gmail;
 Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id c14-20020adffb0e000000b0021a34a25ca9mr12589392wrr.472.1656336558684;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336558; cv=none;
        d=google.com; s=arc-20160816;
        b=kyVrhoxHhnyW6KUn1E0w2pwcrUD+LnKSZKrLgCbnf9hbrY0Ct3O1cuPRClLV44+ZaU
         s1el4ddIgDgXwkJe4bYwfhfmSHZPaHRCVqKInCn8A+zdlU9QnrL7uMb8falec8Moye98
         DquHwikhJ6v3/1oj4AdjO2miCTK/oKmdFLRkfXw9uhWJvn4knHvpR4t3Xuq1aCQknNkr
         J5+EP+5nY1HIGIriX8RGsSO71olChJqHJxlO4BsX8/e2BTJneFjZAEpRxN7y5dpPZMi7
         HebdUgYxGxfI1xM7SyYueNSVJ3eCQB89pRGC3D70GNJP/l6NDb0mTcVgWo3TpXz0Wn6m
         2h5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k/0SA75gqUW9zk6nEHR5EPRhpYLbbB6jZd1rtr6utoY=;
        b=IVkSOFcL2zX5d/0FlVV8uUFAJvSt1PAnfbX+/4ldKdrfXVGdms1eSiN9hounyN9ieP
         tp5hYrBzIiu0JAKMR9VJZpUHdjkOKn4RkbLQ7QWacPcLtDWbltYFWyKzkU/ZPJQ/NqdO
         9IvXr22VwjfHnlRItGMYkluR6QCIuQ0KFWFXKNIZMzC7pKF+NZDXN+dIwXQNX0HXx1BB
         Q0EfmW3baWg1RJ7UmMtfFpFmgD7al0zHesYfBKKg8l0q5gDZ1ZWnZrH/pMX4qlmoXmz+
         6J0fjb6M76yYRqrxsuSN2U1JI4KdDDpRfqq55ZOpAX27PXLY5Q59LoKHVk3iLN3ROcp9
         d78w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=FOp6kYhV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id c15-20020a5d4f0f000000b0021b947060b9si458355wru.6.2022.06.27.06.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV62w35zy0c;
	Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:18 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 10/42] core: riscv: add platform information
Date: Mon, 27 Jun 2022 15:28:33 +0200
Message-ID: <20220627132905.4338-11-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=FOp6kYhV;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

It's pretty easy on RISC-V: All platform specific confi information that
we need is the PLIC.

Base/size fields are obvious, max_irq defines the highest possible IRQ
on the controller. max_priority the highest possible priority of an IRQ.

hart_to_context is a map that maps physical HART IDs to PLIC Contexts.

On regular RISC-V platforms, M and S-Mode of a HART are assigned to one
specific PLIC Context. For example:

PLIC Ctx 0 -> Hart 0, M-Mode
PLIC Ctx 1 -> Hart 0, S-Mode
PLIC Ctx 2 -> Hart 1, M-Mode
PLIC Ctx 3 -> Hart 1, S-Mode
PLIC Ctx 4 -> Hart 2, M-Mode
...

This is also how QEMU implements the PLIC. However, there are other
implementations out there, like the NOEL-V.

There, we have:
PLIC Ctx 0 -> Hart 0, M-Mode
PLIC Ctx 1 -> Hart 0, S-Mode
PLIC Ctx 2 -> ?
PLIC Ctx 3 -> ?
PLIC Ctx 4 -> Hart 1, M-Mode
PLIC Ctx 5 -> Hart 1, S-Mode
PLIC Ctx 6 -> ?
...

So we use the hart_to_context map to assign a hart to a Context ID.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 include/jailhouse/cell-config.h | 11 ++++++++++-
 pyjailhouse/config_parser.py    | 17 ++++++++++++++---
 tools/jailhouse-config-check    |  9 ++++++++-
 3 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 124373d5..c90a649d 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -50,7 +50,7 @@
  * Incremented on any layout or semantic change of system or cell config.
  * Also update formats and HEADER_REVISION in pyjailhouse/config_parser.py.
  */
-#define JAILHOUSE_CONFIG_REVISION	14
+#define JAILHOUSE_CONFIG_REVISION	15
 
 #define JAILHOUSE_CELL_NAME_MAXLEN	31
 
@@ -357,6 +357,15 @@ struct jailhouse_system {
 				u64 gicv_base;
 				u64 gicr_base;
 			} __attribute__((packed)) arm;
+			struct {
+				struct {
+					u64 base_address;
+					u32 size;
+					u16 max_irq;
+					u32 max_priority;
+					s16 hart_to_context[32];
+				} __attribute__((packed)) plic;
+			} __attribute__((packed)) riscv;
 		} __attribute__((packed));
 	} __attribute__((packed)) platform_info;
 	struct jailhouse_cell_desc root_cell;
diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index fc2158e1..37d8e039 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -19,7 +19,7 @@ import struct
 from .extendedenum import ExtendedEnum
 
 # Keep the whole file in sync with include/jailhouse/cell-config.h.
-_CONFIG_REVISION = 14
+_CONFIG_REVISION = 15
 
 
 def flag_str(enum_class, value, separator=' | '):
@@ -245,6 +245,8 @@ class SystemConfig:
     _NUM_IOMMUS = 8
     _ARCH_ARM_FORMAT = '=BB2xQQQQQ'
     _ARCH_X86_FORMAT = '=HBxIII28x'
+    _ARCH_RISCV_FORMAT = '=QIHI'
+    _ARCH_RISCV_FORMAT_HTC = '=32H'
 
     def __init__(self, data, arch):
         self.data = data
@@ -294,8 +296,17 @@ class SystemConfig:
                  self.x86_tsc_khz,
                  self.x86_apic_khz) = \
                      struct.unpack_from(self._ARCH_X86_FORMAT, self.data[offs:])
-
-            offs += struct.calcsize(self._ARCH_ARM_FORMAT)
+            elif arch == 'riscv64':
+                (self.riscv_plic_base_address,
+                 self.riscv_plic_size,
+                 self.riscv_plic_max_irq,
+                 self.riscv_plic_max_priority) = \
+                self.riscv_plic_hart_to_context = \
+                     struct.unpack_from(self._ARCH_RISCV_FORMAT, self.data[offs:])
+                self.riscv_plic_hart_to_context = \
+                     struct.unpack_from(self._ARCH_RISCV_FORMAT_HTC, self.data[offs:])
+            offs += struct.calcsize(self._ARCH_RISCV_FORMAT)
+            offs += struct.calcsize(self._ARCH_RISCV_FORMAT_HTC)
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
 
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index d6ea7079..13fd6ff7 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -61,9 +61,11 @@ if not arch:
         arch = 'arm'
     elif arch_str == 'aarch64':
         arch = 'arm64'
+    elif arch_str == 'riscv64':
+        arch = 'riscv64'
     else:
         arch = None
-if not arch in ('x86', 'arm', 'arm64'):
+if not arch in ('x86', 'arm', 'arm64', "riscv64"):
     print('Unsupported architecture', file=sys.stderr)
     exit(1)
 
@@ -188,6 +190,11 @@ elif arch == 'x86':
     for irqchip in root_cell.irqchips:
         arch_resources.append(ResourceRegion(irqchip.address, 0x1000,
                                              "IOAPIC"))
+elif arch in ('riscv64'):
+    arch_resources = []
+    arch_resources.append(ResourceRegion(sysconfig.riscv_plic_base_address,
+                                         sysconfig.riscv_plic_size. "PLIC"))
+ 
 for cell in cells:
     for mem in cell.memory_regions:
         idx = cell.memory_regions.index(mem)
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-11-ralf.ramsauer%40oth-regensburg.de.
