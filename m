Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTV5T6RQMGQEO6BQK2Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C0F0570A0BB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:47 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id 5b1f17b1804b1-3f422150893sf22909315e9.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528847; cv=pass;
        d=google.com; s=arc-20160816;
        b=zExyBaZ5m7cTjYSDhMXQzUSWa461CxFYgCRZI4IdibCidHN2C3IHxB5ZAa6L2IpRpI
         lmIPSeHzITEpTP2p6mLqZ6GMOMxPKlOk11V47DzRMFjSr6CVSxaA1tpXvuH9lLj2kRvV
         Xrpx0435b7i7meAK3Hl4RK9/6TJ+jZQObO9UdU8AZkNfgPyVwwmJcwsVal+5rEQaKdwe
         UJFs7190DKEfPYs5U8AtAF3Zt+rLD/+7U9yqzVszD7lRAENDIZljU6h3Gh3z8HhJYBsW
         KFoPC2ZxOFfhyHnIOUVZ2afRGt3lKLcxjTRNvO7xk2gY7dLaYalblYOCS7zk5hNT0jjB
         on2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=xV23O3lzz1XWPjVhcXCkPLL6S6i8rU1Goy3QMCCLf0o=;
        b=P3qgGbkw5ty8Zcs5Kjow3cw5nb/JG093CtyHNFM5DYBQ7Hcdx2x6QVVR/wmMI2Noe3
         Y94n+LavDVsbd1vKQJZO/6KBpA/aRzAbHP/M0NcSm1Ybpuf531G6U8bMyXNGANiyqWUm
         1jHnxzyzc9eXpzzS2lTgtWs0KvwNfj/Kc5Y4syaf1gNu+t+W2asengVo37s/09y3mnV2
         oI+lCeLC53zB/nZ9SG4LClnIxkBGzQXP+z9+2M9Q25iKzYud8oqyZMxFScJRg/216QtE
         WVj0VdG1TSN2WUp9gBm5LvxEFoXrjOagGUOaeG9GG6d2AoK17KHHl3c24DzjevmnNdRa
         JlVA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xV23O3lzz1XWPjVhcXCkPLL6S6i8rU1Goy3QMCCLf0o=;
        b=GLrvQq56i9gy1N0+5sgEFV+xMy/yYbUEhiXdYOZ0rBO5E6gWbjdOn/I8IS+SSqi3Vk
         LSyU8W7N7/KKP5lkDROnMfcUEmXIIbSFZeMqLkSeruY1Zh8XnH5VORldlDdo3jOZjLdK
         kfSV7wg0vDINyG3TUucBuDzj5Ukjiqmn2kahcc7nX9KK9Q3NkTyO6YnY4Mzcm3Imn90h
         I/rPhL1vjeMZ/W3Tsig8v1c+iRSwYmzj+zMaaLNFAwDr0zrxgT38fDQdxpsKNN7gonyU
         N+nWdiIl1nuWI8wKlwXDYC5N1ez9p4GCBCCAXNCosCJAZDSexYP2xqpVdIAivHn8hOJR
         fSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528847; x=1687120847;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xV23O3lzz1XWPjVhcXCkPLL6S6i8rU1Goy3QMCCLf0o=;
        b=Pk4jhyv4TY7RwUGyD9d8mXPNW0ntGhWY69kuora14kfsWZBbOdTikUOGXJdpDYanld
         9+cZpqQs/Aw2aR8uLQ0a5OdfXU3DJAgbm0gesXYn+YFi2gNjBMcK3Y2xKxn8uan1/NgK
         O21CHKi0H6i7+dJ7rjp8uOG3JBcyoKviTc+tXefDFhVtXYVCkP9zj4g64bC149zlDJ9p
         cuHLx90pIGrh8rbKh7KbDBlRkqMHPnkGjR04urhqehTvthH1U685QdRSSsODiUd3Ar+5
         dhmcZS/II9UveM/olQhf7jPbqujtrxQbB6wWzZjwGu/0dHzTi9ofuk3mFB02mk8Zzbnp
         Q7OA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDwO+0xzN3TmFSIcR2Y9Szx+OoHuABRzbOVTMywhJfXUYW3CPyrE
	kLgtFyD9bKAC5fkcRniJsB0=
