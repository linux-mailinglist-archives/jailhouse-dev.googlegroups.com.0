Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIHHZ2FQMGQE7S3TNNY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DA4743821E
	for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Oct 2021 09:02:57 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id f20-20020a05600c155400b0030db7b29174sf1885179wmg.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 23 Oct 2021 00:02:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634972577; cv=pass;
        d=google.com; s=arc-20160816;
        b=mwRllwTMJuE6BYWJY6eyvkqk/UeVF2rFx6Cky3yDbM7XWm47Ac7N4QodmbJ9F2xk1n
         R75ZrHqnHkZZs+auz83jyig2WDoOzyF6gbwfUvFk+e59STD2UAgr2Ll8LnJv6JOK/IJG
         HILEnNyek/mjJCYiSPGH3S+S/MWMuG1fFogkPbHAchwcmLrnv6CSgrIxiLuM1n+H6vIX
         bMInN/lgGtl/vseXwFux9qXWIhVUxGGlXKsADLJ1SpuGP9dBu+57oXbI4++wD8L+h/5s
         IVPZr1NaGo74x04VmYBp57X5TFH3MQWAaQ0KncrDOLKEQYxHu5roHTlskj8vxSHx/4f0
         YheQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=I9YZo2EvGU1/Pwbqi2yAaxX12vIXOy9j2yaGN0caOtw=;
        b=BkhguQrKv385elZ9ExYHQSI+htmGqSUXkNV7iAslOLEmfqww0M0l73GLBSbzkdUmuh
         EJxfbnKCA4YIcLWpqMyBC1C96zXGFaKUKhYUNkNeaODFMk02/p3B2XJJPE9aNKECmFSl
         OLiSV1FBeztp+UgKxArpDzwoDJmplC0HF9yu2O2i5NrZmVOIzxMgAUkyF4WB5qapxJjS
         TeTlMtej60tMUIPtHFNPg8ciPcziQHIJ2B5Uk17IwPETO2qd7ygORYtdyiCT9dfJgOLL
         sPd0CCTtItnaWfaGyppS2f67LnYGehfkySAjBzG1wwca++jDGZxzXwiHpw4trNfTzZPS
         sNaQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=flXpWugo;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=I9YZo2EvGU1/Pwbqi2yAaxX12vIXOy9j2yaGN0caOtw=;
        b=gnvHu8d144FZXtEi0ybKMtcQJ9O7IYO4eXmIRs8WewOdpujJpmtI2Tewk5mqOFKyrC
         tHCDehHq2yYRfHGP0ivNJ+CbPyT68yuYKY2y9H4nsz/AAyu3JQraB0Kd7ynoCs1C/GUv
         ZwLmJx5+2r0rPPm6AJdLgq/L+j9H1ioWnxHe76/3ND6sU7NPDxZTDOgYepu5k98kog6c
         dIGno690gaCLF8L+BvmB0YWRuhDFkbkVaRqibL6cwmMTxN/jZ/gWEbgpBLOeZtIS2cBB
         /tbJTaYelNJ3KWtDn8OYN4MJSgl7ajZcGy7qj7/NJaYOuieIDoC8BcrqOc9TKmzo9A4Q
         rS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=I9YZo2EvGU1/Pwbqi2yAaxX12vIXOy9j2yaGN0caOtw=;
        b=4yLB2KO1LCW5v0E8cxrtn5MzSDlk8mYsoxIqnikohG0l+cWdqWWylCxDnI/pVlQdwp
         0N81f0X1Go4zDgEsV9kJmUxmlykKA2cfuvaQU7iaTVSEeUL+GL2/1ZG8Z4A307sabGP/
         9KAu27uMsDXiiy1hpggD6gZZ6QU9zPSwsbRdJs5QOGvO65GhO1ntYhxC6hz4M38RjhJn
         RoJ2WYyi8XX18PWclaWQaFbab/KNJJtywQt13RYIOkzXGcCVyKda3cS3Kmb8EWntFpOo
         /mEPYtkLBDkUMC1yi6bKXMXo41977zAshcOGCX8fx99cllBdjdhToatgzwd6Mk26r7Xz
         /1XQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327gRD6UF/jhCykFTRNzoN2lhAF6MxXRSWWXUzmr5TUGN/OKksa
	lB21exPvcC1JBVnqND8cBSQ=
X-Google-Smtp-Source: ABdhPJzIDLydfJLcKYlCeKBysO69nk34hWbYzJVbj7crw2xfXrD2wXS3np3GIjKTEqD2DmrK6CjN4A==
X-Received: by 2002:adf:b34c:: with SMTP id k12mr5815355wrd.1.1634972576974;
        Sat, 23 Oct 2021 00:02:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8b92:: with SMTP id o18ls1871350wra.0.gmail; Sat, 23 Oct
 2021 00:02:56 -0700 (PDT)
