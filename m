Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAM5W2PAMGQE4HZH37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63e.google.com (mail-ej1-x63e.google.com [IPv6:2a00:1450:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id B123A6771DD
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-ej1-x63e.google.com with SMTP id nd38-20020a17090762a600b00871ff52c6b5sf6396106ejc.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=DjaT2ys57rroOaEbcSMe4VwoltC3Bp9rtgTwc9tFhKWTMmNYff0FC1egUugKcthfPO
         wrG/dI1ipwukuyljMOsm4eeTMiUQCKqkP4EQcuYE++q3UU+j2Cckj0EssfQVenwACPtQ
         aW+8XI1WO3/95wkGBjh5NlWbbIkbTfFJiFtTKwphk9RxjBs6726T7pUP9MXsUT/0TNA7
         BQsHlhpQixpAoAZ1TKxoUU1EcqXu9Npm5TfMniYrcaqQ1Evn3pS3T5FftX2dUebPELbK
         DDsTY3pTL/AE1Zq5PYtUOo3UzVPQS2/2z+on5ntuUOBg6M8ZlmzpKoallbienXT3lhgs
         cIjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=ycpxXoThM8c9YtpNGBvW6Q+OFyvC8IeTmx8z5NpUtO8=;
        b=Vl/JvaZ392eJOc7brPloDJfAp7qwuJoXyyxZayT3kxrZglW7LNeR+Sqo5ZPMI+NcY+
         nMeVPw78qvgOju72DjeIqGg2hnrCC+9kL1PcPw14iz0i+UjgmsI6KJBCd5vWaNpj0o8R
         Ioea5pMiqRs7KSN5FfpBCGU2OoLdwOWS7BTiMSKgVbiWUcnc+fLo6T6eCRsKwv8ZdWWT
         4aeMzeLYKBmQyokZB/WBUQmCVyVqsvmECnWhDRdu/gTBWevNp+c42ZPTFg73iHA3PZvB
         Zl5YEcv4iaTUQZ3DKCLP/mZJg8tSgDU1Zc034bpusAw/+hzCLpCM9gNXbVEqAJKYiCmS
         nM1g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=bYEbEIWK;
       spf=pass (google.com: domain of fm-294854-202301221929048bfeb2036c994bb713-rgh1fk@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929048bfeb2036c994bb713-rgh1FK@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycpxXoThM8c9YtpNGBvW6Q+OFyvC8IeTmx8z5NpUtO8=;
        b=Mxrfqec+EvQdogfuPHSLHsB0K5VVwcFJOzGy3u30X81cExJz/gZwuMRlWPdF99Y3JF
         rFb4ZP9eRgaozuToOj2wCancf3heAHpAfNzm389X3wACgh43JkXdkr7nBQjqTtr2M5am
         bI0/d2dSK6YzKPa/+JlU06HUSETLRxc+YXnLf2HQP4dyT1XVSd5CmOcfSXQQHtQ9VWP2
         m7emxP53F4kDZw6EMawFjxRCZS5zumFVludQr0zif5l5YpziDW5kO3t9u1h1yaM/TU4l
         zfwL39KdCLDDqSTcQS8jmJ9mvXQ3CH/jLioR4iiWScx48pD56bfAwoahQuPB1Zp9xt8Y
         T8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ycpxXoThM8c9YtpNGBvW6Q+OFyvC8IeTmx8z5NpUtO8=;
        b=DC/3jhJldHlhHdDamhSx7L7JlapBi5x6iMD6bw3acCy+h4SXy6auCx3J3/sPFV34uP
         W4KGkTZm0sZLVgDIuRJr06zN1n/bATUSWJi5Qi/lbx3lZeKe9ZCnQ72r/jOq2BsP7MsF
         47/yGoxWoh5Y+UyPYRo8a0efhOyzVe2X3zLgE4A/0Z3RCr8inxHUBEDR1XCFVjJRtHJb
         iS3iim53WkSQd8VyJw1UonEDZf9upICx2cUm13mO9BqeP0i0lLR66+k+6puLInlVb8Bq
         w+jGduJUmpkPP2kLUWFWlUutzyWQ/ghyMQ27SKXTIZizPXtqIoclr4utWLNp8esu6f4a
         oODQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpZAxtvc/5uCEDLcynJj/s4XA7zPdi57Lm76uN2Jnn4fcjvs1m8
	WupEMriStWIb7LLya3frniA=
X-Google-Smtp-Source: AMrXdXu0bXLobAg/+OdqXa70Rnslh5/onA0ETHcClocEqQgYuGYFGwO8n0QPkJ/YjEIhuoaCjYbQng==
X-Received: by 2002:a05:6402:2071:b0:497:171a:9599 with SMTP id bd17-20020a056402207100b00497171a9599mr3135711edb.38.1674415745468;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:270a:b0:49e:5b8c:71c4 with SMTP id
 y10-20020a056402270a00b0049e5b8c71c4ls8189904edd.3.-pod-prod-gmail; Sun, 22
 Jan 2023 11:29:04 -0800 (PST)
X-Received: by 2002:a05:6402:1764:b0:499:8849:5faf with SMTP id da4-20020a056402176400b0049988495fafmr23917819edb.26.1674415744202;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415744; cv=none;
        d=google.com; s=arc-20160816;
        b=s1YzLVP60f/VnUd7Ybx2Jdr+Q7JRVNxHLRjQUruwSg5nQuo2FTSrVg/qNb6X1+KZcn
         6rFY/5hr4tothOMFgh0O0y0/Cx0Aw6ygc9JTzvtH/VzhdDeQx+0mRh0TqboM14XhWkpd
         xPLBMpzBC66xuqIR5Doeovn5kGo/bwzg/kWtW6LEbUcK3Q9AUzI3b+qAkiFsXVejlWgB
         ScvB8i00EW9UvqxDg4VG8dIZJsghp/Xnk2olD58Ydg5mxZMQyb591h4PJm5zmB5eLVR4
         spSrkDKSaU1009AoHPl6hZ8792z407qXNwf6iLdww+CQhjBcjdzbrKc2L453VZiHTb/M
         EuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=Q6EJGqgzZs0mXtMWF58/74BNTtBkKkqUHqSgF/a2j9Q=;
        b=OT1ZwdEVGzFyGIxPrnZVTZ3tV1Ia4jMF2L5CB6SC0pFMS2dcx9mtCfhAeR4eF7jplI
         vPMBwIAuaxJ1VzZgcGm/Okbov75Zp+EOi0bar+V+f9nNfvBMwmseKzcVNoBXWAZL8jwO
         tC09mfZnbVQ0/1nwVYetI1uzBjcqOPRqJVi1bZ8x8/+Eaw2ERefdQNp4+9OeMfd00vQm
         wDo/4xGO01CDc2uWz8RyzIBFOTOFgxKrzNNt+R1MXJCT20ver9J7C6zyHBw6nYb0OC9o
         bH5owH+T08AzPutR+2IZGmDsbqgab90iN0MgmcMPGz3oV7sUWC7+79QL71dSC9suEscP
         MUcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=bYEbEIWK;
       spf=pass (google.com: domain of fm-294854-202301221929048bfeb2036c994bb713-rgh1fk@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929048bfeb2036c994bb713-rgh1FK@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net. [185.136.65.226])
        by gmr-mx.google.com with ESMTPS id k20-20020a05640212d400b0047014e8771fsi2007424edx.3.2023.01.22.11.29.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-202301221929048bfeb2036c994bb713-rgh1fk@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) client-ip=185.136.65.226;
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202301221929048bfeb2036c994bb713
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 11/14] configs: arm64: ls1046a: Resolve overlap between two RAM regions
Date: Sun, 22 Jan 2023 20:28:58 +0100
Message-Id: <29447eca9fe86725da3ed1bbbaa6789a13221906.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=bYEbEIWK;       spf=pass
 (google.com: domain of fm-294854-202301221929048bfeb2036c994bb713-rgh1fk@rts-flowmailer.siemens.com
 designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-202301221929048bfeb2036c994bb713-rgh1FK@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The loader region was also part of the root cell RAM region.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/ls1046a-rdb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/ls1046a-rdb.c b/configs/arm64/ls1046a-rdb.c
index 7291fda7..e104ee28 100644
--- a/configs/arm64/ls1046a-rdb.c
+++ b/configs/arm64/ls1046a-rdb.c
@@ -101,7 +101,7 @@ struct {
 		/* RAM - 1GB at DRAM1 region - root cell */ {
 			.phys_start = 0x80000000,
 			.virt_start = 0x80000000,
-			.size = 0x40000000,
+			.size = 0x3f000000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/29447eca9fe86725da3ed1bbbaa6789a13221906.1674415741.git.jan.kiszka%40siemens.com.
