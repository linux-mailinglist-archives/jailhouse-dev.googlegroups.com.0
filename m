Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTN5T6RQMGQEVKK2JLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 5460E70A0B4
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:46 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id 38308e7fff4ca-2af20808e06sf8986631fa.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528845; cv=pass;
        d=google.com; s=arc-20160816;
        b=trwqjt6qxW3lSz+jOdpA+1F5A9Uk84EKKEuE7sQ6lPnPD0zZ1s/OTlZ20haP/7uve7
         wWCGE2lGAHxvvrkno57lIuIKSLm0ck39EhUsm62LMrA6kh0P/HqGfBKUdPDT64rUo0Fr
         Rju2PTIB55+3gJBC/Vd9cDxLRq3lQJWyPGKXWrEWZqv3a2MGp2HiCxFwm8YL2MTzcp4h
         sqZXOK8tg6yE8+edGHzvYgsZU/t82QcqiXPH8alhttyNeuYHlVSkwrrRhGA11Y6XpRCq
         9NwiSyFw046mZVx5V8wd+825T4Kbi3xfaXXj6152lrBChF+qT+XWcdhqOeV37hs2mTf3
         iYcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OFayaODFrmtGLI3K14UKbCi44WhHnQaAYSzchw4vaPA=;
        b=mqRXRcD1HdOg2oFlsREG0qypAh3RaoVRMsF0XBgRsvYoI70jLOUU6lE1HTt5ETSleW
         IJh2/ymA1rHuOqDxW3wozNIqZ0FPHB/rNDqlKfOneGuTNv5EAWpjanxYoeYnNpLDyV8D
         DAT2MRLMv1MU+CrIliGetbvGjO1P1wA9wSZTzkKqKoFLxaxyiSWtixwEWZ2vUJJyTXlX
         4ibiOQ+lt7U7vK/pkMDTjboFyKdBrYeMp76ZdEqLatq2dZzeYRJaJvNy45JBnCOBmtZU
         wkQiZpPbjWu34L5V9Bj1lhvHuS6sfNDKLGlPf5VflrLJduKlTWmR0inhnutf/6WtnzAD
         +QOQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528845; x=1687120845;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OFayaODFrmtGLI3K14UKbCi44WhHnQaAYSzchw4vaPA=;
        b=dS0ovh9jaAeNzbSSsjRpH8eymT05r+5N1jSIyT7kJzT7sMiZM6NUALJU+o5M0SHtbO
         at50/XE7FTHYxG/r27ycasjPrS9tJR8svtwN1jHUxUh/BEfvGOJMiqB07OqaOhDuFN1h
         l5VZeismaI43PqsngdYgz1EMm6431KwTE6Dzc1iKwOIwsC3ZyWGobdEUhtnXUMEmbZ8O
         VY+VKFVZjL1ESL1kEpe67ZdyG6LSNFluNU2/ITJ45McN5AVLjs+Amf6/QRjbJV2MpDiQ
         vcktPCLtf8/EpbepFvIRKiGG4kjAFxrT49h9mWq2vR2Ajs+cjqy/Nn4Wy3cqJyq8QWke
         bYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528845; x=1687120845;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OFayaODFrmtGLI3K14UKbCi44WhHnQaAYSzchw4vaPA=;
        b=c0l5ZoRmaG3Yl2PaWAKpnOTg9mf7WQD4H2pOBVgrKaaFnuSbKP3whd8zh4pQr/aLXX
         HAyw8fdchJnQ05qHMbsXaUcVytL9HI2ESNOnW/8cJZAp0HVey/MgbSEp6Vcm5dHSheE1
         uyrKoD8ouqp2Y9dv3sl9qEX0ETCTtZlfDHtrkJCst1Gk4O8G4tkllKF+xICaIhj+fNlY
         XiA+0eH0YKTV9JAr05weSTfTKYjXz1gu1rJXQdPBUqCg0EMTloAGM4fgGB4ldgNQsJ9u
         C96b7uK3bjiu2P8mwGLxb0QmVMKvNcw7IDLuwYTwPi7ceD+2Y7RBZpyJYAP2ulrpzhJ4
         51gg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzudl6AaMe6+M/pVlJGTttY8V7G3SBbJ1dI0p0kav6Q9Jaq4WbK
	OIqAC72ek1nMRocpLarJzEs=
