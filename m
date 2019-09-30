Return-Path: <jailhouse-dev+bncBDD5VM7LUMHBB2NTZHWAKGQE2FXPG5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A8EC2645
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 21:39:22 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id m2sf7007577eds.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 12:39:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569872362; cv=pass;
        d=google.com; s=arc-20160816;
        b=sIpE9XXxS/fsn+PI/Ul/Bgtk/hU4MBSQlak/Js4+z8y10EAHyx8E1k+r5VVTLD0Kju
         SPSVArDsnTAcUtxKiIpScBvw4zDMCz1eDNQ44BbqlLZCSn+EokJjZLz52EqiDlhlYBV7
         FqV9pXNgBFoK1osq7RD7WT/r6VqTwLmADGYkopbwCLKdQFvjo+eq6Byxl2AkFi0socIE
         XqKSXwGcdTojh6xQmKL2ScOqI1H+h6f4rgP8XccvZuIwuXaFOoOwnvZM5aj98lFtFDDC
         LOkaZiMgk6BTV/1+xlX9YC/miItNIuCZS6Jt+kFDPdAi79MYJOHTKEJYa4H5m9SEx1nC
         XcnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=OfYypen1eXPeiQvaK8BEiXAauFvm6X3bTO1rPmNa794=;
        b=QQcw5B5szQuOC6V0uQE8pgfMbtldn7dBxHLpsRRY23DUynQgEfiDPw1EuIKOEzTM+w
         +owH4KgiMSyy2LfmPzWZn5hxmg+4lgb5jExOcfR9XB3s5pbaMk/Z08cQFUX7OVWMKI9R
         oP9N22VwSuR784NjnFCpz7hjsKGhRg1E37mk9PTGKvPvf//rZ9RBB8Dnr+FMpOSQd9W+
         DcyU3dUK/Dmst2CdvbywB6Yb5bBDh/mlmOAbpC5tHjg/abCxJCKamSWy9GXI+273C8Rl
         wpkEl7DmoTnQ9cjn3k2ttJzzC6JvsXg+xq4rpU+GDiil6ZO66VbFt2f1yD1AswnM4r0u
         VIAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ermZFIgj;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OfYypen1eXPeiQvaK8BEiXAauFvm6X3bTO1rPmNa794=;
        b=NpXfMcefnHaxe2Un9zvo4O1b2fYovI4hE9+zUTNKu8sdjOBNgrxM8lZozfUsrM1qe0
         H5Mmcu0AmR6mJDiqVSlV6WSsbSE4VZIYxDEJeYzGcZBsUMa9AtgZDJnHRgJh6pl8M3X+
         o7P1EgKvBqkp5z7Eo8WYmUhhnuLJP5xk9mSu+CAQPFoHdlAzyJW0X0tQahG7oEaZGFog
         mBmlDbTnEQ1zDbn26FMCiDA3R9qdpnXo0YtBHKYlYBCf2LMXgCwBPxk/jr7J0isMda19
         nltlsqvEiWY2THh207mPC0W3CrR8/xPsiZvHK8atTlA3G/aMEcQUTBcsdY0Uu5QvUGUW
         vRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OfYypen1eXPeiQvaK8BEiXAauFvm6X3bTO1rPmNa794=;
        b=lbocpB4DEO1ZL9H8PbAUkEmvj8FPEu423yjMDkFdOVKTU2bmnKoa0nZlybBuWYpwLO
         fPRuvicWhvbEYqrSVJE/iFpVji49xbYBHqmMUOyXGLne6Cg/PL4Tb04x88cs6pbD4vCt
         ZLhbq/aAz8GQRT15h8EyZMjNpR29ZYq2KtA/gZ7ru8Lkor+EhYFOc6kprmskw03Nbn+P
         gS3JCm0sWJiOCyjOgDjzaJc9M+IgeLjuJj9TbLSlrebBWDCsrVhJ0oQTJnV5Prb0OqIW
         UAJMemHHrjN/IFBUd4VTFvzaSg4oS7up1vF3oubM1/e6Aud9+01NaeTaM5VSsBQ6F9r8
         Nq7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXd8dDZF9/Wd51Bf11Hzl/wtEEJvmHkHvJQggLw4Eaq+Y9jek1Y
	9Au/qdZKDL99cnqyZydmio8=
X-Google-Smtp-Source: APXvYqziNMrIP85K7KH3fmeJAvOkulLxABKyGnYc4MuyKehYwsAGTKXS8GKhx525J6c2TplYBsDReA==
X-Received: by 2002:aa7:dd11:: with SMTP id i17mr22228009edv.147.1569872361979;
        Mon, 30 Sep 2019 12:39:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1847:: with SMTP id v7ls2451767edy.0.gmail; Mon, 30
 Sep 2019 12:39:21 -0700 (PDT)
