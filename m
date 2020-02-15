Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBOWLT7ZAKGQETJ2ARAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC515FE6C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:36:10 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id y7sf5351671wmd.4
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:36:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581770170; cv=pass;
        d=google.com; s=arc-20160816;
        b=xElGADsuN/X1F3Gf001W+rlIL1ZFyb7+AptECXSt4K4HDms+ml4We5/S7B+ULSuX7G
         wQ5Yn4x47jUKIwkziDllkBfMdn6Bghdb4S0qvcLmtd4ZZm1Hw/di6Rl/EJzY/5aM6o7q
         O9tK5Ng+lMz3a5qIe56FKx97ZqM6RvEb6PDgakzDjPrEYLeGP+PJox/s9GoK/lYMdV1S
         FMwurejd1M0qgBPs1Q/8cfJzoiaMobSPp85Pxd/tkK024M06IqHFl7zZnTu10rzZfrG5
         tNnWdPgGOH4mYgnHBfOHAIdXtWTmIjI62uM1vqPGCe9z+gIqQ1n3IE9p+Mu/AIfXYTge
         e2Pw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=igaR51G2iAlSg2EehVan8BacQvfrLlVE8A+5mXYQTo4=;
        b=OpdVAif4DWRZFZzM3A/xRL+lWjnpLWC3EPb7SC5MZnCtAByNBjrUPi7pIPQFZOBT+H
         4LvkBkY468w9i+zbjYMtyiIub0EFCcFvcVDH0nYFviXvtBAztXQNiMhzM60v7AIKPJs5
         psX/YLP4UTQsI/INoSJSq/bZdGJ4vYKjXkb5/vpxF5uPKxR6dbzxVcZzFfLK300rYnN5
         c9PBihp2qs7uup2boAO+tGInsfw28+QbjOiJufsoCN1QjThPmy+mBAkv72CWJdqMykLu
         QOtfrRF9m0txU+Cach5vwIxDzqy7CrqUiiE/C2HEhr+oqCpKwSMOv8ZxX/j+16it4R3L
         wD5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="K7V9S/Up";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=igaR51G2iAlSg2EehVan8BacQvfrLlVE8A+5mXYQTo4=;
        b=V1H7YOHvTaCDvLUTyn+vPgYecdQOF/LZIZiihNKn/NYyosJTgkSqgOeQ1dHybozBSy
         +9RZscvCJlbvC2FybKW7r8aSO3tVQEbsR9iweKhZGDxgE9KYcusfGw291aosGHlieubb
         C33yZ1sUI9r18PWwZEwtIaeNA37BiYlkAwkBPk3wGrNbusN/ZvJE96kKAtzLiDZMh+Lb
         ZL+TTP1s/SucI4BKqhZUbhwpQkpvAHKDa/Dq4icvLGn2L2MC9+CId3jx3JGwFYSyiquS
         dgSVOCtGdSeolLsWEJ0UMvSLdjQltVyUutTBKpoXXB0JlfFyLnqxmbHDL6e45lepJ2g+
         34AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=igaR51G2iAlSg2EehVan8BacQvfrLlVE8A+5mXYQTo4=;
        b=NVNtsmX7s/Vwwr0eqpr2PDSk1EfCqh+c7RNB2fskO9yaNokq1SolzSvO61bW2MjUgJ
         XtxavnrBD5Y+591nJcP8wFASUxEjhOKgHUi1w9zNQqagdF2cXK8LXDuXVadDjB30BCRs
         ECm+8CVasVC7ckiqsHD6YEs016osMtYUoN6X1CDBBYNBPZkWJc0da3H2cTNB3wbr/Jvw
         WNC5lFBLJQ4VnW1qPS9eern/nnRotMpLkU31Df6L6xvmQZIjodf5tDeBmZ1bDMhiKiu5
         ZZ2vFh3k9RF/fByeNNNDaER0nGsOPjttjOb+XA4jJYbarIdsXi0Sipxk98mlkxwYKiA+
         NJpg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUu28ope4EfQf/zgkdccjIbCCJhwtKk/M1XwUCglgK8G2r1nTwE
	9nnJfWKpIsUZNVuyFSFmbUY=
