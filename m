Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKXD5L5QKGQEWOAJTJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id BD967283025
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:54 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id j7sf3557379wro.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876394; cv=pass;
        d=google.com; s=arc-20160816;
        b=Z+5I56aM6bF8RDOzb8tl6hmWI/ztifaQOD+FcU6DuMgSjPi15ojPL5WDKAJUsKu81A
         0XgOaYFKJs8YgFg9MjXUvYLNykdOOKKEAqp3sqdrZ78JTu+1B7+tP8GKq1wEgZTukock
         J0e3WssR0veQWeTWRp4ejMFWG2j2Dz7odJAMRrzXyUOblGXE/lnSpH2cVx56x49hPbjv
         vVaMScoZdACTxixe9lx1oNEirsF+KWD12QwFyV1IYugS/WlSGgjS0Ak9P6OL7R7oDeXm
         Izv/BkrLZEUPsDzfq9eVby/Gzvq7BjhY87PYe55G6YnpLtQGpTuDksP18GCPXCudCVag
         SkIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=1DJIZHSohcYLwxjqBEj5UlwQ9GOXw/XmTtK5kUgZBj4=;
        b=nmIfDqlTl4HyMKzIGc1m6QkWxm0SOm56Qk1ct/s3AIFA0N06YGsqwwbISlcT1N0uJ1
         wu0whDlnEmWFLAQ1lIBVDUYwWXq0e6w2OM0HSeL/RE/7Zq8q3P+Vr4Nm+ifDQcM9DLPO
         l9SZVTaV/N/QVb1CUhjymKCHwg3ACMIB9CXWZSSCM5kmSbXPPjV+QDqvHKSnCQjRXaMz
         c/hw/fqmNpbYwjgP6r46xEDnqySsU21w0wGxsg2i5xx6BmrE2+s2i4GL26aBlK6XWZCM
         L4xzfBhqkkrN/thuC9o852YdhWKB2mXkEB/4vbeqCurs38zNo0JRr+/IWmtqVqlAH+BI
         pV0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1DJIZHSohcYLwxjqBEj5UlwQ9GOXw/XmTtK5kUgZBj4=;
        b=oXj9rfmhErRa5F4OLosPrlmFXmd/j7Xka47GV/fdyVSP1Q51x2dBEslFfYmelMEfuW
         Jfc6v8bnMHZv97uZyu/Bb0k1RZHbDLTfPZOvCbl4BzDOvxqLQwqaLGxPFnwO86qES5xW
         0x0QuQ5+I9DUW4C4dSNRY61MF1ziPSmrYGjGFs6pcMsnUrN+GZ3GQZAEPNIld1rPy6bF
         F/Lu52XgxfamlTzfdG09MWC2RkDmgLu/gJ32yCinZaJ/rxt8EJnKGpvkZgaCUaq6l0i2
         qHMQkqroaH+6i3gYuCAIU0QElcpSKfxQMgsRmO9GMa0kmHFpw/NXFMv4HUTiskXRFENX
         cjUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1DJIZHSohcYLwxjqBEj5UlwQ9GOXw/XmTtK5kUgZBj4=;
        b=Qh5M1QVmkfPRggZPk3QHQybSlmUTKzRHqJDzyJPls4dK0LrMu35MUi3yOx2efof9GF
         GSs2FodiPKaI5IV0a+pFgkarmssqwqf1+OlsAlQB+tP+ibOt1X6srcxKdJP7woD/biIA
         6FLJ0BLTtKdr9OOahIiWY4KIGrb5I4D01VsgDvMGq2LdBpo4nMfqHmkqUCwUjAkXiyeT
         wQ5YIg1rFMY7D+NVG9fsDH7+musjz+TGOzV6jeA2r4rr5CFjXFjjsLsuMl/tHvIL+oVU
         y1VR2+nJ5XTPFwGPHSPsWtyh2rRb/v9C4ZsxTqgkCJ5p7X+JhRPeSCuDnh+eOQrzui5I
         rAQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530QIcawT3jEx3nJYBe+r1T06pYJjG7HVcamOMDegYtXtUEDu65x
	54+vRZl+xe312TdqDUBsphM=
