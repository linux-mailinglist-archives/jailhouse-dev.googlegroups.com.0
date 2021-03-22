Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJPH4OBAMGQE44FTMSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C742345024
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:38 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id z12sf69289lfs.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442278; cv=pass;
        d=google.com; s=arc-20160816;
        b=g4yaBQJdIuh8ARRLOgXXnxBVCP0auR9Ck630p9QshtMou66jsW7OfGtrmEO8830ZWh
         KoE3kTGrWqOWFEXvpAj0YjCD4lX2fQC10BpkF0RDbEyvWa3kO7CFcNMH50CN/CkuKJ+y
         GKlnlUCTRbj4O8bIlrnGG+W7IKbOBe8bZdErn+ZRyIQfnTam0A2wZj8fBKM43mPTkDgo
         YNEBXfxV74tYwezdRpjzcOdpC/GO9bd1rRqAonyqo0ncCnBl/GQuXbyCcBs/t/Ol4Q6c
         Ti9MribBz+xUSrHiIZTSwvzkfKnp3hU++8JEcYFrOYJEuI5Vsbh6jkbthkYA245AImOy
         vPpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=vlkqRCcaVzfuSewlWjpsXJ/Ar5w7P7cQaShNb8bvTf8=;
        b=PlecHej7AgCsstqId65YUyOT8gEwjc0/Tyoy/Y5ere5HLhRP+/NbDA1PynqEOq64cz
         yB/Ns34TrSfQm7eOjgJXhdMeEgnemDuK/N51WTgvbfnKL6x8dyJ4T1Sf6RlCNvbTl7/X
         p+Nd6uVJwG1dRP7B5behTiN228KJzh/GW2vSQzI4LIsANc1xMDHpXa/tZdaATuYZXWe4
         qMSE+8C5sy7KO/aSEeTGFddXjOsQkhmeYqBnb2fqKHANpr0A/uaIq577PqIRLM/eRZyK
         VVK1q+bYDFm4VV1CNUVs7SHCxj66d0856RR0lH+5mf1y7iC08B26rWEy9VJV1/i1jBeC
         WITQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WJt947gK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vlkqRCcaVzfuSewlWjpsXJ/Ar5w7P7cQaShNb8bvTf8=;
        b=XF8ycIgyjdQTotR6qSIJOA0kINA6iWttzqS0UYWPG2MOBLiv2IQdxx0Bk7DVH6yH3y
         zbNyQRBAhJVgN6Dh7v+cl7ALWWEE6m7EgJjUwSURtTe0CMMZpaaowge2raQxUYixFnSv
         sMkw+LLEYPFmXpglBH33nzPOMMOEoqgmGVy1Ok/QnvzY6gBD2x4KsJMq3UHJLA7KD+Pe
         2CDqkWNS6iLdsPnDCeLELEynCiGGeQDGIF3JubuZGRvq0DdSs9IFGIGhHMH+3+p3wjyx
         kyaIilMAP2ydl3W1kLrHTIe+s//WDJCP4AUvRbQyc6PR2tYURQmf5gTitd65jXBrwkO5
         vOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vlkqRCcaVzfuSewlWjpsXJ/Ar5w7P7cQaShNb8bvTf8=;
        b=HGF69bzeESe+gOy4jm3C7CpV50ynAq9qH5h43xwG1hpM88wxV+f9FwZpJ8MZSYDt4P
         lnY31X5HPDPVA9Zh8dgXC4xqtcRnBi43OPMcLUk/YcpGAcKZhdNQg7FYCue8uFaFwbZk
         q4GmBrce6dmgqJl4kkqd3hCLHtvkh+fuLGdqZTCa0JrxkbfHieXzOVL34gAZcMYEkGRm
         bUVZulBp9DcrxMew985nl0+Jn5adxEVZsv4JyFcpW9K6ImlyhnQP8UOihQC3Z2Kv1BzN
         QoUpWSWYCX/Ev6uT+ByIzwzilFF1nrY/1cbSjmjGwAu2jEHjMDX6NOTa3jHqDRG6D0Ev
         ONOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ui1xduFRZ+G6JjhnOm2Sx1O4a24veCoWRvVBeaCNL9im6YfHz
	5zcSYGTtQPi/1E1hitpWyOc=
X-Google-Smtp-Source: ABdhPJzu3YkMLsqlCg8vHrajfqug3NB0xz+7Ep6+bN3hk2hHBYD8tZKI9EpVm5BuGOk0MQAGHsClDA==
X-Received: by 2002:a19:6b10:: with SMTP id d16mr550177lfa.540.1616442277899;
        Mon, 22 Mar 2021 12:44:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:e86:: with SMTP id 128ls3534833lfo.0.gmail; Mon, 22 Mar
 2021 12:44:36 -0700 (PDT)
