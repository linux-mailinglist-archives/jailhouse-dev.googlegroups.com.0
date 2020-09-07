Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBUUS3D5AKGQED6T35VA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 771B325F7C2
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 12:20:03 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id i9sf4024194ljc.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599474003; cv=pass;
        d=google.com; s=arc-20160816;
        b=wO5Th6n2ojS1QEV34A2EKvpMRc+0vux7e+Ah+NCzshwiiPwgDu+uFKlovp0Wu2VQtX
         Quzq0r8o7/BP7s5TWr0YQK05x1VDN9p8lecfGf0OegZkZyJnJXcJusyNo4/bfMXftkHw
         T+ur0BH91o7RSDE3tPB3eOgM1pGKn5tZAmzsipYoqJdqrdR47PrFgyrm3pKlRVekVeKL
         y2qhv7egf2NBGVJ818fTjypsitSHilqQTNPFMojxNMpHi7SJjJH5RKsDwAebWNRIlBP9
         rN7pFdtwy6wwDZERdqihp6FUi+UW7I/oT96xEogp03TrLm1pAGc18cqSIWfhdxlpU0jP
         YMCg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=raBlfuMEYsA6rkyR6xvSZr/2ARAIL2wpGX6l2GVxzVQ=;
        b=cve2+FZawAUeBBvSr6ykX8ug9FbFqOEDLJEUHEpfsRy6oZ4lQsTKyICkNs+PhRvDM9
         KlQzLti/Zlc6CwUZlfsWnpi92aWugm1gG4+RqpICTRl0mS6Q55dLifgUqc9a2NXMoe+m
         qoIhPT9blcF9/7CXPWJU+sh/SweHh9Q3f8Sf1ADnP8ZDweDPFrNA1TKIPkODGtLWrV2p
         MwEdHB3Ur33TP1t6zu3PwyEg0f8/U2tjTRURRIe7//RrqdHBUl5qgajMUuY1qTi/8jA3
         ZiwxRnbt+2zdOaR5mHmVy4O2PvvWm8SlobDtl1FnnyIg2WoOULgnIOe4UhOR43/3ls8Q
         fA3A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=raBlfuMEYsA6rkyR6xvSZr/2ARAIL2wpGX6l2GVxzVQ=;
        b=WkDQifgOUNil0pO7j6n8FIZHwTFoC4z0gBWHo/oFjNUzd2tW39SbwQzT1HzHudW1Xl
         KpGcoaMv5ynQ5Es0Wkk2pEMgd+6fzdt7Srd7kk+MumVpcBsBhPGfTs/sW7dW8jrwtwKO
         K5doXMbN4L3FCinAvZfEhydIFl10bn1WL9lIuLflEqZ9V8vPYgdccNuIEOt6i8Ujv7IH
         DiDbDFEjGVqMee4haw0/t4fHX04iCokvEq2PqCGnQn3fC152zI5Y3GVflFRV2CzbNaBx
         ROYEV3oZ0uXujPcHc0uFyXr2bxEwlH1YTexVUUJk6CjGMJ3K+ZF0ocyg8lO+6/zS/QCu
         zzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=raBlfuMEYsA6rkyR6xvSZr/2ARAIL2wpGX6l2GVxzVQ=;
        b=aZDe4xxWPVADPu4Lb8ZYu2qJ5ba8zjSPFKR0NNyVzCBiOzA3lWhIajxh7wo9YU91NG
         wM1zIkcRV9YVZ+7mPSqm6IEjFxEtwzlufGvYtGqO0JtyVZfJs54uUwCMGJZMrVIRtft3
         43/lwxd8Oj543Ad3CJcZjpyIyuLS9MjkKBcqz3wNaDUG98jL+ymCzwo6pow9tt4aej7x
         MDkGoYuHGT6Ys+hEY+1AQ1mlkSNQfes+Ubk3BMdG4paglkuR7WmwKg7QFlMJhdnLFq2I
         YzHAmYAzj0YeMUHUaz19JeHzp4ThDvN0bcmg5Yv2JIxLSXQB/2QXpU6lNpW2eFyDJrq7
         yH0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530SGjmP3qDVvEe4RNExetoHsTJk5U6qchTZn5evITmox+VkXWbj
	0TtPS+EWVTOgAr57mk+unXQ=
