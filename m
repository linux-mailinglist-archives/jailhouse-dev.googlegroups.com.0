Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBMPB42KQMGQEZVSHWMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E72A55B9F7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:22 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id h18-20020a056512055200b004810d1b257asf2128298lfl.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336562; cv=pass;
        d=google.com; s=arc-20160816;
        b=eFlkqGE+JMKfJtpV7yeobujqQkLkIC5Z0eFC0J+tNT2dgYcbWAS4mqMOpxRIjNrPXc
         B6FZMklRRJbGoAxG5tIx+XX16ES8WmeK1Jmw/Tf2FRR2x7aSIJPF1/rUCHFc6M5ZQDnt
         8FL5FXv2YrXxVv0qt+prPiqM7MIPwDdXOirfjgevTPn08zb2DgOulqGW6axhfxPlrRs7
         qIvFTwr3ZcdkJszq0DrzQXW/IOtlKxBp2oVGXTkKTntVlcxU5FVr0qYGBsz2i4LuOsbu
         CNm7StxUDiOYyoLIrwk1lzy5R9xQtRhBECa8qy6nM4RNMDDMn3DXmJZHNP64Vamzsits
         IAPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9NrqnIUfs5YrkN1SHaBuqjMxhrGKgCxF8alRzK0b5zQ=;
        b=NTZ8TKtCvoDlLdW3zzKC3iu61oICwV1ix7nG+Nw2ygQXK0AWVG8ckm47/uATFwuCn+
         06IQ08Ct+LRUHbQJnnKqUK0IvR5HZQ4vOr8nI3SQe925Aq0AJyQCtFiyRAFqRlNmr/Ly
         oCb80Dec/pmEB56ceF+H1z04QF7BJl3eGHWHCXfwD/wsje6TO2NkYfaaS2Rya562Np7v
         0p65+oc0JHNeNsmOOBY7i3mZ/GBjtw5vxtQgAqLcIGpchowHTsAS71S35LNrsUwAyYX6
         FJYoawSDYKMBy/eUroIUGD+ZD1ZPt10ToKD1R3H7nVL9+Paj8rpgXklQUf53jDzNYltU
         Cahg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=BHyxKUF3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9NrqnIUfs5YrkN1SHaBuqjMxhrGKgCxF8alRzK0b5zQ=;
        b=dUmqS9Q6tJnO9ZTgb+M3CSCYwDMIpMBAcBVWqm1+nB6oH6gnODU1Nbb+IifCUyLWnj
         IzmZGCDGtd4enaswf8Q3DH/vYrb+aDnJhhsSA50LlO4jSR1Lcxy4tkITLrnwj0sxwZyh
         5kHSVta+TR5Kem1WqpfjFjI3TrHWRfUKBYKqx1KhF/fKRjRJ2m//zS+nkhn1Qo8OxCQa
         5ldBpzQI7U1B7bOVh7k7n00o1TOgcU82A2Fe5KMs9UWnAMeRoJ+yh6pGra27AJsKGxis
         DbYxBUT9E108KJEdD2pHxmnm8/IZk+V2cy9aNI6mGzjKnZEyM2ICUjyRyIMYELPr1GWO
         4pJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9NrqnIUfs5YrkN1SHaBuqjMxhrGKgCxF8alRzK0b5zQ=;
        b=eTMcKjxjfXbeTUj8dIk/ZhSfXRZ4S8hhfckM1MUWT8sUH4UBSZQWSQQXPLUp1mpC1u
         iLV2EbnmzCBtVCxoE+NEmcZN/rCQvas8Ouwe4FGQLyratlv3E24xXgAqIf6xNZOrIo3O
         2Xmc1UfZnhUaJHuJ7IEBgOItdjlyjSqjqh6d+k2R5UJUmZ3vLj2nvK7EddlzMDRiay8H
         90F3f8oYJABl+qH1fCmkWEV2CKM6vQvqvHngZYKwokHnVBekBhnyk6t/kzCymQlxRcEE
         h5eWLSTP7aTf4xBbJ0XCgtrkWk1/2e4rdzqLtx9lAqtyUnX+6QFtihiKrDnQJ2YYDSYt
         rpFQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9C/VEoPuWX9UHFEdC7eYlQ/Mo9ur4C8U0C5MhKIeUdW7q0OZ4Y
	ONc+wJd5CQw6ExPmA3cM2MI=
X-Google-Smtp-Source: AGRyM1sCVEQryEverNB1dwnbAs/lUeNxLvRcNklg0F4EwrxsGSzwZfw7QzDtz+4kGmRm/qB9VzkgrA==
X-Received: by 2002:a05:6512:2524:b0:47f:b0d9:d096 with SMTP id be36-20020a056512252400b0047fb0d9d096mr8078592lfb.243.1656336561938;
        Mon, 27 Jun 2022 06:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1693:b0:448:3742:2320 with SMTP id
 bu19-20020a056512169300b0044837422320ls213865lfb.1.gmail; Mon, 27 Jun 2022
 06:29:20 -0700 (PDT)
