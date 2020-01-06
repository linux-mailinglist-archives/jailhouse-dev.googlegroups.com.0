Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4GLZTYAKGQENO6IEGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0221311F3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:00 +0100 (CET)
Received: by mail-wr1-x43c.google.com with SMTP id v17sf25429898wrm.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:00 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313200; cv=pass;
        d=google.com; s=arc-20160816;
        b=oWX5zjADJ9UgjXXXJwxkSud30W9jM8NWneXT/9nXMjENeNPW1z5MDSMsClxOMS6DMy
         gI9E3h7Uo+JInYK1lgPvcTSkvFennthrgj+dBCPAaMrQ+Von0teKU9RaSjtUY4GxKRcW
         EWaylceKkVT+h9HEnJzwBf2Z2CI8FMe241V5dEkRg1wFv9fmZf2flGxfXRL9ZYBAZZi1
         Ht445hRL71Pqrnx3aWsdK99FOiDPE0xlHAOf1jxwTC25PzvyFkxfBczWdRoES8o6FaeO
         66ps2nLxV2lXAAosvDxo0SbA+xDHuXvg/pzzruOcUnBCiLD9N0QrXbIOZHHzzZ2mbmuO
         vGuA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=DX85BU6ezZEGPfL+2DSv/F7+2g0mrX7KEG8fbNlrlTg=;
        b=dU94q3rmUpGQmLYiFrZNls0pofTyE6YPaSlP2BPXvWiPAaAZFeTquQ/eHYgrxtjKvN
         R6XO+3sGRyHd5lv0M4T5AiclYHscGwKKAlhPk66i4dEvtf6hdqSqoZZCcnosQ/K8jbyk
         dWC4uiipkD2SKBkdpEIgrkhsGB/rBgnKovHIAAKiUNOTwAmr9T6nTUot4fxOd3le3VsA
         QGytTj7/J0rEXloQS63b4k4Hb0UZYEefVdBph+dlB6TkelvGKlsIJMq+tAycvKtF6ejv
         8/Fbmko7sQzD36cJPNzfjo2rcmrsjmaERTXMKfFq4WQTjzeFn+kWony0UbjCh9JHB90m
         Om/g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=DX85BU6ezZEGPfL+2DSv/F7+2g0mrX7KEG8fbNlrlTg=;
        b=U3Pi9srIrWb7SrhaMwa8Tzu01spb6C2ShZUCejWueh8sADCfdjNAn1IwS4WswZUBcm
         dj6ZTLJ0DJR5YkdwVscjsHinebE/rwp5ozmPA0fnpFudqsReian8WOXoOqmZnX/3hX7O
         zoHQAPFLIOFqd4Xbvk7ktQi8tqf3EaTr0zjfB7eUQz4WkJq0Xll4hx4wzxfsBNAhYYL4
         HJ4JgV98luc2pGAx2lAogM2Zh4wreiBUHQK8uJwU+0KHi8DdI4P2NuEYgVO6/IajBPk3
         LU0npPOsu+I0CwVp3KmYzllDDi8FVrnKsPZ3Sh2vfhTZk/+6Z5RUMIEWy3DowgSaFlcR
         ZoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=DX85BU6ezZEGPfL+2DSv/F7+2g0mrX7KEG8fbNlrlTg=;
        b=NNNqAaeC7lUYgVzProV/aVRVROoX35/o+fhJpGiYJuazb90OdmeNTMy1OIirz0Mt+e
         ip6yzGNX7cM7gu6sCDDMsQCDNSj5Ph8Q6umTgSz+pSoqSGYCrLeeLZK2PYYsEjne/n1P
         GtVkzC8JPUm6rAsPR46kW0j4YerjzU7s7h3+hdQPPXy8f4j0S1RuxLBMNhIcePX+Edip
         opMpT8TsbC7qSkhd+V37VOQGhQe76tCbD6CCax3mAjGV+Ehs9zCDHAq9Eu2X05uAftXa
         mfY4YT3ZDpXEp6UQnMvNVSiGm7dG9UEZVONd/W+RdYyuxeYQ/vvtmueJMYAiHxCNE+HE
         s1uw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFIdlZVRXL70UkYD+3JM68h52LpQScHa+HW0pvdmRFh1eDVLFo
	nqLBe3idxDqM53OPUQl47/k=
