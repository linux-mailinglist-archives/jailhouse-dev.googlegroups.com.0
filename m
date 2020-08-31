Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNNWP5AKGQE6YTOQCY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id D93FB2577C7
	for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 12:53:53 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id 138sf2064761lff.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 03:53:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598871233; cv=pass;
        d=google.com; s=arc-20160816;
        b=U1VpjmyximyY9Ecx31wm+1Lbty9dekwRzY9bqMFNZ6ZRU10ihQHKXLVB8U7dC0ionM
         xDcLM6eJLhZ2jsHP8fQdWCEt7L6eZQDHBJOLrr+wn6as8LR8mZxh+Eh49PXDdUX03a7E
         GxBepIEzyN4JhBiBsg6eZ2unXNvVl4/wdD501ZfVm8FAAr7y7+D0F8xdVtZXOa8chk3h
         Aahz3Ms9kpk/eb+6K/w6h6G5RK/Z6w4ZcFl22dO79vSXXkDhm3YXNm2er/kvFiLOaQiv
         U8j0Yoccw3MbGdaTbkU09CIb7xRUyViA/f3EzdcwlHDbw6v1WUgU3KysCiSEbvdGIFAR
         Fj2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=g8pilEqFeeKDShk6FJCmm3rLjESFyFJ5ZucLzml0ZxU=;
        b=lV6+2NRE9jk1UXCA3saLggjWc/V9qiULTWkHeXF9ePmS8hbsJS1OGHmfazZ11hJPmB
         DOKhHhidt3LrLCClYCh8kTYaG1NB94+PtqxtdwHWo5d6r6vOu/Z+YbantYCabxPSZXlj
         iXczyVQ6Fx8OeafJIu0gGWU7WdyWzzD+ST6OK6L6qaG+lPUK5MsGbqphZ4rf9eEwWkon
         1vkv7GyOT+Rli+Y0GfiKFxqEKvXlApXbrF1BevdQ9CxeBPekxHaY/E1isl8CxJQKWFfC
         GkgM2I4zWKAfD9KBWo/OzHmQtXh01vuLMCXo5fGTFOReK+RA1p/PWTLw1TOGf3fms28D
         Hbmw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g8pilEqFeeKDShk6FJCmm3rLjESFyFJ5ZucLzml0ZxU=;
        b=juq+WO3GgHHbsnctMirtRiOsuz6zM/vX0QZG4VDYCC+1EqIIm3XqOiuxcWtti5bPE7
         QJnzgo8H/APgBdFeVpSci80SAwh30T67ZXwapO2gOMZAk+Wt7ugOVEilS0V1lvtR0TAl
         JjPLLCb6z7BkikhtNB5/wSMqtiDrrDX0SfUYMoD/2wX+ptF2FXwmy+NiTuJhrxINDDA/
         +rg7+BxjGQaNkI1GBYZXVvGLgsi5COrcanTbLmE1FS1kaWojSFElOEm7s2Iazrhg0zsu
         quJdZ/tQ5Ze+QP5eK61VEO1eVvRYrbHcXOg0SfQFf9IyE63pZs9BhzRLMAPV8fGYBC8l
         fJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=g8pilEqFeeKDShk6FJCmm3rLjESFyFJ5ZucLzml0ZxU=;
        b=gEFEdSMIkFnvwQGI5LITVaN4Ud8YZgXU0L44HbpskZeXj25ehHzFSsWkhavgWAtoaZ
         Do3NZIrxKv9Bo8OIIc+7dnozxxX8wG+nZ7OggLAusu+rXVjMgzVUevgvLe6W56+7slFO
         MkF5AgBUJSj7PQcyZTWIx8NWgt5Y+EqOlC3EAvpsLqNtMaIlblm9KcOX35jHrgEv/BGQ
         rYTqcsPbE9CeelYQHRXf6IPL4pqaVyjf6H7iWAYuvbkenTePelpryAnvGfXjqfOZ0QX1
         Exb9xWLE0YYBbCuSKDEg1eAs4oGLedn+bbvYVilylMl2lXYaptX7UCIMQf7DQKs4UGGj
         rHgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5335QHcrRD80rpAhoRNbm3orMHrNZSEVhrdL09Lx/jahp0vkVEiV
	eHY/13omTyLhKohsnpOrp0E=
