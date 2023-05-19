Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTN5T6RQMGQEVKK2JLA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id E059E70A0B8
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:46 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id 2adb3069b0e04-4f38f48be8bsf2402363e87.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528846; cv=pass;
        d=google.com; s=arc-20160816;
        b=gVbK2SNjIs7e9ktwQpd9Hof+6vtbxsxSR0it4t+akcVM23bqWbH3jagMqJsVfqy6KI
         1adUA/Z8VEsiI+KU66vb2YfLzpTlmPiFOXF9v54zdpuZIJ6p0VQstK31CkCOMFK8wJOo
         +vWf8uoiJ0Rmy7WiP9cFMmeJL/lUGzfuP+9acpir4bw4QmOkg+eCsLo4zsclBVV8DtfF
         kmN7Q/gUx9K+fIFntORuJHqr33u/37+B5E4ZbyzheKe4t9CDxmgCKknr2uhcJpdBeYP2
         sVRKKQBxVEkb2gE8/Sq23HFP2qffl7LMvqZPW5LzOY20dRrxYW4FOXjATfRGF2eTkBW9
         ZFlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=JOatHfAiWx8/6R7tfUYpZdWyZ8BvKswwy/HOmUz0fP8=;
        b=zibrFbMGVWuSArf7LvqNBAGiySr3Eg4cHU3wFFXjSwCtEEF5b0enZzz47JI63Fyf0M
         82Z++D8d5w674z17AFK+9b5Rv838QixrA9+yHhwuAocFhJTRQcXhA0a0kW6JYvtFTiED
         koKgPDzUPiUB0cUvLrB5fGWIgadjdkIDuOSP1fe+mXlxGTngS15tVfIARQkM+nUZPSPf
         sA2132RGTaY9aYQFyRLGyO8R5zYD1P175zjYWsvACeYPFDINZe/nCB+u/EIZU9GzQmht
         UHuDdSiT5dSx9a2m0vC5pgXe0n9CTlB+ozDL96Cuzv0CC+sruEegR9+s9o8yB8xteU4w
         AHIA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528846; x=1687120846;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JOatHfAiWx8/6R7tfUYpZdWyZ8BvKswwy/HOmUz0fP8=;
        b=Lf/zimZtANY+iz6bKxKDeB69nmCYeSln15v8nJQnw4OIrCJBqpN4VWmrWlOOKDZTFD
         +tqDFVzvBecDtM6VFNMG7RI/54skHvvh98R7tK1C287/newv6Y2N+u0+zz32GgSmXome
         vdXnOoK6gh6Pf3Nt4RCFZ4T6zlyezmzXszcdET4+Sf69dWIAVO3M8QmuLwRXm9Kz2OQa
         RWADGLjGtRm7oV0qLMFum4KN47WcaQOfi87lV7HVLki4HaWc0nKh+llP7+bNW3ZJs40D
         zsoZ1NFKMrqZKOIPSdIAvfA09OwjHXXpGHbL8GGxSLoRRGCKKktDoqT9LO0L6hZxoAwk
         zzMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528846; x=1687120846;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JOatHfAiWx8/6R7tfUYpZdWyZ8BvKswwy/HOmUz0fP8=;
        b=PLnVaR3ngnVCIVyu7ZIh/bHiUlxJv7fcZiXY7ozuEMCRhmP8NW18f2aRj0ysQlHBM1
         KfuyQ4aSj47mJbq1xU1/JYjvEGW8uMRjsrpTdKZ6G8RS/M5yLf38eDh7SofWNhr1FgV9
         DggYuh6bcPoG53MDcH8WUIEuCvN2DLx3ZIQzvFNNUaUtv9l3hHNVpkAPs2AKsMDi20P4
         7K7eWZQlfIBFYCV2gPYgRU0V6r58UnynvprVKxKW4M44sddT8RcnG8VLYnZl+wWPUHOJ
         vRgcIeAkPVRtjEHHVjbletcucgyurNOsfGfzO+ImgcvXJSVObdS9nfI02AXSwseINnBA
         oHTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyy8yNpS53w11ykfcBR+tPmCt2OLWCN9aca7jn/0K580m9vUiuj
	OFPunwr5P2YVf3x1vbPYzQY=
