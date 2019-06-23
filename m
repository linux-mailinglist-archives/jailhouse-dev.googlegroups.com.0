Return-Path: <jailhouse-dev+bncBCPP7EVS2QDRB24RYPUAKGQEYD4NBEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa38.google.com (mail-vk1-xa38.google.com [IPv6:2607:f8b0:4864:20::a38])
	by mail.lfdr.de (Postfix) with ESMTPS id B57A750B38
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 14:58:20 +0200 (CEST)
Received: by mail-vk1-xa38.google.com with SMTP id r197sf6381721vkf.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 05:58:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561381099; cv=pass;
        d=google.com; s=arc-20160816;
        b=wfo0bp1SVX+1t9Rj2LVND+juKh/fpNQXF+gROguaAwz9Hp4YQe7O5wbF9yZj3Qd9ox
         R/oC2FK2ghDvKL6Xlm0C7wtoRYinw+0+2fjTBNds8DsLgnmCMJk0c8bTM7uBjwbZZvQY
         Sd68eKt/nNhf2rP7KaLFyc4CuF1MCVCIYPv9iSIXH3fyhXYCsTbuGYwLUfQKPrqzStNi
         aX9bMeQrE2Ap/CkVdZ+rdaTWLN3dNLi6vV6MYwgleBKppSN7Y5M5V4TgjzEYZPcVl85k
         XD2ZOHx9Ts+z+4HsZ+YqAACLB2gaxLKd2JMt/YilX5GNQv9j2e9CRHWq0X0TR//7jxpM
         CRXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:mime-version:sender:dkim-signature;
        bh=SKIEbUzRW5aJ01iNDLI8GjaN0+wyFOfM9T9u7r7cGyA=;
        b=x4JoLy2S4Hvvl2GqWpDCJKFLtGPOcy/bqLHOTPnYPwGnGZMOUT4+m7u9VCVH2lUaKT
         FEYGZCO0xxkvPwTzHv0jGIzPRJ0w9+g7ZTrOtBdzIxydeztWiZyTO52MJBDvyUdd7svq
         2ja946ZxN8eSV1MwsEjFpRwkRIpKqGYcp21/dBoS04dAtW37SDPy9vBvf0HJnd9U47GA
         D7ysIP+3fiDsjYr6JDV+P3MEy5xH3+jtRfKQEPXJiCZhjcbps3O4yxzLDMOtolPArFR4
         CmGGe+CvfdZBxvfMs5NqNE7j1DeCtLBtMYcEp6YWJuJYqdaPUaycMkkFd93mG+SA9CML
         FDHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2018-07-02 header.b=SSgDXxT3;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates 156.151.31.85 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SKIEbUzRW5aJ01iNDLI8GjaN0+wyFOfM9T9u7r7cGyA=;
        b=Rv9koucyrE5Kz9n5VT1EKPO7CuzHqAec67yZz5m3VoFPhtPyqLaC5tQ+G1lHoeSfIV
         i9lMMLK5+rUUQ5fokNnEei4p9RPKt8U8J74KzvSEGGjgWB8qWsNURzvDpv0QWQ0y6A6J
         R4DCutgTA6fghfHOVB2dSQlH0c+5OQdpHehgFwy9EPez45ZzALTJD/PPb5epTvgyVouT
         ZpYbl8QoPzea2Ym/50SuQ7Im6aq7KeI0AlIN1R9CZ10vCJwipR8Iu3VPCdTJCnM6yfgo
         npXqijRky1vvOvrKOrrgXovnpYk4xUIL1dov5JABwk3x+rhJ6JAE9aBRFtRCrmoFW6hs
         qOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:cc:subject:date
         :message-id:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SKIEbUzRW5aJ01iNDLI8GjaN0+wyFOfM9T9u7r7cGyA=;
        b=RSsBFV2Ew6yWChSj+tQfx6RiW00A+LESzJRfeGWeh52aXVrt3RpDVBqeHdSsNIKB8Q
         Zg1CZzScalZG4Z7DcpnwM+OZDngea1NkJFQkNRx/EkJ+ci/xztY8D/S62jzuHny4fU/T
         LI8r5lvgcDNG4FFGaCWQ8gHo4plgpW1QsD+ZO63jFGJtyjbRnuC/SIg4pyfRFohKsZqg
         zQOaSMB6RJUy+dgl5XWlo10i38KeVCbLfxOPpXeKBYtM6KFEs7m4VxSgVENn8hKYHWSw
         eOpQw53GQYSCjfvjPoR8Z4/2gFTuyjVtgviOpWhKei9dHMua6jd7SeNj1LnsR0mYT1Vw
         XqcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXJCV6nPch4pzJ8hiJOYcZf2hGs/w10LUbDU02OaYHWBPQU5BJh
	R8G5XxL+30O/1gDkNHR9NL0=