X-Received: by 2002:ac2:4949:: with SMTP id o9mr530591lfi.174.1616442276886;
        Mon, 22 Mar 2021 12:44:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442276; cv=none;
        d=google.com; s=arc-20160816;
        b=fmibp/URs48kulWD3Yng/7Yhj052ZM5ZWq+qsN3oTGtKxkPrwUYHcms+IysU1K3hgD
         8AbRCcwfgdmJf65A+rqtILD30ZOlqj/OIZR6mN865u6mxJ0N4DxypZVc6W2hTNZ00CKE
         sEa65eDkQO0QrCBXwhrNTk53NRJ8S+H7qIJPmQcOSFvPPHEaVLGzp+Zb1dfsMfHKpMHG
         gtb2UBTZNeOYuqgyhMMrawwDrjDZnYg32lEq8QDx0S+94WWC9n6VyD7c85tVWbO/bThH
         i9YBHH+boli0kFbWKSiMs6+d5ACzi8lbxmyaUACcLGVdRGWlU9Sn4uW0JmLUVC9R0Pao
         TEFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=iEAEPOuExdtshWjTj/O6qX9FMbEkEl6pzu0OccmJLaY=;
        b=ggdvAfZBgH9Yj70BOh/E+hQwOZYA5EB3SL3fpi0SgYLPkyrfb9uS8+f7B7Ds6K+P42
         YkU9eiq5GalsmSxjiOs3ws0fjzPFyR9E7TuO63ypxjrtIvkAZ/zRpv8UFSeF818lXEA+
         Gz0yhJCPVzqNhlonJLS5Iyi8nBAkW1z0MxbrFhsKtGCnurGyww4slX3sPrkECcNLlUsi
         /4z1Aen2Gg7fnlYloYHAGkBmIN+unasHxtix9iXPZvcAfEORN3YXosRHvGE16OBh3wml
         R6syGRH+hydiPntbHF3sUjvwyjohj+POKqlyNDyudigybZoDjm/AssX9gDw2NeeIviqo
         aS5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=WJt947gK;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id a66si441127lfd.7.2021.03.22.12.44.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hN2jvdzyXh;
	Mon, 22 Mar 2021 20:44:36 +0100 (CET)
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
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id ZuBgu4eL9mhT; Mon, 22 Mar 2021 20:44:36 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hM5dqBzyWm;
	Mon, 22 Mar 2021 20:44:35 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 5/9] pyjailhouse: add support for colored regions
Date: Mon, 22 Mar 2021 20:44:06 +0100
Message-Id: <20210322194411.82520-6-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=WJt947gK;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
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

From: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 pyjailhouse/config_parser.py | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/pyjailhouse/config_parser.py b/pyjailhouse/config_parser.py
index cad761a5..b612f98e 100644
--- a/pyjailhouse/config_parser.py
+++ b/pyjailhouse/config_parser.py
@@ -52,21 +52,23 @@ class JAILHOUSE_MEM(ExtendedEnum, int):
 
 
 class MemRegion:
-    _REGION_FORMAT = 'QQQQ'
+    _REGION_FORMAT = 'QQQQQ'
     SIZE = struct.calcsize(_REGION_FORMAT)
 
     def __init__(self, region_struct):
         (self.phys_start,
          self.virt_start,
          self.size,
-         self.flags) = \
+         self.flags,
+		 self.colors) = \
             struct.unpack_from(MemRegion._REGION_FORMAT, region_struct)
 
     def __str__(self):
         return ("  phys_start: 0x%016x\n" % self.phys_start) + \
                ("  virt_start: 0x%016x\n" % self.virt_start) + \
                ("  size:       0x%016x\n" % self.size) + \
-               ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags))
+               ("  flags:      " + flag_str(JAILHOUSE_MEM, self.flags)) + \
+               ("  colors:     0x%016x\n" % self.size)
 
     def is_ram(self):
         return ((self.flags & (JAILHOUSE_MEM.READ |
@@ -84,6 +86,7 @@ class MemRegion:
     def is_comm_region(self):
         return (self.flags & JAILHOUSE_MEM.COMM_REGION) != 0
 
+	# TODO: add colored versions?
     def phys_address_in_region(self, address):
         return address >= self.phys_start and \
             address < (self.phys_start + self.size)
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-6-andrea.bastoni%40tum.de.