X-Google-Smtp-Source: ABdhPJwR6rGNcW8zrremfirsXdpHPceDc1dsLEr6ISWzP+70NdXQin3l9CBZXP270VgiLOHxKYo7ww==
X-Received: by 2002:a2e:9410:: with SMTP id i16mr10660226ljh.443.1599474003004;
        Mon, 07 Sep 2020 03:20:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1642259lff.0.gmail; Mon, 07
 Sep 2020 03:20:02 -0700 (PDT)
X-Received: by 2002:ac2:5e2b:: with SMTP id o11mr9920755lfg.24.1599474001976;
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599474001; cv=none;
        d=google.com; s=arc-20160816;
        b=qkLeahUkY7g3U3tx+0yku5LUtMwIjIN/s1T498fkWnBUIq+Jc/4KaiN4+ltfotjPjZ
         9lZ3rGBWsQ22U6GJX7lEgJVoLpsNMX4gxZgH+0CP4Pm/9TvdmZcYx3zOJPjyt6BdtvZJ
         FhKeZV7HUlhw1hPrMXw1c+5ffpAIqH3WVusj0A6tS6puF18BQTBZ9F2e3Zzo6Lxjefi8
         KDHQIFVD1OK8BGGOfwaewvBM3YXd5rtbKPOpnLwm4keXE9VkS58GwojsjsIDolGZVVsB
         L8TMF2XQnTv0/kEahuTtui/r63+ydcp/i9+OrBozpwGGdVhuEILNC7jO6E0SsKW884A1
         nEyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=L4AeOe/1VA59qwIRLRP5ioDCEqMzC6b5I/HoSPwKLx4=;
        b=r4NsEQ+MUV5+6SyiPYdSohSeGKfgBAZTjV6JHs2FdC/6yJojbLyMuahZPjhc07HPEl
         WQ98vjLqekvRuc4fuLlB7jRiCnO25RVTnzowi1tG2K7aWU0xFXCCux4H3UqCEBDN4G9S
         HpLsky7C9Ao4JP3b1ffYjSOfxQ1EDJVb2dYpivXOPnedY39hoPfWQh0KgTz3CVYUzlyr
         UtMMu3l8OXyKv/eANbAKOyXDeXBKRH04DxPYqxJyPHJ9/AdfP7ic7VrIs8uLWNV1sFko
         I0dJMYe4hayid47E6oy+S3OHbzzEFVVNajOAVHgFvzOFUo8cdW+Fy2hmS5XJjXDGeVJF
         Us7A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id r13si80139ljm.3.2020.09.07.03.20.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Sep 2020 03:20:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 087AK1Gl014856
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:01 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.17.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 087AJx2F024503
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Sep 2020 12:20:00 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 4/8] pyjailhouse: sysfs_parser: Filter out AMD IOMMU memory regions
Date: Mon,  7 Sep 2020 12:19:55 +0200
Message-Id: <07378a910b85a911caa14eaf7d67d65cfdd6fc51.1599473999.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599473999.git.jan.kiszka@siemens.com>
References: <cover.1599473999.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

In case they are enabled while parsing the tree. Analogously to DMAR on
Intel, except that we do not need to keep them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 pyjailhouse/sysfs_parser.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index a2ce11a8..29c58b16 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -205,6 +205,9 @@ def parse_iomem(pcidevices):
         if r.typestr.find('dmar') >= 0:
             dmar_regions.append(r)
             append_r = False
+        # filter out AMD IOMMU regions
+        if r.typestr.find('amd_iommu') >= 0:
+            append_r = False
         if append_r:
             ret.append(r)
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/07378a910b85a911caa14eaf7d67d65cfdd6fc51.1599473999.git.jan.kiszka%40siemens.com.
