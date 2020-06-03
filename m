Return-Path: <jailhouse-dev+bncBAABBI554D3AKGQENXKCYEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE1B1ED85D
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Jun 2020 00:05:24 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id z10sf419442ljj.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 15:05:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591221923; cv=pass;
        d=google.com; s=arc-20160816;
        b=XAh4mpaufLOvhmPqiue3RsH8SwLARr5gIU3vcX1DMRxUWsdkJ+wOMbLDDuolvgH9yM
         xhe3XmfRNnSfoMwJFbUaNQLJja2WHXurAyChgVuxkh3cVGGtNmQYfZKUxRyqsj6stk1x
         vsPi8vqCgdkdxw5bUBCWhl1MSpdu6Q5Cx+iPFf0T7u2Meoq8ImTDA1+u1EZvE4UV5wj9
         n82f+vx0Qop0dXbd7s+gdjA39zq3nEIwJnV+YoQaKotXV5EmKPtKPqvY0s1lDIrZKN3+
         HQASh/spkBHupd77CsuBXdNkQ1HduvFx0aujEIdjmQp7dCjvgbBgHn1SctqS1CE/EbKF
         IK+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=mpRXvwV79LwgRFcZHUtCoiPk+d5C3IllKkHilIgC0tA=;
        b=j9yFSfS0ZgqsLIPiKXSs8YFsF5lZOq6mQHrUuVXH9voZH9D+7J157v/yRVTvsPOWJ1
         Vq2NNOJPPp6L4iJSwmXCE0DqGQ/zNNhCXXUrs2E6st4OA5THQIHLaX0h7+px3TS9hewp
         LMoB3vwBDrOl4y1bnDxwiCPAsDRP+egsz4aPnBDpn+HP8/i1GT6AiAqCXvnY3bq5Hpqv
         REnchY1xzPxq6Zxbo/psdGf6lN+f8zlelyI2v5m96Uf1gelusVcDML0YO5w2qXV7dThi
         gm9E3Thus3431OISovzvYFNK0Frmg+I1wZcMpF9eQKY2PUpJhL+CKZWVxuPKuCshFizA
         3tqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=kpglDR6v;
       spf=pass (google.com: domain of jorgeluis.martinez-garcia@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=jorgeluis.martinez-garcia@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=mpRXvwV79LwgRFcZHUtCoiPk+d5C3IllKkHilIgC0tA=;
        b=Aypb7BHUzlFCxCgI82j6IIH27W59Wn96sC7uOOWfeyaWac1yIyCTRu84EU+OEDU5d4
         AKDKG7Ue/113n2dPTbHTnjWtcz2vaXPbrHeLzspB9YTHaYh6X92O27ONvXPoLb86Ao/1
         alE50r1VXtOM5sMHzDSKSvoMgbwxgVYk5Mg2XglgBlLEbHYf65soYUVQE4nJvgiGMD91
         s+33sTC8N9mlkC0a25ZHOjnNDiO8vm6vtYuTv50CIYc8SeGbynEptItRoUEnQd65113/
         iG7ewaSFWz/8oAmqqYOwPaWzH+sPyStOampnaZmsD9YmL/QC6Gjp+qL2xi8wLn3QktXt
         2/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=mpRXvwV79LwgRFcZHUtCoiPk+d5C3IllKkHilIgC0tA=;
        b=tUuVS+/kUPPqNxvQxou1+OtIDs/RFRjJyMRus1aBTHIcJd4ekSEbGnKhWYlAYiap7u
         jLwRGJNLrwusJ4FC7d3Gwyj2daNcvfISZcW1dOpCKAaFqI9E3ZKMuNA19vXBB5LFFfmB
         XxUlX6N5OjnL/UCejE7b0u1aLBXHbNbk00d5VBQhRzceMFjQ9h8tbjh09XVsGvYFpnqx
         H8JAAPiUVZBJyQ9WfhEjReP0VzFsfUqwWPWKI0cHyZa/YpwFXzjRMmrRBh32ze2otOGc
         J1qvv0RkWNPpjX6G0CrpltxvSyJ1Im+70v4DPAbnJTcT1MSsoAJZeGwMw1aKBdaCWGuR
         kPCA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533A+ahOhoOYo/ruk1oz+icfs+73trosO4/8FA2Gc8H+4aEbFu67
	Jgc1aE/ruZK/vvRlCoxH7lY=
X-Google-Smtp-Source: ABdhPJzt+3wY9EPJPAddWSNOhwbeuigTqqvhX85JU3REg58DEUdv5OR9i6kBxd/HGDU436BwU2FG4Q==
X-Received: by 2002:a2e:9246:: with SMTP id v6mr633352ljg.47.1591221923743;
        Wed, 03 Jun 2020 15:05:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8092:: with SMTP id i18ls750461ljg.7.gmail; Wed, 03 Jun
 2020 15:05:22 -0700 (PDT)
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr694589ljj.220.1591221922894;
        Wed, 03 Jun 2020 15:05:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591221922; cv=none;
        d=google.com; s=arc-20160816;
        b=aMTMGTuI5kbwgubxazHT1/paBCpMwdC7B2uMipFcYUPbeMNwUHDuadrXytpRP66hnl
         FiEDLnw8+UfDkwP7lFYeHwXApZb0Bohv00r/gLtiKiBNin+5LX1P4DQBtjowWOWh8a9F
         PxltnjruQJENi3aPPNKpfYDs3ewFodSLLHPqrHy6Hv5sighfyHZhHHEPTpvc+QqpREGJ
         NIgtSj7YoE7kpX8VTE3pzbupQcHn6DJdIh06/3j2i5Pr3NtBkLKVsRnvh4eUIgkg0RRk
         rpVWPPBQ4Sa5vXn8UC+uhx0JZ1JK44LtvQV4V3nuR7S8KC81ZySG6z200JtIH3t+nxG+
         If/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=SMlICLhtFl08DLdaIqD1hhnT95YHHX5a61QHpr2kO8Q=;
        b=WVyt+faVlobxkPhd3vzA3sYb/uNqeg/mlXvPNia71OMPDLH0q/YI4HtoUDAcojim6U
         uSXKxbmPriyIPMVzJSSFvRvrHDmxo4j023LcYJFKXoZqvMmWz/YZeabb3xs6nZ3ihq6P
         UzoW7BjEMOZMa3VXAfWf5DYtm4RJoG+H2AZt8kwwW1hio+iV6DlQMqu55oF6ybZntOP5
         8NLtvK+aJfFUpFJRFhi7VjZtkFMAqOGEhP89omyvWJRrPBrNW8eNHRX2g+FFhhW8rua3
         MGNL/1xb9Nl/Cv59IzVjrxRZyiEO6PrnyXMu94RrNJRdRSR+5qL0E9aEPzS5MfY8+ZsI
         do5A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=kpglDR6v;
       spf=pass (google.com: domain of jorgeluis.martinez-garcia@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=jorgeluis.martinez-garcia@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id 14si178350lfy.1.2020.06.03.15.05.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 15:05:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jorgeluis.martinez-garcia@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 49cjdZ1bQLzyTZ
	for <jailhouse-dev@googlegroups.com>; Thu,  4 Jun 2020 00:05:22 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -0.573
X-Spam-Level: 
X-Spam-Status: No, score=-0.573 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001, HTML_MESSAGE=0.001,
	LRZ_DATE_TZ_0000=0.001, LRZ_DKIM_DESTROY_MTA=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_OVERWRITE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_AP_PHRASE=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_FWD_MS_EX=0.001, LRZ_HAS_BND=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_SPF=0.001, LRZ_HAS_THREAD_INDEX=0.001,
	LRZ_HAS_URL_HTTP=0.001, LRZ_HAS_X_ORIG_IP=0.001, LRZ_MSGID_HL32=0.001,
	LRZ_RCVD_BADWLRZ_EXCH=0.001, LRZ_RCVD_MS_EX=0.001, LRZ_RDNS_NONE=1.5,
	RDNS_NONE=0.793, SPF_HELO_NONE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id rI6lhTo9ZYbf for <jailhouse-dev@googlegroups.com>;
	Thu,  4 Jun 2020 00:05:21 +0200 (CEST)
Received: from BADWLRZ-SWMBX11.ads.mwn.de (BADWLRZ-SWMBX11.ads.mwn.de [IPv6:2001:4ca0:0:108::167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(Client CN "BADWLRZ-SWMBX11", Issuer "BADWLRZ-SWMBX11" (not verified))
	by postout2.mail.lrz.de (Postfix) with ESMTPS id 49cjdY6KpxzySr
	for <jailhouse-dev@googlegroups.com>; Thu,  4 Jun 2020 00:05:21 +0200 (CEST)
Received: from BADWLRZ-SWMBX09.ads.mwn.de (2001:4ca0:0:108::165) by
 BADWLRZ-SWMBX11.ads.mwn.de (2001:4ca0:0:108::167) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1979.3; Thu, 4 Jun 2020 00:05:21 +0200
Received: from BADWLRZ-SWMBX09.ads.mwn.de ([fe80::28c9:20b8:a4d6:473c]) by
 BADWLRZ-SWMBX09.ads.mwn.de ([fe80::28c9:20b8:a4d6:473c%12]) with mapi id
 15.01.1979.003; Thu, 4 Jun 2020 00:05:21 +0200
From: "Martinez Garcia, Jorge Luis" <jorgeluis.martinez-garcia@tum.de>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: ZCU102 ZynqMP Ultrascale+
Thread-Topic: ZCU102 ZynqMP Ultrascale+
Thread-Index: AQHWOe4lDM/8lxlZKk6JVZpTK9Y7rQ==
Date: Wed, 3 Jun 2020 22:05:21 +0000
Message-ID: <5dca1eee81cd46218983e92131d9a31a@tum.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 04
X-MS-Exchange-Organization-AuthSource: BADWLRZ-SWMBX09.ads.mwn.de
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2.206.56.136]
Content-Type: multipart/alternative;
	boundary="_000_5dca1eee81cd46218983e92131d9a31atumde_"
MIME-Version: 1.0
X-Original-Sender: jorgeluis.martinez-garcia@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=kpglDR6v;       spf=pass
 (google.com: domain of jorgeluis.martinez-garcia@tum.de designates
 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=jorgeluis.martinez-garcia@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

--_000_5dca1eee81cd46218983e92131d9a31atumde_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear all,

I am trying to have three Linux instances on the ZCU102 ZynqMP Ultrascale+ =
(The root cell and two guests). I followed the steps specified in https://g=
ithub.com/siemens/jailhouse/blob/master/Documentation/setup-on-zynqmp-zcu10=
2.md and have two Linux instances successfully running on the board. Howeve=
r, when adding a third Linux guest, I do not see the kernel booting in the =
Jailhouse console:


root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell linux zynqmp-zcu102=
-linux-demo-2.cell Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio -c "c=
onsole=3Djailhouse,115200"

root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse console -f

Adding virtual PCI device 00:02.0 to cell "ZynqMP-linux-demo-2"
Shared memory connection established: "ZynqMP-linux-demo-2" <--> "ZynqMP-li=
nux-demo"
Created cell "ZynqMP-linux-demo-2"
Page pool usage after cell creation: mem 77/995, remap 69/131072
Cell "ZynqMP-linux-demo-2" can be loaded
Started cell "ZynqMP-linux-demo-2"


root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell list
ID      Name                    State             Assigned CPUs           F=
ailed CPUs
0       ZynqMP-ZCU102           running           0
1       ZynqMP-linux-demo       running           2-3
2       ZynqMP-linux-demo-2     running           1


The config file of ZynqMP-linux-demo-2 is https://github.com/siemens/jailho=
use/blob/master/configs/arm64/zynqmp-zcu102-linux-demo-2.c (as you can see =
the flag JAILHOUSE_CELL_DEBUG_CONSOLE is present)

and its corresponding dts file is https://github.com/siemens/jailhouse/blob=
/master/configs/arm64/dts/inmate-zynqmp-zcu102-2.dts


While the three instances are supposed to be running, as shown by jailhouse=
 cell list, I do not see the third Linux booting. Has any of you faced a si=
milar issue?


Jorge

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5dca1eee81cd46218983e92131d9a31a%40tum.de.

--_000_5dca1eee81cd46218983e92131d9a31atumde_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Dear all, <br>
</p>
<p>I am trying to have three Linux instances on the <span>ZCU102 ZynqMP Ult=
rascale&#43;</span> (The root cell and two guests). I followed the steps sp=
ecified in
<a href=3D"https://github.com/siemens/jailhouse/blob/master/Documentation/s=
etup-on-zynqmp-zcu102.md" class=3D"OWAAutoLink" id=3D"LPlnk535314" previewr=
emoved=3D"true">
https://github.com/siemens/jailhouse/blob/master/Documentation/setup-on-zyn=
qmp-zcu102.md</a> and have two Linux instances successfully running on the =
board. However, when adding a third Linux guest, I do not see the kernel bo=
oting in the Jailhouse console:</p>
<p><br>
</p>
<p></p>
<div>root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell linux zynqmp-z=
cu102-linux-demo-2.cell Image -d inmate-zynqmp-zcu102-2.dtb -i rootfs.cpio =
-c &quot;console=3Djailhouse,115200&quot;</div>
<div><br>
</div>
<div>root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse console -f<br>
</div>
<p></p>
<p></p>
<div>Adding virtual PCI device 00:02.0 to cell &quot;ZynqMP-linux-demo-2&qu=
ot;<br>
Shared memory connection established: &quot;ZynqMP-linux-demo-2&quot; &lt;-=
-&gt; &quot;ZynqMP-linux-demo&quot;<br>
Created cell &quot;ZynqMP-linux-demo-2&quot;<br>
Page pool usage after cell creation: mem 77/995, remap 69/131072<br>
Cell &quot;ZynqMP-linux-demo-2&quot; can be loaded<br>
Started cell &quot;ZynqMP-linux-demo-2&quot;<br>
</div>
<div><br>
</div>
<div><br>
<div>root@xilinx-zcu102-2018_3:~/LinuxGuest2# jailhouse cell list<br>
ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; State&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; Assigned CPUs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; Failed CPUs&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; &nbsp;<br>
0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZynqMP-ZCU102&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; running&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; &nbsp;<br>
1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZynqMP-linux-demo&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; running&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; 2-3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<br>
2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ZynqMP-linux-demo-2&nbsp;&nbsp;&nbsp;=
&nbsp; running&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
1 <br>
</div>
<br>
</div>
<p>The config file of&nbsp;<span>ZynqMP-linux-demo-2</span> is&nbsp;<span><=
a href=3D"https://github.com/siemens/jailhouse/blob/master/configs/arm64/zy=
nqmp-zcu102-linux-demo-2.c" class=3D"OWAAutoLink" id=3D"LPlnk174015" previe=
wremoved=3D"true">https://github.com/siemens/jailhouse/blob/master/configs/=
arm64/zynqmp-zcu102-linux-demo-2.c</a>
 (as you can see the flag JAILHOUSE_CELL_DEBUG_CONSOLE is present)<br>
</span></p>
<p></p>
<p><span>and its corresponding dts file is <a href=3D"https://github.com/si=
emens/jailhouse/blob/master/configs/arm64/dts/inmate-zynqmp-zcu102-2.dts" c=
lass=3D"OWAAutoLink" id=3D"LPlnk43075" previewremoved=3D"true">
https://github.com/siemens/jailhouse/blob/master/configs/arm64/dts/inmate-z=
ynqmp-zcu102-2.dts</a></span><br>
</p>
<p><br>
</p>
<p>While the three instances are supposed to be running, as shown by <span>=
jailhouse cell list</span>, I do not see the third Linux booting. Has any o=
f you faced a similar issue?
<br>
</p>
<p><br>
</p>
<p>Jorge</p>
<p><br>
</p>
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/5dca1eee81cd46218983e92131d9a31a%40tum.de?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/5dca1eee81cd46218983e92131d9a31a%40tum.de</a>.<br />

--_000_5dca1eee81cd46218983e92131d9a31atumde_--
