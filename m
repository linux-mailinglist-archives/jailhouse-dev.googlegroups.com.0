Return-Path: <jailhouse-dev+bncBCFKT2ENXMKRB6ETW2PAMGQEP32MPXY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x737.google.com (mail-qk1-x737.google.com [IPv6:2607:f8b0:4864:20::737])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BDD6771B7
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:09:46 +0100 (CET)
Received: by mail-qk1-x737.google.com with SMTP id w17-20020a05620a425100b00706bf3b459esf7458741qko.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:09:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674414584; cv=pass;
        d=google.com; s=arc-20160816;
        b=DLlVyUP9oaVjAvbyLpq3JMEaqbkajtzOPMpyqsCDfIj5KuC1fAQdxMBHKMO1z7bJ9Y
         AoR8aqsqOsMI0eDLZBh3sEQMrlugr5O/uv7d9WelvnsMaZPZFcwWQJj43TQQYAt+pBXJ
         smjqSLZZO7vRYUqXdCbq5UZaMGzbyRUKhLZNf53PQ3I1GmmVjXHWMA67GnPDUfKymQt+
         JOLr31NWjd+WbR7hkbZPo46gKqilmfSXRpd71aveiMndTiz2DuBhHg3GwVfQ50fjaHO+
         WFgHJaeOkyFIZ0ZstciCAji9EME2GmyZO99EQXKUEdxjvyDlCDf/D5SSxkPLgOIEo2Yp
         AvSw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=Uq4fAYIsE1j2+5vceSeUpiiJdGvumevj1vKxAlQGcc0=;
        b=B5FQIaUf9D3DLiipYNNeoFyimvtEt3CGrepsOT1tP3Ks2NI1zZTxfbcvTxYf93zqYt
         sgj/8WFCyF2I9zd6wwD0z7xMlYnylJidQgj3qK0vWH2fALs0jbk/gl8j/2pNPFjjv81w
         zPt6wBo0UtbnPOnjRtjV9U5gl6NfNJPQxeQudBEx0syXQVQU/Ddvfx7bsz8d52k0+ZVw
         p1a98bznsNZJzt7Fu8f06KqS7oIack0gy6qckaZrMAars315PvdpDkwvMYNGTOpb2YcJ
         UycIzge8OaeQQv2WV0BlYeYkgrtvg93IxsktyoMUYSzixjd4gV1b+dhYKJIVV1lugExj
         xyeA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:message-id:date:subject:cc:to:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Uq4fAYIsE1j2+5vceSeUpiiJdGvumevj1vKxAlQGcc0=;
        b=nwp8iNL0cWYxU4yv5u1hY+Q6R29Pqjzss+T4rqYlPxiT5TLiceyKdLIiXbDnMDAUTs
         CxFcRE9Vz7q7UzoBfOla07RpAAThSR3R9TAv9K9jtGGWWeUimU9HMocc3Fs+NziNRtsc
         Xk77wYr1TudGYG8PuN5ZfagzXePkzFwLm+M/Ib/Vrcw1Li/VyBrb1lMTg2gbvX37h4Lz
         CGA9CHF+pmGTCHesFfQxtT7vQhHhcPIEwxCgl5tfsCgZfq3k6y+hL8wwVAVgVwArHfcN
         LmQQ+H/o9aPnpxPM2vLfufNMQoQhbDPYuJFVaMq/SMiHhBy3e+nPW51mlKHQhQ1WtJWo
         nXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:message-id:date
         :subject:cc:to:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uq4fAYIsE1j2+5vceSeUpiiJdGvumevj1vKxAlQGcc0=;
        b=Ge1BvjcZRFMJswlQ8+nrgF+7tlpL9Hj1/2yITf+mQyj4i51bhM3hMRUMgJEPaOMWjT
         3evcuCp+4Q0eM0xDGPOsntNq5irrdhqoWG6o5MJebIfwzkWjHsROshm/kgIz46awMTid
         +uX8zYtYTtg1hHxqftU84ff+RVA1sO8k1bxSWmWVFvP2HTqHP/ShFaj1lW1eR//LRZyH
         AjqWsVIW+lwMvPtw1wKIUAppmYZKTbG6aiqXW+URu20bEusk8nhPqAQ7lteOQ3KX6ZjJ
         WnMWfk0TVN72Bfo8+qQmaUqGxNYRGPQ+wl9pmeer/jbmL/Nvy21MBWNdA2Ts2d29fxrj
         zYqA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krqZFbDyfrnuJLasJret3gpB5c0/fM0gx0UAH6/E4f8JZkYJaPg
	r/xAjc/EyuV0VO5ofgYD0do=
