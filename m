Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBJU6T2CQMGQEQELQEGY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 193FC38C52C
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 12:44:55 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id n127-20020a1c27850000b02901717a27c785sf3679950wmn.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 21 May 2021 03:44:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1621593894; cv=pass;
        d=google.com; s=arc-20160816;
        b=XMGJ6/Z/EvGKzVb34B7RIRcKyqvOPyIMnB+Wk6F+j6GkjjXiKuL+rXgYr5gDw+SRp6
         D1QCq2ozpMr3ahRDdfrktkiB9Kxdh0bbuxITX3Ba26q9+Aa9LJpkPZux5BHJypepPrZ+
         pePIOOJJe+vK3PphX7k7rvCe9HuRQRe3zUCdJrQ+lqNXTCWUiSf0y9o6rKCg/iwC0ICL
         Lxw3iIoT7fltHSaFiNXYIXZBBcEW8juNceKsnza0fy9o/ThwsxB9kxJET3eiUHWXQvgn
         Rg4sSVLjKUy2y7dlj9xRHmNHME7ua/wspZssHm+85+jerl+xwfqsz7J+tX4qu/fXjQjL
         Sz+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=znCN8p9QObBRDGkOTvsdt87lQJjSqvpz0Oah+/PXQZc=;
        b=JzcC52ryHvru1nagAAQoJl7G6V7GuSsWCP2pQgulWy/EfI7Ip2OPPAcZbsEgTO3dMd
         w/Y3LB1YSH7uTRmVXwAnqlAKI3kxEeSqap7hQmvRD2St7/gVgySITy4SFgY8xg0fYozd
         Lu6BPBeQ5Q5t6ChvGzrfKp0FSBcTZaUneuACvayuHffGWVnd6lZJXrDWvEqBT9q7lrcQ
         a7pf0Aq8vqwWfR/63jP5uOG/WqsN2A4WL2q0PsZ0N8z6yZiSa11LhRDXjCYj8nnAwUO3
         Mup1EiVoyiIswJ6VB5wC3qoUu1jtRukIvb6cYLVB4wzqu0sshXTaRPEGh1entKV1qrlN
         58UQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=znCN8p9QObBRDGkOTvsdt87lQJjSqvpz0Oah+/PXQZc=;
        b=oduPdowkLQkusUnNpvWzXmLQWJtiGfihd7YlCfy+AkQVCBdZp2ObH90yqlIM+VyKWb
         tia5lNm9qkKeHjdQ2M2LrdalXsHoqMYEFYoSb631XdHUEwUI4wtduXV/qWuVFhe8GFjw
         67Kh5O8ng++lP6wfFtbwdappy1l6tITyCBMuXrcEti0TOCZ/YK2rExezPgT9T9LkcBtz
         TdvhczFBnZpOp/ksSaOMX4K5MKqbmQQozV7LfUxpzPAB9CPeBS09fE/NGKvCkEvWj+wf
         HwmVyB2Ka5a6Uw0Mm565NwG7A/zM2UjN4DAy3rwbOhQisxBkLHJK+1eUuSPaRgToAZGm
         DpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=znCN8p9QObBRDGkOTvsdt87lQJjSqvpz0Oah+/PXQZc=;
        b=LGIaFn9DoCVeuOJSH1gXdtiU2IceqUpeCbQRSysj2Oj2UNlPXl1EBFxCiCKhrKdHZ/
         d9iZ7itb8SRNjyPIUsSfBfLT25CazAAwbmijXkFknOwOHB9vnXJUdhu84zhdokU99h9v
         L9TLiU3V/NrO7eXZopdFABHjDhV1p1ZdIFR5/aWpy/Umggd/D1Q+gGCK/lt1vhTw1RR8
         vEcE9IkUoPF1Mq+CGwAWadmLeeFOYzrcs05wYUCjZpu0UYMZuUxSzT7Jon/W4bQf879w
         tiw8dTLWxmOyYO8cMc2koEum4eqwXPOJ9TWD3vUY4v6T1qfyym3xSLAVh/k9dFv1QeiB
         FE8A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531GuPNiBXTdzLxHEHD0H4SsCuxOda8/FE4Xrng677TPipstpzME
	SLofIvMv+ZRml/hbJJINtos=
