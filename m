Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBH7GXKAAMGQE7AH2HZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34230248E
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:36 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id k4sf6204698ljb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576095; cv=pass;
        d=google.com; s=arc-20160816;
        b=C7nIu1/t/j6o8rWbrVit1Alqg3SUX4wZBlKVdW+2XOYfaTdqYSsnKwNMPdbIVK9Hyg
         Rmmo8295F4i6HiRFPM3kcpz0ChIvnIFsknEPVpNxfCBLd5UIYD8wL0bGhRZJzrKHYwXj
         Nj+oLqWMNKtQGVfQHSCMXDzR8eZ4a9q9xHGBiElZJRf7FxDrHkKwNDVTdTXizzG8oa5Z
         nJyDa+swuc86C+S94VegjJiFO1cSBkuwklGqcV3reiu5M8bx4YA8go32v+Ob/5sQiL2E
         2kWVOfhV3xv/T8BLvf+dFmfTd4mpPEc7G9ZltsLtlhEgWi3tPX5WRRSwIxGOdwQhbZRK
         XU6g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ag93tCBJIlIpaSpli9GhYzTMonBklpwXjogTd4y1Log=;
        b=sNmKpHUfeBBG7rpskjwTytMLd7uWSAMvJyoegfli3vnz/ph6LGO/exFCk1pgmCHWZ5
         UINtwrLEaLs/IaMQIQmitWRdxTyMZJYUq6awJV3rIMMK846NUINeKuwgbpiwMlZZlymg
         ewqrrMbnweLkMUIuSpnWQI19WyOay5t6/rjc8BfUszMdbfQ0mOdH35Xw+UlSX1b5VNTc
         n7mu9uQ/HGV3D2ORi2aqh9IJvqqPedrwfeRJK8WStrpy8lGHKbwalQf3zvLWMX6Geezv
         aBsR6JLZgxYefMlGRN1OH4aVoOgz1UXhc0IMC9iTgRQ9tlPXjyeFqVC8uccJfv9LIybM
         GwwQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=G9l+vQkw;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ag93tCBJIlIpaSpli9GhYzTMonBklpwXjogTd4y1Log=;
        b=Yt9l4an0avQz0+1pDXzZQa4Y1bwnV9OaMRmHGvrotw9CWJVocwJg+cnM2uSgEaH+n8
         48KOFMYe5KgSAfiSTQIOTJBvuNhXYa9YxFH8Bf0GWID0PBIkAlYQcZT5JXp7mRmTlqur
         LwaSfQZSAjl9F0Qi9A9YUjsEH0qoI6u/NZ7uhi83FWqGKjpZXDwqh27CwaBFXqW8Yamo
         +VIrwUBgcnNnuUyArLSV+V27YLzbURnGp1PRxJanfPEtXeJxCfe9VPEIAesgMQkhOsaz
         asZoPEnnBJmXUwzfpNOlFTvs86B2pyqTOcWYSntTqlBdP1qa+kfgckWcmBrM97rf6sUz
         y5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ag93tCBJIlIpaSpli9GhYzTMonBklpwXjogTd4y1Log=;
        b=JiLMnmw0r71Vg5+g5WFQFicDAfzNaOIoo92q2UKGSCmpe/WaZ0WmBp6T9RigwJMFBr
         1PFCMdWdH68hKYKEy4cbDT+DApPbUbFGkGHMWYjNJWaKwKIfrVO9pExXxHaftM52DXj0
         nZD4pGiVudWxuYv6qDqXmKxtif3dsjzTglo306kpGz51QjLHZWcKh9ttYcmw45JfoFoB
         yusgtCqjL/hFBY2kMbrYpU9Y/DcwRGf+YILKORGJNjjj5pdT1vFVaF4YkIveOf0pBQQ2
         htyEfEzIPRm/HIXjCdh3GA7n/Z80lok4bM5odaTyGkxtvHaq2PZkT7X2m/uyme2xpQdA
         GTYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ZEttC9v97o+TOyL1pUw/Oh49tKuzqF8OCJkgrlPHA5XpfLwK5
	/GU+POVkvXOvLkqj6oq8OVg=
