Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBWNM2KDAMGQED53DPQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F373B314D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Jun 2021 16:27:39 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id v5-20020a05683011c5b02903cb28b38d0asf3517343otq.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Jun 2021 07:27:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624544858; cv=pass;
        d=google.com; s=arc-20160816;
        b=PucTAckp5aN6PfDCPdTQTTD86UMHJxn9LoeuHkzyAlrmwSDDM8k29Or3fl0hy03YV7
         PQkew8elYg8f1It33QUhdSM9h24MLtauUrfYBlDeud0xGGjRfSRqTFf+VpAYIGEQj+/a
         G2yrMt0bo4HUOrW5pqgNmfqGRB//yEQqA0u0YNVspyJF5HyciX88RB1+JFomK9Mmhl68
         FfSfXDZnRBKK7DMTYvlxN4DTDIle5/OtvBnILafHxQh+mvaYUmB0kPziq3x2J0Lt0P4o
         iI8nQT17ZV7ub2DcMEP1yRqCzJtNY8GyO+64ej+m4QMR6yqucsE480/Gp4EOgpWDqbvX
         1hXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=q3Hy/GpM21pgl/TYinj8Sxg0UmgOXQYZkBs/bwlTEvU=;
        b=ThKXoxkL5kMHrz5LQGCae5voJJHVoJbAVvZuULXae7xI4HFJaEIZHpJrG/77ppPpaG
         P2HUBxWOQqPeO8euzEz9TEOa2AWhXNt+qKOTcOpyOITA7mvvfR2XD/HZl9y8RwDDWoEo
         rTC7Q7lA/ZmWooldHd6q8m1u69vT0SNnPNoxBH1odQs/I2TG+PqZodEtWGcThGzgcpCl
         1hXaoRDk41kAuAQx82/ZifW22FeggBzKy4E2bpK44huAyNsuQ+VIzB2u/AowltR7NX19
         /JMSfa2ZysgeARRDo03MhNH/wFIXwxsOTZKURa2n0nFaJNFeSIQpOhWq+nInthj+VeiE
         hsFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NIRz1B0n;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::442 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=q3Hy/GpM21pgl/TYinj8Sxg0UmgOXQYZkBs/bwlTEvU=;
        b=OLjsVt8VcwVmJ0sgAoQ5SUEBf5wjuA0gmXyGtDLPNr1n1pPvuyqpuYA6qtb65DB+rz
         3IY4lpP1W4MDBl8vyaJ2jClW4jZxm4Ox4zPa1a5FPveL5tTWn1+sHHKpugxAXadbfFZp
         Xjs9nUNUkkxomJ+50kU+XUmFkV0I2JRd9msZ1YpSZe48zk2VdKj0VGyYrOasl4fHuCoO
         cjKkrjS82zBIQXtkj9600dl66RBbM98DLjieyHURRlXyBgOhafMCR+vWvo9WcLJIylsn
         2gJkqoa9xk+IvdAUjJmPI0Y45JnkFy0JQiZ8jxThGHO+b0hQegXpdVi/LhM+HROhgsBP
         sYoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q3Hy/GpM21pgl/TYinj8Sxg0UmgOXQYZkBs/bwlTEvU=;
        b=FRLRYWNau888q5GA0Ld35uKYR3Viwst2Y+2SJkHPUxjG33ZSbIDuG0tekr4sG9OpAD
         ogbDHq8g6EGBTIhlfLPFlc+mEKbTgsMXlfgIlQ9PZFJHuo4e2JfhG8naSwWtOizQs9s3
         /Gi8vda2yw7Lvj6mTUviXSuIEcAf/yKGCcXESo4LKs8xoFx6izU3oabyPC7vhJkGrkNP
         o1RATS3wHYomCaU8my/TCFoZrNZF/XiuJbcoHayI7/1gHdhEfNRvli1Ce6JtUGgXkCkt
         LEna6HHd3mKRIL1VFn04EE5w2zwoCufWbqkSXkepWWtnVs6+6tg79b8nKW2SN5qwUwPM
         v3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=q3Hy/GpM21pgl/TYinj8Sxg0UmgOXQYZkBs/bwlTEvU=;
        b=EZLGv6n6G77cGPAAe1jivPxQZhVmcG3yDzW/CbMaJMfmp5+oMIJbQVl2fq2Y7F6/OA
         gJ/qhnGkb7miL7DYM1LuvMap7+hWREcQryU4vU0cxAEfcZFXLbVC7CT9UQBwfh9/4ocr
         NvqQfA26CJjzsAM6FsTq/LPYCrqHwNiwxxx+Cv/wowK797p+9wbpoI9WtbWPHh5lH3C5
         6jlD9Nj1CEkiyE1uuEY9tESWuZrBP1vrZ5LEOm4EbQ47q77qFLdsokLS3qAxDVCGMyw7
         bo5B+KgpxzG7/VxTb6xRxAnwX3J+TzWGVdVrXx3KdrVqORY/tUzmr+/aseUz1QhgWZGt
         dSLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532UNAgtCAbqUYz4zm6yu+e2harUpHlAC3C08G4NQIMohKrdcgNp
	qzocbp806X31Ah4kZVi5Y1k=