X-Received: by 2002:a50:ec81:: with SMTP id e1mr21626850edr.107.1569872361452;
        Mon, 30 Sep 2019 12:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569872361; cv=none;
        d=google.com; s=arc-20160816;
        b=RteGHUffEP9cripan483jhnP2Igwj1KtRJtG8X3pRQxDp1c2VmosFpMHuRmJ2WF9L0
         45Su5gx//aQlO9Br55vdrWwszFdIPEdCK96w0NyTOj8RkpncBrZTq2CpFRcEV0aIxj91
         0fF/aijzeai25iPFzWXpRoimKU8lp8jA/oMnekjmzWzV/fX998o0D90bR8MXBGdcVMtb
         cm0aFv8WdI7xTgpIWUqk4q1CgP/k72ESHa5iID7FOKMWZ+hA+YrAbmGgLxm95f4NjCo5
         Zpej9RL6AdFUjLasOn5PtGkwh+8pcTsXxX+IFddLVqiX1fokcAeN1eO/JNyI02e2GNdF
         IjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PXUcE1lI8KYAYoxBDbe2QtkKssR6i1SRjx2xXNHhp0M=;
        b=Rh/fbyJLzGQhK8eskeDnG55M9Bh0/Z7Cn41H3/e7cDmoaMyY9/LoA5mIQxgBwIbIAQ
         4CIzxiQf5RRPIkJDLfN2f/wtyhNbJe5NBNrhG1UIygB9o1cpFF61mV9EtYylgKyMXPli
         0/lqS4sixscfAnvugSJHAMEH5LI3l4ujgAGArjkeDacv/ycqnTxpFnfC+HM+A8Cj3Hef
         4BwfU8+ywFEt6lXk5lruoHsdkQByWJgw5rBvoOURgb6Ns9pwOtv6Wz5ZD+YJpDmbWHLL
         9Mqcra8u2O+KywiDOXXEfk6zTa0ohHo+6yRKgRd9B9aUUiP07XGgmJVFekysK3b8WBvT
         FExA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ermZFIgj;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id d27si958400ejt.1.2019.09.30.12.39.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Sep 2019 12:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrej.utz@st.oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 46ht5511pnzy9v
	for <jailhouse-dev@googlegroups.com>; Mon, 30 Sep 2019 21:39:21 +0200 (CEST)
Received: from localhost.localdomain (194.95.106.138) by
 E16S02.hs-regensburg.de (2001:638:a01:8013::92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1847.3; Mon, 30 Sep 2019 21:39:20 +0200
From: Andrej Utz <andrej.utz@st.oth-regensburg.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v3 12/14] pyjailhouse: sysfs_parser: abstract parts of MemRegion into IORegion
Date: Mon, 30 Sep 2019 21:38:55 +0200
Message-ID: <20190930193857.2866-4-andrej.utz@st.oth-regensburg.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
References: <20190930193857.2866-1-andrej.utz@st.oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: andrej.utz@st.oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@st.oth-regensburg.de header.s=mta01-20160622 header.b=ermZFIgj;
       spf=pass (google.com: domain of andrej.utz@st.oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=andrej.utz@st.oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

This prepares for the refactor in following commits.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
---
 pyjailhouse/sysfs_parser.py | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/pyjailhouse/sysfs_parser.py b/pyjailhouse/sysfs_parser.py
index 3027f82e..0f91d928 100644
--- a/pyjailhouse/sysfs_parser.py
+++ b/pyjailhouse/sysfs_parser.py
@@ -779,20 +779,30 @@ class PCIPCIBridge(PCIDevice):
         return (secondbus, subordinate)
 
 
-class MemRegion:
-    def __init__(self, start, stop, typestr, comments=None):
+class IORegion:
+    def __init__(self, start, stop, typestr):
         self.start = start
         self.stop = stop
         self.typestr = typestr
+
+    def __str__(self):
+        return '%08x-%08x : %s' % (self.start, self.stop, self.typestr)
+
+    def size(self):
+        return int(self.stop - self.start)
+
+
+class MemRegion(IORegion):
+    def __init__(self, start, stop, typestr, comments=None):
+        super(MemRegion, self).__init__(start, stop, typestr)
         self.comments = comments or []
 
     def __str__(self):
-        return 'MemRegion: %08x-%08x : %s' % \
-            (self.start, self.stop, self.typestr)
+        return 'MemRegion: %s' % super(MemRegion, self).__str__()
 
     def size(self):
         # round up to full PAGE_SIZE
-        return int((self.stop - self.start + 0xfff) / 0x1000) * 0x1000
+        return int((super(MemRegion, self).size() + 0xfff) / 0x1000) * 0x1000
 
     def flagstr(self, p=''):
         if (
-- 
2.23.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190930193857.2866-4-andrej.utz%40st.oth-regensburg.de.
