Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBK7D5L5QKGQE4NMQOXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F13283026
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:55 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id n133sf2801011lfa.19
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876395; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z5jwCUW90YbVsDGw+1J8GP7cfMSC8IdIcBU7zKmsL0L5ysnJbjMkHFZXseXhL8zBWM
         kKT+MhyBeXZOCbaJSfpeRjpJOQwy1jp0VGkm/Cp+guH6zunOZvVUKJSQBVxC0pbPOiUq
         0/yjX75aIIlHByDh7eVE5QyLcjguRhUhUoiqqd/H5JwyncqYkCQ5yZM8y89zghhnF105
         T8j+zJnpL1hNtinGRIAB8XCJT9ovrWl5mFCNWkNwl4ZFntZ+CsiZ1kKdAEkGKPEM7DVd
         fsTlg1UVdLlSkczlY5uty00IM1MNogmskkkx4XGP1QftuE0hMrQX9usm9ZwpFXJHLFfJ
         qV7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=b0L3oMRaCYktgen+WAWJrlalF6+V7oiMW88+VNdOwnQ=;
        b=neYS64uWUE+fmAQxJBXV2KhjjzfQ4wDy6OS5eqQbnZA3SXi0DlVQia+Vl15vgaNK/q
         YU5avRRzivsHcN+PV4ca2Xj4VGw5JfPgHaGDnmAMVwAZVfOKCEr0ENSLZLhBwlPOy4+A
         GsVdlIHtH5gXQvC0ZpZUtFqUHS0STLLdm8GG+1dNapDnCYyFaR6Zt/qMz+bROWGptph5
         S7n4L+ykiJ/OPn64qFW3QZvdaVnQDnFQR+YuJxFB+U1rOCgcWWONJ2gdxNSZnXbrn7XD
         jKRBi22O3wow8liKY7VIejR49hTqZGzxPNs4Y5n6usVjXvlYy6ADmnK/jxXafwfsAlX1
         h15A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b0L3oMRaCYktgen+WAWJrlalF6+V7oiMW88+VNdOwnQ=;
        b=fJ68MGSmaolS8f9ROUCh6epsOw60OJoQgImvTuWsipCS00QBd+22HBNhvQNNjyGTtt
         R4v4UUnZ/6xVzKqGYaTDrvpzLDyCjZ1GtEK022BPD6YTvYuqfW+DW+DPo/RP13aSI4jv
         dhH+z6aSKSPzJtO2JraG42H1NMxWSBVGLkVCK1Mf/zDkNY9T55vP4b5c3BJJPcMktnbH
         vvKecKjmYouxCEaV75W0tT7ZsElEX0vIWMT1xDgkmB7K+0Y5uZH/1PFdZzG73CkkJObL
         RutgaZv5XxmmMVOx8okrNQHpBjLiOjakerSkHA34rUXmP3+Mdb8mTuwQ1f2GPfM4aLhD
         JCsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=b0L3oMRaCYktgen+WAWJrlalF6+V7oiMW88+VNdOwnQ=;
        b=KaxvH7G0oo8nwh4DrCbFEZCbViQJMNbTA695OUI+K7U0jbaudvtWfiimtimEdRCPHJ
         GFf8USot5CcSNya4vmnOWANLcKfrlQTYHd15+ZLJYFrBGFlqz51iRKP36S6TTPl8BIeT
         6HWc7I5ulVyGEGGDoC1h7o+MRFg6GE26CIXt3EU796OOH5WwSCkkM8AR0SqasKN5ycqQ
         suXwSmN00C/h0OCKPesUtQiHNlglCgWuikQMMK0jNnnPEga0Z7lXLthxUZPQVL2nhWyA
         6flv3JnqybCivNitKcnOfrX51Q/8pbVkvoTvMeMGB3PJry58tjGSs4PRd1RmxBhApAWj
         9Umg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532h3iF54yWGuTiL8kKFlL1xSaJk8DUmno9wNQPhiWy4y0XtXBh6
	UZlyE0KqnBY+Crvts9aIdkc=
