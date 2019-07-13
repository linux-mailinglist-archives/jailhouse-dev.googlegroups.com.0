Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBIF5VDUQKGQEXID5EFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8433467B9E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 20:10:41 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id o20sf998120lfb.13
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563041441; cv=pass;
        d=google.com; s=arc-20160816;
        b=rN1BR/49eq3sIifDV9KAP6TCPloxs7JYsIh8JAmagqCkpFjmS0706MR1ILOPIwQvUT
         bOXMQi2ww93F/1uRK5p0HJqcL569cQ/CvBTi2CzzDQy2q2r2osvGD5oQEYEHw6aZ5wGO
         huoh9Oi3dLB3QFZcN03PuExPHbSHuchSLhNxwxt2iNcRTlylbZtV3zZdswUWJ9MiCcF+
         SNGbpkqxxj2r8BagKsxkYMw5twPSECUHbXf8nS+rj6scgcTrUGGoWY6U1/ex9vnVM1cu
         KcZFK3XPpK0za/boet739aPPDf3tCuYllmyzGMdprqFVfRa0pRkvXqY2akE208gdm47X
         hKcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Z5yyZtgKt3qaSVid99N5a+ZOUOuN0VTKZLCSG8POO7A=;
        b=jCiV5uRZtsVF1n1W6g7ngbu6W/xDE8k55PaXpg5EJezDNewnREs3x6IbaAGqT6yzXZ
         2zyvI3ulPfhM19Z9EV3ym/9MdbX1vZzIMfNgBp3Zhpea37RrTd9F8RXW2uA93s/9CN6F
         8p9lSgzN8uudNXk5p8BzmTFLPb1AZGYMGYFSlCeK9iaQZ2Sc3jgkPdwga2IbSHJ3u+6b
         NK+4v4e0UO1HUYaLlG0BhC9IrRQCha0bNJhkj5Ur7J2bBQZRPBcLOby7LchxQnlfPajq
         uEEuKPbTyxQeNvvxnctbq1X2fI6go19S5hVrx9G/leKmPz5n8b27xjF4eiLMn1Rz4nFZ
         GinA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z5yyZtgKt3qaSVid99N5a+ZOUOuN0VTKZLCSG8POO7A=;
        b=TauCo2NoOxyS1YC7+EQYd34lx0UwKZQw/px31Q3Ce21hKrhMSrFRQwO3e3GzvBpNNF
         xpi8YTtWj+41nzKC2phJgO7jYHBMWKpV5V6MWLg0m5vScvzd9uF/uaFCVxP9Xuf+Tws8
         rTyGSUEjHjiDXm6tOWhP6gwrgpTNEYgQzbevSd8sBtEPNKtPKMLTYLfhbu1KYCzkl+tV
         Cv7q9cll/n9BXw2RxQ6xpM/E5sMoo2TwuNyffTWa1LTmO5ssQaWOVfi2qMnCfM39cQ7z
         X5ok+1pZKeDvidkjk0SM9hpHQUn5XxpFoOKJNBP1N0VQB/VY9jyUsJAoiijXEanO9Cqj
         XVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Z5yyZtgKt3qaSVid99N5a+ZOUOuN0VTKZLCSG8POO7A=;
        b=V2VfyKjRI0tcfcTjOqKTOG2GYGX6SWSBTe1Clv5fEbjD4rtJnj84Zuw3iIEZEOoBn6
         qla63u8PwYTCKks+d/BLzzKtOvPT+Jvfw39qcv+tSbkvlvI9oNqlPrWYgh0DogHiAAN6
         B5ldsfDqyNlik0Ti2YN+1tgShQzx5TZ/FReyO2e9EA1kY5J23RdyO2Jg0UjimVjktpCA
         HpRPkCSO/m3ySl0j9NA26aIyrfo0qZYIGOkSIdTh4I8LdQdGqVufgV6fjt36RYUJv077
         yEQ8oTATsWIS6qgHz8yqIRIP6Tif/AiUx00qmTwQl3y1X8BU+/Rxqe6kegODOoFFBj1z
         vZjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVxRGcd42nveT6fFt9I3H6MMG5ntGuuW4U28uzawvNUIwZDZH+1
	EeVD0CC09gQ0XKrcIzhDlfg=
X-Google-Smtp-Source: APXvYqym0vmVttiyApQm7t6eiAb4hGHN1WeY969ZENDFWr4Q67UlCeRJyzBOG2rPkKkCDupMoA9KIg==
X-Received: by 2002:a05:651c:1b9:: with SMTP id c25mr9223307ljn.25.1563041441033;
        Sat, 13 Jul 2019 11:10:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9d0c:: with SMTP id t12ls1494190lji.12.gmail; Sat, 13
 Jul 2019 11:10:40 -0700 (PDT)