X-Google-Smtp-Source: ACHHUZ5UJJqeTLPDETRb1BIMlTmjbqp2PNDDhyjY5wfso16ucZzfEvIAUXhPWLdcyDTIJaxNv8/CTw==
X-Received: by 2002:ac2:5399:0:b0:4f3:ab20:8b5f with SMTP id g25-20020ac25399000000b004f3ab208b5fmr850236lfh.12.1684528846051;
        Fri, 19 May 2023 13:40:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1610:b0:2a7:6705:797 with SMTP id
 f16-20020a05651c161000b002a767050797ls301163ljq.1.-pod-prod-08-eu; Fri, 19
 May 2023 13:40:44 -0700 (PDT)
X-Received: by 2002:a19:7512:0:b0:4ee:d752:23c2 with SMTP id y18-20020a197512000000b004eed75223c2mr1029494lfe.15.1684528844122;
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528844; cv=none;
        d=google.com; s=arc-20160816;
        b=DpdDM94wxYp1DP7+AA6LFxH5bMLd0aYeZklzZiDv0tect61Lx698K35rC2cludTYez
         Ypz8IVLLAEoGaua+9OF8S6P40jtGwcqXC/IGuvL1KWfbNZvNJyHSmacs5EL6avfvjceV
         PqpMLeJd9XH0VR1I6tP3shyCwTvcF22BIsbS049Mk1CJ6xo8G5JCQPBgqhhAAbo8aOEK
         fOmfUYHcZmMZPFC+I3ccFdOtS8xXmmGfCv3A6+BbrRZwi7+QJPSpw1fUNoQV8Zif3U+q
         PxZoJujfCtRiWpmHXPOo3DaBHLrkFRWK3T2JkweX6XcFW9Ji7PCzFJspI3jwtKgag9ng
         /7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=h0tfKCP47Li6uBdO93ZPsp217FSQdZ7e9gegvML+pQ0=;
        b=t4x8VZKIpqMOWkog7xmOU388Vs34emPTgXQ374mr7tRsHE9CNNO9vxB/8eeWxqw825
         fUH1IyHasWU1NL2e5qbZBXEsYMXPSm+HXGz78siZE8enEBXV69k+m8z+GRUwnQ/NWdIi
         DusINAojqsnBYOfGcGnUjnHTWvfld8JTu/HpbypSiS4y/i1p6h/Rj2sXDYB4G8IthBfb
         DMksqtbuVNB+B7WoqGVuaCgtFsbsnUVWMQeXgj3aBlqCa66GFlw7+K/d9G7CiR7qBTqE
         8kP3DOZjwDr8/Ic6ZSrkLIq6Fv7ZgTwpw+1WvrMNlAbBAP2FBPcyGuIHcIwZKQwlOVHj
         MNhQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id b33-20020a05651c0b2100b002ac75541fd4si676ljr.0.2023.05.19.13.40.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdR34cPzxrD;
	Fri, 19 May 2023 22:40:43 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 06/73] arm64: Update unit link order comment and save a line
Date: Fri, 19 May 2023 22:39:26 +0200
Message-Id: <20230519204033.643200-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __FROM_DOMAIN_NOT_IN_BODY 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0,
 __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/Kbuild | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/Kbuild b/hypervisor/arch/arm64/Kbuild
index 59102226..fd56a4da 100644
--- a/hypervisor/arch/arm64/Kbuild
+++ b/hypervisor/arch/arm64/Kbuild
@@ -17,9 +17,8 @@ include $(src)/../arm-common/Kbuild
 always-y := lib.a
 
 # units initialization order as defined by linking order:
-# irqchip (common-objs-y), smmu-v3, ti-pvu, <generic units>
+# irqchip (common-objs-y), smmu-v3, ti-pvu, smmu, <generic units>
 
 lib-y := $(common-objs-y)
 lib-y += entry.o setup.o control.o mmio.o paging.o caches.o traps.o
-lib-y += iommu.o smmu-v3.o ti-pvu.o
-lib-y += smmu.o
+lib-y += iommu.o smmu-v3.o ti-pvu.o smmu.o
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-7-ralf.ramsauer%40oth-regensburg.de.
