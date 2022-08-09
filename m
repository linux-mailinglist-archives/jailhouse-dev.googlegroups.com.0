Return-Path: <jailhouse-dev+bncBDUOFW62WYFBB6VPZGLQMGQE56KYVJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1D758D8EC
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Aug 2022 14:50:04 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id y2-20020ac24462000000b0048cf602474asf1181997lfl.22
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Aug 2022 05:50:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1660049404; cv=pass;
        d=google.com; s=arc-20160816;
        b=m/03+oyzbcvLQzU6ii3D35Mj7NOX3h6mJhpTLGMJ2DJ7Vk/qAdyD7/hTi+bNZYVUmY
         Nfw2/pGbSZfHuHTDVrL7wejkGZRLOCSP+FKoPrHXh7uYQh7gMQvxT8Xsv1r55CWV8SZ8
         YSql17ndegBQ/wE7M7u+nCWXyRPxBqVYNKYx9SRQUBc3ItBW+V0zcO8nzwFMzpfbc07A
         lKmrT4Onq11vbfVjCnDky4+6DKrprEw4t9VARScomZvUcdZjsVywK94K5cJr9E8Da8v8
         A0oRWp96eN32d3AD7blXffe9py8HVWj0UjUce5v3+jrexHEH+WR+H9LY9npIeyWmb3YD
         Y3IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:cc:to:from:sender:dkim-signature;
        bh=r8D8Cfvkw4mbZW4OVj6NO45hcq3TMoO/HzI07Te7L/0=;
        b=PfFV9qL2p4gFc3nfmqjWT/DA1LyeXH7y9PqqQe1GbCmeoEmd/klmJsFHxTKLTN05Iw
         RQ+y1iThj9Kc1HjhisuvOU+MlwW6mL+7Lwr3fbyN5Rot/b/pkEaEbJaMYcQTRKyGaeuT
         iN9EM+LZlAzy1BjAnqx5RLloXnCsWskZeiTeNOC+CRLLi81cDUlCViyAe0f6dIIa/E0i
         Wqe+WFg8G+anUvOdMY9lIRHbz8Ehe0VUg4NrmQQOLdD48I1kSDqWD9DRQkTll9TM/8Ry
         qNiDMcw49RHI4mQgtKMsaAroTVTZ76pBKx+4fIaNHA/lfg5V1RO3ojTZfA6h+kq7MJZI
         6BUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=S3DVwspq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=r8D8Cfvkw4mbZW4OVj6NO45hcq3TMoO/HzI07Te7L/0=;
        b=fiOsba4rmLTPeMAKi+YasocbtkkoPY9BEIuT2rhOMj83+O9UlwfRu/f46EMdUf18GX
         pgp6rmC0e2ksBx4ATpyR4KhFnFWEnfOZQFUfnPtaRi/XUhMv99TQCkQc1vbTPb3jZcoT
         fk202qGCoBMDyRY1gUdA/6jK6+2A/9cjhKy2MrljnfqaEbegsIwVF/Y3Y82S6KfH+gTU
         qyfCSUB9vG+P5BVveDIQDRbTO/O8k0JwTE76Pp3Y1vUm9VM5xSpF/ltXckIobG7vmARH
         9euYenAPcJM5vLRPrZo5DT+wjFDSG9W0MvVeYjGHNxQXD5H/UtIic9ZKnkXFVGT16b0o
         IfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=r8D8Cfvkw4mbZW4OVj6NO45hcq3TMoO/HzI07Te7L/0=;
        b=ujiHZhZmKnTLmCCImbqjhlkDk1VqtwaVd40jydhQ+vSdOEe1jja3EyoSc5hrUBLRgx
         xgGf7brJWt4HWLGiuiYLinmMW/qF7oz7IL9cWmr3IVSiChQOxTMjbThemZLGhAsIQiz1
         cH083Vxkbdipt+0mHNwCMC6OdmnZIGe9PT1+GimK3UROmSUigzUQlpbiERvXhR+Q7Zmv
         aSkG7IxP8ZLu5R4GW+607Efb4vAXm/ADvjhRvfFMUNvO0RabR5PxEl5kdkoTn7J0bbmP
         +fK+nNU2R5jCAoCWRyuDgKhx2nDOKuTO4gsubOkt8COLIzwxSPL42GpwRWKfVXPBkhcW
         bVuA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACgBeo0+9f0U4GTakUKGpo75XlSVgCZj+KACh8oiq+jNAXyJJYSLwnuI
	2ULZgNvs8DyGXB6L+uFqBRU=
X-Google-Smtp-Source: AA6agR5chaxQpkHIWgG0rb1XC2uteg8SgFTn/zln9k1cpBlrNrhw+yLW+6SWg2sFNfB8k/IDvA0sUA==
X-Received: by 2002:a05:651c:b14:b0:25e:bd14:603b with SMTP id b20-20020a05651c0b1400b0025ebd14603bmr5763113ljr.82.1660049403760;
        Tue, 09 Aug 2022 05:50:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:200c:b0:48b:253:97e6 with SMTP id
 a12-20020a056512200c00b0048b025397e6ls1837701lfb.1.-pod-prod-gmail; Tue, 09
 Aug 2022 05:50:01 -0700 (PDT)
