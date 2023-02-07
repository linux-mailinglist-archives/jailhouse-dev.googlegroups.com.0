Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBYEGRGPQMGQED5KOV3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C78E68D67A
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:09 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id o31-20020a05600c511f00b003dc53da325dsf10501987wms.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772769; cv=pass;
        d=google.com; s=arc-20160816;
        b=bUXorqsOoK1aZ1fbsdqKvn9bUuoktyMbmTRjRIESmgb80sDnLn4izelw1YIOnqETY8
         cz9XPYNOczTVE2WXKLqKcnZkPuznvlxEZenGdMhWK4ovWltbbVzLahr4wam6Z+7bzo8w
         dVBv1o5aUB7xhNRQG0RUmXOClTaRgtW1dFqaxNNI0yo2TWG8jlm9nG+f5msdW+hG+m8W
         twFx7CSZItAqwhwfPnYov6rNcK6wT5wfaMQpkgF1Tem2aDVhhTwCLGZVFvyYSJRy/6F9
         psATAmpFZrS7i6DlGPx/h5OqDPwQ578dV7zIdKEjdKXrdHWUQiLCZxmGqcwIemDDputW
         1Y9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=EJ6p2nI2h8fA4ljWULSzSKdSW7Q3KtCBakjZPYcTMIk=;
        b=wC3PFBkyFR8MSs0x+xqy+2CAx3Ka5xiFFZd49zkfXUvElVCahPakvcRuzS5F7VydkS
         uJamxBmiKw+td7FupdupImQZDF7noen6IxrQD2+KqCwETpLI3NpNwTHxRaiUCwvW/LpW
         Tw7x6ozZSkuEgM++SKUmltgZdrE2k20dtLJWIxxFNcTPtDt4f5aeVoZnt/JnuHiSu3pm
         /XUJEY7yfeddCVX0fP8QqzW+k92AdpBxG2xmlNoFEPc8+6JQMMgaWl9GC1saly98FLAq
         AEIDiNfEu+o+uv6ArQLPM5QTPR4T/ZOVLidutNhh6RmoO20pl1D5uvs5RgGEix79ESu0
         BsfA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ6p2nI2h8fA4ljWULSzSKdSW7Q3KtCBakjZPYcTMIk=;
        b=VYET9bqPSgimIU7fH0+yrGiHp18QAtZwNa5TjBLUYD6WBZl/OZsGMhD8xV215+KXof
         kGis3kqRUmj1IBHYz1eHR6PNvLbubJc6sOszlrJ1XCKWFEmd0RdCt5RM7GHlApsYsHjx
         PoiIA6nNO5MgTCj54GtB3rWTtjTE7/YMklyKpbWaDXlYLIqzEirvdGikoXJsAciTM+ll
         JOwLnJHdqEn/wJxY1mZDM2+68dUbN1on/hTJke/t3459qjZ5ntmJBhLLET4sNUbun+Cs
         3nvaffihUzNMaCQIXUFjcDdnFYAdI/ieZ50qlopWxYT53RYcyK7GIx0rLYVSSHOWcl7W
         Vnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ6p2nI2h8fA4ljWULSzSKdSW7Q3KtCBakjZPYcTMIk=;
        b=w3Vh333Va2yNC6h5aQRJlfq4PkWPGXlJioWAm1CwJKiQBFhTefz2UTCu1ktSraOmZ/
         O1BpJcBXPj2dRbjmip2mVCnfbJELMYcvkZlveikRfm1M4E0bb92PHi3JNgx4b73THXiC
         CZRR2UoLochGMW4JM2ptE/p5pHGELq+wAz4T0e7PQtGn4q0g8hBhCGyzSdsHCz/EHDrN
         8xkEdLs8EEh9FRPvrqIZ/c/QWdqeubCiPjY7ZEtrzehPgfYRjmq+XOWksdag8r3sC87l
         aV/74UOEj82jwqsT5k0b/NoLSgvoes0WU+QYjIzxCAW9tCIfrvmEFnN96KhDAxnsheNH
         74Qw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWhl2hRPP8eXwZ6DSunb2B2IbL8wB2u80vBukVivpDtbbwPsHnU
	11fJlhRXMRsU8EHkGNykOkM=