X-Google-Smtp-Source: ABdhPJw75DyyL80sSmupq/pAKKxZU6+D+sh6f0suKb1gYs6KazJ3GGHQem6y2hlSTdo1/QFDycUw7w==
X-Received: by 2002:a05:6512:110a:: with SMTP id l10mr5390908lfg.552.1601876395342;
        Sun, 04 Oct 2020 22:39:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:804f:: with SMTP id p15ls208987ljg.2.gmail; Sun, 04 Oct
 2020 22:39:54 -0700 (PDT)
X-Received: by 2002:a2e:8846:: with SMTP id z6mr3616292ljj.457.1601876394273;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876394; cv=none;
        d=google.com; s=arc-20160816;
        b=om4xsRpLIsrRKHulYfNldFHFUCihZLFEQRW5mz20bRnCpmk2Kz3i9W8maKYld0hLWo
         91CZq19qHZUfvEbqkvT3mEZA5gaqf7IumyW7P+U3/WhKl8GZF7jCe6TZyYq9XX1QNKjy
         mu/sK+OWj76zp8sfB4a2iHbLEz0oAJwvoK5DyLMSm5BWHX7PEJgGZ5B8TV0jWRwCnloO
         wWDVdRHuFrjuIUiRq01T9SQvsqNbh7xDAVBGlu8X6ts874434Nzn0P0qcQE70s6a+s7b
         AcSlUM/KIS1UNW+UQmo8tWinwATEl1x7FDpeWn0DeQYEO1vWiVDSEClF8+xVAYgU9D8H
         0roA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Bs5/JctsqJCI3GT0OSbjPRRKp9tXObapzotbFlWfQMM=;
        b=NkbRymDHtKQ1NSJtOPSkPAFOAB2Cic1FmxA5RyW1Z8YVKWCWrUH3lE+0Mp94xDeaGj
         X2cqiV1v82lJcRzxQRFSfabrdqqNzfik6w/GEA3PuEaO6Y9ameQTprCFNJ/Hw9/78+13
         52WkHB5K1RLuuhb+QgKaz6F6/W39DDOfEmHfE0wavA/1yYuAe69lMtuqfvwLaGEkVxMA
         uwHZl4J+fZEf8CaIPK5RJuccz0+YDVppnSrBHbceFkcDZmEUaXYT51LIPWL93fpsbEuA
         CzphEHwcXuNhMLh8UsX+a77Bic5TQps2rD+1BEGXhR+hFDTPnJddPoIdi6eZVX5z3Q2n
         Bc/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f23si202688ljg.8.2020.10.04.22.39.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955drt9031143
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncL025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 12/19] pine64-plus: Disable initrd
Date: Mon,  5 Oct 2020 07:39:42 +0200
Message-Id: <18d0e5b2c6686e10abe4d10d2785f445e1703ec9.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Aligns this target with the rest and avoids that U-Boot may locate the
initrd in memory that we reserve via mem=.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 wic/pine64-plus.wks | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/wic/pine64-plus.wks b/wic/pine64-plus.wks
index aacca04..307e355 100644
--- a/wic/pine64-plus.wks
+++ b/wic/pine64-plus.wks
@@ -11,6 +11,6 @@
 
 part u-boot --source rawcopy --sourceparams "file=/usr/lib/u-boot/pine64-plus/u-boot-sunxi-with-spl.bin" --no-table --align 8
 
-part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024
+part / --source rootfs-u-boot --ondisk mmcblk0 --fstype ext4 --label platform --align 1024 --active --sourceparams "no_initrd=yes"
 
 bootloader --append "rootwait mem=1792M"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/18d0e5b2c6686e10abe4d10d2785f445e1703ec9.1601876389.git.jan.kiszka%40siemens.com.