X-Received: by 2002:a19:3814:0:b0:48a:efca:2f28 with SMTP id f20-20020a193814000000b0048aefca2f28mr7450899lfa.254.1660049401676;
        Tue, 09 Aug 2022 05:50:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660049401; cv=none;
        d=google.com; s=arc-20160816;
        b=RIQID/DXYcz+WaTiKRI1sIFSD3kUWs+eWFVAzS7Lc3p1CoFYlJp0woU7igPFzcb04b
         gNXMzYK2dNfk/NTjsSPf6vCHqKvyQmqMlRv39HucTNTYxHcXWC8AvyEpvlxWpAcmwHXo
         yLa34qLMG9MiI53WMEdRump3o/Y3JNgNQSoogSbEqxYXRk+1m7wKhZmsNlZpDYPB6ogz
         WGnNYWmqHubm91cARIGPnZ7Rl93gZzeIqsOm5SyLUj1UGewTlE2KVIQG66Wy8cbkase9
         0YCPHsbsQCEppYAlHrFZRFZvcEU9rgo7Q0aep1UDm/X2R7hp92qTVy1P14P77D2FQ/xI
         itbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=50ICYF20UhvZ5CoAtGaFuWv49Ewufdf2e7rGO9w5JvE=;
        b=HkzZ8jwW32BdRHKJ8UJKjM1fRS/vJdSzwnGMBDoWJtmf6Igl/3OyvQh4zxdpV/Fut0
         ZqPd9iakg8WYWwNNq/gwQbBkiXEXdpqACMIVjVBBb+jzBYb3VKDPcIEvBOspS66wGrtm
         N56Br6W+Zw7M4VJFwXv0Y+pfuU4Om/zj0G4X7k89PlmO9agkShTQoxMAispeTLrd5zht
         rWv9+nzC8zh4Y2th91QxXmJ+K97Nvc6omO+vyKaM0R5W+8hWIDGwAF3a+/ZzBtEjRS3Q
         FVPEwIOZWAw/YexOdLDpTiP+oAxrS1xm2/XCdwZ2k3LI5gn+MQwRGACRVlZiNm+v1IJw
         ojdQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=S3DVwspq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id j21-20020a056512345500b0048b572e722bsi306051lfr.10.2022.08.09.05.50.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 05:50:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4M2CZw4b3Dzy4Y;
	Tue,  9 Aug 2022 14:50:00 +0200 (CEST)
Received: from atlantis.home (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 9 Aug 2022
 14:50:00 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, Stefan Huber
	<stefan.huber@oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>
Subject: [PATCH] hypervisor: Add -ffreestanding to CFLAGs
Date: Tue, 9 Aug 2022 14:49:50 +0200
Message-ID: <20220809124950.42931-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=S3DVwspq;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

At the moment, Jailhouse is - by default - compiled with -Os.
Nevertheless, at least we should also support other optimisation levels,
such as -O2, without breaking anything.

Turns out, if we compile Jailhouse with -O2, GCC creates endless loops
inside memset. What it does - at least on my RISC-V port for example -
is to emit the following code for memset:

   ffffffdfff00a6be <memset>:
   ffffffdfff00a6be:       1141                    addi    sp,sp,-16
   ffffffdfff00a6c0:       e022                    sd      s0,0(sp)
   ffffffdfff00a6c2:       e406                    sd      ra,8(sp)
   ffffffdfff00a6c4:       842a                    mv      s0,a0
   ffffffdfff00a6c6:       c609                    beqz a2,ffffffdfff00a6d0 <memset+0x12>
   ffffffdfff00a6c8:       0ff5f593                zext.b  a1,a1
-> ffffffdfff00a6cc:       ff3ff0ef                jal ra,ffffffdfff00a6be <memset>
   ffffffdfff00a6d0:       60a2                    ld      ra,8(sp)
   ffffffdfff00a6d2:       8522                    mv      a0,s0
   ffffffdfff00a6d4:       6402                    ld      s0,0(sp)
   ffffffdfff00a6d6:       0141                    addi    sp,sp,16
   ffffffdfff00a6d8:       8082                    ret

In the marked line, we end up in an endless loop. The reason is that gcc
recognises that we're about to implement a memset, and tries to take the
shortcut by replacing our implementation by calling - guess what -
memset. And here we are: endless loop.

I don't know, but this could maybe also happen with -Os if they change
optimisation strategies.

To avoid issues like this in future, better add -ffreestanding to our
compiler options. I wonder why we were missing that option in anyway.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index c475b8fd..b35809f5 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -32,7 +32,7 @@ KBUILD_CFLAGS := -g -ggdb -gdwarf-3 -O0 -Wall -Wextra -Wno-unused-parameter \
 		 -Wnested-externs -Wshadow -Wredundant-decls \
 		 -Wundef -Wdeprecated \
 		 -fno-strict-aliasing -fno-pic -fno-common \
-		 -fno-stack-protector -fno-builtin-ffsl \
+		 -fno-stack-protector -fno-builtin-ffsl -ffreestanding \
 		 -D__LINUX_COMPILER_TYPES_H
 
 include $(src)/arch/$(SRCARCH)/Makefile
-- 
2.37.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220809124950.42931-1-ralf.ramsauer%40oth-regensburg.de.
