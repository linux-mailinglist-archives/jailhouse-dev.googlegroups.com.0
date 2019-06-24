Return-Path: <jailhouse-dev+bncBCPP7EVS2QDRBQUZZDUAKGQEPUALTEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63e.google.com (mail-pl1-x63e.google.com [IPv6:2607:f8b0:4864:20::63e])
	by mail.lfdr.de (Postfix) with ESMTPS id 996CA54E18
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 14:00:04 +0200 (CEST)
Received: by mail-pl1-x63e.google.com with SMTP id i33sf9079556pld.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 05:00:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561464003; cv=pass;
        d=google.com; s=arc-20160816;
        b=ISOTTVyCc7Enhd4kdfEq2xPi2qQXvN6a0I1JbGk6KhGZ77nyFEcVOpp2rApTKckrXe
         ommzK9Ga3XZvxAX41wmbqwcjY3OYoUls3m1kdP1HjhLk0WTuFf8T4fnwXEFI5rW7H31y
         Ji3CeVpO4B30Z1hqr0il7A9KVvpPD8ntPKw3135ZOrne1oM5XNMR/UxuCi8zC7jLKhva
         g3H/JOpxpXFhB2EffaxuWw+I5t7y/vgQUK8GiXlhtTg+PIklHsxvTeoEid2yRxKZ/pYS
         AJR9dDqfxRYIXY06LFpQrCYn/hzLL5qb/r0R5XKQBoh83/2r27Hc1UQb3DTE7IHOrwkd
         OEDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=IViQjXVH/sPvO9ijni7HdTYP8wtrVNgrsNoaGleWpS0=;
        b=soAMJ5DjHRylaL5vBYkBfk0CxRrRhzvXLCzCmMc1WyoMjzLPVV7ioWj4zT8freV9/D
         ZglpDGtSf1aY1WZdO7+cr9y1E+15VmgOS7Ykjt7p6jjehbmYoZM93YR/uO6HgKdaVBru
         T2GjZnIFj7t3XkTilpFZdX8U03y7cs5wx0rz9aflQ4/GqqGXMbjUvNQthbTBzG2gIGXA
         x+FORslYPUgdDBlZ4KGoPB0QHqrb/MKamMUytASp5zoBSJu1DIiDmHxmZoC6hf586CkP
         h5g+tAiavXpd2HF52mjH0lORUUs439gEjtKgXWnaXgBCJMy4nUhbLRTv1ud50UGVOh+x
         tYUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2018-07-02 header.b=EERSTOpW;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates 141.146.126.78 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IViQjXVH/sPvO9ijni7HdTYP8wtrVNgrsNoaGleWpS0=;
        b=Rvt7IJz1WVeO9q2JgKAheVEQJ90zutreISIAqDtb9MpEzOqNARsE3ZjNW2g4lmgBJ4
         CIbfOWisymTREIafPZPmguCIPRz97mLYirmlyXYJO53Q2FFgijgSQvwXMC4D1rAx/Fxu
         JMeIZnUbg1SjDG9O1St068Jgv2EkMITv7qJFCyNbv5HZH4NUTjuNpmU8yEDOoQSflv8w
         Uy5oReRMUKdjLY0K2F8g64oj9Ejq5ngZWBOGTbx0l9w0Sz5AI9vrco8C0DdtwKcn1/Yy
         TOhxTCPyIuLfeljAIUhXWVmgcVQWNojej/MFU0r6u8yDz6vfCTZM3Wz1JXRZAn4Ql1+d
         Q9Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IViQjXVH/sPvO9ijni7HdTYP8wtrVNgrsNoaGleWpS0=;
        b=Hk0gSJcP9Za8FHJm2YfIWbKEL7e6lWJPXcZa9xrM1qHOK8OtXGW3QDwjLE4w3Asxml
         Znz5ewJZasEazK1Iigof11kdE8qz3sRGwsCaigiKm5QKHwQlE2tFLXhH02ibAF20YA4o
         4DQfQMxif/eUup/3GLpA19KcSZlM+HccPycvXeE5Si+KjNJgYVD6QCuLDtJHk1bAzsUl
         zq8/o3/6h+smaxdZMiEkrm1ihYWNn7x00A/3k5sibJa/plhm5pFYwsjPZZgDI2jBSpj9
         N3pYxkPnO+fpRG0PgnlbmLeY3ZA29HywUu4JYKOeuBLuhUnKFzaqcEApTYIJPDmm23ig
         9kJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVJJUZ7wYDIETfFP6FqjzcfM6KxgG8v9xAjMmk4Z6+vxYehw4Mn
	nd+fQ4BqKJi6gdZnOybhV08=