X-Google-Smtp-Source: AK7set+/lBW8IjiVUJ/Hq9XFNaAtqOehToMlQ8506cky/Kc37cDI8ooomWWbDw3EiBaIxkBsMmm0VQ==
X-Received: by 2002:a5d:4484:0:b0:2bf:d1c8:69f3 with SMTP id j4-20020a5d4484000000b002bfd1c869f3mr98234wrq.604.1675772768915;
        Tue, 07 Feb 2023 04:26:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5c05:0:b0:2be:34f5:ab03 with SMTP id cc5-20020a5d5c05000000b002be34f5ab03ls21049970wrb.3.-pod-prod-gmail;
 Tue, 07 Feb 2023 04:26:07 -0800 (PST)
X-Received: by 2002:adf:ed11:0:b0:2bd:e8b2:4da8 with SMTP id a17-20020adfed11000000b002bde8b24da8mr2473185wro.35.1675772767281;
        Tue, 07 Feb 2023 04:26:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772767; cv=none;
        d=google.com; s=arc-20160816;
        b=nhNo/GhYDvjOS4p/6CQuntC/QRH5RmWseLlfAtjEr3Mnk0WT3ZmYs4XXdoJpObD0A1
         C9kfEf6HiBA44aZ1zqJe5ZZAGeZGVtxDF+tNHDpJUfpeLnTFisYuVRw1OHOmxuZfxq/x
         EVV8VtHFuYrP5ts6t9+vfojaIGLzu9ZxIyNExfD86idu+g632jENm7QOoISOZaGbDil6
         a3ck7pKq2bCMzR5ZgEzE5oF3iaGjr5j9/NmGZaVWlcavX+GDkWo5HZkW8gwJLZHQkiSZ
         oeGIOaqH7fNOKi/1UcQ+nReCxcR4FzGt75YKHD0Y9h33NpWensd7GT4DAwrUyQN508HF
         j0NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=AKpg4mstIEPd24rNVJhWxKPBJkCsKnuP4MHG/d5g+zg=;
        b=aVn4/Caa5MQUi2ZjSWMO6SWVWCAzN6wagQHSjlarlx0ETcYLPN/afevU0fgcPFyXjN
         QEPTQmRE/ypPNL5o6ZVws9euni192yfmjhxDcS68z/a/LNo7ilAPM81BHL7y7qNdVvnj
         ZD+qcFUvf69FllewWGQo987z+qhw600ZIRW9ZbVKwaeDShnl8Dv/jLeylwUPfhNe4flP
         71n03w0zgZWSIxI3HrrrnjwIyFWYKe26IMnk11V8xTmBu4KUOAQh8OzV616FewopxTDZ
         3laVgmImsvW+OOUqjmXXr2clwP/6OASheUQWaj7arbPBVffXYeS35mwh0+giZj3ZxA/H
         236g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id ck1-20020a5d5e81000000b002c3e698d7a3si316390wrb.6.2023.02.07.04.26.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:07 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RL3CbVz106g;
	Tue,  7 Feb 2023 13:26:06 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 11/47] core: riscv: add platform information
Date: Tue,  7 Feb 2023 13:25:07 +0100
Message-Id: <20230207122543.1128638-12-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Content-Type: text/plain; charset="UTF-8"
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

It's pretty easy on RISC-V: All platform specific configuration
information that we need is the interrupt controller.

Base/size fields are obvious, max_irq defines the highest possible IRQ
on the controller. max_priority the highest possible priority of an IRQ.

hart_to_context is a map that maps physical HART IDs to PLIC Contexts.
hart_to_context is not used in combination with the APLIC.

