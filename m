Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB57EYTYQKGQE4WBDWZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 2324E14C6CD
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jan 2020 08:21:28 +0100 (CET)
Received: by mail-ed1-x539.google.com with SMTP id ck15sf11928287edb.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jan 2020 23:21:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580282487; cv=pass;
        d=google.com; s=arc-20160816;
        b=dGDEkfjOitslOXxjP6q9V6Jfm3ZfQZDB6WpCYjOJBKBjb46v/d9qz6vFlTv6REdZoo
         YSwSNQLTPrTaCgwBn7Hwhw/1Hj8cxGIkyt8//o7rPS4tJYi/0ONb7NAUmzbim8iF++TV
         b4DzPIm/JOiu4nltTtSEt1RJFtkYGj+ffH7HQfrXNPwyDT4IPhRNALd6zKeN58UO0+ki
         m37/pXmRn58EbP4StE5O/8pEASnM8zTEYe9Ne5NwMoV7ew7TG3wC04HY8EjlWGi8ABED
         H5Fq9GX6OxtLhumUwz2pglJVLD+i4CjwzrInaNCla//a4nU9UoDceSVenASBgJkb1Itp
         xQcA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=zkZ33AYfyBvllFcSxnwMzfnBWALp+czyFzgXh19SEMY=;
        b=djLDBY7XeBIy46yqbdA0rEKjUjuefxvcY986vI2otmHqcBILUq6EHH5XXSVd5I7tWE
         fNIgsZxR8LjDIMXOzSaISIuRnD69W0U1N8m/LJB6155b0w8jDAbQiXvRf/0VAox/p9Vs
         OnU/69OWT/IzSR932WqitpxiczAsyMy8z6oYnDXcPdyE2HTYhD7mmcAJLA+mdZjsQF6a
         MBHHSmOoKWfS7AK7333s+pXwTctwXnU3HdIef+pVNuR48PBlsxe23tR1guGArTCOWPeQ
         6RVYjF1oRU6XDr4PPRxgsof81SYAKlvat9YU7cY3sjiOMtfyyqr4i2su51fdL2LbXZPk
         CoAw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zkZ33AYfyBvllFcSxnwMzfnBWALp+czyFzgXh19SEMY=;
        b=BlCZkALevryGXauOA4YPIOxbF3h83RO6RtxV+drl0CfgNo0hjfnhmtR/z3W7xoC+GU
         X2o65RnMsWjJrrRwpnfvpH1nz8VVGBZqhnAtxepBBmiVK1mECNDWyJTo+KSpYv958PZh
         5ASBCiSb8B0FX4e/iOXq1vQopR+ps5/4QETW7j0MdZqaUC1CfViYfcL11PeWVg2fSAyB
         Um4f5nGweEnR0vWb8aL+H1SyqbLsRp0Pte53iv7kv213Nr/vqL0+iUXD9/6nridN78KF
         3vWL58cahCoHRgeE3shL6elxzBC473WJYIjTAs9sOY+JoGTrbO1s7gM8cdn8tPf+aZFV
         Z2Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zkZ33AYfyBvllFcSxnwMzfnBWALp+czyFzgXh19SEMY=;
        b=B/LeUcar7dSafYp7UA3HML/lfaEA17I5KMwRVqf9p6ofeCIItGF4UHW/aYtCQWMmgE
         R1qcvII7XTF+TgLwtA5LUCkohsCPkVpLz9+1Nguca28X9Rnbp8zH12p2qq3tbdEBibFE
         uVPkaNTwxZmMpBobMrFrkC2GdC/D9oiLtbYhUNA6ikt18yJJCwqZf2FPYYbFcP8q62fa
         KoawM6RUYD/Rd+PscglEuHIpdXqyYQ+f6RB0ehnvuVCFlfIi1YFzqYauy+QRNiHQZeAt
         cvuJknkg1+JJdsEsRoGvQaJp3nUvSCezgj3+U/2B9diHkXYrsB3YkFW5CZkb2JY3UD6e
         Poxw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUKjPei8U4cRYS/tFlyVSwGTfN7gZUeWyUm01bd0dFPVnJl1laM
	V34q1w/tt1WPyI9/0n35r/E=
