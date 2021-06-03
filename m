Return-Path: <jailhouse-dev+bncBDOKTXXSZADRBTPJ4OCQMGQE22P6GEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id B3D3239A489
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Jun 2021 17:27:10 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id v13-20020ac8578d0000b02901e4f5d48831sf3249631qta.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Jun 2021 08:27:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1622734029; cv=pass;
        d=google.com; s=arc-20160816;
        b=HFilSsxyj+vw6FmjdKUOZjBILOL/3KLl9cg288qx2Wa8K/hg+k2+zwjeVoQEs9boN8
         Z0cEpM6o95BVfzWMRVuMBNoaH2pGHvu4LyAC5LTZkzsAfzm8rFKkDnHIEUgC/s9L11yG
         tPgP32zVFcbOwxH09SEQPFbJx47K7M9z2ieVRRGKUBhnblMkW1pKHk4cq2H0k65/D75T
         gteUCmcZil/deebd9dG9RcgVJYJMFkAN9thUHrxfwc2HuyM+pL+trZ5mAARsU+WDbnq7
         37EmsHKZFcMgTBXGDb47w4bdzcamsc+SReZJVL1tW22ol5G8fJtUNo0P0Yl73rW75qoX
         VXng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=IsJBiNUBvws1bGbjbZcy7tBKJJwRbVVtipoNlSttEfk=;
        b=SOakzK6uKEOXCFlE0KIIDqCesxqDPt3iw9/KjXhgHYPCmgCj86GpaU3mm7xB5Z0Gk0
         IAvqRuppdWG80AojMc3zJ7VVznyc5wYWOlppXWbRKEsHkE458PHv6P5o2AF6ksj80cTo
         3UuOfRB7f6chqlzlpI37/vXDtnMUkg3qlbnKlDSvWz0RcgQOyeIxPmHoEqEdZ2Wpb0Js
         z7EGcpVnHbOd91kMwvwZJrnR4Tt0QcpWoq96K4jBloOm65WO0WK/PAAk2FHxpizHkm4+
         kSWesQg7d5dmn4NrPphCV9Gz8GU+UCJVNh+Di+zcskEDFwB+Dp9QnyPUOt2dBJr6/BW9
         CLHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KNquwnwn;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IsJBiNUBvws1bGbjbZcy7tBKJJwRbVVtipoNlSttEfk=;
        b=tX9FsCZAHuafk/W3zq946zJOcS/tzzxgWZ9BgWM/UAE9G3JtxBzrEnY9hvW3S9WP0O
         hujQYaIxZv+xPqRC0GpkHJUYn4XkM618tDmaCF1VAGEcdtuU0Bu+jEsH7gmMzoI+wRkq
         yFvoM743cKtbbY+t/mrnpO037W2+i3LFBlE1EntDyUqaqBtI2GiXvnXVW0NQSV4tffRG
         bJEMuqpkhYLwnLQa88hhiYhklIhY3zvYTn5ve+DJ51qDOdg+E1OLTu1TNqJk3hlxl6lb
         /B1hGmMm06tNQvwpiOf0053R/PGggYT8P6SRnCq47HC9kvdZFTI2w/ZkezzXffQMThBA
         uhKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:to:cc:subject:date:message-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IsJBiNUBvws1bGbjbZcy7tBKJJwRbVVtipoNlSttEfk=;
        b=JAoPdBI9NdS6Nr+uYurxhVzT6VCsDklWroxWt91fjfkZZtBeZ0WbmAzn4HVSqdzzTh
         aIjhE0lZGJrivHNrcT1D7XmnfEw97BMSrnv1dG/sE6sV48jfQXhtNpasKkDbXsAwZRWv
         27EKpHtS2SUB2GbW0sHbk+n9qtUYoCbjhvJxHGKRQilaXZ6UNQ2va5yaEMQwJyEqGhM7
         ArdsVs+2CwBK+x6jkW3fLAVhRzBBO4xCSYfBIp/iO2eZsQR6/mY7nDAPfohu+NJcI5jW
         GH+5eN0YrGk7wmDw9Mjt6jcQgrSGB+3Wd+4gTkIHLvEFtez6Vcc41s7cz8g3CXqx0VG5
         XwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IsJBiNUBvws1bGbjbZcy7tBKJJwRbVVtipoNlSttEfk=;
        b=dexnzA8Q45+LEJgiTdZr4ejlQyl6MCiSZLwzTUliJDQP92FX1iNS6YEak+Oai0fNSC
         0j8x7KhX78P/UW9e1eObd5RZsOXopG6TRSgMBc2OHV3/nZkO/wXDzdQhU+LoV9gmg6yW
         jiYBKKXyDic+XjMlLf08laDD/39JcMS3bAUnzZR/XfKScxfmSv/24jRUafzjqz5YOuSi
         /Tu+Xuy2X8gbRh3OnIVmSLLKnoaQ6QtZj9tct+eDWMTWp0+x6IQEMhlpDr5sBEEL5PVJ
         +Qkr8Wyv7au6iH7rQOnHLDYMSfteXeCFY88p6Rs9F+2F2+TTOtTRV358mtZYItN5AFzO
         chWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530WbcjLoqZADZ5tsUfHJ2dSUda+7XSzkKGZ6Yxfwds56g60DudM
	xNM9T1fI3k64ZPvJiHvvcso=