X-Received: by 2002:a2e:5b94:: with SMTP id m20mr9194962lje.7.1563041440385;
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563041440; cv=none;
        d=google.com; s=arc-20160816;
        b=ZpcyjsTHBSUuGMXwcHkAksSoJvS0u0L735pzOeCyBBESoVtsiL4kTJdmynK4K0KhjT
         3P72n7mu9Lajnm+FMSU64J9CM09ABF/fDoBea5kaVbsWOmmfnpK5nxfYKWB9eJjkId16
         ahqvoxRXlVAmEe/ZaZQQX/UdI3du0sGc70+d56IYSs45lIIebqw36xROP7ESYjzExUVb
         znkOGwDRKGyVSKtLZKv21z5lWEBDRdhoq8fooRSt/FajDxnjEJ10W4x+EvjbB4sMWf0L
         +6QSB3KYFMUfaY2xqqt2CTz8cNHr+FlTgUqW0+OB46l+Zyy313JnhZtbJIvknlb8bPTC
         LNTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=CZiSf9P3+fnBvdWqXN0iloZ2/qWljQuEYAjB3b/YI2I=;
        b=Uo4Bv0hiN3spmQtNvtefUWZQxMI/QUSQUuJwP2+9DUP0PrJGDrxGobxC6C1s6+YAXV
         IPx6b/Ib2ddU3q54m74OcKpv+sr/dT9C8rwmZrEHi4TStEMgGBpRR3KmVLjfYermELxq
         shfzCGKExF6yl/lKa5pLJfmE6mBxaQbxH4aoTascbhiGP0tq3dJ9vLw2gfanzrlphe0m
         eGWTLYERqIIChSAa9+ajCcCqMjIO/+4GWIDPgECe52/4vBmS47/OLCSR0hmof+hnHKDj
         B9GMuYiMXowmTcNV2ip5cZu80uiBsvTcAEpCwBRTNjhGGhQRt8JUZJ+HBDQKqq5+KhGo
         sWtA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [2001:638:a01:1096::10])
        by gmr-mx.google.com with ESMTPS id h13si445617lfm.4.2019.07.13.11.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 11:10:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::10 as permitted sender) client-ip=2001:638:a01:1096::10;
Received: from pluto.lfdr (im-mob-039.hs-regensburg.de [172.20.37.154])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 45mHsC1BXdzy2f;
	Sat, 13 Jul 2019 20:10:39 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 01/11] core: bitops: fix type of clear_bit
Date: Sat, 13 Jul 2019 20:10:27 +0200
Message-Id: <20190713181037.4358-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
References: <20190713181037.4358-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.3.3.2656215, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2019.7.13.180316, AntiVirus-Engine: 5.63.0, AntiVirus-Data: 2019.7.13.5630002
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1900_1999 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MSG_THREAD 0, MULTIPLE_REAL_RCPTS 0, NO_URI_HTTPS 0, REFERENCES 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __STOCK_PHRASE_7 0, __TO_MALFORMED_2 0, __TO_NAME 0, __TO_NAME_DIFF_FROM_ACC 0, __TO_REAL_NAMES 0, __URI_NO_WWW 0, __URI_NS '
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

I don't see a reason why nr should be unsigned for set_bit, but signed for
clear_bit. This probably got copy&pasted across architectures.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/arm/include/asm/bitops.h   | 2 +-
 hypervisor/arch/arm64/include/asm/bitops.h | 2 +-
 hypervisor/arch/x86/include/asm/bitops.h   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm/include/asm/bitops.h b/hypervisor/arch/arm/include/asm/bitops.h
index bf1bfdf9..34b1fe1b 100644
--- a/hypervisor/arch/arm/include/asm/bitops.h
+++ b/hypervisor/arch/arm/include/asm/bitops.h
@@ -31,7 +31,7 @@
 		      : "+Qo" (*(volatile unsigned long *)addr));
 
 static inline __attribute__((always_inline)) void
-clear_bit(int nr, volatile unsigned long *addr)
+clear_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	unsigned long ret, val;
 
diff --git a/hypervisor/arch/arm64/include/asm/bitops.h b/hypervisor/arch/arm64/include/asm/bitops.h
index aa211087..b7dd6204 100644
--- a/hypervisor/arch/arm64/include/asm/bitops.h
+++ b/hypervisor/arch/arm64/include/asm/bitops.h
@@ -26,7 +26,7 @@
 	} while (0)
 
 static inline __attribute__((always_inline)) void
-clear_bit(int nr, volatile unsigned long *addr)
+clear_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	u32 ret;
 	u64 tmp;
diff --git a/hypervisor/arch/x86/include/asm/bitops.h b/hypervisor/arch/x86/include/asm/bitops.h
index 2f88fb49..1f07db47 100644
--- a/hypervisor/arch/x86/include/asm/bitops.h
+++ b/hypervisor/arch/x86/include/asm/bitops.h
@@ -32,7 +32,7 @@
 #define CONST_MASK(nr)			(1 << ((nr) & 7))
 
 static inline __attribute__((always_inline)) void
-clear_bit(int nr, volatile unsigned long *addr)
+clear_bit(unsigned int nr, volatile unsigned long *addr)
 {
 	if (__builtin_constant_p(nr)) {
 		asm volatile("lock andb %1,%0"
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190713181037.4358-2-ralf.ramsauer%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