X-Google-Smtp-Source: ABdhPJwcOGgWyKmvFTHhkLoEKPzYL0aFt4gzBNmqhAp0N2dBM3s9SUKDj+ky1KqZalxOzDskRzwLXw==
X-Received: by 2002:a05:600c:2159:: with SMTP id v25mr15810434wml.180.1601876394540;
        Sun, 04 Oct 2020 22:39:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls6434011wrq.0.gmail; Sun, 04 Oct
 2020 22:39:53 -0700 (PDT)
X-Received: by 2002:a5d:5486:: with SMTP id h6mr15803264wrv.415.1601876393500;
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876393; cv=none;
        d=google.com; s=arc-20160816;
        b=Li4uP85+B6sPcKxt/z4unovwgl+S3AjS7Cs6JhDgPfku6IU9K/XMfSbKRa/0f7udoj
         oebIkEmAWfMKBtJdDp/+SUlcT54QObRpplJFIlvQDepqvf231yl+B2g1y5D9ZTfaamRx
         4L0RbIuiNylL7jSxPoJTXZPJX0w5Rm+AUn37lTmDsfbKCHvJcWXS9/pHAgYurTVLEmza
         RmIYf8KLCuL10BTMwde/95TSAfKKqiMWHeRyAQRh4fLpaaSr9G2Z9wMn8P5UZWLXrVdf
         aew/nr7+cRL4TQS6SzWmU4CqJ7KSz0FXMnaJOvEOJiF0iVOSjQIbDD9Q00VlymPYOrGM
         DdrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=cbul76guFirs29PnCHx2IB54vNrtNIuoMQYIH8MAQio=;
        b=CkNcfkAdEkB/iyEpdmP+XLcUuiLnn/sYF92GXridOvFuIDxPOvkhZCdxdBSWhYWZCG
         e//FeXDqmJpXYckDZ3QGDQE9JwMSv3NKKxWWKsbeoTWng68/y9bPinP8GShnsVQJc+q7
         WxeOKpgiacZvcctJ44jlnmBONXzr+KZHCCHVqTI3UyhpK9X/xmbvAflcDuCe8c0N63Va
         RmvFgJL2adzUX4/iI99lDOuCeuVRo/8OQbaGp9lqGiW3GBCjVAVrWBGMq2NH0r39Nu8S
         rhvAZ3G430t7/LxH57ca61YftXsJZ8HdsngG9k6YUbbCFmyYBCeq313DW38tsuC09Rzr
         dEvw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z11si333543wrp.4.2020.10.04.22.39.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0955drG5024026
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncI025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:52 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 09/19] README: Add Ultra96-v2 support
Date: Mon,  5 Oct 2020 07:39:39 +0200
Message-Id: <293729170b61e82bd8ba7abf08313f5dd879b337.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

Expand the section for v1 and explain the unfortunate differences in the
UART output. See also https://github.com/Avnet/Ultra96-PYNQ/issues/64.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 README.md | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/README.md b/README.md
index bb93821..44bbfb4 100644
--- a/README.md
+++ b/README.md
@@ -117,8 +117,14 @@ directly to the eMMC because it does not contain any firmware.
 
 ## Ultra96
 
-The [Avnet Ultra96](https://www.96boards.org/product/ultra96/) is supported.
-You can boot the board directly from the generated SD card image.
+The [Avnet Ultra96](https://www.96boards.org/product/ultra96/) is supported,
+both version 1 and 2. You can boot the board directly from the generated SD
+card image.
+
+Note that the configuration for the v1 will direct the UART console to the
+expansion connector, compatible with related expansion boards, while the v2
+configuration uses the UART male header as output, requiring the Avnet
+JTAG/UART adapter.
 
 ## Raspberry Pi 4
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/293729170b61e82bd8ba7abf08313f5dd879b337.1601876389.git.jan.kiszka%40siemens.com.
