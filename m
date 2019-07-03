Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBA7P6PUAKGQEQLRIDYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 710A65EBCF
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jul 2019 20:44:19 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id p16sf755381wmi.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562179459; cv=pass;
        d=google.com; s=arc-20160816;
        b=zV4JCGIPPD0W0Zm4hfyIfaJ5jyTasCMLz0V26iBbeV+PPBNt29t27VCOWjCCnzMLVz
         GcGm7JzELXplDr4HV7ldikl+poeF6gnuApfPVW5lC8fxHJHZiZ3K+vGALwbbBnpmrsV2
         gNrVRVNC/agp8CZJOiFn501ChzbS2W1V6SSxkUifmjWugf89j/EXXGcJ9mk2KjC4S62y
         qPm6xzhfJfiemLJ90ARyUhnkRwlNlQgWt5rRpbg7ZY4DLyFT2FYIXNRuTV9nqEpN5d+h
         Z88K8Pfo5vsBa7uTm75ziKzHr4Qx3HzT3fxd6aat/7TA0UD1tlnjVT3B3vmJMGY0g2ik
         iQeg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=omg7XMNMxjq42bSO3L8Ngon53lln2DgjSipJDUQWCRs=;
        b=CUY13DZKLL42JLI5sFt/m3Co1smZBxbrXpqiQZPfOvLTGnS8qWA/MJcPXcMXQBcNtn
         pHe5MEJ2nx5X9hXyug76EnCyTNlzsQu/wt2TXfKWdMV9KNmyfgknFUTApgNfcAW9XdHK
         mUmsjKJ6qanz+FqyBymf6eEYZRzqtZiGG5wjEIuEhuQzlLbXoqC2/vwVGIEDQ3l/R7Zy
         SBlvm7+cvmriMByGPHwRZSIdJB2GqDxCC8VX6AwQmpYhC+5OeWBaYhJUyJ/6cQvux5lh
         Wp3jRwM5iQq3OfvBL1IH0mQSdsbFzJVbIt2vgd+B1CBzU26ue4snAe3tTOshggrBinn+
         MJ3g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=omg7XMNMxjq42bSO3L8Ngon53lln2DgjSipJDUQWCRs=;
        b=q31Ou/cy40X5ZMCW3fGAuOxnVPQCN0LGMQbbJvjyi1+FNM/DRXw7b2HPbWZkdGwA57
         XAlN4ZYdwBkIwLlewB7DG/D3PkyPBoMTUud5M+t5OuOcGNGGDNKRv3zO6omznzROD+iZ
         fWwM5C4LHS1jTED3Rto+XmXbgXour4FAF/i1ORZMTh9Md+EGVC8fDgwt61HpR9A1AKfI
         dAe2uDVbyFCpPBf+tuclUNp2LpF8TuC278XNIVRG7gOLdiAKH/WQteltlNOFUWnGbnyg
         W6JzE4BemTkWZ6c2NPd9CpGfgA8AHGqq56zMzdWJMuo1NgPOoYHf8un+456NWM6ivwv5
         rLBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=omg7XMNMxjq42bSO3L8Ngon53lln2DgjSipJDUQWCRs=;
        b=ArVGACCUVEvePpCzyCpkwmMpY0ZyWhDgrwsAunhdcfFLtc8FEOAgEUETsYDmxMcybM
         FyzTdXj6uk6fpfZ7UOjVqgtwHEAVyxFwWk975vtpzmrmj9kNjf/9eOC3eoGYENLuyKCl
         C+Y6Sn4EfZInWNNHcughJMNYENanG5GtavEbJhpX2M9YIfZjuW199/W+I+wGTyxt4wCn
         5g0VLW+9h40g2OBOCFS9lBuKnKGPEOSm7gWJWiKs6nw4lBUpdKs+qH4f6lZ6AjyVd/W5
         hGKMoytbDdE4tOvxJAwwhu7MN4wUGroEh3aEvpaBT29CFUYVYnF/ULinReit4tntLx0J
         wKdA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXSdx2pqUiSvrUYd1HywaoS8VBsdBhc43mUPRd9I2p7o/GiNqUK
	d7SIOJ65NPHADJM0L2ygygs=
