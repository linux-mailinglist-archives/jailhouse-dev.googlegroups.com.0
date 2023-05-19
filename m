Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBTF5T6RQMGQELBDRQ2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B28470A0B7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:46 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id 38308e7fff4ca-2af222cc3a1sf7448051fa.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528846; cv=pass;
        d=google.com; s=arc-20160816;
        b=ew/UTZc8N2ckNw92BOU7Gz+Cd3GYqxehfeYX+YG0XARdQGMZt7+6OyN6bdwLtToWHt
         wyereIkuLWYD+74+U4NPNCoGN/ooQ+y3xKxcsA4h1fI/tezlP12032lUE+2Zl1boCfco
         rlQgmYqORLNFZCdtLx0U5yBFLLDq+jV1iYBwPb8NSi49iXhat1l9AU8EvjFZa9fB9Ks+
         BBvyvtVxPqkSAnYpOWxKDeWcZ9wcdPflsPtP3NO/a9z0S/yXVWZVmuIudTfotnuoUEIH
         F78h9UttMiBP3gAO+AAiDtfjFEdRuP2ExHBH5a8JTsYOoSxh8rhp574I09q98nySbLvl
         9Nzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=AaHRNwqzAD/G3psx9cQsKRSrmD9hShR0YAyvIkelhlk=;
        b=sLhdIBnrkgr8etriiDcETUmNcZik3nxZSMT2ggVgVyLGEe2DdTazar1mwda5gS2ZZp
         ljM1MbMe+vPzV37kJb/2K4P50JSAVEzk9c9LHRsz/H2c4nulY7e1XuSr3zO01mDVfjzP
         a/zytuTWxo1lY8R8rVPsNLO+59xVCNCqAaLR0icob9DhI9n1t2aw+NoGSfU/BQ6jiPQZ
         30Q7xztDrHPtvTmiiPg7kBDKUW/eQA9A1UG5XJjgxVkEXo62O3ad95fetpe310M9ZT/d
         aErwnCxrnM5cOdCVDXXndt7oiO2azwmo8Rgp4tOLTTWKII4nFJrmokC+iswO4cDNmAbq
         mlzw==
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
        bh=AaHRNwqzAD/G3psx9cQsKRSrmD9hShR0YAyvIkelhlk=;
        b=bduCwrKHFSfrSDkoDYHTrVDIP90s6IyzMDbou8wkHGD84CJ19aJpR+Y8g1JYZ9jOZP
         JUv1bhM77mSNeK3Lo8xb4ir00Y9+AENp/q8Qi+pFfjudiDQzf5GWhsTF4HlTcBBgsJ/i
         OqtTs0L6GDgzCE+t6J8BdX2FAkZZPkBv9s/ns66Z822rGpmTjO5xKj0HLPwOT1NQDxiD
         Ym26zlgbuG7iPZ0FCswKEvDkm0MCAIvz7SEtE8aMALT8HjkZLDglYGLGUX5slmHx0c/s
         00JNw39BaIlsM3DaofJBY4rEKS1rD5xpt3aWwD1MkyIPacGHoRntBm2kejbJw+ba1PdM
         Mb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528846; x=1687120846;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaHRNwqzAD/G3psx9cQsKRSrmD9hShR0YAyvIkelhlk=;
        b=cgkik8BFv+GGrWRzijN5ugPeiWnf8Z0NwFb/gyjICF2o/SRk1P/3dHk0bvGJnelF/s
         MWztMKyHp+1A7jRw+4QcGX7LIrASis5bny6PE6q5zpW4xTGURyJMeodn0AkjK8upa0dl
         sr9iRaRCMuSh68c641XeW/Ngt+bZFnp3ZcETWJxneOicZFA+ZjzEV/OOeR+NHPgexWHV
         g54NrhdBdqePm1VdMxD662JR2UorWT4iZ4PWUWTM3QxwUiuBc0f2nP/byq/ztFB5wAJ/
         79KYKQGI5HWAL/1x/m5GN40uCtXFpGtb75lTp0pOFVgzlPY3TDY3dLEZbuKJXJr3MLHf
         ZCPg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDyRiuFg3TsSamH27vt4YfP/6VmCImbti5WwTF+vjWvuWZy46L6/
	GdA9HXTqholXBNE7SsNrInE=
