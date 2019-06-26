Return-Path: <jailhouse-dev+bncBCPP7EVS2QDRBAUH2LUAKGQE5Y5GE3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43e.google.com (mail-pf1-x43e.google.com [IPv6:2607:f8b0:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id E363557EAC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 10:51:16 +0200 (CEST)
Received: by mail-pf1-x43e.google.com with SMTP id e25sf1160661pfn.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 27 Jun 2019 01:51:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561625475; cv=pass;
        d=google.com; s=arc-20160816;
        b=o3st+l7UW4dID6p0dGFs9aN+hH1zpsXJHwlPVTo15hn71D7Qkot1xU+lYzTup4p8Xe
         SwEVTlBnjlAhFAHZs1q6gtYJCn1R2x+KZZEain47/OPgBMmDolVjHkIXyIbsOEjvWEm5
         a6zk8KlijB22gh9jRtXZpgOPJh8DvpNrKny7rjXQMnxPerm461SZ9mRj0zaH9GFbXh+9
         4VjzlZGJoroAKptgBv6q56D1c1r9VDHSzGHE4JtT0lNWuj8gJG2fqf122sdpQIhi2IHX
         uBoLrOS1LybWQJGnBoCqUXCXgDARkeZriY3CtkHciZOnpNDKPzJWJLLkfx5sBQbCHeYW
         iiYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:date:subject:cc:to:from
         :mime-version:sender:dkim-signature;
        bh=ENaQx6YOEpxLBKTcyW2vCA02dXrwTlhd2kP0DpcVWgg=;
        b=bOzGKigUYG9WOsRXbvW9nRw9+y5wl/iOvJgY/Yw7EvUFT1asxTDLkseWOdKuA8BBLu
         mC+8pOdOCWG+gBC51vEpyYWTUljvoL77qwIgVUh1zC9L8zOqGiM1S3gvUc/zFohdvyKn
         Bza11xkSp//YS1Tg3palZ/FSgBeh8GMb2fGvWzyaxypZ1TSvW6H+RC0/nZ0cf789F9Dy
         woG1PltwswaP1tH2xlO6rq5dct1QL/vSL0UwrfXT33SiTI5eOQhoDjrHyfSibMBGzxWn
         Jt/eN6It73dr49wbwh3MeLx0iY0s2vOnYZCelP7e3FXUr8nlQnNA3XK+kqGSEK6XG7WL
         JPoQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2018-07-02 header.b=ZYB9sYgZ;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates 156.151.31.86 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ENaQx6YOEpxLBKTcyW2vCA02dXrwTlhd2kP0DpcVWgg=;
        b=CmEcDfFxcCw6MvSCo/ELgGDIx7QYsSwX42Yej7IVtACyTJjNt6hNH4daCIWxUWtc+O
         /T6TAD+/Jp+325tn8oYC3zD+34/8QjPBh4Kti6QsqrAPbzKDyxYfASlzjJfCANeYbGqO
         3RluiP4t2J1eCjbfIl/Zezkf/6cut+yVcdPr6MlSeCSeN89aa6RP+DzvQkroGctsniI+
         kO/1Guh1GIV4xMOyCuhi1XeDKCu2suwKC6J5pkx4K38LQ/Hxc4QPa/Vnr3BvFE8OptPo
         lsmUr6RrisI7CJh/GjZmkAFVaivUNP40GLhCyd+to6jLAX/Sm7JnJ3tliSrYtiJCD9rL
         cDiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ENaQx6YOEpxLBKTcyW2vCA02dXrwTlhd2kP0DpcVWgg=;
        b=DdgvlfqHeTrEMPiGnE4ZM+bBSUWLruMvpzVja0nWi3emsgenJQPtWdebLLB39BP5rb
         kyneI6oOUWjE/jZTudTL71npr1mwg2WWORMmOzDYMtClW5d6XpVHDTw/VC4itnT8GJv3
         aVBoXqLkJyHsxeHlQ2/8qKrGjv9UDOsCV0pKfIO9qlALPS9VWxjEhdPwyLx6TEGrI6b7
         8+o+W3K23HuLrhozgmRg0z9oVMUzNnkPaVwoE4cM1FVFmEFnaWMe1+J6NPo+g2+gO22u
         ZgH/Y++98NVMlUoCwyP7VWWppajf3OvDoeo0xe18FrdE+r3x4f/8kGO5vTPrqLJaJsSr
         zI9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUYapqJy0M+vW9KJWuuO8Pux4PvOfKm7Q4nqSIaoM5guefHFFNx
	OL/V/65yms485OsAwCrWIeo=
X-Google-Smtp-Source: APXvYqyO8yL3UQgMET++J5SVRwto8zQhyn88CxCj1y2xmpr+DaL5+8636u+Dd0VrtQp9NG4fjXEt3w==
X-Received: by 2002:a17:902:868f:: with SMTP id g15mr3278863plo.67.1561625475122;
        Thu, 27 Jun 2019 01:51:15 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:ab8f:: with SMTP id f15ls1588006plr.15.gmail; Thu,
 27 Jun 2019 01:51:14 -0700 (PDT)
X-Received: by 2002:a17:902:f213:: with SMTP id gn19mr3396693plb.35.1561625474751;
        Thu, 27 Jun 2019 01:51:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561625474; cv=none;
        d=google.com; s=arc-20160816;
        b=yrvlHCUqbD6VWEzjtayH8QnBnvKF9KynOanynX1DM57C9xfLgGtenilElfSkGhPZEa
         unUklM3OHzgStMbwQ40xI+HKJO1SZsFnzNX47WZbOPsMo9uynA2Hm1fOK9xoNeZGDstK
         JTsgg0xgbz5UlxUSz16Hyd6BmBUgLEK7VwBo4/uVgRd4Kq3qX4e1O1huHaSe/CWO1SRH
         osOFhq2e96fhoDNCp35EwaYIUtDcTN3MhUezHedewFIe5DBAaInsuSuICGDdA9VtpMmJ
         bC7O2wFNKp8nRjPPWt1tMdG3zFSkHlJ0Z3Y1aw9davCjo6AYu81ixxC6ScEWQaTDBqXa
         G0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:date:subject:cc:to:from:dkim-signature;
        bh=hUQwZ/Yt5oMGyNid41BWKaqAulxyvbzq7M/4Y2XpoHI=;
        b=eaS1hYGCBJ3dOVthTpcG6TkaG83/B6bGdosYg3byOloUTkfSdfBNbX2+lMSjqEIfHO
         uB+jPA/dyIaqLbadl1lv1JWKeT9zhUr7WvTjEA3E2M6oa4YHIIT2G4q1Iof/7L2ragqA
         YvOmYx0V2qXNhJ+P+1E5kX3Qxrb/o7joOPL5lUoy2JLAe5uqpl1lsEtFwH7Z4WlrB0lL
         jW9WraODf21se87+C0egIP3mmBqcbGeW4V0c0nhWC3CQIxPAjHIZuzh0NjAQze0YTei0
         TJdJFvR7M7oA4Qqgn1Umq87efQPGVDcFBpi2qjL/pUGHzRqYGCxOzGyRyOmNdIg0HscC
         hK5g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2018-07-02 header.b=ZYB9sYgZ;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates 156.151.31.86 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from userp2130.oracle.com (userp2130.oracle.com. [156.151.31.86])
        by gmr-mx.google.com with ESMTPS id d13si54868pgg.0.2019.06.27.01.51.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 27 Jun 2019 01:51:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhenzhong.duan@oracle.com designates 156.151.31.86 as permitted sender) client-ip=156.151.31.86;
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R8mXkR135289;
	Thu, 27 Jun 2019 08:51:11 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
	by userp2130.oracle.com with ESMTP id 2t9brtf2hp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2019 08:51:11 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
	by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5R8nTZK068444;
	Thu, 27 Jun 2019 08:51:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
	by userp3020.oracle.com with ESMTP id 2tat7d8qd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Jun 2019 08:51:10 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
	by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5R8p9Yk002066;
	Thu, 27 Jun 2019 08:51:09 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Thu, 27 Jun 2019 01:51:09 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: Zhenzhong Duan <zhenzhong.duan@oracle.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, jailhouse-dev@googlegroups.com
Subject: [PATCH RESEND] x86/jailhouse: Mark jailhouse_x2apic_available as __init
Date: Wed, 26 Jun 2019 16:54:49 +0800
Message-Id: <1561539289-29180-1-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=910
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906270104
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=966 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906270104
X-Original-Sender: zhenzhong.duan@oracle.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oracle.com header.s=corp-2018-07-02 header.b=ZYB9sYgZ;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates
 156.151.31.86 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
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

.. as they are only called at early bootup stage.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@oracle.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: jailhouse-dev@googlegroups.com
---
 arch/x86/kernel/jailhouse.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/jailhouse.c b/arch/x86/kernel/jailhouse.c
index 1b2ee55..d96d563 100644
--- a/arch/x86/kernel/jailhouse.c
+++ b/arch/x86/kernel/jailhouse.c
@@ -203,7 +203,7 @@ bool jailhouse_paravirt(void)
 	return jailhouse_cpuid_base() != 0;
 }
 
-static bool jailhouse_x2apic_available(void)
+static bool __init jailhouse_x2apic_available(void)
 {
 	/*
 	 * The x2APIC is only available if the root cell enabled it. Jailhouse
-- 
1.8.3.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1561539289-29180-1-git-send-email-zhenzhong.duan%40oracle.com.
For more options, visit https://groups.google.com/d/optout.
