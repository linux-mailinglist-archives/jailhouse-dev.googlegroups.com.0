Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBHN4476AKGQETCLXIQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DED029D238
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 22:09:49 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id y99sf10952ede.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603919389; cv=pass;
        d=google.com; s=arc-20160816;
        b=JEiH4NJIKZbUQ0t0CrfQQcRX+Apxtmq4Vkpw3qR7hroY+1JiRjbJSzzpm/cgfe1lyQ
         b8TWNkWoCogrIc6xC7cEr3Zc7FZNglSaFMaXCiRj/J0ckHnlkTtPToWu57cuklZdWzXD
         b/ua7V4CJezvj5LE/6S0TfnnqMlu9+/L2Y5ro7CNElZFd706l2v5kZOTlf+ksX+2+hp4
         09swiatUu7SJFu8JPiyTKK6H08Dy9wJcszLItYqXoypxvqkqUEuYkfm/NgEJEhMPgVRU
         sXLEzYzF7WHmgDEQr3/w7IawtqnrnkHK//kvRur+awINfGdTuO2uX/yGb9Uc/7Rdkf+E
         w8bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=3+ZNMftEKwevnMTEJAqLx1viY6URji6lLCPnQvFyh6c=;
        b=S4PPyFI5JAxjrx9jK5mKOYorVC2kDRJlZkUQ4Tj4Q8nAoXQ7vl4oAdMIwZWRbbsBIa
         2ct2U7QRxjvMlZB0vQjOt4rBtnKoNEzcF7PhthaCt1qFqDMu6bmbnlOak4WQLyivo1mL
         T5TH1ViQww3qups+GZ12KPYBkliE74B/vQi2R+Fpy2zAStyMfTYQBaqu+auYTCBJZKa8
         X+nlBI17xCbajQ3TCqJT3c0MLu1ul6jRO3t4z+emoYyZjOe36pBZbiBRTNGiz8IpAV6K
         vuOWiXCAzR5HXpOfBZBqg73PDCR4WWTk5/TN2OQbnItA6nrPpjrAhtWUStlXdoEdaekT
         UGGA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=SxAD9Jzb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3+ZNMftEKwevnMTEJAqLx1viY6URji6lLCPnQvFyh6c=;
        b=CZ1TukCK0YFZsHotArgOfpqsd2pMVY8atIipmPA/dCldYst/J9U5uXV7EmJYayPGNC
         BCkWPp1a5VeRubxkMVSaUwIj3dSDE5vj8Rj7nGOtS9fB68Vp1sUaZEKVKLb2VQ8epJ7d
         94/j0h0TldMPRC8RorcZM5X+tQFPVnDxLxSZpcarkUt1MoAd9ar8ajGxWbQ4fZH+5PWD
         VGz0ce/v0mh2Dt9QlDH0qjO5H1/ejbjarpGTPMgRu707twH1d5D12HXKLq1LDreS3LaU
         N4sKHSBGE1Yj9jKSjkyF8GcKbZHEU6AQhoWvGdFe6E/iNO4/4LRS+3QUuXiwzLnDRlcS
         lE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3+ZNMftEKwevnMTEJAqLx1viY6URji6lLCPnQvFyh6c=;
        b=LFkCwCQtuWKqRtLZbseSWPpD9j28N+3eY4MyiN3GYoy+YM7SepycnVJPygyUZsYf+j
         sF1acU8x4LZHtFg3zsiXvGArJf62q0YvJqcH+fmcRu0d730WEtxZbFqF0DPJyxnZGG/b
         1NaABvYUBxpVs2aJamZ6kvVFTa9TFGkjwRsmIB47EBLc3j/g9FToR8JCYScJ8SMTs9zY
         rcR8VLmK8TrfiSN7Hfw4dd37EK2KbrtAAB9YGXgKBo34wXCG3brXA8NK1DZN9S/cI7+K
         1Qc73dl7cLXNvVwbcG5f+tyHpuwhBDLYP7U8Pngm/DVveoxXKosubmUkB188OTA+ax30
         cgEQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ke8WeIEW7G9RmM7ib+G9C2ohLdXDcnB/uIurq4/If8dbVnWhL
	Q/suvJ41gA6lAsI9cB5QTy8=
