Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB3PLU3UQKGQED4T4K2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C45679BB
	for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 12:43:57 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id e8sf5645181wrw.15
        for <lists+jailhouse-dev@lfdr.de>; Sat, 13 Jul 2019 03:43:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563014637; cv=pass;
        d=google.com; s=arc-20160816;
        b=PN2xbIFN2Tm5+8ZqJC+YimRRyRH0yFpOjnqtH3Ob2o7F6HgN4/497vIuZ0WEvFSxyw
         kLbpBtfjYCon5Bkij/WncQ7QkmVcwI9WRzrR7HWBAbN4c5oiJrht76aOyDsbnAqfRFOi
         LQFXLC3YHEXFn3OXlWLKIkk8YuGneO66u1HQOzOWabHkfiPRqbgsghbVnnq8k47UV+Ev
         qh/TuyNYSI4dsXS+rkg5jPXeMh0Ci7X4wC4oBlqWS0cw9KthMRhp+6HhhVEN+6B6XgMg
         xPEVY4zjxm+pHIu4W3RLDZ5HUTGnYoho8UpjqF9AwYp2/VSDnaDlUfsrRNjih7wlFvFZ
         Fc8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:cc:to:sender:dkim-signature;
        bh=ErsQ8G21vQTmz87XI9r93hlEcZTK28+anSoekWKajoc=;
        b=xe8re6JSsnvalw4GjSI7gfDODQHqGwVvRiAtdiwvRqt7vx7UUcoo+YftiYW20yO8xs
         BL99ilxDBMBaT7tks4Ca/S51v6n6Y7kIMYNKey5kXf6IJATSZYdqNwcMnqXeggtMp4ev
         GNdg238AcwsA0RPizzZGzW7wp0NM7lH/OFYFPD0cqKr9uz/Y20sVUqWvwsbBo2GfY9t2
         HtOTK9m7LyKMH902PqsMXq+fq+wRCwkurIid/lEyIkSFo4KWR4NgMxrWU5e6d+llQKcO
         q0Dq2hD6AKtxnFEy3Mpp6/BBIQ3WGU1aIADeEnrljOMci/XM/6eChVFFQCf5ER4hCu96
         xMPA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hg9lyeEs;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ErsQ8G21vQTmz87XI9r93hlEcZTK28+anSoekWKajoc=;
        b=p7f7488eqIyfpeWBqt2SRXndVvdcUL1502xRrDh93l5txb/gH6G0ZZhlyKuyr7NDc1
         gqHaYTr8jg9pzSkCdobfQj/VVxAfkcDwIw4GU+FjnvVKZyWipTAoyGddP6bHe8MKOs3X
         lIGHAgi1OmfMssCQkBodwuZOU5f+3tId4Pmpr09iT+yPS2SWVocV8jbgWymIB+VenIIn
         FJMoxInd0LLQyZfhB7TGV+4lJe87l4HwxkxQn504wwvR++/EcyKdvXxg3xm8LEwYjQlJ
         /dlACRtCYys46fgxYuDcFHqRZn7xJk9G+LiIiAbS0FAglf4tpNlzoiGornvjOkZQkOfg
         0yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:cc:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ErsQ8G21vQTmz87XI9r93hlEcZTK28+anSoekWKajoc=;
        b=kjtKImQbPv+jUFRVrFGHq11eGsaRyafdjlk1pNaFfKSgDJj0Tw+smEZU9+eQhk+CcS
         MzDiMJ0bjchimS7ejUmjZ6csW7GUbRRlA2Em+MPHlpHPt/TFVcQTYKzvkXHnq7Od8L3h
         DKMaBwCdavcqhWLvv6lfSYmK5yWa2QYc7p43oNpPmssExXYU4ByNV5/c/p4QJ3GY4tgW
         dQPJOCmgeSWs50hGq1I/3odJPF3Qx//8aXh1W0bk/HcQTCOA6nrR28ZB4N7MqEpIIO91
         3ESPYIDKxmCN9opU6zyDle77VpnIPLeSyuoyuwdbPMOzXUHjyspzZSJD+rjnahIxQ/Jz
         QAgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXG1dADUDZGLc7jGeZWTmJrnODsc0P29bmsYC7j82Camn+PacAO
	8OY410+lZjPMBBfDaGsH3Ck=
