Return-Path: <jailhouse-dev+bncBDGIV3UHVAGBBQV542RQMGQEZSXPRRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id B763271FB5A
	for <lists+jailhouse-dev@lfdr.de>; Fri,  2 Jun 2023 09:48:19 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id ffacd0b85a97d-30c3ad3238bsf814043f8f.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 02 Jun 2023 00:48:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1685692099; cv=pass;
        d=google.com; s=arc-20160816;
        b=KvbrSD0o92+54dqFLzc3tb0DdoqRSfWjE4fNdfrqeO977i20fEt3+wvRn8S83TALYb
         269WzRHag5boL5i9MQ5CDVfk+JaznAhPruiffUjPPflVOSTBIQjSTrOJ7bqu1WCcgQLb
         p+FxYt4HZCqAT4BDeKpVgOmyBNB/5Mk5mmsXaYk9XCkfcLPHMwJjU2qjXXQt1USIgnTP
         E1+KTrlqkEF3dKdOtG5rnAUy3IGdWqWEMZ+PFSa5Qcjq9Z8ODgjlOvMrfZBMrIB1HjJE
         NiV3BewD/y9EG3mMOLdK4Q9Gd6eY8iTg35zahbr/OVktaMelVl8KSuwircTIR+UqFKvq
         UdEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=G5SycRfPNV4tSRHxFPpz4NH889fmWrZqTyGjbABrKkU=;
        b=ymASa4xEdXLA7MF+RxqcR0lt61i1vs72RjGmvKYasw82COYrW+CEvTyz1ZNlA4XCoR
         Mpx0zDfBPR1tXwuVuTJVcfxRmTGVwH+Z7459FSGOpSDoDjtPsh5hTA/0tRFAf5IfseOI
         fFlnMUh1NxjjVvd+vTUZRZQrRwRkYeDdVicD4GdogqBJDwy+cMCgyS5F1XJWMwAriXpA
         MaENT/xBclWrirBAv/c5TQJwg1w5VceVGu9mz3Ud93tTRncsPDIyYX6U6A0lksBz/2IK
         yIvP88nVUZAfmBIvXDvt1gbXXmfuit6hARxH56MzEKh7WnMj7PQLTMnpA759nQHxqpUJ
         6TQw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=1CaHudHE;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G5SycRfPNV4tSRHxFPpz4NH889fmWrZqTyGjbABrKkU=;
        b=GpKq+urH5TKv342Np1/Pb/U32Wskc0RKsfmP/Em8bYXWRoYY1TACInvop+eFb5BhOy
         nKulo+KM28y4YxFUzPamhc4pXxp7phXaLBcUrnnEG1UMVin59BWrbiTwJ6asOwuERqcP
         9N93PFMHnVzy75IYyr+7BoSn5bplADEVx/P7b40D718KKHHaaggY5XFgEyq1STNvELZ/
         WjufmsuDCc4ch5ZnYUzUru8GkAxZp0JnJGGrbfHRrnVC1GcjZs6qVR/xQIKOdOFOoIf6
         fHUGZxx1lu27cYyFoPE+exDrNqAEM/ZMVPhOlSrQVnn6yfrOtGSMkmicoqNy4OfF75Ok
         jSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685692099; x=1688284099;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5SycRfPNV4tSRHxFPpz4NH889fmWrZqTyGjbABrKkU=;
        b=ab5P7RiZmqlT1Dr1R4sjiDRL2Ud1rr3ynAW/YC8YNQ6pfM1ZXjK3PtoVAzutFf1Tud
         qsjS3ZrYTOw+qLxshebhjBhK/8aP9RlryO0W/KCu2IWn/rlAWfr//9DLVTlLjOTcD7Ec
         +KE9XYmchjStQ6Ow6u5NVLhKuJZMUQmS6BKGH6xVBWgMnQc0YfEzZFLuOttWWymry6lO
         RZoPKjuUyhm2v8b93XgEBOLdFwthqUWQRz+b1b033qFWJ8mWVjkvR3Ycw6m7pnL+JPDt
         oVngeoheSlkDxHYUQiEaqPNs8JQzTDvzOJm5dXXYxU4gbCxaY774USMwj4dih+wuFb64
         HmgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyHcWKDtAua+b6oSR70bZkDwR8dylK+nS9wmnHKJEKEMnCCOcVk
	f9aq5LaJ7NSwHWgcqIy/pL0=
X-Google-Smtp-Source: ACHHUZ7PZXCqVSXeV/rbsdrBiUuvRodb+OU4PW9Ij96XWhpPuyJH87z+ECTgNQvc9frj1fWDRnl93w==
X-Received: by 2002:a5d:6702:0:b0:306:46c4:d313 with SMTP id o2-20020a5d6702000000b0030646c4d313mr3273333wru.28.1685692098956;
        Fri, 02 Jun 2023 00:48:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:5c1:b0:30b:3044:3bcd with SMTP id
 bh1-20020a05600005c100b0030b30443bcdls20353wrb.1.-pod-prod-03-eu; Fri, 02 Jun
 2023 00:48:17 -0700 (PDT)
