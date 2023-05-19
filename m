Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBVF5T6RQMGQE6QTVA3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A3770A0D1
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:53 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id 2adb3069b0e04-4f256ddef3asf2376733e87.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528853; cv=pass;
        d=google.com; s=arc-20160816;
        b=S9IBzP3y8LOZmHMSFtyFCyf6vrwGt40ynsIs3nqcwRtW78Sf70OOG7ZdAFkoWJPwXh
         wdQpqt/tvZrCwX5Ww1OUUQu9l5Is9WJxHgVD0rHH6sE2jsjUOPQCSM1oJAhOYJvHzQyA
         QvfVHtaZbZhcZwUSwZe+6sGHCd31ZKVFGLu8LrjqKIZhPjcXUg+TsjQNgrg9rUPvPvgb
         BBvjvkqjXMmj8nXbI/0XCTRVBRc06zvoc89M4U6YxFjWSctKZWaKVEiRLhWzXASJI4vr
         ZeyhXXy/3ExzkTIJ5ApNd5lHdtEoiz3hS9cI5imVuXyrqv561kFiZPLJpTnQZVdSxBqM
         nJ7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=e9g4ZxjkEhFQGRvgifUfv3VLVpu6LKoGdd1ViSoGEJw=;
        b=SWvYzssUG9ZUcoQhXfvx/EiqE5px2VDsSCNYhczf58W4AgByzTQ2hrNpzskXNWpjSz
         AVVVJFf76KduAcQ32Of04VAoPLPK4AXRXFtypc+VoTXHw0WjGHOZOpuAV/geILSyeG1l
         bEEt1h6/5sQNvDPgIdas6c1yogULK7EI69gETeNBpWlBb7lv1ma9naIxlfLIsZHmtrK1
         TcJqNPxwM9zZ3Tiz7S8mxjweKM90yd6rLGYHwoXckabYmDRNI8nSQPHnZ/DGF69KdSG1
         kxefphxi2atBtXMWbBiFuP7UIzNPzK6l8yWR0CJ3lbcqAWJzkxsMz3I5Whdt+YUF3qaY
         JiDQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e9g4ZxjkEhFQGRvgifUfv3VLVpu6LKoGdd1ViSoGEJw=;
        b=YMuDspI+/rAacHoMNkiJ7IZzRoyDpXQ+JVQ7+DzVyoIykKQSV1eFeyewVC0q255JuJ
         8dNWcFu+wR2JLykEDs8/Aekx8vxXWj8VJlBdR6oSJye7ZuYvhlxqqLBy3M2MYrW0xA6E
         bevRcMp4f0Lj5ZwqFlwulViYn0p8ZJuiQxxQ8uvklWsxDh6IBLimvvIWFWYb87hMXwue
         85HAxLVseVBDSOPxIkW/COc5K8YbBSytBo9qnIG5pCZCiXJWAbYql0UtTaZxRfCzrRHQ
         noR6/HIETqAodNDAeRpdHnXYNydL+aKFpwOVCgTOqcHEebsTTmoT71MsYRUlHFtR1Qcu
         eVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528853; x=1687120853;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9g4ZxjkEhFQGRvgifUfv3VLVpu6LKoGdd1ViSoGEJw=;
        b=VjVqvNhj0YJ6TTeERD1Drv0wSFAuNgCB2WGPU9AjLdGAD67ZTwVbpEjZ7lgXYNK6FX
         pXFSRHuiGGVXdNa3dUZbjEPA4tJI1usuMRrCty+G5f01ymnjm2o6fzgtCWUjhVCBfkeT
         HxsMufry1XOalaJwBwOrRjRFHPEXgDs7/9XydBgQfHv1soHhKEzGtI2vXYtlYvtfP6Ub
         z1+vK8DTQIKa1L7o0pP7I3MRh1/3aaPw4TqqjfgM/oXGISwjgRrdKxAniK42k9+3SBzA
         6JMi9slgTS2J4Ccs1WIFwwz03xSMNsfY7f4B6oLDrUUQUCOGp8aezMDFnnO+sHuJvU7b
         mAzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDz5Mnu5Hf1xM/5rMfvukhoHqBns59GsINjspn091hgWYGFluvSl
	sFuXLNANGUKksl/UNrQxAGs=