X-Google-Smtp-Source: APXvYqxP83Ns78rb36yI/95ojsrUxvfsFPhUAEi2hUwdfjJCpg5tcQ9dIiOK7TFm2sJmisY8bY4AbA==
X-Received: by 2002:a7b:c0c6:: with SMTP id s6mr15265051wmh.115.1563014637343;
        Sat, 13 Jul 2019 03:43:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2d11:: with SMTP id t17ls4639838wmt.0.gmail; Sat, 13 Jul
 2019 03:43:56 -0700 (PDT)
X-Received: by 2002:a1c:5f87:: with SMTP id t129mr15282406wmb.150.1563014636788;
        Sat, 13 Jul 2019 03:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563014636; cv=none;
        d=google.com; s=arc-20160816;
        b=CZ4WVDzprpN9hVk+2qZqWqg/rLH7CxJQrYvBprEFUSrpkn4FsHZ3UuWCZjseMIahY7
         pk/j1Q44ntKPzh+0KSZob0J0iDfLp6oz0Ds/i4bh0mlMU/Er44XlIl/Mj1CFwNWVriax
         IIR0zfFsk4/c0gi3iXXHrF/+egAqJ6CfnhLz87s91VuvyUAqYqysuGfZQXNI/T8leXG4
         53HSI1vLJcswEzUgoL/yYat0dQPK4SAHHE/sEdbXsLD6sEFGQtfizT0Y0WJm7ImhdKyC
         VveRbbC+wjZkrHOi8ERhNV/pKpRbZH6dgSXZiwrou+Y7qfcIITnEqtwk5W6oXbeATw0H
         ppyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:cc:to:dkim-signature;
        bh=ag8qg2ji70sxzn/9pwSEOl6VgI5KvZxHDDimQXsvTX4=;
        b=QxBb5L00MIntMv+8pgjlrF1ARvbYbbsvjokWB5mO+zBA+eKmpTseGGyzXrZrfZQnOZ
         SJF2l01QgRQ4W8/CObBDEp5pBCfqMKpOsVTOZRJI8P0/jN/bVpekhCK7x1lN4AAaj97n
         n9lQvMlxKvHi2MoTvVRaWZsnAgWsyKlugLZ5Sfky+V8Qq1j8iniHJK8JlqYAtQKs5igy
         fP3IDxTdsPdmSaEgC7njwW/jqjjlWUXrcVSBmwDV2VtHiK+lGJPgwzxm+PA9xFcoebsH
         vnId/fJ1OTChIlThiiydq51rQXrRNQBi2ECnTO1Ts7KbpHs1KDvv4SjT2r1Oywq8Yt71
         99RQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hg9lyeEs;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id q14si653468wmc.1.2019.07.13.03.43.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 13 Jul 2019 03:43:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MGAG3-1hjAZH168t-00FD8W; Sat, 13
 Jul 2019 12:43:56 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
