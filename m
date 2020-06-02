Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWV63H3AKGQE445Q2FI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FDB51EBDD9
	for <lists+jailhouse-dev@lfdr.de>; Tue,  2 Jun 2020 16:16:59 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id l2sf912617wmi.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 02 Jun 2020 07:16:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591107419; cv=pass;
        d=google.com; s=arc-20160816;
        b=j3IjrLJD0k2mHIpC1uH39X1LCuZMM7OEtdtZ34AHi8Yl4PzMDWhidhA35BLXrdKA+J
         nmCyNqMkoSVSDA11OamOZnw4TAootx8TIIQUcXnQxNDxrETmp4HZosi+O+aD9/9wXZqP
         fYCeQFB4heDz8eTHCkgqvtPHEKsQLKY62zu6GcnKzI9aAIH9DkbhEX0xBuPQ9Py4UQC9
         bZHByQlXCh7IFclFZSufy+IuBSsSAOygu/7SGatBzTavz/FlVv583J5XagnNK1rfeqnD
         XXT5QfRUa/eRUX4Vq4j5S32ZCZRoZyQMD9Ewq3NeaISAIcmUrKiERPF3A3QD7mxwaWSt
         l1Jw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=lSTl9Bx8GCOxcSoAT8tbcw28xV4R0ZEdVHkU97g+I3U=;
        b=RtBbJZvBGZ9rT3xwuEXHWpySBI7KKjq3vZ+N5su3g0yrzRnt0zWX5bk6KKaR30Joz8
         N6SPT4FEbDqr2X7SOSjtMqdBNRrh9MS9o4bmAPB81xWMFtuKAsu0so7WfSbpTqB+uj42
         UV++muPNhxZLfzu07XxfoGnJeGdQzQnzV4zosUiRN9vdi7BL/MhGfAitEQtRyeRYMeKm
         iiEwE6GIIIRfp6+LSK1v7j9vnbfwOmp/DHZ1Jl1M2mltKtKwW2lSzCTJ5gcC1jJJoT7f
         hQApmrZ0Valq9a1Y0HUsMJFNsaQwzKjiOpXpDAsh1zixSZ5oP10g031Dg4HZsSrgMPr/
         p1wA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lSTl9Bx8GCOxcSoAT8tbcw28xV4R0ZEdVHkU97g+I3U=;
        b=LeqFYYT6jpTov6VFxPa0Dp8s8RihzI28UfvkMtzS8YoGL7XNAgZtoQzr5JbC+srkL+
         FqOAf1PZLyR2EdFRlbHWNdCxNvEJrAOuDsy0Ny/B1RDgTabTUh0UJNPWMTXRJQFxqLkf
         ipmv4/bT9n6PZwwmwn+SRr3Kmo7TFoCgsg1dHvlUNDtpgBI+a+8aHdzmzvTyOfQL4Ab4
         D5P0vwL4UQlK8Byr+vrb1fV3COdCFdpZsneb7g4ULcMX8EQowFAGWo0mRCD+m4VrZM9i
         vi8e71XIv/j6WBBjE2SjftuS7dx5P8uplo37hgqsR+AISK3liGCWv2iMaEHK9wO2pdPj
         eoeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lSTl9Bx8GCOxcSoAT8tbcw28xV4R0ZEdVHkU97g+I3U=;
        b=IymGMKOxOkFNxoSGu4SoqfRYtNiGcNOQowVxxe+my9jlXq8Fb+d1C/gQX9ZU+RrpcK
         g1/oFP8mmMs3o6eoD2J0pcYYHszPbndWPv1z21TIMc5p46GXyC9t4Bc59ENXrP5XD76E
         hdCoF3mlgijRghKr8Xnpb9t9saNJkzjUj6XKOplB20kIO6dBFrjGLoRxqzxN55ApIALM
         GqCFl0SwMiMPAnE7bTbJoWWuxWxNsH4trfDF3og8Q/rhlx+WEkwoUg8ujKO3i+HNVP93
         49KwomDjuKebV/f5T/U6YvxaQlkh9Sulk0ivgiNZ4DGsE2cIA3lRbl3Jigqahp6cFRV4
         R7XA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5329M6DBQlCJof6/aRQ4XjixOXV2KS4t/UDm9PGHXwHogBsTXkFg
	fbq7DHxLXI+JROAoyAz5azQ=