hart_to_context in combination with the PLIC works as follows: On
regular RISC-V platforms, M and S-Mode of a HART are assigned to one
specific PLIC 'context'. For example:

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
 include/jailhouse/cell-config.h | 13 +++++++++++++
 pyjailhouse/config_parser.py    | 19 ++++++++++++++++---
 tools/jailhouse-config-check    |  6 ++++++
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 56b512a4..787d6a26 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -332,6 +332,8 @@ struct jailhouse_pio {
 #define SYS_FLAGS_VIRTUAL_DEBUG_CONSOLE(flags) \
 	!!((flags) & JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE)
 
+#define JAILHOUSE_RISCV_PLIC		0
+
 /**
  * General descriptor of the system.
  */
@@ -370,6 +372,17 @@ struct jailhouse_system {
 				u64 gicv_base;
 				u64 gicr_base;
 			} __attribute__((packed)) arm;
+			struct {
+				struct {
+					u16 max_irq;
+					u8 type;
+					u8 _res;
+					u64 base_address;
+					u32 size;
+					u32 max_priority;
+					s16 hart_to_context[32];
+				} __attribute__((packed)) irqchip;
+			} __attribute__((packed)) riscv;
 		} __attribute__((packed));
 	} __attribute__((packed)) platform_info;
 	struct jailhouse_cell_desc root_cell;
diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index 0fe30de9..77004c38 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -23,8 +23,9 @@ _CONFIG_REVISION = 15
 JAILHOUSE_X86 = 0
 JAILHOUSE_ARM = 1
 JAILHOUSE_ARM64 = 2
+JAILHOUSE_RISCV64 = 3
 
-JAILHOUSE_ARCH_MAX = 2
+JAILHOUSE_ARCH_MAX = 3
 
 
 def convert_arch(arch):
@@ -34,6 +35,7 @@ def convert_arch(arch):
         JAILHOUSE_X86: 'x86',
         JAILHOUSE_ARM: 'arm',
         JAILHOUSE_ARM64: 'arm64',
+        JAILHOUSE_RISCV64: 'riscv64',
     }[arch]
 
 
@@ -269,6 +271,8 @@ class SystemConfig:
     _NUM_IOMMUS = 8
     _ARCH_ARM_FORMAT = '=BB2xQQQQQ'
     _ARCH_X86_FORMAT = '=HBxIII28x'
+    _ARCH_RISCV_FORMAT = '=HBxQII'
+    _ARCH_RISCV_FORMAT_HTC = '=32H'
 
     def __init__(self, data):
         self.data = data
@@ -318,8 +322,17 @@ class SystemConfig:
                  self.x86_tsc_khz,
                  self.x86_apic_khz) = \
                      struct.unpack_from(self._ARCH_X86_FORMAT, self.data[offs:])
-
-            offs += struct.calcsize(self._ARCH_ARM_FORMAT)
+            elif self.arch == 'riscv64':
+                (self.riscv_irqchip_max_irq,
+                 self.riscv_irqchip_type,
+                 self.riscv_irqchip_base_address,
+                 self.riscv_irqchip_size,
+                 self.riscv_irqchip_max_priority) = \
+                     struct.unpack_from(self._ARCH_RISCV_FORMAT, self.data[offs:])
+                self.riscv_plic_hart_to_context = \
+                     struct.unpack_from(self._ARCH_RISCV_FORMAT_HTC, self.data[offs:])
+            offs += struct.calcsize(self._ARCH_RISCV_FORMAT)
+            offs += struct.calcsize(self._ARCH_RISCV_FORMAT_HTC)
         except struct.error:
             raise RuntimeError('Not a root cell configuration')
 
diff --git a/tools/jailhouse-config-check b/tools/jailhouse-config-check
index ebfe97a8..d738f347 100755
--- a/tools/jailhouse-config-check
+++ b/tools/jailhouse-config-check
@@ -174,6 +174,12 @@ elif sysconfig.arch == 'x86':
     for irqchip in root_cell.irqchips:
         arch_resources.append(ResourceRegion(irqchip.address, 0x1000,
                                              "IOAPIC"))
+elif sysconfig.arch == 'riscv64':
+    arch_resources = []
+    arch_resources.append(ResourceRegion(sysconfig.riscv_irqchip_base_address,
+                                         sysconfig.riscv_irqchip_size,
+                                         "(A)PLIC"))
+
 for cell in cells:
     for mem in cell.memory_regions:
         idx = cell.memory_regions.index(mem)
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-12-ralf.ramsauer%40oth-regensburg.de.
