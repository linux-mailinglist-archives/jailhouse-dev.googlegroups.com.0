Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJWDZP7QKGQECZZCBDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF32E92AE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:39 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id 202sf16635321lfk.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752998; cv=pass;
        d=google.com; s=arc-20160816;
        b=ns3M9q3atoWTxbx/y346xBGVlWz/uwDoYBA2hZu/SiNV1BW3MdkWAFyfZIxISlQ7dL
         4e5gZBkvQQVcTQUP4QfbkfPr7pCyLxF8rzYunuWSLNjH/ZLIhWsnHOVV46G44ojP8+MW
         DfQSgO3+3Cb2ndCs1GoBS+kJynDtkdeqohufFsPBh0eGL0ZcidkjP6CzgHak0jgRd3zD
         qmAaPiYnGwkOtunA+qsXVhI/S8FvnAlhMoBIaMMMre96bW/hkWsnlcr5S2g3IHGTtuUF
         vgoSqv3EeYkmJT+MQyG2W8UyzZ6SAeF2AAbf3sum9KcFuEqZQZFqLOIq/cCv5K2vFB+J
         WLZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=zha1mv1ya/XAoqraemAzFrQBJDqLCjPhs1VTGrm8m5g=;
        b=ksdpY4fTmZPZ1aLCNBeUrSxOkbBJh45QRTEUg6vLoY/sgZZbx3I2Z3SkcHChgwGkku
         P/LncPIZhlSldT1kJyu5yL+7EA9poV4nMmr312dK8cpL+xocD+Yx+8R7OK0y6zXY54V9
         9xRT8k4iKd3IJB8zpDjJSURf9bspa2q9zXRKEfSX9g46eyMW+2VbOPl4URqkW42Jgnwu
         opHEzrtPOr2ZK2rSsDWOWIarBL93KOxPfIRySgt5RItktXQ1CTfQUOZGYoD5FCgOK15n
         m9AnOjB4YbXfeqC1aPX9BdjXokaRsBY8AXwPAf8qcCe+qMCSpu2emV8fci2qWTUXWgA8
         Od8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=p6UwHyYr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zha1mv1ya/XAoqraemAzFrQBJDqLCjPhs1VTGrm8m5g=;
        b=jF77j+X8Rq9UlVRGploExQtmZ9Q+1PfuVnKbJc4uX6xUspwOKHyR8BcO6vq2lC4VAy
         AIWXLHTjLVBKJ0FEZQRgHFO0BDUwDV80GD+MZoLG/UqBVo7CIVqwGk7ArcI2Vqml65Q3
         aDVYud/9KAArs7On3Xcgv7Hx5GgUcykfyUYDszstMUjPKDnyh2lWjGNTavGo6d02UD6v
         U5Dy/ngIFK+fDIOgieSrih9DpdL8PedhiIh1U+B02712KB+3Zki6oz9gFT4Ch0qz0yih
         3msT0KjFEe9NqNQEWhD6can28qB4er8Ai5AlfGSOf7gnIxH8+popJe4Q0HT5NB11TSSy
         SHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zha1mv1ya/XAoqraemAzFrQBJDqLCjPhs1VTGrm8m5g=;
        b=kybI3HM0RHzeJw/Slcmd8wweIMIT4smyEJ16Jf3v1nnpPaUITpxlQnx+rzjPF96kpl
         pgtIlC5Inqfctw6BxmjtAmP+1fDPtK+I5WovM1yt5uuFSzrGUX+OyuYLNFsFHv1e/HvT
         0g8xvGGKJ5RlNppxLRuefmFtngjeqYH5SdP+zz8UZ90nnwxT4x3A9v4WboiYHykPlTsk
         4nXpV36gU1T3vunn+RdLMmG8pzSOeFoWt4Epxgkezfm+qz6tTtQzuWITRMgSh3LJNQ/6
         8UHTjXFsBhoSWfYuB8CW0dst9PY8aA0kvPQdJnq43UsyzDERMjyVrFKoNIWqfC2m8Whr
         xAWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532YhjkotJqzltFb8wmHV9pPSmEiPupHkL7fKTLhsdy+0CcQZPhc
	VG3l2/NVvcrWyeO/b2qwoaM=
