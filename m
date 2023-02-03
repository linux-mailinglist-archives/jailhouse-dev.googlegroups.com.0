Return-Path: <jailhouse-dev+bncBC4ILIEFEIINZYPVTYDBUBEPCKWR2@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x38.google.com (mail-oa1-x38.google.com [IPv6:2001:4860:4864:20::38])
	by mail.lfdr.de (Postfix) with ESMTPS id 680CB68A3AB
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Feb 2023 21:38:54 +0100 (CET)
Received: by mail-oa1-x38.google.com with SMTP id 586e51a60fabf-16a0fafd9b7sf587472fac.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Feb 2023 12:38:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675456733; cv=pass;
        d=google.com; s=arc-20160816;
        b=JifTeHvBCoMKZcGNHAv530sFqwHzMivNfqynpMlq6C8kjwSQlyXd8RaKWj5YConDKk
         cSrRKdAR237ZJm/683RtDFSNPE0O0Q26DQf+DV0kBUBa52cctzmhkHbnpieFs20ev2BE
         O1Hw3Go9iB7/w2BF2Udyd5TBPnoeFzyhO8KjeC9rhL9G+jRY1AYqv1nFcn68D0uVqxTg
         0oFOhFB9wBk/QvRUBmztTL/ZHlU/S+w7k2ev3uGe1VfBg54pXcovJ9hyTRAQ4z8wBLrs
         bVSiBsTTz9qslVVbxsYiJXI7jfkzMlGai3mrE+IblhT2ozhxLAVSO6HKTPmYki/z5Di4
         kEkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4QK7pLLrWLcKQJU5c6oNs7NpARJEAc5UwUWdcq1EtHc=;
        b=IkP1dPlCm8VuHOqY7q8g2dmLm5uI5kmdCmsmrlOmE0TJxWWwiqZHVpZqozTudB8HXk
         7mw41apaV4G0WPzkEjmbf9s6xpb2hZTANL+CV+vjTGtFB6vuQRy9f+krmJmT7q9SJNFN
         O1zNue01HY8Id/aSVS2BL+SirIe0Qzk8mUc6mTRnYYJ2nPJhteJoqppVHZUh301ZmXK8
         sFYilUxdyZIxSv9spFgZU2NIfx+wDoMXtLbJllNYn1404MRoqzmZDlLP7/KzNv/oke0b
         z6qmjR7jqFluTYnKVVyYPg8Uuy368Nd1y/3VE+hPL6ZDha9rY534MoKzcm2GmdX5hsep
         Dd1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=WN5gW1HA;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33 as permitted sender) smtp.mailfrom=ricardo@foundries.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QK7pLLrWLcKQJU5c6oNs7NpARJEAc5UwUWdcq1EtHc=;
        b=GlajiYerTKWN1kAY3aKlp/zj9UnBlGnPX5VbWsfq91wcWDZLrFCAGHB+wNLJfrMAkB
         v0kLrewejwOJ6AW8UQzNhR4cUPqapNgSuSMidoFizAu3Za8wFQEgkVAZA6iODoDdu2Is
         1syRz05vxCnl2QepSLoge40T1DVqgNthKz+LadcPYscFxtpdryaVc1FejxDUwGty/YnY
         /cam5cSuSv+r4R2r5kaAVCYtFhW7HcvqRnUrXyB+quurmwkXDE5FM7qMOdFFzPDgN/5u
         Ta1VGMBTjN9S12HLnT7476apEegtP+OOqsP5j/B29bz/mvID0GffPI1IOsCO9tabDVL+
         p0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4QK7pLLrWLcKQJU5c6oNs7NpARJEAc5UwUWdcq1EtHc=;
        b=AY7jsonuT7vlgaymU0r/bEyt1r9isN52IcSGMjxP9rFGKF8QYueVnVtZxfdFC5dAPh
         muo9xUUQH3tYWoPNWmK4RZDRQMqhneOpDOgDnHW3fGdnpSe3EfJuK5UOM0HmPNAVNPbh
         Hb3RAO+LTcGsnq+gaPVfnWaqFeQS3TZXDtP4d8KicLDOgymHgFateoKrzFbuDDtUtc8E
         ckGXjB4Tt6+Jmo6U0Ju0LU931M7IC99FqXZNQEKuRu/XIBsrW36Fwi4ojPfG5bdJ1fjt
         XkyDa+Vx5NpeGMep42OOh7kC2i7+7BdhkZaBkTCQUXzWr6k0EhWXSt5hzt5t28ZH6VIS
         8gUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWJnkC2PQwRpfiQDfCLVQQG1Dwcq1zGBmx7OGuSLwDSXcBnP6lM
	d6jzKigKbrp3Y+zLwmRJJs8=
