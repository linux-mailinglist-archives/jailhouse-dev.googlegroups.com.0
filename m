Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPXTLTAKGQEKZELSBY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB98DE74
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:54:53 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id g6sf12355403wru.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556528093; cv=pass;
        d=google.com; s=arc-20160816;
        b=nb1SyFQtSIMBE4ILkL5oiipIzqeMeorh/idxgI5AzHaXP+zsQ6iTLPJB1NbaY1r0GC
         I5Z7AceOmNqnXH4hhbwL19hxpfvUeQ6WOtTiko/o8AoyKcvxRgMgJzt+q3JYFokYvG0c
         B4fH8XCMnclcXJGKgnTXNC8QuD5+LSwKi+IEvYrBSW3IC6XTVSDlkdorOsuaQwEjMviu
         +alZl39v8pkoGHSrQyQFc8jsaIWPgAX41NQ4hdEfab/lwvcadwnCLRASzwTkm8d041rr
         +yda/zSWD2ecwBoILvSyEcBhscFKZ95JP9xP/3xpxE5ITKLhO8pkP6qX1O02OMPjEDtj
         YM/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=ioe49Uy9t+S2b9gBWW5kopdgu5rIVqn2JZdModh1HaE=;
        b=vt1iscK4/JXgGngM+9odqiVN0CafpJJ+clpOWY5o/dILPxszSJkKDNslUSKu0XRL14
         LMEQZF7ctej/Yg71ormu33F6qdB5CSh7Ach6LMNnwzxJOffiobL0Z534zagLpwn0lWss
         urt03qeLlQZE2Jz/Fpnl8GX89DX3yfbEa1MBY2YXXASJJExM5YHSf0u+RsoEBjmTKFdT
         1sLfB9kKkjpksG3bVbYBB9JCdmtjdsuiG9b9Q4fbiwHo51/bLb8L0yITRSsPXeapz66p
         3mcH1efwYoHbLEMaAlR7pB6o5d4aTWLW+finDzbCBokzIeIHUhNNZ65nP+frbDmmQbEj
         0GgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ioe49Uy9t+S2b9gBWW5kopdgu5rIVqn2JZdModh1HaE=;
        b=AZ0pdvSlUyf5at9FBaxUyQzXlUO2ILkoXTw6chnkJEEiKye/+Uiju2mzkhYxSzf+oF
         ZR6lldSwm4L5Sd2pevomzHfPo1LFVtPMt/OG3acuB48Y49LgnrYsk7jLKxAbDZ/wfDsr
         rzW6VbGaQvvFEt+NDm6UklsZ9mH/I6kEnNCBaeCi8UG8M9SUM8SL+JN1w5itNOWAJ+/5
         yOCXCBIVtxd3XY1cqFv6ZTEn0SvoqsFmqrRNgdG/umEOhShuxZnpkLM+SxPwWlpTc38j
         p4YPSbDXEAoqnTyejiN/GJz4qhQZ7XhOgkIAdzRpFNgfXjb4ta8yAl64N+fh6oG1Ds27
         TRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ioe49Uy9t+S2b9gBWW5kopdgu5rIVqn2JZdModh1HaE=;
        b=itut+dqgLffoQqxdr3WrhfgVPo+Arpsr6ngNnpi2QlFYqmRzlXh0GPsjVF+T5SwcNH
         0JKrKFKZQqZFVS6t9yFRcfj7r8UJ2nPbYU4qZ/vY/dhx076hbSOpbXY+Pa73zEOMVR/0
         UIogjX/vOIQ/V88JufUu7gaLlVaDfXE9R7Do1+luEdkyxBKWQ2MDHNHqTlAH6gfXf+XS
         3RXG8Ht1oXY5Qbr8oBpHSY1P+nO2O/urHPWYjcK6wJa3UD25EY8ydpEFihoiclNGFz2e
         z/XVr2yvktdtLpsA5PJpRttpr1AZQmhc3RQ3thRhrOlzmTi2+qCBF+GhruU5hcWA/WFK
         xs/A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVuLGEM1j25S2yRy09Rb0AXnBqq2bABqeCLkCwsGkh7zywaZnC1
	sntW7gxuu2lsVIm1MuinvyQ=
