Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBE5N2LTAKGQEIJWLEYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8F919418
	for <lists+jailhouse-dev@lfdr.de>; Thu,  9 May 2019 23:07:32 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id r5sf2405005edd.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 09 May 2019 14:07:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557436052; cv=pass;
        d=google.com; s=arc-20160816;
        b=lOw2FxyiTy0uMh5Q6GWxtbHXe0pD019f7t7074DUqoeqWNHHQyL4O6xXAaIsBFtwy8
         WI9I5iJ0pyiL6E5bQbUHACboPfjUdK81ZTvrliKDiul//Y9iRRW7SzTHA2xyWNtW+vL9
         5HsBF9Asf6hY11/yp9fQp+F1jejVclG54mKAE10yZtoGbRjRc+iaUI75E9/TMM5fkq/u
         PbvZcusl0/cz5AFNERzMbtCtV7dOJ3iOGw20ToMh87qM+hjGIN2aC68/sMd/yPEHBj7n
         yi0dnml/WWWsE/7zipNlfuY46TS2rG4h5FPzqZPrvgt1hltTHds8P+QNDnzDizz123J2
         gXEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yzhA7nhA72AjzDUEPpWq2fJJsbOTwrd+R+N6bfVUzpE=;
        b=cphTPZnXLs2YtvZt1KbQvWtHvrusRygBO3Yw8BF+nox8F7zHnoZlp3TsPqrX61/rIs
         LWBWE4T2wa4wBTe4DdwsE2KUs56g+Uv7CKnMFU2A8/GKzp2ZNGhGqL9rt0QlxeEhp3s3
         fIqmVAjvuSXHyyRQhUMEFglV5mehfxmyqKZZmBbMjgykebbQDUWA53vfgtEBQSQaSbbs
         h6CijA54rv3NT/yiJbL5Yb0TOVXoifQJQzLd9PB5qFEyL2hI7Xcv+iUtIJKC/dwEsi9p
         tEXFP5oSNqqOHzkNKEZVPr0rIzjvKkpKsd+v3+Oy7FWapqJAI6/lSGFvs+Xd12j2Jzbo
         /xEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yzhA7nhA72AjzDUEPpWq2fJJsbOTwrd+R+N6bfVUzpE=;
        b=hgHD8U0aYUiPXMzVKxMwMrALFfy1WsJrbiM5I/hIPYS+cunSyIDjhoudaIuVndgBTE
         k6dadT/s87ksPzpwTBQ8hubsIgUh4nF/BKuOyVceZm6jSImwhISYJEj2Sc4hLtihrtJ+
         t2D/edjtmJBmWpCIW1sd++2NTzoSxrepzlSCXqwQ4cwh0Xah5q4Hib0P61MM2uSp5FKK
         e1jtnGaK8koKmtcd6N7Ic1Z47FR32QWNx1E3ev8cpjtF8kkbNkFFUwYcZ50dUIjNWf7/
         mlEkXPPeHn//DsJk/x9UiZTDNrK09jO5LfbpmJhQ3x+tIeyOS+psCtCcHaena+IUGa6K
         wYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yzhA7nhA72AjzDUEPpWq2fJJsbOTwrd+R+N6bfVUzpE=;
        b=WvPXlKxvFckWGR3peYgSa+IQ8sUYmHwrnbGClmqPJ1rLf726+OjTaivkbNBq+tNVgX
         F/qdG1LrLPzM50EZdHQ73h95cQeKqzPj/dNrEoBjDDlEpeEeNG1bgPgjCAvHnH2xtTtC
         PkhSKvtedfNxwHJkRP0z7eKvlTOWqFxCA2aPUPtOGUhIfLhlelaEAAXNJI2SIOO1kana
         BOGhDdkhBycBvw3yFKlw9WZiv1kg2xdiyb0J/I6eP6BFq4QdXRzwuwJiLgE5dV9nhRMR
         GrO7keIZY0DBmVdUX1YZ+8LEJYPY/JSqxEPSkQbhYGpZet/x9NaqUHBv+DH3vcOOlUZb
         rPgQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXnsGcfogGNQNIczW009NHGThbDHkVr7u99VysXt5Sd0xB7Zvlh
	Sjamp3oainfTFcMo9plQqNk=
X-Google-Smtp-Source: APXvYqy9EOh5TZvz9RewhZxiPqMCsYsjbEIAmBK9jR7OETH0FqmWotPa8u6xkhBY1YF+3sLavWLTng==
X-Received: by 2002:a50:add7:: with SMTP id b23mr6422722edd.215.1557436051971;
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:b7b9:: with SMTP id h54ls1101328ede.14.gmail; Thu, 09
 May 2019 14:07:31 -0700 (PDT)
