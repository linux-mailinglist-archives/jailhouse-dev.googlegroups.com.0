Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBBIGVYP5AKGQE3BEYXHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id CD74925C17F
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 15:07:49 +0200 (CEST)
Received: by mail-qv1-xf37.google.com with SMTP id t4sf382323qvr.21
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 06:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w45GsgO/ySfRvHCyfkGkdEMnmrtHCIvACLAMibj0oqg=;
        b=iwLyGSNLcGXAyNlS9sgGCgq59SRfye22KrW2ThLG+M+M/PkqFQEMJxs9tDYVNChyzB
         r8t5OzL/BCm7ySEj1jFun6vgys2QEHCeu10nTQv2qIyXJ1n2i5TrM1Wh7hwK+MPheicU
         0bxxIFhNruAt+nUVqeZ8xwfkk5vGgn6TrcRaA5f9j0kRgo9jCw4Nw2oFCYrfXrlN6cpD
         GGtr1mqLkjElS9GJKxAhGp0z9jES+krAwhwjlbJcuYl6UMxXa/GvayfLkExc1OyjFCZB
         7JKpdC9TxlaOTE5qcO/4L/cv7VOSm1O8vA5QfwUdrT3NU9bqWjd22fGKHIZrPYW1c5TP
         6BXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w45GsgO/ySfRvHCyfkGkdEMnmrtHCIvACLAMibj0oqg=;
        b=euYc4l2tA+NJNG9RE9SudkuYJh0hgCHAeavhymwrt8zxbWuq7PirZ3unOaH3Sec10o
         8qhnCQZkF0rGi8ikP2/3+PGXwH7RGmwbOGCc9FEKaMOLIXmCWJJ9LHMzlxO9bBIcI/5p
         09dI9vUIkYcboADUPQDONGLgQniGsiSsJHXguDTO3lJ0TzFlObkK4AjHjdKwQbHa+e+r
         BL3rjXtPSM4UE8kWw2nrf1GW7mvIUke2eyeNyE2RM1Q7fzmHYRNH9sbRZJ+QHqZ99hxT
         J137smBFoX6VNPtYh1aL1ZjQOQrcJKvuIjS8nEIgzYIZaNelziWrY5c4/ydSnhk2dAGD
         PJVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=w45GsgO/ySfRvHCyfkGkdEMnmrtHCIvACLAMibj0oqg=;
        b=K20/ug06HJyV+j9xX3zVrfH8T7jgXVD5SYBTq6sMqv7s2Mm6AOHd/1KcAmCvNHB3/R
         fLH29mQT3ZEzdM822XoZk+dqjKAAGMNACyNDNlue70MWUoZIiUpepUhOOWEFGji0idp8
         eSPf0N8f992/c4pd/rGiOxAC/RQqdOY1/8VqaaQ3GK2Rvh6Kbprqs8GP/gxRBGSnrw3d
         imwnnKpDAcLdUXmutKE1OA71S8roYEIpzH/cEpmZluOVDQCLFLGJDSJW72h6ZYwKld9s
         gzj2bnqnTF4aUIVnRpRIlTqFi0qn9L/b5OLoUh2ZgoFBO0m98tsChun7fjWtXth0koGq
         iOFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533rglbHQlOjmBNmIKXmVgp84Fbp8hgMxUY2syEHplQVwBmMN2MB
	d5Uf4sRNYNCiCrC4CYPtKh4=
X-Google-Smtp-Source: ABdhPJyZ5QdirFyz42Kr/AcktHqnlEZZmMvfKvTzp/l16kvHD6JDOWMtxjpv8QwauftucKDcFWKdMw==
X-Received: by 2002:a05:620a:559:: with SMTP id o25mr3012434qko.262.1599138464428;
        Thu, 03 Sep 2020 06:07:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:7d2:: with SMTP id bb18ls1336814qvb.6.gmail; Thu,
 03 Sep 2020 06:07:43 -0700 (PDT)
X-Received: by 2002:a0c:8144:: with SMTP id 62mr148337qvc.154.1599138463615;
        Thu, 03 Sep 2020 06:07:43 -0700 (PDT)
