Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBUEQY76AKGQE6PSY3MQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E9C29643B
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:40 +0200 (CEST)
Received: by mail-wm1-x338.google.com with SMTP id y13sf640714wmj.7
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389520; cv=pass;
        d=google.com; s=arc-20160816;
        b=tkigrchqFx0SniGkWGmzpJAid+53CwxeO3os83evs+uAYRrZ24gVmSDokpmSXGFYx5
         AYiMviFdK0xgClijP/5QS91K6I8pvTCSnL1mSlry0EVvwlj0PBydRzKA6sJbqsZset/u
         sCQbzJyZSonMEHAox8OcrWEXIUtC6Yl99Az1yVGmx0cGdFibi4VyFdWBFnfvqxDB/z4h
         vozewW3moPEvReSX0mLSZx5KlfY/Nq6tXT4fx3R1FVlrUjk2OzluquONuDF8gbGbmgTW
         nnzszlX0XDc5RB5lBzaBzHFZ46FEIgU7/GPMvzIIZr04MWMZPR4RRXaM6nyVgk9lCBXX
         IP2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=nwTWLTl9Sgz3y6DQOKC88JhF42bMGRQucl0cAjLUruU=;
        b=Br/Mx0OqKvZkYSyNZsXNz9ywg7DAOqAKrALE4yXnCSFT8fCqGA8NaUqFLHO/akMV4l
         3ZhdVhrcHz+RJVewMhJVz3h6og3Wnhklyt3RGSCkhxUnnBEWFCLvWGUkd517ReMQ2Q03
         RTPnYUttTkC/lxHFEER6GShddpEH3+ODroLEEpnISgphg2c08PmpRb1bxHt1fwI63OQH
         v2uto2xolHqiyFtPBx5qcPkAezV7/etHirgKa7w2OVZjsEKLiU4EPAAs70rySCFFuxOI
         nO5dENeBlSlOGE8rJlJsJLmMHjuaZuYDJe5qkXN5e/k8NU6SNpP2PCFZyDCJB5XsWM5c
         D8Sg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=z8gkOMlv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nwTWLTl9Sgz3y6DQOKC88JhF42bMGRQucl0cAjLUruU=;
        b=DZvyOOJMqU58C1EcebgLBBDZ7GAQyrYQhX0lBD8OgoqfL3O7TCqwlI/cikgGdL3H0d
         uwBZwpyGjjLoJLzVktFZaravnsBExMDQtvfBUIJObLKmTX/yKqm24vQp5UzklrchNlNO
         hR4tc8irQgdZP30y7XPdybY4if+nE43Z8N2TbHZcVYOiJRwf67BwarmYwMuVa2XOsBnJ
         bIg8/pvnto/YLKWWeGqv1gCbE9N1z93UdU8MXM0+gXVMd9UVlbrKMyBedH8GknW87IfP
         Ww5IzoL5SJr7ApheT/ve8f9XJMLDDNPRkUsitzcyrLgk/0Dz2bilkgyvWf1RVczNbCiO
         03TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nwTWLTl9Sgz3y6DQOKC88JhF42bMGRQucl0cAjLUruU=;
        b=lqI8tnb41fJ3yfVZGYMfltgXSq4I4DrzB/AMfmvjTOa5XAHSEpWjzcwSaCZ3SpjgJu
         X4JubotuptdiKvenla617U62LrowJH3JrUE2WHHPrPM0V8F9t6Ab5WSXB5LNtMgSwlFj
         9+GUS1+ivdPGIq0+asEkxg1hVil0cxqxMWgqD+lfPyM0oIBFy3W2WYuBvnjNJi95TaIB
         HWnwsz+tOsDuk1HHVHm45mb066JP4vj/ewEnTodR1UBEuhH4mu+jp3cYeBOdlTMAz3Ie
         bJqL59IJfbr87vIQ4UJagcKJDkehEubeaDfDB0sIZOWzVAmHo/lW78jugtGroB/NwzgW
         d5Lw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533baVMziV0tnXsvGLC/CYXTeGC38eE9iI05M0n5Hmiwgp+Bt91P
	OJkrTKQrkVgWUJTyBULBLWs=
