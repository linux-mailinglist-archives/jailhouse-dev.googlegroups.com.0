Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB2EGRGPQMGQE4IQAOJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EDA68D690
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:17 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id p36-20020a056402502400b004aab6614de9sf3362133eda.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:17 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772777; cv=pass;
        d=google.com; s=arc-20160816;
        b=frm0LnLIuAGdx5LCD5vg5rFe9LEozQ/Ig5HZ5m6diRc0ShwhGu/KLDr1VC07mHG7P+
         HF3IPPczgGs6HazFwSObX736BSDzw9lY0RPDK7NPxT2XVWSny1itxeDg7v2QgCoJ93pz
         /G3spD1j82DS60qPqD/sM3FZuIaYHxmTTctxgxGicx6i8PmeUaowyM+w8RwCuOEwf91I
         Nf+UEwz7AQadw395yhm/h4YH/F/ZPn6fU/4+BQnoFlm6IkiNZn3HewJTyS6JdX8agVdt
         Frqo3ADniWjUYc+nY9LPME6S/AsDSRilnXV8r9TcFbsh8inWZtUuvwMf4C1xxfoZhb4z
         eaPg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=NABRFHY/5NaRS6NSgKYo35KUl0Yrul8+bQB6b2KQ1So=;
        b=Alf6PXpNUw06EzIN/rOiI+GjUDenT6Id+GVkuoZiE46UjQ0e+kUsdjbYuLPTiuvI/n
         MM5nAWKMm27MXtTT17K4BRPMVqzBBW5N9TB/8E+Y/ZHb+V5vdYUjafRUN84d/tTOfZ7T
         pKY2AQ8RUX3YXjZlDCPlsBRPPR5l6l58pfqKVWMzrATR9zoqrurK2/eOKEQRYiwL6ngY
         y0T+sHD6fRH1B2doLSln1+yD/zrbbsS1L6Bh/0MhpzDQt4RxCt9LjSMWcMfjifwqwfYL
         Qt/z/1c/5y2J3dMv+IOszBXpVBRu8GN2Bt11gyO6iH4en0wi/cDKC8OntwF+UExzLdBL
         w85Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NABRFHY/5NaRS6NSgKYo35KUl0Yrul8+bQB6b2KQ1So=;
        b=Co0klQPlks08CzEqzPpda95y14Uaxwn0FzLInynl06BYKpqWNpPUolzDH0YaXEDVpX
         TzwHsuFjRmbUCbGdk/C18tiw1Ag1ATwJbnxjJmqvC+JMsGuiE/ttQiJsUNGKOxikpktg
         d196GI8hWX9RikYkq0x6SLPUuhPrL3qym+Q9VdU66S5eVrjqCzcnGBoeTnKdXXxXCRD8
         rlIeBRZwc++n+3j4OCpgqZbnJ2QYYlzuM3Fp0D2BGa91AMHFTLQ8FvaR685QFRYyrMqf
         jm1tjTRkq9sU3ie4hzPlxe33IjpXttvkH/artedoFIQyI+IXF93Mh8Kggqcc41XdOS35
         AlvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NABRFHY/5NaRS6NSgKYo35KUl0Yrul8+bQB6b2KQ1So=;
        b=75dBVWHYJObtKqx8B1I9e3LTfI1WQZYz4Wgz7T+RVvUASJm2H+ReQazvUgKRmgcnPO
         cBSjHl3lOV2NOJfcrCIiTC1Lk9msHQ4Sxw6LFN7yPo1LpX8Sf8MztrHbKXqb7nBMUAj8
         PoVghyqCCp8pFJU5QZEDhXz9XFrTi+AQd79i8/Lj/DV6HlCQt+clY8ewqqfdpX1AP017
         LnIgRh0QgRMvVLEb1TlCpF3AAU6xULhWdbOPY1kjTMva27Pl/YI7rQpFCwoBkYZJD+s5
         SUW1fu5zWqfb62YmkrReFe0zQsJNPCXJTCZ3CXyicdNxwmXkMnunV02+0ZkhiAnl7wkV
         O6vw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWzCiwlRmoPROoHuc2JaHZNNkVGOdfEp3TXB4d7sBbWuDStZgW9
	GtI/GfhIYcJZOQoSohTm8Us=