X-Google-Smtp-Source: ABdhPJwxGo2u9OBQ3XloawDQLP0RPqOVwQDy8L+/GufBF/zKswFYq0W+JF/dFxE6Ahj+ehZUb6692w==
X-Received: by 2002:a05:6830:15d3:: with SMTP id j19mr4716494otr.51.1624544858019;
        Thu, 24 Jun 2021 07:27:38 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:3807:: with SMTP id f7ls2356165oia.10.gmail; Thu, 24 Jun
 2021 07:27:37 -0700 (PDT)
X-Received: by 2002:aca:c6c1:: with SMTP id w184mr577114oif.5.1624544857643;
        Thu, 24 Jun 2021 07:27:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624544857; cv=none;
        d=google.com; s=arc-20160816;
        b=suVQPguHtttLeq24TFNfxrxrYyVcP+tIF2EO+BnygESFa6zcASWG7rQXY2myMIsMlQ
         olI4tbKzxykh5Zq6KvbhZiYoxsiQFTOfCxLN+wTMFl8PTbiVl3w0pQpW0fwuW32CzmlC
         TmXOqaZ8VHPnm5Jpx2tFLNe+CK170hlE9gWwDUAamKEU1cBTJ2lQYvw2bqRKT4A3W1DC
         of2DFJx+6yXEuS9VgE9h2fwfHdH9Zu5LBYSEv3VapZQNYIoKRcHMhvgrN89fHLONoXpr
         NvB/AmEnxDrohPQcHUbRPJdy8BYECLxToSYMoYZ3Xk/HgUaNQ7oG/Q57vPWd4ARXYkKl
         FuHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=Ds94W34FbPXaqJkKxDgIlr2SnCvEWqdgjf8aFCfJd0U=;
        b=u3VjxZI/5MAEuHsrKwKW1x3tTW4wohy3ydHOVdMw7l0v7aKvlBD7DIKpz2vm5Xn/q1
         el4DSWUd/uogJPuk6m7Vsu97Z+woJQ/CMv1VVbOQEAT0j1fuU5U3FDyNaLIFO8IEk4hn
         lIY80B5GYHfMLXW7Nq2KayKUvayc404yH5gTjcTKsx+Ho6Qd6CcbZH2P3NvhmN6Zh0n3
         0XjM+amM6JJPXd8eXqjnSRGisgX4HcIQCV16YzQSCHz0CKUe3CfbYMNw7PhpQBmyeZL6
         2/tMEYbXEWSWmpdAPgIAypFJxyHh3cajcdBpPIcJ9gW8Ks9qKSN4ui+5jLrptlKaiWEk
         jnWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=NIRz1B0n;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::442 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com. [2607:f8b0:4864:20::442])
        by gmr-mx.google.com with ESMTPS id x71si220410oif.5.2021.06.24.07.27.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 07:27:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::442 as permitted sender) client-ip=2607:f8b0:4864:20::442;