X-Google-Smtp-Source: ABdhPJylOZJKLXEcLM0Kjf4OacJC02yiBNnFfgeiSxBl0GDCU5WK97Hf69KLDxf19MB8fJYvHpHSwg==
X-Received: by 2002:a5d:684d:: with SMTP id o13mr4241825wrw.302.1603389520365;
        Thu, 22 Oct 2020 10:58:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:82ab:: with SMTP id 40ls477588wrc.1.gmail; Thu, 22 Oct
 2020 10:58:39 -0700 (PDT)
X-Received: by 2002:a5d:6744:: with SMTP id l4mr4070586wrw.18.1603389519573;
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389519; cv=none;
        d=google.com; s=arc-20160816;
        b=EIp1ypiIj9lgNjjcje5+3NARskujGSEp9vRgS88Mjt3/n7kNdwDJIiSxiX4wFd6FEM
         rEsZyj/QTk7UAxm9ZOkPER8Hl4mhkv0AKCh8JhEDRq/vMEIf22NiCqyykukzbHoHldYJ
         lPqjZxNWMsGAKW2h7pPGFvLModxOb/hx6lx9+Ic8NMaTGo3hgMIKV3pdX+ApLtGVT/b4
         ZzvukEX0o30YaYZKwKnGzngvx9anHHr0mPFMBvuww6H+ATikA7H1Xg4cryhDZDGKAx/D
         XIrkLDFJnXx7KT8qdRIQfZS0Yjqwg9CvTV72TrL8TtyEdBIiup7tQAmFZBcvnlHrEpsk
         i7+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=phKFGIrCZyPcyV1LXI+8Okc7Iq61236DpMmTbVjIi8M=;
        b=zRqlezXGPpQTng8VHwEmG/MRjI22aGpVVxiTjGTaIeMOAZTLlc9WOmH+6OmeDbjLWe
         O4t84EzoaDoVLvq2qqEUxG0wLp4XM+StXERZmteu/Gi56VexZPSOrKKyT46AHz/pM/B9
         cR+3+jjyvybTG4rvJpkZuisx52y/Nq7+IUydYmJmmjT0Lm5G5o2xeUTS5unYvSpPl5W9
         r6oqtro7GgsCF0X3uPOneKcFuxFmy16BxdLfmeLBdJ5vSqbwOUK3zF4UiJfZI7khpKAz
         kCjzi9QGL544E03usI63+4pIHg5lwTN9jPLqOeRra30MrRHbaecP3CNuttrgw9gMgFdF
         efTg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=z8gkOMlv;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id o16si82225wrv.1.2020.10.22.10.58.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CHFTq1KyzzyZv
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id zN3KZBX5E_aE for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:39 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTp5ZmTzyZr
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:38 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 17/33] arm-common: provide unsigned int PSCI_INVALID_ADDRESS
Date: Thu, 22 Oct 2020 19:58:09 +0200
Message-Id: <20201022175826.199614-18-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201022175826.199614-1-andrea.bastoni@tum.de>
References: <20201022175826.199614-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=z8gkOMlv;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Avoid using "-1" to indicate an invalid address.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/include/asm/psci.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/arch/arm-common/include/asm/psci.h b/hypervisor/arch/arm-common/include/asm/psci.h
index 4b724877..a24c0cb8 100644
--- a/hypervisor/arch/arm-common/include/asm/psci.h
+++ b/hypervisor/arch/arm-common/include/asm/psci.h
@@ -42,7 +42,7 @@
 
 #define IS_PSCI_UBOOT(hvc)		(((hvc) >> 8) == 0x95c1ba)
 
-#define PSCI_INVALID_ADDRESS		(-1L)
+#define PSCI_INVALID_ADDRESS		~(0UL)
 
 #define PSCI_VERSION_MAJOR(ver)		(u16)((ver) >> 16)
 #define PSCI_VERSION(major, minor)	(((major) << 16) | (minor))
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-18-andrea.bastoni%40tum.de.
