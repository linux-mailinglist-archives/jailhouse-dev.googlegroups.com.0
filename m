Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIPGXKAAMGQEWPUF4AA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B66302490
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:37 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id w4sf7241407edu.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576097; cv=pass;
        d=google.com; s=arc-20160816;
        b=pUsbuVMWEu8Pjo39jXNjT2aBCpPy7WaQjXBbPY+Sc+ntdHgc2t8ywwdr93Enu+reRc
         k1dvY8INuPx2NHqrEk58TgNgL8/jxxUy3Ho3tlBmxMxTJzD+jEg21ghMn/MwlvmjfDs0
         F5TTQ8b1d7B58TM4or7nDQSVRBFc98ZBtVaqDsfTqmm16asZG9QORXEeLBS3tUFu39D6
         LEB9vtoGDBt11Joxo4ZdAoM6PtZDBABXjJ6o1Ce1duVlxkG9vX3vKVPytoSBluIVRJcJ
         36cV6mI63oCOpH59/TAw6iweZWoSoeV8pGvrBAlJRztfMkShKmGQkdfudA9C7Z4ZBMp6
         5TOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=tIIswFerAnmqgmqueH6mMPZ8MPk2x99J/b+4wymVbPQ=;
        b=orxgu+RITqUL6Ol6clo+XnPP/803gjSBeqveUM8ErfUekVGwino0tdINs6+CufUU6V
         2gcR6alSnME1z9k8si2ZKM/GfTJkuHm+hyhNZEtuGez06xOGmqO95TYp7sbnQl2CszOn
         FYuLuI4agkm/Pw4ygcD+j38cZbRvsqkHGrTWzCz6bsK57lGG6ArdA4HBhHEdVptUcWy/
         VgsujvoAEKS5a2+lbiwmOj4N4FWvX2Fyi5QR/O9hi+noMpX5FNKA2VioBt0yUxGNyTWg
         mWmKYoxSNRLhoRH29uxQWPb6jz0zF6Dkwd4hORbIvuDdcocimLpQDibLFX2nFVTYxyRf
         fP1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=YIhIsNuD;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tIIswFerAnmqgmqueH6mMPZ8MPk2x99J/b+4wymVbPQ=;
        b=aJQTwFL2oOLU3wfPALIQi96SPaeLKm9NkMSHr74ni/YDNDSmptHBAoT+LW/EAka8Xw
         GC24lu24DFSQI0e+PuesT8Wk2RREvweGD4aWPyUQywuADQjbVHdMjIZQo3XV+itUY4rn
         mDn/IiQgwkm252BNaJh88B60Or+rqXW8xgRjlAYsnqAsBvae3hXvUZB+Tk1Pry3kE9FV
         X82f2DLu3jpdZ37JsmYL5uA7dEAkTjEgpaJXtvrWQ3EYv+MgMrbBE5GIzX2GA4qTnX3k
         MsRgLYDEhUaxNNkCX5L6yv+mlWDVDFP/AbwbwupQDvpCevdLHmITLXKIhX70oHAvjoYR
         f6Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tIIswFerAnmqgmqueH6mMPZ8MPk2x99J/b+4wymVbPQ=;
        b=K4hcqjJE6H1QUBuELZKpENBdfqK5ZorFByvoAKg7XT2imkqh1aaN7/VM7TYjynl6pE
         XNbbHLANB+A+8SVGhwK9z5A6HMYlycLGyrUBCCQF2GNbi3Hm/V7MXWew7OLcvNTYB97l
         P+ogg4s/9urvjzJWDSVbNjszFvOpw3C18T2zQLZ8/TlHcsK6pvtoH4Ms/1ypzikYWwAm
         UkY+UV2oRnVqcnYs6Yi2BvdB5PvaL33RjZtijR68ngEDb3KiTVF7uxPYIGA5wAnaja++
         MACWSD6no2qH8rFC8ebHNRp/kpGmyaWDzw66dCt0nU5oPtiFRrZ39f/hzfJriUu558S4
         VqQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5305NRrSsIebEO7yE8iWS6sI0Fq+lIPwTzllE+hR4X27O93wkvfa
	GLzm1gzn1OQdAYpqgB8XTG0=