X-Google-Smtp-Source: AK7set+PwincFNwbTGO+Q7TGD4PK5mNfU6jImQPpohzVUlnbfF3e9dXWVIxZG2lHES9EY37EdAPw8A==
X-Received: by 2002:a50:9e6e:0:b0:49c:b721:142c with SMTP id z101-20020a509e6e000000b0049cb721142cmr601712ede.1.1675772777130;
        Tue, 07 Feb 2023 04:26:17 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1755:b0:4aa:a500:fd39 with SMTP id
 v21-20020a056402175500b004aaa500fd39ls7477087edx.0.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:15 -0800 (PST)
X-Received: by 2002:a50:cd9b:0:b0:499:1ed2:645d with SMTP id p27-20020a50cd9b000000b004991ed2645dmr3891656edi.17.1675772775548;
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772775; cv=none;
        d=google.com; s=arc-20160816;
        b=AATEpEn2C3lC4Uh195luMrLf86P2hnuydBrhJrZ873bCD4g3y9Q7kecKLMDvF2w5Qk
         kaju8e1aGzjKpzaORXYlIIAZlIAlBuUramC+BUI+MVWmJgEFA8km0c8dL40e0MOxuR8X
         U87g0qB9CbuqzmOmYHoWkOtP7CatAIJ54MgWhlqTueEagCqqjAmTq5vs1JGv7HXflhi2
         fm/g8m9P4rNRlTXc6hM/Jzu39mlcPdmFbs7B00BgCcliHw1iG54GsshjwALFNFjOcOAt
         Z0DkxpsYE6aMDlwsBT6ntDHMhagbkyKgyv9UolsHbbhfnZyIfJy4itK6EAz7XvcsJyOY
         8y4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=+RteP0XK7CEafyfWJXQa0Z5s0xTdx8SAUs1kM/jreN8=;
        b=FJGuavS/2v36ZBZBT/voRCYCN2Eh8k3bfjtjk7PhQjkJmcWLN8NwczmnMe/MmXYE3z
         Mn+O84Os3spVYlgQN63tal+H9fa1qLT5XR8sc0khZHrXG8voB0kJdQ3ddkiYdWyw2t9C
         EKOMmmYJiWaUCmazHqEq0UCTtFUYX8te89ssRkPPqtFvgerp6jVYx/2K5HcSzKgDpKFb
         O8bgRSGtTAAYePHQyoNADL3wQKlHLyO2PP2FvGxi5wHjfqac7DNxUoCkvUuAKicthBOy
         jiB4fW2uTAJ7HGERVkGgl3nbR4BFZ6xjWvWBupsk/JHYTeBiuG5r1IeEaxEi/xWZePQq
         5LkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id fd23-20020a056402389700b0046920d68fe2si568912edb.4.2023.02.07.04.26.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:15 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RW0Rnqzy6b;
	Tue,  7 Feb 2023 13:26:15 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 35/47] inmates: riscv: propagate hartid
Date: Tue,  7 Feb 2023 13:25:31 +0100
Message-Id: <20230207122543.1128638-36-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1300_1399 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0,
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

We will need the hartid for the linux-loader later.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/riscv/header.S         | 3 +++
 inmates/lib/riscv/include/inmate.h | 2 ++
 inmates/lib/riscv/setup.c          | 2 ++
 3 files changed, 7 insertions(+)

diff --git a/inmates/lib/riscv/header.S b/inmates/lib/riscv/header.S
index 5ddffe79..e4b21ce5 100644
--- a/inmates/lib/riscv/header.S
+++ b/inmates/lib/riscv/header.S
@@ -58,6 +58,9 @@ __reset_entry:
 	la	a5, exception_handler
 	csrw	stvec, a5
 
+	la	a5, hart_id
+	sd	a0, 0(a5)
+
 	j	c_entry
 
 .text
diff --git a/inmates/lib/riscv/include/inmate.h b/inmates/lib/riscv/include/inmate.h
index 57338d25..468d2218 100644
--- a/inmates/lib/riscv/include/inmate.h
+++ b/inmates/lib/riscv/include/inmate.h
@@ -58,6 +58,8 @@ typedef unsigned int u32;
 typedef signed long long s64;
 typedef unsigned long long u64;
 
+extern unsigned long hart_id;
+
 #define SR_SIE	0x00000002UL
 
 #define IRQ_S_TIMER	5
diff --git a/inmates/lib/riscv/setup.c b/inmates/lib/riscv/setup.c
index 705c5630..a87e8c50 100644
--- a/inmates/lib/riscv/setup.c
+++ b/inmates/lib/riscv/setup.c
@@ -38,6 +38,8 @@
 
 #include <inmate.h>
 
+unsigned long hart_id;
+
 void arch_init_early(void)
 {
 }
-- 
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-36-ralf.ramsauer%40oth-regensburg.de.
