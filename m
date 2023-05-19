Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBW55T6RQMGQELQJNKAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C6770A0E7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:00 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 5b1f17b1804b1-3f509037a45sf5801615e9.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528860; cv=pass;
        d=google.com; s=arc-20160816;
        b=x3zx1AskE0APixBsebtVfE+gKmL8ccFUS0ASAdEhQ1JjiG63qJzR1+HmcPZp89dVI/
         a/NlqVP9FslNv5SNbVu1rVR+87yjWrzrj59j1E/50TXA4hgcu7MZpDZ86pLMWRs0Rkqu
         eMS96UjMHMe5DV1mXApwmlP/DuA6tt91E3EEIMhgEZYIVtKK5145o2rNhf6FYw/XVXlK
         kEzN8lgTRKL2gA2oaeEy/rkgqZuBTHOs0vhvKk3MNoLAKPm8Ml18Oy4OHSPdmhopCcit
         rkB2Gcl/uRrpc2seR3/U8HzljAT5l8t5mMDkuUBEGBWSzGgwNIDO3mu7Iv8MB98IFSyI
         dpKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OlckW5+t5RRinJYytR8Q6OOh2+9/7QXrvTrSFswCe5A=;
        b=PZYBG7PnGLSp/SU5KsEK/McPLWmL0fO4pNJQ2Zf9Ljru0JaeBIM6sWiDkQEpoo0hWA
         l60mYQLDbqxbFQXLYCGcjW4XNmqerY9BdGmKEO2njB9luJIjT+vl8SqnZnTzsdZ9Xbz+
         PPgEFeK5+kR2e2UZMl/tKdFGm5qlHooob0LaORmKbLpCzi26JYdur/zc7H56zJcjCheX
         22aB4VUX/JNKEcJD5BLuBk70t6NspSd1KAg123dfCWi9zWW5vwrn3AakKBq8RM+J63JD
         PW5gt/JtYiTSCrBm/tAAohZIQwgJ9td47hvzKerp9ut5+cQ7dFgOvRKtIcAKHVG7SZIj
         CmEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528860; x=1687120860;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlckW5+t5RRinJYytR8Q6OOh2+9/7QXrvTrSFswCe5A=;
        b=bvquRopXfJt2PHnLCqdYxJ6d/Vr5OpTxSUEJUbfXsuxrR2HIEU4tIlGpgxiZWDtU/7
         6hYqk38WjIk+3pkJEuuTtMCYCsMmuDchAH5X/0n68xGp9KYS9spofxJMLzRNRGoOWZf1
         UAYPbc6ue06qPmFFOZKPWtHuOHDohoAmuBPiAkxdOE5wMOf+0r2CAODSQAWCmv0w1wVM
         xRE8E0a0VV70czOMbWFUq4p5lPxfYuw0WNzZuq3LhrxVu2GckRPLVDMblb/i1FfR6ms3
         pluRkz/paTFEIJKEJMmlzrTnmZmy7G86caHwE/FktdVGxu2oKkbA8kYBPwyM/gXsRESw
         GGBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528860; x=1687120860;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlckW5+t5RRinJYytR8Q6OOh2+9/7QXrvTrSFswCe5A=;
        b=CQZIboFOyeMq6JGzFpaXFuvsQt1dxYtoezuneGQKLt7VCGlVrhK47XFqDB23MAYz3x
         YU5I4hqfyqEsHBIMgG0hxg1I5pb0gvsarnWUwsnFm5JduXE+uyij3cGIlqOv3gTuQjA0
         ZruygFDCygxYw5YmaWimjoKW96RyUsv8fLvn384KhfAXI+2qMFfh4gUu+RzgStc9wezk
         Xbp0BHlkDrX1CTlkmKJZBsJ4D9fWS9T4JWU0PlXQj1NoBMlTNazW3gK/3Qnw3FNfq0O2
         Vr2qsRlPVIH3qVqbG9272DlDar21zES6Y+wpgCpt2XNZ2MyRG3tve4cYeL5TXEb117D3
         NMAw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxljtL3+lbnvJbsKnce7tUKSzEoFs8Dy2CohH7QVttn29RLvqyo
	kVKjOdPj800Amx/lYq2ES+E=
X-Google-Smtp-Source: ACHHUZ5+l1GvxHErDS/TSHDE5YG5E6R4jFepLHZ9P4VbPNpKs0RohmoiJ/grWrHphXfLPRmzBwC9ZA==
X-Received: by 2002:a05:6000:1e12:b0:309:3d62:97c7 with SMTP id bj18-20020a0560001e1200b003093d6297c7mr1595124wrb.6.1684528859895;
        Fri, 19 May 2023 13:40:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:3cf:b0:306:46b5:55a2 with SMTP id
 b15-20020a05600003cf00b0030646b555a2ls434807wrg.0.-pod-prod-00-eu; Fri, 19
 May 2023 13:40:58 -0700 (PDT)
X-Received: by 2002:a5d:4287:0:b0:309:7010:b869 with SMTP id k7-20020a5d4287000000b003097010b869mr642931wrq.8.1684528858134;
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528858; cv=none;
        d=google.com; s=arc-20160816;
        b=HZ9QIH5RdBivR4sEcOU/2Y5xgWWdS9NlO4vi4gnNLJY5wmN+/94JJxCGG+heK5EgGr
         2gTTMA3EyD8604t0Wp+jwElDT1HTCMKfGiRBYYH4ZbL20Dp067XC5H7slKsrFmyiaz/e
         IGjNdHKirFXjnG2lP8nqNNJHZSZEYZ/qONlOTRq8yKtAh1dk3KVLS4tVj1T0cBwBeL0G
         BFD8c1orU28hxJlRXU9SdgmeL78uaREnaaJNCNJQfyP7Izz8TIZ1EF9jEA5UcZcbLsPT
         fJbLXa2Rs/vqA5T5R6rey9YkjikzUYitqzyo50AxTxka6V3EI2HLMyXJSehn9qKbQ2Lz
         fLfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=DEHtPn1lxYHK+W/Q3IcI/hdB02UJEuhs7G8I61scdnY=;
        b=HyEVnvfL+aICRNXwOl80DTjDa7h/hevXs38qnmHo8bOwwtPhwkoVWX99LXEpEemzLh
         lHzZ1QNFObBdupsRvJ2Tbn0nVPQPgaHVczelf5UCy68zJGPE4Sgx6KnXbwg4v2N+Ntot
         A9PIpouQRq7jAX5wnVKVvHBr6myLUxxyO5rbvvZPV5yx0LmVUXl7lYr3eExPureai26c
         3ep9gzaYE42W4uyaXBQEe01Rk6JyGRUQbTR0DtItDPvUIR/rw5ZB6Y7/IvLSf52E7uFj
         l7QVJ2+GEWQOMzPQ+bievDQYIO+5UUwU0lGWn5oHpe8IgZ1E8yeR0Wg/lLM64AB2ahVj
         5BuA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id by3-20020a056000098300b00309385d6135si926wrb.1.2023.05.19.13.40.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdj5LgGzxrD;
	Fri, 19 May 2023 22:40:57 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 54/73] inmates: riscv: propagate hartid
Date: Fri, 19 May 2023 22:40:14 +0200
Message-Id: <20230519204033.643200-55-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1300_1399 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-55-ralf.ramsauer%40oth-regensburg.de.