X-Google-Smtp-Source: ABdhPJyqbKQ2LkssDFFL1XNVMqsWQz5MZrWnUOqQ858wdD8gtab0VdR9Xjez14si+WKeTwQFihDkig==
X-Received: by 2002:a19:74c:: with SMTP id 73mr115298lfh.644.1611576095711;
        Mon, 25 Jan 2021 04:01:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:bc11:: with SMTP id b17ls2116385ljf.7.gmail; Mon, 25 Jan
 2021 04:01:34 -0800 (PST)
X-Received: by 2002:a2e:9d5:: with SMTP id 204mr43256ljj.84.1611576094779;
        Mon, 25 Jan 2021 04:01:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576094; cv=none;
        d=google.com; s=arc-20160816;
        b=Hl3ey8EY3q/ZCJcbsNo/SXXiRzjSx5uNa6rBdzMkumiYbVss0mT1Zvrd0Pjt80RW0P
         EFSIzXWhKj9IPXHHeihGsmvS+UaQ93YhbY8V20bR4diCs/2NBlsYvx0I9m8jPwZsrao5
         fdFJdL7iAA2oN0lKKonJkuu5Kq87GwjmCC/7yrQmaWQ2veCC2+albCbKdTiaTfTu7NUY
         Vue+T1ef6ZvbWrTVv8pX1Iuc4+dkpz8wdUWhweFcN0mnrEHkdkQIdnMTDw/BRgcBM0Ci
         3Al7DVuqOIuF0YiSCT3Ax0orGvxJk0aswPOaK1cPM/JvGlWve89QFCa7eMxFyoovHkEt
         HoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=WUQpsXySTyrnspZ3QhwXYzWKA+piueVcpVRPFXy2J1A=;
        b=qKOyQTynoL6s3B3nZaBNH8UiOVUzEnwJmUobJy503egDl3+0SDaRstQ1e2C4yQ/LCW
         oq5US6bbk+nEXAhbtSw3EQp3RX3PHq6EYx+zk/9/Mqa4UZPyXHxgtqDsH/Nr7bfOaZxp
         2LaicgDlmEWCiTunSHN8y87r+/SsFw1U49h43opT0pEVvK13U/c+/CliiNBH9TgCb04h
         mX+RRyySjjX1fOnSiPQlstXL6RqYH11hsDCTJCUn1V+AkpDWSA8Zi1LIsXtgvOoRvEu0
         vTcwxa5fpnXEFtG1LOywHBxRoYvxWTrKKRO0OLLiu5O5pcufMJseEd7xRgqdivBAodPO
         uLNA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=G9l+vQkw;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id q28si722772lfb.10.2021.01.25.04.01.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:34 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3y1vm6zyfP;
	Mon, 25 Jan 2021 13:01:34 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
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
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 2xSTWWbZrF4w; Mon, 25 Jan 2021 13:01:34 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3x52r0zyd8;
	Mon, 25 Jan 2021 13:01:33 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 06/23] hypervisor: protect inclusion of control.h
Date: Mon, 25 Jan 2021 13:00:27 +0100
Message-Id: <20210125120044.56794-7-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=G9l+vQkw;       spf=pass
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
 hypervisor/include/jailhouse/control.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hypervisor/include/jailhouse/control.h b/hypervisor/include/jailhouse/control.h
index 76eb0428..2ac7e2dd 100644
--- a/hypervisor/include/jailhouse/control.h
+++ b/hypervisor/include/jailhouse/control.h
@@ -9,6 +9,8 @@
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
  */
+#ifndef _JAILHOUSE_CONTROL_H
+#define _JAILHOUSE_CONTROL_H
 
 #include <jailhouse/bitops.h>
 #include <jailhouse/percpu.h>
@@ -298,3 +300,5 @@ void __attribute__((noreturn)) arch_panic_stop(void);
 void arch_panic_park(void);
 
 /** @} */
+
+#endif
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-7-andrea.bastoni%40tum.de.
