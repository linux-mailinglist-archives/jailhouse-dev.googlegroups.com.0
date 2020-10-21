Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHUXYH6AKGQEPBVNTEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 88336294F33
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:26 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id v25sf1798226ljh.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:26 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292066; cv=pass;
        d=google.com; s=arc-20160816;
        b=ABE2l5MzklD8TTeooYhtVHdJ2hLoNYKcU2T4+Wiykrb1lNHN5I4e2VnaycCTFV/nA2
         UOmhaCoR3J1G23RDNPy4uTnchPLRTlt6z6GLKz1AtISGm4ZkrkEi6+ejoOnN7cWtH8+O
         988ZOegjacOqUtphC3E5/hiCBTdWGVclC2V/I8tBIp2kMq+UtTCQ4AsH/xBWsNevXcja
         XL/aPbUkigtEp0FAFvgERC7U4xjiu+yC7KbXsTAfPAJNS0ttY5cL+KN+aArEj7b4m6Ds
         xrIGt1vNuqWJCNbg4SU9J1FtAaOlVbTo+uSTg7dd97k5b/m0WESBkE5X/o7HVjR0IIKl
         fyCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=MxoC97o4goaknSM3+mga2ivzrhZY9LOz9X3ivQAZEaQ=;
        b=Y6L+q7jqrW5NnIDuHRl1CDCqHceockbeJggh7OnFT16rhod0TORUxGnD7ZWU+EA6DF
         Eq4MIOW3OY4es9+3Uh/+HR6NciMLffxTCwgJQgiZB5aft5cK9pOIYyT/wqk8XpaI3vug
         aIwTPebGv8q/VqtmoKyJMvaCzdGRFjekLLiOf5FXbMDyVjNjvgzrFoTCRuo77d0+8o1u
         /TeVRekJfEt8MAcllof7PquIVLwChQCpd6+KgM0TDAQixCNtCuIEEHAbTBafUlf0Hhnq
         n+kOnvM4UrqLFhMiH3iLw7OnViy3tzMEN2hkuQzKSEpzRAX3uZkwn0/GGt55JJdmDwqD
         qTLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="ia0n/Y9U";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MxoC97o4goaknSM3+mga2ivzrhZY9LOz9X3ivQAZEaQ=;
        b=a9YDI92Yp1gremgDQopusRkysJaKRl4CavtQtBIG2YEdC9PWrdpx2CkgePNhKFn4Wh
         PuwcFohV0+GdvAKXwrBfmbyEgs7yhJXmMK/BD/XsphsmvmN/H4aNWPgRucrdqO+MWS1Q
         eOv7F5FavU8TbYr4iW48vxCE+JxuOrEwH7R4AGe9868Q0/dz6stcD438lS06fBSjcNCC
         WbHZvEwWmRBHPiDf4jjMsitrECZSXTjJewgtELufoiGbPnxdNygBwfORcmWUJNxnBuoh
         XJlPUiPOKTfgINafSlE6+4swru/4+pYibpxKW767KivjPFmvqIAugcaWuUEXU8ZuTH4O
         odRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MxoC97o4goaknSM3+mga2ivzrhZY9LOz9X3ivQAZEaQ=;
        b=pgNtdywWqbdmeV2yXX1Mf0HH2O6U9teLt+piYPYqKwbjm4z7cDzLYMuT1yQ7DxBuAN
         Y4MSy0joYAI99GyAQ457LhR+pBTSh5HI9KdFseKsH7pV9YGT6Fvo9hIC3JZZ5jeA8GjE
         Yc6i3yNHR6eIfCWhqprTllSImXt5eq6Vu4pzOuPW30YFBmny4Hjot7DH9+WI5sXBw5+r
         VfcRibKjgmLJpGMkhSjW+ysWHWH+npSjqUAMhk7Bllwrao+efy0GiK5aENPAqCeDHTq/
         CAenfOd2Z4r+oLUu69/ctgeOZt4ore0fZZeoksGVghTviKA3e/8zDgxhR/sBg4w62z04
         jktg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533tiAP4T2jdoauOvMGn0BTqgdDuGn5MpuIIjIsZLJ/4/Am4pv5Q
	aXegUx0TTZo5FIJHkUnWmzM=
