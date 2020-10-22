Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBVMQY76AKGQEZJ57GSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C5D296445
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:46 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id b8sf1015091ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389525; cv=pass;
        d=google.com; s=arc-20160816;
        b=Knb2BwVcjaCnDUHYwataH6ftO6o1qEH9Aiz9we0xqeGlSiHcQfrncjWi/F9HGtwwX7
         p1udeQkGZON7nEqI5TdjGZVbBUGlzz0Ujs7c9IV1y9wpFSlvTM+VnMoAloH7ZNyN2dVD
         VeTLYEcqAJ94bspB4u3xhtLow/8atTqy/eSjx/U923GZzYnaO8jJWRxDhGWKrRYvS+Hx
         oEFBqCi/maYBZg2+bUo05eib57pXW4LHgyxQdQobaI4kkKh6pnSBno80SPMscDXCcarm
         uBRq7E2vruLvLm/MN2LuE3j1lI+cmOUW1ywPkRWr0MytNOxLXboviAa+XYPeB91kNZaR
         VU+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=GLxe2WnULmBlZPvo0iIcB3PMkMPzsqvhfh0gxVUZbLU=;
        b=wZArNdM50GHf9/NZFJF1mWX/wzS84neKKET8M5y/LrCJ0Ky6pzdFhfQ/8GZTPCHTs3
         M6Cd07aWOxAttCN7zwPrvdln8bIsW457gtDW8PqlGtLKRyacy8LCWSCw7DjCEwWZVYhe
         7Kcf6XZ+zUm6NXqHTBdHZ2EhSzudfRh4Z4enqZg9aTnVA9iPZm7WSE/1h3Vftc7w1Xw8
         2HeXoil19wGkQfr+0Xn1S2p+5xoL54DOeSIO6DVhn9T9h+RyJbkE5HRGQ5Vm5gQNl5+w
         7zP4+0PKSbtfV1FX5slDxa0f895/JMYSr/liXfZh3CaIO4nYbZqIuGUqUL0f10G1qASo
         Fpzg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=AlkWLrZK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GLxe2WnULmBlZPvo0iIcB3PMkMPzsqvhfh0gxVUZbLU=;
        b=ptDBpvqo8B/IoxygCk4t3HM6lo0K0mtBTY901U3WGhvYVkSWxTQQ97AaVP2z5lD5S8
         SrWFp75AH76K1ztdsDTaR3d7WMKdM7xyNvuxru4oHkIg0N5ZtpcxsWxEKmfusHCHh3Su
         Xmw/6tejAJboeg0V4SBvEuQqEtgNDUX7cWI+P4w3KanMxd2vIrSGPGw4UIO5oeh7ok+H
         GsYIS86sulubA9bGc1MX6TYG/GLIa4ZjZ0drLOyYfmHhGPtaYwvMjjntDrk43cu/mSZS
         cHL3LosVLVWuU+QcUosev8LhoIdqg7MD3Sir74zdwwfetFSqkaZazD09NEXjyYe1Ne66
         h8lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GLxe2WnULmBlZPvo0iIcB3PMkMPzsqvhfh0gxVUZbLU=;
        b=uFZkuiNp5Spo2KclFjdEHhLNYFy8vVd3hM+9dqmRMICk7D3OiFcQlWoLXOyWEcQI/7
         lCJKn/Xq6kppFIRUYuxZoeeiFm4Qn1fnkY/IxD2OP2LBPN8aj/pjaAPLF/6vOEH9/sHb
         nvgM0urfPv+EADnZ/G//5S+FjJ6iksnObnuS194E+N9cVFSEkt+BjVvMK0ttBE9zvjIZ
         2w9xhkDG+yIvhLKdO9tbdh8SjlnH7CSI3U/Msj9A0GLC89Vnt7Z1+Ky4Hu9TNMnAJO1/
         nh7SEbNmhQ8YL18Eb7Lb/Y8FpPFnLva1bAreRXoFLh+Wr5L6k2ANd/OH+GL3uGn3+K5t
         7AXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5337ClRd0ZAjKCpXvB8jaxbOenOMrGp7CyMP24CcgFLERfKYoItN
	P7P25wRsPzav4rH3osQGBfM=