X-Google-Smtp-Source: APXvYqzkwpNOgH7CsS9OKNej9yYvV353avDyea9WEXUgOL2+3jRZWm3jS73brxGP+VkfsSSVcP+Bzg==
X-Received: by 2002:a50:fc05:: with SMTP id i5mr4392758edr.343.1580282487797;
        Tue, 28 Jan 2020 23:21:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:d9ce:: with SMTP id v14ls5399876eds.5.gmail; Tue, 28 Jan
 2020 23:21:27 -0800 (PST)
X-Received: by 2002:a50:93a2:: with SMTP id o31mr6759731eda.160.1580282487078;
        Tue, 28 Jan 2020 23:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580282487; cv=none;
        d=google.com; s=arc-20160816;
        b=OY6W83dFTBHVfafpgtnQNqLivRt2le4RYmZxLdynuqtxkcF0LUkgEhKL8UptHHbn9s
         EZEKU8AnfRLW0bnfCE0rGPf2tFNmyTMyzySosgb5GVWP1T0BNkluYnRFsZ0GaCfXPmBK
         ikg44JzNlkaL4NFK9990XDWyt4WN31tBbZFEgniEZbltPLHyWmSGpgbIh7Uq7eq0fqN/
         1Uexh6K8PnHQMHckniQ2KtAyxsNt4WRaD+N6QcPnkl8/WGcGLYUU47fr1Il9CHeuQ0er
         EaDz/gBSIjCLxuKLZkz4eR42FaAIvO9E4RHSMU0OSWMYryC/ODeFilVWpWc60qtnTeHs
         gDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=kYBeVy+Ph/Bq/EqsjXW7D9gJZU/kZCBJHoTlHEG5/6I=;
        b=Hi4HkFnFsvWGI8o0Tnq04GCt1XhoenjUwclH9e33fXFEFXarHVrFTC4o1HP6wEFGqa
         HqZHpY9Nep4aSmlD7s5QH6Xty2OSSylD6+4kbzXSdFlFzxe2lBBZDjGvArf9jcRHCdHx
         HLRjkUrWZjhJZkcIcEynKRJ8nsXvFhDoNkQKhnKcbw620lRfg4mAR8r+upOGDaJEDLQI
         JVJORzmXuDI/gLwmiA3FUUkV/u2Lc0GHZ0ZGs2RKVh6UmR+iry4vPPYzgexBTf02OcD2
         /Qi/5F1KX3fvHNSvgeLyrZ58F3AC2lUpMrV8FE+lqQJ8nDBCdAWLmBgUJZCRuKi+2yeu
         Yqyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id ba12si37833edb.3.2020.01.28.23.21.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jan 2020 23:21:27 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00T7LQbG019636
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 29 Jan 2020 08:21:26 +0100
Received: from [167.87.12.131] ([167.87.12.131])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00T7LQqZ019177
	for <jailhouse-dev@googlegroups.com>; Wed, 29 Jan 2020 08:21:26 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: arm64: Remove vmalloc from command line hint
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <472c9366-b584-e3d1-98a6-c20a3ccc16a4@siemens.com>
Date: Wed, 29 Jan 2020 08:21:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Not needed on arm64 because it starts Jailhouse differently compared to
arm (tk1).

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/jetson-tx1.c | 2 +-
 configs/arm64/jetson-tx2.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index 60ed2630..c9dbec87 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -12,7 +12,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  *
- * NOTE: Add "mem=3968M vmalloc=512M" to the kernel command line.
+ * NOTE: Add "mem=3968M" to the kernel command line.
  */
 
 #include <jailhouse/types.h>
diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
index c2e17e67..58f7d488 100644
--- a/configs/arm64/jetson-tx2.c
+++ b/configs/arm64/jetson-tx2.c
@@ -11,7 +11,7 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  *
- * NOTE: Add "mem=7808M vmalloc=512M" to the kernel command line.
+ * NOTE: Add "mem=7808M" to the kernel command line.
  *
  *	2:7000:0000 inmate (size: 100:0000 = 16 MB)
  *	2:7100:0000 hypervisor (size: 400:0000 = 64 MB)
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/472c9366-b584-e3d1-98a6-c20a3ccc16a4%40siemens.com.