X-Google-Smtp-Source: AMrXdXt3SQmc4WrUeNwKrGe0EvvTGSCLo+kM4z8e+//FUvT4AExsWYhNjMDbq/BSOBxtLcfzkPHDzg==
X-Received: by 2002:a05:620a:88a:b0:705:ce7f:5b6f with SMTP id b10-20020a05620a088a00b00705ce7f5b6fmr1302139qka.566.1674414584775;
        Sun, 22 Jan 2023 11:09:44 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4745:0:b0:3b6:3041:f96c with SMTP id k5-20020ac84745000000b003b63041f96cls7854388qtp.10.-pod-prod-gmail;
 Sun, 22 Jan 2023 11:09:44 -0800 (PST)
X-Received: by 2002:ac8:7778:0:b0:3b6:92db:48d1 with SMTP id h24-20020ac87778000000b003b692db48d1mr16417697qtu.11.1674414584180;
        Sun, 22 Jan 2023 11:09:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674414584; cv=none;
        d=google.com; s=arc-20160816;
        b=FhRWLcwqvHLoaFo+Q824C73HzxxbFPycDQ9AdOZCGtwnQ53kIvTr0D3JvmkHW83651
         IaWPTIx9ATHkuQlG7wjPjL5WNu1EdcvN3d9MdceF6b0AXVN0tQADCk7as+5Uf+j0DU7L
         0Pa8+3j/Bb0TAe711blolwrlBU0mr6gman1NfAbN8TNAIV4CeYzRMxpXzfPwgarycSsz
         UVyHu+ev/efi4fVafoAOw7gQmoiCFHGBMt242FqgfuEqVEKuuYVNRPMteCJIIHqQEzb6
         ETtNZC6YM0dzhqHZfw48uwIk0DYX0PonDLY1GkaEqeE490JsR3B0cg5rU1r0A/Ghop8T
         nXGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from;
        bh=buTk6Qczycpp6ehoYYgffVLf/flU/ymVX5ACDmgqwtA=;
        b=hm7OfEKx2e5pwOfOxwndMWDfVR6+t3DABXWOrwUUnPhoEwtCqIS7x6v7BLcz1C/DrT
         kcFoY0BJDg8T96ZAxDipK+TJxna9Dkx9AlR0PtH9lYpTf/FL33L44tYVjJEwhLkTBP+4
         DhT9ktwXKR53+3fnliyCtcvmvy/Nry1LkczX3IhHDaQxxdFf04wEKrzIb4UPFf8esGjn
         6j+kbRS6WaVarPWIoPEQzArbBK9X/Ys70IK8WX9Id8dNffH0MsDzAVw2u6+8YJUgzpjP
         2c8etNNFA7hl560B7W9gnZnl4xS2YE3pas6RiUmM6+FhvBmT+PJpH/ibGq7yg1z3GHMa
         unfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com. [210.160.252.171])
        by gmr-mx.google.com with ESMTP id g27-20020ac84b7b000000b003b63b24c87dsi1291573qts.0.2023.01.22.11.09.42
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 11:09:43 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates 210.160.252.171 as permitted sender) client-ip=210.160.252.171;
X-IronPort-AV: E=Sophos;i="5.97,237,1669042800"; 
   d="scan'208";a="147111271"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jan 2023 04:09:40 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id F325B406A4EF;
	Mon, 23 Jan 2023 04:09:38 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	jailhouse-dev@googlegroups.com
Cc: Chris Paterson <chris.paterson2@renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] README: Add Renesas RZ/G2M to the list of supported hardware
Date: Sun, 22 Jan 2023 19:09:13 +0000
Message-Id: <20230122190913.5196-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Original-Sender: prabhakar.mahadev-lad.rj@bp.renesas.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of prabhakar.mahadev-lad.rj@bp.renesas.com designates
 210.160.252.171 as permitted sender) smtp.mailfrom=prabhakar.mahadev-lad.rj@bp.renesas.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=renesas.com
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

Add Renesas RZ/G2M to the list of supported hardware.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 README.md | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/README.md b/README.md
index dc2c3afa..2ab2a60a 100644
--- a/README.md
+++ b/README.md
@@ -134,6 +134,8 @@ Hardware requirements (preliminary)
 
     - NXP MCIMX8M-EVK
 
+    - Renesas RZ/G2M (HopeRun HiHope RZ/G2M platform)
+
 
 Software requirements
 ---------------------
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230122190913.5196-1-prabhakar.mahadev-lad.rj%40bp.renesas.com.