X-Google-Smtp-Source: APXvYqxKrQRpqLBoZnLkGHPyQuI3Wb/Qto9nq6tPVToOzVosnDSi4jNIA/oDIz2q9XoOiWOpGECAkA==
X-Received: by 2002:a67:8b44:: with SMTP id n65mr73558581vsd.99.1561381099838;
        Mon, 24 Jun 2019 05:58:19 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:eec4:: with SMTP id o4ls1649142vsp.11.gmail; Mon, 24 Jun
 2019 05:58:19 -0700 (PDT)
X-Received: by 2002:a67:300f:: with SMTP id w15mr52080571vsw.116.1561381099503;
        Mon, 24 Jun 2019 05:58:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561381099; cv=none;
        d=google.com; s=arc-20160816;
        b=dWXluiowT+8XfDurC85gfgp+j6i5H8SkC9ZmIMjOhcl/FEZzIV6SOWRhECA/5xcBDm
         3HtBKXNtOE8F6n1MMnCT+aQidTQjVfoypIAq5G6USu2rB6fvw81NCu/VmS/5H7CLKTOu
         0ELBlQBcTjYE4+BC4UF/6W3ozY8Zy7yUioItE5nwgKXE/RcYiDev70uktNXVb0t7PYA7
         ZKTmiS6a/hEVGOjUQHaoVq4wj44wMczVLEmV14qiC/TNbu7A0osspaGavUXA8DhulQtv
         qChLQfT9R2gb59Imw74YyoNLPzTHJuZnu/TLaUdp4tO1197xzO9hbbWTwMcZIDhMMxI5
         SPYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :dkim-signature;
        bh=f92SbQ+Mx6TAL/+1iq0174aEA4Hng/uMhDHJ2SdUmBo=;
        b=zR5RgzrROEN8tQtqtHN8zfJBB5bJcpfJrc/xzVGp/D3ScE9gB5NK0jBTmynFFf583e
         AvtXnL2NYWw7fOr6D//xtgdQx2Tr6q2ZvRgHQqA/OuzVKbpXn1dERjDGAmdtHTVFQk/r
         vhgctFCczAgvLZqY+YfO7SITQc3fRDVQa2z5gcgTLpb6IjE4BW2SBrK3i2FML3wXEg4Z
         aRAjV5fYQuaa3sMGa2IgXf7Bza6zm5LtZt0xJXgMxLPAqfbUVG4S9ObM/59cFy9b8IXi
         GXotCTYrxefZpWP9fO54kl+lVaRRDsi+vM6kzCfNxMnO2RhnBpmvlg7QNDFQrN3nPPVq
         HvyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oracle.com header.s=corp-2018-07-02 header.b=SSgDXxT3;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates 156.151.31.85 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oracle.com
Received: from userp2120.oracle.com (userp2120.oracle.com. [156.151.31.85])
        by gmr-mx.google.com with ESMTPS id 2si429191vsi.2.2019.06.24.05.58.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 05:58:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhenzhong.duan@oracle.com designates 156.151.31.85 as permitted sender) client-ip=156.151.31.85;
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
	by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCsCnO142931;
	Mon, 24 Jun 2019 12:58:15 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2120.oracle.com with ESMTP id 2t9cyq66px-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2019 12:58:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5OCwCn1108116;
	Mon, 24 Jun 2019 12:58:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserp3020.oracle.com with ESMTP id 2t9p6tjngv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2019 12:58:14 +0000
Received: from abhmp0016.oracle.com (abhmp0016.oracle.com [141.146.116.22])
	by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5OCwELL024845;
	Mon, 24 Jun 2019 12:58:14 GMT
Received: from z2.cn.oracle.com (/10.182.69.87)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Mon, 24 Jun 2019 05:58:14 -0700
From: Zhenzhong Duan <zhenzhong.duan@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: tglx@linutronix.de, mingo@kernel.org, bp@alien8.de, hpa@zytor.com,
        boris.ostrovsky@oracle.com, jgross@suse.com, sstabellini@kernel.org,
        Zhenzhong Duan <zhenzhong.duan@oracle.com>,
        Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Subject: [PATCH 2/6] x86/jailhouse: Mark jailhouse_x2apic_available as __init
Date: Sun, 23 Jun 2019 21:01:39 +0800
Message-Id: <1561294903-6166-2-git-send-email-zhenzhong.duan@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1561294903-6166-1-git-send-email-zhenzhong.duan@oracle.com>
References: <1561294903-6166-1-git-send-email-zhenzhong.duan@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=1 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=894
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906240106
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9297 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=939 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906240105
X-Original-Sender: zhenzhong.duan@oracle.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oracle.com header.s=corp-2018-07-02 header.b=SSgDXxT3;
       spf=pass (google.com: domain of zhenzhong.duan@oracle.com designates
 156.151.31.85 as permitted sender) smtp.mailfrom=zhenzhong.duan@oracle.com;
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1561294903-6166-2-git-send-email-zhenzhong.duan%40oracle.com.
For more options, visit https://groups.google.com/d/optout.