X-Google-Smtp-Source: ACHHUZ4eqE1IL9+jah4RSmF4TeEEPCDdIX/nHQTuTETv9F6YKvlOHBLg5Bb9IvGUBfsXND72IKrpjA==
X-Received: by 2002:ac2:446d:0:b0:4e0:822f:9500 with SMTP id y13-20020ac2446d000000b004e0822f9500mr835232lfl.12.1684528853148;
        Fri, 19 May 2023 13:40:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b889:0:b0:2ae:d6ad:acff with SMTP id r9-20020a2eb889000000b002aed6adacffls397640ljp.1.-pod-prod-04-eu;
 Fri, 19 May 2023 13:40:51 -0700 (PDT)
X-Received: by 2002:a2e:7a07:0:b0:2ad:be31:c45a with SMTP id v7-20020a2e7a07000000b002adbe31c45amr1093122ljc.15.1684528851376;
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528851; cv=none;
        d=google.com; s=arc-20160816;
        b=JguIX2V/RL5oY4cZwIWf9M/t4zkwtW8Hc5c9N/rUvfiv1diT8DxOsCKk2q+uBxsshd
         lrwdWswwGZMccnQgOX6m74vBuZ1sN+EDhV+RyFmMrEUqhYhQ+PsmYYj5WE8zaVVv/2qc
         a1f8DizwvG2qFHLa3op4f6fgxtSWz+Dpyw6/G3yEYA9pKv++5HHdCrMLDlzEez0ji1os
         AoalLan1728SSVTTxY+83Pu8Sd6xvubOcHdmTsXymfvkn4R/Ucag7051kSxyPJyWQVkg
         j5dZ41WIbclPXJ8VybFOT0E4WF7BVgiqULtygymUDWVaZjtVoI81rRLUfWxXRglceoHz
         oprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=bOt/IoaKmNZYnjBGFrft4w/+j2fbjjH0T0EwmeEnSJg=;
        b=Z6ZwEXDrK8/jSdW22UkaUDT30Xx9l1xIHJsmvAa0BPQkLHRGOASEXqHOetm1gYivo+
         khbezlZsd4fpyFH02VdgfIn8pm1YnvYqzlLL38AFtxYXOLzS566V5iOSEbDKVVFSp7W4
         IRewQodWvpJi+xX3+6TZK92fHFYNPnuwM4RwuMd8LL7v38PM3svFnSkl6SyzIGrvDPOk
         6ZhK9RjBgdaqaeiE5WNe9zyCD2usI0FadjCLMICWhcCmRap2wzg7iacfO2XwPHNxirm5
         0hrdQkdkG9ysW45VVqbJd5i2/jjUR+NJVRSfuTFfFHKqVA6MhBlXa06/abfQ/Kt0DwZB
         xKYg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id u19-20020a05651c141300b002a77f4969bdsi332553lje.5.2023.05.19.13.40.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdZ4NqMzxwN;
	Fri, 19 May 2023 22:40:50 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 31/73] core: riscv: add platform information
Date: Fri, 19 May 2023 22:39:51 +0200
Message-Id: <20230519204033.643200-32-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_5000_5999 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __LINES_OF_YELLING 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
 pyjailhouse/config_parser.py    | 21 ++++++++++++++++++---
 tools/jailhouse-config-check    |  6 ++++++
 3 files changed, 37 insertions(+), 3 deletions(-)

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
index 0fe30de9..4b2989ed 100644
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
@@ -318,8 +322,19 @@ class SystemConfig:
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
+                     struct.unpack_from(self._ARCH_RISCV_FORMAT,
+                                        self.data[offs:])
+                self.riscv_plic_hart_to_context = \
+                     struct.unpack_from(self._ARCH_RISCV_FORMAT_HTC,
+                                        self.data[offs:])
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-32-ralf.ramsauer%40oth-regensburg.de.