X-Google-Smtp-Source: ABdhPJyDm9usfO9d0JkVWNoeoe6Hr4F1LaMSsUWVOJJ6nT24Dr7Pnesb2/u6omnkzrJyDffEVyaT+w==
X-Received: by 2002:aa7:c2c4:: with SMTP id m4mr921832edp.172.1603919389383;
        Wed, 28 Oct 2020 14:09:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1d3c:: with SMTP id dh28ls607144edb.0.gmail; Wed,
 28 Oct 2020 14:09:48 -0700 (PDT)
X-Received: by 2002:a05:6402:1506:: with SMTP id f6mr874986edw.324.1603919388430;
        Wed, 28 Oct 2020 14:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603919388; cv=none;
        d=google.com; s=arc-20160816;
        b=anLTF61T3/dZBJ04+WWYevm9e8PL86N92pmw81jxH8oPwiZtjd9LaaaCtOIcuEM5sU
         nAI2cPW81XaRJrXn4SbN7sFHXE1l1yAXKJaYfV+cmyAaZIq7yoRNlTiWAG1Av7YXJkDs
         6aLBI/cB4SXlZjzfTc5d1/ze1o5QHXYGYM4rIYDiMigCRLne0ujbw39qAuxMkt7s4eBu
         oNRqaUoOpxSRTClKPYuYPFUUnZ7SOXkuwxMpWHGEX8p6Sy4dd15/k2K7V7dJOU0LkRuo
         TI//kzibeCum2V61dZdg6wtyWZkWHAnlw1v6w8tZHomvbFmQWMiVf4MFRqdTAg84GqJ2
         NMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=iDsnBzLUX/W8R2SsRdSBjZ9tsihyv8zK7HyPmbxMS9o=;
        b=rdbsNhaVlOXCqwOqVhZOyrZe29Wj52RLdrA+/RO7wNpYApElfXqNSwkWbqMbWXwx4l
         5zy4UBzkIunoujkdHCXik7HEnrMXJ3vpjkF2l8pDYSutj+eV2k6+ho8B/wyhpM8/l/UU
         vPimS1pXmjudKcW5CRchhfLik7pV9z4LVEakwuH8TgzIzn4QVQFhT6qBLnTWjCAEuSRq
         w4pKhiYSLLwMfrQpqFU0xPROUi7WdpZcpuQBehER3twI524tz4aahBANweoEO2mYYPfw
         j37itHl4xJxRQiooj1XwNnSzVjta4YYFnKTU8OPqX5bC7K5Olkj9dSolGR2EuAyL6Jvg
         LOfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=SxAD9Jzb;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id n7si19051edy.3.2020.10.28.14.09.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Oct 2020 14:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CM1Rc12qzzyWR
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:48 +0100 (CET)
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
	with LMTP id tIqkeWS_VSD0 for <jailhouse-dev@googlegroups.com>;
	Wed, 28 Oct 2020 22:09:47 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CM1Rb4z0SzyWn
	for <jailhouse-dev@googlegroups.com>; Wed, 28 Oct 2020 22:09:47 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v3 01/22] hypervisor: Makefile: hook-in Wextra
Date: Wed, 28 Oct 2020 22:09:12 +0100
Message-Id: <20201028210933.138379-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=SxAD9Jzb;       spf=pass
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

Wextra covers multiple warnings including Wunused-parameter, which
triggers a lot of noise without bringing much benefit for this code.

Completly disable Wunused-parameter and suppress Werror for the warnings
we still want to fix.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hypervisor/Makefile b/hypervisor/Makefile
index eeeca2eb..54c16c0e 100644
--- a/hypervisor/Makefile
+++ b/hypervisor/Makefile
@@ -26,7 +26,11 @@ LINUXINCLUDE := -I$(src)/arch/$(SRCARCH)/include \
 		-I$(src)/../include/arch/$(SRCARCH) \
 		-I$(src)/../include
 KBUILD_AFLAGS := -D__ASSEMBLY__ -fno-PIE
-KBUILD_CFLAGS := -g -Os -Werror -Wall -Wstrict-prototypes -Wtype-limits \
+KBUILD_CFLAGS := -g -Os -Werror -Wall -Wextra -Wno-unused-parameter \
+		 -Wno-error=sign-compare \
+		 -Wno-error=old-style-declaration \
+		 -Wno-error=builtin-declaration-mismatch \
+		 -Wstrict-prototypes -Wtype-limits \
 		 -Wmissing-declarations -Wmissing-prototypes \
 		 -Wnested-externs -Wno-error=nested-externs \
 		 -Wshadow -Wno-error=shadow \
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201028210933.138379-2-andrea.bastoni%40tum.de.