X-Google-Smtp-Source: ABdhPJxqH7959zrhjKLl+3k2p+pgOsfp/XiY8HL663pIHToDq4gC6qurbBXs7c0jotKxZc6y47WngQ==
X-Received: by 2002:a5d:6cc1:: with SMTP id c1mr27592913wrc.144.1591107419032;
        Tue, 02 Jun 2020 07:16:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:da46:: with SMTP id r6ls5088409wrl.3.gmail; Tue, 02 Jun
 2020 07:16:58 -0700 (PDT)
X-Received: by 2002:a5d:6144:: with SMTP id y4mr27789034wrt.185.1591107418445;
        Tue, 02 Jun 2020 07:16:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591107418; cv=none;
        d=google.com; s=arc-20160816;
        b=sEgHKqenD6yG536CxAt+0Kb1aqc6s65GokmcZLCAatHmstgQOeO7DBOriR88WPhJbC
         cYiFpaqhuzcozl+JlceG2GMVQlJfbpfDUkEbG2ly7WMXNyHaNmwva+otb0p9yEhf4wF4
         0J3HDNfg2nS1GEIUnZb23dSw36QUUJa5zL4Fup5XptR19r7cZlBPWPH0oXGtZ7PIY3+d
         gOK/TV0eQhv5AzY7E3W2odiigvTb1tZZ28vdops1zp1JN/1zLqIqOblZbCrWPdonDzU+
         wXuCMwOpWy/WRkM1cACNehe+GGqEo1AT6Cz8WvXI4mDQ51D8poucfz8aEjpV4MORQtPT
         0D5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=HD0IteFTpE30xMUGYyKDylJGNjYXfxNNWNLRoGYXrhE=;
        b=K7GhR01y4ws0KVftgtpPcNPy3ag87RPS6h/bVLo04fAb4Bpg6R7Mu8nlP+A2iDcfHK
         SMpkbsQWROGl3LPiapanq0KuE0uCXemPLtmHmWtiU3FYSAQyJRTvPvsbNwZQI9QOciIm
         hflNNN/KhBwhAqfIyD9AeYA4UT3/FLE2eRTXPerejA/bLmamUIOHrhYgoMYgTLYLN3a+
         TEx7/h/mQ8ud7mv1MUIgkpV2UprtswiQ/xNCkYOwUxBayR3F5jRUEawJ3Zsf3kAyi1u2
         6aEa6u4RC4ZuEuqfYhvDeDoh0rqZEE7gizLbexHQOpCogWU17IcfY8ififGeSgdiY+aL
         9Yww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s137si132730wme.2.2020.06.02.07.16.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jun 2020 07:16:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 052EGw6s028759
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:58 +0200
Received: from md1f2u6c.ww002.siemens.net ([167.87.142.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 052EGcdN028463
	for <jailhouse-dev@googlegroups.com>; Tue, 2 Jun 2020 16:16:57 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 14/15] configs: arm64: Fix hikey memory region overlap
Date: Tue,  2 Jun 2020 16:16:37 +0200
Message-Id: <0a2212a06dff9de94548c99979fe83b5de7cff38.1591107398.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591107398.git.jan.kiszka@siemens.com>
References: <cover.1591107398.git.jan.kiszka@siemens.com>
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

Reported by config checker: RAM and ivshmem were overlapping.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/hikey.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 71489abf..4aadfaae 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -86,7 +86,7 @@ struct {
 		/* RAM + mailbox? (permissive) */ {
 			.phys_start = 0x0,
 			.virt_start = 0x0,
-			.size = 0x7c000000,
+			.size = 0x7bf00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0a2212a06dff9de94548c99979fe83b5de7cff38.1591107398.git.jan.kiszka%40siemens.com.
