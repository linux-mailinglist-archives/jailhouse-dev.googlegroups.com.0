Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAE5W2PAMGQE6MM3TEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D3A6771D9
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id az37-20020a05600c602500b003da50af44b3sf6346740wmb.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=MPkdVuG7QnvGGbEBkBCZG6YR2DmBHaRmUhe3G92YXipgQZT0u30VLh8QW6aF4sEGM9
         UeFPiP/XgnOocS+2WSqckgqSyzYZX1AWK/RxZCwva1j6x4MAM0UnTqvWqDDHfPhj4FHZ
         sQVxxa92tRbE/oJEStrBs1rAyjWJBBlYY+WbgRoK0VrCNwOEDwJPsVZf4py8/l7Q1EZ2
         +/00OnIpTraXI6g4LUZbdEIDGP4mRo1BqxttXJ205rEOdzxfhrq4rcy1jnyXEKo80oW8
         qD0kRlIK2JwLtC+GJ5DVhdHJ12iKd+Lu0pDf2ZJlxTWGJxUjRO6mujgCJ+1NAuE0t1Qj
         92dA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=IbfrOg0OChAUfM/19/7jQiMiq96fYI+bGobRZXDo+zE=;
        b=caZ2LCUDqZFvU0j/+0D87NI0z06QmFAi14WKBlQDs4qEJmkdz59W251VX3ux4NZMoG
         fpIYE7ol7ak6ODAozvW2+VaogCbIPF56qGAPxQYVvgCldQJK075sjHKS5QGFhKz9Y9kM
         vojiVYveWtfkjduo09U8Yzbd3d3iPcVgWJDTBC0iZkRHAcGz7/rui+FT0VuF7w/A2KGY
         2/Rj5p80RPig2QMLYIKUmd7ClnP712u3MQd4F9Mu40UQRe5gX2yrEe7R9OOQIp7ymTXy
         TdRYcOpRDKWFRRp6WI/fEX+ryYVQRTMbJTJVkR29oHyJcCdIx2VfQfjT58rcd1Ui1Cru
         Cnyw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=FCKCRb0G;
       spf=pass (google.com: domain of fm-294854-20230122192903bb4d2aba1536de70ad-o4ooiz@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903bb4d2aba1536de70ad-o4ooiZ@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IbfrOg0OChAUfM/19/7jQiMiq96fYI+bGobRZXDo+zE=;
        b=pr/NnIukgmDUFoF0kIiMeH8GtU9WUSx+SCY0NbEEuaMj202l44Ss4p19mkFWFjpJ7/
         LK3qtqtRbTTFEAAxbntk0Tk+veDxGfLAq3BIskIj9/GJ/0rXzjt8yoGspQWxtExHO+3v
         QYSHP3gil2lXtS8J+/BsClVaC3Kklfs8tVQUnHNS0D+a9NsFmcQborrwWWPNOV0xD+Ki
         Q/8AZVo0s9HAfSgU6yFEy6JOqbiKLF/zeRbHI72s9ectqjujWgUcNAyxrdHT5Z7PEBlu
         nNeScHNpBQs+YYDuaNNA+X4M7agnsjbQJ26jhEMjnY/7aaRCzAInXl2YuUVPPE6qPWT0
         OXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbfrOg0OChAUfM/19/7jQiMiq96fYI+bGobRZXDo+zE=;
        b=MktyGVuJq94e/GFCqFuSyHxkbVx02W/3T83WN0hbld9GqYh5QVJKmvFQM2gMvEhrJ8
         kURcCEnJaV937UlBamWotj1WROdnj3g/IJ1qXQqLBeS/XwrlZOYOF/IVtYkHcKC89VxT
         Qs+ddjuMLf5mbQLPwHB965uvh+w/StLoS1L6DoWPWaaRbG0B3+XijPp/WKOAA8upzaQ6
         vKGaIYdlDu5UsSiHSQr44acXpffURHkSzZbPHaZtXwLQBzoiAVCZyf9cm+f2o8mYdii1
         riR1ltOcunf/XxdgR07oaQqCTGlneEGoJrrj3rf84hbd0lncfUCS02zvh2B3zhb/ULI1
         5S1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koBHqHPVRDRq1dwWmDhNbvzodj7epcs2a8i6kY16qWmkHTkjSRg
	ZrlvjNkajIGSRaALqOjz4x4=
X-Google-Smtp-Source: AMrXdXu4/MKOI7mmzj44l7jeUbtyY6vx3CoWF5u0hlUDyJelpzvitYf3c4nldU/lfn1eoNIJltNtRQ==
X-Received: by 2002:adf:f944:0:b0:2bd:d395:551e with SMTP id q4-20020adff944000000b002bdd395551emr1244274wrr.719.1674415744921;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:5101:b0:3cf:72dc:df8 with SMTP id
 o1-20020a05600c510100b003cf72dc0df8ls7074279wms.0.-pod-canary-gmail; Sun, 22
 Jan 2023 11:29:03 -0800 (PST)
X-Received: by 2002:a05:600c:4b0f:b0:3d6:2952:679b with SMTP id i15-20020a05600c4b0f00b003d62952679bmr21324653wmp.34.1674415743567;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=wHm5KQW9TafrQld9DZ2dGgEEE/yrSKs+3RpbPl893tY55srXbTvjbZPgW9dWwEhscK
         A7etHvupR+/x9K3ub/9ovRtsaQ/f374lxP0dZwq9k8ctMv+GKlTJfzvz7Lr54ODmItKj
         9dryqqyr48MVhnUQQr6ihwAMKL1fwKOyPt40TAIXpoFk6bbuvlPaz344AZbkCflD2sKK
         PZnsIEZmk6hRU603zXSvqA1yHWvLCnPPLlMcHEpRtwutXyTPMbrFMgBOVnZkM4lxFtuk
         5zq+cxpbaTO238eWNmkv3nDSPmlCDQ2n1wkK+N87FqtwnhKX7IeV+Tlf9HtpJ9Gg2x6t
         quUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=+jOEGVq9iwJtZS/uj53hkz66hlMJFv/iLPiHC5+TAkc=;
        b=r//3lf9aV/K7T8IXUZX23dpNj69Eg0BJbZ4A1JwesnU1A3zFHeaPIluy3fxujNstfW
         qSSgeMqfiJd3TDSqJUrBP/6qX1VQJKCTGBlljUHhGIxw8D7Dri5oFq0Y8ViLSlgUu/wo
         ZLxo0mbcQq4hr7Fj+tvWLLnYS7IlMVllUF9Dh94KHzlMUJPln99kUj5gBRD9Esg9Cmg7
         ZpaK+0QyYPzj5ARgSegB7Qn4d5opNi5FUMUiYLbDZ6qezN3yhMIvH9Iunc5JpD011cqh
         +GtQwzW17c9d0ZRnN2KyrfsOInu2bPMN3Hp+3JEamL6p6MhO5sDkfcbNkLAb89aXao7N
         Cspw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=FCKCRb0G;
       spf=pass (google.com: domain of fm-294854-20230122192903bb4d2aba1536de70ad-o4ooiz@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903bb4d2aba1536de70ad-o4ooiZ@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net. [185.136.65.225])
        by gmr-mx.google.com with ESMTPS id r6-20020a1c2b06000000b003db0037852esi637170wmr.0.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192903bb4d2aba1536de70ad-o4ooiz@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) client-ip=185.136.65.225;
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230122192903bb4d2aba1536de70ad
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 06/14] configs: arm: jetson-tk1: Avoid memory region overlap
Date: Sun, 22 Jan 2023 20:28:53 +0100
Message-Id: <073961eaf6e22266735f697903e4e127d3d59d28.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=FCKCRb0G;       spf=pass
 (google.com: domain of fm-294854-20230122192903bb4d2aba1536de70ad-o4ooiz@rts-flowmailer.siemens.com
 designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903bb4d2aba1536de70ad-o4ooiZ@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The permitted root cell RAM and the ivshmem regions overlapped. Found by
the config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/jetson-tk1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index f73fcead..6b37e04c 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -225,7 +225,7 @@ struct {
 		/* RAM */ {
 			.phys_start = 0x80000000,
 			.virt_start = 0x80000000,
-			.size = 0x7c000000,
+			.size = 0x7bf00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/073961eaf6e22266735f697903e4e127d3d59d28.1674415741.git.jan.kiszka%40siemens.com.