Cc: Vitaly Andrianov <vitalya@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] arm: Fix build with gcc-8
Message-ID: <8782f268-85e8-0366-9ec6-82821a9f41e5@web.de>
Date: Sat, 13 Jul 2019 12:43:55 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:bqhohfzVXGV1xfKUwtprf9MBWbW4rqnpkoZs6/J6Vf6+i6waRFn
 P5pbcUKPocHDhZJRQc6VgCbj+y5CrMz6L/0CGa0neoZDXvK/lhexrW9u9KYArkG7qL6MjhR
 +YJHbbKFAcrVFlKDmqh1/4JGYlFaL5AYJvlwygEX8itEOSQ3SUUMu5lXrz5RT3lQHctfC5K
 FMDQ7Mex/xDC2+acYl7QQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6xVSjIwW/0Q=:CnQtT+7E/Wv0mznV1mHjzw
 Ltbg/OJsB8ub7w+0IDttmN0Djg9jhhZ4ngzenj1wDlc8FBsGO3/XidZdE2EiaafM1gU1iG+ER
 nZ2kzGrcai6bczTBpiUCDFtkjcQ+DIHpLLzi3cphY+w2IKnCAfWgZcWQ6LLCWGMQ1ZUVvfq2O
 /g+hJJ3XvHOL0Y8/KkIl874QTbwYgYNBHxlLxFL7+VnK1dRCyr8+fOp4khn7butkNjymW0yAz
 dqJ+0Brz9ZZ2bSQfCdqe9PQwI3/EmU1qbK0Lb1sDPMmDTwNXbL4uble2U7NfgeTlqmKyS0n8r
 a05dwjfn1+ELa8eTKTSyuvn7msF0CsxlLnd76H57r8z5tv85A8Je9nCXTF2XxcCljkMIn4fzY
 d2Hy0GFNtdrSIiluj5uZ0qytPb8jfLcBIt9XYOODUMh2n+VtJ3PD/2bS1UIvNWY69g2Ldecs7
 2yk4/8aOQBp7lMMjg3KUUnbqt46viIkfwnPdRDduIuBRwRNGPft3677rE0roSdFc2xOE/NG0f
 zl63Pvnr7B2YIS0+p9h7YO8y2hXbGQEXoLSqmu57ZSoZRx0oys/N7BAwnpiPvHV7rnbUf3p/h
 qNAKqj2i4H6x6KHLZ/16f+Rjw6i+r2QrZj3I3rWUWn8n5mw4S8d6yA7mGOQofaht8/tecZ23u
 KBByIR7EIUQnoI4DM3+OAcMAU1hjerAnaG8oQ1NkaCFrLx3FOzaBSt+slpySYClq8J38Yyycj
 /Uf4lnTaRWyOPi7KJQQQdmBCD9yuvEU8nUjusiiV7bZ9qiZ0UZKOD4hEmTrS67aQmnY7MCfFT
 RjwXb6PXu4CiQeyY2jR6zWo3uIeHGl2MxUiSCVN5ve6Ks0pQDYf0qJdDmw6g9NqKqKv6NLmXt
 6It2qdQVdJVDjkeEv9TVyVG8xqqmvI2BO4XW2emQrj78TZn6QdCmZ2VU9YSe7HnGNmVpzDBpv
 0DYhvIa81kkAA4rpfDohzzlDN68WHW+QtgJ1eqQINxniL5KLE0TZd9Fns1fN1H4RIdqJ00Rcb
 k1a1iT2vJWLzgroItC5kA/bN2SVvGyc0MdDmMlqD6pNf7XVs2R6wER/d16ocZEFJ6wrZSrXOj
 ed/KR+LujelAR6FecMBGo9SlwdUQ3bQCcYk
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=hg9lyeEs;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

The inline .arch_extension statements are ignored by gcc-8. We rather
need -march=armv7ve now.

To keep older gcc prior to version 5 happy, leave the inline statements
in place. Can be removed once we require newer gcc for other reasons.

Reported-by: Vitaly Andrianov <vitalya@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/Makefile              | 2 +-
 hypervisor/arch/arm/include/asm/smc.h     | 1 +
 hypervisor/arch/arm/include/asm/sysregs.h | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm/Makefile b/hypervisor/arch/arm/Makefile
index 2f930cf3..a170b593 100644
--- a/hypervisor/arch/arm/Makefile
+++ b/hypervisor/arch/arm/Makefile
@@ -12,4 +12,4 @@

 LINUXINCLUDE += -I$(src)/arch/arm-common/include

-KBUILD_CFLAGS += -marm
+KBUILD_CFLAGS += -marm -march=armv7ve
diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/include/asm/smc.h
index 34944a2d..5cde3d8b 100644
--- a/hypervisor/arch/arm/include/asm/smc.h
+++ b/hypervisor/arch/arm/include/asm/smc.h
@@ -10,6 +10,7 @@
  * the COPYING file in the top-level directory.
  */

+/* for gcc < 5 */
 asm (".arch_extension sec\n");

 static inline int smc(unsigned long id)
diff --git a/hypervisor/arch/arm/include/asm/sysregs.h b/hypervisor/arch/arm/include/asm/sysregs.h
index 76dd5b55..b7eaccf6 100644
--- a/hypervisor/arch/arm/include/asm/sysregs.h
+++ b/hypervisor/arch/arm/include/asm/sysregs.h
@@ -283,6 +283,7 @@
 #define arm_read_sysreg(...) _arm_read_sysreg(__VA_ARGS__)

 #ifndef __ASSEMBLY__
+/* for gcc < 5 */
 asm(".arch_extension virt\n");

 #define arm_write_sysreg_32(op1, crn, crm, op2, val) \
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8782f268-85e8-0366-9ec6-82821a9f41e5%40web.de.
For more options, visit https://groups.google.com/d/optout.
