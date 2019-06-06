Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRB3FO43TQKGQENTT4ZLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF4538125
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2019 00:45:01 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id w14sf86020wrr.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 06 Jun 2019 15:45:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559861101; cv=pass;
        d=google.com; s=arc-20160816;
        b=szg6Ywp3G0BeL20FRAdBRP/5pw4B4qifzrROjASzS/j+l9tnIcNruHXQeMPYYas9R0
         4FjG6v/R12Y+KYZn4Kj8JIxkwQWUWA9WxsQh2gjGVeyo/BQQbFx085cE4o4UzxylbET/
         XiMPjh67SEfR+N6359V8OlAoju1fXsONP4L3qpCIoM9xhd/OT4JrNZx+7GKBAbfB2D7+
         yNC5YO9RyrNSrGaPsuThQwe6IXZ3T0ZFS2SzKCN+ELrRK/jVUAN/x+EiB2Em74XWmYF6
         N82AboyD4P5MDoVsvVnBCTpH8U6EjHsqdzW8LEzKV+qGuoOql3N/bgvZVdVTHjzcIGeI
         VfmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=dxU1BIrqR/oG6YhWS/lltE4u+dTx2l8S8BkdkD5eCzw=;
        b=YmOlVxPbS8czD4b8bKkNXenJNsY4ZvIpkAMi2uRBTY7TrlCrNcZ5/keBEVq6aal6Sa
         5R+yNyobDuXD544hf/Sargg1mPMWBwADeb0RSvIK/YbNvvucEmYskN9UXPOHAnyK4HgC
         N647GaRX9L6pr9O52jUTyw/D4FlZyub7WcRSwrnLZ3n7HlB05qhy17oszyBFvqo0qEgY
         E+ZDVYTYwH7mwQ9f/8jLRZfTxpJVHdFM9e+2+yRYk9lPy31tl0o5psmDWThpIcasI8WP
         XEpXkoRm0Hf/p8MQsfg9naYL+E3H78ftipmLp77MqHJawkIOo6r/RTYmNqJlzi1yEzjG
         t4aA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dxU1BIrqR/oG6YhWS/lltE4u+dTx2l8S8BkdkD5eCzw=;
        b=dueNHbXuExjGlCuE+5Dvba1dhCIQvW0a6jLALh5ni44uISpvMX8r+6jMKFTQ6GeoPN
         7WHerbE4jNWe5Eki8CVxAaev1aQXOglr2KsZ5q1C1zTVHyUuVdQC4+4IrqM4S7DoCvza
         YwCgZDEtDD/VLUNXEVkE5zEwi2rSnuTV3YLsTHXhvNMr3u6WFCKTjA3jQxEZBvpvDVTY
         0i4iYpSQzPWP3DhP62js/NE+rJutlCTVumHLHh4KxXkeRkoE7KBjZQ43WwvJJqceYwUv
         S10vAJe9R3FDFnDmMYSFHbBdJkEMpPA+3RCsDTL7OhEwqUJpCllJ0ooVUo1GAF41D4gn
         swLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dxU1BIrqR/oG6YhWS/lltE4u+dTx2l8S8BkdkD5eCzw=;
        b=SoKDVdSMyjvhW8QWS1+rD3K83jBgA65NQtsbcIeMDaYdqz1ufWv/e1kxj/WacmObpC
         u2g7eXdqvPUyq3ZPOl4ym+DeF2dY/a/FKMxhKuF5Mo1+49XUK59Dheh8NUKacKQSMqiI
         INudyMcerLThEjKDk0sr6hSm5OTT/FquphRM3UGdBjFLqPm+0tFZW+6cUnMnR9lB8Alk
         /UfPenV8DLwZoE6EXM87FaoUv6Zq1HeH7RypkuAxZVuIHhWTDN3LWLvkJRxAHFmuzPDh
         vFNK/yFl9lSdA1rolFTU11LzggC1ZmVfqeW8QhO5GjC3INehnGbX4fzzab3olorTi1Fw
         R3mA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV4ZwOeoAp1UjHav97J+lnVWW0V4riPdbtjPzIysbx9EkOSZOft
	bfAXKiXKE04EFuswFKTMmYw=
