Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBS7YQDYQKGQEJH4YGQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id A673D13D7FF
	for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 11:34:51 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id d7sf3788519lfk.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 16 Jan 2020 02:34:51 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579170891; cv=pass;
        d=google.com; s=arc-20160816;
        b=B2JIue99evBTFJMJgyRhQDHXts6vYRNR1uEKMnJyBvaCufLm0kcSakK5lS3CWiazv/
         g1IzdRXXYs7SxPNyzESbDJ9wUcOjm88eKdK4q0SPHKbKqesOHNBDQ2ju68/G4EZjI6pm
         sxFVH5nI+tV9wd9pL0D+VzbQkM8vRRKfZMlKhxcvSQTHlbkySPJvCD3PM2nxGqYUH/9k
         U8IWPgf/2Ezy7lyHd8BlCq5BFXBpZ0AQ0eFDP2cFrGQt1QVfTs/7WRtay7yZs8BkY2YB
         Rkyqxqp1fbUBT3i0sUOBRr66SNHAvMiFdM8DxOuySjS8++4l+W4EBexw8rDpaIxg3phw
         XI1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=VnCAt8kfYfpQk9MdmtaublMQBQY67+3UQ7RVLaZX6u0=;
        b=czWU7H6v3Crv1m8TirXNogreUj3WBceYcpMe5ujggnTfiLJXzyhkiHz5K45fdP8rsO
         si2rFNDBjN9GxiTQxJFVQJiu2d8dpST3Y1Gay605N8HpMcM0A8WpYCfdIOsDvq9cJSx6
         O7yYYgeNeB2RpK2JuLDl8dc9ThZGCdtAMXyrbvIF2v7grpthnwOEYrAytJm/Gdt5mxmq
         hsTUExG4XT5k5A9wDOI4n/e1TdBf1vbiQwyWMF7ufnO71Q+/E4XYMDe3yh91om+/sx1q
         OHF1HUDMULXf+afmyE62hwWCJSUI6HdV4yng1jJKMSyyaoEpayhpmtvI+QnloFpce9BM
         OvZA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=VnCAt8kfYfpQk9MdmtaublMQBQY67+3UQ7RVLaZX6u0=;
        b=CTiis5Lh2Ya41C8lx+GuahoOOLX22H7vEvhaEYbvNnNjnHDvWJdNTc37jpetKpgNVO
         YfaRDemhjeiOdGiMShm12mV6Ay7MH+MKbRFNFVRHdHk+nXHonOHlW2XFddy4/SJ9dvLD
         6wc7JD0Vdnv75ywyHTXZzXK/99l2PLHSsdyuFB2xFjEplgm4zi2xJtvRODsyBOPT2SBM
         to92R0WC2YNEOJ92azr6X2zu9g7eKQU3LXz5tZ0VFlI0HLbcT70K/4MPOMU1JQ79/Sdx
         5etMln+gusLeBZwkROMROwRwTujqjemNrozrP4f1ialDYRJtxnBrRiU/z0NGn2fwODe2
         2KcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=VnCAt8kfYfpQk9MdmtaublMQBQY67+3UQ7RVLaZX6u0=;
        b=qfTO8RzkVioEy6LzFhv4aOL0t2aLmZmE3OzxBvojzv209N0PKi6Wmvlw03oap9H+9P
         ixEZwRFAdDrMas6mcK7LjWRZr4BfLBa1YJc5dKWKLGExYBN8jkNjh/dIaq81YznIvxQY
         3eRinJChCskiPP9SJ8N4z7wT0WfMpiA8d23cJFWdUHfwB/EWwEi2WoghKOih4wklO+cP
         qVnyitpcrOril+XdpB0vyxWwWurQuiC3CwP1trQ6dJCpeQ5th94m+VaoABEPLUcV3+E0
         /41tnYVs8hG3wQzqVqMHsx23GmJA+p34UURendlY+YNqLHRfzMyWyDn0Yy1FwzABcKql
         2EgA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUFDp/SLuloBk4xn/yPCRyTln3mOVnpW/Xgq/XDqSECEnx40IJT
	knsMazWXQyKmstl4Nlyh1kY=
