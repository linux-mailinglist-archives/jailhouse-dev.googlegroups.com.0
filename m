Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHNTL6AKGQEJ6INZDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7373828DB6B
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:21 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id c20sf872641ejs.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664161; cv=pass;
        d=google.com; s=arc-20160816;
        b=fh54KecLd/c4+px6qX86ud97dwHHrqzKJhO2NFYbIp8LG3pZvPmlXxWnglcxojqt4T
         ydM4ATrdYFYhZDHmL4wK2ZrA+acZrql/aZbRJClD5yGg5u6lQDDZQ5iBDuzBIWHBBSfa
         1FJ71A7XMtTIBO2NcWC+K9rNpeQPyYlGfMVxCW2LkGJ5v2fKatPJbU8fMQmVXqWNIrkm
         ctNDg7sCfft7FF4aD+9f0zuuoEH45OTwALMgtOVMWEqj5WJLgWG9fGge9m3uo/ADlryS
         ynrGKFQkZOzJDfYZQ2Hk3S7ht1Ds4R8KNbBLsdF7f0drOz2zhgYtDwIWdCoTIs97Q4Jf
         ds3A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=FnAlJHRRcoFn0RM/vQQzbxyuk9zhq4kRZUXEOPJ+jTc=;
        b=YiexnILRP8CDRYy00RXRc3GynpM+qc0VWVRnOOd8F1tiC4XGWtanVyBW/3TgIp+Ws5
         qkuttpaQ055KBblirddoZo0RqwT/jZGyx8wZ7kxz/NOJOnq1PDgRpnzJV0bh9TZlTlQH
         5WygB+mD+mCNJCzCopBoJVDIfN9m4psSSksUg8ma6pa+wFqOJj5IAvlcc9Ci/qDgVExF
         tisVrfR3Btx760MGfCBvXgBTQHwFToYklY2ag1QJWzaW5+P44yQNw4T8MWMyh22QqfeB
         U3NRtKspVsVvtSePf0r5eSwCELD56khYZflb1gVxcr0vR2oxVTIcPwZcH9ELbsxXbSFI
         P6VQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FnAlJHRRcoFn0RM/vQQzbxyuk9zhq4kRZUXEOPJ+jTc=;
        b=QgfxWit7R/BNUBk4FnKVQlME5+RjGH2QgUii3PCJU1191F6gZAWPBwbxV0WKyACW/9
         9/yGYlgZKS8QTb8SvbbtOQqle8MnWe4YfoTisdfkgf47HkbT2p538263NtOo2YqK+XVM
         KTCCwNgSeeg6hDBqt/AJ4mD3mUWiL18jUiIUqW4GOuHrq+433QzZwZJq2cIkL9dydI4S
         urgX0yHSIogWYcSv8lzZedMkEb+/1Sx3zBOXQnik1hDn6NveDRN3TTRVD3pPwRxzvUbs
         RjYlLBi+UxfeBGzp9uzYPEMXFs0ndUASc6kpOm9ZVM1ENc3Fmy0COl/JoSCysjJvhQyI
         mf5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FnAlJHRRcoFn0RM/vQQzbxyuk9zhq4kRZUXEOPJ+jTc=;
        b=Ojz7/PtwUc2KESM/7vRAccXiT6izdqcRtgTVLgsK66nXk0RIKR8Jag2n13VkE3lT8+
         OBjXMSHMWaLNeQxo/Pq/VLb4/R3bd7jjOOtJn3jICW0laJvZ/YeqaFy21iLGUnZCPTI+
         azuvhThoaUDooMQ7CP7NCuA2nEoypr9rjnzlHnETlTdGw4fkrZXoKok+wlU7q+zGVVRu
         LWEslQOjsZ/XugYYj6oayKWqEG1sMBU/5Fm0mbDurtJmAZXy/pfP51XFULrj+l4+OFPg
         ywF9eV25tGeZTEZOwL4AQkcv1ztBsAop97JN3kCAM2IP7erynhcrnFlS2BorJ7fO7I+s
         1VeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531fid73A49VidjcUG3nDiH1p9ewRgJ4lhkjotHBq0dWqnt2kU7z
	itX1X+zsO6Mv11fYuGjqmus=