Received: by mail-pf1-x442.google.com with SMTP id t32so5318097pfg.2
        for <jailhouse-dev@googlegroups.com>; Thu, 24 Jun 2021 07:27:37 -0700 (PDT)
X-Received: by 2002:a62:bd1a:0:b029:2fe:eaf8:8012 with SMTP id a26-20020a62bd1a0000b02902feeaf88012mr5272192pff.45.1624544856747;
        Thu, 24 Jun 2021 07:27:36 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id j3sm3186398pfe.98.2021.06.24.07.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 07:27:36 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>
Subject: [PATCH] irqchip: Avoid set irq target twice for root cell
Date: Thu, 24 Jun 2021 14:27:31 +0000
Message-Id: <20210624142731.30102-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=NIRz1B0n;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::442
 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

When enable hypervisor, it is no need to set irq
target twice for root cell, otherwise it will waste time.

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
How to re-produce this issue
1. Make below modification as shown below[1]
2. Run the hypervisor as shown in the log[2]
3. You will see the added log "cell_added_removed == &root_cell".
4. That is to say irqchip.adjust_irq_target() will be called two
   times in [4] and [5] for root cell when hypervisor initializes.

[1]:
diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index a3245846..48973d06 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -510,6 +510,9 @@ void irqchip_config_commit(struct cell *cell_added_removed)
 {
        unsigned int n;

+       if (cell_added_removed == &root_cell)
+               printk("cell_added_removed == &root_cell\n");
+
        if (!cell_added_removed)
                return;

        for (n = 32; n < sizeof(cell_added_removed->arch.irq_bitmap) * 8; n++) {
                if (irqchip_irq_in_cell(cell_added_removed, n)) {
[4]:                    irqchip.adjust_irq_target(cell_added_removed, n);
                }
                if (irqchip_irq_in_cell(&root_cell, n)) {
[5]:                    irqchip.adjust_irq_target(&root_cell, n);
                }
        }
}

[2]:
Initializing Jailhouse hypervisor v0.12 (273-g6d9c51d0-dirty) on CPU 6
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 87/994, remap 0/131072
Initializing processors:
 CPU 6... OK
 CPU 3... OK
 CPU 10... OK
 CPU 8... OK
 CPU 0... OK
 CPU 4... OK
 CPU 11... OK
 CPU 12... OK
 CPU 7... OK
 CPU 1... OK
 CPU 9... OK
 CPU 2... OK
 CPU 5... OK
 CPU 14... OK
 CPU 13... OK
 CPU 15... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "qemu-arm64"
Adding virtual PCI device 00:01.0 to cell "qemu-arm64"
cell_added_removed == &root_cell
Page pool usage after late setup: mem 144/994, remap 528/131072
Activating hypervisor
---
 hypervisor/arch/arm-common/irqchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/irqchip.c b/hypervisor/arch/arm-common/irqchip.c
index a3245846..256af114 100644
--- a/hypervisor/arch/arm-common/irqchip.c
+++ b/hypervisor/arch/arm-common/irqchip.c
@@ -514,8 +514,10 @@ void irqchip_config_commit(struct cell *cell_added_removed)
 		return;
 
 	for (n = 32; n < sizeof(cell_added_removed->arch.irq_bitmap) * 8; n++) {
-		if (irqchip_irq_in_cell(cell_added_removed, n))
+		if (irqchip_irq_in_cell(cell_added_removed, n) &&
+			(cell_added_removed != &root_cell))
 			irqchip.adjust_irq_target(cell_added_removed, n);
+
 		if (irqchip_irq_in_cell(&root_cell, n))
 			irqchip.adjust_irq_target(&root_cell, n);
 	}
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210624142731.30102-1-gengdongjiu1%40gmail.com.