X-Google-Smtp-Source: APXvYqyWS40A4kJMyZNpRn4QNXGrcRlDQroWXbajoocTV/bF1hl642eTppoMWhwEygDRa5AK+uj1LA==
X-Received: by 2002:a05:6512:284:: with SMTP id j4mr2029774lfp.109.1579170891254;
        Thu, 16 Jan 2020 02:34:51 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9c85:: with SMTP id x5ls3033964lji.0.gmail; Thu, 16 Jan
 2020 02:34:50 -0800 (PST)
X-Received: by 2002:a05:651c:2046:: with SMTP id t6mr1855834ljo.180.1579170890376;
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579170890; cv=none;
        d=google.com; s=arc-20160816;
        b=0EnVeB153p1XXoUnzMg6AhHPcFbdtPkhJuILx3HCwzPsEmI+tq9fglQPtTbSNNMs8m
         L9CF7gADDAkCBlpDsN3GKJo6AnHN/3Zix2VbFDuZkfBmbn9vJ2LOXajzSOgRSA5HTaLT
         Knw64Nto6Ay3qc3dgej5P8upuhQEH4ifC9ZZUSuZ/21QIIcQo2dE1AOQYJsaSh/AbSLs
         jJLrVdH8UpK08NPg+G19SdW4L8TO+SnLI2SrHEK9uLJaXYeK69mNKRd2qnwgCT+y2bx/
         Ei6cHq4S1nUBE65tzgL/OWsgf7us7K50kCmEAR9NT+cp4OkayEigq/ObIYUTN9vL/HmT
         jwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=X7gbnl/GjE5xf6KU7+WoTQvmIp1E9eXC4C7CTq3P+8M=;
        b=wBTYopbNhAIGHtG3/9dFWkrf8yUIjT1lpnNhkQJCrrkIWgCb7Hbbrlbrezq3JhA/Gv
         bMHvN23DD91eDOhfpt0e86rnv1Cxx0X9wZW0UbRFIzD61fPH7224yKsX2Wcmck1L5tQd
         xQNNslXzUibKI3lzpbuPueNAzwua9KeXPgE+ACsufvHfG1J6CsOXVQ8mdMo+J+9S++0B
         Yy8+RfhCYPcB2B47eG/B4YFcwnbIcLkrHv3pgt1ZIdBONdI8R68c0NYCHOv8J8Nw2m52
         VxfaX7iT7BkHZTIk8aB3Aodnu36HvkuOfOnwPIv6nreLvcvrdv+9JfBEYUzZEq9ApJ+B
         pjxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id z16si818397ljk.0.2020.01.16.02.34.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 Jan 2020 02:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 00GAYniV015572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
Received: from md1f2u6c.ad001.siemens.net ([139.23.78.127])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 00GAYmQI031623
	for <jailhouse-dev@googlegroups.com>; Thu, 16 Jan 2020 11:34:49 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 08/18] xradio: Update to support 5.4 kernel
Date: Thu, 16 Jan 2020 11:34:37 +0100
Message-Id: <8e692d8b854ccc26fe1302e703d47ee74708cb20.1579170887.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1579170887.git.jan.kiszka@siemens.com>
References: <cover.1579170887.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Update the upstream version that brings support for kernel 5.4.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-kernel/xradio/xradio.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/xradio/xradio.bb b/recipes-kernel/xradio/xradio.bb
index 40fb32f..e3f3d06 100644
--- a/recipes-kernel/xradio/xradio.bb
+++ b/recipes-kernel/xradio/xradio.bb
@@ -19,7 +19,7 @@ SRC_URI += " \
     ${FW_URL}/fw_xr819.bin?raw=true;downloadfilename=fw_xr819.bin;sha256sum=4954ceb85807959c42e82c432109455bd9eabe95971402299a16d77ddd7d79f5 \
     ${FW_URL}/sdd_xr819.bin?raw=true;downloadfilename=sdd_xr819.bin;sha256sum=84d3fb3ca8e5d25a0c113a5063bccbeb5b53da230a0afa236b5b625f37db5161 \
     file://debian/xradio.install"
-SRCREV = "b7789c274091344eeff47cf34a48e0b225de852b"
+SRCREV = "502489a9389ac7118401dc7271c56d128376e191"
 
 S = "${WORKDIR}/git"
 
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8e692d8b854ccc26fe1302e703d47ee74708cb20.1579170887.git.jan.kiszka%40siemens.com.