X-Google-Smtp-Source: ABdhPJwSJAAgARe3B6udchMYOw/TyNPDpZi4JSw0f19Zv2JRX94c+ehtNo3VJie/MtOmMaoo/6oIJA==
X-Received: by 2002:a2e:8845:: with SMTP id z5mr1694842ljj.216.1603292063117;
        Wed, 21 Oct 2020 07:54:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:554:: with SMTP id 81ls132686lff.1.gmail; Wed, 21 Oct
 2020 07:54:20 -0700 (PDT)
X-Received: by 2002:a19:504b:: with SMTP id z11mr1452438lfj.182.1603292060490;
        Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292060; cv=none;
        d=google.com; s=arc-20160816;
        b=JXkfoiqzjov+B0YdVVuJ9aXGspS18LhOqGigb8qUAX8XuozShSMH/WgNF4EQxkIOKT
         u/989jv/PKANGFghmWwHQJ01aUw9AOCldkP9lSDkAitS+9ifE86vF29Sa/0gpTLjxFel
         RO9Fcs9zC7eiWwQBroP+UzkdLY5EYt5XKFj1+2UNEepQfQLiF9s560ro1Ai/SY5OTECd
         lNKQK9ADQpfL18/0y0XrhiSILe1dzT8Pb5GcmEY0t1uvrdh0FSjU4/eXFICWHIVAgmEE
         DxBV+JGuTMypqrMek75Jzq2MEkGOwCF+o6r9yxk7eoqA3aLkpz2ATy1W70K+EcPtW42o
         kKTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=lstO1IGhhTChla5eyRDNNWPpUZasKX0W2XLjPfSnuKY=;
        b=KCGbdHvZVZeWsfDB2WIuVO7yFwfJiUynw3Eeb54CxeacFnVQMZo3brKPbKLQ1Cn8z+
         HYuwyTe4fjUZV9CV/xQ+o6FRdKzx56JXcWkSQpylqJ/ub4XlyPDXdE9mxeR9CcDjowCs
         E7uzSIeXYHsAKbodF8VoFedPlwjRreDNpIoSgvYCtqrswLHFld1kKRLtEgtqgLVqlPex
         fSsKXDufQmCWNnb3x3WNM/Dh92j7YJDU4ljTVt2Ei4M6YfgzaYsalCKfMmpAoQkFiLaY
         7VeXW2SMclALf8J08YJ/iBVsaZnq9fcr60hJ2LSenx6pGYoSnLcyvRnGf/HHoW5QXN21
         PEJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="ia0n/Y9U";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 8si85463lfm.7.2020.10.21.07.54.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRb5r5NzyWs
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id tZVajVTpSe73 for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRb2zwSzySK
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:19 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 22/26] hypervisor: Wsign-compare: force the "right" promotion direction
Date: Wed, 21 Oct 2020 16:54:00 +0200
Message-Id: <20201021145404.100463-23-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021145404.100463-1-andrea.bastoni@tum.de>
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="ia0n/Y9U";       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Only part of the problem, Wconversion / Wpointer-arith will probably
complain as well.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/pci.c b/hypervisor/pci.c
index 553c8588..79b6f920 100644
--- a/hypervisor/pci.c
+++ b/hypervisor/pci.c
@@ -24,7 +24,7 @@
 
 #define for_each_configured_pci_device(dev, cell)			\
 	for ((dev) = (cell)->pci_devices;				\
-	     (dev) - (cell)->pci_devices < (cell)->config->num_pci_devices; \
+	     ((dev) - (cell)->pci_devices) < (int)((cell)->config->num_pci_devices); \
 	     (dev)++)
 
 #define for_each_pci_cap(cap, dev, counter)				\
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-23-andrea.bastoni%40tum.de.
