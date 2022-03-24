Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBHEQ56IQMGQERJYCXOA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6B84E5CBA
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Mar 2022 02:23:41 +0100 (CET)
Received: by mail-qk1-x73c.google.com with SMTP id l68-20020a378947000000b0067df0c430d8sf2137546qkd.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 23 Mar 2022 18:23:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1648085021; cv=pass;
        d=google.com; s=arc-20160816;
        b=NihT/AL7Kr/+bUQi4pOHm3KhUpjzojuxcB3cUuyIwOOTYI7/LNEyAzSJmGeU0MbdGq
         SomeBj1mU1VTAbQFWuMu8GWV0k0Oj+5M1xbKrc+rChIpJokb7KP44uU82Yy+U7/hvEWp
         lVK0GRrdwsjJ8RIQ6Z5Wu54Uvhn9pchCGJmTRD6XBVKSkT9G19c/aCPhqLOBd3yyfj+4
         i5ioUve+ImbF6RNRpntd8wB1JXzLVlyUem19PCcJYlUu1h3Hl61IYxQt4jOlrPci7NEO
         9Qdl8DGxr1mdiQebipqJGBiOyDYRRkaP7YoL1fX8xMGQl40yynHYyTlXqwhUxuXqsdwC
         YNAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=4UsjfhX5WoHZ5iCXt0Q8wbcpb7fOgD5YRMQialqIx6Y=;
        b=OPSBQ59KW4huIGEx4uww6nL3utF8lLmYEIfAT7+1izmoPXupym2LS/R9yFeHtYUEa4
         Gyng4poNBMzYG4jnzp20EYN0cYCDTkRhjNQsSBHldXP31wBAJ9NOagzmRSCcwjb7ObQu
         0O8SjLBKknTVkk/6x3RPt13a3/nolmqKiByDfhZe0sJLvmf+tDqvoLNfa1YNilyj2WVm
         9dcZjEmeJ/ig7QAhGs4YIr79YYsBp5Q1+93/Zw8EfCvfpaIT2O6y8yg7U53VvMrvnUC3
         F1uMd5OpoD/BdJdx8f/U6b89S17K/9Mia0/uZ+PpAtnULE3/tjZYenxfwYlO8Z1MX7cv
         M6LQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=psnioXW+;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=4UsjfhX5WoHZ5iCXt0Q8wbcpb7fOgD5YRMQialqIx6Y=;
        b=gs2z2Gbjdk9QzCzlK3w4t7EbbBos5OLrGwb3R8Yl8vvjDai3tI2O/MbpvYIIV5YDSZ
         Gu0wWMEc6t+HVBqXL03402lmNV0trBvW3pMGwFbVmdPHbI6/wVvn8O4wshjVUYqqpsDB
         zSo7y3CzhQPo/IDV3/8666s+hnm4XG/IJhnzTjKYsQSE4ZBCndI/3CTlTdoGyMTheJrW
         heD5AR9Z54ZE00W4KlognyQmR7zrpnEIGxqxCzmpr+4N8mTVXmTZQjFRa5sKu+sYlz4t
         oJKM/NluGUHbcCha3zCRoYwyKScF9QUaPHxO+JXFmqpCCVuZ1g6FldWltSXhqqNOa4cG
         neZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4UsjfhX5WoHZ5iCXt0Q8wbcpb7fOgD5YRMQialqIx6Y=;
        b=Ov6+PracyELAnBJBhxAI4rqjtk+1IR3BS5DqPLHsafRneQUeKKCIl65M4wF71raJKf
         MacAVIwwWefuCOS8DFEA9aq3ULNb9JfYwKaVZ+SOm674+I500d9k0HuGeQ6efsPIBoVv
         gxEQNVDlHQdsZtpPL8udSSLkW7/idvieo3xzX/GMvUBcWlEi5M3UtSgXMXJizfDctoxC
         dVxj7u3GYSlNonCW7pcwFeoU124m5f83zYuBBpjAHF5MgTm3fV8mN8EMt1KKe6Pffbx+
         QoYDC2Rz7B/UdYc6DrSCxopCUsOgrBLSAQDKHwkegUYSz1amgJuGkMZFlVJVJBKe/FgM
         D/mw==
X-Gm-Message-State: AOAM530j4A4TvnYtHxPH7gQ3XU69Meu4Xk6wWzplsTjWfPew+3ykr64b
	UhxBOwpVvjzcwc2YcCKvDyo=