X-Google-Smtp-Source: ACHHUZ7EB0OO5LfRjh61kZfovsIRoIM6LTCUGUIrArFQGGwnMMIiM/1xFYNXN5Izv/Io0dS+kMlOJA==
X-Received: by 2002:a2e:b009:0:b0:2ac:7e97:6cbb with SMTP id y9-20020a2eb009000000b002ac7e976cbbmr774916ljk.10.1684528845272;
        Fri, 19 May 2023 13:40:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b888:0:b0:2ad:8fb9:f1b4 with SMTP id r8-20020a2eb888000000b002ad8fb9f1b4ls717765ljp.0.-pod-prod-07-eu;
 Fri, 19 May 2023 13:40:43 -0700 (PDT)
X-Received: by 2002:a2e:3503:0:b0:2ac:8402:2eca with SMTP id z3-20020a2e3503000000b002ac84022ecamr1184435ljz.28.1684528843354;
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528843; cv=none;
        d=google.com; s=arc-20160816;
        b=0NbkbScsGBI3WuoNXMXx+oi8iURIRuk4crtEVmczZiXYaY3zmr4q0TgeRxQwN3FIkz
         MI+k3SoM1Go3lId866Z1Zf8+Cck8v6oWUqsUDaCHsvNiLxr9QgIFqz2WIdlLcgqwZh+p
         xJo5T3alMdz5V7OVRkNuqcp313LYO2nfbhyHKkV2qSvwucp4ZdsMjhTal2f1EtdvzhB9
         9+iaTmKaHmdcGPeDHdD6Vdr1z1AARijq86/kcmnou+U0AEScGHd/6LvowinLL23coPWV
         8Gurm933n0XkK50Z8a0qgwVLbDFh8HmgoO0YAA3/Y394J3lwtBAJby2U3kV71HZP/hT7
         QiYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=hRNZr5eoOKuPjWqQ9iHs0nLsIdIVAMAykZAcDUwga+A=;
        b=xrxd0//1rbB9fKOtZv6x7U0Uy3WkhrO7HAmSrjYTE6IwOE3yYqH38Yb1GGv+Sx5RHR
         iC0ufVYpQ9UEUkzYCZE27Nh36S0vJMsTfwi5avXM89Uil3BCPjMPKfSelmpxIRryh3+e
         pnif9xn/pekhtjdIY5TiNxCIyoeKvh0dIqSdzwg54zRBod+wQCPyYaqCYg5VYwU+c/jM
         U0Jdvuw6eGR9bccZ0dhC+TcGand7ebHmzgCyWBRbyZW08AkUHj6WuOUPvaOdEvHrx34r
         yDZxkipkq9s39KqpgE7DWY1j0mt7t6WX0RO1LnlpBkiWh5UO8Gl5mOyYGnNITeADXWZy
         WnHw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id p5-20020a056512234500b004f175e991fasi8293lfu.13.2023.05.19.13.40.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdQ4lBvzxpn;
	Fri, 19 May 2023 22:40:42 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH v3 03/73] x86: Do not kick targets of vcpu cache flushes
Date: Fri, 19 May 2023 22:39:23 +0200
Message-Id: <20230519204033.643200-4-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_1099 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_NOT_1 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

All CPUs != current are supposed to be suspended when this function is
called. They will process the flush request when being resumed. So drop
the superfluous kick.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/control.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/x86/control.c b/hypervisor/arch/x86/control.c
index b46347cc..9a2c6680 100644
--- a/hypervisor/arch/x86/control.c
+++ b/hypervisor/arch/x86/control.c
@@ -72,13 +72,12 @@ void arch_flush_cell_vcpu_caches(struct cell *cell)
 {
 	unsigned int cpu;
 
-	for_each_cpu(cpu, cell->cpu_set)
-		if (cpu == this_cpu_id()) {
+	for_each_cpu(cpu, cell->cpu_set) {
+		if (cpu == this_cpu_id())
 			vcpu_tlb_flush();
-		} else {
+		else
 			public_per_cpu(cpu)->flush_vcpu_caches = true;
-			apic_send_nmi_ipi(public_per_cpu(cpu));
-		}
+	}
 }
 
 void arch_cell_destroy(struct cell *cell)
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-4-ralf.ramsauer%40oth-regensburg.de.