X-Google-Smtp-Source: ABdhPJyx8fP5+fOci5n5HrPOC+dKnirGULEX8EckVR+ZJh5cfDhU1U53KplASgQ37Uznmm0QKfXNoQ==
X-Received: by 2002:a05:6402:2707:: with SMTP id y7mr143845edd.5.1611576097679;
        Mon, 25 Jan 2021 04:01:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:33d1:: with SMTP id w17ls6235601eja.3.gmail; Mon, 25
 Jan 2021 04:01:36 -0800 (PST)
X-Received: by 2002:a17:906:2315:: with SMTP id l21mr136623eja.183.1611576096850;
        Mon, 25 Jan 2021 04:01:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576096; cv=none;
        d=google.com; s=arc-20160816;
        b=ytUtTqCpWshf0jX6gB8tK1ZeQefO9ZVONC1+T7pmkqJbphJGDSqwHw616F/EJn9mAE
         XZm40PvALWx6njRU0M1mf+fZytzWJJfCrZdjwxC/Jx0Wv3UNflbiSuw7vsGhDkYLZctJ
         UcM70ATmm+1nl/k8lDelitz9FrE1A06skisN3JYsp8j4ApaK72W136WO0IPiwBMO0pDw
         SGVG6y1pk7RCVIBlFxk8gDhPXLv5GtfS3QoD90cwbB6tydYWLt6NOgzh4GIy0QNcbDfg
         oyY1s08hkjLi+w+ANdQ6XhdVAtrtsXjKHde2yzNEwVE+LhH1ZnxqxRfQ7wSswfrv36Ic
         igHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vDKpmu8xRRyTn+IgRkxa1T0K7SYxYEfDdSkwdjtkXnA=;
        b=Nw5T+77H8xXstcuYWTXypticveZjOF9dw8XnyOuZ2egoKruiq3XYQD9TuImUpe4JVi
         kbFsre49xzb5F7rUtyFF9HLi//pSIl3Cd3BNO4nJIY/BRRsCyGraB3D/MvSMf9Fm7D/R
         dTMQ3gp/8YaShJSw/35561qpoiJx545V79CB1C4F6XkVCj5fHiRLYDp4NtgkWXDu7695
         LxQOfBbZdK3aCdqKGirpjZx/t3c8+IkFuuKTq10CxKUyADWrJCDbv8iuGpMRqSU6Y/x/
         RmmDs5iaZlMYzXH1EiRRKGeYk7UYlJIYyyc59yu+aPeGpEUiegxYwTdhSdFgsDlcXtlD
         sanA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=YIhIsNuD;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id k20si748743edx.3.2021.01.25.04.01.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:36 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT4046sNzyfb;
	Mon, 25 Jan 2021 13:01:36 +0100 (CET)
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
	with LMTP id YWTxPZ-CkswR; Mon, 25 Jan 2021 13:01:36 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4003jfzydb;
	Mon, 25 Jan 2021 13:01:35 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 08/23] configs: arm64: hook-in coloring parameters for ZCU102
Date: Mon, 25 Jan 2021 13:00:29 +0100
Message-Id: <20210125120044.56794-9-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=YIhIsNuD;       spf=pass
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
 configs/arm64/zynqmp-zcu102.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 492dc566..cdff3ef2 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -45,6 +45,12 @@ struct {
 			.pci_mmconfig_end_bus = 0,
 			.pci_is_virtual = 1,
 			.pci_domain = -1,
+			.color = {
+				/* in debug mode, the way_size is autodetected
+				 * if it is not specified */
+				/* .way_size = 0x10000, */
+				.root_map_offset = 0x0C000000000,
+			},
 			.iommu_units = {
 				{
 					.type = JAILHOUSE_IOMMU_ARM_MMU500,
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-9-andrea.bastoni%40tum.de.
