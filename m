Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2F5T6RQMGQEPUSWG2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BBA70A0FB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:13 +0200 (CEST)
Received: by mail-lf1-x13b.google.com with SMTP id 2adb3069b0e04-4f13b1c06aasf2403697e87.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528873; cv=pass;
        d=google.com; s=arc-20160816;
        b=yAJM5jpir4onzvb+spoTUGyD4hTV5jRFXk+0ISEuk1CflD+7G5t/jDroUTvAm4ANb0
         W5sbW8OeniTczvjxD9X9obi6yqJuGVFGPeZfPFrE/eT9pKe85zMjAUSW5LZVP3FTEuU1
         nexoOWIvsh7jxHBi0Nlj1M+t4m/LnKzdmw7jDmJ/ERIIdC0lzWe5NDKdUc6czM6/FGrp
         Tljz84fHVqcWLnpjZ4GxrExkW95lp2JrgSvCQ5U5jIeMynIAP5J7mz/2u4z/fkZAym69
         7QyQ8e0X1JWFydlv1wunlS9aMRyrTH0/b023wbqtsDyztrA+xeGsBuEDvGnfG0xFh7lg
         AB6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=g0JuRg7XtxKwodlfteIWJPhSjX7hZNj1v2r40NIEN94=;
        b=e8o4E/fgXoELX7CYPn6twmcZEAnbxw+xsNFACyjvMC3+FzLEan1ZfNlsTVn+zORuAx
         UYvxE8gHq7kHascwWxFzAO5nRlE3k9rFvH0GgFAEFcu68SqPbaoofPcdS1o+c3idV1SA
         mnhmRmMA+NlZtGpGHZ7mK6sVZzTRm5C2qq25DFPD/FhfIVFWYYSuqf7jJnyRJSLgI3CX
         i4AmXh1jmUZ0wuBVWxronPOu/P84IzN13XzuQBGQWdXNtuLPyjZj/aFA9r3Wr8Gsf6iq
         4JgpSxvmUhJJXtthUL9GjYVv6GRfIUS6/J3GX8Pkmx//L62oT71axBuSPTsbq54f2zpw
         aQwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528873; x=1687120873;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0JuRg7XtxKwodlfteIWJPhSjX7hZNj1v2r40NIEN94=;
        b=Wcuqz6batdog7L7VckN3UbDE60eWYWooaxg9HjGAFp2uHBDxc0bBN2caUmCUSZS4ey
         ZsqetLZTZmBcxpXHhPiFvwsxlDhshUQCwD1NG37nz44zqAicLABW7L/98KFh/OCTfPcE
         oiytIZLfwCblv37BtpXv17I4AYMTuhvyvqfvhCcHhnQI48T3cFACuyYOktRYGOJhG3et
         j4C2VNC/VXmxwQ02a/Do1WsXjnoQv0/9U4BwW6l0mHs5FZ8ceh2u3DalCjiQkMSoSlDX
         LgkFS480Nh/OjeEHFHM6zOW+3esb1HxJpWEHET7o0L0mx4dFlkciqVTwfjpXzRkiFmV0
         FAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528873; x=1687120873;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0JuRg7XtxKwodlfteIWJPhSjX7hZNj1v2r40NIEN94=;
        b=ETDMD1jvlTw6NL3ItunyJOMx26K3/bTrvatt53zP4QdTqsKe2DZMSwOQk7pZIyvfs8
         2pPdSeakDrE/3zfx7jEyHMOCHE/L279FmpEJG3qDi4wMRSgZtHs/Xd2zrlnY2smm2LgS
         GRSPSJdd7RJ0XHOQUnqjvWbEos4zEsR4xkclpPSrMcMTEd2sPkyx63Sb+vwAKiNtSu5S
         /v0wpMh7wue9JrQLquFkRotqoWmn+4OlSQTjbo2BN+LW5yrFfyp19jYNiwk+5Rv986hf
         12LR+DluokUn456S4pH+Ztuyl3X17RPjecpzy3/wzm8RlUGznrV6oZQK182mnWzdZYVA
         rnpw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzVBjZQrYCNOIGbPBdKT/J4R1GFsSMe/w2sgFM2yhYYHoysltcH
	e5deIgJmVggog8oA1qBujqA=
X-Google-Smtp-Source: ACHHUZ72tMSiH+tn4o7u64wWiuZV7tj9lHknHEWu2Jz8ZYswEcYhliM5gGQCTpKou6oUKfuq1EoMkg==
X-Received: by 2002:ac2:4554:0:b0:4f3:a3e0:850b with SMTP id j20-20020ac24554000000b004f3a3e0850bmr856097lfm.10.1684528873134;
        Fri, 19 May 2023 13:41:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:3852:0:b0:4f0:9517:7df6 with SMTP id d18-20020a193852000000b004f095177df6ls1354213lfj.0.-pod-prod-06-eu;
 Fri, 19 May 2023 13:41:11 -0700 (PDT)
