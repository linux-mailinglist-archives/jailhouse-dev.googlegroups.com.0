Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7XIZT7QKGQEGSSHSTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3072E9890
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:07 +0100 (CET)
Received: by mail-lf1-x13d.google.com with SMTP id x187sf17280956lfa.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774207; cv=pass;
        d=google.com; s=arc-20160816;
        b=N1w3hDKobgu963K5G51jWnDv+yN9ZgtOd5UawsCSRI1+QeF9me8rRk6z9XXCcDwAIy
         4wrfKoZn5eXWag5hDB3B0LVtZX4MLawnsvqxifTR2UL98f9byAhTlmiUVhKkRm5m4Xf9
         MRpwsq/PLonCYQtKHLohLHvqPADlrvUIqlA6fhlr6dMV0UFIYMPgJaLhmsf6xdIuo89q
         Zhnsr1a3lpWiD5HhwVP9GV1Zm5DMwfRE2K/kAogVc4OZVYCWZiXbNeJg1ZJf3IivAdZr
         o5uhD5l2KVjq2gkAIy9makexWzbUqNcqox7TJyjUA16WD8lnpk+vEd5phVL5rKx1KtXj
         TLAA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4Vs/x1RRwePODCUDpTrUw9fo2XLmmF6YbSR0MWaOKco=;
        b=bGH0e8w8bizfTtiXJDlg+QiWGSAAbLDFYhh/YTZjGD+43bFzH+l5e7zKj7DkZFy33W
         dXqEN4XzLRiciXssiyPC+MsHWmwHuRZhJ0Au74q6f9+7Naejz71Lzn/stBQXclh+jQ5s
         vjteOU81Bri5zVEf4VNkYrThxpM04ppHVpn68EmYjn9n/As8vMCUK1sHFhzNmdp5lJiX
         dg515C5XAEfBlrIr7GSKsENEJ0UFWAfCCA5wZ2675WRtm23oYlqrcO8P2LFBLZOGA0zv
         AvmyjZGlxlqzMq7WOQEi97op8kDaF2Z3fpk3JRppLSO7LOziXRCCvlx52xYCJYrxHwH8
         spdw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=NVmGBujH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Vs/x1RRwePODCUDpTrUw9fo2XLmmF6YbSR0MWaOKco=;
        b=RyBBo7C62FCLzWcYyi0b/TrfxWiUeWn7+4+XsAHEbfcLFPElzuFOKJWnFi0Rlepxsg
         OI/+Rim1uDeXUlspe7R3XEXRPy/sxEYmDgrvGJhM9QLb+7Fw98uvNvXUa2l9o5rgEDXg
         bKkUroRDx08fhPsDcN3BvqQ/Zd4U8HBGCTWXdGXgJfZdmz2oWyB8Uxf+bXXTQfDsHpiV
         AnvOyqOsHymGmWG4Xn9vV5ypOpe13D/4LO8IGFN+YinPrWbt469/b6dKUGA2kcBZGtZj
         /SnRFpxsQKyqk7nSkmHVusHQjNsnuCokR59XFPMRFjKy5yWZcPDvaAHxuZQw0C2LPsd1
         hiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4Vs/x1RRwePODCUDpTrUw9fo2XLmmF6YbSR0MWaOKco=;
        b=g7KJZOoQUOlvi+5zIM1uFeGbtqZhf8kiDbQX1SwLqDnvSHrM8VX5BGyz7tJTTmd5rw
         h+M69TQfzW7iDMZRdLB0yg53eRQ92nKhQHKRIm/aHQOm3jFY9UazYgVd8yYUeXaaNTeI
         2d/25pF0BYJw3BTm1xDnUHpShs4CleGIgDJPhJQC3emC0Bf5JJ7vd3m6lGDGMxqq6vkb
         LRlfzmWEN2TQm1CyueqsYhBvLbkKJdbZ+7efDOANwMG39vpMZNTbJrcJPfzjQ+VpDl9r
         Ice9TqQcmCmv94AUkzxIDo+lmiy8Obn6HtY+6D1sZDEWCHW6sbl6ayZL/c2gUmk4sfA9
         OAWw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530xzsmoJWNqMfBfKZ63pv4FWTCn6VtOy2Dmyu9gQdEpI3oBChUZ
	d8BTZJbPVX6cNNfA8Yaxu90=
X-Google-Smtp-Source: ABdhPJwG+12DFyTWrmE49tfxiv3XYrbRFkyncs6EHJ+100uhwsf3teVDVCJMkxMvubCsbiSJucgGsw==
X-Received: by 2002:a2e:b0d5:: with SMTP id g21mr35685066ljl.372.1609774207286;
        Mon, 04 Jan 2021 07:30:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c886:: with SMTP id y128ls5469780lff.0.gmail; Mon, 04
 Jan 2021 07:30:06 -0800 (PST)