X-Received: by 2002:a5d:6950:0:b0:309:4e64:7a28 with SMTP id r16-20020a5d6950000000b003094e647a28mr3713732wrw.49.1685692097315;
        Fri, 02 Jun 2023 00:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685692097; cv=none;
        d=google.com; s=arc-20160816;
        b=a8e+/faHmCUHfKFC509NYzLGPEp89gd4B8zr6qFP+3a/BpnLYI1vSZ2y3TzEYLsE23
         d2AlWMcci8oi2dT+u2L/kWlnifnqeC59fN8agYMLqUlyEzJ6kr0xswwq1zroz1uoAt7w
         yGVwH92HJOQ67UaHRiGEWbIPzuj+kkqSTtv4eXHNtkSoCXPp0pNQWCF3iTXLDB0K+QGN
         eGhb/kbJgn9PCa+O8AL4gJllKxp1ZxZ18zwec2pAybT7S6DX5IGbLqXhzujbrlEdxZYV
         8vYPi2MvPmbO7EGjQ5q5IQlU2gX8U8O1qwKAXO/rhRaA3BrOcSAceQJKyw9x0uqnRF5B
         WKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:dkim-signature:dkim-signature:from;
        bh=qq5sEmurFcd3/fpI5OnhSC2MKThWwVG23kyoyrWK9v8=;
        b=tdsKsU7eJ6t/coj5DQQWuvLcskSCOykwtjVlWOp2RWOuRrqwVsxZ1HF3CvkkmyEWzN
         ZjFtdilN5JxNll0nJty2jl0Vwmy/oeH2IaEZRiChCGryts+w6zBfJ1kTPkv8GRPDeWlu
         bool9cNWWR/n/J3R+WpweWTBDtOw82IJU4hXMy1Qk1uSwcLZ4UCd1FC3LaSsNNuNORFs
         iTwEU0uPztmPiaEHrZGJKWZZDutchmiLu9iSx8IIg4xgTPpKBnrB15d+hf400Yc5tZMs
         iGJhlCIPDRKe1B/dGj/WNFZUL65NToawASNrwUiLOEHo/D6tchcS+AKxkja3Dl1THlJz
         b16A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@linutronix.de header.s=2020 header.b=1CaHudHE;
       dkim=neutral (no key) header.i=@linutronix.de header.s=2020e;
       spf=pass (google.com: domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as permitted sender) smtp.mailfrom=bigeasy@linutronix.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
Received: from galois.linutronix.de (Galois.linutronix.de. [2a0a:51c0:0:12e:550::1])
        by gmr-mx.google.com with ESMTPS id u6-20020a5d6da6000000b003062765f97esi47297wrs.6.2023.06.02.00.48.17
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
Subject: [RFC PATCH 3/4] arm64: Move setting HCR_EL2.FB from disable to shutdown.
Date: Fri,  2 Jun 2023 09:48:07 +0200
Message-Id: <20230602074808.1383333-4-bigeasy@linutronix.de>
In-Reply-To: <20230602074808.1383333-1-bigeasy@linutronix.de>
References: <20230602074808.1383333-1-bigeasy@linutronix.de>
MIME-Version: 1.0
X-Original-Sender: bigeasy@linutronix.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@linutronix.de header.s=2020 header.b=1CaHudHE;       dkim=neutral
 (no key) header.i=@linutronix.de header.s=2020e;       spf=pass (google.com:
 domain of bigeasy@linutronix.de designates 2a0a:51c0:0:12e:550::1 as
 permitted sender) smtp.mailfrom=bigeasy@linutronix.de;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=linutronix.de
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

Move setting HCR_EL2.FB from disable to shutdown.

Signed-off-by: Ulrich wulff <ulrich.wulff@kumkeo.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 hypervisor/arch/arm64/setup.c | 2 +-
 hypervisor/control.c          | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm64/setup.c b/hypervisor/arch/arm64/setup.c
index dbcba6691729a..21afdb7ae174d 100644
--- a/hypervisor/arch/arm64/setup.c
+++ b/hypervisor/arch/arm64/setup.c
@@ -123,7 +123,7 @@ void arch_shutdown_self(struct per_cpu *cpu_data)
 	irqchip_cpu_shutdown(&cpu_data->public);
 
 	/* Free the guest */
-	arm_write_sysreg(HCR_EL2, HCR_RW_BIT);
+	arm_write_sysreg(HCR_EL2, HCR_RW_BIT | HCR_FB_BIT);
 	arm_write_sysreg(VTCR_EL2, VTCR_RES1);
 
 	/* Remove stage-2 mappings */
diff --git a/hypervisor/control.c b/hypervisor/control.c
index a7bcd060ab0ed..3ad8ee48967b4 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -826,7 +826,6 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
 	unsigned int this_cpu = cpu_data->public.cpu_id;
 	unsigned int cpu;
 	int state, ret;
-	u64 hcr_el2;
 
 	/* We do not support shutdown over non-root cells. */
 	if (cpu_data->public.cell != &root_cell)
@@ -858,12 +857,6 @@ static int hypervisor_disable(struct per_cpu *cpu_data)
 	 */
 	spin_lock(&shutdown_lock);
 
-	/* set the FB bit in HCR_EL2 */
-	arm_read_sysreg(HCR_EL2, hcr_el2);
-	hcr_el2 |= HCR_FB_BIT;
-	arm_write_sysreg(HCR_EL2, hcr_el2);
-	printk("Set the FB bit in HCR_EL2\n");
-
 	if (cpu_data->public.shutdown_state == SHUTDOWN_NONE) {
 		state = num_cells == 1 ? SHUTDOWN_STARTED : -EBUSY;
 		for_each_cpu(cpu, root_cell.cpu_set)
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230602074808.1383333-4-bigeasy%40linutronix.de.