X-Google-Smtp-Source: ACHHUZ4FUcxpR2WyjDv0zkR7T4ozZO/72Kb1DdTo6VY5pk+wltHEGYqgSiLNgokvEDN+mKt5wwI56A==
X-Received: by 2002:a7b:c4d8:0:b0:3f1:75bf:7778 with SMTP id g24-20020a7bc4d8000000b003f175bf7778mr544830wmk.8.1684528847186;
        Fri, 19 May 2023 13:40:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:602:b0:306:46b5:559e with SMTP id
 bn2-20020a056000060200b0030646b5559els1340843wrb.0.-pod-prod-05-eu; Fri, 19
 May 2023 13:40:45 -0700 (PDT)
X-Received: by 2002:adf:efd0:0:b0:2f5:3dfd:f4d2 with SMTP id i16-20020adfefd0000000b002f53dfdf4d2mr2659603wrp.64.1684528845331;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528845; cv=none;
        d=google.com; s=arc-20160816;
        b=N73w5YbOpXk6H/BTF8HU1Ro/xisGHU0i2eBHtDFJJUYkuFPL59dzRUtFzdrIkIGU+G
         X6Gq2N63kw9XgGZ1VZmoy3NjXehC0ExFaNxg2iagZbecKsdwQTJuO1al6V/vnpEV2aCe
         rl3d0wtezDWb9ylHHdCU0VUGs0Xz9dyTUHN4SmbpJwz749sY1whJAjtngCUcBGZDW7zo
         bwR1Ex5aT76t74aMxeQu9TWXf3IFaN97IcqFYT0p591vEnoHxvu+dJysl4LIO2iEM3OX
         fqdHteYPCl9pOqzTmlZukiQPk6ZUinD3JHY5ssyALvf0fPlwzdbf1uADWz3nRgHSPVpq
         BASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=zJO97fiEwH54so/WBjhuuMkXCAS3/hOD0FYVrs8+hog=;
        b=hdk1ULT1hYcMpFiw/pIy6IbPCUesi71W1nyTR/IqE+Qo8FxZ+kI+fPE966tU2q3733
         B3QZEmlJaRUBygHEqngZpjVqQH/uDz/B8CjaMJ+qh/bHj6GQkfp2PQt9EnOWzjQ8mSVL
         vUgOGywJPb1ZwEqKARfJ6UQkhHllmEO3epwMPgdXvyCRgTnUbAekzLttAWlKEYVMNmrc
         mDoIaoK9myDRml+TUZqKtzRd1SBr7o3sxz1M+8Pr4OfDjwhGTkFHTWxGfiJWyDxgyzSQ
         a8FQ1L20KLdgO33Z5x3Gz9dIAUlaoM5wNi9d5OCNs/j4WlI6a0wMUE0Uu0TJhxGWLJLi
         qZEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id bq7-20020a5d5a07000000b0030933d3af7bsi397792wrb.8.2023.05.19.13.40.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdS6yytzxr0;
	Fri, 19 May 2023 22:40:44 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 11/73] core: Move cell_init() of root cell from init_early to init_late
Date: Fri, 19 May 2023 22:39:31 +0200
Message-Id: <20230519204033.643200-12-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

This is possible because no one needs the initialization results of
cell_init() early. These results are more precisely the cpu_set bitmap
and the mmio subsystem setup for the root cell. At the a same time,
cell_init() will later on benefit from having all CPUs initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/setup.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hypervisor/setup.c b/hypervisor/setup.c
index 91f1ae1a..7f7cf041 100644
--- a/hypervisor/setup.c
+++ b/hypervisor/setup.c
@@ -59,10 +59,6 @@ static void init_early(unsigned int cpu_id)
 
 	root_cell.config = &system_config->root_cell;
 
-	error = cell_init(&root_cell);
-	if (error)
-		return;
-
 	error = arch_init_early();
 	if (error)
 		return;
@@ -168,6 +164,10 @@ static void init_late(void)
 	const struct jailhouse_memory *mem;
 	struct unit *unit;
 
+	error = cell_init(&root_cell);
+	if (error)
+		return;
+
 	for_each_cpu(cpu, &root_cell.cpu_set)
 		expected_cpus++;
 	if (hypervisor_header.online_cpus != expected_cpus) {
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-12-ralf.ramsauer%40oth-regensburg.de.
