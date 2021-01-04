Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBJWDZP7QKGQECZZCBDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id 532AD2E92AF
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 10:36:39 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id i21sf16736589lfe.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 01:36:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609752999; cv=pass;
        d=google.com; s=arc-20160816;
        b=uUTI8w0/JfzWcoMN6AQ8NP5tbcsJYy8n3i7LIFxPFGJZ7nw+wMwNmIAm30QbcOsTXO
         rPPYhAnkwaTTbcwhnMudz5ve1t46CRPJmZiXPsX05OWuWaWQDY8phjnqhKfViaIZTak0
         VRx9nFyOU0VKwbenDrFA8LoxyevA+1Ii+EQnOn6NfkNdre2MSpwzSdhurGump1fYtNSm
         SWrPQjBMa+egYMVxgBC5kV3FQsPy2b+kGYP3LyvVYsnQNnm732f9LwWtf6kE+MQ/XWZE
         WysrtMdvkwmYi+Fh5JEtDQcjgjuJxG/rxqi+4TIUg+9RxAzmft5c9kA1154sTFXZ8MpW
         w6aQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=Cs3pzsxZOuJiIbeqIY4tbSpxmStzvtY4RRUssjD4KWc=;
        b=rXgRw8LBK0qOthZeJPa/Stv/z1J8TE7BLtTDJh5ttZS1X8oYzn2rITplQfI7gj2x2d
         ydqa4tgpNh5XAaykluS++Ko8vBzebPBbezEbSTS17jXVRELC1XIoqlRlp7tcSXDjSrMT
         tjc//H7pphgXVloAca5/a0x3fea7T40DbXMRFq1JnX3SbGXtmRn9mEavRpBDWc5iyuyA
         poDsR4Y8XIU2fmmw3IQaPtihThXoxQe73+Ad32Artt8Q5fiScQjzlN662BKh1RqzpJgp
         jEUhwlW3p6SF4KVLJduF4Nm7iR7u5o6GH4DJHZvYDTc2x7Gn//y6+IiJmY/OTrOBeqI3
         Pfkw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=X4U1+Bmb;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cs3pzsxZOuJiIbeqIY4tbSpxmStzvtY4RRUssjD4KWc=;
        b=n4hz7DKG/QSvIiSwnjpioBR2nRANJvyOXSAO/hLYWRx1kyPwH8xwPQjo1QqG2JRKrV
         m/EE0QZN73KutqhnFfcZNat7OybMc06+DgXcELSKLRMCdydM0MivwiDvCqVtWLqFBuqc
         ocexPKEwSd+ux49EnFUOcW7aTN3iV/3UrCe3HcGsg+UMIm6AKq6eE6+eXKB4k1cRwNWX
         ql+/qpu3UZ9IhUPQaJXIsZ43X+s/FtH+fv9dOI0gYStfKY+ciaynfq4dtUdbk3qoZ52u
         9L/MhvppVCfMTJbSfvISu/npEdREasKa3gcKtAyylqKWJpysVnR44mupdYpDFz/3vVgU
         qoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Cs3pzsxZOuJiIbeqIY4tbSpxmStzvtY4RRUssjD4KWc=;
        b=R6P5wD8iJYiC5fX7TXFvkWAOdaZ776PlDb/LlYqv8Oon/SjOc2AzvacfdIlQwIW/rt
         OKZSFXUtZOrojIG8pb7HPU9GjUl1C1N6SOEcix0vCEDfMp8s69ghpy3gnsVmdAe/Drcq
         SNActMzlAggdWotWjoRFN3A/aoukM+b8yX/f+dmsYmbWcXzvKMkZ0K2ADDaFwr7WS1v7
         bRY86+wmoVU9GXgK+ot2VmqZnlzUPva5dOajCZGmVPCw5m14+clM1mgBZ4clefIPTFo0
         Z/fLd+qztTga1jFL6/fkX0G6KZVyZOnZzqX7RV4klvPgxqKATtakDYRpAzkwtrW4MGH2
         UktQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530J1qW/uY1ycXAoAS3L7WKOCSTbhCrBDPVWOWBOpEmD6bA8orHP
	ELdQWJqpWu2bSFqjLNv5oto=
X-Google-Smtp-Source: ABdhPJwoJRLPh0tprDGOEUtAiPJgH6R53JHRwyry+fKAwIcU4twZKcwZRjB1nBCEYJg4abulhwP2IQ==
X-Received: by 2002:a2e:8e38:: with SMTP id r24mr37653900ljk.333.1609752998945;
        Mon, 04 Jan 2021 01:36:38 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8055:: with SMTP id p21ls14087855ljg.5.gmail; Mon, 04
 Jan 2021 01:36:38 -0800 (PST)