X-Received: by 2002:a50:947c:: with SMTP id q57mr6742273eda.81.1557436051467;
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557436051; cv=none;
        d=google.com; s=arc-20160816;
        b=CBMqsEg3ZBoIePhir0kugEN3mLjKIvNiBbDmm0w670kFnq9E2jLfJw2psJJ7BrWbTZ
         eq16HikwgxqIAuh4KM0pfmNR8Y9Y5jK3eokhs5CUMyOIwFD6hcZdNwu4mbvqsUSzzw5j
         i5nOJdoM+rku49wG9ZgnVHddmRHQk3RaLF9vQYBh2sFEFDNMdqIcUthW/Oip6oKgZ/iq
         S9vUIhCWVq2Wrsp44C3duyIs/8maVg1SL6ztL4vMb3xVxDEICMPaZ4KCPjtHQKsGN7AV
         XJO+9v/2stACBYaphXzYKdnI7Xn5hrHL/cEYbsgpmARMsHVVAWBVToTmFqii/X/jdgf3
         1ZPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=iLQKruD1bNgW7NEkUuj4GcZ5FGQpVmKGLIJIyNJ6zNc=;
        b=XN4GowX62VSAV7UGmqXoi1OxUEnSQSWgUiQOXpIJmbzUrXc0BDd+2koYTDMu2J+Bqa
         c6iWdcBl7pzkQNpx5O7TWybedoMl77iuFDBJWCb9OdSH/VDeg/aF0xP2Jnl3vWsf9sfj
         OecTTd1x1rIcajr/sNayJSfPbDrFU7tgFo3tH61RKNVhIm/CmvC2KuOk8IGj+jhrLgd8
         h71Y46fMEW+TPIhrBeC2XuqkNRSqXFgOR0XN/hbXj//IV2CGDapm2gCWlzXs6k1hd3nf
         CDPY+Ba+Wi0OTtJknU6EfPw5cowPsUKQW5qBncvJDdn9LHtGxzHXhulGlt0KBEqKDyh6
         u0Vw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id s3si409757ejq.0.2019.05.09.14.07.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 May 2019 14:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (unknown [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 450QsG718qzyB7;
	Thu,  9 May 2019 23:07:30 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [RFC PATCH 4/4] inmates: x86: activate SSE
Date: Thu,  9 May 2019 23:07:26 +0200
Message-Id: <20190509210726.23168-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
References: <20190509210726.23168-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.5.9.210016, AntiVirus-Engine: 5.60.1, AntiVirus-Data: 2019.5.9.5601002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_2000_2999 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, __ANY_URI 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __OEM_PRICE 0, __PHISH_SPEAR_SUBJ_PREDICATE 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __SUBJ_ALPHA_END 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0,
 __URI_NO_WWW 0, __URI_NS '
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

Recent gcc versions emit SSE instructions for 32-bit inmates (e.g., in
hex2str or cmdline_parse routines). Inmates aren't able to execute those
instructions as SSE is not enabled and will crash.

Enabling SSE is the same code for 32 and 64 bit x86 and straight
forward: Lookup SSE availability via cpuid and enable OSFXSR in cr4. If
SSE is not available, stop the inmate.

As we have a common 32/64 bit infrastructure in place, and we need to
enable SSE on every CPU of a cell, simply place it there.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 inmates/lib/x86/header-32.S        |  2 +-
 inmates/lib/x86/header-64.S        |  2 +-
 inmates/lib/x86/header-common.S    | 12 ++++++++++++
 inmates/lib/x86/include/asm/regs.h |  4 ++++
 4 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/inmates/lib/x86/header-32.S b/inmates/lib/x86/header-32.S
index d789e5f5..f5fa258a 100644
--- a/inmates/lib/x86/header-32.S
+++ b/inmates/lib/x86/header-32.S
@@ -74,7 +74,7 @@ x86_start:
 	cmp $SMP_MAX_CPUS,%edi
 	jae stop
 
-	mov $0x01,%eax
+	mov $X86_CPUID_FEATURES, %eax
 	cpuid
 	shr $24,%ebx
 	mov %bl,smp_cpu_ids(%edi)
diff --git a/inmates/lib/x86/header-64.S b/inmates/lib/x86/header-64.S
index 2ccbd169..775cf6d6 100644
--- a/inmates/lib/x86/header-64.S
+++ b/inmates/lib/x86/header-64.S
@@ -78,7 +78,7 @@ start64:
 	cmp $SMP_MAX_CPUS,%edi
 	jae stop
 
-	mov $0x01,%eax
+	mov $X86_CPUID_FEATURES, %eax
 	cpuid
 	shr $24,%ebx
 	mov %bl,smp_cpu_ids(%edi)
diff --git a/inmates/lib/x86/header-common.S b/inmates/lib/x86/header-common.S
index ffede16c..afc01104 100644
--- a/inmates/lib/x86/header-common.S
+++ b/inmates/lib/x86/header-common.S
@@ -54,6 +54,18 @@ __reset_entry:
 
 	.code32
 start32:
+	mov $X86_CPUID_FEATURES, %eax
+	cpuid
+
+	/* Check availability of SSE instructions */
+	test $X86_FEATURE_FXSR, %edx
+	jz stop
+
+	/* Activate SSE instructions */
+	mov %cr4, %eax
+	or $X86_CR4_OSFXSR, %eax
+	mov %eax, %cr4
+
 	jmp x86_start
 
 	.section ".boot", "ax"
diff --git a/inmates/lib/x86/include/asm/regs.h b/inmates/lib/x86/include/asm/regs.h
index a004fdd2..f6fb4d85 100644
--- a/inmates/lib/x86/include/asm/regs.h
+++ b/inmates/lib/x86/include/asm/regs.h
@@ -42,9 +42,13 @@
 
 #define X86_CR4_PAE		0x00000020
 #define X86_CR4_PSE		0x00000010
+#define X86_CR4_OSFXSR		0x00000200
 
 #define MSR_EFER		0xc0000080
 #define EFER_LME		0x00000100
 
+#define X86_CPUID_FEATURES	0x00000001 /* Processor Info and Feature Bits */
+#define X86_FEATURE_FXSR        (1 << 24) /* FXSAVE/FXRSTOR, CR4.OSFXSR */
+
 #define MSR_MTRR_DEF_TYPE	0x000002ff
 #define MTRR_ENABLE		0x00000800
-- 
2.21.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190509210726.23168-5-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