X-Google-Smtp-Source: ABdhPJxDAtUPOj7ctiwerrUD7aus0aVgNSvgNVWW9ng3JbB4pXmbgA7yXnuN4+eAdLgyt2SVovDFdg==
X-Received: by 2002:a05:620a:454b:b0:67e:4202:32b8 with SMTP id u11-20020a05620a454b00b0067e420232b8mr1981558qkp.278.1648085020945;
        Wed, 23 Mar 2022 18:23:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:18a2:b0:2e1:cc19:bb80 with SMTP id
 v34-20020a05622a18a200b002e1cc19bb80ls376485qtc.3.gmail; Wed, 23 Mar 2022
 18:23:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1108:b0:2e1:25ef:b35 with SMTP id e8-20020a05622a110800b002e125ef0b35mr2464995qty.545.1648085020353;
        Wed, 23 Mar 2022 18:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1648085020; cv=none;
        d=google.com; s=arc-20160816;
        b=WsX87dQCig6e7yicpumpTNkeDw2BiIbwndvAtGxtHnKuAsCoznCyFLHYAccvAnSdYT
         +Rh6hYXko6XRqjvpj9/90K2xpHOjSn5IHc8R0Lgosg4Y/ZrQwQjsZ/vcFBfC37J9Knwa
         eTx823YtjjXCA9fT7gApIY/4sAqECwPpm/X0rKwaIIcFzN7N7VdryChjJZ0HB91T45OB
         uM3TSz4wMOUVRejafr25nynlwSzVhJIpLKJQEx6tl0KQgzkWIH792QOVfOhD3I2nmRUU
         EJkl/cVyzvqyqK2IsPiQxWQDWLKHfn07ekwap+auKa/4RctAqx6rOpmNQRjuNsiATIUW
         lN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=1nHuvEQ0bvG8YgRP0Xr3r20rBf5fy+Bbirymzvn3rkY=;
        b=tLdm+frix1JcZhKI1XdU4QPQnYr4O/wGy5yqPbvScGqzyuWx4DwBgqVpJBubG7PdSd
         JyN0X0j+62GsMtnOqlnTUKr2uJXAL4gePy77ED2TL/XrObfGnjZZ5qonXrQjbzf8EAmC
         YE2KTdBGbO8kZjNE63kvhnrQOn4l01g29M7jEwBM0vehyZfpaNDZ1S86GdIXv0H5cHnt
         FNOU/oNkA4YBmM5X9ekKGsexFQATFBDGdfkvI8o5q1dJhRaNLwJHWSlzv4siJSl7mxar
         CGgEceY8oQEyhLX4x2N/q1NNP9Q1s4MhglmXdoxE7m6pihaJg9ncjIU4g/s9xCgxQElG
         FiMw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=psnioXW+;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id j6-20020a05620a146600b0067d1ceb0c68si73081qkl.0.2022.03.23.18.23.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 23 Mar 2022 18:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22O1NdOK127913
	for <jailhouse-dev@googlegroups.com>; Wed, 23 Mar 2022 20:23:39 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22O1NddQ002343
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <jailhouse-dev@googlegroups.com>; Wed, 23 Mar 2022 20:23:39 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 23
 Mar 2022 20:23:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 23 Mar 2022 20:23:39 -0500
Received: from ubuntu.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22O1Nb1k004517;
	Wed, 23 Mar 2022 20:23:38 -0500
From: "'Matt Ranostay' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: Matt Ranostay <mranostay@ti.com>
Subject: [PATCH] configs: arm64: resolve overlapping memory regions in k3-am654-idk cell
Date: Wed, 23 Mar 2022 18:23:26 -0700
Message-ID: <20220324012326.3001-1-mranostay@ti.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=psnioXW+;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Matt Ranostay <mranostay@ti.com>
Reply-To: Matt Ranostay <mranostay@ti.com>
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

There were several memory regions overlapping in current k3-am654-idk
configuration including GICD/GICR regions for the interrupt controller.

These issues have been resolved by changing region sizes and adding
addition regions to avoid conflicts.

Signed-off-by: Matt Ranostay <mranostay@ti.com>
---
 configs/arm64/k3-am654-idk.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index ddd770fe..4e6857f8 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_memory mem_regions[20];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
@@ -112,7 +112,21 @@ struct {
 		/* Most MAIN domain peripherals */ {
 			.phys_start = 0x01000000,
 			.virt_start = 0x01000000,
-			.size = 0x0af04000,
+			.size = 0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		{
+			.phys_start = 0x01810000,
+			.virt_start = 0x01810000,
+			.size = 0x00070000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		{
+			.phys_start = 0x018a0000,
+			.virt_start = 0x018a0000,
+			.size = 0xa664000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
@@ -140,7 +154,7 @@ struct {
 		/* MCUSS */ {
 			.phys_start = 0x42040000,
 			.virt_start = 0x42040000,
-			.size = 0x03ac3000,
+			.size = 0x030c0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220324012326.3001-1-mranostay%40ti.com.