X-Google-Smtp-Source: ABdhPJwXGK153eNh7oEeuWyoEt6Ie2m8UQ48cpYqNvdyk0FUY5/S2CmgVDrOwu+zhU46VK6DMhBCfw==
X-Received: by 2002:a2e:9047:: with SMTP id n7mr412010ljg.125.1598871233392;
        Mon, 31 Aug 2020 03:53:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9a58:: with SMTP id k24ls975966ljj.4.gmail; Mon, 31 Aug
 2020 03:53:52 -0700 (PDT)
X-Received: by 2002:a2e:9d17:: with SMTP id t23mr400847lji.456.1598871232425;
        Mon, 31 Aug 2020 03:53:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598871232; cv=none;
        d=google.com; s=arc-20160816;
        b=hThN9Yx/EdqSIpUadJzjqVmlE1i4Q6BBhlT/t6Hl/Peh8UiDDiq5CbVoOukTlF8YFL
         HNe9gLQyn6koE0vA/G53Fhwv4w3svEsfaXJNSiDt8sd9OCjH5slnKQUc7liuXzJpPIkO
         nFuqqbEUQYnbnXcHWnj2VktecAbj/mC6qegS//3hAj6tJfwIE5wRg/yaWxbJuXPkX0j/
         humP1gAEShj1KYvOqTJHpKpmQJY3hHhPnQn8VW0vnvA2t/QYzkELAHzIc5k0GmhaFO/S
         FHcIH4cbi1tfRcjgPekGEx4tlyo04JLpljTEQ8//iRX/5LNulhcljSUL+N8EKiAtGC3g
         FcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=tJChUFd2QN7OLUCcZWVr4/ZdWAYrf234fHaXl9QUngo=;
        b=jIMzlXfAocK8Xd2hcJ7twu5ImukneFEGoEDLYiIcAiLVej8IrfJHbVj1cQP1UP7w1Y
         /a6eBi5ErN3QN4O/WDncaQtfQGZPt4qWyZh0m1dTS17Qj5ptIkW3J6KpSfEBWM0DHfMj
         nrsabctxjkjSXx6I1KxKGvMHWublEZdu8sB6pLJ6OPqLS1Dl7itBVapA0nsKg1ngLAXx
         suNozE4tHoAz5dXH4z8qmMP5zj/ArIK3yuoI7H7yABA6PorGTm/TWD4U/ti/N6Usbep0
         5MeaKvBeWWvZsuCFnwjknR16I/FQBBLDi2VmrccIIV4U9QetLVnJEcJlN1o2mQZaSvjE
         BAfQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a23si271911lji.7.2020.08.31.03.53.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VAroGE015386
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:51 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.104])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VArnQk026382
	for <jailhouse-dev@googlegroups.com>; Mon, 31 Aug 2020 12:53:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 4/5] Update Isar revision
Date: Mon, 31 Aug 2020 12:53:48 +0200
Message-Id: <723952bad4215058ac6b4858c0a81a13395e28bd.1598871229.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1598871229.git.jan.kiszka@siemens.com>
References: <cover.1598871229.git.jan.kiszka@siemens.com>
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
 kas.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kas.yml b/kas.yml
index f710cae..6c3c987 100644
--- a/kas.yml
+++ b/kas.yml
@@ -21,7 +21,7 @@ repos:
 
   isar:
     url: https://github.com/ilbers/isar
-    refspec: 351af175bc54a201c6f44307d4e998bd6c0afdb8
+    refspec: 93658f7a72679c89e14adc7bbdbf3f5d52b7ac0d
     layers:
       meta:
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/723952bad4215058ac6b4858c0a81a13395e28bd.1598871229.git.jan.kiszka%40siemens.com.
