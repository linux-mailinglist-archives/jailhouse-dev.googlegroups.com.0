Return-Path: <jailhouse-dev+bncBDLLHGGZ5YEBBAVD6D3AKGQEOICQQOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7721F08E7
	for <lists+jailhouse-dev@lfdr.de>; Sat,  6 Jun 2020 23:58:27 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id z10sf5471726wrs.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 06 Jun 2020 14:58:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591480707; cv=pass;
        d=google.com; s=arc-20160816;
        b=qX9+PIAkytmNiZBfcQAyqrii5j12J4JIF9xv72aA/ksc2oaWGkhVaqtCgZaBkx6lx5
         GB6jZjF9WeXXdL08NBgp712hMVl9bo8Xl01U9Q3S49rnzDinxB38HRcX6ipxmggFGtDx
         zEC+eQo+jv25rf/PHSdSSKsOu2Ed6Z2CBMAH0mSIxtfM8kXHJfp2zquEGd01bSXqXCAr
         TP53fA9D8nOakjLrROf+3OJKHcSWxE0D5GFnX9AJ4bCZVVSjtW0IkvH2vCvYZXz/IRLn
         FCpISdfcM9+EXaoRkMrbvUPI8b5dyco3txpGystjTIJHwC9k3JSCgzfbHib7LXksZnu9
         O+pg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:sender
         :dkim-signature;
        bh=yKxPbt5Pr8Wlc2OcOfe2tDGeYMcXkJSHRX5v65WxgYk=;
        b=hhVPhAhUzB363hDGObqgyCEQ2lTJgjPmydUir8Rd1YE91i7DjCBe9jVlx7b5FPIjyH
         VlbbCFitAOZ+f7ar3J0Df3Fljgs4285s1Z27dma7qeDku7ymekzNbm0uwitKCMA7EE7f
         YMRtKYRPtsPMUQU9eqjvMztEp3OziANk6Qx9k4JV8XxK9xp9+yhsC4XniC6gbK+p9KoJ
         +dyKk+E2KINf65HqjiW2XdE7nvclvtDS52tionnl6tPEFoR7fgjX8ag+JZpNE67jb+21
         uwwShWfxTYdpglWCUA1DlrOCEj7dAnz7pAr4EebZOojLPLeJsEw9hWgpK23CsVrLHD50
         Nw0A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of thomas.petazzoni@bootlin.com designates 217.70.183.198 as permitted sender) smtp.mailfrom=thomas.petazzoni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :organization:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yKxPbt5Pr8Wlc2OcOfe2tDGeYMcXkJSHRX5v65WxgYk=;
        b=O+bQZlR9Ts3NcKQ4jGBW9mS3xdcVxcNE5x5Y/akg9gfXXsNEJbi959CvbtSkHbJi/C
         q17HprZ1xjqMW+6gYyWFgluUfwBdGuOZQ9my8OjEFVFXkc18ZabKUVmWYtsLHzTPSJG1
         nhZDwR6OhKv717lKUjYr4fTQKukGoO1VLEEo++j8lRcnwQ23Czzp/RFoETtvTRw2Irhe
         reK+qwoPYZeuUzpKkJibWU4abmA70E3j7MT6wuhpZG7c3Heskuh6o/A+kVQQIqU/PHlT
         cLUo1vgmOF54+tlQBr/6AxZp64uamzbNNK8hK5wYVBWTwYCBy67P0AT3YUJr56+ZL1Mq
         rPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:organization:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yKxPbt5Pr8Wlc2OcOfe2tDGeYMcXkJSHRX5v65WxgYk=;
        b=QPIzMMp5dAqAkp3KS85A8BAsMYkBBTYjEDNc5SzOCP9nMd6L+elwLGb1BoLqmL3/tO
         7pTXW+13Y1JTH5ehmeB+O1ck3ViMi8JiTuVkxxnRD+Dq/3l4SEE/YHDQ++yH0nQshA/Z
         YkNEdlTLyx7H3EEIeJpHm8cZ73nqsifAQGxE6s2jNpBsHbq3cEk261JOrtgf0aE0UOIN
         pF3p8/R5uXegj0U/3jbkKk9wDM5KyGoFdAaLtu9JxzWZKtrC3x7Z2VzIbjhqQJfDW0VR
         YuWlmBVaIdkvpwuI24CDQ28LvXK6cmh9BcLjtDr/pv3xCte8N3Um4p9BXzpQBscU2eAs
         t1+w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531NHMaF5PtshRSgKQtYCPcnsKmvwPo0LKFab/rlmnAhvB23Xx4D
	KHoz+NVRSbmXx9mX8QGbVEs=