X-Google-Smtp-Source: APXvYqxwS1oXWfDhvPsLDwxzzkb+DvWzfmU8IjipNZqKip779pNS7LWrPf4xBGADWm7CiSGJANjZ4A==
X-Received: by 2002:a05:600c:230b:: with SMTP id 11mr8659000wmo.85.1562179459203;
        Wed, 03 Jul 2019 11:44:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:fb4f:: with SMTP id c15ls748729wrs.11.gmail; Wed, 03 Jul
 2019 11:44:18 -0700 (PDT)
X-Received: by 2002:a5d:620d:: with SMTP id y13mr9796949wru.243.1562179458650;
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562179458; cv=none;
        d=google.com; s=arc-20160816;
        b=nT1ttxeDFLMAxqZZSxOGFnt/Sdsob1sOngZAUayi2A4ZiyJMf5Z+CClol9Lglrpcxn
         OOXxHRv4fuji+l5Bb9KoAFcf6NkHOXbMfxQN8NcsQc2AAx8Fa9PoB6clVUI06oThYBA3
         x1BvrduYKa1bIOYOKzQAQKwQUR8MgR1xCWPAXwL2X2Pf6VmVp/Pcgu61hURaUfEFygku
         QHOM5Urv0JJJn8XVFp/QWseNPmR7gxEIckZYuWmkU6MluT1pwbadkzCOfOxidJb5zTTE
         V01nwFEhKlmShdMuUxZ1ewwMw8MCS3aGqjJUyO7BccS0wW2IcOYBZGU32UslhzDuHQDz
         dY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=wJpPP5BTS777fSd88gAv4LbHr8kLOF7z2jHc2nQEpFE=;
        b=gh2bapvPBpgiYJ4FDhh5FsSLGUIX1E+I8VR5I8jN4MANZtQ5Bf1u00Ph753DTZnX3a
         g8KpPZRXqHwiGcnT6vNbZB+ODu8URX85qkux7Oc69oY5MP9kpHtSCpg125zBBFRFlk06
         m2Ktmsl3asBCPKRhR411jgEs1D/SnAffrwqqpo9cHfxSnAz11SixqHRZhICPoIsWsd6E
         viuExEQ303atmvJ/LWewQJxk4rtgan2HaDbbVlfOASWxf6h/shmqJoOT7DBZC8bDpqEI
         DV+HZawU07cKiWeK/+zT9DW1CZh+Js7/sxcBFkUG49AIJJooK4e/zfImzfDy5P6YCE5F
         88OQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id q14si166108wmc.1.2019.07.03.11.44.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 11:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x63IiIYT005686
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
Received: from md1f2u6c.ad001.siemens.net (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x63IiHFA023455
	for <jailhouse-dev@googlegroups.com>; Wed, 3 Jul 2019 20:44:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 3/4] driver: Declare virtual PCI controller dma-coherent
Date: Wed,  3 Jul 2019 20:44:15 +0200
Message-Id: <35912283c57b392f904c08c10831a9a47ceba528.1562179456.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1562179456.git.jan.kiszka@siemens.com>
References: <cover.1562179456.git.jan.kiszka@siemens.com>
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

Just in case this matters for a user: We are coherent as we are purely
virtual.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 driver/vpci_template.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/driver/vpci_template.dts b/driver/vpci_template.dts
index 01f816ae..f6d25c59 100644
--- a/driver/vpci_template.dts
+++ b/driver/vpci_template.dts
@@ -18,6 +18,7 @@
 				#size-cells = <2>;
 				#interrupt-cells = <1>;
 				interrupt-map-mask = <0 0 0 7>;
+				dma-coherent;
 				/* set to "ok" during dynamic update */
 				status = "disabled";
 			};
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/35912283c57b392f904c08c10831a9a47ceba528.1562179456.git.jan.kiszka%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