X-Google-Smtp-Source: APXvYqxwWGu2WM+Juh3Wlm1a5c6IxcgwE4hb213TtPvtj/6d/N6LAGWCDzChZ+IYIw4NFZunAjxlXA==
X-Received: by 2002:a17:90a:35e5:: with SMTP id r92mr32031147pjb.34.1561464002942;
        Tue, 25 Jun 2019 05:00:02 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:75ce:: with SMTP id q197ls3850410pfc.3.gmail; Tue, 25
 Jun 2019 05:00:02 -0700 (PDT)
X-Received: by 2002:a65:6647:: with SMTP id z7mr12530524pgv.349.1561464002484;
        Tue, 25 Jun 2019 05:00:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561464002; cv=none;
        d=google.com; s=arc-20160816;
        b=TlFQJ44lAppcHGMuCOPY5xWSTX7KFZPvbnPwsZgGHTAFKAwUS5SEcZoxgt58Zp2rGu
         cgpQ4bSPSFp2KWNqSPV9u/jnK/16wFovzyaAzQfGnSh9Nhj4mi+QXf6ijDYhDP3rrJkY
         TKVA2neVVYmqcvRtLFY1Wvr77djdoCy7S7x6RR1KtqBeKbXLk3cPIxfi7vh8T/fG1a+p
         t7tYQKt9Q/3A+KV7m16zNdY2R0BoGer/bZ/Ct2mUF4M1w/v+DdeFEKSmR35t5hUVh8Yq
         5dfiugDL/+d/gtrrdxlRafsolL9MalxCU3GxFtkqU9Il8zH+R9EEsXOW3A4TMTmnoxmG
         XK5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=hUQwZ/Yt5oMGyNid41BWKaqAulxyvbzq7M/4Y2XpoHI=;
        b=tS1ddtY1NKbn+l0GN5k6+qlFoqLjUHRNjW20lYJ78jfsza02C67y4daiuoHrlpRi1j
         3YtESS3XEO2bn1DApsavF3pGFmvfrgI32YNtVWlrrC2gaaf/DnyiqSLDGxF4tMNyKqO/
         evuDHmr7esUZH5ou/hvGHvzBesc+4agcKbDPa5Dp69HD2IfzjIm8oxp0ffv/PSSeC9Kf
         e+N6W2RDtBhx8oL7eIQki85PZrgye1dHnxd38ThF2bhGM3o0ZjKJO6IH9aTpH66e43u0
         yDTuyvWioWH4hV0HS61rdzkmRPjH38ekyCrp61CYWn0yyv2hg4rNn8J/EwwYLqXOOAO8
         hYVA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2018-07-02 header.b=EERSTOpW;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates 141.146.126.78 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from aserp2120.oracle.com (aserp2120.oracle.com. [141.146.126.78])
        by gmr-mx.google.com with ESMTPS id j10si180302pll.2.2019.06.25.05.00.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 05:00:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhenzhong.duan@oracle.com designates 141.146.126.78 as permitted sender) client-ip=141.146.126.78;
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
	by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBwcBb132878;
	Tue, 25 Jun 2019 11:59:58 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by aserp2120.oracle.com with ESMTP id 2t9c9pkv5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 11:59:58 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5PBwiOM130304;
	Tue, 25 Jun 2019 11:59:58 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
	by aserp3020.oracle.com with ESMTP id 2t9p6u5143-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 11:59:58 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
	by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5PBxsgP012043;
	Tue, 25 Jun 2019 11:59:54 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Tue, 25 Jun 2019 04:59:54 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de, hpa@zytor.com,
        boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
        peterz@infradead.org, srinivas.eeda@oracle.com,
        Zhenzhong Duan <zhenzhong.duan@oracle.com>,
        Jan Kiszka <jan.kiszka@siemens.com>, Ingo Molnar <mingo@redhat.com>,
        jailhouse-dev@googlegroups.com
Subject: [PATCH v2 2/7] x86/jailhouse: Mark jailhouse_x2apic_available as __init
Date: Mon, 24 Jun 2019 20:02:54 +0800
Message-Id: <1561377779-28036-3-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1561377779-28036-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906250097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9298 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906250097
X-Original-Sender: zhenzhong.duan@oracle.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oracle.com header.s=corp-2018-07-02 header.b=EERSTOpW;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates
 141.146.126.78 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1561377779-28036-3-git-send-email-zhenzhong.duan%40oracle.com.
For more options, visit https://groups.google.com/d/optout.
