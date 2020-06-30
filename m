Return-Path: <jailhouse-dev+bncBC4IPGFA6UFRBQ4P5X3QKGQETFD2QWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x437.google.com (mail-pf1-x437.google.com [IPv6:2607:f8b0:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id D332B20F6D5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 16:10:12 +0200 (CEST)
Received: by mail-pf1-x437.google.com with SMTP id n65sf14182657pfn.18
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Jun 2020 07:10:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593526211; cv=pass;
        d=google.com; s=arc-20160816;
        b=rExuF0cAPeHtRXhBAxvVGfkwBAOcrQiSTzIhp2UXkTbxai7sOQNb/0nx4vSL1ggMPn
         ZAdCNSgFYTRSEAK55lrH4lmRIwwHQbjX33G86+IjJARZNo6fXQfQ0N5gtBjCwEq0o8dQ
         mxLCkGr7hj5TftZoDisfN2HCWJdNImv67EwUIOID7NBhje4ovYy9DF5hRbu3m1VEr7Gq
         O0yCQYxtyVB1cxdWD2s2a/IjQlKS+43drEPhjVXWPSsv5YoVl0VfRgde4s3FdEJCQREP
         FZZmjxhckWstxt9S4cRMV6kb/242CWhL4b5OWKM+DltTJAF5/x3b2NFnY2isChXkvObl
         Sw9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:message-id:date
         :content-transfer-encoding:mime-version:subject:to:from:sender
         :dkim-signature;
        bh=5xog6kHFLdka003shXNaNU9weflayFPH71R4XoHbfuM=;
        b=QLS7m9dxFm472UlIXSVXpZq82OrIH/9CdNFugQIXMEhLqWgPlnb1E0A04RYW3MNSB6
         MYqICRedQeQM9CLsRo0QiS52rX+wKybxpl5CQV2kc/KgmN0EmkSOtybv4nBUfpjZHBKx
         3z9OQpyc10eqdsQJYZGCpRFOnS5CuNveQbVdk0eXb8dE9+GGLESICXKttGFuzE1ruuTD
         XcYta4COb731/DSG54wRqQ6eIY1hPBTv6hpwICKSQ02TaJggpOxuMW7Hj7JbCjVJg7OD
         Ijp5McAFneMkvPOKRXcXwuRY5ll4NX4HHwGKu1jVb58ke9ztL/Etsz+Tv44PhzJzyaWR
         Rf1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=s3Di3SQi;
       spf=pass (google.com: domain of 497738387@qq.com designates 203.205.250.101 as permitted sender) smtp.mailfrom=497738387@qq.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=qq.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:mime-version:content-transfer-encoding:date
         :message-id:feedback-id:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5xog6kHFLdka003shXNaNU9weflayFPH71R4XoHbfuM=;
        b=b/QuxaOcXFEFTJ85m0h0Mym0XMU/KYyc0KyVbCLml1ImHfLbi/K6nkhfFqukCAH7k9
         i3PfScR4bB3EWCk5Wp/hNJOeru6Wm9hfG/UF8HkJRCkSCGXPruV7SAwPifcF0063HMLU
         mKqyEtR54klqtppWhrLvlXeaFX37COWypcbrgz96EWsa1MuDSDS1BHdDCP0cMBIXUXRt
         cYdYgtDbPpXtOduq02W8geZAEHSgojACHLxNVLuvd4RgFJbtabeWoz9tdKkEmSlM2bZF
         DNBPjA/Guf1KszWPPRGOvclAssWwzJJEnT7Srm5vmcce0+pHMCVGCoIOQzI6FqXDaBUD
         fLPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:mime-version
         :content-transfer-encoding:date:message-id:feedback-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5xog6kHFLdka003shXNaNU9weflayFPH71R4XoHbfuM=;
        b=JtVdWh3AdJKwPa84cISmTNajP7XM5aB7e0Nmu2S11HvvyS8IsG6BBY1yswrj2wBrv4
         ZIJETGUtIsodRmK9uY72fhHMkv3rvYTdcB/7vp8ENL3dY+nIjDZYOEr66f7kS3CB2oIN
         ZblDAtJYHVGiqh5mpEl5bg2XSGl+pymXpWX2GNL9R95h7niEAvJksH1cpuTr3THlkrXY
         pGKMR8FjgHTIN+mLCXW2Jcv6Gu4DTHPR+7L9Xp2zMpYmkqXaQJFMYBYZU6Sv0ITJxNFJ
         /agdlgYDxgUgO5nbieTiCc0x3N1WDB3vGQWoBo3+4HKzUFFMP5eZEKd2E3LKx84psQQW
         xZvA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531ayDdqTK1IgZGNHD/K6idSXfMxk6FpoPksyWFYIZp2BNe8bY8K
	IboM4lrudckrItRf3KmEYDw=
X-Google-Smtp-Source: ABdhPJw//rvElZsCrRyX+zyZxDB2xNYFpazuvAYG6lZbIohZqcL2BIYYYXkffy92hUApX5EeSvpuVg==
X-Received: by 2002:a17:90b:1249:: with SMTP id gx9mr22538152pjb.149.1593526211486;
        Tue, 30 Jun 2020 07:10:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:718c:: with SMTP id i12ls1354958pjk.1.canary-gmail;
 Tue, 30 Jun 2020 07:10:10 -0700 (PDT)
X-Received: by 2002:a17:902:b716:: with SMTP id d22mr17775028pls.33.1593526210835;
        Tue, 30 Jun 2020 07:10:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593526210; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUPYn4/Hh2jt3KJORHbN6WwF45dEfk8OiGhSZpXEIKBJMWaLFjTZAmy/+KBLkVwV6+
         Uun9p+6NRGTOcdqI/4xaoafr/vyV17s9OopyQF0gU/pZt2izOLhJcO0upgDHKJX3eNvm
         Ktsxb/h/sMHQ08TpZkihJcKBud2YDe03xbMRujJ3kopLfQ1FgSYMI+rzmL4x51YmJ9cF
         Poix7TCMJuPLFGDLE4fZElKLBTWFVthKHkpifDL+BkY4Ec0xIcnOhdESezv2a9JhYb78
         JfpyoaCETt6bdSrIS11VK/dPBQ2V62X61m7hdppmnjfu9THmUEEmUY/V3H2Tx5PbojSC
         81fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:message-id:date:content-transfer-encoding:mime-version
         :subject:to:from:dkim-signature;
        bh=t3zb3h9ROWts+qMf2ckMI0vhdRspCwIlyHuB4ps1yQ4=;
        b=vcXq9ZeaWLPPqnxiQZJTl20RqrUYTuhSm9AiumBcQ5fCDshSTMviWLqlqfWq+bFZCP
         QoJL3xliil8ivGVj8ZFhn6sEtZTgCYOXf4mZsi1/48ROgS5GgUvbRgK7XP+89xZc130l
         xtYeWalhJhJASVT7TAZ2exVSAO8wmitPqhrvwikTvlM8XKZWSR/rvYywj8BopysYvlKH
         b1wb+sbthjwPRpcsR7bKqD/7hX1WEFvRcjP9On7ghV147pgw5QwzFeL7LwZ77bJUWJ1g
         ZKTERvwLMRUwKSaOqxnPXpbRB3gjHfpR1CJzuifpkBfCvF00ZDGxEDRpSyah4ZLABL/q
         dI5Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@qq.com header.s=s201512 header.b=s3Di3SQi;
       spf=pass (google.com: domain of 497738387@qq.com designates 203.205.250.101 as permitted sender) smtp.mailfrom=497738387@qq.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=qq.com
Received: from smtpbg501.qq.com (smtpbg501.qq.com. [203.205.250.101])
        by gmr-mx.google.com with ESMTPS id m8si164813pjc.0.2020.06.30.07.10.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Jun 2020 07:10:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of 497738387@qq.com designates 203.205.250.101 as permitted sender) client-ip=203.205.250.101;
X-QQ-FEAT: UqeVckw21VZNitt5U5QTKW7lOGZKCJtkf0v+RnmurO6RrENPmYlJxiaEWK2eW
	FcG28gdRmvdAlsRmBXYvwAofJZ5j/2hA1RjHEPK5G7XOKXsrlRILIdXXPZk3oiD7G7daRST
	ey7M7SGaxb4FalIP2A6CPKjsExUSNyg2OTX8z9QZwLULbAcqNlKIfbVfg9IVLH4s8WpG3GW
	WZ74QIaibfJAbYSB52LeoS0qPs0U53oAwda/qRzPe8TLcHvjP8YfTn1y4AbETSp5lHcN3sM
	y8wa40coKy8KlK
X-QQ-SSF: 00010000000000F000000000000000T
X-QQ-XMAILINFO: M2IIhI3dTH6OOeIR90M506Sy8W1P295Kl/41tpSStKnA3ZWS4MJGEAAuMlyBhH
	 +9clsR7/vI01dWXv1czYBFuE3UR0+8cNZhwOHnKrtRZKipBw/N1qqAK4mVoCMKYwNOTXVSP/DjTSm
	 aDT7XCEczE7Gb1q/x3OdS4Wxk+2a1WS5r4Sw8yq0/U1Lyb3nc5x0/4SXvcUg6R3+zzUJviLjZHP/a
	 uTj0cX/aFyauYIMj6VHofF7Bn6FqzdBqlCqjXOxLrWEX5BNptZJgJ++jS/g9GerGxtpygQwgEDhd1
	 OUxyauOOi9IbJiM40BBoh6MYOA7Zw2gxyRtFzoRVkghq+mwpTR1Do8foF3j3TZ+5OZtZ9UKoxqGc0
	 Rz60JT/O/7q0/qYqRrWL3Dcz5ngdFfl+V0y8SoTMRBq/O61htU9K1E3UqVct+Atyq2S6UKllHQ4l8
	 aVzT/bjCJg33wTs4Ah/9FFILgdXmiqvF8ARMVt9Dlnivqllwo5/U5aCpb2QreakiioDsn8zQ1jHvf
	 X8wuBzIvhWfRtlH+1ThzOXgRypzTrmHq/gjPXRXXvgLh3EJK7cDw7vnS6GYZ5H37NXrEqHq30Wnrk
	 qBgDAXf+PvEVowcQvhnW34e/A440b2709t3wSAh9frZmEWNwd4X8lJRplwlWrrre/Y2shMiZKQLih
	 RFj2EX
X-HAS-ATTACH: no
X-QQ-BUSINESS-ORIGIN: 2
X-Originating-IP: 178.128.201.135
X-QQ-STYLE: 
X-QQ-mid: webmail721t1593526027t3674546
From: "=?ISO-8859-1?B?ZGQ=?=" <497738387@qq.com>
To: "=?ISO-8859-1?B?amFpbGhvdXNlLWRldg==?=" <jailhouse-dev@googlegroups.com>
Subject: question on the none-root linux cell
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_5EFB470B_11382DD0_01A4B8AC"
Content-Transfer-Encoding: 8Bit
Date: Tue, 30 Jun 2020 22:07:07 +0800
X-Priority: 3
Message-ID: <tencent_D38521D0EAF45A05AC09EC0451BFDF16EF06@qq.com>
X-QQ-MIME: TCMime 1.0 by Tencent
X-Mailer: QQMail 2.x
X-QQ-Mailer: QQMail 2.x
X-QQ-SENDSIZE: 520
Received: from qq.com (unknown [127.0.0.1])
	by smtp.qq.com (ESMTP) with SMTP
	id ; Tue, 30 Jun 2020 22:07:08 +0800 (CST)
Feedback-ID: webmail:qq.com:bgweb:bgweb2
X-Original-Sender: 497738387@qq.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@qq.com header.s=s201512 header.b=s3Di3SQi;       spf=pass
 (google.com: domain of 497738387@qq.com designates 203.205.250.101 as
 permitted sender) smtp.mailfrom=497738387@qq.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=qq.com
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

This is a multi-part message in MIME format.

------=_NextPart_5EFB470B_11382DD0_01A4B8AC
Content-Type: text/plain; charset="UTF-8"

Hi!
I have met some problem in the none-root linux cell.I want some advices.
I use the images from jailhouse-images repo on rpi4.
I want to run some scripts in the second linux cell.But i found that there is no space to store these scripts.
So i want to use NFS in the second cell to connect the root cell.
I build the rootfs myself and replace the rootfs supported by jailhouse-images repo.
But I can't boot it.
And then i unzip the rootfs.cpio supported by jailhouse-images repo.
And add some files ,after that i rezip the rootfs.But i can't boot it either.
Can you give me some advices to solve my problem.
Thank you very much.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/tencent_D38521D0EAF45A05AC09EC0451BFDF16EF06%40qq.com.

------=_NextPart_5EFB470B_11382DD0_01A4B8AC
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DGB18030">=
<div>Hi!</div><div>I have met some problem in the none-root linux cell.I wa=
nt some advices.</div><div>I use the images from jailhouse-images repo on r=
pi4.</div><div>I want to run some scripts in the second linux cell.But i fo=
und that there is no space to store these scripts.</div><div>So i want to u=
se NFS in the second cell to connect the root cell.</div><div>I build the r=
ootfs myself and replace the rootfs supported by jailhouse-images repo.</di=
v><div>But I can't boot it.</div><div>And then i unzip the rootfs.cpio supp=
orted by jailhouse-images repo.</div><div>And add some files ,after that i =
rezip the rootfs.But i can't boot it either.</div><div>Can you give me some=
 advices to solve my problem.</div><div>Thank you very much.<br></div><div>=
<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/tencent_D38521D0EAF45A05AC09EC0451BFDF16EF06%40qq.=
com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msg=
id/jailhouse-dev/tencent_D38521D0EAF45A05AC09EC0451BFDF16EF06%40qq.com</a>.=
<br />

------=_NextPart_5EFB470B_11382DD0_01A4B8AC--