X-Google-Smtp-Source: ABdhPJyPfgWqNrdJcm7ihAYamyThRr5Ocrcraj1evoDU/bSh2y34J9gL2ge98pNschrlSVtI0jHlHA==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr1012159wma.39.1621593894842;
        Fri, 21 May 2021 03:44:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:db50:: with SMTP id f16ls3966867wrj.2.gmail; Fri, 21 May
 2021 03:44:53 -0700 (PDT)
X-Received: by 2002:adf:e0c6:: with SMTP id m6mr9243467wri.66.1621593893873;
        Fri, 21 May 2021 03:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621593893; cv=none;
        d=google.com; s=arc-20160816;
        b=d/qBiomC1eRDHmhNihPLqtNFceoqKFOhOc2UvBd6MfUOWGArM+oV8EDQF4y7dDDhvn
         hW3j0jEDXdbasrBHPeFhE3Lxts12h02cYVPF0A71h9peHmozKXwAFUtDcsFY8EDPALFL
         /Ef5W/n8BB/UNUi4KNz4U40BFK/0gMsIF1HM7y0Av2nm82WdkODekomBhHQZwYvdqxCK
         TdITimWVahGxYKnzLk5k+mQ54hsbX5tKj5ol3pnNbR8F5Y88eplvyziAKtlaTzCGiqc6
         mEL1Az0D9EqFlBLbfGFbk9y5QEmKuWBtLFwBAz5es5e5QxZUbjWtbfofg+jQUi1ovAYk
         xe4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Q/bRrT1wCOaMlxDxPcS3qU3qd4mlje1R76E9EAOmyVY=;
        b=UL4Hj9Q6T/naS4iCO2/bdMU2+nYGWqhpCgjWf9+1E8XZJH4USvcP/j7ycAoQdBpjLw
         VG3vuRC94Tfz0Yd+00AdHHcLr6t7hynn9fmA7ynear4U0TAydS3vEAwFZ2b9iN3F4wCI
         ALtsuhBESkSiiKjL2uj9MbxD7T0HPFZ4DQXfFA7ATD+TCgudooBD+HY39EVD+V5DFK9F
         FSklh8vr2FUjspqpeemZp2QBlh0Eb4wo5xhxn3da8ev0zt7qE+gPvF+C29von8CUmf9F
         jOkoR5sxP3MRQ1HY9ln7S4BFGaoxURKk3ULr3By3d87QO1CU28sCvgQXyVDEkZTRAacY
         cW6w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id w16si279252wmk.2.2021.05.21.03.44.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 21 May 2021 03:44:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 14LAireJ024423
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:44:53 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.240.49])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 14LAbYcH032504
	for <jailhouse-dev@googlegroups.com>; Fri, 21 May 2021 12:37:38 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH v3 12/22] non-root-initramfs: Purge buildroot download cache on cleanall
Date: Fri, 21 May 2021 12:37:24 +0200
Message-Id: <a719b357743c88ae4a99752661d4b18ef6df4fcc.1621593454.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1621593454.git.jan.kiszka@siemens.com>
References: <cover.1621593454.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
index de8c296..be1348a 100644
--- a/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
+++ b/recipes-core/non-root-initramfs/non-root-initramfs_2021.02.bb
@@ -35,3 +35,5 @@ do_prepare_build() {
 
 	ln -sf ${DISTRO_ARCH}-config .config
 }
+
+do_cleanall[cleandirs] += "${DL_DIR}/buildroot"
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a719b357743c88ae4a99752661d4b18ef6df4fcc.1621593454.git.jan.kiszka%40siemens.com.
