Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSUQY76AKGQEV6ZLOMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B5229642E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:35 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id h14sf1033414ljj.3
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389514; cv=pass;
        d=google.com; s=arc-20160816;
        b=zu4Eo3G+lj5O1/I0RecG2sC+6bHrraSywoAo+PJJZdUc5hDFNLRujf4yTKAcZWu/58
         yaBGmshvSI5drryMZhGvRUr4LmpbaS6MoXVYZyq1KzTX3REGzsh/S+Qn8RYZpJHCAIZj
         NbnfjyIT7d8qAALLwkURowhD2zam8qmFajST3D32ppeQBcLDuvkAOyovDg5nOGuVx016
         Nyj1BDtMN0YqJxunakx6RDOQ2YnRg+Q3M5Of0CuHq7Tjshp/HZw1kXxghGuW3mtM+T2N
         1QN4h1Sn2H3b/fgySblI5XMFAoY5+Pdw5fCFN4p8Zl77BHorixPune/g3Cz6mQXixqBx
         j/WQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=+EL0VROXW/wpMcJZwMcAM4JOsAEcvDOjsx1/Um5bxOg=;
        b=D3rDvAcVp9w7HqY7wck9dwko3YwbQCZSTUIu2ptbfE1JV8pbM5xWc/1wb3lKJ8bIAX
         QmiHhErnkU8ejvku1niGOTmdLBZmHoOL6zD3R+oqrhckKEhXXG5f9RCvwkBTgxTc8FZ5
         E/Tv9EbFp0JSFXrsGA49VdOuzNqBRIZrftI9AL4+T+Vd09x7s6Fbco2oDf0nx58A3Y+F
         Nah/47geU7keG+HhQOR74MY/hoZ+BWMm33KyDKfTs5yJOS/qow8TDgrhhZo5UQztPYeC
         kZmPRGoAXvH0SbdKLQRmLuAGVPwRJwxze3M8SH2/ybs65M4Pmomj4q9RPeh3I+og/Wbx
         W84g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=oITag4Bg;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+EL0VROXW/wpMcJZwMcAM4JOsAEcvDOjsx1/Um5bxOg=;
        b=f2qlUy7RYUukdJSBLr7hWCjv8cTABZ5lRrnnxL+p19jKs8n7JhdOFAyqUCwXPF6x9w
         YlyxjE3xkbXZsWMsrDkOhHYR5SIKrk/WnR/zC28NjzXyW+T0OVc73Ywk9e/An6MHdQpn
         fSye1JWSCbaFRTWea+bACNR7oGvzJa+SPbCxhu7A00g99SBOO2U4+RAwO7MwZruCbK/K
         8s+v2UHLJL5ZWTt7J7dfurc+B9NJhn2+xupweVF5BARSXZB5rN25yt+Z+3l4VUTQWU9W
         itFYuz2l3U7kNHwyCXH3DGIPraGGCihrRYpbPp/ImGiuOKsBMSYAvTUq4GYA7PvUILG5
         YlcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+EL0VROXW/wpMcJZwMcAM4JOsAEcvDOjsx1/Um5bxOg=;
        b=h9+fL/w38lYxvtvImmj/P+AIWE07SFfWJGX+xoxkedXRZ6TGrBF8+MKDLTwWuCwSCp
         GHlL4QsEG5oukXebQwrNZD7nwH1EMEAo2VxTI1c0zSzZZyq1FAcjUjqqixJ7d+RSVc9n
         cQ8FmWQ8KiiegweXiYHYr9qCjEie7m4+eQS676S9Mz+q41VqOz3IZhr3zfKaTiHyiyid
         2YANWtvIVznPBZU4k96x/5yPZiybzfupXqZ5xaHKXGoCli+9GPqtPRiZnSw79e5t6Ze5
         p24jpvLHCZf5UDTvS/a6PnSlHrRETkq3/3kkoKfFwkItPSh9sgdArTYNCIeWK1UvZHMY
         vj/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533pmxoGrjIIygNIT57MsbfSnO3A/qL0N/v/RVkSA9dv/Y3D0ypC
	4azuisMt1odMzqg2OgXOjY0=
X-Google-Smtp-Source: ABdhPJyesdfTurcS58Dp9j6POc9JKBmfR6dIyQvZaxPLi3lDbCSq4Bv9ulsGmfHfi4yEI+THhCPC1g==
X-Received: by 2002:a05:6512:3b2:: with SMTP id v18mr1217104lfp.140.1603389514625;
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:888a:: with SMTP id k10ls494406lji.10.gmail; Thu, 22 Oct
 2020 10:58:33 -0700 (PDT)
X-Received: by 2002:a05:651c:33c:: with SMTP id b28mr1571588ljp.365.1603389513474;
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389513; cv=none;
        d=google.com; s=arc-20160816;
        b=UvrMqAD7247OHjGn0xry+2rVwReWNlC5G5diHRraFiqZRjP7FEBUwmbHkv0nJe2oBC
         saGMh/6TjMpy5iOjSEsJEfrQ8zRZ/vpqKL1mvL1CPNNpiXam4LeXCX9nJj2OUWrnw8Tr
         6QkPvBHSBTOtegwjWgaDa+cGbHzyNPGhpqbTD9hcdbaNSM5vpeRd1gzdkTVGUSvbTqPa
         vWfpEihpTW9T1XIOpm7aFeLW8u3ku9D48E3gykbwo8d/6rGJ0hodLve5xwz36BmQDpRj
         5V+ysLr64Ls+A0+Y3iD8rGqkJNoms/8dNH/ZUJ776QCiYaGcMq3nE7dgbljK53MmjTZ1
         iWbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=3XntO3OWrFRePZWXFoyp8WovMjA7oPGTR6cOF6aVHy4=;
        b=DZAkfai7AsRQ0rFqvqSq7Mh2unBhvcsKIFHj35roxQEZnZuArZAyk5BSdKpqcmlozp
         Bz4m7pIbtkUuOJcysLDrqbBJZ4AdPAZAynTlThy2dX/EdKYEW5IehYg1LNqs1tYKOqNq
         rq/CRst6BaoG70tb2DQGKtrI2ZZ7zkNjCcgPIRj197Op0MoaQsu7sNXVD0oGkkFISrTC
         NoCOq0Am+2ClozkZc8L+00u573qS9xvvQGZ55/xHpamX3ufGwK5loyMvCfXtDqKe+5/0
         CoLX/TVCNBudZhFYahPkYEYfJmJXgS+25QFqRd8yNVZRogBbQIH8mtNsaBKM4BPsmVzr
         xSOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=oITag4Bg;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 11si68472lfl.4.2020.10.22.10.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTh6tvTzyXf
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
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
	with LMTP id N-A5PpOp8Eii for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTh3tdNzyXR
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 03/33] hypervisor: Makefile: hook-in -Wshadow
Date: Thu, 22 Oct 2020 19:57:55 +0200
Message-Id: <20201022175826.199614-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=oITag4Bg;       spf=pass
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
index ba66fdf4..47377ccf 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -29,6 +29,7 @@ KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
 KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -Wnested-externs -Wno-error=nested-externs \
+		 -Wshadow -Wno-error=shadow \
 		 -fno-strict-aliasing -fno-pic -fno-common \
 		 -fno-stack-protector -fno-builtin-ffsl \
 		 -D__LINUX_COMPILER_TYPES_H
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-4-andrea.bastoni%40tum.de.