X-Received: by 2002:a05:6000:24a:: with SMTP id m10mr5743521wrz.378.1634972576009;
        Sat, 23 Oct 2021 00:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634972576; cv=none;
        d=google.com; s=arc-20160816;
        b=cjEJmnIOr9hx4MoZLQFqiaQZcG7n6nY27ZHK5Q5+jLyqKxpHnw4XoZtoWFT91dtphA
         Rf4l04Nk6msXNRY/7Q+0NEo8TQ5YQ4MIj4AWy6fHZGwk03Msx75zp8hW5irXt+ncdcPE
         eEcqh0oLMRnOQIglHnw6lbVyNrDIv+EllxyZj/gQ8R+StvIoppevXDRCGx1GcmXrpBW9
         33Sa+/ZN5W/sCq147LCdVJvg5ZYwQ+DEOrxF1gxHsrm9JrYbfVAK/OADvdXH50GyW1Rk
         GleEl4p81YqyZ/QOwAG8xESZ4CD99dtYLafFKPMc5mhfbUtYxE+tjDnzYlFax0ssaVlw
         lauA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from:dkim-signature;
        bh=Pizpa+buMbaoWyy/ltpttEh/ntpgpZ9lx7yuA8I5IP8=;
        b=Z3Rxe0yekCT6+l5jjb6VzdjbaaxbnIWcTFv5THgH475lZQVsgYs8Ig/JXs5x0KuLPp
         1dyrVqCyo7y77bQu7DKdLoZCqoE3tHt65DHLBGw6NpR4hHFzvPKckreh9lwV6YB8MMXo
         c+6X+GKQnCx/mS7pKeVIHo5yy5UfhpNPqGdOkc1ELOf9HyfxzbxJepgQrdaVx4QyMQYz
         dJ5D1NcEQWVy9U/oSJvYFQnoPQ/7whoPUnx8ZfQbFOopPQ/YGsUcPmkwNDlv0y55px9+
         4P+cXN7+5ml+u53qhd8A5F9XotXx/ehSFZZdcMprjIgeJIHNiv96ezShtpjeNCtgzi0M
         Rzxg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=flXpWugo;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id g2si935241wmc.4.2021.10.23.00.02.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Oct 2021 00:02:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.84.132]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N2BM4-1mpdMv1vw6-013uJN for
 <jailhouse-dev@googlegroups.com>; Sat, 23 Oct 2021 09:02:55 +0200
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [jailhouse-images][PATCH] crosstool-ng-microblaze: Purge download
 cache on cleanall
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <d7c45a77-3586-76a1-1e97-bb2a50b5f818@web.de>
Date: Sat, 23 Oct 2021 09:02:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:dc/gfz9bQvwoeGP0OxY7zZwl2RFWN0FuApsO7qTnftndBBPudSW
 B1LqGgN1XzB+//bNSxdUGgy7N9Z9aVS2AJvM4E2N8UGZPuNzsjpQdhQosZC/MAuPQ3j6w5r
 JnwNFp2bkO7Tv7ROlv1CSd2E6zy+r+dezEwRAhqh54kBT+nMDIz8Gm56PGeYBFKFRgO38Uj
 yu4E8mdQrIoOTpTWfvBJg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:WfHBeyOclLI=:smSmuttQLLpBWHLBTSzWOP
 5mhceoY2vCO6u/atKNTt8sgfbFT2nyBqZK7Glbh8PTVCULScUD2KhkHM21FYLDOrWloMfQsBp
 KgVRCyeROSmuag9ehO2yfA97b4AJso5Zqa/i10qfhKX36rm6pHBaSE0MvdcmG2m60nOSnPsq0
 8XuR3nDrSGVmF+oRTryCMPvSd0A6Yrh1meHTRb7qdtY4X9sdPxbH3md+lw78Q6X6ayZjgZ5nM
 Fv8uFMoLAMJOPzD/EjuCcetVa036iuagByLZoCnEHRjkRfxRzfTI1syZskxwEJ/ajxHqQQXr2
 g/soMxFVZG62VDL+cZCvlmJ1HZwN+N5t8bdaGgPfXSZ58Rr7NvFvEJwrxvce/5Grq2RLOAXYA
 vdG+NnIl7X2glj1B9F3HmS/ba9kH0E+dPBSoMgxvTHV3yHATJkLeGBVvl0eUv5MwMN23o2Cfo
 /YrmUjtGo2ZnJOHMBb2LvHS/Oi7jRs8/fER+MSVGWJg0LcoTZCncwsRUr7pp+C1CdSF9nVvHX
 vT6mDRIXSQ2J5URvIq1+bsp9JWJX6Niup/9ZrGj/uYlKp0Lw+qucBWzsP4ZH7vvLAnynlOhfY
 GLVSw4pXiNzGMAFTzK8txAZe49idbomeW9kiLdA8PJ9YTLm735kU2OPfWn97Qh9tVyP4iHvO4
 nEfXsXxkoSpn9MfKAgZaBYFxecBK6pHE1LSFvXSuntfk7crsZXIFQl7Rlf4d8PdjvDmOHTJ7m
 SwovYEeOBV5tWUHiKuRoZxAmU648oJa2Yl8paRzyaJUwGCX62XYIu4UvnfcM3IVftfSGR6/Kn
 huMUupakTagarOELfH3+wMD8ROeUCCwEPClb/YdFDXDueJkSf4wB3oFOd6lq1zqKhoaHov/lM
 6qHerXqYopQXFlhmBchLQEtyujhLvTZ0KEJ7BGE1GszYEKp9joK8wvC/u9s9YIds7x0AzXOu8
 zkP3fw3eo5n7H0HkNnNtTwB+a328UsZnKvexKtl4CQwSkb3UaByPCrriF51DoNHTqgZO0jzW3
 J+uYxvGmT0MTDKYL1iZozU10yWja8/UDOm3ILUcRRLgYAeZn1oTxjFofrDtEELT2EOb6IabK8
 2Sl+8g6IMpHXU0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=flXpWugo;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=QUARANTINE dis=NONE) header.from=web.de
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
 .../crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
index 35bf71f..84b612b 100644
--- a/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
+++ b/recipes-devtools/crosstool-ng-microblaze/crosstool-ng-microblaze_1.24.0.bb
@@ -31,3 +31,5 @@ do_prepare_build() {

     cp ${WORKDIR}/defconfig ${S}
 }
+
+do_cleanall[cleandirs] += "${DL_DIR}/crosstool-ng"
--
2.31.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d7c45a77-3586-76a1-1e97-bb2a50b5f818%40web.de.
