Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBX55T6RQMGQESXSREVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 2750C70A0EE
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:04 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id 5b1f17b1804b1-3f4245ffbb4sf20986015e9.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528864; cv=pass;
        d=google.com; s=arc-20160816;
        b=iNEXoMohRYgKvFBEslTGSBUXpb7nwH8pFI01QcOxdCa55MjiLiuXHMhbCOnMv/2Nmt
         OQAVpyr26M6Ve1WE5RJVy5I2hmDOjRvDxouyiInoMHq1c65mxSmbgK7p5ngmkXBL6ROf
         FIptSVjHgLLsNTZU4vvTiMRsfh4YuXYiYfssHW0s7v5Crd73GVQDitKvZSecgGQTb4YM
         DQXkJpJvBBRASdynl9t3Jevi2+ko5BIzU71EWdM6q8lc7StiEEWyep44KoX113TutfDw
         unCiixggKzxg4kNv/fHEkU90zLhGgiZpO75erf1GlIJIXos16QHYm2zO2hfMFzJHzhX/
         0uNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=LsrqCJa0JepNUQRG5yzV+DYqbIsPwbQQ20sg1CXt2ac=;
        b=Y0b/9244iD87k4nT67ff8MY0L8Id1em2q47Azqq9x7b3AIB5F2P8fVfQBrmQW/qF84
         ort8t0Dfw6kmMIOZbkm4yFYZ1THxP/EpfxWMELXr9imMYtM/paNKGQfMkba+HJn7tYnI
         l9TjZPZ4wAJ+NEF3EgB35kpKIVFideamY/zCCXnDQhl4obCus7HqRTFPe1fz+DcCc9ag
         EoLGWX/99JJQ0s659/yAmLm6tfRn1mB7LXgs+qPdnSnH1oGh80A1j51cW3Ah9/ApVyGl
         MjvxAf5YgcTdcP+loCjo2j5RquuUyMOa3WN8jvMnB58WekceZhbop8lljKA6i1QxKpSA
         D8BA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528864; x=1687120864;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsrqCJa0JepNUQRG5yzV+DYqbIsPwbQQ20sg1CXt2ac=;
        b=Ww1k0kEIcsf8pdOClQwjyjGRcRHk0OeTjX7udjB5X3tlB3sGOtgWxWKc/N9FVzBgWv
         RFP4m1CfC3/f9Y002qDbn+kAI/NPAXMM7HH7YKugg8IU2LrZYw2oW1XorhWrHmbRWMJD
         P1XkFqft1hSbZbevXAGSbfNbWH+yV8wTOD1tj94FHZF+yP0sxt7TkT6c1/Yv+YS0Sujq
         cKF9vsInxVaUELqfMWDZ55b6gWd/EX3BzjTkcTNCdaVPo1BP0IkR9RT56u1JRcytBLwO
         MeeHzcXleK4dzjZZ6gOUwsnOyZ2WIJPjVoyb9F337Vw8KoXHWxevduwooA2G9+w6bzEB
         p+mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528864; x=1687120864;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsrqCJa0JepNUQRG5yzV+DYqbIsPwbQQ20sg1CXt2ac=;
        b=fD+yjhI7EKcAGE4qN1hqfBwWqag8xGGupRCgFg5tKq2HKTcDHkR6JNOdjvTidwmGZO
         ZfkHrxRkpqdyUo7fmYBuY1Lxi7acqHLMUe6jpsMCb8zfXVbGtDL4ZMd7f7T+nO9+YBnP
         45/sHITFVOpyngguCe/JgUzsPQppp6C5nJf8s0kB/ZESLCYlHX8vh1wc5rMQs1PYUsEF
         CH9/wLNAYug9NHvCRi3o6uvwsvV755rSRJaN344Z8T12jwZGhUtxkt4/EDM/rrMNQntK
         Mn/eZytbtD3InFqrQSV+3yzL4RBIaS2CZxxv1ufcbYybrGCSUjGr1SNF6c2aj/AXasd9
         SUVg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxr+MD5S4IlSo80L0t8rAUqlUfle3LXeuVGI/uCDMLNknReVek1
	wHTOxD3iRmQQJ5iTpHDkDr4=
X-Google-Smtp-Source: ACHHUZ5Z8F8dOFounBprjkskQjr3GFO9njG4zsSIAciwNxprBH4xiSvh1jUieyZylr29V39a7XLRSg==
X-Received: by 2002:a1c:f712:0:b0:3f5:d6e:b122 with SMTP id v18-20020a1cf712000000b003f50d6eb122mr506669wmh.3.1684528863660;
        Fri, 19 May 2023 13:41:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b27:b0:3f5:de41:8527 with SMTP id
 m39-20020a05600c3b2700b003f5de418527ls1516020wms.1.-pod-prod-03-eu; Fri, 19
 May 2023 13:41:02 -0700 (PDT)