X-Google-Smtp-Source: ABdhPJwQCNjsQ2x+vbsnPLmXch7l9WUCLf+ktKBgGHWQNfaoAR6lHKfqGR3qTdfHUIjnwucMRx/5HQ==
X-Received: by 2002:a2e:8416:: with SMTP id z22mr1587092ljg.72.1603389525787;
        Thu, 22 Oct 2020 10:58:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c111:: with SMTP id r17ls1744936lff.0.gmail; Thu, 22 Oct
 2020 10:58:44 -0700 (PDT)
X-Received: by 2002:a05:6512:358d:: with SMTP id m13mr1377267lfr.435.1603389524793;
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389524; cv=none;
        d=google.com; s=arc-20160816;
        b=VooUcUQiCYu7SWESugbvICCi1AY5HtgOy7xQ5+0iEV5o+VT6S5w0HkSLVDa/kUJFAE
         BT37e6CmlcHiTNjOqd4wx4wA94Jk0mIpbXYxcTARIuMbbmD4W44nEdFp0JFKpB934d1V
         V8hyciRRG4QGVtlbxnLzuecBwSeFRN52G3Dc2OCQj5ITBBJE6PmwGJldhQzKk4KsMc4N
         Xzgf9uj1GYoY0UnDiDTcxJmW7liNw6l7a76icrouHbTbVr4hBL//ds4UZ8yZdSUgrkxf
         iqOXNfYInjmXdJVdFFlop3T6iDKg5vOowH1iMrDrM2vf+MCNUnkdM7NiqUG96BfEef52
         wtAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=TbC3hGY6s4gObreufsUMl1hvLWxlRwRNmlxrUzO+l4w=;
        b=xr8BF+5vIye5hV8dHyrFHQB/tS+flaBbrUWdMjPa+ykZJ5zsyHOQa0+qJxS3EOsZ0W
         Um9uqhRTOpPLpDqTR7wMVo+bVcfAAc6j8h5ikIc48LRcSe5egI55erYOIfqvT8JrHcDE
         PgyCqNC1dUVMW4jSihaxQBJvydvsIS2y1Jsc0caElWDURe8us5bmjG41vbYy62XQ0iRy
         91RS1FuitL7Vdd1ZR/jkbHcDglBwXu/lPdFCX7jFruhEMN1mYGboAkbUkmDtr9f13mOD
         w+53A6YztyDDew6s3SmltbOEM/33MjwYbvnmIEwPCmVRpelKX33UeWmsX2rPtvYm2tnE
         9ymg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=AlkWLrZK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id x19si81535ljh.2.2020.10.22.10.58.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTw2HR7zyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
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
	with LMTP id t9yKIfoYDKxZ for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:44 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTv73WjzyXW
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:43 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 25/33] x86: cat: fix Wsign-compare
Date: Thu, 22 Oct 2020 19:58:17 +0200
Message-Id: <20201022175826.199614-26-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=AlkWLrZK;       spf=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/x86/cat.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hypervisor/arch/x86/cat.c b/hypervisor/arch/x86/cat.c
index b8412140..644bb3e5 100644
--- a/hypervisor/arch/x86/cat.c
+++ b/hypervisor/arch/x86/cat.c
@@ -141,13 +141,14 @@ static int cat_cell_init(struct cell *cell)
 
 	cell->arch.cos = CAT_ROOT_COS;
 
+	/* NOTE: the EBUSY check below relies on this */
 	if (cos_max < 0)
 		return 0;
 
 	if (cell->config->num_cache_regions > 0) {
 		if (cell != &root_cell) {
 			cell->arch.cos = get_free_cos();
-			if (cell->arch.cos > cos_max)
+			if (cell->arch.cos > (u32)cos_max)
 				return trace_error(-EBUSY);
 		}
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-26-andrea.bastoni%40tum.de.