X-Google-Smtp-Source: APXvYqyqpp3T1uU1/U1MRhwxHbSTWvlMvz/E4sUHhisqJw9lZIrNeweTeGdqtuaqGBv7NnKI002r5Q==
X-Received: by 2002:a05:600c:240e:: with SMTP id 14mr1448552wmp.30.1559861100899;
        Thu, 06 Jun 2019 15:45:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:e844:: with SMTP id d4ls1592553wrn.7.gmail; Thu, 06 Jun
 2019 15:45:00 -0700 (PDT)
X-Received: by 2002:adf:e50c:: with SMTP id j12mr10776558wrm.117.1559861100500;
        Thu, 06 Jun 2019 15:45:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559861100; cv=none;
        d=google.com; s=arc-20160816;
        b=CJdg+JSI8rNQ34FLRcEgjTijxdWMgAS3OnHvzi9qycPr4Wjf/pB7fHPlJVKnxLpYYY
         rFUAFoqbsrWV3UFAlQfY9LBtxsOsHpaH89gOSGdgKMkvW99BEi/+EnXzcbE5QqjrHBip
         yqHkoVtgHUwazuB6U4lMnUjYObeBk88v/zCPwHms3unhPDrKvWk6czimikkOw2rOmsV5
         HazMibJZCvzhpQtKWOLXM80BvARMqPut5pCGyAkvE/ZVjams4zIdN1dj0aKosQph7jP5
         NujL+wdSWsKPFlrpMUTjvKpmxM8eg5n4aM3Prg9J3zZdAEy09IC30i3ZpUpIe574H2dN
         8LJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+SnjhIsAltymHNgxVeZbl/pOhapP0Ay6ngukZYclYuw=;
        b=WpSbr374fsPEZugHWAraCr5m8cqwM20EH4TQvu4uWWyj1F70E8WpMzzp1G5C0qUGPp
         tY0IxTgVZFx+tQPLjm30HRX8NYrMu+jczbxWpV9AfDcFUuBE77QqZQINJWpNcP7C5bxs
         vfS3y1xoHWbmQTlAHYoS6zE62iQQVkLO14FNM9IOdJRcAtv6S7sdXLDGknWMhlyXd5Rj
         7wNvax7N9DMhNeQJotL1ATvkKM1TyfR+Vc4q7LH3JMMlJTWoI1ZvnArGn2hgGr+RFLeT
         5Us0d7BqBGwhXqAI/xig/isPkTY1NwDtn83NrYIA/WWUIoYYsxiFbgf+Me2KkmxgmVhn
         asMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id j18si15584wrc.1.2019.06.06.15.45.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Jun 2019 15:45:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45Kghr0H5Xzy5p;
	Fri,  7 Jun 2019 00:45:00 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com,
	Jan Kiszka <jan.kiszka@siemens.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v2 2/3] x86: mmio: move flags to struct parse_context
Date: Fri,  7 Jun 2019 00:44:56 +0200
Message-Id: <20190606224457.1053-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
References: <20190606224457.1053-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.6.6.223617, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.6.6.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_4000_4999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __REFERENCES 0, __SANE_MSGID 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_NO_NAME 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

We can easier pass them around if flags are stored in struct
parse_context.

Just a preparation, no functional change so far.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/x86/mmio.c | 52 +++++++++++++++++++-------------------
 1 file changed, 26 insertions(+), 26 deletions(-)

diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
index c04cf449..df8c97a1 100644
--- a/hypervisor/arch/x86/mmio.c
+++ b/hypervisor/arch/x86/mmio.c
@@ -49,6 +49,11 @@ struct parse_context {
 	unsigned int count;
 	unsigned int size;
 	const u8 *inst;
+	bool has_immediate;
+	bool does_write;
+	bool has_rex_w;
+	bool has_rex_r;
+	bool has_addrsz_prefix;
 };
 
 static bool ctx_update(struct parse_context *ctx, u64 *pc, unsigned int advance,
@@ -88,12 +93,7 @@ x86_mmio_parse(const struct guest_paging_structures *pg_structs, bool is_write)
 	struct mmio_instruction inst = { 0 };
 	u64 pc = vcpu_vendor_get_rip();
 	unsigned int n, skip_len = 0;
-	bool has_immediate = false;
 	union opcode op[4] = { };
-	bool does_write = false;
-	bool has_rex_w = false;
-	bool has_rex_r = false;
-	bool has_addrsz_prefix = false;
 
 	if (!ctx_update(&ctx, &pc, 0, pg_structs))
 		goto error_noinst;
@@ -102,9 +102,9 @@ restart:
 	op[0].raw = *ctx.inst;
 	if (op[0].rex.code == X86_REX_CODE) {
 		if (op[0].rex.w)
-			has_rex_w = true;
+			ctx.has_rex_w = true;
 		if (op[0].rex.r)
-			has_rex_r = true;
+			ctx.has_rex_r = true;
 		if (op[0].rex.x)
 			goto error_unsupported;
 
@@ -116,7 +116,7 @@ restart:
 	case X86_PREFIX_ADDR_SZ:
 		if (!ctx_update(&ctx, &pc, 1, pg_structs))
 			goto error_noinst;
-		has_addrsz_prefix = true;
+		ctx.has_addrsz_prefix = true;
 		goto restart;
 	case X86_OP_MOVZX_OPC1:
 		if (!ctx_update(&ctx, &pc, 1, pg_structs))
@@ -131,33 +131,33 @@ restart:
 		break;
 	case X86_OP_MOVB_TO_MEM:
 		inst.access_size = 1;
-		does_write = true;
+		ctx.does_write = true;
 		break;
 	case X86_OP_MOV_TO_MEM:
-		inst.access_size = has_rex_w ? 8 : 4;
-		does_write = true;
+		inst.access_size = ctx.has_rex_w ? 8 : 4;
+		ctx.does_write = true;
 		break;
 	case X86_OP_MOVB_FROM_MEM:
 		inst.access_size = 1;
 		break;
 	case X86_OP_MOV_FROM_MEM:
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.access_size = ctx.has_rex_w ? 8 : 4;
 		break;
 	case X86_OP_MOV_IMMEDIATE_TO_MEM:
-		inst.access_size = has_rex_w ? 8 : 4;
-		has_immediate = true;
-		does_write = true;
+		inst.access_size = ctx.has_rex_w ? 8 : 4;
+		ctx.has_immediate = true;
+		ctx.does_write = true;
 		break;
 	case X86_OP_MOV_MEM_TO_AX:
-		inst.inst_len += get_address_width(has_addrsz_prefix);
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.inst_len += get_address_width(ctx.has_addrsz_prefix);
+		inst.access_size = ctx.has_rex_w ? 8 : 4;
 		inst.in_reg_num = 15;
 		goto final;
 	case X86_OP_MOV_AX_TO_MEM:
-		inst.inst_len += get_address_width(has_addrsz_prefix);
-		inst.access_size = has_rex_w ? 8 : 4;
+		inst.inst_len += get_address_width(ctx.has_addrsz_prefix);
+		inst.access_size = ctx.has_rex_w ? 8 : 4;
 		inst.out_val = guest_regs->by_index[15];
-		does_write = true;
+		ctx.does_write = true;
 		goto final;
 	default:
 		goto error_unsupported;
@@ -168,7 +168,7 @@ restart:
 
 	op[2].raw = *ctx.inst;
 
-	if (!does_write && inst.access_size < 4)
+	if (!ctx.does_write && inst.access_size < 4)
 		inst.reg_preserve_mask = ~BYTE_MASK(inst.access_size);
 
 	/* ensure that we are actually talking about mov imm,<mem> */
@@ -198,14 +198,14 @@ restart:
 		goto error_unsupported;
 	}
 
-	if (has_rex_r)
+	if (ctx.has_rex_r)
 		inst.in_reg_num = 7 - op[2].modrm.reg;
 	else if (op[2].modrm.reg == 4)
 		goto error_unsupported;
 	else
 		inst.in_reg_num = 15 - op[2].modrm.reg;
 
-	if (has_immediate) {
+	if (ctx.has_immediate) {
 		/* walk any not yet retrieved SIB or displacement bytes */
 		if (!ctx_update(&ctx, &pc, skip_len, pg_structs))
 			goto error_noinst;
@@ -218,16 +218,16 @@ restart:
 		}
 
 		/* sign-extend immediate if the target is 64-bit */
-		if (has_rex_w)
+		if (ctx.has_rex_w)
 			inst.out_val = (s64)(s32)inst.out_val;
 	} else {
 		inst.inst_len += skip_len;
-		if (does_write)
+		if (ctx.does_write)
 			inst.out_val = guest_regs->by_index[inst.in_reg_num];
 	}
 
 final:
-	if (does_write != is_write)
+	if (ctx.does_write != is_write)
 		goto error_inconsitent;
 
 	inst.inst_len += ctx.count;
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190606224457.1053-3-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