X-Received: by 2002:a2e:9dd4:: with SMTP id x20mr33631096ljj.37.1609752997972;
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609752997; cv=none;
        d=google.com; s=arc-20160816;
        b=WxMIhMw6PAIOcHK5oHl0UKHYLxnh2t0YWlC6pxGsqE2WRd1I8Q08HnJQnu/WphWJ1e
         /KPaPFagA9c5ZZJRJU7kXGz2p8dLL6ATeLwUJWwp6b1hAASQg6xy/ceZpyypKYpFLz8B
         S4JMU/Dbr07d6fhnaR07UkX9sV2v66r5Yq7TAeK8TguGPC+vX2Yug/BnajaCQBFWbiV0
         22alggm3kPoxRGuFn+MZoTnTR8utMjWmfPcDYVhSWFQsK98fL/zc3SK3o2mCX+86Pq4U
         JcH1wySAGbF4wScjn9TiC+SqiJFbFM52xKh7M+HcT6fqgaRbIjthhagFhgx3HmuEGgnj
         Xt2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=iYldG4yUM5xE7MCNRHCWklkZxqZdYDX08uSx4c4fpeU=;
        b=sppxSSsx0TTTPNyCLs2vbWNiAo9lGteqoo1LwKChsKPXYwLcqnatZ24D+lakNypPFx
         X4SUazcDNCPbbms8TVROwkRkKXzNFdHKwyvzsWC3CGdPndRc6pEFmP56TtEmkaAnl6+N
         9UXITvB8sNQUbjFvMe/2jLu37fQSsffy0ICbKU6lxQlZgo0Jif6UF6AXUOPx9GD/GDWi
         PPyA/3IhNsmkksEwQZaEZZbYQA2wY3fu7IbRm9sdIqfI1VKfH6lV5Gd19fuoX3vGFwLg
         xQ1j8r4jDmvvB2eO0w0LHRnKpVVMAm22JMdpjoQZNlMAkgquZ2mWxBIthAPr9vweU8zs
         1qBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=X4U1+Bmb;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id 207si1554213lfm.0.2021.01.04.01.36.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 01:36:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb102 [213.165.67.124]) with ESMTPSA (Nemesis) id
 0M9GJ0-1kqI0Z12Te-00CgiN for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 10:36:37 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 8/8] arm-common: Forward all SMCCC_ARCH_WORKAROUND_* feature queries
Date: Mon,  4 Jan 2021 10:36:22 +0100
Message-Id: <b93e9798b6475bd75ba7ddbfad2f58905cbe0090.1609752982.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609752982.git.jan.kiszka@web.de>
References: <cover.1609752982.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:I23hYk8ke3r90slnZbnFRD79yxHtZwgOhnHjv2lzUbW65FyDoCl
 3S3AGxM+ueAvte6eWVeZQSkscpaSffYJsJM7dXkl8sAe1cXQOr0BdAAo0QyGvb0PhgcFm0W
 iCg+hMMtycX+FjcefmFEGq+tXkyNIZ5MhmhKNUy9cfnfroLMBQ0XOXxV6HDR1D4yAJEd0Gs
 rJk7pgS0FNPMAJGjFQSwg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:48e/F12cm+8=:yKqlX8YJrq0AVsPLok4UG0
 1tJ260Yr0FwRL2cGIkxWl470K256Ig9CHtfnqONdarZh/kfbm6pV+vcB8A329BRPnYclh7TI5
 E8CHF0qBpk2Sm+ZjwUvxCq9k92wed1eHn43vS/27mq/4TkegCzJKb2SgKEpkephnUlRI1CW5Q
 84mbiGsqnE79hoaweyN5meZPhwAofN9BgdTtqRLHv0siO2RXXtbGk0ikXU7PA0/i2O1gRv5MR
 sEqeyRX7LJPq88rD4TUnQSbAAJFcHHwVV+hbQEWfkMQUByYQ+TMZdiHRP0yNdr+PGKKt86rao
 rn6s83pjCGUfPCqwiuNqulRx3e6xRG6n/WmTq2TAo8jsxYyiDLBQgvdX8NdZt6Id+fkRwez3n
 T50I5rGKj9g7k6WO2w3dUtOxV38VBOllZJDkwh+HBxBiscLcv+m3W586vCLS+i1aDFqQr/Brc
 96e8+kP2jGP+tE1Ygous3sOHEN5c+xJrmNN5/UzJgjesZuK/bdQgEQUEocRFjjpg4yLRkWj1m
 QkA2TaLELhVz/0xc9gvjEyerZISFZESg7cDIh8Z91YHoJvExrYjjVmtlLKMJE0uk1+2JPXrmu
 E3jgErhBmNq/58RzuIUtNRYK2gAb4iNuzy3mdLRxL/W7hu+v2x35lBWyEUyohkhhuP1p1UFJB
 2coImCg/Gn/OKI3/tWnTdGWAyD5N937MMwM2xJwwwE92eE5xal4vt3VVnlidy3aMurHEcnX9w
 3E7t1vzXnkGgxizqVw3dqXLevk5hWUz2vr9y+WOqwOznyzXdSM4zdD4/j1fjmhvLmg3xtDjQk
 TZDOKMK6vOfJPkk4ILMfnLVjR7F+sG9r8lchp0Hi5QBmMUQdg31vpomA7X8QQcGuTmzQHTa/A
 o+E0xWqYTRhZdq/Qm52w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=X4U1+Bmb;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
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

This adds full support for SMCCC_ARCH_WORKAROUND_2 and ensures that
there is no deviation between features reported before and after
enabling Jailhouse.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/smccc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/arm-common/smccc.c b/hypervisor/arch/arm-common/smccc.c
index 363cda1a..0925d4bc 100644
--- a/hypervisor/arch/arm-common/smccc.c
+++ b/hypervisor/arch/arm-common/smccc.c
@@ -57,8 +57,8 @@ static inline long handle_arch_features(u32 id)
 		return ARM_SMCCC_SUCCESS;

 	case SMCCC_ARCH_WORKAROUND_1:
-		return this_cpu_data()->smccc_has_workaround_1 ?
-			ARM_SMCCC_SUCCESS : ARM_SMCCC_NOT_SUPPORTED;
+	case SMCCC_ARCH_WORKAROUND_2:
+		return smc_arg1(SMCCC_ARCH_FEATURES, id);

 	default:
 		return ARM_SMCCC_NOT_SUPPORTED;
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/b93e9798b6475bd75ba7ddbfad2f58905cbe0090.1609752982.git.jan.kiszka%40web.de.