Date: Thu, 3 Sep 2020 06:07:42 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2533b2ec-3ff2-4c01-8899-d1ada8d578e9n@googlegroups.com>
In-Reply-To: <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
 <629cee36-86a7-4239-a997-baa2d165f08dn@googlegroups.com>
 <716a1db0-3392-40d6-a6ac-051ca2a52ce7n@googlegroups.com>
 <0153a372-c0c8-48d7-a595-aa502f81b09bn@googlegroups.com>
 <f7aa0d56-f1a8-ff95-c565-d1f7edc707a3@siemens.com>
 <7ce9ec5d-5e58-4b39-ac21-2f6a1d391ce4n@googlegroups.com>
 <6aaac5b2-1c88-699a-6568-0642e4a1a4a7@siemens.com>
Subject: Re: Build jailhouse on embedded target
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_646_56391510.1599138462655"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_646_56391510.1599138462655
Content-Type: multipart/alternative; 
	boundary="----=_Part_647_1853787823.1599138462655"

------=_Part_647_1853787823.1599138462655
Content-Type: text/plain; charset="UTF-8"

Hi Jan!

I've moved to another target with "Intel Core i7-8559U".
This CPU supports "VT-x" and "VT-d".

Doing a hardware check I get the following messages:

Feature                         Availability
------------------------------  ------------------
Number of CPUs > 1              ok
Long mode                       ok
Traceback (most recent call last):
  File "/usr/libexec/jailhouse/jailhouse-hardware-check", line 147, in 
<module>
    iommu, _ = sysfs_parser.parse_dmar(pci_devices, ioapics, dmar_regions)
  File "/usr/lib/python3.7/site-packages/pyjailhouse/sysfs_parser.py", line 
377, in parse_dmar
    raise RuntimeError('DMAR region size cannot be identified.\n'
RuntimeError: DMAR region size cannot be identified.
Target Linux must run with Intel IOMMU enabled.

I'm using Linux Kernel 5.4.61 with the patches and config options from 
"jailhouse.cfg".

The kernel command line contains "intel_iommu=off" (as specified under 
"Software requirements" at https://github.com/siemens/jailhouse).
I've also tried "intel_iommu=on" but without success.

What is the reason for this again?
It's very difficult (at least for me) to get jailhouse up and running.

Best regards
Jan.





-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2533b2ec-3ff2-4c01-8899-d1ada8d578e9n%40googlegroups.com.

------=_Part_647_1853787823.1599138462655
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Jan!</div><div><br></div><div>I've moved to another target with "In=
tel Core i7-8559U".</div><div>This CPU supports "VT-x" and "VT-d".</div><di=
v><br></div><div>Doing a hardware check I get the following messages:</div>=
<div><br></div><div><span style=3D"font-family: Courier New;">Feature&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Availabilit=
y<br>------------------------------&nbsp; ------------------<br>Number of C=
PUs &gt; 1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; ok<br>Long mode&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; ok<br>Traceback (most recent call last):<br>&nbsp; File "/usr/l=
ibexec/jailhouse/jailhouse-hardware-check", line 147, in &lt;module&gt;<br>=
&nbsp;&nbsp;&nbsp; iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, ioapic=
s, dmar_regions)<br>&nbsp; File "/usr/lib/python3.7/site-packages/pyjailhou=
se/sysfs_parser.py", line 377, in parse_dmar<br>&nbsp;&nbsp;&nbsp; raise Ru=
ntimeError('DMAR region size cannot be identified.\n'<br>RuntimeError: DMAR=
 region size cannot be identified.<br>Target Linux must run with Intel IOMM=
U enabled.</span></div><div><br></div><div>I'm using Linux Kernel 5.4.61 wi=
th the patches and config options from "jailhouse.cfg".<br></div><div><br><=
/div><div>The kernel command line contains "intel_iommu=3Doff" (as specifie=
d under "Software requirements" at https://github.com/siemens/jailhouse).</=
div><div>I've also tried "intel_iommu=3Don" but without success.<br></div><=
div><br></div><div>What is the reason for this again?</div><div>It's very d=
ifficult (at least for me) to get jailhouse up and running.</div><div><br><=
/div><div>Best regards</div><div>Jan.</div><div><br></div><div><br></div><d=
iv><br></div><div><br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2533b2ec-3ff2-4c01-8899-d1ada8d578e9n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2533b2ec-3ff2-4c01-8899-d1ada8d578e9n%40googlegroups.co=
m</a>.<br />

------=_Part_647_1853787823.1599138462655--

------=_Part_646_56391510.1599138462655--