X-Google-Smtp-Source: ABdhPJzclybODddcRcOmVXidlCPjdJ4frefOPBxMA32p6ingIVGd6k+tW0dbr6pCS8Hl1tY+lB7aRA==
X-Received: by 2002:ac2:5924:: with SMTP id v4mr34054109lfi.129.1609752998811;
        Mon, 04 Jan 2021 01:36:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c1cd:: with SMTP id r196ls4758109lff.1.gmail; Mon, 04
 Jan 2021 01:36:37 -0800 (PST)
X-Received: by 2002:ac2:5b4f:: with SMTP id i15mr30115863lfp.572.1609752997827;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752997; cv=none;
        d=google.com; s=arc-20160816;
        b=zoIHB1cijf9wAqWd4S4p/KI/oYfHBj7s/P8wT4KxWMuwyBm4C2IANt0i5IlQSzZCTs
         e7NcGeiCpVQMk+RyMl8YN4g6abcmI6H30/Hi0HilyvTVHOABfTFnLOYp9WuPB+DbeboJ
         RnsG1J/rk6tXrEJYAIojaFwyi4sGoAkSbV3ECwEx43tEAdWj+FRm31hX8mUF6DIKhhI+
         4mElWZQhTseGr3H9XYkmwOo+9hKcWVSR7EJZqDfk/JXBZFami3b1pzSuGSMOmMR0k3ir
         E9TT4wP3tH1ZEK3gznFHD1zRug+3yMoNQdM0hqHDuYGo0OOFLicCwiznB8sDA2Stut3l
         aK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=sThGd5m5KNRpiLFyIBpTB7k6tfR3blk1udBCLLcBcEM=;
        b=JNX92845vwmreaqcYG5JmtxONINJEkeO9JByrRwpmc/wV8Lkv5dkl7cEVnMnpNrJj9
         aEBt6BzxmFYwX6N+DdwpgV1Uf828ojUk7t+afl+AIgv522k9e2533EpYnmj0rUxrJ7mL
         G1qm028UbjAducB1rwPtJXKdaTjf7xr61DHa7pRGyaLPgj8Qszb3Mcea15LxBpyAWyL1
         puoUDatFPMNX5lrFKX/1wUU/ENxTitZOd3TuFUEpaEVTg7BM/fKhUjsVyE7DZ3dZK6Oi
         1jx7R9VkbZj0j5KxBPPrrgEV7OrIse6ZWAP1t+iEbPJvC0D3GywJgMljemaVoqX/gl9g
         us5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=p6UwHyYr;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id q28si2113872lfb.10.2021.01.04.01.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0MQ6LH-1krhaw0Ylf-005FXe for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:37 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 7/8] arm-common: Add handling of SMCCC_ARCH_WORKAROUND_2 requests