X-Google-Smtp-Source: APXvYqyCiyVM/S85tHv5Bj7CxpsJmHyCHeKLxILFN568aUWgb5PTibBYUGXlAxxKDxoIugGKTPgglw==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr2387641wrm.91.1556528093331;
        Mon, 29 Apr 2019 01:54:53 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:d84d:: with SMTP id k13ls6557270wrl.10.gmail; Mon, 29
 Apr 2019 01:54:52 -0700 (PDT)
X-Received: by 2002:a5d:434c:: with SMTP id u12mr41953080wrr.92.1556528092779;
        Mon, 29 Apr 2019 01:54:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556528092; cv=none;
        d=google.com; s=arc-20160816;
        b=YC9XBbeLjsxaR/ZrflhrV7JsP+2EDTAK4wAWkoof/vaP/lZp+nH8XL5ZepTiyxS90G
         c1iLqQfPJOfvMgY1TH2AOJeaGHgOfPB8AfbbDmBKrgN9AbUufXNUWsjaf34lxPv0YZQM
         9CSKCBzO3yZVMmBOXMwWBsv9taKIx3SkMI4IW8SoXoAKlYu4mXWnY/o1bVjbXUzsOIAP
         pHVUjeIIb9ONieiChmN2wix/vaVwfnlM5F30hMFGmBj5yi0wiDpcQ+E7iyOyu+ds13py
         96peHg2WOWW9AIOkhKF4HYEbnHI34YvGXH8/Pv53dBIgZ6POP+WEuICAJ8kCdHV4dtCB
         PZHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=iC7LILFSfgNAicLeXDV6VOYqcUGfWhGbk18OvKKUhNw=;
        b=Z0Da+qUoCoCIT6vyyhurqVvwa/RSbpp1X8iLa0X6cYFt6pOjYh5i2ZNOgVW6VhHWyq
         MPGTvxBv4zITj775lNNbB2XwSaJjRqY0Ruz9X6FWebpMvrvRmknhavLiVaJQSzLlHj0G
         HWOyI/O/Nf5zvMlbmk0lRYGoVperKegOti54CWZ/N59uEg26kTyTJkHxlFyhXCm2JLwe
         d9E82mhuw/ilxD7CUwTnqOGcXmM39yUFRt30S2/YhmsZig/4DUzX3UqSeIHC0Ff5ZgPo
         qlUPZ6PjkoUFOxMKbRwuayYemMm2OCEzJxA0epYL3W0PAlBlx/tQ2Pg4HwhSHQ97UfqO
         6RgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t137si1075811wmt.0.2019.04.29.01.54.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:54:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x3T8sqZw005054
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8spo6013612
	for <jailhouse-dev@googlegroups.com>; Mon, 29 Apr 2019 10:54:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 2/6] pci: Only call pci_suppress_msix() for root cell
Date: Mon, 29 Apr 2019 10:54:46 +0200
Message-Id: <a20e9b56245d64efd9d31ab442132bc9945517e7.1556528090.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1556528090.git.jan.kiszka@siemens.com>
References: <cover.1556528090.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

It is harmless to call pci_suppress_msix(..., false) it also for
non-root cells because it just writes back the config space register
content. But it is unneeded and, thus, potentially confusing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 000ee29f..89b35382 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -809,7 +809,8 @@ void pci_config_commit(struct cell *cell_added_removed)
 				err = arch_pci_update_msi(device, cap);
 			} else if (cap->id == PCI_CAP_MSIX) {
 				err = pci_update_msix(device, cap);
-				pci_suppress_msix(device, cap, false);
+				if (device->cell == &root_cell)
+					pci_suppress_msix(device, cap, false);
 			}
 			if (err)
 				goto error;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