X-Google-Smtp-Source: APXvYqzx+0ZA13tRnyQITG79s5KzEhrCXmHWe6dperelpBxV5JTaV4S4R2DXX3rAsEnD6XaxZWbSVQ==
X-Received: by 2002:a1c:491:: with SMTP id 139mr11040424wme.117.1581770170491;
        Sat, 15 Feb 2020 04:36:10 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fc89:: with SMTP id g9ls2981278wrr.5.gmail; Sat, 15 Feb
 2020 04:36:09 -0800 (PST)
X-Received: by 2002:a05:6000:1208:: with SMTP id e8mr10462414wrx.351.1581770169861;
        Sat, 15 Feb 2020 04:36:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581770169; cv=none;
        d=google.com; s=arc-20160816;
        b=lc0Z3b7h206b+AOCcyiek4zRG+VgI23BBbnkl+8XSyf0QSl36MzEahYveru8vf0z6D
         cyhJoUwoz4sVczBPL/9aaI9g/ZerzdsyvbB09IJIdROFQ5VYyY/1RiN3WEMgWTOtLkBN
         hNVL9kYx5o88pDBS9HXFnHj60ef5eADXxCTTHYpHopl3Zu0+Zrpu9cf5J74yqnv26G2J
         A5vcl7wDhfO+FqLMozpXnjkPdJyabalJ7mGAY0VDtp1SVtL+5cYiTkCwITHQhvPl36r+
         Wvm4ksqhCtwBR1aQWFm1u17uCSbNDWjh6ItpqnfjsXYdz1sByRSjcxYsu4SjXqyfYi13
         bskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=9bhSdX5JKQtdz91Q3Sv7hyOp/JpuDwNOS1ZBhLXMi1s=;
        b=0p7oQQaq4gVUplfnc9IwmA6cbjVNwYKInzI/fwqRzgdSiR8B753W9s4J4c86c0xr9G
         +8oQzX5eiWU5D4rFkBxDb5KGVFfHaug1uE3vvJciJXdxZAZJZZ5iVRovhZht+SS+N5El
         YZF/sX52yDyTMHUgr5DcJ0/+NkRC3WozIiUvhKZdf3apGwKuuzEew3sgZQxmHWpikzbL
         xqVhlSPolpPLdThxQ4Qz85CVIkeK9B42HIMYPek+B64sNKlLYIu3a69FxXOBM33dqfTC
         NJLeHfhR9aHOvotqXXzpc6HTwcwgI/Xicv5bwU/oRTmDEf6t5HyMa77xDOilUWKZTpfb
         1jPA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="K7V9S/Up";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id i15si513586wro.2.2020.02.15.04.36.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:36:09 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.55.156]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0M1nsQ-1jLzxj2BJK-00tgny for <jailhouse-dev@googlegroups.com>; Sat, 15 Feb
 2020 13:36:09 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 02/12] driver: Remove unneeded masking of cpus_assigned