X-Received: by 2002:a05:6512:260b:b0:47f:b04e:3116 with SMTP id bt11-20020a056512260b00b0047fb04e3116mr8786165lfb.474.1656336560368;
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336560; cv=none;
        d=google.com; s=arc-20160816;
        b=bVS+Cv9lIAw1nrKbr5NdicqmAA37cQjldVxoTC9dFgoAZVUJGEqiQjDqmqh3induMn
         iiOLF325RgfaCV59EF3YsoK0w+rJL6cMTqGL7FnxvGnguq32lT5bUaYwozzHxsFfL1h8
         XP/BIB05wPhlkqvQEYNJM1Upisa/wyv5tf982b9bg9TX2T3A5rgUQxX3SHoBXygP85vL
         pqSJlMXMyRav9C/wC5LqU2kPjnQF8J4mGuD36xRkw34o3hfW2S1uXoCyZDClynWxwcZH
         DGG4Dw5heAAdGndVUKkVxG71ieGPE8jcOlGrjhcsAagAdRTm/2cBeYkRenzSGBMD1OI1
         N7WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=sZgvfUszQw/i0RDdsdAMdcG41DRNfFgTP3JYhkrRkGU=;
        b=ty7R30aP5fc70Ro2dWgOpMgyHliNWPB3VV2X52XVtmaYkb2KdfQM+DYAGoIP8cdDOF
         1Xgpv2HlqEJ7emFcp6bqp1sThfqY4XL8jBjvv+hObkpIOcu6U5THKLfcmJNx9vNvgD2a
         7YPQys+UmmaygaZDjXYbdv6O+az9Efn7D0Pp0X/eAHXY3XmmoccLUHEep2be+XmTC3vv
         BRTR4neS6ZO9e8vn/384yxj20Jmt/+aAw/tXcZfbUe5p2e3b5K7VJLHrXSRH9HbFX0dv
         81GotQx3XC+w+duNqaCQ8Gj13ffJLabPHp9gpSZ19udhmnYMM1+J9f9kK7UZbD8ZinT7
         AZeA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=BHyxKUF3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id cf26-20020a056512281a00b0047fb02e889fsi442383lfb.2.2022.06.27.06.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV75fJyzxxR;
	Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:19 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 17/42] core: riscv: add asm-defines.c
Date: Mon, 27 Jun 2022 15:28:40 +0200
Message-ID: <20220627132905.4338-18-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=BHyxKUF3;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Export offsets that we will later need in assembly.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/asm-defines.c        | 27 ++++++++++++++++++++++
 hypervisor/include/jailhouse/gen-defines.h |  8 ++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/riscv/asm-defines.c b/hypervisor/arch/riscv/asm-defines.c
index 17c2f256..0143d5c9 100644
--- a/hypervisor/arch/riscv/asm-defines.c
+++ b/hypervisor/arch/riscv/asm-defines.c
@@ -11,9 +11,36 @@
  */
 
 #include <jailhouse/gen-defines.h>
+#include <jailhouse/percpu.h>
 
 void common(void);
 
 void common(void)
 {
+	OFFSETU(REG_SP, registers, sp);
+	OFFSETU(REG_RA, registers, ra);
+	OFFSETU(REG_T0, registers, t0);
+	OFFSETU(REG_TP, registers, tp);
+	OFFSETU(REG_GP, registers, gp);
+	OFFSETU(REG_S0, registers, s0);
+	OFFSETU(REG_S1, registers, s1);
+	OFFSETU(REG_S2, registers, s2);
+	OFFSETU(REG_S3, registers, s3);
+	OFFSETU(REG_S4, registers, s4);
+	OFFSETU(REG_S5, registers, s5);
+	OFFSETU(REG_S6, registers, s6);
+	OFFSETU(REG_S7, registers, s7);
+	OFFSETU(REG_S8, registers, s8);
+	OFFSETU(REG_S9, registers, s9);
+	OFFSETU(REG_S10, registers, s10);
+	OFFSETU(REG_S11, registers, s11);
+
+	OFFSET(HEADER_MAX_CPUS, jailhouse_header, max_cpus);
+	OFFSET(HEADER_PERCPU_SIZE, jailhouse_header, percpu_size);
+
+	OFFSET(CFG_PHYS_START, jailhouse_system, hypervisor_memory.phys_start);
+
+	OFFSET(PCPU_GUEST_REGS, per_cpu, guest_regs);
+
+	DEFINE(REGISTERS_SIZE, sizeof(union registers));
 }
diff --git a/hypervisor/include/jailhouse/gen-defines.h b/hypervisor/include/jailhouse/gen-defines.h
index d42fe255..7b348761 100644
--- a/hypervisor/include/jailhouse/gen-defines.h
+++ b/hypervisor/include/jailhouse/gen-defines.h
@@ -22,8 +22,14 @@
 
 #define BLANK() asm volatile("\n=>" : : )
 
+#define OFF(type, sym, str, mem) \
+	DEFINE(sym, __builtin_offsetof(type str, mem))
+
 #define OFFSET(sym, str, mem) \
-	DEFINE(sym, __builtin_offsetof(struct str, mem))
+	OFF(struct, sym, str, mem)
+
+#define OFFSETU(sym, str, mem) \
+	OFF(union , sym, str, mem)
 
 #define COMMENT(x) \
 	asm volatile("\n=>#" x)
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-18-ralf.ramsauer%40oth-regensburg.de.