X-Received: by 2002:ac2:50ca:: with SMTP id h10mr31038352lfm.383.1609774206286;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774206; cv=none;
        d=google.com; s=arc-20160816;
        b=z5cnf4ljIWtOVjFc2s9aW8GzkBgyXap76edTaoaxSRrGZ39NptbpVnrvR+VTOWYrou
         jfWMhO/qmo+58Is9aEhjaGmJKiD4pDryJ6YdU3d/PS8qpd5jb5wNm58KlPbR+jBzBxjk
         IfOlaC3rKlARzJSqqsoTyP7LGeiJ7+lznP6kzj9Z+g3EHQn8AAWaoJ8EghsQJP74yXgS
         pJX/oijcgBX4dJgu64aFNR9D4g61boHew+SeFnGQTWIH0UTcfgtZ+22sC88TdVUzhcgx
         yVj4t1T6BZZikikD04OaxDv0a80pBmhrOyNEgY2bhJDUw1gALYH9FUbUQKVus1KELhpr
         yfKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=oj4ZoyilI0V1seJrAyy0yfaWrreGrdJ6S7bCgPtdv2U=;
        b=gVlZdH502m7bTM984xV8rWerbVQRsVnkPk/Bpdid9WPwHbDfxB31KRKV7C2TWczPLw
         6y2EVXvFNaFdJPAkpy2XraZ2FI6BAjuyqz0qq8Gn9BwhZEZd5HDSIYH/Af9dGRdMThOE
         13rmUbQ0gasJJOxUC2iipt52XUluiQYITK51jV/KEgXN8R0E314GZDSgVemdgAALePNW
         SEG2ZUfojHnMHDi4+0cOQOq8Bn4i+HRWRgcCnMmruAnEM9iPzLErBF96mnkliarBeZ7k
         VuPiad8hmU/s07N3IZcMsAx1+w1P7OTW8jYGj4z4YgL/1swPZy5/UdkIkitzSoj/yufy
         x8XA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=NVmGBujH;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id 207si1581355lfm.0.2021.01.04.07.30.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MT7aP-1kYZ7a2HkN-00UhcZ for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:05 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 8/9] arm-common: Return original SMCCC_ARCH_WORKAROUND_* feature queries codes
Date: Mon,  4 Jan 2021 16:29:58 +0100
Message-Id: <66bd3948cc4efe112778c32d70b81fd131f6bbf8.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:z3o+AM4hYsW6gy4IqoFeMxRCWbCstyA2h2AA8lsHVvGopj/uUXY
 K+1mGY0LQZX1rizcaWDLLoTA+uGWQHCI7YsTKHfDbI+1PEwXfYV00mWm+DIygXOGmhvus3z
 n1RxPYMKrgHdOrJrK9CMTaU07ri3eDWrC8O7lA3itf1Qgge7qkpwMZP/e0u/i6DPHCWmkFx
 ftM7rZcERwZ97qDDg6xCw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:FR9i4U6IvnI=:wgL4e3ppG23xoiWsGodpFZ
 B2BAJvDqDOiX0CijI+oMDevTpbnm2f/KE7KJCf3hLWKlSIQTH+4RBqbxZNmhO7dLh84Z53+gX
 V6A2yTncjWbU8HX2EG0g2zJ3i01OSZIxuzCG0T92RVU9uZ+R0bsbQ+mp8/pEwuSPPFG0ZOXK+
 ZrOcR1K8aYQqLCF+xBjiQubt2/OecIOspfggpHbPdE3LKwl/SVGDKOhvcs84/twEhnviP1jwn
 JJDTc6iZJzu+QyposGbpniXJEp60Yyj4wNH70B3FCqSngoFCfBXVnRdzhDJmsSNGBzHRjoKNm
 iVQLnsAj+q8mI35t1TIn6bZAKNg0+QEMa+iDfi+dhAvhcoALUjECp1vRNts643kgtSTO2s2hJ
 EJaXn+PeGi2cn8acTz9CJA9XxFN6YPjBRjQ7bkN+84O716Da4mFIR08Etl87eT7GyAYUiOQYd
 VJfP5zwakPCdpEtD02fRAlLNZra2w1daRsxW6i5oALWxsrtB3wuUZIIu3YjSoXtMRFcAd4Xki
 YH9Z+zYpZnyxaO0OPg6wcEZeIEwaOO54CFCE49VNIfJziD6XGgsCslL+NJTv+QqdLoQVjTc4r
 naDIYKM4OUf948Epm4m0c8i/evPNcYw0uBd496UNhnQT5/OPfLhV8VScd4irZE4BzIWfWS5Ej
 PVX1B4PWnHwq8uJuoihwFT/SUDOUAOnqt56vnrrrJMNCCy74YDka/Zs4Ck+wJo60eHAmk4odK
 h5jA/3M+W9SiW3/ao4tZeyIOdy9suODoEGaOQJ5xzaTyeoDxqKrpYETqmJavw5P5pR0id4/RA
 RBo1tIc/Yhll2nVbJcr6u0V9aDbjd48bfCGjbRANmxgzoXsY3DZlRSVm6Vj/WTJY10joo2Zk5
 4szx8aDmOMqwRClVpK3A==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=NVmGBujH;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This adds full support for SMCCC_ARCH_WORKAROUND_2 and ensures that
