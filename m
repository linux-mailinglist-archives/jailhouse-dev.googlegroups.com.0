Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBAW242KQMGQEIDHAOKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F3D55B9B2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:13:39 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id x21-20020a05640226d500b00435bd7f9367sf7137988edd.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:13:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656335618; cv=pass;
        d=google.com; s=arc-20160816;
        b=J2V8ORFP8VeJEht9fUcyuqA2VwvTimysFcpO9VjfrIvbgrGSXTUnrdtr6lZVqPYL1y
         yGrzL2lO6yT5jATyrME2h8Vc0APYqc4vvZDSRhvPc9Aa6B3z4I3pUZlTS7eaTAXp3cDc
         OBOtX6GuJSyqF336CCmzVqr+Z2GRFc6TJdQnvWwStVMGMBHe7KlNXyJKT15xIVJYSgrZ
         9IDT0D2L5IpJSg+23f5L8o/Yb4Q9wJhp9rIypXABrcnqu367dq9pV8yAIYlMIZxalWiF
         x1aurd106nfGHbOQsXXLWAIYCjsKIgcCn1bkdG70i+yVcNDuJa3cO5DIUNtgAEsZXSQT
         QzDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=6iPgjvkjWuBWyLBehKptCgg9SO/jthHisbOzv50+EQY=;
        b=a7df+sEN1VhZBqUD7sY1ubP2+kR8G4SMuDnLHyJXjbFhRbH+xCit4f9W4WSp6hlo7o
         /tvezYWAbfQxz2UwYYMOnlfmJc7o0Qo2WmeD0NMiPN25u+9ofmu6+LdcnBa7PAJpfRNd
         LIKEmQog+RRVTF+/SC6x/UCyGsskwAy+swsq3warmC5RH9hxYGOYtol/uc/RfW2+tWnX
         QH+QwUSR4YiyTYoIa1s/mGjLSoA09V+btGx364e4DAZ+ZUPOqmTiIFna58oZp19772nm
         yjyXDw3mucRzOvSVVA/U9LedcEEOpRoT6oNji9Io+89dugg8EUrHRXASf0282TRA/oAP
         wZRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Po1pbkMn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6iPgjvkjWuBWyLBehKptCgg9SO/jthHisbOzv50+EQY=;
        b=PCqbJbB+LbENVqh8Qw+Y3+vJ9fpEvPkXwTIlyrhWlvM4kQYmIPzJ6CwWK6VMMSVcig
         cMvke5b7wxy7Pzz+PxV+bETn3VWDYqoV6zoXRxok1AMuycIjtZis82C3vvwRPxje9fH1
         66XAJN7wLpVRi10PFR0ENFfG3ATQeFSgBwSFpBpyn8ouhMVKcpjDr7RG3Z0y0jTjGVfP
         UajPXjOo//yF8PD9t82eFEFmTFTJvrjR98V1KJ0nE01iVXYXbjFZ0s9dp+QdXS82K2K4
         vDxdbP3VmZEjAsSv1D40425B4ZCBfBBjfUwOwF73LJcTyWNx1N9Jtxa+SFDUSKsHMV6m
         IIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6iPgjvkjWuBWyLBehKptCgg9SO/jthHisbOzv50+EQY=;
        b=14TjnM40oX9Wl/dB2DR6IXaAyLvLHDPBY2Ux4/z8LbszhKccfdqjG2kXJLfWcwV3xg
         JDJCoXSKp6GWSpRip3rks1d10U6L2v5d8R6atYoTK+sRq7KWPeS3T968ofJ04q6KAaBi
         GRjOpl8IeSatwEvwY09aUGvQb+AmH9mBjR1RQjTtHBk26X13d4pitPS+r1heQC05hKWt
         8TaEbu369wrIYRvIj+jXvND3Vbzl5EarlcRVH2eI36/8BwXLwAhPg4EhVF477mdaKlcI
         hFzvoV+OrKS+0R3im0eLGVJ7guQy66xoAbU3gD9BL48tTz3C3qAIUFnz+qbB6ewkb6Ji
         szyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora966fKVU29Y6iTLJUvl9HXGB9nx/HqwkfQ9z18BhHFjAplLYWxV
	2xIdaGDOx+YYRW8m0LuiYUw=