X-Google-Smtp-Source: ABdhPJxPOUsd2fpRidwmsEye5yzQDVgTAsI5wLhgx8Sh6h0ZLdt067Q6THB2Qh72TeYln3ynr9fsrA==
X-Received: by 2002:a05:600c:2259:: with SMTP id a25mr9356579wmm.32.1591480707056;
        Sat, 06 Jun 2020 14:58:27 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:cc0a:: with SMTP id h10ls6101209wmb.3.gmail; Sat, 06 Jun
 2020 14:58:26 -0700 (PDT)
X-Received: by 2002:a05:600c:2945:: with SMTP id n5mr9617672wmd.189.1591480706308;
        Sat, 06 Jun 2020 14:58:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591480706; cv=none;
        d=google.com; s=arc-20160816;
        b=lhgMtVsFF0d3/YaKI2Dpb2/c+PrJGNuatUTADCH9bXWSH8qZ6e07eIJpMCKKFlHsvK
         gOyutMdTxfErV24A2KIK5XaN7PkbQk203xodboE3ojK4eLkEXHhR7G3u99N9RKzP1k1c
         tzbGatwBHCYGAEcQoAihuEuzbRM3OvR3cG7SAopHlIviackz9Yi2a3NBK5TE5lRFucyl
         b490a3YF9bYjNRrsKZQ0dZAikGOT9IRwExXpBRrbb/nIo1AF8rZEs5QhqVuMEHrs40E5
         Cxl9yw7JpniHKPXwPUGJsoXP3IZdEnQHRGq8ktY/YFcvVG9A8ygso7zPMn7oTERQGqfg
         n3Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=/JJx+ipqcGu86H1RH2lncBkxPHbp16rpZAief5yDxZ4=;
        b=C92ivGbAqhTmejBDS7k8a1aDFMxvahUKyRnrOazYpOnqwSyPn7Invlxd4JLc8lsrM9
         G0HWMzaQry4/79RrZZ2ig4nUKIVBtWtUB6X+89LbehmiG/VXJ4WdRMXc9tq71RjrcxK6
         1ocYoXvo9YIocl0U/FFO/bPLJ/eCICvnVacRoG+iBs4Ar2Vr7xuSZvBsBeUAoxD+yQOn
         zGcV+iAGZvzbVdxLYPZRO4H7b9uyZT5G7ozthRkvCbfHhVkyRfaxGQl8IeNCL2SIcnhI
         xG0bC437wz68gh09/+4qHEWW08As/0gZ/Xz7KMt6HSvy4PZ5+LS5ORqryQvy4gEooLB1
         bVXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of thomas.petazzoni@bootlin.com designates 217.70.183.198 as permitted sender) smtp.mailfrom=thomas.petazzoni@bootlin.com
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net. [217.70.183.198])
        by gmr-mx.google.com with ESMTPS id y65si563883wmb.0.2020.06.06.14.58.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 06 Jun 2020 14:58:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of thomas.petazzoni@bootlin.com designates 217.70.183.198 as permitted sender) client-ip=217.70.183.198;
X-Originating-IP: 86.210.146.109
Received: from windsurf (lfbn-tou-1-915-109.w86-210.abo.wanadoo.fr [86.210.146.109])
	(Authenticated sender: thomas.petazzoni@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id AB7C3C0002;
	Sat,  6 Jun 2020 21:58:25 +0000 (UTC)
Date: Sat, 6 Jun 2020 23:58:25 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Mario Mintel <mariomintel@gmail.com>
Cc: buildroot@buildroot.org, jailhouse-dev@googlegroups.com,
 ralf.ramsauer@oth-regensburg.de
Subject: Re: [Buildroot] [PATCH 1/2] package/jailhouse: bump version to 0.12
Message-ID: <20200606235825.3346f9f3@windsurf>
In-Reply-To: <20200528144333.49268-2-mariomintel@gmail.com>
References: <20200528144333.49268-1-mariomintel@gmail.com>
	<20200528144333.49268-2-mariomintel@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: thomas.petazzoni@bootlin.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of thomas.petazzoni@bootlin.com designates 217.70.183.198
 as permitted sender) smtp.mailfrom=thomas.petazzoni@bootlin.com
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

On Thu, 28 May 2020 16:43:32 +0200
Mario Mintel <mariomintel@gmail.com> wrote:

> Signed-off-by: Mario Mintel <mariomintel@gmail.com>
> ---
>  package/jailhouse/jailhouse.hash | 2 +-
>  package/jailhouse/jailhouse.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200606235825.3346f9f3%40windsurf.