X-Received: by 2002:a1c:7503:0:b0:3f4:fffc:cd74 with SMTP id o3-20020a1c7503000000b003f4fffccd74mr2180215wmc.16.1684528862042;
        Fri, 19 May 2023 13:41:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528862; cv=none;
        d=google.com; s=arc-20160816;
        b=ajTbnLfPKoMIGBx/GSWD+1qaezfdoOWL348/KcSwnbsUounaNa5J4okggLecnold/w
         w5yhZaOeVfzMRoGk4/QodGm5Z3arMNB6T/2KZbnjjGc4LuWH7YQDxeQwlFhsh9d0v5hs
         i4QR8txslsBFKEeYtmX2BL9W/JHyHUP3panThtQwo8s1BKc7Ba3D/c1uHCBQ2qDwiUlE
         7IKy49QPtfEdb5Mr9UgBOT7lOSoOJSU4Hbrve4nN08l6p1Mo6+xmKwgqp9agSrATi/uD
         bOmNZO2tA2V84t6qs5LFKN1F3fOXSGtDm5lH4SMm1ZYlmE38pR+SgtaiBJySBA40pJtI
         PlpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=nQhVFK22t8KLd/Z1fDbSdAmb1pXrOBaA+s2wWhhcOPw=;
        b=on3fe/a/nNkbOtsykVr+nPNybDlOaZhfNKJN3iFxBzdfVcay+V+NFiTgZuwpAiyio5
         RO043pbhNOR4RtPhyjFjTfFd3deR8emw5lwJEl9bxgql1FYhY+zBCWv31N7dzroxUYXF
         hlOyZWhI7uXWCdNSWeEw3sHXdAlR3B9gcIZwG3FQVKhuwG1mMu9fAgalVWgiK4Q15rpT
         tSrmWXC/nTCMReSOeom3J131Ljk8DtfU+3RF7omWViHGWl9Sdr6rp8pXSletE5QkSaPl
         2e9kGl7qhOEfhymy3ESsepiSIRVntMxEiXOEMgNs8UGUixB6wo0Zzh/WJYwrr7vnDoX9
         5FRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id az19-20020a05600c601300b003f4276a712bsi291070wmb.1.2023.05.19.13.41.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdn3McdzyHf;
	Fri, 19 May 2023 22:41:01 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 60/73] core: riscv: PLIC: remove workaround
Date: Fri, 19 May 2023 22:40:20 +0200
Message-Id: <20230519204033.643200-61-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_ALPHA_NEGATE 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
 __URI_NO_WWW 0, __URI_NS '
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

This bug went away with linux 6.0

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/plic.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/hypervisor/arch/riscv/plic.c b/hypervisor/arch/riscv/plic.c
index a65de82c..4f4b64fc 100644
--- a/hypervisor/arch/riscv/plic.c
+++ b/hypervisor/arch/riscv/plic.c
@@ -224,8 +224,13 @@ static enum mmio_result plic_handle_prio(struct mmio_access *access)
 
 	irq = access->address / IRQCHIP_REG_SZ;
 
+	/*
+	 * When booting non-root Linux, it will set priorities of all IRQs.
+	 * Hence, simply ignore non-allowed writes instead of crashing the
+	 * cell.
+	 */
 	if (!irqchip_irq_in_cell(this_cell(), irq))
-		return MMIO_ERROR;
+		return MMIO_HANDLED;
 
 	/*
 	 * Maybe we can abandon this check. The cell should know the max
@@ -254,32 +259,7 @@ static enum mmio_result plic_handle_enable(struct mmio_access *access)
 			goto allowed;
 	}
 
-	/*
-	 * FIXME: Why does Linux read non-allowed ctxs? This seems to be an
-	 * actual bug in Linux. When we remove a CPU from Linux, and we later
-	 * change the affinity of the IRQ, then Linux will try to access
-	 * Contexts which it is not in charge of any longer. While Linux
-	 * disables IRQs, it does not adjust smp_affinities when removing CPUs.
-	 *
-	 * For the moment, and as a workaround, simply report any read as 0,
-	 * and forbid writes != 0.
-	 *
-	 * ... Okay, we really have a Linux bug here.
-	 *  (a) Linux doesn't remove the affinity from removed CPUs
-	 *  (b) Linux allows to set affinity to non-present CPUs
-	 *
-	 * Actually, we should always return MMIO_ERROR here.
-	 */
-
-#if 1
-	if (!access->is_write) {
-		access->value = 0;
-	} else if (access->value != 0)
-		return MMIO_ERROR;
-	return MMIO_HANDLED;
-#else
 	return MMIO_ERROR;
-#endif
 
 allowed:
 	/*
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-61-ralf.ramsauer%40oth-regensburg.de.