X-Google-Smtp-Source: ABdhPJyhJApj0Qi3ZahZYLmqTTNs7GxmzJ9l6fPTVCo9RYVpEWC5rlc83pubi2e7l2Q/3zAIOtkVfA==
X-Received: by 2002:aa7:c2ca:: with SMTP id m10mr3810210edp.255.1602664161202;
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:39d8:: with SMTP id i24ls1229147eje.11.gmail; Wed,
 14 Oct 2020 01:29:20 -0700 (PDT)
X-Received: by 2002:a17:906:4ecb:: with SMTP id i11mr4205494ejv.387.1602664160112;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664160; cv=none;
        d=google.com; s=arc-20160816;
        b=XS1hwQB0HF27NJdN6PywoqPdUEL4KyvP8XHY6srB6kNCImlNx8NKYGxQYibCsu4wD2
         9hrO3mv9sawzW3U1ChNUYreSD3Lch7kVwjnQeDM70cshDOA7G/UKVwTlU5cHjZ7PurAA
         wVgCWqC9lCSo4hfVjnngT98uhuVkOhGpqSuS+UQ6JVltgoTPC/e49ofvI5NTtHTLCdJT
         b1KKc9h2rHYed6Ur1+q63NCk/SY6DrT16HwWm3/+VFSTdp/maWp8gOBV70xIp+cNN62x
         h1WDFcQeGmUY3FkWGWEehx8Pau6lBuGf8VUppKdi6CuixwKHT3GkVmgnZP57d/lzfcxM
         eE3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=OkPMkjepGHE7fHh7CvsdyzdXC/rv64gQ9UJdu9KlIUg=;
        b=JvZU7THuwIN9yp4nJlCgyQ5AHU0owiCJbda/N9U7hvhj94aXku0kxPwSd5j6UHn4aM
         0D0vRyWNuUJn0ftmPKZOuCyILV4Tw9DZNm31W3Ei802KwyErDlHuuw/u6QaNeL6s15dA
         wuAQrhC52yqUqWslYSyLlq4It4wm9FlsIjRDFmxsfS6NytISKkIA9nud2QI4Nfl4h0bC
         yKi0/TQhL/FpyNxt8nh/UklE5z1JCvjB7+2uKZKvxfe5101i+1+QwNTMfYiYb5ZcUmEI
         pGZIkwngdIsVcCpb5NZ61iUiehttQ3i/K/Js4nWsI5xzd9yz9fW9IC6DEEOO6zb3v56N
         oIGw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id a16si104500ejk.1.2020.10.14.01.29.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TJFU001688
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJO002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 38/46] arm64: smmu: Refactor ID7 evaluation
Date: Wed, 14 Oct 2020 10:29:02 +0200
Message-Id: <71329770bbf964f921c2ba3f154ef4b6826fa511.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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

Use GET_FIELD where possible.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index ba278784..3b45cc5e 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -65,8 +65,7 @@
 #define ID2_IAS(id)			GET_FIELD(id, 3, 0)
 
 #define ARM_SMMU_GR0_ID7		0x3c
-#define ID7_MAJOR_SHIFT			4
-#define ID7_MAJOR_MASK			0xf
+#define ID7_MAJOR(id)			GET_FIELD(id, 7, 4)
 
 /* Global Fault Status Register */
 #define ARM_SMMU_GR0_sGFSR		0x48
@@ -311,7 +310,7 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	 * bit is only present in MMU-500r2 onwards.
 	 */
 	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_ID7);
-	major = (reg >> ID7_MAJOR_SHIFT) & ID7_MAJOR_MASK;
+	major = ID7_MAJOR(reg);
 	reg = mmio_read32(gr0_base + ARM_SMMU_GR0_sACR);
 	if (major >= 2)
 		reg &= ~ARM_MMU500_ACR_CACHE_LOCK;
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/71329770bbf964f921c2ba3f154ef4b6826fa511.1602664150.git.jan.kiszka%40siemens.com.
