Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSUQY76AKGQEV6ZLOMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5C1296431
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:35 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id 28sf971507edv.9
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389515; cv=pass;
        d=google.com; s=arc-20160816;
        b=0ue3J74DgDWZKAkEWg7g1dr+RNBs2rbqMu6QmrJzhhyx0DeV+GV62isTDCLp3vseT3
         jLOs2K2/TViBKL3ghA/w9Wc2Lqbee2wh8DVPSxg8AWL9trjtpvfOvTtNAl8wZZtUn6un
         G0N1b3WeCY4vvDRNSNXyFi9Ir7gZl6V1ceNGE9ufddnP85OGSwAhur24kWhG9tfl/gZf
         5Hx7NygtPWTxViJP/ntxX63l+hXbEefTS/f+xRSqrfSk1HU80XV+CPxsnMKU5yWSy7s4
         5em7yaiXY/rAXGjypcldl6k/03LzxnMQVlZAGsuYeL+GelMBzbKcC03RRVNVHNCzQVj4
         vSsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=T0KUawwP6rzgZeFcvUtX+VPX0i8k+D38M6r0Gj0pj3A=;
        b=eUxzyOJJvRPSJGgXUFViQ19xYQwVEfUqjlEUj/80Ddp+2D508J03OyuzE8GHkVPmel
         pxIqa/KDIHlV19WaksQncQqJDFybVgRurWid73StPEH5lgwkN6UGjhZUKnxPhQsmmiYc
         g/cVxf9DnPg/68SxQOGotWX1gompxtzHT88HRdEnCFJnuynAEHWg/WErJQ2kAtTtCUsa
         +ElCwKKv7V88Pxem7CTQrfbEqdnyAYwK6MSv1Uep7n/dU0N35nc7avwPXY3vhsmjGY77
         IzIFuvIE9OL95h0ppmdB2Ch03mlGtT+1aAi4gvO1vDohLLofKuxvNtdyKpDol3uelbJo
         EsyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="c9wC/Z87";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T0KUawwP6rzgZeFcvUtX+VPX0i8k+D38M6r0Gj0pj3A=;
        b=bWSrvJwFRUC50NB7ZtIaAqSo9x/X4kAkiyBn1LRxntgLLcOZxELEJj6TRO9jWKpgDx
         joTG/97IhmnKtQ1XLGPEPnng2NdRUjQb7QSg1FHFF4/76DhpHCD/GmjuqUKJR7xO2Ps0
         /96BUjgfJJnLAGlhCWseotHQZAwQvuSq8jIV4RVE9lqpsDbnvkAOe/roJ9zH46JwsAye
         UXVCI1HZyzFf0Qd28SBHI9KL9TqtpMa85dzyADmzvb6YXXFswZQCFZ3EnYPuvb5R8fpa
         vwa3zD3ZOQKi0zKOQAB+FMTq/xTjdbKqTgynWqn3wKziLgImhjTmSNPzVWtVc/KBcHYJ
         DPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=T0KUawwP6rzgZeFcvUtX+VPX0i8k+D38M6r0Gj0pj3A=;
        b=Pb0HGBMF1kx2494XV5F6dOFQO3M7aexZVpx52k+vsE12rCYLT6g8XzEavDTvPWKFT6
         N4gmaDPefmuXQcktnv71hJ4iI2tv7N5P9raYSmloRCxY/bTpdPMFaJ0ysFdVY5Ci4uTa
         /rHDPD/8PzcD0kURSlxDdtpVYfVylj6w8YT1IzwDh4XTxdrs+TK0sZJjmbI8chDmhqu/
         RzdEWNhiZavbvgG0kY7hJmq1kFr0ng/PibX1BlO9vIHlHgP/HfrCyozw7k/WfK1CIIHF
         gG7MfzTIERcAjYWQw8BnX4DxE+X31q2BNsLIiWURujCOEhMmz2iwWrrVmU8PH/AycwhG
         OJoA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5311TcD+y5ScrQcDnMNRcBS4Mss24M9rjJcYrUs8LM855yPlmidC
	4oMS9UdOKBwTPC9CJlHOXnA=
X-Google-Smtp-Source: ABdhPJxr9HIVKYNOgjF5S6IlAcKAWULuwQRB/U5l/D7/rzYqftQVMzlweURmDphZ798nHvWKx1Vdnw==
X-Received: by 2002:a17:907:42d2:: with SMTP id ng2mr3367521ejb.124.1603389515033;
        Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7e58:: with SMTP id z24ls1260331ejr.10.gmail; Thu,
 22 Oct 2020 10:58:34 -0700 (PDT)
X-Received: by 2002:a17:906:141b:: with SMTP id p27mr3608046ejc.205.1603389513796;
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389513; cv=none;
        d=google.com; s=arc-20160816;
        b=ahRsFzi34ype9Z6+XbaFeI1lJ2Ol6xgPQNS+gBYHuz2sc7Z3m5cUy2hAChYq/sG+2o
         n/jsEpKPfcvjUQABVV8i8jRF2Jujx0Y/j4axzlethq1OJc+zMyxGw84pXubInm8RjJ+4
         1OrkVivTBWszhGHnqdz6lRfouO/bwPJ3HB7HoD3puI57LsgzH9gMU4Z2bFlRo38L5N4t
         0s8gMDpCNRp0WgNvFDY7rUZ93q+5YPCTChDI8ay8jn4Hp0OkvjtNxunwbq84KM+O+9tG
         rtiandG/E0VooEewvV9nncHz90NEgVrtlMVar9qzLRI/t8A8uBxKW6McBcD85v5SsqSB
         lrpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=t8jNYncK+OlFxL1tVbU8vqFx3oHvh0M7uMh/fFvNeY4=;
        b=lKXX7t7f5B1zwZR7lYsesDV0FO81fXoAP5D31RZyTmC2xIasyETfuemei8gmQUTxrD
         JwO/JoCJo+5wI2evvbY81cRbARE04rsqyPc9ExB/6t+AGgpgVzKxA3m8uIPC8T44g+VW
         4mxlfbWObRRhdD3CNFE+1Hh5qiLnrmXK6EAdDPxlYIrrjAfXiLTEymiMMn9mim5TgaB4
         2Wecb6A9Xbt4aUjJvZIt6k+1ooPxqM7JVN9B+4BWt5aNJvjjsJqANGJoXpWok2sASAFy
         jrv/jm44iMNi4QL/aDCX38JZxv0RvjLk3piJkJHb6Imp736VWLGYVQ2pJjP93mnOVMcm
         B6mQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b="c9wC/Z87";
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id n11si84194edi.1.2020.10.22.10.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTj3xwBzyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
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
	with LMTP id WE--j2E7eqR3 for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTj13r2zyXg
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:33 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 06/33] hypervisor: Makefile: hook-in -Wredundant-decls
Date: Thu, 22 Oct 2020 19:57:58 +0200
Message-Id: <20201022175826.199614-7-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b="c9wC/Z87";       spf=pass
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
 hypervisor/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index 47377ccf..27dd5dee 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -30,6 +30,7 @@ KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -Wnested-externs -Wno-error=nested-externs \
 		 -Wshadow -Wno-error=shadow \
+		 -Wredundant-decls -Wno-error=redundant-decls \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
 		 -D__LINUX_COMPILER_TYPES_H
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-7-andrea.bastoni%40tum.de.