X-Google-Smtp-Source: AGRyM1vl6Bv5YeJJO8lReZB23MF41AOdmYe8GacxHSYIFpKJt7mul28UV9zuny/mJG3Rya5MVBHbBA==
X-Received: by 2002:a05:6402:2753:b0:431:9c8b:5635 with SMTP id z19-20020a056402275300b004319c8b5635mr16399073edd.152.1656335618619;
        Mon, 27 Jun 2022 06:13:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:95c1:b0:6ff:45d:c05d with SMTP id
 n1-20020a17090695c100b006ff045dc05dls4075159ejy.5.gmail; Mon, 27 Jun 2022
 06:13:37 -0700 (PDT)
X-Received: by 2002:a17:906:14d:b0:711:ffc4:3932 with SMTP id 13-20020a170906014d00b00711ffc43932mr12682924ejh.321.1656335616939;
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656335616; cv=none;
        d=google.com; s=arc-20160816;
        b=GgxwdnsZ0t+DQC+xwd5j9X14jLQqrzNvvETDSg9WKuGyl2Z11srjPAq/SzI+pZAkJs
         EQjhdAad1SzeRqr4bMm1h+yksWMhJeBC8o3tM4mNxydhdKifmtoo7mQLrhQ8YKT53Vpy
         cy7JsY5Xs4+iLpIgWWNN4QVt+fl9LR5bmgiV2FVNj3j1PgFhnlDjYFpmsUjX05KmfDcT
         PHI9ybQvoL0nVr6fRh/Y78aUGMFsZAkHW90XmZ//ZTM9pu5DAmxroK0yEpMi2aauD9tk
         XE8IUFjWYA8n9TeA8GfxTbotIS95qFQ5QzmgcLzq7LYxkDlp5XgnAd7lNYLr+xt8Hm6U
         p2vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=GD8QuGxSu+XJ/39ibuWDHtsUimVRKACnZg/VqM1vSRo=;
        b=RgtHv863SP2qcad2kCnOpYHFORboYx4vMrDNC/SP3tNupbWpg8GCSmU+pZAWXrDyx5
         2IzIJKWXuSFVBY6GV0ZkQflhoJrzFnLjffsLdD/uLTAynW+YpdZ2HA6MqgdSHNEg6D9D
         xEmJ26jNQQLDE+FG/UyjS6xtBaUpiN6POoo1NhTACEpmy8H5ZgCxErbCOMDLSNRNbHZU
         F+5+aheEoaRt7adv/s9JzXppx4MK/MSFjvAhTIaDWIB276zprMVwHJjSmG9vpcVahe0E
         mFEzCI2Xft3KZoPlX7x6zxfUsvqqgELOTGKoBvPHmkhaofkYi8s7iVR1PdBstRY5enVD
         pTgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Po1pbkMn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id i24-20020a0564020f1800b004319ce84356si413750eda.4.2022.06.27.06.13.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:13:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWp803pBHzxvr;
	Mon, 27 Jun 2022 15:13:36 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:13:36 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 04/20] core: Clarify invocation context of arch_flush_cell_vcpu_caches
Date: Mon, 27 Jun 2022 15:13:13 +0200
Message-ID: <20220627131329.3659-5-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627131329.3659-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=Po1pbkMn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This service only works for cells that are suspended. Add this to the
common function description. Also drop the redundant note from the ARM
implementation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm-common/control.c   | 1 -
 hypervisor/include/jailhouse/control.h | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/control.c b/hypervisor/arch/arm-common/control.c
index 400490ae..44c66225 100644
--- a/hypervisor/arch/arm-common/control.c
+++ b/hypervisor/arch/arm-common/control.c
@@ -200,7 +200,6 @@ void arch_cell_destroy(struct cell *cell)
 	arm_paging_cell_destroy(cell);
 }
 
-/* Note: only supports synchronous flushing as triggered by config_commit! */
 void arch_flush_cell_vcpu_caches(struct cell *cell)
 {
 	unsigned int cpu;
diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index e0c21270..9d1e74fa 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -228,6 +228,8 @@ int arch_unmap_memory_region(struct cell *cell,
  * got restricted, and the cell should keep running.
  * @param cell		Cell for which the caches should get flushed
  *
+ * @note Target cell must be suspended.
+ *
  * @see public_per_cpu::flush_vcpu_caches
  */
 void arch_flush_cell_vcpu_caches(struct cell *cell);
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627131329.3659-5-ralf.ramsauer%40oth-regensburg.de.
