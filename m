Return-Path: <jailhouse-dev+bncBDGIV3UHVAGBBQV542RQMGQEZSXPRRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A2371FB59
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 09:48:19 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id ffacd0b85a97d-30b590d5931sf912171f8f.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 00:48:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685692099; cv=pass;
        d=google.com; s=arc-20160816;
        b=eZxhW8o2jZG+HExzZ1CM90JJwd4rj6xvDX0p1zE94Oh77+SwvcKvg75JM0ynQltOaE
         K6aWCzvPHBybL1oIhN2B4EM0gq1hfzeDPovJ/6kUQcs9f0CiFkER3mLM8b+W186pysZh
         cf/guNF5YZ4SGAEXT53PgGOc7CqyRz+pDEw/4fNfMInpR2y+88Tg30/wLrpedyxPDFi4
         vvtrQrmSPtIfWMPhdUQVNW+Lpc0T5A6jQISbcMXEaf/5KjyD2iAZokJ6R5Xnfyqr7Z6v
         wu3N9Ya8UGy/YAhgKxSXmZjsqdfpfDgNCsgn0c5BOLl/nAQswf4qMR85Nop0/YSDW1c+
         HhFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=/jLeeO/+qvVm3qq0n2+qUOsnMd+nbOknBaiiuTzE6BQ=;
        b=apYAZrCreMcHIpxFKfFuIkpBY3l10S9H9Y/x32rq0MmcfeuKhYI3IdC+es1XMMrHrJ
         4Eod3FRhYLbjewS3x+R3kNyLmLXDDmpVhXTvO7ytwFcjEHqrQ9TCnzlZkYSBH0XvKlM/
         UXjgF1cG79BoeWV/+PSN3EKPqk9LALar2iRnrAJ1CdEYvVMV1/AxeTt4LREBzGhCbAGk
         xrXis0rjOkvokkKHcGwSrkIzT3kBQafH8EIVUsu4d0oIxwANJie8C0j2ulsgk8OkLFp/
         66ztiYKCyaBZNI1ZFjsWkQ6dhVdTG2tIs+zHkxJbNmcLpFs5sBFDPVExrb49ipyHLY3n
         w/aA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=2XjwM5v2;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jLeeO/+qvVm3qq0n2+qUOsnMd+nbOknBaiiuTzE6BQ=;
        b=gR6H0SvPfqdoCQbpSroKOZI+2tKm4ok4j8kqentLFc0ZQIqUKCzSiZptafhlzmFf7o
         89/SPqBeBAlTDEUT9dOmO22zYoTDSxzGYqKJsiKVWoDWvJUzIBxd02LnH5QkAX5VGKNr
         Gq+it/Kbzna/NzKX6uo3GbSg/KcsR6iohXTAIGfzpgzsJqfHyScroqoyK4/8/hvoFZJU
         RuAXLea3fNMy1eRCLthH9NDSQQgEoB1xElGUOUjgLeVaBCsOXbaZeuWjJTu+77fN5m+z
         OgDyrMBOMLKc7TI/50XSAMhYcuRpjmZidkLvqWGOHA56EaVSrNIqQqbB5nBUfTMukwnc
         t6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jLeeO/+qvVm3qq0n2+qUOsnMd+nbOknBaiiuTzE6BQ=;
        b=cGcNQEJE0zU48dbYq02SDv6WIVWs9UiEeonmnQS4jxX9lXrH67kHAtpN7cgClPdbdQ
         TjNUEBWUHgI+fxp++2U9qTN5BZHyIz6bQ2KKuBWUIR8Dcq0ZU+L+gY/zzty7Hh1A+ZXN
         mw956EwmiNxFdpaMj7NhYJZ+wUZAZfTRFYtTYxfXbKOX3Waziplym6ToxViWI7TYkcCJ
         hKfKB+O+GXrF/2pQ1KY6o4Y23uSpNhU98LM2dcXahvSJd+UXObICGyDqbWCyqrjruDrQ
         slam3jVRAQ7YPFGxlatmvM9miPpNWgM9TUq2P7mNmcAp8oGz4MqSywrNqCLjtakilVlN
         9ZDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyKe/1UBsE9CmDVrMVgksc6DIimfPJZHROE5soTTlfWjKGDbAk+
	REJYmW/RE9LbMp6N9xuvym4=
X-Google-Smtp-Source: ACHHUZ5Vvv/jE6P8rSnahZnMgTbf2w/eO5jzyKJ4yHdLiNxSBXed9y7nDUbrXPOzai8BhQn/vOt8Ww==
X-Received: by 2002:adf:e68c:0:b0:30a:e65a:1b0d with SMTP id r12-20020adfe68c000000b0030ae65a1b0dmr3930574wrm.34.1685692098955;
        Fri, 02 Jun 2023 00:48:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1f10:b0:30c:2d4b:ad3f with SMTP id
 bv16-20020a0560001f1000b0030c2d4bad3fls121031wrb.1.-pod-prod-04-eu; Fri, 02
 Jun 2023 00:48:17 -0700 (PDT)
