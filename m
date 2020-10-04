Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFX5D5QKGQE3TUQHYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x337.google.com (mail-wm1-x337.google.com [IPv6:2a00:1450:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C94F282CB9
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:13 +0200 (CEST)
Received: by mail-wm1-x337.google.com with SMTP id d76sf365980wmd.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838013; cv=pass;
        d=google.com; s=arc-20160816;
        b=FfdeYIiRVbygTVD22BcMRd6fQnafHlC64hRfopJmLVzBeg7A6SXZIYMdoWRmIBy3MX
         XqRCu04FLvT0UyvIHsnXb+81w7a0z7R4BghVjA7PSaC3/LHAFwpy5BE+bBRJtdrRsiEl
         izmJpIk+yXMRpExHNbzrDDN2u3FYMtCdcrj0OiJ4pLZG7gsGn0nf/DFlQ0GrxJcVVTOO
         4yieLyqm85veytXD9VA7c9zE6SiEgrwe/VNr1ZWyIKCHOI9zXEMEJxN0ABQQBo1odw+n
         T6K6rpArjzzRfFZO5fmlAejykUyJ/PwJc+t52VS6E+DDgsZ0BHLEmSYOxuVZDav1FGoY
         KcTA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=+hCjlrr6MIVZPObcCx2J/4MClJ9M3altRpQLptd1d4A=;
        b=AQiWSDO0Peeo3fjQrKX3dQ75codhgzeImJc1MxWjflGmg5ww8dWl20ryhKEpqgBq0W
         i6yziI96o7WMl+qah3rzAmi0BxWm9IWGfr4CiYGUiUATo2PShb6ARX+m23CUhLHiNdWZ
         Zi3r9wMZfQ6Cx+Moiz8tMRKgu8rRUHMO1wac7qJemTXTA/pLAo+q4EqbvlszYVYd2nib
         tEolXZ80JXHzuZkDTaIQqqQtWoace38OqdAez9O+51/MAtzep7lftBDES0xHT+MIWLnI
         RqgQ88R2j9gd5ZIzfTtC33csJn8V+wYx+fSxKTUFxv4LLJ+50HI1xZcOcslJzLC+axEy
         cBOA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+hCjlrr6MIVZPObcCx2J/4MClJ9M3altRpQLptd1d4A=;
        b=Ev4jkaWNM/q6oMp4DeWBYFkSZIydQJ99mv/GPjZR9LjybnljM4NI/oxJ2NWBlyOtWC
         w5AjDDfjjitSQEjdIDBAeyo2AD9zJCxgHGYjF4DQkrs7ztTyd6otDPkNdQzkUwNhp/fD
         0xCN2n4EhmWSthxltIJuaflFZOmJX8lneTP6aQu1ldEhyMa9epU5CoIf6DT/cd2Hbww2
         dlSsen3117suho/cmswkuA3HClIdZnFO4248ia51ySwxkbKqKsFnjivzJPiTvWeD2Stb
         f1diPo3iVWc7yJevQMt79Ral/YIHlpFnPYNTb7xnaV62KdJmII5jeKTrzc/vlKbNxl09
         HTNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+hCjlrr6MIVZPObcCx2J/4MClJ9M3altRpQLptd1d4A=;
        b=Pk8ZmJ7fxTdzcAC+FkVWk1QazDXi5WGYgfaN1R49LNgwe2pBvWeVO9OxC84rJ/b2PO
         CS6F8OjkbhU49pW1JtBFZYBJkKvRNcj01w4yZCJBZ3bv4gXZsvr5Opv29eZFHZ3QKbuv
         jDpXhT8qIIQmc1OwaufGVEyj/ef7nhwTbKEMZ4OXFN0GFGHAQjI0YpHKEV+ncp4zuStZ
         sMEUSckRMR+TeygNc52EGitbDnKtwilTOzjh6IgA3PHM7Y/PpmYDJ4gqK27LPat3gKdf
         pSHZkokpAwwprytxNOwYf4i3TN3JLf5ws8bLsOrCVPuhKFgb5nchpm/JexBtX1gBgIzJ
         iLTw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Rj3rNNTV8bjH790ONQS1sMWfXrFV7Y1H00AKY6pjz/AXl/lKL
	lx0X8YtPBHM5dNdD12ezTiw=
X-Google-Smtp-Source: ABdhPJz6u44lU88oqJ4KXtEOrdPXp/gCmx43de4UsOsnlYix8Lyj6yGR5ODt1YJW4PDLAU1v+Bxdpg==
X-Received: by 2002:a5d:4bcf:: with SMTP id l15mr13926414wrt.132.1601838012951;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls5161326wrx.3.gmail; Sun, 04
 Oct 2020 12:00:11 -0700 (PDT)
X-Received: by 2002:adf:f701:: with SMTP id r1mr13773795wrp.341.1601838011801;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838011; cv=none;
        d=google.com; s=arc-20160816;
        b=xh2HjvgINA3jupTrHcdsjBvHJbbecVo/AlIC194VMJlj47Tfld9bNb+g/ucpVQU+8b
         hl0gZ9c2VsgauJo/RAEf4RTuPK/ROnAGIu6SiksuT8K1+RlMCKHgErLgSyfs5NnxG26C
         wrgrxoRjc4HOPgurFlG/Iyelng765lJ4npovRtKF6oJj80e/j90g+EJgyjTRI2kT0Y1O
         1wKb8ZfArL7MnowIe4W7Q5OLf7BgXTL6ojRC4F7p82XX3vEXKeM+vjV2kTbXtEtbmrqa
         vwLR2j6y7p1n9pU1ju24QGdRZIWK030O2n5rVPcerJAp4Qs89i9oBtuvjKhdDgh46/aL
         j28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Hiuwhv2+6qCVRNuoW/q9bmh5uvghtqR/8sUJxs4P2uI=;
        b=qhRZ59ltIgiMM7T8SYC4vE44FWZRH7TBFS8LWtLZSFqRL4mQymMWZgH6mwOv3ZveQb
         CQO5h3ZMJS8PY54uk9o9VWAp5RyLOizRDuSQY31rxo2hOrHaZayiILO6/wrIsl9wocuV
         yIg3k3yC9bcOg/bmepKJbCY5Q+MGbVomQXKW5l0MqEN3J1mVXEINys2zQkp+OJmRhAUc
         Fln0bhfwVo9mFF2lGxnRqWXKXszkUiQF0nGhiAfq7QkQA6YrWGKRtuXufkFywDnV1SN2
         abxRAQYL9m8UwtTFXsjXogmVd9WZEsoqma6n74hN2cIz3dOhHtBVAOlKlfhdoKyeaOYu
         EvdA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id z11si288167wrp.4.2020.10.04.12.00.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0BHY020393
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060S017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 16/45] arm64: smmu: Drop unneeded includes
Date: Sun,  4 Oct 2020 20:59:37 +0200
Message-Id: <cfe4b3af813358e9cf5aa4c22b7b421803499189.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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
 hypervisor/arch/arm64/smmu.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 9c10d75c..349cd0fc 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -11,16 +11,10 @@
  */
 
 #include <jailhouse/control.h>
-#include <jailhouse/ivshmem.h>
-#include <jailhouse/mmio.h>
-#include <jailhouse/paging.h>
-#include <jailhouse/pci.h>
 #include <jailhouse/printk.h>
-#include <jailhouse/string.h>
 #include <jailhouse/unit.h>
 #include <asm/iommu.h>
-#include <asm/spinlock.h>
-#include <asm/sysregs.h>
+
 #include <jailhouse/cell-config.h>
 
 #define SZ_4K				0x00001000
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cfe4b3af813358e9cf5aa4c22b7b421803499189.1601838005.git.jan.kiszka%40siemens.com.