X-Received: by 2002:a2e:960f:0:b0:2af:e99:6e0 with SMTP id v15-20020a2e960f000000b002af0e9906e0mr1239889ljh.14.1684528871298;
        Fri, 19 May 2023 13:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528871; cv=none;
        d=google.com; s=arc-20160816;
        b=kizTTtuVZs/WPY7jGyEvlR9POo+lV5BN21MIce2ogddd4nYmRs9al6QUoyQ96QGapc
         O66s4dVWpDW/vArv1WVAZP9K+um60QQ4ahLA7HTxfBEYLab7XkeU8oaBEas7zkDK1Wz/
         Vy7wYmTPD4jKdqEdxxUdhjUSwtJmHbmHZHvL6evy1s/+AvoqFCHYhSLp55zqNYDNF37Y
         Yt7po7QY4uLTupBu/VTD4RQkITj4ekfGpGdz98+1QuqBaAOlfNiAqXbW0D4MHcFK5OeM
         CH44YWIthxi+TfaFDnJwlBexMviPk36BdFJsffV3t25hBW7sRU+fdmm0pCo4yCI3exsW
         O8SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=LRiVtiOirzdzH/Q+H0vYGK9bOhMZv0iiJB6YmpDFJXo=;
        b=fzdhTszi1npyAZHlZk7sM6BIAMWGJCasDEPLmB16k628h2Hnk65K6IGQAVossxyoRk
         wfefQkMfSqL4xAmWIBpIRxiHzSgSdggE2sdobRZ/uy6XLtu6VDRm3x3RVe1WEi206LMk
         Nl2Bmmct5sEY6Cf7jJd7jlPPBxXKjBC+ccqRnkOnrEK0A3XnlEBBhppPVO5Xwf7xMMKg
         yXGcE8x2YhHNqTxN8nakeI3zBWsLohM4UCW4BgVOYFfZqttHXsbvaDqiCsgCVmGXVyW3
         iTgDz/pF8umLZFZVR0/suRN0qs7Os6uzD7DDMHIry9O9PQeUhvoTdjXDlD3nVJLcjL4/
         WjAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id cf17-20020a056512281100b004f3792ca9b8si11625lfb.6.2023.05.19.13.41.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdy31D9zyP8;
	Fri, 19 May 2023 22:41:10 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 73/73] core: riscv: Add support for Zicboz extension
Date: Fri, 19 May 2023 22:40:33 +0200
Message-Id: <20230519204033.643200-74-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1300_1399 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
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

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/csr64.h | 1 +
 hypervisor/arch/riscv/setup.c             | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/csr64.h b/hypervisor/arch/riscv/include/asm/csr64.h
index 8651d0f1..a85d55c4 100644
--- a/hypervisor/arch/riscv/include/asm/csr64.h
+++ b/hypervisor/arch/riscv/include/asm/csr64.h
@@ -35,6 +35,7 @@
 #define CSR_HGEIE	0x607
 #define CSR_HENVCFG	0x60a
 #define ENVCFG_STCE	(_AC(1, ULL) << 63)
+#define ENVCFG_CBZE	(_AC(1, UL) << 7)
 #define CSR_HTVAL	0x643
 #define CSR_HIP		0x644
 #define CSR_HVIP	0x645
diff --git a/hypervisor/arch/riscv/setup.c b/hypervisor/arch/riscv/setup.c
index 32d5b4da..cf1dd69a 100644
--- a/hypervisor/arch/riscv/setup.c
+++ b/hypervisor/arch/riscv/setup.c
@@ -159,8 +159,8 @@ void __attribute__ ((noreturn)) arch_cpu_activate_vmm(void)
 	tmp = csr_read(sip);
 	csr_write(CSR_HVIP, tmp << VSIP_TO_HVIP_SHIFT); /* reinject pending */
 
-	/* try to enable SSTC extension, if available */
-	csr_write(CSR_HENVCFG, ENVCFG_STCE);
+	/* try to enable SSTC and Zicboz extension, if available */
+	csr_write(CSR_HENVCFG, ENVCFG_STCE | ENVCFG_CBZE);
 	/* STCE is WARL, check its presence */
 	has_sstc = !!(csr_read(CSR_HENVCFG) & ENVCFG_STCE);
 	/*
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-74-ralf.ramsauer%40oth-regensburg.de.