Date: Mon,  4 Jan 2021 10:36:21 +0100
Message-Id: <4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:XOmjAKw9r0MK2icVv0yhn0vuetoJ5u2W5B+GNvRAz9bkGlp6RCc
 4lTt1+PU0xzjhOlOWB5nQ1gPxNxHehkKJNwfUnrCSJ+AQsMjy7q0c46DdcvQp3v1+pznvjX
 yRywGmBPR7TchjKHKMHeomVQwEeGOkjAq4NDA+oFYDt4rbZUQLUJ6oc7QcgAd9/7PGNHwOB
 nkoMr6+fBBtYrQvr+DG8g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:js1rxz1VdKE=:yjZQJdO3T2kUn9nV17ySKi
 2DE/uVrUxB25BauWf4uIIvGghoy115BBwcd6fLEQ5MoT/KVrHGMsrXRxe6GqOGhtgnZkOcbSo
 U7CUuAPKmZwuFT+QaEBAsj/5pzuZb/uPkrzDoMf46NsWWCox/bSC9aGrwQtxJaC4Cqt0OlIoJ
 KDccZoWMaBgDAtMubwi5I4yFliUbNOFfmnNEO/wfpEI1VRKP1kN25KOSs7Z5PaRRLAeQIEqI0
 vJ5b12ycrT61MNV5/A5Lj6KFDgPvNeePYXGdhVtOZzY8pg/v+2gFyJ7JZ3vbW4DLY5uFB50jS
 jvqfqYAKLhcTN/NAzLdHhYXSrTWGfzgcUOJfImI3mTo1WFqIDOxE5KsH7WEWCa0n95ehlMLhw
 J/SxQaUQaswR4MlLPKr7ybachKnY7GLNUsqYkPLBURH+h3TUQF+3p6kR5y3U16X2AxSL+F2V2
 5EXa9XEzpnR82VdJnrTRO1Vih+n8IOGU05kyg5PKNXM/Vq68gl6sruACajtC+nsLePSsuiJfU
 4RiJ8qS1tK6FVnWz/eReKDDDRJoMM/iqKxp7soc1kr1yirwwzlJ9BuWeca+sKvZoQDoddGamH
 0qgDBgheKo3Te4uebEMOlMKWp1VVq1qauvUxMbrhvBFq6kA5iPZQH+8+tMOF48MUj4lOWvMEm
 n+d6pC8E1CGKvfxJTptcYNYQxXd+FcWlYkgZrbo/mOZjmP+9UUahELqnBEtgdO50d+vig9NkB
 l6sulL7gqai/6Pti8mm+TmXIcE3BLX15Vdelzw1Wmc5B8DYjfibT8/RyJ/sQ2d+lcb8RSErUJ
 ukMEt6gszW/MgydgPATjM0emuuQF4+yoFUJ2X05LR86BxdR2RJ7CS6Q6Wt/ZoPxLryuojKtCa
 ZmrwrKdjmu+3lltv5D3w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=p6UwHyYr;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
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

Jailhouse does not need this workaround as it isolates secrets via
CPU and, thus, cell-private mappings. However, guests may request
control over the workaround. As it is per CPU, we can grant access.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/include/asm/percpu.h | 3 ++-
 hypervisor/arch/arm-common/smccc.c              | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/include/asm/percpu.h b/hypervisor/arch/arm-common/include/asm/percpu.h
index 4b37e1be..a3e38fa0 100644
--- a/hypervisor/arch/arm-common/include/asm/percpu.h
+++ b/hypervisor/arch/arm-common/include/asm/percpu.h
@@ -16,7 +16,8 @@
 #define STACK_SIZE			PAGE_SIZE

 #define ARM_PERCPU_FIELDS						\
-	bool smccc_has_workaround_1;
+	bool smccc_has_workaround_1;					\
+	bool smccc_has_workaround_2;

 #define ARCH_PUBLIC_PERCPU_FIELDS					\
 	unsigned long mpidr;						\
diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index bdbb067e..363cda1a 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -44,8 +44,10 @@ void smccc_discover(void)
 		return;

 	ret = smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_1);
-
 	this_cpu_data()->smccc_has_workaround_1 = ret >= ARM_SMCCC_SUCCESS;
+
+	ret = smc_arg1(SMCCC_ARCH_FEATURES, SMCCC_ARCH_WORKAROUND_2);
+	this_cpu_data()->smccc_has_workaround_2 = ret >= ARM_SMCCC_SUCCESS;
 }

 static inline long handle_arch_features(u32 id)
@@ -77,6 +79,11 @@ static enum trap_return handle_arch(struct trap_context *ctx)
 		*ret = handle_arch_features(ctx->regs[1]);
 		break;

+	case SMCCC_ARCH_WORKAROUND_2:
+		if (!this_cpu_data()->smccc_has_workaround_2)
+			return ARM_SMCCC_NOT_SUPPORTED;
+		return smc_arg1(SMCCC_ARCH_WORKAROUND_2, ctx->regs[1]);
+
 	default:
 		panic_printk("Unhandled SMC arch trap %lx\n", *ret);
 		return TRAP_UNHANDLED;
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4d759c5d5634bdbd56ef1e463be5736bb5d7ef9a.1609752982.git.jan.kiszka%40web.de.