X-Google-Smtp-Source: APXvYqwGP5OJGd1f+ccXEnbuWTQt69xztlmMovD6C7Mw6DNR/T1vb7pj+lUlEesZfvSsibjEZDKPaQ==
X-Received: by 2002:a7b:c750:: with SMTP id w16mr36002733wmk.46.1578313200376;
        Mon, 06 Jan 2020 04:20:00 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5f8b:: with SMTP id t133ls5251649wmb.2.canary-gmail;
 Mon, 06 Jan 2020 04:19:59 -0800 (PST)
X-Received: by 2002:a7b:c114:: with SMTP id w20mr34786741wmi.151.1578313199657;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313199; cv=none;
        d=google.com; s=arc-20160816;
        b=Ljv30Qbq6f0NyS0WxHA1QUbn3NzF88khYnIc/Bb+sSJJZrShitARIP6nPZv0Hjw0Dd
         6SpFSg9HXorih8EfBsw8oyxFNPhPy/oCcqmWnt4YI58pNkz7egTRFV4npfzTGBj/nHhQ
         c/nx8Alnixf3nfzdIsUmu+6saTVN8AvG4/DGWT/QasuBZapoC27/NAlmB8rBQEK6ufgn
         wJ7iv9cQnW2uarkF+UxhpWRJQUfVrn4R9W+ow33LQ8OspogA83TFb7AvT/D1YrFfj61j
         b3cFdl16YdhERNmd6bOe7CQETDTx9GKYfad/dPdOyj+uLVlwuMZXShPYDbSIpJ0MCM4I
         lKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=xvKcLMTspA2zanjDLauISkbShLMto+8BReIYtE4QLqE=;
        b=QzJKgb+ZmokDckvPFg0pTvxZim9nEndMEazgPV5pFFgWYAXUEclF7MiOsTQTgcCfpW
         EJEAHR/hGBgefE1MiFKpg3DDqUH/FRCin7HUJ4VV6jFr1aVXnpEJI0GFHOgonjRgAbG3
         uva2opufvzzSrMjzBXZ/rMzqVi6XlTbgF6mV8LNnoc29d+GN951rdwer4KObiiw5tVIc
         yEf0etqgAUiDUJx50mlcg4uicWcHBdOuFR+5IBwsWHJ4RL8SEAWi4ZFExSR+gNMmg6l1
         x79DqW4i6zJHWg59X6fPvZPF3iyoSvHMxUaLt4lFpTNOwufTePADrapS40SgmRLQXq6l
         mvvQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id y185si758241wmd.2.2020.01.06.04.19.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 006CJx8C011079
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEn029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:59 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 15/38] core: ivshmem: Mask MSI-X vector on reset
Date: Mon,  6 Jan 2020 13:17:56 +0100
Message-Id: <401be011e2635973b4872b68415103fd52258734.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
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

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/ivshmem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index ce0bed4c..0f52e7bd 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -425,6 +425,8 @@ void ivshmem_reset(struct pci_device *device)
 			(((device->info->bdf >> 3) & 0x3) + 1) << 8;
 		/* disable MSI-X capability */
 		ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] &= 0xffff00ff;
+	} else {
+		device->msix_vectors[0].masked = 1;
 	}
 
 	ive->cspace[IVSHMEM_CFG_SHMEM_RW_SZ/4] = (u32)ive->shmem->size;
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/401be011e2635973b4872b68415103fd52258734.1578313099.git.jan.kiszka%40siemens.com.
