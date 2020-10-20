Return-Path: <jailhouse-dev+bncBC65DHEH7QOBBVPIXL6AKGQESCA66PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CE329389C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 11:56:38 +0200 (CEST)
Received: by mail-qv1-xf3f.google.com with SMTP id s9sf883241qvd.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Oct 2020 02:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=XFlFZWITXbLP45LLRiDVa0AGxTUvvdProjUxTEBYyIg=;
        b=eKFOwKtz617fDTN4uz35hIri+R+G5xidZSyjz5V4QYnmws8Wa2/GG+tKJLISZ+x/3K
         BdBvXFIw2zk/xdY9nhsR5pkHQxncsqaGvnH3i3SsX8r13TE1stVWIMetVmZJHkHp6XQa
         ZQ7HYvOQom5d1zSzuSGbdQBq+MaOw1Edx2JB+k20rsWhIWRHfHh5Jx3x5yMEPqrX1AxU
         w+50un6FGqu02j86+WfKP243KekYUwBIoQ1O4r6Wn31sFkAIO3z5ClhNholJLoOOubl8
         zsXuKZ+bYByeN8vSWDiw35cgEZW1qRw2mxH7wByrZLokYDdf62MeuyNwda5/ZCmjc6d6
         yZig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=unikie-com.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XFlFZWITXbLP45LLRiDVa0AGxTUvvdProjUxTEBYyIg=;
        b=cIbkTLDYhc9uUnO5lwZuqLRyls91nmxud0LeCvF+Kod+3gGNFsM/HBT5mECsaqFm/R
         UqZ84MgF0OIgzHyppik1gK2fAmH8JlcX76EZwZaUcxOyUzgxLcTQm3OOHd6m7z8cDCJA
         iYv3xRUuP5lCnTBg70XPmB4hsll1T1qg8IGYJaDmfreIYrT3H/BjP5x5rY99qC/RhIIn
         yA02ff9FRtsKa187OR8fSPT8p7CxlGsdWCrWMw1Z+o8WLwp2/WID7QB+D9J6DpP8eLLW
         ZmF/Xh40n5coK4N7S4eSOn9ayCSq5Kf1l552h+p2387xI4lUDxWVkX2emR1dWaKcJq+F
         Qokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XFlFZWITXbLP45LLRiDVa0AGxTUvvdProjUxTEBYyIg=;
        b=SSiZxWTp3mYRKNuLFbjcf70ZWjF+2rEMIi2GWPIHJykF5N2xcMjdO+3V5aC72nFkDA
         y3lbbb8upK+QHv1IutpqB/VI6YtN+zTpnsP+ToxhuwflCumYVwRhO3lzQbNk4wEdKqju
         ydauU13Z6cRcHyHI7/yiOS8xelHLfVNtZqCvvw+4S1gs5/A7WzmYzZ6uIicRUTaMtkrX
         noVKExOtbdBs8d3m82WNUNARthq22JzaQT23SjwLlVb7Fl9yrKGpb0PkpeXORp4kvjfG
         S/a3xdfE45yhW/mybPf2bw9Kta2l3cCxgyCifKqhxhU3X5Xj97CtyEoAXP1ZxC30bE6r
         z00A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530B9U0XvN8hlektNv1iLruNiIk401t3gIHg7YFkrWH3OPYb6giz
	+tN0skbQVCMr9ewJil9ELgY=
X-Google-Smtp-Source: ABdhPJzjqRX4I+ybYuRS+LppJ+imi/0uZJ3czQyx/sEjKYAl7mw06y5vccUXiPY8tCCULCs3nf93iA==
X-Received: by 2002:a05:6214:a94:: with SMTP id ev20mr2459555qvb.4.1603187797453;
        Tue, 20 Oct 2020 02:56:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6214:249:: with SMTP id k9ls394199qvt.6.gmail; Tue, 20
 Oct 2020 02:56:36 -0700 (PDT)
X-Received: by 2002:ad4:4e73:: with SMTP id ec19mr2431276qvb.58.1603187796713;
        Tue, 20 Oct 2020 02:56:36 -0700 (PDT)
Date: Tue, 20 Oct 2020 02:56:36 -0700 (PDT)
From: Jari Ronkainen <jari.ronkainen@unikie.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cd0ba433-1be8-4c99-841e-d637d2e5fb54n@googlegroups.com>
Subject: Jailhouse in qemu and ubuntu
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_156_150907006.1603187796162"
X-Original-Sender: jari.ronkainen@unikie.com
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

------=_Part_156_150907006.1603187796162
Content-Type: multipart/alternative; 
	boundary="----=_Part_157_212725250.1603187796162"

------=_Part_157_212725250.1603187796162
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm interested in running ROS2 in a Linux cell, first through
QEMU and later on Up Xtreme board.  Apologies for stupid
questions,  and please refer me to a more appropriate forum
if this is the wrong place for them.

First I have built a fresh virtual machine and installed Ubuntu
20.04 LTS, then installed linux headers, build tools and python
through apt.

The compilation and installing seems to work fine, but when I
get to the point where I should do

# jailhouse enable jailhouse/configs/qemu-x86.cell

I get an error message

JAILHOUSE_ENABLE: Invalid argument

I do not know how to get past this, any help?


Other things is it seems like the documentation is not entirely
up to date, and I noticed things like experimental virtio support
and IPC reworkings in 0.12 release notes, is there any more info
about those in the wild or should I just dig through git commits?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cd0ba433-1be8-4c99-841e-d637d2e5fb54n%40googlegroups.com.

------=_Part_157_212725250.1603187796162
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,<div><br></div><div>I'm interested in running ROS2 in a Linux cell, firs=
t through</div><div>QEMU and later on Up Xtreme board.&nbsp; Apologies for =
stupid</div><div>questions,&nbsp; and please refer me to a more appropriate=
 forum</div><div>if this is the wrong place for them.</div><div><br></div><=
div>First I have built a fresh virtual machine and installed Ubuntu</div><d=
iv>20.04 LTS, then installed linux headers, build tools and python</div><di=
v>through apt.</div><div><br></div><div>The compilation and installing seem=
s to work fine, but when I</div><div>get to the point where I should do</di=
v><div><br></div><div># jailhouse enable jailhouse/configs/qemu-x86.cell</d=
iv><div><br></div><div>I get an error message</div><div><br></div><div>JAIL=
HOUSE_ENABLE: Invalid argument</div><div><br></div><div>I do not know how t=
o get past this, any help?</div><div><br></div><div><br></div><div>Other th=
ings is it seems like the documentation is not entirely</div><div>up to dat=
e, and I noticed things like experimental virtio support</div><div>and IPC =
reworkings in 0.12 release notes, is there any more info</div><div>about th=
ose in the wild or should I just dig through git commits?</div><div><br></d=
iv>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cd0ba433-1be8-4c99-841e-d637d2e5fb54n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cd0ba433-1be8-4c99-841e-d637d2e5fb54n%40googlegroups.co=
m</a>.<br />

------=_Part_157_212725250.1603187796162--

------=_Part_156_150907006.1603187796162--