X-Google-Smtp-Source: ACHHUZ7c0Ar3BYXLx5jAMWg92H8MDkS7GnTRyIVhWe1JYIk9RKjnFqnhxF9mr7Bsv5Rks+9eehUyZw==
X-Received: by 2002:a2e:8891:0:b0:2af:2908:8fde with SMTP id k17-20020a2e8891000000b002af29088fdemr458642lji.9.1684528845609;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:381b:0:b0:4f0:9517:7df7 with SMTP id f27-20020a19381b000000b004f095177df7ls768767lfa.0.-pod-prod-05-eu;
 Fri, 19 May 2023 13:40:43 -0700 (PDT)
X-Received: by 2002:ac2:46fc:0:b0:4f3:9a2c:589e with SMTP id q28-20020ac246fc000000b004f39a2c589emr1051121lfo.24.1684528843563;
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528843; cv=none;
        d=google.com; s=arc-20160816;
        b=VqJ/+7rWuORkqi63S/9vHc23Lnrk0EHysmTCk0NHd2w2jD+2pt9IdfGRiA2X6Ofgcl
         bUbx7ucOClddFQJ1pC3nYP8MXI9Oi4zBbVGQ2x823ctsg7bxM0IVOaD1z9ZtBZVO3Cw6
         OCSc2tw0xGHXa7cmq2oJIYyf6AkCJsuFlMdayNySZwiBFBNZTsL/ATxGJo+d38HPFOBu
         1QJLaRtpWpJf2VLkS9XvDdpIF1zmQmSiEHrxHdEdMqenZGlOnehSCWg0rnV5knh69yIX
         4EfHg2RQiKN7ASEnBC2tTughGws1JFRkPgRHupAdCSwhfbpZXwrfxcNqBTiz0hQEVnAs
         gREQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=GX7WPkuDQps9TEWFX9DWxu2jW2o+oKomb7e5p0we3t8=;
        b=iVS2XBJinF7KZQTU8F7quzDTmN/pyhF3GuJwNQcSMtqwh3FxuGPnKShP/J02htNg5y
         d8KA+QDnmPiCS3l2NNM4YLJHWDkAmeiDf40YT+BDOcpHElpunWC5/wjCvGUOjNHYjXPi
         Rk55PVcYs5jJI1aDFf43wIEpiAHmTNOJOfNyty3miOW2Ur6uI/IYT7wWuptmR9I+XFvZ
         NwShNkugHcWpL0elCxk3z1k7tXZ0GwP2H0tCWtRkFeF5MlQDy2Lzi0TYS0539jepOe3g
         pQqbdEqmce1E1ZyALbN+GawXQXDtPljNJiIiZz45kstNr48ZoeComg5DCHS7luUTTUFB
         sj1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s18-20020a056512315200b004f145238b58si11913lfi.4.2023.05.19.13.40.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdQ686Pzxr0;
	Fri, 19 May 2023 22:40:42 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 04/73] core: Clarify invocation context of arch_flush_cell_vcpu_caches
Date: Fri, 19 May 2023 22:39:24 +0200
Message-Id: <20230519204033.643200-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1400_1499 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NOT_1 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_PHRASE2 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This service only works for cells that are suspended. Add this to the
common function description. Also drop the redundant note from the ARM
implementation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c   | 1 -
 hypervisor/include/jailhouse/control.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 400490ae..44c66225 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -200,7 +200,6 @@ void arch_cell_destroy(struct cell *cell)
 	arm_paging_cell_destroy(cell);
 }
 
-/* Note: only supports synchronous flushing as triggered by config_commit! */
 void arch_flush_cell_vcpu_caches(struct cell *cell)
 {
 	unsigned int cpu;
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index e0c21270..9d1e74fa 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -228,6 +228,8 @@ int arch_unmap_memory_region(struct cell *cell,
  * got restricted, and the cell should keep running.
  * @param cell		Cell for which the caches should get flushed
  *
+ * @note Target cell must be suspended.
+ *
  * @see public_per_cpu::flush_vcpu_caches
  */
 void arch_flush_cell_vcpu_caches(struct cell *cell);
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-5-ralf.ramsauer%40oth-regensburg.de.