there is no deviation between features reported before and after
enabling Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 .../arch/arm-common/include/asm/percpu.h      |  4 ++--
 hypervisor/arch/arm-common/smccc.c            | 19 ++++++++++++-------
 hypervisor/arch/arm64/setup.c                 |  2 +-
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/percpu.h b/hypervisor/arch/arm-common/include/asm/percpu.h
index a3e38fa0..a3697641 100644
--- a/hypervisor/arch/arm-common/include/asm/percpu.h
+++ b/hypervisor/arch/arm-common/include/asm/percpu.h
@@ -16,8 +16,8 @@
 #define STACK_SIZE			PAGE_SIZE

 #define ARM_PERCPU_FIELDS						\
-	bool smccc_has_workaround_1;					\
-	bool smccc_has_workaround_2;
+	int smccc_feat_workaround_1;					\
+	int smccc_feat_workaround_2;

 #define ARCH_PUBLIC_PERCPU_FIELDS					\
 	unsigned long mpidr;						\
diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 363cda1a..0f80ac9e 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -19,8 +19,12 @@

 void smccc_discover(void)
 {
+	struct per_cpu *cpu_data = this_cpu_data();
 	int ret;

+	cpu_data->smccc_feat_workaround_1 = ARM_SMCCC_NOT_SUPPORTED;
+	cpu_data->smccc_feat_workaround_2 = ARM_SMCCC_NOT_SUPPORTED;
+
 	ret = smc(PSCI_0_2_FN_VERSION);

 	/* We need >=PSCIv1.0 for SMCCC. Against the spec, U-Boot may also
@@ -43,11 +47,11 @@ void smccc_discover(void)
 	if (ret != ARM_SMCCC_SUCCESS)
 		return;

-	ret = smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_1);
-	this_cpu_data()->smccc_has_workaround_1 = ret >= ARM_SMCCC_SUCCESS;
+	cpu_data->smccc_feat_workaround_1 =
+		smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_1);

-	ret = smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_2);
-	this_cpu_data()->smccc_has_workaround_2 = ret >= ARM_SMCCC_SUCCESS;
+	cpu_data->smccc_feat_workaround_2 =
+		smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_2);
 }

 static inline long handle_arch_features(u32 id)
@@ -57,8 +61,9 @@ static inline long handle_arch_features(u32 id)
 		return ARM_SMCCC_SUCCESS;

 	case SMCCC_ARCH_WORKAROUND_1:
-		return this_cpu_data()->smccc_has_workaround_1 ?
-			ARM_SMCCC_SUCCESS : ARM_SMCCC_NOT_SUPPORTED;
+		return this_cpu_data()->smccc_feat_workaround_1;
+	case SMCCC_ARCH_WORKAROUND_2:
+		return this_cpu_data()->smccc_feat_workaround_2;

 	default:
 		return ARM_SMCCC_NOT_SUPPORTED;
@@ -80,7 +85,7 @@ static enum trap_return handle_arch(struct trap_context *ctx)
 		break;

 	case SMCCC_ARCH_WORKAROUND_2:
-		if (!this_cpu_data()->smccc_has_workaround_2)
+		if (this_cpu_data()->smccc_feat_workaround_2 < 0)
 			return ARM_SMCCC_NOT_SUPPORTED;
 		return smc_arg1(SMCCC_ARCH_WORKAROUND_2, ctx->regs[1]);

diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index 57b25dbc..a24bf1d7 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -66,7 +66,7 @@ int arch_cpu_init(struct per_cpu *cpu_data)
 		return err;

 	/* Conditionally switch to hardened vectors */
-	if (this_cpu_data()->smccc_has_workaround_1)
+	if (this_cpu_data()->smccc_feat_workaround_1 >= ARM_SMCCC_SUCCESS)
 		arm_write_sysreg(vbar_el2, &hyp_vectors_hardened);

 	return 0;
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/66bd3948cc4efe112778c32d70b81fd131f6bbf8.1609774199.git.jan.kiszka%40web.de.