X-Google-Smtp-Source: ABdhPJySoTLJx8caezaCkJLYQAwKjqy7t5Jsj+Ss1GJDkBMdis9oWD7wO4DtskSvF/92Ix+IamzDlw==
X-Received: by 2002:a37:6b47:: with SMTP id g68mr143152qkc.89.1622734029443;
        Thu, 03 Jun 2021 08:27:09 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:1313:: with SMTP id v19ls1572015qtk.11.gmail; Thu,
 03 Jun 2021 08:27:09 -0700 (PDT)
X-Received: by 2002:ac8:6f0d:: with SMTP id g13mr32440qtv.319.1622734028947;
        Thu, 03 Jun 2021 08:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622734028; cv=none;
        d=google.com; s=arc-20160816;
        b=fLCvLJYESGRSkyOZVgIb/n3eMdlkdcbZMo0ZV0y1bniV6Y0Ub5T7WEEhfQaBp5T3VJ
         xSP9FpEea9TmtHrf8JGr8tQTFEcoyQyRFNaT6pVebNdB0CRkhUOHUxhdnXjT/5eJkuzz
         JTALhbykdH1+DErOWz3nr9QxhbHtaio9sl4PNNRrEvAe7umwoee0qB5kkKeyTgTs98ff
         kE2iSmkmIc+zRvw7cpIGTJ5mbQY/N/XbZkUG3NNQfYVGXq8l3rKWSkRAXwi8b+whJxJH
         HfS4Wrkh5iOj5EHsAlEHzcSqBm42wawQN0x9nxG58oo6YkIQUuEkiVqqxlp8kS7nUoFh
         0Hrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=bVgQ7F1FRo34ldx6Om2VkIgs08Ec/+EHueqRTH9C3Bw=;
        b=rGZCg8kfMv6qgstkWtfxkbz8Dydhht421j9AS/Ef3sP7BLB9KJy16RL+EU56Ii158V
         XiiO5pvjQODIILuNr1SkyDj4kVAPTxlStyOan4wi28otNMVg+MdSDxAY1I9PMUT/y27C
         KsEZl794zgG8FZv/fnbmb4iOsv/IJskGacM5rtsXqC07HTKrLwboS4ZhDvUJRuOTU9z+
         9tLw9H7UN5ZVFGPmutaYFkVRnTeJMyB2Dw9BkXxSE/sDQuMXr6o63YU6B7hLjknSrHTQ
         cOxrwPL2/DPYY1Fyj6bgrkODX/ZQ/ON6dzItYLJ8kQIba6EYOOa++3Z4LqMRMtbBrNrm
         AJUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=KNquwnwn;
       spf=pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) smtp.mailfrom=gengdongjiu1@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com. [2607:f8b0:4864:20::542])
        by gmr-mx.google.com with ESMTPS id 85si252096qkm.5.2021.06.03.08.27.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jun 2021 08:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::542 as permitted sender) client-ip=2607:f8b0:4864:20::542;
Received: by mail-pg1-x542.google.com with SMTP id t8so5391957pgb.9
        for <jailhouse-dev@googlegroups.com>; Thu, 03 Jun 2021 08:27:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:d66:b029:2e9:c899:d618 with SMTP id n38-20020a056a000d66b02902e9c899d618mr337794pfv.6.1622734028234;
        Thu, 03 Jun 2021 08:27:08 -0700 (PDT)
Received: from localhost.localdomain ([47.89.83.12])
        by smtp.gmail.com with ESMTPSA id 189sm2510823pfu.84.2021.06.03.08.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 08:27:07 -0700 (PDT)
From: Dongjiu Geng <gengdongjiu1@gmail.com>
To: jailhouse-dev@googlegroups.com
Cc: Dongjiu Geng <gengdongjiu1@gmail.com>
Subject: [PATCH] gic-v2: Fix the wrong setting to inject phys irq
Date: Thu,  3 Jun 2021 15:27:03 +0000
Message-Id: <20210603152703.21027-1-gengdongjiu1@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: gengdongjiu1@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=KNquwnwn;       spf=pass
 (google.com: domain of gengdongjiu1@gmail.com designates 2607:f8b0:4864:20::542
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

The register offset and bits offset should follow below rules.
1. The corresponding GICD_SPENDSGIR register number n, is given by n = x DIV 4
2. The offset of the required GICD_SPENDSGIR is (0xF20 + (4*n))
3. The SGI Set-pending field offset y, is given by y = x MOD 4

Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
---
 hypervisor/arch/arm-common/gic-v2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/gic-v2.c b/hypervisor/arch/arm-common/gic-v2.c
index 31371de9..03b91fa1 100644
--- a/hypervisor/arch/arm-common/gic-v2.c
+++ b/hypervisor/arch/arm-common/gic-v2.c
@@ -364,13 +364,20 @@ static int gicv2_get_pending_irq(void)
 
 static void gicv2_inject_phys_irq(u16 irq_id)
 {
-	unsigned int offset = (irq_id / 32) * 4;
+	unsigned int offset;
 	unsigned int mask = 1 << (irq_id % 32);
 
 	if (is_sgi(irq_id)) {
+		/*
+		 * The offset of the required GICD_SPENDSGIR is (0xF20 + (4*n)),
+		 * n is given by irq_id DIV 4, the SGI Set-pending field offset
+		 * is given by irq_id MOD 4.
+		 */
+		offset = (irq_id / 4) * 4 + irq_id % 4;
 		/* Inject with CPU 0 as source - we don't track the origin. */
 		mmio_write8(gicd_base + GICD_SPENDSGIR + irq_id, 1);
 	} else {
+		offset = (irq_id / 32) * 4;
 		/*
 		 * Hardware interrupts are physically active until they are
 		 * processed by the cell. Deactivate them first so that we can
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210603152703.21027-1-gengdongjiu1%40gmail.com.