X-Google-Smtp-Source: AK7set+3CWEKmCbpJj4kJwKyayacs7esNMTyQYzjzOtQyUgUS+NimlVLB3lrx9cGUaommQI7LR0kDg==
X-Received: by 2002:a05:6808:16a9:b0:35c:af0:485c with SMTP id bb41-20020a05680816a900b0035c0af0485cmr503189oib.164.1675456733043;
        Fri, 03 Feb 2023 12:38:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:6143:0:b0:378:5e56:83f3 with SMTP id v64-20020aca6143000000b003785e5683f3ls542158oib.4.-pod-prod-gmail;
 Fri, 03 Feb 2023 12:38:52 -0800 (PST)
X-Received: by 2002:aca:e0d5:0:b0:364:5c9b:5f3c with SMTP id x204-20020acae0d5000000b003645c9b5f3cmr5631944oig.4.1675456732460;
        Fri, 03 Feb 2023 12:38:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675456732; cv=none;
        d=google.com; s=arc-20160816;
        b=pjFWSsfen07bH0ckFrAmfQ7XEKdRmByJdZFpqPwIhsGoeVZDOxhj4MYKgpBzYyZtgb
         Ik6YDc2hgKHExGjSIdKSXwErxgk10/OZjvMAI3qS6TkJ/KshcjlAA0txAgyMOsJJPuYY
         kc0Lvto4S85nS9i55KKsWRErbU4eYhPfvChB1VtuF1XtOUKtk6HXCAkZAjL+ZoWrWhN0
         1022az+sCraugGYtbX/5i4Ze5x994Ytno7mOEn2pbLy9cwdLRvNQzyO2/bOnfiR8P0SJ
         /o8eO9c88HbzIT5tA5nm46enNcFFQYTeNifsG52aXT2/vhZlLqUHkAY5n1/tWCUv8wDz
         AmgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GjGOntGUkX0GP2KLsk2XzM7Rqrn79tHF4BH8CuP/3q4=;
        b=yKgeRfzg5D1ZAMsXEPD/ryUnGSPgrlDSOrvKrc4mt55+HzYKVlJyg7xxxWFiadL3X8
         lNOKf3a1uouo/RsSAtKkrF896/zwOLSxdV+NFjkybAi4tlvN14hvA9ROfKxx+Tie8KqW
         B+f9bW2qeNYInE0VV1yPGNtmlX7LzG1MEp2M5LGjZCaImN3KKrdO+q8IJrgFaFA0BjzM
         hypzAcfjLfEiJczY6l83ijcNSywhX7J5zq+VlZHM8UwiFGJTSZDfeawpiV/lKKDi+8Jx
         L7psIl6L//V2Nods+YV2enrkEPJzONwlCnH3xaAEh9n4E7xO0xpSH0A85IgJxi9hAn7z
         8eEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=WN5gW1HA;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33 as permitted sender) smtp.mailfrom=ricardo@foundries.io
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com. [2001:4860:4864:20::33])
        by gmr-mx.google.com with ESMTPS id bd25-20020a056808221900b00378599bee7dsi466724oib.2.2023.02.03.12.38.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:38:52 -0800 (PST)
Received-SPF: pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33 as permitted sender) client-ip=2001:4860:4864:20::33;
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-1636eae256cso8136258fac.0
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Feb 2023 12:38:52 -0800 (PST)
X-Received: by 2002:a05:6870:b294:b0:143:81c0:335c with SMTP id c20-20020a056870b29400b0014381c0335cmr7555846oao.0.1675456731410;
        Fri, 03 Feb 2023 12:38:51 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:badc:845d:dfac:d1f8:a7d2:47ed])
        by smtp.gmail.com with ESMTPSA id k7-20020a056870350700b001631914e41asm1197748oah.33.2023.02.03.12.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:38:50 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	dannenberg@ti.com,
	mranostay@ti.com
Subject: [PATCH 4/4] configs: arm64: k3-am625-sk: Add GPMC memory region
Date: Fri,  3 Feb 2023 17:38:31 -0300
Message-Id: <20230203203831.46311-5-ricardo@foundries.io>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203203831.46311-1-ricardo@foundries.io>
References: <20230203203831.46311-1-ricardo@foundries.io>
MIME-Version: 1.0
X-Original-Sender: ricardo@foundries.io
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@foundries.io header.s=google header.b=WN5gW1HA;       spf=pass
 (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::33
 as permitted sender) smtp.mailfrom=ricardo@foundries.io
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

From: Andreas Dannenberg <dannenberg@ti.com>

Add the memory region for GPMC, used by the AM62Q NAND card.

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 configs/arm64/k3-am625-sk.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
index d6096e8f..230d6a4a 100644
--- a/configs/arm64/k3-am625-sk.c
+++ b/configs/arm64/k3-am625-sk.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[33];
+	struct jailhouse_memory mem_regions[35];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -225,6 +225,20 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
+		/* GPMC */ {
+			.phys_start = 0x3b000000,
+			.virt_start = 0x3b000000,
+			.size = 0x00000400,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* GPMC */ {
+			.phys_start = 0x50000000,
+			.virt_start = 0x50000000,
+			.size = 0x08000000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* CPSW */ {
 			.phys_start = 0x08000000,
 			.virt_start = 0x08000000,
-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230203203831.46311-5-ricardo%40foundries.io.