Date: Sat, 15 Feb 2020 13:35:54 +0100
Message-Id: <7d6ea66fdd1c818882e00a3b8434d3d0bbe0b9ad.1581770164.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
In-Reply-To: <cover.1581770164.git.jan.kiszka@web.de>
References: <cover.1581770164.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:oFUbSFLEIvsN7L1/QBz5c3ZvLG4nKysHYZ0la5bhcrvMBPgJ6hl
 hrG4ucWX5G3J/bCMSeLqbVTYf4X/GFMrSsyNruao0OlgSU6uD68wTVK4oGZ7wxujEhnxonG
 0WUsGkFbEA1F0YCzbCCXeBnbb2XA/qMLoBbvZYwBG8Lf88otbQWb0k3QkzqEYgWg2htvOQ0
 ZYrUI2uuWauy8ouinIv9w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kcWR5lL4F5o=:Uo+1GaPgHHLdcBRN5HJN+q
 62DQ/YlEMi5vd1n+MnHNbeaLEyOFYecner8EvsLdFX4XZWRtxt2hAfsC56yBsqejQ64MAKzlV
 d+MsIdV7cN9jrHUkUSWP5YkUijs2xvN2UXJduns13xoM+uP86P7ge2e2wHCjkKalYhvhL0e4B
 JuKuTx5qYGuYsvkJ5Eo5l5bmQHty1hijUffmzDFkcV1YenLBAZQiixsonmb8FNvymbJcIfx5k
 PqIGcla5I8tGliF2PQtRxdYyt5pLrzQuOp62TWGklkfiWdBpvaPzfxo/FvBCVcvVNyc50FgDV
 UWtp1PxeULjtFchoNZzjSrU3ZKocjIoAWLhCWVyxaRnfqVYUrbbQUkb3EHv3YD+HWLEpeOOOX
 Ndx00SsofAXBGzBjxI6P0yvDLjNJNI+boDlEluXqScTvosnAoqpa+7/YvxBsdP6XmSGwRknR+
 3XgMuEQD/SKNO5nE9N4ui9VRUM3bB88r+HWOrWmgSFlonzCzeKW3orCVQCF8BFPROogdoJ7Tz
 nIrpsxMPdQDuBcRv7/3PdrF+fqSyMiBO/FsSfNoS1OAmYi+F8SThXvn7E9+xCytG3VU1xCMfu
 lb5kdwwmMUm8EDWEY3xxsf3D0dRrtFt4uGEgCiWTghzT3Y8yw7cUYlL8zEySAKgKd4clKqGpX
 vjfY4HZ/ro44et1ByBxH6PYpe/TbEfrv9CHBrq8wPotzoekEU2U1cMqDrnG+QYu5uqO2TBW12
 D3B6oO62E1la5ElbU7VypxoERs0Xi366muL0Jau9DB7fsT/ngN1u0bg1bVu3l3xq5tnEo8eQg
 U1rwdpkWpldn+vXHs2zo2mKEI9eblb9c/hFtu+2wi0VWRBi7PNa54WbXIQLCKii8bARPHFlYH
 jCcMYj9HGs1F+Qq35vb98m2ISeyPdot6ZRjmb4gFHem2pshdxSitL24SGDF4MbUsjMfa8sIn4
 +HmRGIRD2I7cxgRZx4st+r6zJCV0cMYV3n6s0K71sdPWQJeZij/NQPD8kkt+0J4Si8IjgjczR
 eeXH51XHxB70evM6xD3P06Q39/OMKLIjkeSPII5oiwJuE7aFy6UvrKYtVCiQT66MglZsXMruc
 dzx8ZHlfTsuH6uOtc2K5LbNbx8nm2l4XMa0c+Y2bcQSGdhyFLGjtm6v0M1KyNaZiDB1LOiNQc
 Z+xROJk35NxxURoebkq8AT2XOWoT8iN1Y9N/HGAYNPhGouMmWtuJ+UBJ/haBDTpV0Pl0SMCD5
 7zhhcGcmMJeCAT+NS
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="K7V9S/Up";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

Since 366766542b3d, Jailhouse will refuse to start if not all configured
CPUs are online. In that, the driver will not use cpus_assigned anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/cell.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/driver/cell.c b/driver/cell.c
index 9d31a13e..50e344e5 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -128,9 +128,6 @@ int jailhouse_cell_prepare_root(const struct jailhouse_cell_desc *cell_desc)
 	if (IS_ERR(root_cell))
 		return PTR_ERR(root_cell);

-	cpumask_and(&root_cell->cpus_assigned, &root_cell->cpus_assigned,
-		    cpu_online_mask);
-
 	return 0;
 }

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7d6ea66fdd1c818882e00a3b8434d3d0bbe0b9ad.1581770164.git.jan.kiszka%40web.de.