X-Received: by 2002:adf:ed4a:0:b0:307:a24f:c15e with SMTP id u10-20020adfed4a000000b00307a24fc15emr3570499wro.39.1685692097258;
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685692097; cv=none;
        d=google.com; s=arc-20160816;
        b=qTLZKWj8iy1BWPYsZXLTBxdaw4H8rAUn8UOliGu1OVkqVo6uJwWKZm9Fru8pW+iUPw
         jEOd5+9G/gtf1xPfpG+9yMz8JpkbOb3iuX9N2E93C7YqjODrBBmUpeXb37C2aHwA17O8
         SJKxNhX6ieTMU7aVD3etmd0x1pyg7zZMBIxqTQpC2alENsNyqFMWGh6+8lIavDmhAP9b
         qKkvdyJu7X2VXQGBl9cyRfOVtQr7lQv+NHUnGgeRfV0gA0k8YZF7AalCNUeS3mYepV5p
         4/OW4OXbDYmC1PUyWlZsgOjssE/MU0AzFKXzSCH2lWZhKuysDWKZeDQ97uYGb4lwa1ot
         0F7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:dkim-signature:dkim-signature:from;
        bh=hTrYvNZ05CcRI+Pj2HW9SxbhOmAwkLyvVpdEn79i0MY=;
        b=SQlxfIScrvTozBi21EGM2oy/OytM8Ggi6+R/lxgDrLM+GeiPlfy/g166Lz9i+0eHtZ
         TeaMH2A3Y/rg7lGnfK25mNRw4DUlqenPyYENgolZq/2moYmtDk7IrUFlRs/Spr9tKvyr
         EQYClvzgmN2I27DJloAMEwnj2sV3zMOgn5NrMcC57/2+YAZdh8Uur5pi9rXZJpgeYiys
         sgP/DXDBWZ053kczRfclhLqe2qd6tY+1oMGbqBBpeb3WBbVF7uJy/TZilEGP37VHNDqw
         W1tP14/weDnUmaUvDqRHA6P9SVK0rah+hm0J3cFXSgpF4JyDPL3SP1qePOKq/jJJPyAc
         hrfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=2XjwM5v2;
       dkim=neutral (no key) header.i=@linutronix.de;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id b2-20020adfe642000000b0030ae6c2b542si69942wrn.8.2023.06.02.00.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) client-ip=2a0a:51c0:0:12e:550::1;
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Ulrich Wulff <ulrich.wulff@kumkeo.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [RFC PATCH 1/4] arm64: Set HCR_EL2.FB at start startup, clear durin cell creation and reset.
Date: Fri,  2 Jun 2023 09:48:05 +0200
Message-Id: <20230602074808.1383333-2-bigeasy@linutronix.de>
In-Reply-To: <20230602074808.1383333-1-bigeasy@linutronix.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Original-Sender: bigeasy@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=2XjwM5v2;       dkim=neutral
 (no key) header.i=@linutronix.de;       spf=pass (google.com: domain of
 bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender)
 smtp.mailfrom=bigeasy@linutronix.de;       dmarc=pass (p=NONE sp=QUARANTINE
 dis=NONE) header.from=linutronix.de
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

From: Ulrich Wulff <ulrich.wulff@kumkeo.de>

Set the HCR_EL2.FB during startup. Clear it after cell creation and CPU
reset.

Signed-off-by: Ulrich wulff <ulrich.wulff@kumkeo.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 hypervisor/arch/arm64/control.c | 1 +
 hypervisor/arch/arm64/setup.c   | 2 +-
 hypervisor/control.c            | 6 ++++++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm64/control.c b/hypervisor/arch/arm64/control.c
index 5b41b39363cde..99283cbff1106 100644
--- a/hypervisor/arch/arm64/control.c
+++ b/hypervisor/arch/arm64/control.c
@@ -81,6 +81,7 @@ void arm_cpu_reset(unsigned long pc, bool aarch32)
 		arm_write_sysreg(SPSR_EL2, RESET_PSR_AARCH64);
 		hcr_el2 |= HCR_RW_BIT;
 	}
+	hcr_el2 &= ~HCR_FB_BIT;
 	arm_write_sysreg(HCR_EL2, hcr_el2);
 
 	arm_write_sysreg(ELR_EL2, pc);
diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index 376648e3f1d4f..dbcba6691729a 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -47,7 +47,7 @@ int arch_init_early(void)
 int arch_cpu_init(struct per_cpu *cpu_data)
 {
 	unsigned long hcr = HCR_VM_BIT | HCR_IMO_BIT | HCR_FMO_BIT
-				| HCR_TSC_BIT | HCR_TAC_BIT | HCR_RW_BIT;
+				| HCR_TSC_BIT | HCR_TAC_BIT | HCR_RW_BIT | HCR_FB_BIT;
 	int err;
 
 	/* link to ID-mapping of trampoline page */
diff --git a/hypervisor/control.c b/hypervisor/control.c
index 2214406fe0acf..bb54b01fdead9 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -413,11 +413,17 @@ static int cell_create(struct per_cpu *cpu_data, unsigned long config_address)
 	struct unit *unit;
 	void *cfg_mapping;
 	int err;
+	u64 hcr_el2;
 
 	/* We do not support creation over non-root cells. */
 	if (cpu_data->public.cell != &root_cell)
 		return -EPERM;
 
+	/* reset the FB bit in HCR_EL2 */
+	arm_read_sysreg(HCR_EL2, hcr_el2);
+	hcr_el2 &= ~HCR_FB_BIT;
+	arm_write_sysreg(HCR_EL2, hcr_el2);
+
 	cell_suspend(&root_cell);
 
 	if (!cell_reconfig_ok(NULL)) {
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230602074808.1383333-2-bigeasy%40linutronix.de.
